Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9536AD14
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 18:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6C989F4A;
	Tue, 16 Jul 2019 16:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7743289F4A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 16:47:15 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id b7so10410141pls.6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 09:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AsJY7Tj55Ay2SJtdNoNPmO3/SlrZD7SizoCm9UXpp50=;
 b=Ue4IociPlOka+I8SIJzVPpUTEGzAsqJ6//aU2wmjFIOOdvHjHW4MUOEYdSE/vzhe+m
 UgoBpEhcWDwUFu0iTg1Q5MeEh63cw0irmK2ZuHdOhKuD6ioFaMjU6/1L4+Cz+vkuoeK6
 3CISft0B6AxK9dZ0SqcQ3MA6tvPpzbEA/QEfE73JiS+oNWIvQfuawhQ3i9cKMC95jJfD
 NoZcQaYEGX+hX66Up06gfpCTwXdYjOKNA4m7xFZYNP5qPcR2+Utywv2teZSZcq7BI2eP
 VYytbCXO/I69CaPaFV6pGbyy4gYYqBv8LU/YQjRvsN8NQQKz7Xp+Qf895Tv/bmAsRD7i
 kkng==
X-Gm-Message-State: APjAAAUq98AeL9GEpC50DHtj7j1WxkmEldIHbWeOX4kID2ZkO+dB3qr7
 TChpGsDFlmBNzwUBFV5nd3TRgu0ETDk=
X-Google-Smtp-Source: APXvYqxx58u4o7rwwUHy17q7VwUZtLQpEcWyLBBigW/uYXoO5pGow+PXNKPST0LfhDn2AXvduU0srQ==
X-Received: by 2002:a17:902:4c88:: with SMTP id
 b8mr38198430ple.29.1563295634805; 
 Tue, 16 Jul 2019 09:47:14 -0700 (PDT)
Received: from localhost ([100.118.89.203])
 by smtp.gmail.com with ESMTPSA id r18sm5762642pfg.77.2019.07.16.09.47.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 09:47:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/vgem: use normal cached mmap'ings
Date: Tue, 16 Jul 2019 09:42:15 -0700
Message-Id: <20190716164221.15436-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190716164221.15436-1-robdclark@gmail.com>
References: <20190716164221.15436-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AsJY7Tj55Ay2SJtdNoNPmO3/SlrZD7SizoCm9UXpp50=;
 b=ZJgOo0aPZ5O0N0+21Je0obxlaf1FaJT3cv7gM8x1kbGuErDXE66IS718/79YsniIMC
 JkD/a0C49E5DiaULB8NAGz4S8hPSyLvlkfCyBR7L5Xdq9pKY3cfBJvxR5rQdH8CN4jfd
 096nCgykKR1hJHdZbXuaIiOxaH27fAm8d/X9StbT12ZzEGLrr0xKC8aASBB96Bhognyl
 bDN4tz6wkQGm8j6sSVSyUXAscYYPe1TAr3OLWP86ylZATpU/Tpg4DrRWGW9MWZvLCPwf
 oix5USpYNgIvTdqTjiHeFgb0dy1CSLYzgmAFpEKV0mYWVBjVSG9xTZFdFU6t78mAMUeL
 JpBw==
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
Cc: Rob Clark <robdclark@chromium.org>, Deepak Sharma <deepak.sharma@amd.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Eric Biggers <ebiggers@google.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKU2luY2UgdGhlcmUgaXMg
bm8gcmVhbCBkZXZpY2UgYXNzb2NpYXRlZCB3aXRoIHZnZW0sIGl0IGlzIGltcG9zc2libGUgdG8K
ZW5kIHVwIHdpdGggYXBwcm9wcmlhdGUgZGV2LT5kbWFfb3BzLCBtZWFuaW5nIHRoYXQgd2UgaGF2
ZSBubyB3YXkgdG8KaW52YWxpZGF0ZSB0aGUgc2htZW0gcGFnZXMgYWxsb2NhdGVkIGJ5IHZnZW0u
ICBTbywgYXQgbGVhc3Qgb24gcGxhdGZvcm1zCndpdGhvdXQgZHJtX2NmbHVzaF9wYWdlcygpLCB3
ZSBlbmQgdXAgd2l0aCBjb3JydXB0aW9uIHdoZW4gY2FjaGUgbGluZXMKZnJvbSBwcmV2aW91cyB1
c2FnZSBvZiB2Z2VtIGJvIHBhZ2VzIGdldCBldmljdGVkIHRvIG1lbW9yeS4KClRoZSBvbmx5IHNh
bmUgb3B0aW9uIGlzIHRvIHVzZSBjYWNoZWQgbWFwcGluZ3MuCgpTaWduZWQtb2ZmLWJ5OiBSb2Ig
Q2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Ci0tLQpQb3NzaWJseSB3ZSBjb3VsZCBkbWFf
c3luY18qX2Zvcl97ZGV2aWNlLGNwdX0oKSBvbiBkbWFidWYgYXR0YWNoL2RldGFjaCwKYWx0aG91
Z2ggdGhlIC0+Z2VtX3ByaW1lX3twaW4sdW5waW59KCkgQVBJIGlzbid0IHF1aXRlIGlkZWFsIGZv
ciB0aGF0IGFzCml0IGlzLiAgQW5kIHRoYXQgZG9lc24ndCByZWFsbHkgaGVscCBmb3IgZHJpdmVy
cyB0aGF0IGRvbid0IGF0dGFjaC8KZGV0YWNoIGZvciBlYWNoIHVzZS4KCkJ1dCBBRkFJQ1Qgdmdl
bSBpcyBtYWlubHkgdXNlZCBmb3IgZG1hYnVmIHRlc3RpbmcsIHNvIG1heWJlIHdlIGRvbid0Cm5l
ZWQgdG8gY2FyZSB0b28gbXVjaCBhYm91dCB1c2Ugb2YgY2FjaGVkIG1tYXAnaW5ncy4KCiBkcml2
ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jIHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92Z2VtL3ZnZW1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jCmlu
ZGV4IDExYThmOTliYTE4Yy4uY2NmMGMzZmJkNTg2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdmdlbS92Z2VtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMK
QEAgLTI1OSw5ICsyNTksNiBAQCBzdGF0aWMgaW50IHZnZW1fbW1hcChzdHJ1Y3QgZmlsZSAqZmls
cCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsK
IAotCS8qIEtlZXAgdGhlIFdDIG1tYXBpbmcgc2V0IGJ5IGRybV9nZW1fbW1hcCgpIGJ1dCBvdXIg
cGFnZXMKLQkgKiBhcmUgb3JkaW5hcnkgYW5kIG5vdCBzcGVjaWFsLgotCSAqLwogCXZtYS0+dm1f
ZmxhZ3MgPSBmbGFncyB8IFZNX0RPTlRFWFBBTkQgfCBWTV9ET05URFVNUDsKIAlyZXR1cm4gMDsK
IH0KQEAgLTM4Miw3ICszNzksNyBAQCBzdGF0aWMgdm9pZCAqdmdlbV9wcmltZV92bWFwKHN0cnVj
dCBkcm1fZ2VtX29iamVjdCAqb2JqKQogCWlmIChJU19FUlIocGFnZXMpKQogCQlyZXR1cm4gTlVM
TDsKIAotCXJldHVybiB2bWFwKHBhZ2VzLCBuX3BhZ2VzLCAwLCBwZ3Byb3Rfd3JpdGVjb21iaW5l
KFBBR0VfS0VSTkVMKSk7CisJcmV0dXJuIHZtYXAocGFnZXMsIG5fcGFnZXMsIDAsIFBBR0VfS0VS
TkVMKTsKIH0KIAogc3RhdGljIHZvaWQgdmdlbV9wcmltZV92dW5tYXAoc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmosIHZvaWQgKnZhZGRyKQpAQCAtNDExLDcgKzQwOCw3IEBAIHN0YXRpYyBpbnQg
dmdlbV9wcmltZV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLAogCWZwdXQodm1hLT52
bV9maWxlKTsKIAl2bWEtPnZtX2ZpbGUgPSBnZXRfZmlsZShvYmotPmZpbHApOwogCXZtYS0+dm1f
ZmxhZ3MgfD0gVk1fRE9OVEVYUEFORCB8IFZNX0RPTlREVU1QOwotCXZtYS0+dm1fcGFnZV9wcm90
ID0gcGdwcm90X3dyaXRlY29tYmluZSh2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MpKTsK
Kwl2bWEtPnZtX3BhZ2VfcHJvdCA9IHZtX2dldF9wYWdlX3Byb3Qodm1hLT52bV9mbGFncyk7CiAK
IAlyZXR1cm4gMDsKIH0KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
