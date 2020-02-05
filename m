Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1342215340E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 16:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B3589C2C;
	Wed,  5 Feb 2020 15:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB18389C2C;
 Wed,  5 Feb 2020 15:40:12 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id i126so2716620ywe.7;
 Wed, 05 Feb 2020 07:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=th/ZgWYLAtD7x9QpC0cnoR2MFKa3NkheKEaS9VVgMWk=;
 b=VSzMGAvS//PL7xbSDztFuuQWyJumKyHfkODfmCySaScTFerp8FoQrizTU+zvE48IVo
 vwfLiDQpbV7AztZ+x40kpSG+wz10cMntp0tm51gdqgy+GtJundvjaWG5yfJJi9fmfTZ0
 nqJEj73DM7sml42pHob5jnxzXvz9iGG/JSTuTZr+C0as8CvkkgdCrRTaRh02ZSpTit8I
 VgabZ38kqE/LLPDicU0xTG6c4NVOWWgh2qGGwgSFt43WRpXGZrsgzN0W4pnrYanEEJic
 09JZKWiSluIMCchQMSkoJA344MHSXWRhkTk7rMy37qTqankU4JfNFm7FdHbamQyHwQuD
 Ieew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=th/ZgWYLAtD7x9QpC0cnoR2MFKa3NkheKEaS9VVgMWk=;
 b=tqtD6cGbz3DyzMTbra8RxDpbf080XRTALwEYnAvBqsOXJ/DMzN0vn5grGPkQfSlt2N
 24rqj4U9WePObuzLYSGTsc83zhk4w+L1Ncv+yQpG0EK5LAyjsT0IWcSLcRe7jGqZm2Kn
 2vQRccI4npJpWa0S8Be7Dy6fbwxgiMyXY1a6wjDePOzx/5Ldzhqx5Rfv5cvivY4dvmo6
 wUZiKnbgnbS9an9KI9JrIQuB6ofp6r9ZNl0cNHlAkbZmMMlwScMhvZqpZR8NvuyT4MUh
 YWJpslO5JZuRLftZL/lqj2MNe995jZow4mw4cp+B39fg7inlxsvLno5iMfb6AdgiUt0F
 G+bQ==
X-Gm-Message-State: APjAAAWwM2booqx3qheIrTa6zDf0X4utC5sTzvuD78o7UGTN/AMYzrqY
 5ekR1VAvMsEQPFlQBamVOCrJhf9Z
X-Google-Smtp-Source: APXvYqwgYoSUbTgaGOYN99Mls7XwiKBAyLBwxmkMvgzlU7i7pPOMI1PJ5VLmdadkJuLN1jMOssA3ww==
X-Received: by 2002:a81:33d0:: with SMTP id z199mr11003643ywz.53.1580917211700; 
 Wed, 05 Feb 2020 07:40:11 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id q185sm61256ywh.61.2020.02.05.07.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 07:40:11 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 03/15] drm/amdgpu/pm: move debugfs init into core amdgpu
 debugfs
Date: Wed,  5 Feb 2020 10:39:48 -0500
Message-Id: <20200205154000.536145-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200205154000.536145-1-alexander.deucher@amd.com>
References: <20200205154000.536145-1-alexander.deucher@amd.com>
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gb3JkZXIgdG8gcmVtb3ZlIHRoZSBsb2FkIGFuZCB1bmxvYWQgZHJtIGNhbGxiYWNrcywKd2Ug
bmVlZCB0byByZW9yZGVyIHRoZSBpbml0IHNlcXVlbmNlIHRvIG1vdmUgYWxsIHRoZSBkcm0KZGVi
dWdmcyBmaWxlIGhhbmRsaW5nLiAgRG8gdGhpcyBmb3IgcG0uCgpBY2tlZC1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYyB8IDcgKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3BtLmMgICAgICB8IDkgKy0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcG0uaCAgICAgIHwgMiArKwogMyBmaWxlcyBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGVidWdmcy5jCmluZGV4IGY0OTYwNGMwZDBiOC4uYzFkNjZjYzZlNmQ4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKQEAgLTMxLDYgKzMx
LDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2RlYnVnZnMuaD4KIAogI2luY2x1ZGUgImFtZGdwdS5o
IgorI2luY2x1ZGUgImFtZGdwdV9wbS5oIgogCiAvKioKICAqIGFtZGdwdV9kZWJ1Z2ZzX2FkZF9m
aWxlcyAtIEFkZCBzaW1wbGUgZGVidWdmcyBlbnRyaWVzCkBAIC0xMjM0LDYgKzEyMzUsMTIgQEAg
aW50IGFtZGdwdV9kZWJ1Z2ZzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCXJl
dHVybiByOwogCX0KIAorCXIgPSBhbWRncHVfZGVidWdmc19wbV9pbml0KGFkZXYpOworCWlmIChy
KSB7CisJCURSTV9FUlJPUigiRmFpbGVkIHRvIHJlZ2lzdGVyIGRlYnVnZnMgZmlsZSBmb3IgZHBt
IVxuIik7CisJCXJldHVybiByOworCX0KKwogCXJldHVybiBhbWRncHVfZGVidWdmc19hZGRfZmls
ZXMoYWRldiwgYW1kZ3B1X2RlYnVnZnNfbGlzdCwKIAkJCQkJQVJSQVlfU0laRShhbWRncHVfZGVi
dWdmc19saXN0KSk7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jCmluZGV4
IGIwM2IxZWI3YmEwNC4uYmMzY2YwNGExYTk0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcG0uYwpAQCAtNDEsOCArNDEsNiBAQAogI2luY2x1ZGUgImh3bWdyLmgiCiAjZGVmaW5l
IFdJRFRIXzRLIDM4NDAKIAotc3RhdGljIGludCBhbWRncHVfZGVidWdmc19wbV9pbml0KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KTsKLQogc3RhdGljIGNvbnN0IHN0cnVjdCBjZ19mbGFnX25h
bWUgY2xvY2tzW10gPSB7CiAJe0FNRF9DR19TVVBQT1JUX0dGWF9NR0NHLCAiR3JhcGhpY3MgTWVk
aXVtIEdyYWluIENsb2NrIEdhdGluZyJ9LAogCXtBTURfQ0dfU1VQUE9SVF9HRlhfTUdMUywgIkdy
YXBoaWNzIE1lZGl1bSBHcmFpbiBtZW1vcnkgTGlnaHQgU2xlZXAifSwKQEAgLTMzOTgsMTEgKzMz
OTYsNiBAQCBpbnQgYW1kZ3B1X3BtX3N5c2ZzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAJCURSTV9FUlJPUigiZmFpbGVkIHRvIGNyZWF0ZSBkZXZpY2UgZmlsZSB1bmlxdWVfaWRc
biIpOwogCQlyZXR1cm4gcmV0OwogCX0KLQlyZXQgPSBhbWRncHVfZGVidWdmc19wbV9pbml0KGFk
ZXYpOwotCWlmIChyZXQpIHsKLQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gcmVnaXN0ZXIgZGVidWdm
cyBmaWxlIGZvciBkcG0hXG4iKTsKLQkJcmV0dXJuIHJldDsKLQl9CiAKIAlpZiAoKGFkZXYtPmFz
aWNfdHlwZSA+PSBDSElQX1ZFR0ExMCkgJiYKIAkgICAgIShhZGV2LT5mbGFncyAmIEFNRF9JU19B
UFUpKSB7CkBAIC0zNjY5LDcgKzM2NjIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9pbmZv
X2xpc3QgYW1kZ3B1X3BtX2luZm9fbGlzdFtdID0gewogfTsKICNlbmRpZgogCi1zdGF0aWMgaW50
IGFtZGdwdV9kZWJ1Z2ZzX3BtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCitpbnQg
YW1kZ3B1X2RlYnVnZnNfcG1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKICNp
ZiBkZWZpbmVkKENPTkZJR19ERUJVR19GUykKIAlyZXR1cm4gYW1kZ3B1X2RlYnVnZnNfYWRkX2Zp
bGVzKGFkZXYsIGFtZGdwdV9wbV9pbmZvX2xpc3QsIEFSUkFZX1NJWkUoYW1kZ3B1X3BtX2luZm9f
bGlzdCkpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bt
LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uaAppbmRleCAzZGExZGEy
Nzc4MDUuLjVkYjBlZjg2ZTg0YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3BtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bt
LmgKQEAgLTQzLDQgKzQzLDYgQEAgdm9pZCBhbWRncHVfZHBtX2VuYWJsZV91dmQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgZW5hYmxlKTsKIHZvaWQgYW1kZ3B1X2RwbV9lbmFibGVf
dmNlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBib29sIGVuYWJsZSk7CiB2b2lkIGFtZGdw
dV9kcG1fZW5hYmxlX2pwZWcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgZW5hYmxl
KTsKIAoraW50IGFtZGdwdV9kZWJ1Z2ZzX3BtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpOworCiAjZW5kaWYKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
