Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECA52971C0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 16:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8CE6F899;
	Fri, 23 Oct 2020 14:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192646F898;
 Fri, 23 Oct 2020 14:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcwiTchxxWzd4NVCcABc7vkWNaqL18Pn/UPacDKp00+XgkDOaetluUj7ZsPYkd9q87IPlVuh6hPPdpjcXkO7mF/SKrMUG8iSzLFSL4sgaIddupSzfQ7SJzht3DKH3fgxytVXlGVl2K+Ukyc/umE2ZPsngHNb0mROkM+SKYW9c5nJW7TOL58PliYc4mfkMohNtEaD8+CvQNwKu/iJ7wA3pOncXrR4sij3ueTZbpEWXutxeaF2yLIxQZ3yAdjNiOJesrtoX+gfUsDkHNKFTJP1wAgeMg0X4AsyfJ9+eRRV2xobFR2E+6Fr7mrfTL9DCWRxqdl2IbvHNrNx+lDU2zlCHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n80mVoHG2zySNuLTQsOxIExFcTnoVG1TFslNXd648s4=;
 b=F1u2jSiO06ckjny0qsFVsQkW/YNhjrhRwZMqXvDz4yQMLAoqz+8+y3T0ywRseVMD5qPlWzO5PsSqE6qTy9VONUpaSZk6BgyBsPWpsQgCFZ8e5xOz+BgrBPYPz7rxZC3m3taPSiLWO23eT9jz7IyHZy2Las1559erUDVzjSj18aqANK9MJpybPBwmT3MlNZQRUg4Eb6XHqRf1/McRi1VgqgW509+nb61ce7pTRY7v11jKkxf+Q1/JM5EGu4UH2UHIIoCuqARuUFbPSct8fdkSz4//NEmzaJde7QKp6kZLGvsvgzR2Na7So8ojHLZ2l2z//BGdmVV0OnTm3PmPQ7iLxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n80mVoHG2zySNuLTQsOxIExFcTnoVG1TFslNXd648s4=;
 b=mjRvSJD7BaXhBDHs7BnmHkOU+kQvMk9XCPEHEcztQoLd9aoEjw2/0Z1LIaxMqyjolnumswecXd3inZdsXuJ8h3bnLhoOBFU8BRyZKl2RT5JOk5HYGmXW7mdDDDv91fgZ/b3g5gVg7fVTDlBqX3nPZNOeEl6x6J1DqfXEHG+XJYY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2356.namprd12.prod.outlook.com (2603:10b6:207:4d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 23 Oct
 2020 14:54:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 14:54:24 +0000
Subject: Re: [PATCH 28/65] drm/ttm: WARN_ON non-empty lru when disabling a
 resource manager
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-28-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <18e78a2d-6ede-97b8-3c8c-e85354a573f8@amd.com>
Date: Fri, 23 Oct 2020 16:54:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201023122216.2373294-28-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR07CA0036.eurprd07.prod.outlook.com
 (2603:10a6:205:1::49) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0036.eurprd07.prod.outlook.com (2603:10a6:205:1::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.11 via Frontend Transport; Fri, 23 Oct 2020 14:54:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d6f64d76-9975-4f20-0c3a-08d8776387c1
X-MS-TrafficTypeDiagnostic: BL0PR12MB2356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB235610F25E3FF9BC0704213D831A0@BL0PR12MB2356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fGsF3QuhX6eGMB6CA6TlKaKpg8NA3iKyzKYUqdCh0Q/OItOuGWDvupDMuKqZ7nc2Itm2nQTgLbZ+0CJWUYyebBj8avnjJBM2dx9spPTKtvSRYUtWib/Oi7fsT0j2LK4ma8LFvVlcwUdmvAPXGHKdvYwRf3mb9HJGRb9I/lH7Bdp4IImSaM/CsWDuK7SF5DBRexBM3pbGQBLBmHH013JXVKoHhdhhgcgkG2uGzGZrHcmXXOyA8pRzZyT999sfwKrooM5Zqekur7Brh87JvfHj/TvA4Y2oq45Egzyftvf7o2+Asv6wbg5RmeDjdqHqjHPDuLITrJA37ir6MGOjyjg6BbJakl89LZziyWWtvrOUuMaDcHk83fkgFzrVvZb601Gn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(5660300002)(83380400001)(66574015)(6666004)(31696002)(2906002)(66556008)(31686004)(36756003)(2616005)(110136005)(66476007)(54906003)(6486002)(86362001)(16526019)(66946007)(186003)(478600001)(52116002)(8936002)(8676002)(4326008)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: CZ/3On9MgbCMjT5ZgxR5WOXHtOHLX80GysoIlaOrq5U8CjLA5sg/CDSDSLEYKtVq9u5SqbOhck+SxLRuh9QaQJfiCt7A54bzEQQGbWmE9aLntnKo1FwE8QhgBikae1+LXPujwWlLG+9q++M8s7b9a7i5V6S+ZeqRsU3zOyZ6zRlqpMThTUcW2ZNv3n2toCWSL8zxXq6YxsrX1vSR2Yc1GEthYfuRKYrHelwKSvrCGGayAmc5ndAoylOaVVT7abZqJqEnQNS9vbaQ/bb4XpG6uFy9yQASST67zN3A7qAHdqmP1A4o39XtLo1qSNtvgIKR+wG+Mpl8qZ/XmRBJkN4qXWAFlolGGD+q4bO+SGmnsMjn53TcuSqran82LzxafAR/G2fQs4Ya5QvRWA4OP0xn6UHp5GEVcrfkEH+9h+mtcYnj2Se9r36jJT2czEVGdQluh9m5dRnJ7behHIrMWWpJjoc4kU9w5owwbonadusyo7iQiOzZN/SMnaxeHo355o3qObEDfwCUvGtNvJ5dxkwlDgx7Olvdd4KrLL+qnU4ikCZ411gfeCc+yj2pGBHJQEAlMBQDCu0vzQFNWEU6J6X8CbOifzaKscrACM/hUUO84//IlEmBUlydPqBD9iZWWiNK7Rac9RrJjiRsFhSh5z8JWvUkW54/tFMtLgcqMio7E2plxoiko/TALaNfYP7Oq85xrfqRSGTHACbNslNpOXRwlQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f64d76-9975-4f20-0c3a-08d8776387c1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2020 14:54:24.1175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Okkwq74uW/ohiGHHtXsiUNjwR2Q7JP4SltIDzHHHcXJfTFQoKvK2tAT6/M8YEJ6l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2356
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMTAuMjAgdW0gMTQ6MjEgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IHR0bV9yZXNvdXJj
ZV9tYW5hZ2VyLT51c2VfdHlwZSBpcyBvbmx5IHVzZWQgZm9yIHJ1bnRpbWUgY2hhbmdlcyBieQo+
IHZtd2dmeC4gSSB0aGluayBpZGVhbGx5IHdlJ2QgcHVzaCB0aGlzIGZ1bmN0aW9uYWxpdHkgaW50
byBkcml2ZXJzIC0KPiB0dG0gaXRzZWxmIGRvZXMgbm90IHByb3ZpZGUgYW55IGxvY2tpbmcgdG8g
Z3VhcmFudGVlIHRoaXMgaXMgc2FmZSwgc28KPiB0aGUgb25seSB3YXkgdGhpcyBjYW4gd29yayBh
dCBydW50aW1lIGlzIGlmIHRoZSBkcml2ZXIgZG9lcyBwcm92aWRlCj4gYWRkaXRpb25hbCBndWFy
YW50ZWVzLiB2d21nZnggZG9lcyB0aGF0IHRocm91Z2ggdGhlCj4gdm13X3ByaXZhdGUtPnJlc2Vy
dmF0aW9uX3NlbS4gVGhlcmVmb3JlIHN1cHBvcnRpbmcgdGhpcyBmZWF0dXJlIGluCj4gc2hhcmVk
IGNvZGUgZmVlbHMgYSBiaXQgbWlzcGxhY2VkLgo+Cj4gQXMgYSBmaXJzdCBzdGVwIGFkZCBhIFdB
Uk5fT04gdG8gbWFrZSBzdXJlIHRoZSByZXNvdXJjZSBtYW5hZ2VyIGlzCj4gZW1wdHkuIFRoaXMg
aXMganVzdCB0byBtYWtlIHN1cmUgSSBhY3R1YWxseSB1bmRlcnN0YW5kIGNvcnJlY3RseSB3aGF0
Cj4gdm13Z2Z4IGlzIGRvaW5nLCBhbmQgdG8gbWFrZSBzdXJlIGFuIGV2ZW50dWFsIHN1YnNlcXVl
bnQgcmVmYWN0b3IKPiBkb2Vzbid0IGJyZWFrIGFueXRoaW5nLgo+Cj4gVGhpcyBjaGVjayBzaG91
bGQgYWxzbyBiZSB1c2VmdWwgZm9yIG90aGVyIGRyaXZlcnMsIHRvIG1ha2Ugc3VyZSB0aGV5Cj4g
aGF2ZW4ndCBsZWFrZWQgYW55dGhpbmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogQ2hyaXN0aWFuIEtvZW5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgoK
SSdtIHByZXR0eSBzdXJlIHRoYXQgdGhpcyB3aWxsIHRyaWdnZXIgZm9yIHZtd2dmeC4gQnV0IHRo
YXQncyB3aGF0IGl0IGlzIApzdXBwb3NlZCB0byBkbywgaXNuJ3QgaXQ/CgpSZXZpZXdlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGlu
Y2x1ZGUvZHJtL3R0bS90dG1fcmVzb3VyY2UuaCB8IDQgKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fcmVz
b3VyY2UuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fcmVzb3VyY2UuaAo+IGluZGV4IGY0OGE3MGQz
OWFjNS4uNzg5ZWM0NzdiNjA3IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fcmVz
b3VyY2UuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fcmVzb3VyY2UuaAo+IEBAIC0xOTEs
NiArMTkxLDEwIEBAIHN0cnVjdCB0dG1fcmVzb3VyY2Ugewo+ICAgc3RhdGljIGlubGluZSB2b2lk
Cj4gICB0dG1fcmVzb3VyY2VfbWFuYWdlcl9zZXRfdXNlZChzdHJ1Y3QgdHRtX3Jlc291cmNlX21h
bmFnZXIgKm1hbiwgYm9vbCB1c2VkKQo+ICAgewo+ICsJaW50IGk7Cj4gKwo+ICsJZm9yIChpID0g
MDsgaSA8IFRUTV9NQVhfQk9fUFJJT1JJVFk7IGkrKykKPiArCQlXQVJOX09OKCFsaXN0X2VtcHR5
KCZtYW4tPmxydVtpXSkpOwo+ICAgCW1hbi0+dXNlX3R5cGUgPSB1c2VkOwo+ICAgfQo+ICAgCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
