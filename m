Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0571A34FE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 15:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92676EBBF;
	Thu,  9 Apr 2020 13:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750053.outbound.protection.outlook.com [40.107.75.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8511F6E21D;
 Thu,  9 Apr 2020 13:38:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjKt2fXpZ+qglDbXDa1C9qh77AjRrU6/gwng1Jiz4jp6OMi3empuJHOh6KrD7NdzzcNfkkq7CLhrdsjoh1vNHGBBN1dJUe6pMXLwXIPySRDdd/jzkXqrTU5tG52O/1rbzZkBhacVbQinG05bIq0bfKPv//DzVgEfPpxxdnqAY7c56YnOGPuPveWnOnf1+FIU0qWWwEauMzg9AXVLEYayPiYwflpUqtZoZEOMQjNrM7Cjlz4vT42Z83IoqmS+edbPTe4H2AW78ionrqXKa/lLxSSolSxIMQOo9IXIsaMiyCd1ISUZItIxQpBEOSidbHt7nbEjTVE9uk9ZjP8TgDXJPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2jb0wHFb4PK/FzteOqo8T0pOTbumzAKw9n3HHwZfrk=;
 b=ChhIVU1KkGeX4mXhlOk61b9nG1jgpM1Gy/8r77UwGMUC+6rasuo9foIRZceTvrbWQkxojZTLeQkHR7Yd5H/n7q40i+w6Gmz6rIHVJDiey78SbXsLv7hA6gonYyV08Wq9nCYnMejWIdzj7+FEagLRL95tKJbBOmBnp6tfW2UWvLr6SlELkpKtSVw1bdnJqFtXKObKy10w9kwoPJDUEgg45Xrb7qLt0r0UOswkHME94bgcKq3NuzcVj/OOxqJBT/9+K1zEp/onsw/VSxWZpADzh5/cqpc0ndZd2ADr4KUow9LOo4f2JeclBx29EDIvCZDzMssM/FXTZ51pBA4g69+nyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2jb0wHFb4PK/FzteOqo8T0pOTbumzAKw9n3HHwZfrk=;
 b=g2WaAV2zR70fw4oK+lag3KwKCd5paMKqrgfo0SL5c1q15Mzsq6/i6fHnshmCxvhKQmTRTKC9FeZstjxZOp6zb7H+llrIZH5ZbJzpfDVwqZG0I6L6p+tgktPsJ24QONAESPQLVHSCJYcRaf1ChMz2G8w+JAKKa5P0QMyH6IkVlR0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3755.namprd12.prod.outlook.com (2603:10b6:5:1c2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.19; Thu, 9 Apr
 2020 13:38:30 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2%4]) with mapi id 15.20.2878.022; Thu, 9 Apr 2020
 13:38:30 +0000
Subject: Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed delete
 worker
To: Lucas Stach <l.stach@pengutronix.de>, xinhui pan <xinhui.pan@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20200409013148.4219-1-xinhui.pan@amd.com>
 <7ebd6025-a563-30d1-8c84-cb031bfef0c1@amd.com>
 <d80c89fe353a114df786e75563d434c496b8140d.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8b634370-1771-4aa4-8725-74b5d807db4b@amd.com>
Date: Thu, 9 Apr 2020 15:38:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <d80c89fe353a114df786e75563d434c496b8140d.camel@pengutronix.de>
Content-Language: en-US
X-ClientProxiedBy: AM6P193CA0136.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::41) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM6P193CA0136.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Thu, 9 Apr 2020 13:38:29 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1b77a318-9352-4be5-f252-08d7dc8b4a44
X-MS-TrafficTypeDiagnostic: DM6PR12MB3755:|DM6PR12MB3755:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3755D72526AE9D8A0318787083C10@DM6PR12MB3755.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0368E78B5B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(31686004)(66574012)(966005)(186003)(45080400002)(5660300002)(16526019)(6666004)(2616005)(478600001)(4326008)(6486002)(110136005)(52116002)(81156014)(66946007)(36756003)(8676002)(8936002)(81166007)(31696002)(2906002)(86362001)(316002)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vpzPfdcs2yV93L+L3KZe/dASfCTTkICqaH0lmAxEWxQWDFSMKYc+GFecdWAbti4pUywV3fHu2AuGzH2ZfIXI5ZiGnETlOTBXzF92Kl44IUeHgaNzmKvsVOqKsV+MYq6q7sFftPZIseq51vFYDCmN7W6Yibat5A2EQ/KNArjNaF5o2BKrAB9Nam5QpxfQ1Xs5eefci12Wyu0zmqNQPCEa9updEx8Ymhy5tR3aPPHACkmr2oWdZs/Q0prB9PmF4gDxOCxtYDBJi1vz7ITz8elLah09hwe85OJAiaExrK9bYs2Yvu0hqcCHebFc/OBtKVCu3fJW2sf34sklJl+lvCl9u1dK5ZD6WPutx7yuLWkW6RLWwU1U+zTV6CjC/ALA7qgkhOiEbDjgv1+oROC2SWBtvNe9iXFttU890x+XVGlaRFyDvmfKQGDdC7MW/nq2sR9pGkjjae2zhz7VyW/oPOvh2uPHhHr7jeYexQunfp4RW4g=
X-MS-Exchange-AntiSpam-MessageData: /Kezh15hYzrAYmr9CqtHpYv6o8H11ud9EKjXn5M4aIPeGu3ERvYg17cBdVJZDSyxgtqH0I1wTIR/ZqHTQtey6MFvupVRXi17zAiHvAkMe2q74fxQzn3rLR9Svxjx0YDJvrz+0ChVfewUDwkfevVJnIGG8UdsrFDOsgcScFAN5OXlWNwTRmbZ5imIjsZq6dk9AoCl8Lcfkyd2hbqUZqlxLA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b77a318-9352-4be5-f252-08d7dc8b4a44
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 13:38:30.2524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RB7jp1J/UZtHOgj/8NqNdysjm4JnC1gRea8XDHVeNoarTCU6sUabD7Ci5vkoG83H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3755
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMDQuMjAgdW0gMTU6MjUgc2NocmllYiBMdWNhcyBTdGFjaDoKPiBBbSBEb25uZXJzdGFn
LCBkZW4gMDkuMDQuMjAyMCwgMTQ6MzUgKzAyMDAgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+
PiBBbSAwOS4wNC4yMCB1bSAwMzozMSBzY2hyaWViIHhpbmh1aSBwYW46Cj4+PiBUaGUgZGVsYXll
ZCBkZWxldGUgbGlzdCBpcyBwZXIgZGV2aWNlIHdoaWNoIG1pZ2h0IGJlIHZlcnkgaHVnZS4gQW5k
IGluCj4+PiBhIGhlYXZ5IHdvcmtsb2FkIHRlc3QsIHRoZSBsaXN0IG1pZ2h0IGFsd2F5cyBub3Qg
YmUgZW1wdHkuIFRoYXQgd2lsbAo+Pj4gdHJpZ2dlciBhbnkgUkNVIHN0YWxsIHdhcm5pbmdzIG9y
IHNvZnRsb2NrdXBzIGluIG5vbi1wcmVlbXB0aWJsZSBrZXJuZWxzCj4+PiBMZXRzIGRvIHNjaGVk
dWxlIG91dCBpZiBwb3NzaWJsZSBpbiB0aGF0IGNhc2UuCj4+IE1obSwgSSdtIG5vdCBzdXJlIGlm
IHRoYXQgaXMgYWN0dWFsbHkgYWxsb3dlZC4gVGhpcyBpcyBjYWxsZWQgZnJvbSBhCj4+IHdvcmsg
aXRlbSBhbmQgdGhvc2UgYXJlIG5vdCByZWFsbHkgc3VwcG9zZWQgdG8gYmUgc2NoZWR1bGVkIGF3
YXkuCj4gSHVoPyBXb3JraXRlbXMgY2FuIHNjaGVkdWxlIG91dCBqdXN0IGZpbmUsIG90aGVyd2lz
ZSB0aGV5IHdvdWxkIGJlCj4gaG9ycmlibHkgYnJva2VuIHdoZW4gaXQgY29tZXMgdG8gc2xlZXBp
bmcgbG9ja3MuCgpMZXQgbWUgcmVmaW5lIHRoZSBzZW50ZW5jZTogV29yayBpdGVtcyBhcmUgbm90
IHJlYWxseSBzdXBwb3NlZCB0byBiZSAKc2NoZWR1bGVkIHB1cnBvc2VseS4gRS5nLiB5b3Ugc2hv
dWxkbid0IGNhbGwgc2NoZWR1bGUoKSBvciAKY29uZF9yZXNjaGVkKCkgbGlrZSBpbiB0aGUgY2Fz
ZSBoZXJlLgoKR2V0dGluZyBzY2hlZHVsZWQgYXdheSBiZWNhdXNlIHdlIHdhaXQgZm9yIGEgbG9j
ayBpcyBvZiBjb3Vyc2UgcGVyZmVjdGx5IApmaW5lLgoKPiAgIFRoZSB3b3JrcXVldWUgY29kZQo+
IGV2ZW4gaGFzIG1lYXN1cmVzIHRvIGtlZXAgdGhlIHdvcmtxdWV1ZXMgYXQgdGhlIGV4cGVjdGVk
IGNvbmN1cnJlbmN5Cj4gbGV2ZWwgYnkgc3RhcnRpbmcgb3RoZXIgd29ya2l0ZW1zIHdoZW4gb25l
IG9mIHRoZW0gZ29lcyB0byBzbGVlcC4KClllYWgsIGFuZCBleGFjdGx5IHRoYXQncyB3aGF0IEkg
d291bGQgc2F5IHdlIHNob3VsZCBhdm9pZCBoZXJlIDopCgpJbiBvdGhlciB3b3JkcyB3b3JrIGl0
ZW1zIGNhbiBiZSBzY2hlZHVsZWQgYXdheSwgYnV0IHRoZXkgc2hvdWxkIG5vdCBpZiAKbm90IHJl
YWxseSBuZWNlc3NhcnkgKGUuZy4gd2FpdGluZyBmb3IgYSBsb2NrKS4KCk90aGVyd2lzZSBhcyB5
b3Ugc2FpZCBuZXcgdGhyZWFkcyBmb3Igd29yayBpdGVtIHByb2Nlc3NpbmcgYXJlIHN0YXJ0ZWQg
CnVwIGFuZCBJIGRvbid0IHRoaW5rIHdlIHdhbnQgdGhhdC4KCkp1c3QgcmV0dXJuaW5nIGZyb20g
dGhlIHdvcmsgaXRlbSBhbmQgd2FpdGluZyBmb3IgdGhlIG5leHQgY3ljbGUgaXMgbW9zdCAKbGlr
ZWx5IHRoZSBiZXR0ZXIgb3B0aW9uLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IFJlZ2FyZHMs
Cj4gTHVjYXMKPgo+PiBNYXliZSByYXRoZXIgY2hhbmdlIHRoZSB3aGlsZSBpbnRvIHdoaWxlICgh
bGlzdF9lbXB0eSgmYmRldi0+ZGRlc3Ryb3kpCj4+ICYmICFzaG91bGRfcmVzY2hlZHVsZSgwKSku
Cj4+Cj4+IENocmlzdGlhbi4KPj4KPj4+IFNpZ25lZC1vZmYtYnk6IHhpbmh1aSBwYW4gPHhpbmh1
aS5wYW5AYW1kLmNvbT4KPj4+IC0tLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
YyB8IDEgKwo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Pgo+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jCj4+PiBpbmRleCA5ZTA3YzNmNzUxNTYuLmI4ZDg1M2NhYjMzYiAxMDA2NDQK
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMKPj4+IEBAIC01NDEsNiArNTQxLDcgQEAgc3RhdGljIGJvb2wg
dHRtX2JvX2RlbGF5ZWRfZGVsZXRlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBib29sIHJl
bW92ZV9hbGwpCj4+PiAgICAJCX0KPj4+ICAgIAo+Pj4gICAgCQl0dG1fYm9fcHV0KGJvKTsKPj4+
ICsJCWNvbmRfcmVzY2hlZCgpOwo+Pj4gICAgCQlzcGluX2xvY2soJmdsb2ItPmxydV9sb2NrKTsK
Pj4+ICAgIAl9Cj4+PiAgICAJbGlzdF9zcGxpY2VfdGFpbCgmcmVtb3ZlZCwgJmJkZXYtPmRkZXN0
cm95KTsKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3Vy
bD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5m
byUyRmRyaS1kZXZlbCZhbXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5j
b20lN0MwYTQ3NDg2Njc2YTc0NzAyZjA1NDA4ZDdkYzg5ODM5YyU3QzNkZDg5NjFmZTQ4ODRlNjA4
ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzcyMjAzNTU1MDQxNDU4NjgmYW1wO3NkYXRhPXdi
UmtZQlBJNm1ZdVpqS0J0UU4zQUdMRE93cUpsV1kzWFV0d3dTaVVRSGclM0QmYW1wO3Jlc2VydmVk
PTAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
