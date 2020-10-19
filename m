Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23CE2924FF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 11:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D176E8F9;
	Mon, 19 Oct 2020 09:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9169E6E8F9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 09:51:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKWNhDROD6Uu8s8tZuIWRFSWSbyFxPLNKWf6KQz98ufOQnlXOHePZtk6IhoTNBEILPAmWx/iH89TiaInvPNhrhzmyHVUl3SoOJr71ymesZVH+E7yMU0TWnksu699fsSmfBg0LA+o9R4vcS62bWAakIrlR0UVLOgXs5bO/w8B4WvFb9lSZsCh0lG6O5nPtZDXq5xDznDUEbZv8PoJJv8rkmwJkMewL3u9qB5PcCW0fNpjjMFe5hzJY/lkUsx2SnP9zaTFQ7Il1eZHlDdgp2I7vz9lhBW2KNzaUleNQwaTHuxqiu5/+vS8KUBFslKLhqVBFuYqHnaicgiFBLbZZD42FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8eM9im42m+RiXe8SSMpHa7vzD3lSh9FbnV3u/GItNU=;
 b=Uu1PawJoWCiBSViWLciWbvoEgJReOw4ElFZ6/uzaO342ErICl4femNm5jKawh66XwL64DRzYmCvuP1g4opxXGMdytw3qIfVwVE/L5aTySUVOyLrrjh7Ak8OmNKY0XPyMbanQnzUfAclJLYmoIpz/FaOy46uCGCJXjMq9AO5WGfVNLFSnDA89g8V6HTExYNk85QrWs3l87EMkxpXUYDLhPvje/5mu7yTLd1a60qiDZ1HogGuvmcm4lfRK2NlLZMM86yUbd079WZZPy+fqJLHZ4+aKU6xZkncut0dkOn1oMxvIpWMYwiiL2HNY0322xRjsj+dNow+y9lCW4V9iNjEsXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8eM9im42m+RiXe8SSMpHa7vzD3lSh9FbnV3u/GItNU=;
 b=ukpxAFOHSRDnyZmy3NTouOENnRnhUQRbAF7VcgRZ4IqYqsMuUvJf5uu7emDXByCwXp+14McriF+9fu81h/JOLqlLvUHQvaI6oez+n7GTgY4jd6Z04qtBLDYNZxXlE490fii2DfA0RNKnBC2Mw4gba6CQMXBT+IkiJA4fSTXlwmY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2417.namprd12.prod.outlook.com (2603:10b6:207:45::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Mon, 19 Oct
 2020 09:51:07 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 09:51:07 +0000
Subject: Re: [PATCH 1/5] drm/ttm: refactor out common code to setup a new tt
 backed resource
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201019071314.1671485-1-airlied@gmail.com>
 <20201019071314.1671485-2-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ee061097-5d32-4b9a-4f84-37cddc9acf46@amd.com>
Date: Mon, 19 Oct 2020 11:51:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201019071314.1671485-2-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR05CA0147.eurprd05.prod.outlook.com
 (2603:10a6:207:3::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0147.eurprd05.prod.outlook.com (2603:10a6:207:3::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 09:51:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f0774c8c-86dc-43ed-0c6c-08d874147fc6
X-MS-TrafficTypeDiagnostic: BL0PR12MB2417:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2417E4990C6E36F4AF07B1C4831E0@BL0PR12MB2417.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ll0HuCijt7WYLffyBXZJ3aVu/im0WDqxH2ahWiWqDAQqHfSdaush2Fd+341IUNJYe0DYhery3flrXuuTau91qT6myDWPY5R9HdkZLJCqGPFyfOKqaoCuT+dx2OrqQXUWiXQRaxE+/Ya1Gn9d5BnG+Rs2hh+LBR6yKMkgm9vs2R1In35iK2OVnuk7diqptPS6zaySAiDPsZsmNYzcbWgHlh/ctjcriJ3gaDOE8rlYawAtD2ALmRvRQfKIZNGV5wlImkuPtKuqcMxYAVbWmqAwuaAll9RYb/5bjgDpxnacBny/23zr39n1twRXJMiI81rNPsMbnzNwcHAZZRWGavXLZAI8kMTGj0TwGYOo/4hlndIP8Tnesl/qjh5+VeK8aWzx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(83380400001)(8676002)(4326008)(31686004)(6666004)(2906002)(186003)(16526019)(36756003)(86362001)(2616005)(478600001)(5660300002)(8936002)(66556008)(66476007)(316002)(66946007)(31696002)(6486002)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: WeE8OVAImnUyNdKmr6aYka9yWB7rpLCXFynXU2Q3wbAAfLmQpmXPrwr5tOcp3c8+bfd4/Mw+KKyPsbfK0cCypy67Pkn2jO0pZxmHEC+saK/mq3QNuF4JygLVbyFO5a2HNeye34XhUsTkTQX578+Iino9/ajKdwfhaFPyiTK4BOh6svRnhLVfk9/1bBPhNEcMEXWXKMfEtuJdwi3BpOv+EVR0/r+0NDelm204gB8AwBwnzQqforKt0wGCnnQT3owS6BdDyEPazg7g1zRZcO6pAZ9BgLg4SPY+fsKkcBhP31JG2pENjcz/1J9/Odq3PK/WW8Ux3tUN4QSEdzLWcV7XRX07t7fS1u8u7cN+pO7blBxFh5IiMiwONSBlp+82lef8V4CUu58yles1gk2RSkFolqs7v+xQdUzBI7sXfsD9MZZFkppMOk9jdROqh5ZhNgp+AhMr7QcB6AnXfG9aQoCRdJ3i8LR3jE2fjAMYBQJ6DIeSilzNOI4VssRmBqX4IK2u3lHMpEId7JY8P/w5S++858Lh0URkK/Dv/GPVLJXQ9szAwZCUbnD74xbvMqz1XqwbBWtQlp0D1MhF7sXLMyTUZn/3p0QUpD99IgtBdD0GWyf5EFHcyWzQN1exnzbi6QQ+yYpJKysi2ZFPBfHMU5v7+WluUQbxgNNpD+nzlaMaWelCzTgUIW0c8Ny4e0+GA7ulVe1dup9i8uEJHDZJDOZO3Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0774c8c-86dc-43ed-0c6c-08d874147fc6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 09:51:07.0995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0WrF99lx1ansrmLgzfoC3kB+VimKrcqKOw8NuTH6TE6MVqcewvJIwzuFEwpUnv5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2417
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
Cc: rscheidegger.oss@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTkuMTAuMjAgdW0gMDk6MTMgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyBmYWN0b3JzIG91dCB0aGUgY29kZSB0
byBzZXR1cCBub24tc3lzdGVtIHR0Lgo+Cj4gVGhlIHNhbWUgY29kZSB3YXMgdXNlZCB0d2ljZSBp
biB0aGUgbW92ZSBwYXRocy4KPgo+IFJldmlld2VkLWJ5OiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJl
ZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNv
bT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICAgIHwgMTIgKysr
LS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyB8IDM0ICsrKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJp
dmVyLmggICB8ICA0ICsrKysKPiAgIDMgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwg
MjAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBpbmRleCBiOTdlZDZjYTg3NjUu
LmNiYzc0YTMyMGRiMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IEBAIC0yNTIsMTUgKzI1Miw5
IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2hhbmRsZV9tb3ZlX21lbShzdHJ1Y3QgdHRtX2J1ZmZlcl9v
YmplY3QgKmJvLAo+ICAgCQlpZiAocmV0KQo+ICAgCQkJZ290byBvdXRfZXJyOwo+ICAgCj4gLQkJ
aWYgKG1lbS0+bWVtX3R5cGUgIT0gVFRNX1BMX1NZU1RFTSkgewo+IC0JCQlyZXQgPSB0dG1fdHRf
cG9wdWxhdGUoYmRldiwgYm8tPnR0bSwgY3R4KTsKPiAtCQkJaWYgKHJldCkKPiAtCQkJCWdvdG8g
b3V0X2VycjsKPiAtCj4gLQkJCXJldCA9IHR0bV9ib190dF9iaW5kKGJvLCBtZW0pOwo+IC0JCQlp
ZiAocmV0KQo+IC0JCQkJZ290byBvdXRfZXJyOwo+IC0JCX0KPiArCQlyZXQgPSB0dG1fYm9fbW92
ZV90b19uZXdfdHRfbWVtKGJvLCBjdHgsIG1lbSk7Cj4gKwkJaWYgKHJldCkKPiArCQkJZ290byBv
dXRfZXJyOwo+ICAgCX0KPiAgIAo+ICAgCWlmIChiZGV2LT5kcml2ZXItPm1vdmVfbm90aWZ5KQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiBpbmRleCBlZDExMTQyMzViNjYuLmEzNmM2MTVi
ZGYyNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiBAQCAtNDUsMTEgKzQ1LDMw
IEBAIHN0cnVjdCB0dG1fdHJhbnNmZXJfb2JqIHsKPiAgIAlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvOwo+ICAgfTsKPiAgIAo+ICtpbnQgdHRtX2JvX21vdmVfdG9fbmV3X3R0X21lbShzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICsJCQkgICAgICBzdHJ1Y3QgdHRtX29wZXJhdGlv
bl9jdHggKmN0eCwKPiArCQkJICAgICAgc3RydWN0IHR0bV9yZXNvdXJjZSAqbmV3X21lbSkKPiAr
ewo+ICsJaW50IHJldDsKPiArCj4gKwlpZiAobmV3X21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1NZ
U1RFTSkKPiArCQlyZXR1cm4gMDsKPiArCj4gKwlyZXQgPSB0dG1fdHRfcG9wdWxhdGUoYm8tPmJk
ZXYsIGJvLT50dG0sIGN0eCk7Cj4gKwlpZiAodW5saWtlbHkocmV0ICE9IDApKQo+ICsJCXJldHVy
biByZXQ7Cj4gKwo+ICsJcmV0ID0gdHRtX2JvX3R0X2JpbmQoYm8sIG5ld19tZW0pOwo+ICsJaWYg
KHVubGlrZWx5KHJldCAhPSAwKSkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiArCXJldHVybiAwOwo+
ICt9Cj4gKwo+ICAgaW50IHR0bV9ib19tb3ZlX3R0bShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLAo+ICAgCQkgICBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCwKPiAgIAkJICAgIHN0
cnVjdCB0dG1fcmVzb3VyY2UgKm5ld19tZW0pCj4gICB7Cj4gLQlzdHJ1Y3QgdHRtX3R0ICp0dG0g
PSBiby0+dHRtOwo+ICAgCXN0cnVjdCB0dG1fcmVzb3VyY2UgKm9sZF9tZW0gPSAmYm8tPm1lbTsK
PiAgIAlpbnQgcmV0Owo+ICAgCj4gQEAgLTY3LDE2ICs4Niw5IEBAIGludCB0dG1fYm9fbW92ZV90
dG0oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIAkJb2xkX21lbS0+bWVtX3R5cGUg
PSBUVE1fUExfU1lTVEVNOwo+ICAgCX0KPiAgIAo+IC0JaWYgKG5ld19tZW0tPm1lbV90eXBlICE9
IFRUTV9QTF9TWVNURU0pIHsKPiAtCj4gLQkJcmV0ID0gdHRtX3R0X3BvcHVsYXRlKGJvLT5iZGV2
LCB0dG0sIGN0eCk7Cj4gLQkJaWYgKHVubGlrZWx5KHJldCAhPSAwKSkKPiAtCQkJcmV0dXJuIHJl
dDsKPiAtCj4gLQkJcmV0ID0gdHRtX2JvX3R0X2JpbmQoYm8sIG5ld19tZW0pOwo+IC0JCWlmICh1
bmxpa2VseShyZXQgIT0gMCkpCj4gLQkJCXJldHVybiByZXQ7Cj4gLQl9Cj4gKwlyZXQgPSB0dG1f
Ym9fbW92ZV90b19uZXdfdHRfbWVtKGJvLCBjdHgsIG5ld19tZW0pOwo+ICsJaWYgKHVubGlrZWx5
KHJldCAhPSAwKSkKPiArCQlyZXR1cm4gcmV0Owo+ICAgCj4gICAJdHRtX2JvX2Fzc2lnbl9tZW0o
Ym8sIG5ld19tZW0pOwo+ICAgCXJldHVybiAwOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90
dG0vdHRtX2JvX2RyaXZlci5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+IGlu
ZGV4IDNkYmMxMWViNjc4Ny4uMWY0ZDJiMWZlYmQwIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJt
L3R0bS90dG1fYm9fZHJpdmVyLmgKPiArKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZl
ci5oCj4gQEAgLTU5Myw2ICs1OTMsMTAgQEAgaW50IHR0bV9ib19tb3ZlX3R0bShzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQkgICAgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpj
dHgsCj4gICAJCSAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlICpuZXdfbWVtKTsKPiAgIAo+ICtpbnQg
dHRtX2JvX21vdmVfdG9fbmV3X3R0X21lbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+
ICsJCQkgICAgICBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCwKPiArCQkJICAgICAgc3Ry
dWN0IHR0bV9yZXNvdXJjZSAqbmV3X21lbSk7Cj4gKwo+ICAgLyoqCj4gICAgKiB0dG1fYm9fbW92
ZV9tZW1jcHkKPiAgICAqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
