Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFEDCC6CBA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 10:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DAA10E310;
	Wed, 17 Dec 2025 09:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=crpt.ru header.i=@crpt.ru header.b="nwcHSH3F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1029 seconds by postgrey-1.36 at gabe;
 Wed, 17 Dec 2025 09:29:05 UTC
Received: from mail.crpt.ru (mail.crpt.ru [91.236.205.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65ECF10E310
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 09:29:05 +0000 (UTC)
Received: from mail.crpt.ru ([192.168.60.3])
 by mail.crpt.ru  with ESMTPS id 5BH9B66e017848-5BH9B66g017848
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
 Wed, 17 Dec 2025 12:11:06 +0300
Received: from EX2.crpt.local (192.168.60.4) by ex1.crpt.local (192.168.60.3)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 17 Dec
 2025 12:11:06 +0300
Received: from EX2.crpt.local ([192.168.60.4]) by EX2.crpt.local
 ([192.168.60.4]) with mapi id 15.01.2507.044; Wed, 17 Dec 2025 12:11:05 +0300
From: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>
To: Simona Vetter <simona@ffwll.ch>
CC: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>, Helge Deller <deller@gmx.de>, Thomas Zimmermann
 <tzimmermann@suse.de>, =?utf-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>, Shixiong Ou
 <oushixiong@kylinos.cn>, Kees Cook <kees@kernel.org>, Zsolt Kajtar
 <soci@c64.rulez.org>, Andrew Morton <akpm@linux-foundation.org>, "Antonino A.
 Daplas" <adaplas@gmail.com>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
 <lvc-project@linuxtesting.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: [PATCH] fbcon: Add check for return value
Thread-Topic: [PATCH] fbcon: Add check for return value
Thread-Index: AQHcbzUTe6Spm9oxpEiKqGWLeVgT8g==
Date: Wed, 17 Dec 2025 09:11:05 +0000
Message-ID: <20251217091036.249549-1-a.vatoropin@crpt.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.200.60.21]
x-kse-serverinfo: EX1.crpt.local, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 12/16/2025 9:37:00 PM
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-FEAS-BEC-Info: WlpIGw0aAQkEARIJHAEHBlJSCRoLAAEeDUhZUEhYSFhIWUhZXkguLVxYWC48UVlRWFhYWVxaSFlRSAlGHgkcBxoHGAEGKAsaGBxGGh1IWUhZXUgbAQUHBgkoDg4fBARGCwBIWEhaSFlaSFlRWkZZXlBGXlhGW0hQSFhIWEhZW0hYSFhIWEhZX0gJDAkYBAkbKA8FCQEERgsHBUhYSFpdSAkDGAUoBAEGHRBFDgcdBgwJHAEHBkYHGg9IWEhZW0gMDQQEDRooDwUQRgwNSFhIW1lIDBoBRQwNHg0EKAQBGxwbRg4aDQ0MDRsDHAcYRgcaD0hYSFldSAMNDRsoAw0aBg0ERgcaD0hYSFpfSAQBBh0QRQ4KDA0eKB4PDRpGAw0aBg0ERgcaD0hYSFpQSAQeC0UYGgcCDQscKAQBBh0QHA0bHAEGD0YHGg9IWEhaWUgHHRsAARABBwYPKAMRBAEGBxtGCwZIWEhZXkgbCQUoGgkeBgoHGg9GBxoPSFhIWV1IGwEFBwYJKA4OHwQERgsASFhIWVBIGwcLASgLXlxGGh0EDRJGBxoPSFhIWVFIHBIBBQUNGgUJBgYoGx0bDUYMDUhYSFpRSB4BBAQNRhsRGgIJBAkoBAEGHRBGAQYcDQRGCwcFSFg=
X-FEAS-Client-IP: 192.168.60.3
X-FE-Policy-ID: 2:4:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=crpt.ru; s=crpt.ru;
 c=relaxed/relaxed; 
 h=from:to:cc:subject:date:message-id:content-type:mime-version;
 bh=715d+r/USyVm9Mnb9SAlADsKO4TV4fUR/6/7FwHFdq8=;
 b=nwcHSH3FFtXmave6KkyHQ/9yrIvC/8EtpggN5T+GssfByeIpjdcHmZbmGGkAk3coSRXIpaLAyi56
 cOOwLEk1OeceHGku1U0wBLb+fTE1EFk7QZPs7l5Cf7LCpBH/VdXcu6VTQTMXKBywUVNnp+pt0IDX
 VRNvPay4omqoL/ep/w2EYNh/FVDKV50yjyhp7plXmWXTYHyzK+ZovWVTqa7pB22OgoQICkpR/oW8
 TKgsrKMotxNhCbl/CBq/odIGxKiVZBnptXIHmrk7U0pX/s1QSjJQrMroKmFiaeCpfbAq6TsQ7/07
 qHr/zOpNneehTT6Iu0AfjOJLBTGJmwEDMOHT2A==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW5kcmV5IFZhdG9yb3BpbiA8YS52YXRvcm9waW5AY3JwdC5ydT4NCg0KSWYgZmJjb25f
b3BlbigpIGZhaWxzIHdoZW4gY2FsbGVkIGZyb20gY29uMmZiX2FjcXVpcmVfbmV3aW5mbygpIHRo
ZW4NCmluZm8tPmZiY29uX3BhciBwb2ludGVyIHJlbWFpbnMgTlVMTCB3aGljaCBpcyBsYXRlciBk
ZXJlZmVyZW5jZWQuDQoNCkFkZCBjaGVjayBmb3IgcmV0dXJuIHZhbHVlIG9mIHRoZSBmdW5jdGlv
biBjb24yZmJfYWNxdWlyZV9uZXdpbmZvKCkgdG8NCmF2b2lkIGl0Lg0KDQpGb3VuZCBieSBMaW51
eCBWZXJpZmljYXRpb24gQ2VudGVyIChsaW51eHRlc3Rpbmcub3JnKSB3aXRoIFNWQUNFLg0KDQpG
aXhlczogZDFiYWE0ZmZhNjc3ICgiZmJjb246IHNldF9jb24yZmJfbWFwIGZpeGVzIikNCkNjOiBz
dGFibGVAdmdlci5rZXJuZWwub3JnDQpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgVmF0b3JvcGluIDxh
LnZhdG9yb3BpbkBjcnB0LnJ1Pg0KLS0tDQogZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29u
LmMgfCAzICsrLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jIGIvZHJp
dmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMNCmluZGV4IGU3ZTA3ZWIyMTQyZS4uNzQ1MzM3
N2YzNDMzIDEwMDY0NA0KLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMNCisr
KyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jDQpAQCAtMTA0Nyw3ICsxMDQ3LDgg
QEAgc3RhdGljIHZvaWQgZmJjb25faW5pdChzdHJ1Y3QgdmNfZGF0YSAqdmMsIGJvb2wgaW5pdCkN
CiAJCXJldHVybjsNCiANCiAJaWYgKCFpbmZvLT5mYmNvbl9wYXIpDQotCQljb24yZmJfYWNxdWly
ZV9uZXdpbmZvKHZjLCBpbmZvLCB2Yy0+dmNfbnVtKTsNCisJCWlmIChjb24yZmJfYWNxdWlyZV9u
ZXdpbmZvKHZjLCBpbmZvLCB2Yy0+dmNfbnVtKSkNCisJCQlyZXR1cm47DQogDQogCS8qIElmIHdl
IGFyZSBub3QgdGhlIGZpcnN0IGNvbnNvbGUgb24gdGhpcw0KIAkgICBmYiwgY29weSB0aGUgZm9u
dCBmcm9tIHRoYXQgY29uc29sZSAqLw0KLS0gDQoyLjQzLjANCg==
