Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C026D15AD74
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 17:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B400C6E090;
	Wed, 12 Feb 2020 16:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE73B6E090;
 Wed, 12 Feb 2020 16:34:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GoSpzrg1XoqAe1nVJ0jUeBITTVrTQinU+wTTm0wxJmykzIVeRHuKHQga8vpYzmZKwOLG1RcPH7DykfX+jQL2W3d1mEoMnDPCeZgmSFm7q/Hine+FiyK2hYRD+XlUFpyzwvmwnontzEE34z7vaGyR3KCAFmcntaxMUngOdVkBs7YDHG14O/9rpi547KBh/ft0yocvwV23NApSZSq0f8EtHIO2QcNIUnUj0oiu0VZMZ7j7yCrKkTxyDonwFL6Po1vxFTCB1fz0MsHfrqaBokE/kF/PYMGI3e/8PocOqBCO9kqhe58i6xNbnJV6KDuZ+MJ7fpByQ8+mABaPe0TkluS6YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KYCw2TilWE7hQH/rp8FLSG6ERmookZMZ97Tnhupva4=;
 b=EwRwmZEoN357uVusWteJILzvIuBroQBLQs24jhWzTb6D08aXK+V6aW7uz0e7wSsx4MHGAXm+ffwVD0+vCvE36vJQnW4exveDE90m49KCp4VLJGDvwPcS/nguErjl7H14LCpzoQ00z7CMos8PnZTL2znkSXQO182e4kKbThCxY0pr8QWgyd5jIz6gn/8V7e3fowd+j4fRA/IM2OehnbY+FtPA8yLpTTEAiR8IkLSf6/I8UBXnWuGuoE7n4wyPaQld4yZd7b3/t9y9x10k4Fz/k2h6u1uBZAExx2k+z1Mtcwsec/LGUS4a224KToSE4c2Il+/avXLn+m2GU7ZxYVOuHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KYCw2TilWE7hQH/rp8FLSG6ERmookZMZ97Tnhupva4=;
 b=tu76QmH7DmnCVT+OwaHgt0obS5OD8kwjqAFMYjN95+90o8IPpR1T0l4SISZLhGBPnOw5Zxn6VZ5HbY7gZd7yPV1jd8FhcCxmt88DT6YeMBeNV88XB+/O0ND9WJFSL1h/yehe2fVrFt/q+POByJ0ZyTg3USxwf/gCMKN+V9MfEVE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1487.namprd12.prod.outlook.com (10.172.49.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.23; Wed, 12 Feb 2020 16:34:01 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::610d:b9b1:dbd1:1150]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::610d:b9b1:dbd1:1150%6]) with mapi id 15.20.2729.021; Wed, 12 Feb 2020
 16:34:00 +0000
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
 <4b5c56d2-4ce4-3626-623f-d4a8124d76fa@amd.com>
 <d4ba6ed9-604e-5e88-f427-679639dcf8e9@amd.com>
 <dbb2e7f0-85b7-f9e0-7875-144a8cca4993@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <2cef1ca3-115c-44ee-9caf-6cb8d6404796@amd.com>
Date: Wed, 12 Feb 2020 11:33:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <dbb2e7f0-85b7-f9e0-7875-144a8cca4993@amd.com>
Content-Language: en-US
X-ClientProxiedBy: BN8PR04CA0050.namprd04.prod.outlook.com
 (2603:10b6:408:d4::24) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:fc00:58a6:e9e5:1a9b:2c2a]
 (2607:fea8:3edf:fc00:58a6:e9e5:1a9b:2c2a) by
 BN8PR04CA0050.namprd04.prod.outlook.com (2603:10b6:408:d4::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.24 via Frontend Transport; Wed, 12 Feb 2020 16:33:58 +0000
X-Originating-IP: [2607:fea8:3edf:fc00:58a6:e9e5:1a9b:2c2a]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 43d3dab4-322f-41e3-856a-08d7afd95d0b
X-MS-TrafficTypeDiagnostic: MWHPR12MB1487:|MWHPR12MB1487:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB148701ECE63645E059248B5BEA1B0@MWHPR12MB1487.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0311124FA9
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(199004)(189003)(86362001)(31686004)(31696002)(8676002)(81156014)(8936002)(81166006)(2616005)(2906002)(16526019)(186003)(53546011)(66476007)(66556008)(66946007)(6486002)(966005)(4326008)(52116002)(316002)(110136005)(54906003)(478600001)(45080400002)(5660300002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1487;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OtRxVa5RHLOCKqVG9N3ZMb+cm6j/yb86WARVJbYY4jy63Ex9YxseChO0Zb8BlJ2FqXziarXdERnP6X5gKaq6ZORyPUmD3VivUBRR0uSQ7QdquJNarE3rSlXKTWebEPROSO6uixh2zAVu9fqHA3DfUhht8CsDay1hL9LcS89TMDzncWwqCplWlL6wD2XTI6AGrdeGCMQwvHCXsZV29Q5l1PYsmR/50XKBv4+1w2LkD0B4j5SIQGRHOTDfqlXmCfCugB7vlYfdNLr1P9iIK5caOar51rkywn+BeCFeixHJZEmi1RdlWMNyW9z3YJp5sqBHl1FuNlEI4yjwFFzTVQR55A5V1hWDkwmMQMOZCV3V5lj2gVrQa/exHOsC9yUl4YgFC8oFBnx/gAVYS6eMPGm2aBBLZEHsDaV1HEZwCWVhIEdON0Cz0BX47fv9psB+kv9dsysqY7frf5s8RTi48etiGJ/4kD6Y7MfxMmWjIaXQW5pfzqJmryJQP5Ln18UlyXqae17Gmfg8kH5USHqQPiWgBw==
X-MS-Exchange-AntiSpam-MessageData: 3zvEcvv9WAMFG0T1P2ilc2haoot/kpB5ImwLuDfhbNFqR47lh86PQ4hzzRupCcq4tBdkrskMvvOxI2BDiQUveDj/2NZIccBOr51M7hbxgvP3yokNv1zITGvmRavEBmafqSUly9m80JfzTzWhXgnPyum+4NEKC3vgLkMLVhKnw7Z7R2q0lXY2mOi2micAJCToH7h0eO3nrEtePVe6LAgOIQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d3dab4-322f-41e3-856a-08d7afd95d0b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2020 16:34:00.3892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRiuKkr3ZQcuWZYdjo5wZkKmNmmJspEGvOk5MgtecGO1EtkhSOoKNR6o3ZhplQ8XUGuZUwKt8RTB6oryd3uiwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1487
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvMTEvMjAgNzo1MyBQTSwgTHViZW4gVHVpa292IHdyb3RlOgo+IE9uIDIwMjAtMDItMTEg
NDoyNyBwLm0uLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4gT24gMi8xMS8yMCAxMDo1NSBB
TSwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+PiBPbiAyLzEwLzIwIDQ6NTAgUE0sIEx1YmVu
IFR1aWtvdiB3cm90ZToKPj4+PiBIaSBMdWNhcywKPj4+Pgo+Pj4+IFRoYW5rIHlvdSBmb3IgYnJp
bmdpbmcgYXdhcmVuZXNzIG9mIHRoaXMgaXNzdWUsIHB1YmxpY2x5Lgo+Pj4+Cj4+Pj4gQXMgc29v
biBhcyB0aGlzIHBhdGNoIHNob3dlZCB1cCBiYWNrIGluIE5vdmVtYmVyIG9mIDIwMTksCj4+Pj4g
SSBvYmplY3RlZCB0byBpdCwgcHJpdmF0ZWx5Lgo+Pj4KPj4+IEkgZGlkbid0IGZpbmQgdGhpcyBv
YmplY3Rpb24gaW4gbXkgbWFpbCBhY3R1YWxseQo+IFllcywgSSBkaWRuJ3Qgc2VuZCBpdCB0byB5
b3UuCj4KPj4+PiBJIHN1Z2dlc3RlZCB0byBpbnN0ZWFkIHVzZSBhIF9saXN0XyB0byBzdG9yZSB0
aGUgInN0YXRlIiBvZgo+Pj4+IGFsbCBqb2JzIG9mIHRoZSBzYW1lIHN0YXRlLiBUaGVuLCBhdCBh
bnkgdGltZSwgdGltZW91dCBpbnRlcnJ1cHQKPj4+PiBvciB3aGF0ZXZlciwgd2UgY2FuIGF0b21p
Y2FsbHkgKGlycSBzcGlubG9jaykgbW92ZSB0aGUgdGltZW91dC9iYWQKPj4+PiBqb2IgdG8gdGhl
IHRpbWVkb3V0L2NsZWFudXAvYmFkIGpvYiBsaXN0LCBhbmQgd2FrZSBzb21lb25lIHVwCj4+Pj4g
dG8gZGVhbCB3aXRoIHRoYXQgbGlzdCBhc3luY2hyb25vdXNseSwgYW5kIHJldHVybiBmcm9tIHRo
ZQo+Pj4+IGludGVycnVwdC9ldGMuCj4+Pj4gaW1tZWRpYXRlbHkuCj4+Pgo+Pj4gU291bmRzIGEg
Z29vZCBpZGVhIHRvIG1lLCBpIHRoaW5rIGVub3VnaCBmb3IgdXMgdG8gaGF2ZSAyIGxpc3RzLAo+
Pj4gdGltZW91dCBsaXN0IGZvciBqb2JzIHNjaGVkdWxlZCB0byBIVyBhbmQgbm90IHlldCBjb21w
bGV0ZWQKPj4+IChjb21wbGV0aW9uIGZlbmNlIHNpZ25hbGVkKSBhbmQgY2xlYW51cCBsaXN0IGZv
ciB0aG9zZSB0aGF0IGRpZAo+Pj4gY29tcGxldGUuIFRoaXMgc2hvdWxkIGdpdmUgYWx0ZXJuYXRp
dmUgc29sdXRpb24gdG8gdGhlIHJhY2UgY29uZGl0aW9uCj4+PiB0aGlzIHBhdGNoIHdhcyBhZGRy
ZXNzaW5nIHdpdGhvdXQgY2F1c2luZyB0aGUgYnJlYWsgdGhlIEx1Y2FzCj4+PiByZXBvcnRlZC4g
SWYgbm8gb25lIG9iamVjdHMgSSB0aGluayBpIGNhbiB0cnkgaW1wbGVtZW50IGl0Lgo+Pj4KPj4+
IEFuZHJleQo+Pgo+PiBUaGlua2luZyBtb3JlIGkgcmVhbGl6ZSBMdWJlbiBpcyByaWdodCBhYm91
dCBoYXZpbmcgYWxzbyBiYWQgam9iIGxpc3QgYXMKPj4gdGhpcyBpcyBuZWVkZWQgZm9yIG5vcm1h
bCBqb2IgY29tcGV0aXRpb24gKGJ5IGZlbmNlIGNhbGxiYWNrIGZyb20KPj4gYW1kZ3B1X2ZlbmNl
X3Byb2Nlc3MpwqAgYW5kIHlvdSBuZWVkIHRvIGRlY2lkZSBpZiB5b3UgbW92ZSBpdCB0byBjbGVh
bnVwCj4+IGxpc3QgZnJvbSB0aW1lb3V0IGxpc3Qgb3Igbm90LiBJZiBpdCdzIGFscmVhZHkgaW4g
YmFkIGpvYiBsaXN0IC0gbWVhbmluZwo+PiB0aGF0IGl0J3MgYmVpbmcgcHJvY2Vzc2VkIGJ5IEdQ
VSByZWNvdmVyeSBjb2RlIHlvdSBkb24ndCB0b3VjaCBpdCwKPj4gb3RoZXJ3aXNlIHlvdSBtb3Zl
IGl0IHRvIGNsZWFudXAgbGlzdCB3aGVyZSBpdCB3aWxsIGJlIGZyZWVkIGV2ZW50dWFsbHkKPj4g
YnkgaW52b2NhdGlvbiBvZiBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iLgo+IFllcC4uLgo+Cj4g
UGVyaGFwcyBmZXdlciBsaXN0cywgdGhhbiAidGltZW91dCIsICJiYWQiIGFuZCAiY2xlYW51cCIg
Y291bGQgYmUgaGFkLgo+IEknZCBhbHNvIG5hbWUgdGhlICJiYWQiIGxpc3QgYXMgInJlY292ZXJ5
IiBsaXN0LCBhcyB0aGF0IGlzIHdoYXQgd291bGQKPiBiZSBkb25lIHRvIGNvbW1hbmRzIG9uIHRo
YXQgbGlzdC4KPgo+ICJUaW1lb3V0IiBpcyBhIHN0YXR1cyAidGltZWQtb3V0Iiwgc28gcGVyaGFw
cyBqdXN0IHNldCB0aGUgdGltZW91dAo+IGZsYWcgYW5kIG1vdmUgaXQgdG8gYSAiZG9uZSIgbGlz
dC4gKE5vdGUgdGhhdCB0aGUgY29tbWFuZCBjYW4gc3RpbGwKPiBjb21wbGV0ZSBhc3luY2hyb25v
dXNseSB3aGlsZSBvbiB0aGF0IGxpc3QgYW5kIHdoaWxlIGl0IGhhcyBzdGF0dXMKPiAidGltZWQt
b3V0Jy4pCj4KPiBUaGUgaWRlYSBpcyB0aGF0LAo+IDEpIGl0IGF2b2lkIGNvbnRlbnRpb24gYW5k
IHJhY2VzIHdoZW4gbW9yZSB0aGFuIG9uZSBjb250ZXh0Cj4gICAgIGNhbiB1cGRhdGUgdGhlIGpv
YiBhdCB0aGUgc2FtZSB0aW1lLCBhbmQKPiAyKSBlYXN5IHRvIHByb2Nlc3MgYWxsIGpvYnMgb2Yg
YSBjZXJ0YWluIHN0YXRlIGFuZC9vcgo+ICAgICBtb3ZlIHRoZW0gYXJvdW5kLCBldGMuCj4KPiBM
ZXQncyBkaXNjdXNzIGl0IGFuZCBjb21lIHVwIHdpdGggYSBwbGFuLiA6LSkKPgo+IFJlZ2FyZHMs
Cj4gTHViZW4KCgpTdXJlLCBsZXQgbWUgbWF5YmUgY29tZSB1cCB3aXRoIGEgZHJhZnQgcGF0Y2gg
c28gd2UgaGF2ZSBtb3JlIGNvbmNyZXRlIApzdHVmZiB0byBkaXNjdXNzIGFuZCByZXZpZXcuCgpB
bmRyZXkKCgoKPgo+Cj4KPgo+PiBBbmRyZXkKPj4KPj4KPj4+Cj4+Pj4gVGhlbiBpbiBkdWUgdGlt
ZSwgaWYgYW55IG1vcmUgaW50ZXJydXB0cyBvciB3aGF0bm90IHRha2UgcGxhY2UsCj4+Pj4gdGhl
IGpvYiB3aWxsIGVpdGhlciBiZSBpbiB0aGUgdGltZW91dCBsaXN0IG9yIG5vdC4gSWYgaXQgaXQs
Cj4+Pj4gdGhlbiB0aGUgaW5zdGlnYXRvciBiYWNrcyBvZmYgYXMgc29tZW9uZSBlbHNlICh0aGUg
bGlzdCBoYW5kbGVyKSB3aWxsL2lzCj4+Pj4gYXdha2UgYW5kIGhhbmRsaW5nIGl0IChvYnZpb3Vz
bHkgYSBzdGF0ZSB2YXJpYWJsZSBtYXkgYmUga2VwdCBhcyB3ZWxsKS4KPj4+Pgo+Pj4+IFRoaXMg
ZHJhd3Mgc29tZXdoYXQgZnJvbSBteSBkYXlzIHdpdGggaVNDU0ksIFNDU0kgYW5kIFNBUywgMTUg
eWVhcnMgYWdvLAo+Pj4+IHdoZXJlIGEgZGV2aWNlIGNhbiBjb21wbGV0ZSBhIGpvYiAodGFzaykg
YXQgYW55dGltZSByZWdhcmRsZXNzCj4+Pj4gb2Ygd2hhdCB0aGUgU0NTSSBsYXllciAidGhpbmtz
IiB0aGUgdGFzaydzIHN0YXRlIGlzOiB0aW1lZC1vdXQsIGFib3J0ZWQsCj4+Pj4gd2hhdGV2ZXIu
IEl0IGlzIGEgdmVyeSBzaW1wbGUgYW5kIGVsZWdhbnQgc29sdXRpb24gd2hpY2ggZ2VuZXJhbGl6
ZXMKPj4+PiB3ZWxsLgo+Pj4+Cj4+Pj4gUmVnYXJkcywKPj4+PiBMdWJlbgo+Pj4+Cj4+Pj4gT24g
MjAyMC0wMi0xMCAxMTo1NSBhLm0uLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4+Pj4gTHVj
YXMgLSBQaW5nIG9uIG15IHF1ZXN0aW9uIGFuZCBhbHNvIEkgYXR0YWNoZWQgdGhpcyB0ZW1wb3Jh
cnkKPj4+Pj4gc29sdXRpb24gZm9yIGV0bmF2aXYgdG8gY2xhcmlmeSBteSBwb2ludC4gSWYgdGhh
dCBzb21ldGhpbmcKPj4+Pj4gYWNjZXB0YWJsZSBmb3Igbm93IGF0IGxlYXN0IGkgY2FuIGRvIHRo
ZSBzYW1lIGZvciB2M2Qgd2hlcmUgaXQKPj4+Pj4gcmVxdWlyZXMgYSBiaXQgbW9yZSBjb2RlIGNo
YW5nZXMuCj4+Pj4+Cj4+Pj4+IEFuZHJleQo+Pj4+Pgo+Pj4+PiBPbiAyLzYvMjAgMTA6NDkgQU0s
IEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+Pj4+IFdlbGwgYSByZXZlcnQgd291bGQgYnJl
YWsgb3VyIGRyaXZlci4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoZSByZWFsIHNvbHV0aW9uIGlzIHRoYXQg
c29tZWJvZHkgbmVlZHMgdG8gc2l0IGRvd24sIGdhdGhlciBBTEwKPj4+Pj4+PiB0aGUgcmVxdWly
ZW1lbnRzIGFuZCB0aGVuIGNvbWUgdXAgd2l0aCBhIHNvbHV0aW9uIHdoaWNoIGlzIGNsZWFuCj4+
Pj4+Pj4gYW5kIHdvcmtzIGZvciBldmVyeW9uZS4KPj4+Pj4+Pgo+Pj4+Pj4+IENocmlzdGlhbi4K
Pj4+Pj4+IEkgY2FuIHRvIHRha2Ugb24gdGhpcyBhcyBpbmRlZWQgb3VyIGdlbmVyYWwgZGVzaWdu
IG9uIHRoaXMgYmVjb21lcwo+Pj4+Pj4gbW9yZSBhbmQgbW9yZSBlbnRhbmdsZWQgYXMgR1BVIHJl
c2V0IHNjZW5hcmlvcyBncm93IGluIGNvbXBsZXhpdHkKPj4+Pj4+IChhdCBsZWFzdCBpbiBBTUQg
ZHJpdmVyKS4gQ3VycmVudGx5IEkgYW0gb24gYSBoaWdoIHByaW9yaXR5Cj4+Pj4+PiBpbnRlcm5h
bCB0YXNrIHdoaWNoIHNob3VsZCB0YWtlIG1lIGFyb3VuZCBhIHdlZWsgb3IgMiB0byBmaW5pc2gg
YW5kCj4+Pj4+PiBhZnRlciB0aGF0IEkgY2FuIGdldCB0byBpdC4KPj4+Pj4+Cj4+Pj4+PiBSZWdh
cmRpbmcgdGVtcG9yYXJ5IHNvbHV0aW9uwqAgLSBJIGxvb2tlZCBpbnRvIHYzZCBhbmQgZXRuYXZp
diB1c2UKPj4+Pj4+IGNhc2VzIGFuZCB3ZSBpbiBBTUQgYWN0dWFsbHkgZmFjZSB0aGUgc2FtZSBz
Y2VuYXJpbyB3aGVyZSB3ZSBkZWNpZGUKPj4+Pj4+IHRvIHNraXAgSFcgcmVzZXQgaWYgdGhlIGd1
aWx0eSBqb2IgZGlkIGZpbmlzaCBieSB0aGUgdGltZSB3ZSBhcmUKPj4+Pj4+IHByb2Nlc3Npbmcg
dGhlIHRpbWVvdXTCoCAoc2VlIGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIgYW5kCj4+Pj4+PiBz
a2lwX2h3X3Jlc2V0IGdvdG8pIC0gdGhlIGRpZmZlcmVuY2UgaXMgd2UgYWx3YXlzIGNhbGwKPj4+
Pj4+IGRybV9zY2hlZF9zdG9wL3N0YXJ0IGlycmVzcGVjdGl2ZWx5IG9mIHdoZXRoZXIgd2UgYXJl
IGdvaW5nIHRvCj4+Pj4+PiBhY3R1YWxseSBIVyByZXNldCBvciBub3QgKHNhbWUgYXMgZXh0ZW5k
IHRpbWVvdXQpLiBJIHdvbmRlciBpZgo+Pj4+Pj4gc29tZXRoaW5nIGxpa2UgdGhpcyBjYW4gYmUg
ZG9uZSBhbHNvIGZvciB2ZTMgYW5kIGV0bmF2aXYgPwo+Pj4+Pj4KPj4+Pj4+IEFuZHJleQo+Pj4+
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+PiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdAo+Pj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
Pj4+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9
aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8l
MkZhbWQtZ2Z4JmFtcDtkYXRhPTAyJTdDMDElN0NhbmRyZXkuZ3JvZHpvdnNreSU0MGFtZC5jb20l
N0NlZjk2NjE3ZDIzYTU0ZmU5YjZlZjA4ZDdhZjBhYzlkYiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTEx
YTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzcxNzAzMzMyMDA2MjE1NTAmYW1wO3NkYXRhPXdhN0Vo
M2JkaSUyQnRoWWpqWkYyeWVUdlRqTlJpcEdQcVZBJTJGR1F0MFFMN1I4JTNEJmFtcDtyZXNlcnZl
ZD0wCj4+Pj4+Cj4+Pj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4+IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxv
b2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFu
JTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTAyJTdDMDElN0NhbmRyZXkuZ3JvZHpvdnNr
eSU0MGFtZC5jb20lN0NlZjk2NjE3ZDIzYTU0ZmU5YjZlZjA4ZDdhZjBhYzlkYiU3QzNkZDg5NjFm
ZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzcxNzAzMzMyMDA2MjE1NTAmYW1w
O3NkYXRhPXdhN0VoM2JkaSUyQnRoWWpqWkYyeWVUdlRqTlJpcEdQcVZBJTJGR1F0MFFMN1I4JTNE
JmFtcDtyZXNlcnZlZD0wCj4+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
