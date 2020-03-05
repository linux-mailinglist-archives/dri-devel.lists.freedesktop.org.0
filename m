Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB01017A676
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 14:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B1E6E321;
	Thu,  5 Mar 2020 13:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74986E32B;
 Thu,  5 Mar 2020 13:34:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMOIAM5jcaBw7g8PG1/bW6dbbLZD7nkdchxjNx8pBSma9YNHCTNz3dgkGv5Wfp6qKk0GJ6o3CMQm8X3U19hhxUr7PzFVqAeXme/Lo32DBiOQdK0C36QDby/A1AmTB99xplsJUkzaWnAfcP9I8l+HL2VghBxTdStB4tikp0V15jOffmmm0oqJAQubZOvVUjVt6hBRomxCy/a+R/FBrzdDORHba7YiIQrms3MGfTJa6g6M2e/QbX0V1GLK7xJiL0kasc9nQTdFp3n+pceRF+umgUJX2B6eDtQQDNpS09vkosgkuv7aoMpJ/kI2hfQ43tDWBcO3qiKTkvl2i26CNdN9hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYrmWfWUKZBKhKaoGUTIXz8fx3Q9zsnImexX+hUeS1Y=;
 b=YCNdML+d0i6Hj7KlhbG+FSXlIKymfhkWdmLay4U479WkNXkwvbpUpk1jKabVr+rH4Epr6hstYNC1r9quW96ktkuQqSH8OYPnBE2r6UwlMkuDQzpZ3ghvkS/DUdnFegPXrpo/a9q7P04NqsMIiwIRNWGyWDDZCIYnOJjOC3vxmJoJ5S3JDjzyedBI2kDqhJ92I+v0Tj2sw6sA4ajyYgkBCKC+pTI8ZYKO8Udm455GSx+uCuEFkI+7K7QdjhTgeIG5csdC7dCj3yowYdEE2YJXlKFBALoVZY4IGqfms1XIKVugbIxECDhgSsmsbTM5Fb5/HLsAslr9QFqmsdz8RveVhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYrmWfWUKZBKhKaoGUTIXz8fx3Q9zsnImexX+hUeS1Y=;
 b=fsNsHx/UrqOzXkOh4XgzRR5HtEZwtoaJo1cVL5eKmlSvlPVy2KzABIh5xazqNP/5zLgdhJM0+e4agF3KAlp1WdduM2pPxDi5OP3EvUtXcxONlbLf/s6FGXcCbyg21lCnUAsiyW2zZCj9d4Me+4koSNtmtUx688BNc9xLE4XYIOc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1369.namprd12.prod.outlook.com (2603:10b6:3:6f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Thu, 5 Mar
 2020 13:34:52 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 13:34:52 +0000
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200305132910.17515-1-nirmoy.das@amd.com>
 <20200305132910.17515-9-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5a65d7ce-2a78-247a-1fd8-3fff211bf0d6@amd.com>
Date: Thu, 5 Mar 2020 14:34:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200305132910.17515-9-nirmoy.das@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0101CA0071.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::39) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0101CA0071.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15 via Frontend
 Transport; Thu, 5 Mar 2020 13:34:49 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6df7f1d2-51f0-4d88-91dc-08d7c109fc01
X-MS-TrafficTypeDiagnostic: DM5PR12MB1369:|DM5PR12MB1369:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB13697AA2DAF1059087DFCCF083E20@DM5PR12MB1369.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-Forefront-PRVS: 03333C607F
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(189003)(199004)(316002)(52116002)(4326008)(478600001)(2906002)(31686004)(86362001)(31696002)(7416002)(36756003)(5660300002)(16526019)(2616005)(6666004)(186003)(8676002)(8936002)(81156014)(66476007)(6486002)(81166006)(66556008)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1369;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QqM0EPAGENyEuvMnn6E1HpHE4GxpO6fwaro8AG+Me9ZXsCANTOicDmWyhuOVAjwr1J3SlFA9dwwXwijdb2svUiVdVMnhAkyokhNytuTZSWjuEeIK+bU6J9UbmYMVedDI3TuxfrtoXpo7EM0mIwhPFE9trai39EwelD24QVeY7dm0GN3jMJRK8WVi7+OmbDzqPlHMKLI1dzEKZz25GkSfGAz8rxl3Re5MBconRpiVX49UsGzFSnkC8ZHAG7o1qtp4tL2WrWgxPUWjLjlojSHLg9F5mjPHdViK+6gWlU1b/9IPur56A+HDEWju9cgqb5vfreDa/piRpPx7wZmgBIE7SGyKnJGuPyNQXiEXEqKLr9E2USjuR0AvSIJ4YdUVjTh1qgFdyXXAuBJpAe9gzZ3duIZSN3DD6kXceUtp0JAs0bnc8j7tWxkOElrUrr7IbI0a
X-MS-Exchange-AntiSpam-MessageData: +id6+Rl9n+fIzpDEGYPBDi8bNzo7CHli91y+OsrlejFTOAV5Gl+ojyXIBxiyK+K4B/PxKzD+LWqe8ui/53J8kK/xHa0ZZF0CV/purtceGIF+2vGWc55wv6YitJ/vGvDyXqLT8nmEHcwHE98ciBdOCclYXAeqe5elcD9XK49VzpSexfeU3zlit4ucago4ckz1bS9aN21G6YRD3TXc0kFn9Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df7f1d2-51f0-4d88-91dc-08d7c109fc01
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2020 13:34:52.5911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sB4CJlwF0aUsO2YBm6nMeHodsibT2yA+871cC6ifkhVrQZAKpzFinLSZMu1JQWRp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1369
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, kraxel@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, bskeggs@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMDMuMjAgdW0gMTQ6Mjkgc2NocmllYiBOaXJtb3kgRGFzOgo+IEdQVSBhZGRyZXNzIGhh
bmRsaW5nIGlzIGRldmljZSBzcGVjaWZpYyBhbmQgc2hvdWxkIGJlIGhhbmRsZSBieSBpdHMgZGV2
aWNlCj4gZHJpdmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0Bh
bWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgIHwgNyAt
LS0tLS0tCj4gICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oICAgIHwgMiAtLQo+ICAgaW5j
bHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCB8IDEgLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAx
MCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
by5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IGluZGV4IDZkMWU5MWJlOWM3OC4u
OWYyNGZiMjg3ZDcxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gQEAgLTg1LDcgKzg1LDYgQEAg
c3RhdGljIHZvaWQgdHRtX21lbV90eXBlX2RlYnVnKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2
LCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAKPiAgIAlkcm1fcHJpbnRmKHAsICIgICAgaGFzX3R5cGU6
ICVkXG4iLCBtYW4tPmhhc190eXBlKTsKPiAgIAlkcm1fcHJpbnRmKHAsICIgICAgdXNlX3R5cGU6
ICVkXG4iLCBtYW4tPnVzZV90eXBlKTsKPiAgIAlkcm1fcHJpbnRmKHAsICIgICAgZmxhZ3M6IDB4
JTA4WFxuIiwgbWFuLT5mbGFncyk7Cj4gLQlkcm1fcHJpbnRmKHAsICIgICAgZ3B1X29mZnNldDog
MHglMDhsbFhcbiIsIG1hbi0+Z3B1X29mZnNldCk7Cj4gICAJZHJtX3ByaW50ZihwLCAiICAgIHNp
emU6ICVsbHVcbiIsIG1hbi0+c2l6ZSk7Cj4gICAJZHJtX3ByaW50ZihwLCAiICAgIGF2YWlsYWJs
ZV9jYWNoaW5nOiAweCUwOFhcbiIsIG1hbi0+YXZhaWxhYmxlX2NhY2hpbmcpOwo+ICAgCWRybV9w
cmludGYocCwgIiAgICBkZWZhdWx0X2NhY2hpbmc6IDB4JTA4WFxuIiwgbWFuLT5kZWZhdWx0X2Nh
Y2hpbmcpOwo+IEBAIC0zNDUsMTIgKzM0NCw2IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2hhbmRsZV9t
b3ZlX21lbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgbW92ZWQ6Cj4gICAJYm8t
PmV2aWN0ZWQgPSBmYWxzZTsKPiAgIAo+IC0JaWYgKGJvLT5tZW0ubW1fbm9kZSkKPiAtCQliby0+
b2Zmc2V0ID0gKGJvLT5tZW0uc3RhcnQgPDwgUEFHRV9TSElGVCkgKwo+IC0JCSAgICBiZGV2LT5t
YW5bYm8tPm1lbS5tZW1fdHlwZV0uZ3B1X29mZnNldDsKPiAtCWVsc2UKPiAtCQliby0+b2Zmc2V0
ID0gMDsKPiAtCj4gICAJY3R4LT5ieXRlc19tb3ZlZCArPSBiby0+bnVtX3BhZ2VzIDw8IFBBR0Vf
U0hJRlQ7Cj4gICAJcmV0dXJuIDA7Cj4gICAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRt
L3R0bV9ib19hcGkuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKPiBpbmRleCBiOWJj
MWIwMDE0MmUuLmQ2ZjM5ZWU1YmY1ZCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRt
X2JvX2FwaS5oCj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+IEBAIC0yMTMs
OCArMjEzLDYgQEAgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0IHsKPiAgIAkgKiBlaXRoZXIgb2Yg
dGhlc2UgbG9ja3MgaGVsZC4KPiAgIAkgKi8KPiAgIAo+IC0JdWludDY0X3Qgb2Zmc2V0OyAvKiBH
UFUgYWRkcmVzcyBzcGFjZSBpcyBpbmRlcGVuZGVudCBvZiBDUFUgd29yZCBzaXplICovCj4gLQo+
ICAgCXN0cnVjdCBzZ190YWJsZSAqc2c7Cj4gICB9Owo+ICAgCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZl
ci5oCj4gaW5kZXggYzllMGZkMDlmNGIyLi5jOGNlNmMxODFhYmUgMTAwNjQ0Cj4gLS0tIGEvaW5j
bHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1f
Ym9fZHJpdmVyLmgKPiBAQCAtMTc3LDcgKzE3Nyw2IEBAIHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFu
YWdlciB7Cj4gICAJYm9vbCBoYXNfdHlwZTsKPiAgIAlib29sIHVzZV90eXBlOwo+ICAgCXVpbnQz
Ml90IGZsYWdzOwo+IC0JdWludDY0X3QgZ3B1X29mZnNldDsgLyogR1BVIGFkZHJlc3Mgc3BhY2Ug
aXMgaW5kZXBlbmRlbnQgb2YgQ1BVIHdvcmQgc2l6ZSAqLwo+ICAgCXVpbnQ2NF90IHNpemU7Cj4g
ICAJdWludDMyX3QgYXZhaWxhYmxlX2NhY2hpbmc7Cj4gICAJdWludDMyX3QgZGVmYXVsdF9jYWNo
aW5nOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
