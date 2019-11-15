Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7710BFE7C3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 23:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEA76EB3A;
	Fri, 15 Nov 2019 22:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750045.outbound.protection.outlook.com [40.107.75.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B466EB37;
 Fri, 15 Nov 2019 22:27:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoWgMYqTI2fdKLBelxi1fuiLaIr9i/QNtRbeqqN3rBH6kggmwmOcI+/WIqJV0LDh1ZrgMhBMlHAYOJIJgpRZfEGLeGeRg1ibBd/9s48geprHs7SWJ5mpUsJQIHUNaDAj+1QPLfrfxAg0WxIOzoVIGeG1ofUByri6evNEEjcPWQgWb/ZvxKLU01Z2cGj8Nw4P9NBK2kl6hSu8i8BGk0PWTbC999SJUJk3zEGbcPqgrWAgr+0OjWIum/cA7IE2W1E5PILjjEmKnDLY8dPwK99ZAFKQQrf9NL8mVJly+D63AaNfQhVEWEYTe5ABp/6IMtazz43cNHICJWUCfgM5Ea27+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuKFF7qjWm4OO5L6z7z/Zi6a2Ean9haBFX42w8g/Xv0=;
 b=czBsHymBhOQL1tlXJhGLRCxG+ejELKpUiz0dtYV2XeR7upP5+ksiWFT0NbRq7kqT/L1a7PGH8Wa+PcW4ZtNHGaMzCn7n9fWYMlca8gzGd5fRFSxsJ4vQbQz8Xvupf0PCXURn/3X+aUIlQgGKTt73pSvXj/WIOe1YAZWdqDAEUEpfoOfo+2dFxaUa+9auEA++HVqALU5N4wTqDsFT+IzYgDpNkZEUvXtnTNjM/SxhUv6Q/oZUbrQoPaYtNbhvwy0yCHb7hXZ41FWZ0wbRcFij1dDA4YOWwS2q5K15VKKZtyNSNLJwKBaf+JIHyd62BEP1keUkRZQ7NGPZcCw3HDUgpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3949.namprd12.prod.outlook.com (10.255.237.150) by
 MN2PR12MB4269.namprd12.prod.outlook.com (52.135.48.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.27; Fri, 15 Nov 2019 22:27:36 +0000
Received: from MN2PR12MB3949.namprd12.prod.outlook.com
 ([fe80::49f3:af31:eb8e:569b]) by MN2PR12MB3949.namprd12.prod.outlook.com
 ([fe80::49f3:af31:eb8e:569b%4]) with mapi id 15.20.2451.029; Fri, 15 Nov 2019
 22:27:36 +0000
Subject: Re: [PATCH 2/4] drm/ttm: cleanup ttm_buffer_object_transfer
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Kevin1.Wang@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20191111145832.37320-1-christian.koenig@amd.com>
 <20191111145832.37320-2-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <6cc373fe-150d-02e3-cbea-21d5e4564c71@amd.com>
Date: Fri, 15 Nov 2019 17:27:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20191111145832.37320-2-christian.koenig@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::38) To MN2PR12MB3949.namprd12.prod.outlook.com
 (2603:10b6:208:167::22)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 278a4bff-65af-4cc9-b85a-08d76a1b03e4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4269:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42697FA68D1146D7E53C3F0892700@MN2PR12MB4269.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 02229A4115
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(189003)(199004)(7736002)(229853002)(31696002)(6246003)(36756003)(66946007)(53546011)(386003)(4001150100001)(14454004)(186003)(2486003)(26005)(66476007)(305945005)(66556008)(66574012)(52116002)(23676004)(36916002)(5660300002)(76176011)(478600001)(99286004)(6436002)(86362001)(3846002)(25786009)(6512007)(81156014)(81166006)(47776003)(8936002)(2906002)(8676002)(6506007)(6486002)(31686004)(65956001)(65806001)(66066001)(58126008)(486006)(2870700001)(44832011)(2616005)(476003)(14444005)(50466002)(446003)(316002)(6116002)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4269;
 H:MN2PR12MB3949.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mVCsAf6/h3w2judtw/fIxD3mYfcLBwpmM2BsKd/ui/MVoG6xeDPEU1vCcx/EGghS3RjVNsfrL0ydm2i1SyKdcT7RQCUZB4c8XzDnyTdaMGsblm59Z/KWlVF81JhAS2IWgCKDJV6MjmOPB8fyAuDx3T8Dy4qQqyPywROv0NtXNZp2U+BTT57mJTmGdgvK8ov2eNXSmtszLJwpE52+FNomay/+DwnZkRhC+uvGff5psJ6+4KJyPF/OiTJWzXUPEI8DE+VQxoGBfB4sWR8eMv4Sad+uhuriNsKi8x7VoAx6YD+euSLv+4uafFwekh3Y+Rx/LyIVjwuI8EMB6lElf7uAWU6VSREafR+YZme/kPKIJcum2c4w4G24/rHYIzjIwU+sxBMGgduqCLZ/FKrr4IiYcv1I/iWdCBmzwoSXG3tDT5/YzI8d/mryi8SZhZqkzHvZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 278a4bff-65af-4cc9-b85a-08d76a1b03e4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 22:27:36.1644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wmmKWS4fU7i18+t/d4Cdf8Ykz9yh7v/sYBLAdXQlILGizZDshCMIUkFAZAz3xIAIERV5vx6IgDO2ZPuM4NwWYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4269
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuKFF7qjWm4OO5L6z7z/Zi6a2Ean9haBFX42w8g/Xv0=;
 b=KWReduaCdwdLTfAnzcNSXwyQFUMcgSOrw00oSxRwUJMYdGj+RlWL3O9RN5n0QNRb19ysMYX50mtxvu4Pr6UJ6xr9aYGAy1bmu9TmbKft8hcKyrru/HyPxi0kyKUKsCM859C0lEg2rri8mSApNoGyI0BFx3W0sTMdbBtjls3t2KE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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

VGhlIHN1YmplY3QgZG9lc24ndCBtYXRjaCB0aGUgY2hhbmdlLiBUaGlzIGNoYW5nZXMgdHRtX2Jv
X2NsZWFudXBfcmVmcywgCm5vdCB0dG1fYnVmZmVyX29iamVjdF90cmFuc2Zlci4KCk9uIDIwMTkt
MTEtMTEgOTo1OCBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IFRoZSBmdW5jdGlvbiBp
cyBhbHdheXMgY2FsbGVkIHdpdGggZGVsZXRlZCBCT3MuCj4KPiBXaGlsZSBhdCBpdCBjbGVhbnVw
IHRoZSBpbmRlbnRhdGlvbiBhcyB3ZWxsLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYyB8IDEyICsrKy0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IGluZGV4IDdl
NzkyNWZlY2Q5ZS4uMTE3ODk4MGY0MTQ3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gQEAgLTUy
NywxNCArNTI3LDkgQEAgc3RhdGljIGludCB0dG1fYm9fY2xlYW51cF9yZWZzKHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm8sCj4gICAJCQkgICAgICAgYm9vbCBpbnRlcnJ1cHRpYmxlLCBib29s
IG5vX3dhaXRfZ3B1LAo+ICAgCQkJICAgICAgIGJvb2wgdW5sb2NrX3Jlc3YpCj4gICB7Cj4gLQlz
dHJ1Y3QgZG1hX3Jlc3YgKnJlc3Y7Cj4gKwlzdHJ1Y3QgZG1hX3Jlc3YgKnJlc3YgPSAmYm8tPmJh
c2UuX3Jlc3Y7Cj4gICAJaW50IHJldDsKPiAgIAo+IC0JaWYgKHVubGlrZWx5KGxpc3RfZW1wdHko
JmJvLT5kZGVzdHJveSkpKQoKV291bGQgaXQgbWFrZSBzZW5zZSB0byBhZGQgYSBCVUdfT04gb3Ig
V0FSTl9PTiBoZXJlIHRvIGNoZWNrIHRoZSAKYXNzdW1wdGlvbiBtYWRlIGJ5IHRoaXMgY29kZT8K
ClJlZ2FyZHMsCiDCoCBGZWxpeAoKPiAtCQlyZXN2ID0gYm8tPmJhc2UucmVzdjsKPiAtCWVsc2UK
PiAtCQlyZXN2ID0gJmJvLT5iYXNlLl9yZXN2Owo+IC0KPiAgIAlpZiAoZG1hX3Jlc3ZfdGVzdF9z
aWduYWxlZF9yY3UocmVzdiwgdHJ1ZSkpCj4gICAJCXJldCA9IDA7Cj4gICAJZWxzZQo+IEBAIC01
NDcsOSArNTQyLDggQEAgc3RhdGljIGludCB0dG1fYm9fY2xlYW51cF9yZWZzKHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm8sCj4gICAJCQlkbWFfcmVzdl91bmxvY2soYm8tPmJhc2UucmVzdik7
Cj4gICAJCXNwaW5fdW5sb2NrKCZ0dG1fYm9fZ2xvYi5scnVfbG9jayk7Cj4gICAKPiAtCQlscmV0
ID0gZG1hX3Jlc3Zfd2FpdF90aW1lb3V0X3JjdShyZXN2LCB0cnVlLAo+IC0JCQkJCQkJICAgaW50
ZXJydXB0aWJsZSwKPiAtCQkJCQkJCSAgIDMwICogSFopOwo+ICsJCWxyZXQgPSBkbWFfcmVzdl93
YWl0X3RpbWVvdXRfcmN1KHJlc3YsIHRydWUsIGludGVycnVwdGlibGUsCj4gKwkJCQkJCSAzMCAq
IEhaKTsKPiAgIAo+ICAgCQlpZiAobHJldCA8IDApCj4gICAJCQlyZXR1cm4gbHJldDsKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
