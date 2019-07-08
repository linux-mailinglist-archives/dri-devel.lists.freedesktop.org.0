Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5717A6201F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 16:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5866689DA6;
	Mon,  8 Jul 2019 14:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B73289DA6;
 Mon,  8 Jul 2019 14:11:25 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Mx0VH-1ih8Qe1h99-00ySN3; Mon, 08 Jul 2019 16:11:19 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] amdgpu: fix warning about misplaced initializers
Date: Mon,  8 Jul 2019 16:11:06 +0200
Message-Id: <20190708141117.1466888-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Riw7pyi5fcHlFYgLggi5fT891CARP6ay/3Mzo3v4QtTa3qKzhQL
 AQJ5rjrUB+ksQGEJNzGPSGY7yey1IZtuSLtkqHiHYkZZHHBjhihEsGvdLsAuTFIdsn/oxzu
 nq4sGwyPUsnY4YgfBmWzhwKz+kmnJCA+z8nBP0iM5TttL8c2eVGLIaz+ghEYdtZlgSO8U+o
 E06XZtUGrB9dO+gikaOTQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fbwEaYXrfiE=:z53MLd0Y/hSMEKZsD0Sie0
 sRZ863E1F83owcszbx/t58wXHyeQ6pp5Tlg2GQII6QloINaPdTd0oaEbdF8lUbhIEA9rCI8sx
 lnDbMzc8cl7jz8aAFbx8t7dznlvqsaABgwe/pOcqFsRJu3PmHNudN54+HrmnFI1XfFB/r4uVI
 LtOoKxm6aEMdIrtAL8xCgXg42LmsiFZ4SvL0KxcCZrKQl96EotWj4LmiN0cevwUSSUylS4hb2
 yQQaeYKMi1RJcKWGeQYpPORmgX/CIeMwbUExQMeCsEpeb5yzKUx50boK3bSqTNNZ1E3PgduYL
 lVE1jAFMh2M/RDAOrDclN07mjq3Ui3F5FYCITaiKFk9ioKso03vvNtCsPC448ruep2SwwzBWS
 5FOtJhfXxHljhx3hTD4JgX0ScPUSAzjRk/Iloymuz2gpHOp1kW1wOP0YTRrN1D2mUEhj1tcpE
 xbAYfXORYm0EgoKTwFQxYWox/YmAAFDym8GE0IFuq4REEqFPEIfSaykWyuu0S9zcvWj9f2NE+
 kyryAoGZRaswOEtF0yu3igVAaasJHnSN2DHeopqwDTBoPoDJQQ36acpV9iW29cdDzHOmET7Y9
 tUEHHWa4yNVcH51K4IAL5hndtUReNt/Rii5CG19WTu1QPNLcuZ1BW1oY2XYb1jGQaUWMs78wN
 ZGHnXeoSmwOyOJOGtFx7bUAlwlBgeDqh0J1UxViQPxxaI+a6AuzOsEYzZxlIQX9I/IYNR8FkC
 amQgy5tB2Rs7+Rkvq8MViI6LV5JEXrM9i4+7xA==
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
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Wang <kevin1.wang@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Kenneth Feng <kenneth.feng@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG5hdmkxMF9wcHQgY29kZSBjb250YWlucyB0d28gaW5zdGFuY2VzIG9mIGFuIGluY29ycmVj
dCBzdHJ1Y3QgaW5pdGlhbGl6ZXI6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dl
cnBsYXkvbmF2aTEwX3BwdC5jOjYwMTozMzogZXJyb3I6IHN1Z2dlc3QgYnJhY2VzIGFyb3VuZCBp
bml0aWFsaXphdGlvbiBvZiBzdWJvYmplY3QKICAgICAgWy1XZXJyb3IsLVdtaXNzaW5nLWJyYWNl
c10KICAgICAgICBzdGF0aWMgU211TWV0cmljc190IG1ldHJpY3MgPSB7MH07CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAge30KZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L25h
dmkxMF9wcHQuYzo5MDU6MjY6IGVycm9yOiBzdWdnZXN0IGJyYWNlcyBhcm91bmQgaW5pdGlhbGl6
YXRpb24gb2Ygc3Vib2JqZWN0CiAgICAgIFstV2Vycm9yLC1XbWlzc2luZy1icmFjZXNdCiAgICAg
ICAgU211TWV0cmljc190IG1ldHJpY3MgPSB7MH07CiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXgoKU2V0dGluZyBpdCB0byB7fSBpbnN0ZWFkIG9mIHswfSBpcyBjb3JyZWN0IGFuZCBt
b3JlIHBvcnRhYmxlIGhlcmUuCgpGaXhlczogYWI0M2M0YmYxY2M4ICgiZHJtL2FtZC9wb3dlcnBs
YXk6IGZpeCBmYW4gc3BlZWQgc2hvdyBlcnJvciAoZm9yIGh3bW9uIHB3bSkiKQpGaXhlczogOThl
MWE1NDNjN2IxICgiZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBmdW5jdGlvbiBnZXQgY3VycmVudCBj
bG9jayBmcmVxIGludGVyZmFjZSBmb3IgbmF2aTEwIikKU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
bmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
CmluZGV4IGZkY2VhMmI5NDRhYi4uY2UxZGE5ZTZlMWJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC02MDYsNyArNjA2LDcgQEAgc3RhdGljIGludCBu
YXZpMTBfZ2V0X2N1cnJlbnRfY2xrX2ZyZXFfYnlfdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUsCiAJCQkJICAgICAgIGVudW0gc211X2Nsa190eXBlIGNsa190eXBlLAogCQkJCSAgICAgICB1
aW50MzJfdCAqdmFsdWUpCiB7Ci0Jc3RhdGljIFNtdU1ldHJpY3NfdCBtZXRyaWNzID0gezB9Owor
CXN0YXRpYyBTbXVNZXRyaWNzX3QgbWV0cmljcyA9IHt9OwogCWludCByZXQgPSAwLCBjbGtfaWQg
PSAwOwogCiAJaWYgKCF2YWx1ZSkKQEAgLTk1Nyw3ICs5NTcsNyBAQCBzdGF0aWMgYm9vbCBuYXZp
MTBfaXNfZHBtX3J1bm5pbmcoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAKIHN0YXRpYyBpbnQg
bmF2aTEwX2dldF9mYW5fc3BlZWQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQxNl90ICp2
YWx1ZSkKIHsKLQlTbXVNZXRyaWNzX3QgbWV0cmljcyA9IHswfTsKKwlTbXVNZXRyaWNzX3QgbWV0
cmljcyA9IHt9OwogCWludCByZXQgPSAwOwogCiAJaWYgKCF2YWx1ZSkKLS0gCjIuMjAuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
