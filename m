Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1065E2B446
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1110D89CE3;
	Mon, 27 May 2019 12:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56678982A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 16:34:35 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] backlight: pwm_bl: Set pin to sleep state when powered down
Date: Wed, 22 May 2019 18:34:28 +0200
Message-Id: <20190522163428.7078-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1558542873; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=iWtE607ygyephngrXoZlswDjPShkvMXmajkumWA4ytc=;
 b=I40kohTauhNL2B30AT1P9Ug4a/NaE5wADnGZ60YisnxmkGkNfC+9Dx6xCIvOCU1ZyozbLF
 X3SDY2ErWA4fFl/5/KgUrVVm2XaC1zKRDE5cjfqqod4x0QozBCD4QVE4BO/JnoIjOEY+/f
 cQ41nk0uQnrt9OnVFl/KdMtCERRL7zc=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiB0aGUgZHJpdmVyIHByb2JlcywgdGhlIFBXTSBwaW4gaXMgYXV0b21hdGljYWxseSBjb25m
aWd1cmVkIHRvIGl0cwpkZWZhdWx0IHN0YXRlLCB3aGljaCBzaG91bGQgYmUgdGhlICJwd20iIGZ1
bmN0aW9uLiBIb3dldmVyLCBhdCB0aGlzCnBvaW50IHdlIGRvbid0IGtub3cgdGhlIGFjdHVhbCBs
ZXZlbCBvZiB0aGUgcGluLCB3aGljaCBtYXkgYmUgYWN0aXZlIG9yCmluYWN0aXZlLiBBcyBhIHJl
c3VsdCwgaWYgdGhlIGRyaXZlciBwcm9iZXMgd2l0aG91dCBlbmFibGluZyB0aGUKYmFja2xpZ2h0
LCB0aGUgUFdNIHBpbiBtaWdodCBiZSBhY3RpdmUsIGFuZCB0aGUgYmFja2xpZ2h0IHdvdWxkIGJl
CmxpdCB3YXkgYmVmb3JlIGJlaW5nIG9mZmljaWFsbHkgZW5hYmxlZC4KClRvIHdvcmsgYXJvdW5k
IHRoaXMsIGlmIHRoZSBwcm9iZSBmdW5jdGlvbiBkb2Vzbid0IGVuYWJsZSB0aGUgYmFja2xpZ2h0
LAp0aGUgcGluIGlzIHNldCB0byBpdHMgc2xlZXAgc3RhdGUgaW5zdGVhZCBvZiB0aGUgZGVmYXVs
dCBvbmUsIHVudGlsIHRoZQpiYWNrbGlnaHQgaXMgZW5hYmxlZC4gV2hlbiB0aGUgYmFja2xpZ2h0
IGlzIGRpc2FibGVkLCB0aGUgcGluIGlzIHJlc2V0CnRvIGl0cyBzbGVlcCBzdGF0ZS4KClNpZ25l
ZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PgotLS0KIGRyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9w
d21fYmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCmluZGV4IGZiNDVmODY2
YjkyMy4uNDIyZjc5MDNiMzgyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9w
d21fYmwuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwpAQCAtMTYsNiAr
MTYsNyBAQAogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L2tlcm5l
bC5oPgogI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KKyNpbmNsdWRlIDxsaW51eC9waW5jdHJsL2Nv
bnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8
bGludXgvZmIuaD4KICNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4KQEAgLTUwLDYgKzUxLDgg
QEAgc3RhdGljIHZvaWQgcHdtX2JhY2tsaWdodF9wb3dlcl9vbihzdHJ1Y3QgcHdtX2JsX2RhdGEg
KnBiKQogCXN0cnVjdCBwd21fc3RhdGUgc3RhdGU7CiAJaW50IGVycjsKIAorCXBpbmN0cmxfcG1f
c2VsZWN0X2RlZmF1bHRfc3RhdGUocGItPmRldik7CisKIAlwd21fZ2V0X3N0YXRlKHBiLT5wd20s
ICZzdGF0ZSk7CiAJaWYgKHBiLT5lbmFibGVkKQogCQlyZXR1cm47CkBAIC05MCw2ICs5Myw4IEBA
IHN0YXRpYyB2b2lkIHB3bV9iYWNrbGlnaHRfcG93ZXJfb2ZmKHN0cnVjdCBwd21fYmxfZGF0YSAq
cGIpCiAKIAlyZWd1bGF0b3JfZGlzYWJsZShwYi0+cG93ZXJfc3VwcGx5KTsKIAlwYi0+ZW5hYmxl
ZCA9IGZhbHNlOworCisJcGluY3RybF9wbV9zZWxlY3Rfc2xlZXBfc3RhdGUocGItPmRldik7CiB9
CiAKIHN0YXRpYyBpbnQgY29tcHV0ZV9kdXR5X2N5Y2xlKHN0cnVjdCBwd21fYmxfZGF0YSAqcGIs
IGludCBicmlnaHRuZXNzKQpAQCAtNjI2LDYgKzYzMSwxMCBAQCBzdGF0aWMgaW50IHB3bV9iYWNr
bGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAliYWNrbGlnaHRfdXBk
YXRlX3N0YXR1cyhibCk7CiAKIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBibCk7CisKKwlp
ZiAoYmwtPnByb3BzLnBvd2VyID09IEZCX0JMQU5LX1BPV0VSRE9XTikKKwkJcGluY3RybF9wbV9z
ZWxlY3Rfc2xlZXBfc3RhdGUoJnBkZXYtPmRldik7CisKIAlyZXR1cm4gMDsKIAogZXJyX2FsbG9j
OgotLSAKMi4yMS4wLjU5My5nNTExZWMzNDVlMTgKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
