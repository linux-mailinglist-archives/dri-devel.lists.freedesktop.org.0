Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3116159E62
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 01:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055186E50C;
	Wed, 12 Feb 2020 00:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690058.outbound.protection.outlook.com [40.107.69.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BE76E509;
 Wed, 12 Feb 2020 00:53:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2i7zEndGkqs9zbkw+x9wUl7OnRkYZGWoe3zzJqhNaDx01nyCVD5foGQi9zj4YyX+FEyh81e3ZtmS7Ysnl3WqjHiv/PJwRoa2uDS9o2P3O2gQk8RqcmS3ReWAgQoffg5kXGsmcCz4u3Z0tXvLYvjy36+wUK32r356qvimstJcDMmZftB9ABK6CDSyfO/mCeZShiExWsDkRLU5/7ittlp/caLewQeP3nDQCAWSapetXmcoQL+OR9m68q4Pl/p8WsIzJaBztBtmWAhZY5Kr7xJpol2bXS68waifmbAyYVbl8CcldlLR9kd7B3y0Bga91Rm2/zEOYXm0kajFvNMjDlxvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmgJYozosGZVffxAhZUInzjoBKW7upqXK7sWnpSHIkI=;
 b=OoCRQ+tiNpYzI7iBdxcnSSGqJR0ERkSvfjenNkuVxClgZUiKY5qgcrYepp3Qo8P4v6s+j6Hoa5DESn1ellJktZ0CioFqvE1wSTu/lTT1Iu0JBHgwMSNqeQuQIEmMZflGiojjzXm5s8UQ6Nw9WeAbh3Eau8vxEloqXDYrAXYgccmzPfUM0JfWFOIk9e4Q9MptDZ/Hxyo5TW3/MrtkJWhaDDKLfQDQh2MuebU+DvCqJD2iRWO8F70MXTVB3NHUq5frIieHaURbNmLRcr58e6GzqvbuK6ZmX/0yz+XE5llQOG5nFpAIzpHH8csxCNwRC1u4jPRFKn8SAL3Vc+fy0KY8PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmgJYozosGZVffxAhZUInzjoBKW7upqXK7sWnpSHIkI=;
 b=qJeEGj2C0NouSo2UJYgUdYAOv5M4UbOmDKtwVQYzu1SjRpLCIlBkpP5f3vb6amz1prlj3SlOyeq0+1EggBbr0jt/deoRXjClZQ5l3Z7RY2rJJIdwfhpx60LuD7HJtR9mZVdT0hu6AJ9LnPFSKUDjB3NMJVyoNMJT33yP+NdZRRg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
Received: from DM6PR12MB3355.namprd12.prod.outlook.com (20.178.29.90) by
 DM6PR12MB4107.namprd12.prod.outlook.com (10.141.186.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.24; Wed, 12 Feb 2020 00:53:52 +0000
Received: from DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::799b:b372:6589:c8a]) by DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::799b:b372:6589:c8a%7]) with mapi id 15.20.2707.030; Wed, 12 Feb 2020
 00:53:51 +0000
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
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
 <4b5c56d2-4ce4-3626-623f-d4a8124d76fa@amd.com>
 <d4ba6ed9-604e-5e88-f427-679639dcf8e9@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <dbb2e7f0-85b7-f9e0-7875-144a8cca4993@amd.com>
Date: Tue, 11 Feb 2020 19:53:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <d4ba6ed9-604e-5e88-f427-679639dcf8e9@amd.com>
Content-Language: en-CA
X-ClientProxiedBy: YTXPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::23) To DM6PR12MB3355.namprd12.prod.outlook.com
 (2603:10b6:5:115::26)
MIME-Version: 1.0
Received: from localhost.localdomain (165.204.55.250) by
 YTXPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22 via Frontend Transport; Wed, 12 Feb 2020 00:53:51 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c42c12eb-4b8f-4021-63cb-08d7af560701
X-MS-TrafficTypeDiagnostic: DM6PR12MB4107:|DM6PR12MB4107:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4107BF59F3410DD93371D996991B0@DM6PR12MB4107.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0311124FA9
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(189003)(199004)(5660300002)(2906002)(86362001)(6512007)(31696002)(4326008)(52116002)(966005)(6486002)(36756003)(478600001)(31686004)(45080400002)(8676002)(53546011)(6506007)(186003)(2616005)(81156014)(66946007)(956004)(81166006)(66556008)(66476007)(8936002)(54906003)(110136005)(26005)(16526019)(44832011)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4107;
 H:DM6PR12MB3355.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qDPMffUbNaxycrnZ5eFoJ4u98bzvy1FfibptXXz4pHRFN72DGH/TABdcCoVGaWg1KT+zSmf6qYmdyHLXjLgSqAUkAtpJpV/d9BMHomQdg4iEhwtTUaekuTu2iRNJXKS+oyImUx+6PB7/2nut5njF3iHkyxQTpzZLSy/V5ANmaHibJMYESXGr9rW2ebU16kGexCxDmfJFAY7LAgUWLkLfn4ca1rCCpw79z5HOmZ1apEUnz2eFeMONYAQ0UwcYen46Fz8WxB25IFrZFeHJIBwCytSNERuYW/hDledzbvkJed0puBDuDEA26WKY5f5j5U111cIwThV4a5xxyW7xd7dXUz96y49AK5lUDg0HfhXG6lCZrQyCQfMrOFgXtEX+AU1IuIcSZh6uVly36nXnyzrr16aKjPECownwCLneYcof/7552iTvDyhwKX6Pq5cg3evYFfAW597qsENVNhKIZUFjocmYHpovF8Y6Xj5qXk1KvVlXNkAzttn6CexReuWS+W5DwJ4Fm76bmrcOxTLj7FkGEQ==
X-MS-Exchange-AntiSpam-MessageData: Buy1hVcqZIBiIAGqyc8us7DLe4fFpqatkhVok/D32aSj7dtg2HMzgo9Qsce2PsCsPbnXoEJI6x4CAqex3Jtnq7aqLLphA/4ipgdErwhNei/7uH4J/tur9SGrj5qVZWXxfs3jqfm434djMpd0kgvnsg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c42c12eb-4b8f-4021-63cb-08d7af560701
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2020 00:53:51.7563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXgfJ/R18vEKsEwFXlEkn9LbN4i5JHV2GeQDO4E4ElOryvM6emnd9I5R0m4/AYRp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4107
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 steven.price@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wMi0xMSA0OjI3IHAubS4sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+IAo+IE9u
IDIvMTEvMjAgMTA6NTUgQU0sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+PiBPbiAyLzEwLzIw
IDQ6NTAgUE0sIEx1YmVuIFR1aWtvdiB3cm90ZToKPj4+IEhpIEx1Y2FzLAo+Pj4KPj4+IFRoYW5r
IHlvdSBmb3IgYnJpbmdpbmcgYXdhcmVuZXNzIG9mIHRoaXMgaXNzdWUsIHB1YmxpY2x5Lgo+Pj4K
Pj4+IEFzIHNvb24gYXMgdGhpcyBwYXRjaCBzaG93ZWQgdXAgYmFjayBpbiBOb3ZlbWJlciBvZiAy
MDE5LAo+Pj4gSSBvYmplY3RlZCB0byBpdCwgcHJpdmF0ZWx5Lgo+Pgo+Pgo+PiBJIGRpZG4ndCBm
aW5kIHRoaXMgb2JqZWN0aW9uIGluIG15IG1haWwgYWN0dWFsbHkKClllcywgSSBkaWRuJ3Qgc2Vu
ZCBpdCB0byB5b3UuCgo+Pj4gSSBzdWdnZXN0ZWQgdG8gaW5zdGVhZCB1c2UgYSBfbGlzdF8gdG8g
c3RvcmUgdGhlICJzdGF0ZSIgb2YKPj4+IGFsbCBqb2JzIG9mIHRoZSBzYW1lIHN0YXRlLiBUaGVu
LCBhdCBhbnkgdGltZSwgdGltZW91dCBpbnRlcnJ1cHQKPj4+IG9yIHdoYXRldmVyLCB3ZSBjYW4g
YXRvbWljYWxseSAoaXJxIHNwaW5sb2NrKSBtb3ZlIHRoZSB0aW1lb3V0L2JhZAo+Pj4gam9iIHRv
IHRoZSB0aW1lZG91dC9jbGVhbnVwL2JhZCBqb2IgbGlzdCwgYW5kIHdha2Ugc29tZW9uZSB1cAo+
Pj4gdG8gZGVhbCB3aXRoIHRoYXQgbGlzdCBhc3luY2hyb25vdXNseSwgYW5kIHJldHVybiBmcm9t
IHRoZSAKPj4+IGludGVycnVwdC9ldGMuCj4+PiBpbW1lZGlhdGVseS4KPj4KPj4KPj4gU291bmRz
IGEgZ29vZCBpZGVhIHRvIG1lLCBpIHRoaW5rIGVub3VnaCBmb3IgdXMgdG8gaGF2ZSAyIGxpc3Rz
LCAKPj4gdGltZW91dCBsaXN0IGZvciBqb2JzIHNjaGVkdWxlZCB0byBIVyBhbmQgbm90IHlldCBj
b21wbGV0ZWQgCj4+IChjb21wbGV0aW9uIGZlbmNlIHNpZ25hbGVkKSBhbmQgY2xlYW51cCBsaXN0
IGZvciB0aG9zZSB0aGF0IGRpZCAKPj4gY29tcGxldGUuIFRoaXMgc2hvdWxkIGdpdmUgYWx0ZXJu
YXRpdmUgc29sdXRpb24gdG8gdGhlIHJhY2UgY29uZGl0aW9uIAo+PiB0aGlzIHBhdGNoIHdhcyBh
ZGRyZXNzaW5nIHdpdGhvdXQgY2F1c2luZyB0aGUgYnJlYWsgdGhlIEx1Y2FzIAo+PiByZXBvcnRl
ZC4gSWYgbm8gb25lIG9iamVjdHMgSSB0aGluayBpIGNhbiB0cnkgaW1wbGVtZW50IGl0Lgo+Pgo+
PiBBbmRyZXkKPiAKPiAKPiBUaGlua2luZyBtb3JlIGkgcmVhbGl6ZSBMdWJlbiBpcyByaWdodCBh
Ym91dCBoYXZpbmcgYWxzbyBiYWQgam9iIGxpc3QgYXMgCj4gdGhpcyBpcyBuZWVkZWQgZm9yIG5v
cm1hbCBqb2IgY29tcGV0aXRpb24gKGJ5IGZlbmNlIGNhbGxiYWNrIGZyb20gCj4gYW1kZ3B1X2Zl
bmNlX3Byb2Nlc3MpwqAgYW5kIHlvdSBuZWVkIHRvIGRlY2lkZSBpZiB5b3UgbW92ZSBpdCB0byBj
bGVhbnVwIAo+IGxpc3QgZnJvbSB0aW1lb3V0IGxpc3Qgb3Igbm90LiBJZiBpdCdzIGFscmVhZHkg
aW4gYmFkIGpvYiBsaXN0IC0gbWVhbmluZyAKPiB0aGF0IGl0J3MgYmVpbmcgcHJvY2Vzc2VkIGJ5
IEdQVSByZWNvdmVyeSBjb2RlIHlvdSBkb24ndCB0b3VjaCBpdCwgCj4gb3RoZXJ3aXNlIHlvdSBt
b3ZlIGl0IHRvIGNsZWFudXAgbGlzdCB3aGVyZSBpdCB3aWxsIGJlIGZyZWVkIGV2ZW50dWFsbHkg
Cj4gYnkgaW52b2NhdGlvbiBvZiBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iLgoKWWVwLi4uCgpQ
ZXJoYXBzIGZld2VyIGxpc3RzLCB0aGFuICJ0aW1lb3V0IiwgImJhZCIgYW5kICJjbGVhbnVwIiBj
b3VsZCBiZSBoYWQuCkknZCBhbHNvIG5hbWUgdGhlICJiYWQiIGxpc3QgYXMgInJlY292ZXJ5IiBs
aXN0LCBhcyB0aGF0IGlzIHdoYXQgd291bGQKYmUgZG9uZSB0byBjb21tYW5kcyBvbiB0aGF0IGxp
c3QuCgoiVGltZW91dCIgaXMgYSBzdGF0dXMgInRpbWVkLW91dCIsIHNvIHBlcmhhcHMganVzdCBz
ZXQgdGhlIHRpbWVvdXQKZmxhZyBhbmQgbW92ZSBpdCB0byBhICJkb25lIiBsaXN0LiAoTm90ZSB0
aGF0IHRoZSBjb21tYW5kIGNhbiBzdGlsbApjb21wbGV0ZSBhc3luY2hyb25vdXNseSB3aGlsZSBv
biB0aGF0IGxpc3QgYW5kIHdoaWxlIGl0IGhhcyBzdGF0dXMKInRpbWVkLW91dCcuKQoKVGhlIGlk
ZWEgaXMgdGhhdCwKMSkgaXQgYXZvaWQgY29udGVudGlvbiBhbmQgcmFjZXMgd2hlbiBtb3JlIHRo
YW4gb25lIGNvbnRleHQKICAgY2FuIHVwZGF0ZSB0aGUgam9iIGF0IHRoZSBzYW1lIHRpbWUsIGFu
ZAoyKSBlYXN5IHRvIHByb2Nlc3MgYWxsIGpvYnMgb2YgYSBjZXJ0YWluIHN0YXRlIGFuZC9vcgog
ICBtb3ZlIHRoZW0gYXJvdW5kLCBldGMuCgpMZXQncyBkaXNjdXNzIGl0IGFuZCBjb21lIHVwIHdp
dGggYSBwbGFuLiA6LSkKClJlZ2FyZHMsCkx1YmVuCgoKCgo+IAo+IEFuZHJleQo+IAo+IAo+Pgo+
Pgo+Pj4KPj4+IFRoZW4gaW4gZHVlIHRpbWUsIGlmIGFueSBtb3JlIGludGVycnVwdHMgb3Igd2hh
dG5vdCB0YWtlIHBsYWNlLAo+Pj4gdGhlIGpvYiB3aWxsIGVpdGhlciBiZSBpbiB0aGUgdGltZW91
dCBsaXN0IG9yIG5vdC4gSWYgaXQgaXQsCj4+PiB0aGVuIHRoZSBpbnN0aWdhdG9yIGJhY2tzIG9m
ZiBhcyBzb21lb25lIGVsc2UgKHRoZSBsaXN0IGhhbmRsZXIpIHdpbGwvaXMKPj4+IGF3YWtlIGFu
ZCBoYW5kbGluZyBpdCAob2J2aW91c2x5IGEgc3RhdGUgdmFyaWFibGUgbWF5IGJlIGtlcHQgYXMg
d2VsbCkuCj4+Pgo+Pj4gVGhpcyBkcmF3cyBzb21ld2hhdCBmcm9tIG15IGRheXMgd2l0aCBpU0NT
SSwgU0NTSSBhbmQgU0FTLCAxNSB5ZWFycyBhZ28sCj4+PiB3aGVyZSBhIGRldmljZSBjYW4gY29t
cGxldGUgYSBqb2IgKHRhc2spIGF0IGFueXRpbWUgcmVnYXJkbGVzcwo+Pj4gb2Ygd2hhdCB0aGUg
U0NTSSBsYXllciAidGhpbmtzIiB0aGUgdGFzaydzIHN0YXRlIGlzOiB0aW1lZC1vdXQsIGFib3J0
ZWQsCj4+PiB3aGF0ZXZlci4gSXQgaXMgYSB2ZXJ5IHNpbXBsZSBhbmQgZWxlZ2FudCBzb2x1dGlv
biB3aGljaCBnZW5lcmFsaXplcwo+Pj4gd2VsbC4KPj4+Cj4+PiBSZWdhcmRzLAo+Pj4gTHViZW4K
Pj4+Cj4+PiBPbiAyMDIwLTAyLTEwIDExOjU1IGEubS4sIEFuZHJleSBHcm9kem92c2t5IHdyb3Rl
Ogo+Pj4+IEx1Y2FzIC0gUGluZyBvbiBteSBxdWVzdGlvbiBhbmQgYWxzbyBJIGF0dGFjaGVkIHRo
aXMgdGVtcG9yYXJ5IAo+Pj4+IHNvbHV0aW9uIGZvciBldG5hdml2IHRvIGNsYXJpZnkgbXkgcG9p
bnQuIElmIHRoYXQgc29tZXRoaW5nIAo+Pj4+IGFjY2VwdGFibGUgZm9yIG5vdyBhdCBsZWFzdCBp
IGNhbiBkbyB0aGUgc2FtZSBmb3IgdjNkIHdoZXJlIGl0IAo+Pj4+IHJlcXVpcmVzIGEgYml0IG1v
cmUgY29kZSBjaGFuZ2VzLgo+Pj4+Cj4+Pj4gQW5kcmV5Cj4+Pj4KPj4+PiBPbiAyLzYvMjAgMTA6
NDkgQU0sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+Pj4gV2VsbCBhIHJldmVydCB3b3Vs
ZCBicmVhayBvdXIgZHJpdmVyLgo+Pj4+Pj4KPj4+Pj4+IFRoZSByZWFsIHNvbHV0aW9uIGlzIHRo
YXQgc29tZWJvZHkgbmVlZHMgdG8gc2l0IGRvd24sIGdhdGhlciBBTEwgCj4+Pj4+PiB0aGUgcmVx
dWlyZW1lbnRzIGFuZCB0aGVuIGNvbWUgdXAgd2l0aCBhIHNvbHV0aW9uIHdoaWNoIGlzIGNsZWFu
IAo+Pj4+Pj4gYW5kIHdvcmtzIGZvciBldmVyeW9uZS4KPj4+Pj4+Cj4+Pj4+PiBDaHJpc3RpYW4u
Cj4+Pj4+Cj4+Pj4+IEkgY2FuIHRvIHRha2Ugb24gdGhpcyBhcyBpbmRlZWQgb3VyIGdlbmVyYWwg
ZGVzaWduIG9uIHRoaXMgYmVjb21lcyAKPj4+Pj4gbW9yZSBhbmQgbW9yZSBlbnRhbmdsZWQgYXMg
R1BVIHJlc2V0IHNjZW5hcmlvcyBncm93IGluIGNvbXBsZXhpdHkgCj4+Pj4+IChhdCBsZWFzdCBp
biBBTUQgZHJpdmVyKS4gQ3VycmVudGx5IEkgYW0gb24gYSBoaWdoIHByaW9yaXR5IAo+Pj4+PiBp
bnRlcm5hbCB0YXNrIHdoaWNoIHNob3VsZCB0YWtlIG1lIGFyb3VuZCBhIHdlZWsgb3IgMiB0byBm
aW5pc2ggYW5kIAo+Pj4+PiBhZnRlciB0aGF0IEkgY2FuIGdldCB0byBpdC4KPj4+Pj4KPj4+Pj4g
UmVnYXJkaW5nIHRlbXBvcmFyeSBzb2x1dGlvbsKgIC0gSSBsb29rZWQgaW50byB2M2QgYW5kIGV0
bmF2aXYgdXNlIAo+Pj4+PiBjYXNlcyBhbmQgd2UgaW4gQU1EIGFjdHVhbGx5IGZhY2UgdGhlIHNh
bWUgc2NlbmFyaW8gd2hlcmUgd2UgZGVjaWRlIAo+Pj4+PiB0byBza2lwIEhXIHJlc2V0IGlmIHRo
ZSBndWlsdHkgam9iIGRpZCBmaW5pc2ggYnkgdGhlIHRpbWUgd2UgYXJlIAo+Pj4+PiBwcm9jZXNz
aW5nIHRoZSB0aW1lb3V0wqAgKHNlZSBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyIGFuZCAKPj4+
Pj4gc2tpcF9od19yZXNldCBnb3RvKSAtIHRoZSBkaWZmZXJlbmNlIGlzIHdlIGFsd2F5cyBjYWxs
IAo+Pj4+PiBkcm1fc2NoZWRfc3RvcC9zdGFydCBpcnJlc3BlY3RpdmVseSBvZiB3aGV0aGVyIHdl
IGFyZSBnb2luZyB0byAKPj4+Pj4gYWN0dWFsbHkgSFcgcmVzZXQgb3Igbm90IChzYW1lIGFzIGV4
dGVuZCB0aW1lb3V0KS4gSSB3b25kZXIgaWYgCj4+Pj4+IHNvbWV0aGluZyBsaWtlIHRoaXMgY2Fu
IGJlIGRvbmUgYWxzbyBmb3IgdmUzIGFuZCBldG5hdml2ID8KPj4+Pj4KPj4+Pj4gQW5kcmV5Cj4+
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdAo+Pj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+
Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJG
YW1kLWdmeCZhbXA7ZGF0YT0wMiU3QzAxJTdDYW5kcmV5Lmdyb2R6b3Zza3klNDBhbWQuY29tJTdD
ZWY5NjYxN2QyM2E1NGZlOWI2ZWYwOGQ3YWYwYWM5ZGIlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4
MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MTcwMzMzMjAwNjIxNTUwJmFtcDtzZGF0YT13YTdFaDNi
ZGklMkJ0aFlqalpGMnllVHZUak5SaXBHUHFWQSUyRkdRdDBRTDdSOCUzRCZhbXA7cmVzZXJ2ZWQ9
MCAKPj4+Pgo+Pj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0
aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDIlN0MwMSU3Q2FuZHJleS5ncm9kem92c2t5JTQwYW1k
LmNvbSU3Q2VmOTY2MTdkMjNhNTRmZTliNmVmMDhkN2FmMGFjOWRiJTdDM2RkODk2MWZlNDg4NGU2
MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzE3MDMzMzIwMDYyMTU1MCZhbXA7c2RhdGE9
d2E3RWgzYmRpJTJCdGhZampaRjJ5ZVR2VGpOUmlwR1BxVkElMkZHUXQwUUw3UjglM0QmYW1wO3Jl
c2VydmVkPTAgCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
