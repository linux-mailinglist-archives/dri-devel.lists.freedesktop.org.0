Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C3D159401
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 16:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15376EEA0;
	Tue, 11 Feb 2020 15:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32CB6E03B;
 Tue, 11 Feb 2020 15:55:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncPqd7JDk95aHXOw2kHUiGgMByUVpo8efM71iZAIKcUS30wt765rKbudPE4UDEjwF2ac2u/5gxmzZnpE0Aq21YGa9ITdDZb2W25OaJkkBoZcUJO7WYEc+vvMo8O9lYt7OevHPW+hzYAYzo4Xp63GYDdp81NfcawxGbkETxfnyZ8h2MkPd8QMai/wOWL8RjzbhB7SAtWSfRvjDHv1NiLVnlkzt62HtWJwSB1EZ6fTzrpm1bsWIpyeca4v3NBD0FCcKPOQGBrnP26pdm1YI/G8CQS9uYm4eBUDWWjhuPCrO/yRBvL3ziNUmeHLFIL22zzeNt5Hbqd2I2Tp/kMsHqzX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jY7lJucQI8ZaO9SvAb4L5tjHJfLQreICjb7DL17dxs=;
 b=mgo6O+CRpqtIUnGcHsD/CmwEqQgta+Ld0wcqfEAmv8ma4lZFXqcJFlTy0+I34SJJU1zwsjrzHiMh5lBC/MOMzWEENWyy27fez099Cu/MgTBDxLk11P9rgUuVH6PVnTEDfAKNFSJdmHUW12mim+DnWJKqije3OhtDRsJJ7nJK3Vj0/FgSJzKBFqRGw/AcHALP83RsUU3UDyj2yFucruUvBnjr479OyX70EpNfRmU0eBUjoD0oC3zM5oZTqWaffJ4PkECOyCcRG7UC4Cr/mbYQOVVVv9VVjV6GytafeVs2CAMVE6cbo3Qc5zCWtWqDC791KPIGpsazyu1BP4uY+qyHtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jY7lJucQI8ZaO9SvAb4L5tjHJfLQreICjb7DL17dxs=;
 b=ycHQ47arb+tFhy24kYK/sUv09U0v28WtBSpUDwBu/IgXTtSB38HxIReC9YSLG26+aAytPmIty+Q9p0HzoZACmhlOG6oSXhtE0ic58LlT48QRNnd6BN+6yR32OjK1NLpJ3Q7WBjxi2G9aeoCRqdKUpjU064nhWXKD6OfjVis9b0U=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1502.namprd12.prod.outlook.com (10.172.56.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Tue, 11 Feb 2020 15:55:13 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::610d:b9b1:dbd1:1150]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::610d:b9b1:dbd1:1150%6]) with mapi id 15.20.2707.030; Tue, 11 Feb 2020
 15:55:13 +0000
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
To: Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <0de5ad33ca2ff86fee13a453aa9096c274afbd3c.camel@pengutronix.de>
 <d710aba7c3acc537bfb1c20362f7c8dbee421f02.camel@pengutronix.de>
 <740fb929-e788-075b-87db-e2524ed4b086@gmail.com>
 <CADnq5_Np=OFgqAb4TPRz5yqx1YZSwWybS=F6R_r6r01QRrzADA@mail.gmail.com>
 <61128c11-9e65-bc21-6306-ea4efea18b76@amd.com>
 <90de1234-a103-a695-4ad7-83b1486e15ee@amd.com>
 <02ba868c-e904-3681-c795-59a4e48926d5@amd.com>
 <b1ebac7c-5593-bc87-1f36-ea55503f05d1@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <4b5c56d2-4ce4-3626-623f-d4a8124d76fa@amd.com>
Date: Tue, 11 Feb 2020 10:55:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <b1ebac7c-5593-bc87-1f36-ea55503f05d1@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::31) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
MIME-Version: 1.0
Received: from [172.27.231.243] (165.204.55.251) by
 YTOPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend
 Transport; Tue, 11 Feb 2020 15:55:12 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f274af01-b679-4e0b-36a9-08d7af0ac7e4
X-MS-TrafficTypeDiagnostic: MWHPR12MB1502:|MWHPR12MB1502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1502BF5535FB456D0C537291EA180@MWHPR12MB1502.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0310C78181
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(189003)(199004)(16576012)(6486002)(81156014)(66556008)(52116002)(66476007)(53546011)(54906003)(36756003)(8676002)(81166006)(5660300002)(66946007)(8936002)(4326008)(110136005)(31686004)(31696002)(956004)(2616005)(26005)(16526019)(86362001)(186003)(498600001)(2906002)(966005)(45080400002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1502;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lw4tXEI8kEnjndmMWs1I4bhmtKC9LBnjZhZEwYrFdK6sOiwXrRzBloOvgkzTViS0XJ2hFexu4XE6rSnU1ecfelzUrv41p20KU3py3YqjKZi5OWVS/Twcl/2E8mOmBK3oePxsCbtCSdnaNykn3m+BcBFnY3gylBRnAIqq6zPJnitp+fnhzEweSgSPufp/OI2kHBZdIpQIu+2UpK7FuWdr1W/XMWGz4iRcz7xIQa5SVaItn9B0Wi7e5iOtMkfJAUxEk1wUDj1MmoEjCzmtpF1I42OOpuKYNrZefEVLR3f3pSG5xVx4CNUADTnCp+5VCPuklJ53BgFvPZhVs7wNAoUyT7vib1x4NZ4pZeXKgCdrFRsZ9zbUvWyCMuzyupUMrL+hoALHAfJW54sbaNeN7jXsJLvFNFjaT8MAh0ca0SQryGOqUfl2yDPJTQNmpOOwi9f/mhtVTcy80L2DLwNyc7StdgZ8olr2K0wNcPAV2XXqmHQMKShUJYRKQFsNSZIq7DckVaeb/7cPLrX23BQppuje0A==
X-MS-Exchange-AntiSpam-MessageData: 5Q4374hwCzZIxODAUiZvxPwknh4bDvd89mehQVcmICk70u/ji4RPsinEQcGsycpn2GIz4mgHkPua25rNcLfEaH1jSOjNBBzU5u1VtnhnlSpQEzYcBzaB97aLHIbwTGGJWCCZ9X6dIwQt0Rk57Ac6aQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f274af01-b679-4e0b-36a9-08d7af0ac7e4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2020 15:55:13.6259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24qaQYAcU0vYCSz8y1U2CkoZZmtPYZdX2APxsX1aMKTusDZfWXVzU7DQIfSUp9i93ChN3rzyRLdbLin4BTmEUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1502
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Emily Deng <Emily.Deng@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, steven.price@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMi8xMC8yMCA0OjUwIFBNLCBMdWJlbiBUdWlrb3Ygd3JvdGU6Cj4gSGkgTHVjYXMsCj4KPiBU
aGFuayB5b3UgZm9yIGJyaW5naW5nIGF3YXJlbmVzcyBvZiB0aGlzIGlzc3VlLCBwdWJsaWNseS4K
Pgo+IEFzIHNvb24gYXMgdGhpcyBwYXRjaCBzaG93ZWQgdXAgYmFjayBpbiBOb3ZlbWJlciBvZiAy
MDE5LAo+IEkgb2JqZWN0ZWQgdG8gaXQsIHByaXZhdGVseS4KCgpJIGRpZG4ndCBmaW5kIHRoaXMg
b2JqZWN0aW9uIGluIG15IG1haWwgYWN0dWFsbHkKCgo+Cj4gSSBzdWdnZXN0ZWQgdG8gaW5zdGVh
ZCB1c2UgYSBfbGlzdF8gdG8gc3RvcmUgdGhlICJzdGF0ZSIgb2YKPiBhbGwgam9icyBvZiB0aGUg
c2FtZSBzdGF0ZS4gVGhlbiwgYXQgYW55IHRpbWUsIHRpbWVvdXQgaW50ZXJydXB0Cj4gb3Igd2hh
dGV2ZXIsIHdlIGNhbiBhdG9taWNhbGx5IChpcnEgc3BpbmxvY2spIG1vdmUgdGhlIHRpbWVvdXQv
YmFkCj4gam9iIHRvIHRoZSB0aW1lZG91dC9jbGVhbnVwL2JhZCBqb2IgbGlzdCwgYW5kIHdha2Ug
c29tZW9uZSB1cAo+IHRvIGRlYWwgd2l0aCB0aGF0IGxpc3QgYXN5bmNocm9ub3VzbHksIGFuZCBy
ZXR1cm4gZnJvbSB0aGUgaW50ZXJydXB0L2V0Yy4KPiBpbW1lZGlhdGVseS4KCgpTb3VuZHMgYSBn
b29kIGlkZWEgdG8gbWUsIGkgdGhpbmsgZW5vdWdoIGZvciB1cyB0byBoYXZlIDIgbGlzdHMsIHRp
bWVvdXQgCmxpc3QgZm9yIGpvYnMgc2NoZWR1bGVkIHRvIEhXIGFuZCBub3QgeWV0IGNvbXBsZXRl
ZCAoY29tcGxldGlvbiBmZW5jZSAKc2lnbmFsZWQpIGFuZCBjbGVhbnVwIGxpc3QgZm9yIHRob3Nl
IHRoYXQgZGlkIGNvbXBsZXRlLiBUaGlzIHNob3VsZCBnaXZlIAphbHRlcm5hdGl2ZSBzb2x1dGlv
biB0byB0aGUgcmFjZSBjb25kaXRpb24gdGhpcyBwYXRjaCB3YXMgYWRkcmVzc2luZyAKd2l0aG91
dCBjYXVzaW5nIHRoZSBicmVhayB0aGUgTHVjYXMgcmVwb3J0ZWQuIElmIG5vIG9uZSBvYmplY3Rz
IEkgdGhpbmsgCmkgY2FuIHRyeSBpbXBsZW1lbnQgaXQuCgpBbmRyZXkKCgo+Cj4gVGhlbiBpbiBk
dWUgdGltZSwgaWYgYW55IG1vcmUgaW50ZXJydXB0cyBvciB3aGF0bm90IHRha2UgcGxhY2UsCj4g
dGhlIGpvYiB3aWxsIGVpdGhlciBiZSBpbiB0aGUgdGltZW91dCBsaXN0IG9yIG5vdC4gSWYgaXQg
aXQsCj4gdGhlbiB0aGUgaW5zdGlnYXRvciBiYWNrcyBvZmYgYXMgc29tZW9uZSBlbHNlICh0aGUg
bGlzdCBoYW5kbGVyKSB3aWxsL2lzCj4gYXdha2UgYW5kIGhhbmRsaW5nIGl0IChvYnZpb3VzbHkg
YSBzdGF0ZSB2YXJpYWJsZSBtYXkgYmUga2VwdCBhcyB3ZWxsKS4KPgo+IFRoaXMgZHJhd3Mgc29t
ZXdoYXQgZnJvbSBteSBkYXlzIHdpdGggaVNDU0ksIFNDU0kgYW5kIFNBUywgMTUgeWVhcnMgYWdv
LAo+IHdoZXJlIGEgZGV2aWNlIGNhbiBjb21wbGV0ZSBhIGpvYiAodGFzaykgYXQgYW55dGltZSBy
ZWdhcmRsZXNzCj4gb2Ygd2hhdCB0aGUgU0NTSSBsYXllciAidGhpbmtzIiB0aGUgdGFzaydzIHN0
YXRlIGlzOiB0aW1lZC1vdXQsIGFib3J0ZWQsCj4gd2hhdGV2ZXIuIEl0IGlzIGEgdmVyeSBzaW1w
bGUgYW5kIGVsZWdhbnQgc29sdXRpb24gd2hpY2ggZ2VuZXJhbGl6ZXMKPiB3ZWxsLgo+Cj4gUmVn
YXJkcywKPiBMdWJlbgo+Cj4gT24gMjAyMC0wMi0xMCAxMTo1NSBhLm0uLCBBbmRyZXkgR3JvZHpv
dnNreSB3cm90ZToKPj4gTHVjYXMgLSBQaW5nIG9uIG15IHF1ZXN0aW9uIGFuZCBhbHNvIEkgYXR0
YWNoZWQgdGhpcyB0ZW1wb3Jhcnkgc29sdXRpb24gZm9yIGV0bmF2aXYgdG8gY2xhcmlmeSBteSBw
b2ludC4gSWYgdGhhdCBzb21ldGhpbmcgYWNjZXB0YWJsZSBmb3Igbm93IGF0IGxlYXN0IGkgY2Fu
IGRvIHRoZSBzYW1lIGZvciB2M2Qgd2hlcmUgaXQgcmVxdWlyZXMgYSBiaXQgbW9yZSBjb2RlIGNo
YW5nZXMuCj4+Cj4+IEFuZHJleQo+Pgo+PiBPbiAyLzYvMjAgMTA6NDkgQU0sIEFuZHJleSBHcm9k
em92c2t5IHdyb3RlOgo+Pj4+IFdlbGwgYSByZXZlcnQgd291bGQgYnJlYWsgb3VyIGRyaXZlci4K
Pj4+Pgo+Pj4+IFRoZSByZWFsIHNvbHV0aW9uIGlzIHRoYXQgc29tZWJvZHkgbmVlZHMgdG8gc2l0
IGRvd24sIGdhdGhlciBBTEwgdGhlIHJlcXVpcmVtZW50cyBhbmQgdGhlbiBjb21lIHVwIHdpdGgg
YSBzb2x1dGlvbiB3aGljaCBpcyBjbGVhbiBhbmQgd29ya3MgZm9yIGV2ZXJ5b25lLgo+Pj4+Cj4+
Pj4gQ2hyaXN0aWFuLgo+Pj4KPj4+IEkgY2FuIHRvIHRha2Ugb24gdGhpcyBhcyBpbmRlZWQgb3Vy
IGdlbmVyYWwgZGVzaWduIG9uIHRoaXMgYmVjb21lcyBtb3JlIGFuZCBtb3JlIGVudGFuZ2xlZCBh
cyBHUFUgcmVzZXQgc2NlbmFyaW9zIGdyb3cgaW4gY29tcGxleGl0eSAoYXQgbGVhc3QgaW4gQU1E
IGRyaXZlcikuIEN1cnJlbnRseSBJIGFtIG9uIGEgaGlnaCBwcmlvcml0eSBpbnRlcm5hbCB0YXNr
IHdoaWNoIHNob3VsZCB0YWtlIG1lIGFyb3VuZCBhIHdlZWsgb3IgMiB0byBmaW5pc2ggYW5kIGFm
dGVyIHRoYXQgSSBjYW4gZ2V0IHRvIGl0Lgo+Pj4KPj4+IFJlZ2FyZGluZyB0ZW1wb3Jhcnkgc29s
dXRpb27CoCAtIEkgbG9va2VkIGludG8gdjNkIGFuZCBldG5hdml2IHVzZSBjYXNlcyBhbmQgd2Ug
aW4gQU1EIGFjdHVhbGx5IGZhY2UgdGhlIHNhbWUgc2NlbmFyaW8gd2hlcmUgd2UgZGVjaWRlIHRv
IHNraXAgSFcgcmVzZXQgaWYgdGhlIGd1aWx0eSBqb2IgZGlkIGZpbmlzaCBieSB0aGUgdGltZSB3
ZSBhcmUgcHJvY2Vzc2luZyB0aGUgdGltZW91dMKgIChzZWUgYW1kZ3B1X2RldmljZV9ncHVfcmVj
b3ZlciBhbmQgc2tpcF9od19yZXNldCBnb3RvKSAtIHRoZSBkaWZmZXJlbmNlIGlzIHdlIGFsd2F5
cyBjYWxsIGRybV9zY2hlZF9zdG9wL3N0YXJ0IGlycmVzcGVjdGl2ZWx5IG9mIHdoZXRoZXIgd2Ug
YXJlIGdvaW5nIHRvIGFjdHVhbGx5IEhXIHJlc2V0IG9yIG5vdCAoc2FtZSBhcyBleHRlbmQgdGlt
ZW91dCkuIEkgd29uZGVyIGlmIHNvbWV0aGluZyBsaWtlIHRoaXMgY2FuIGJlIGRvbmUgYWxzbyBm
b3IgdmUzIGFuZCBldG5hdml2ID8KPj4+Cj4+PiBBbmRyZXkKPj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4g
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0
b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wMiU3QzAxJTdD
bHViZW4udHVpa292JTQwYW1kLmNvbSU3Q2NlOTdiYzI5OTg4ZTQwNjhlZjgxMDhkN2FlNGEwNDNk
JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzE2OTUwNTI3
NzM4MTMyNyZhbXA7c2RhdGE9RnlWMHEzeTV1V1B3QmdKRjVRWkxXQVJjWGF1OTE2RVVjWWV6MlZB
JTJGcVJBJTNEJmFtcDtyZXNlcnZlZD0wCj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
