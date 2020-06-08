Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4111F1D91
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 18:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86A86E0C9;
	Mon,  8 Jun 2020 16:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D206C6E0C9;
 Mon,  8 Jun 2020 16:41:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLgMR+2P1W7PLAULVNueOo4y4I7Z4UbOeFGET2BIELgImtOOufw7zLUZO2PIZCAweP8PHcQ4rT+7EI7NPADsqAmbMWpkkyMKWrNT5aWXnpeEc/RJ1+GJYIVwgNtRljtOoiQ8CWhfiyeN7awhbiNRrH/Wpb0r/OuPgINU7uP8wvXyqChNc8Qt1IKoL8YUcUEc7h66bIqcwvFIT+0q8I6eDhxVxF5VfDdubfhC3rnx0PQA4H79qvlNiQWOgORwdVI6QNLwp7pTMjYO+vLeJZ+td0j3cJqfz81SrBNT5btcCvKER8vVOWoLOCJ5Jf4ohfkkZ2vxC+i4IkINiiZPeVrYaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zO05e3QzB9UT6710ov808rEMEuuB5NsH36MNGg/Qjng=;
 b=Gwly3nKd9qNHDvBzF+zrKuM1JxEZ7pjA5kng+0M6FpxKPsaeuVap9/fQEhaqOMdoFpK1wYf6cmOAdEALpfJSV8UIm3NfmJg/HDfB7CpgxRz5ebHkt9UtASmXi0kE3bDSq2k9EhFf2XC5IHtMLhD2jcybPMRxw900bnTAcfXW1iEeWwk9TUKPBATHCTYRXSaVlxd12oZXNtYM7Tsj2asFMUxudVufIRxc5WuyMfSwefH18OKtTuS2DhHpEjfWdeV3NByquQye/MQk0ZnKxbLrG5ZiGnQFKTdom3kNT0s0r+XVD0Zxy2Ur+MJa6eRuQDBT+cI1TLdxPa9Khqm259OzWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zO05e3QzB9UT6710ov808rEMEuuB5NsH36MNGg/Qjng=;
 b=M8VnTabfNoccEIe9rQndxFHeHcf239qHqWEyNDYYeUnodt309TZnFlnmFS/RZXtiD2cshV8smxa2U1aJyqLNf261gaBTb8dvv9zk2hkE1JVVuvFLD4/UV69xVwqwWiok/hlSQBM23OKOOqdIu51Y81N7eV/dQJnReWLj8JmOsKI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3872.namprd12.prod.outlook.com (2603:10b6:208:168::17)
 by MN2PR12MB3294.namprd12.prod.outlook.com (2603:10b6:208:af::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 16:41:07 +0000
Received: from MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::8843:c094:fb2a:d60a]) by MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::8843:c094:fb2a:d60a%7]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 16:41:07 +0000
Subject: Re: [PATCH] drm/mm: remove invalid entry based optimization
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 nirmoy.das@amd.com, intel-gfx@lists.freedesktop.org,
 chris@chris-wilson.co.uk, dri-devel@lists.freedesktop.org
References: <20200608151550.1315-1-christian.koenig@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <58d0d2cf-5365-d5e5-3338-dcd6c7b3a786@amd.com>
Date: Mon, 8 Jun 2020 18:42:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
In-Reply-To: <20200608151550.1315-1-christian.koenig@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0102.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::19) To MN2PR12MB3872.namprd12.prod.outlook.com
 (2603:10b6:208:168::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2003:c5:8f20:5d00:7fc6:50c7:b826:f4e) by
 AM0PR10CA0102.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 16:41:06 +0000
X-Originating-IP: [2003:c5:8f20:5d00:7fc6:50c7:b826:f4e]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 281cc572-6fb0-4c87-27d4-08d80bcabe12
X-MS-TrafficTypeDiagnostic: MN2PR12MB3294:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB329465B2953CE70A124160E28B850@MN2PR12MB3294.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uC4hIpvV5857K4XFNfUBSmlDGHFXdw7PSxigFqwpWXMcKlJo2jfA0yTnx5koyCjTUxq0zXmcB7BU6niosrNQYoVWsLaqRE0ufBQ5w0XfqNmdBKY8oLor3Lk56DKQ0D92nFAbX3c2wLpoVAXqdH9oZcKdCpauhiMWUI+DstJA8bK3TI1clsWKjukqkNsXmdLo5swscIa7QPelCWmiWQattImTLMXo46ZVhtriAus3R8ZktWyQCArSGTcn2eBG4OCSHye2cSoMSI63yNdKzzFO/DaUyX/0KXvqsELmVZNL6ocPQy1SX7bK5dFCwzsvz7WSmoArNIY2BXy0kKmCX2yYY5geZE6aa3jEygzGm8IZ7lDqbpR6W4Io/JLx8QBz5c8H
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3872.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(31686004)(83380400001)(5660300002)(2616005)(31696002)(66946007)(66556008)(66476007)(6506007)(53546011)(36756003)(16526019)(186003)(2906002)(8936002)(8676002)(478600001)(6486002)(52116002)(6512007)(316002)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: YwhGgSL5+5lgoz7cas1j29UnUJ+PIWDeULDHAY078gTw+tHsUM+2qg03oUsj37VHh9qgP/DgKp6Q/Z2DuqZGKG8biQQy2v3ElEXg9KJ5+9CP329NEI4re83/Ec/cRZOAVIOgTs0yIQXwVsnxTkZJoVl+ux9yhUMQODjh8KwHXncf7aNc2YgM+Ak255Wohtqdvf2rocKglkwoRS9fFNWR9mpzVUw7zj4zvnwUOoD1+l+UPgbxCObXbLMaiPAPajyTOlm1orO6pahwJv79RIl2PKKtnEoV3Frh72XRq2tN6IstsRVJdXwPzIXkT4WIB0vDTt2GQrD2AxC0vwm0Gy+SdP3YBJH5lW+YGPz/dQ7loqx44oD2Achas5rAnHNNfuyR3k7Ek446KgvgJVGc716UVpn+z7nrz/IEZjPsDHuRTyHfVWRmcRsydDTScYvEvaJUpEOYKOmEkDsTYXsWasPridGinqhBRkWJ8a64zZwctXH62IE95ID0qxqP/qUp30T7Clf3dhQWTen7fZCbmES9CouWgEn7R7BIx8Qa75aSrJ0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281cc572-6fb0-4c87-27d4-08d80bcabe12
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 16:41:07.4374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pFhtYJ2NVFYWIBmeMd/yNbN87A+ClR9GrDU9IZJ9GdRf0sfBCIkwqzsYTZS6QuDsUp3MiWyLSl2+MCxPS0GPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3294
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvOC8yMCA1OjE1IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IFdoZW4gdGhlIGN1
cnJlbnQgZW50cnkgaXMgcmVqZWN0ZWQgYXMgY2FuZGlkYXRlIGZvciB0aGUgc2VhcmNoCj4gaXQg
ZG9lcyBub3QgbWVhbiB0aGF0IHdlIGNhbiBhYm9ydCB0aGUgc3VidHJlZSBzZWFyY2guCj4KPiBJ
dCBpcyBwZXJmZWN0bHkgcG9zc2libGUgdGhhdCBvbmx5IHRoZSBhbGlnbm1lbnQsIGJ1dCBub3Qg
dGhlCj4gc2l6ZSBpcyB0aGUgcmVhc29uIGZvciB0aGUgcmVqZWN0aW9uLgoKCkkga25vdyB3aHkg
ScKgIGRpZCB0aGF0LCBJIHdhcyB0ZXN0aW5nIHdpdGggOGsgYWxpZ25tZW50LiBTbyB0aGlzIHdh
cyAKYmlhc2VkIHRvIG9wdGltaXplIG15IHRlc3QgY2FzZS4KCgo+Cj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKClJldmlld2VkLWJ5
OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+CgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9kcm1fbW0uYyB8IDYgKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
bW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYwo+IGluZGV4IDYwZTlhOWM5MWU5ZC4uODJk
Mjg4OGViN2ZlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYwo+IEBAIC00MDYsOCArNDA2LDcgQEAgbmV4dF9ob2xl
X2hpZ2hfYWRkcihzdHJ1Y3QgZHJtX21tX25vZGUgKmVudHJ5LCB1NjQgc2l6ZSkKPiAgIAkJcGFy
ZW50X3JiX25vZGUgPSByYl9wYXJlbnQocmJfbm9kZSk7Cj4gICAJCWxlZnRfbm9kZSA9IHJiX2Vu
dHJ5KGxlZnRfcmJfbm9kZSwKPiAgIAkJCQkgICAgIHN0cnVjdCBkcm1fbW1fbm9kZSwgcmJfaG9s
ZV9hZGRyKTsKPiAtCQlpZiAoKGxlZnRfbm9kZS0+c3VidHJlZV9tYXhfaG9sZSA8IHNpemUgfHwK
PiAtCQkgICAgIEhPTEVfU0laRShlbnRyeSkgPT0gZW50cnktPnN1YnRyZWVfbWF4X2hvbGUpICYm
Cj4gKwkJaWYgKGxlZnRfbm9kZS0+c3VidHJlZV9tYXhfaG9sZSA8IHNpemUgJiYKPiAgIAkJICAg
IHBhcmVudF9yYl9ub2RlICYmIHBhcmVudF9yYl9ub2RlLT5yYl9sZWZ0ICE9IHJiX25vZGUpCj4g
ICAJCQlyZXR1cm4gcmJfaG9sZV9hZGRyX3RvX25vZGUocGFyZW50X3JiX25vZGUpOwo+ICAgCX0K
PiBAQCAtNDQ2LDggKzQ0NSw3IEBAIG5leHRfaG9sZV9sb3dfYWRkcihzdHJ1Y3QgZHJtX21tX25v
ZGUgKmVudHJ5LCB1NjQgc2l6ZSkKPiAgIAkJcGFyZW50X3JiX25vZGUgPSByYl9wYXJlbnQocmJf
bm9kZSk7Cj4gICAJCXJpZ2h0X25vZGUgPSByYl9lbnRyeShyaWdodF9yYl9ub2RlLAo+ICAgCQkJ
CSAgICAgIHN0cnVjdCBkcm1fbW1fbm9kZSwgcmJfaG9sZV9hZGRyKTsKPiAtCQlpZiAoKHJpZ2h0
X25vZGUtPnN1YnRyZWVfbWF4X2hvbGUgPCBzaXplIHx8Cj4gLQkJICAgICBIT0xFX1NJWkUoZW50
cnkpID09IGVudHJ5LT5zdWJ0cmVlX21heF9ob2xlKSAmJgo+ICsJCWlmIChyaWdodF9ub2RlLT5z
dWJ0cmVlX21heF9ob2xlIDwgc2l6ZSAmJgo+ICAgCQkgICAgcGFyZW50X3JiX25vZGUgJiYgcGFy
ZW50X3JiX25vZGUtPnJiX3JpZ2h0ICE9IHJiX25vZGUpCj4gICAJCQlyZXR1cm4gcmJfaG9sZV9h
ZGRyX3RvX25vZGUocGFyZW50X3JiX25vZGUpOwo+ICAgCX0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
