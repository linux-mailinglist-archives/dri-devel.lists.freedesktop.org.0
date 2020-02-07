Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7FA155EDE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 20:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5F26FD84;
	Fri,  7 Feb 2020 19:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3E86FD7F;
 Fri,  7 Feb 2020 19:51:15 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d9so270015qte.12;
 Fri, 07 Feb 2020 11:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a/BMDiqhoEnI0+MK5kOQbygtLUupSGYKuie/3X93O2U=;
 b=gcvGazhIJHtvRAG65KH84s2DnIP+lIBKG2rmRvuJMwYbcPFNLqXTB7jxQvJhETtjna
 kbWbwFguMI5JLL2XzJGSMvfTjJixJrBKNy65rO1w4jIfTPcC5hLnQ4xQRSH01sXhJOnL
 gECpYe69qXq82M/feRnKHBhmtuM0fx198JWoPSA4dZLPO3mQy+l3qKuqOcT4uCUybDRh
 iT1MMRS2TPa67ERcuju4wh1ZHBD8gVylrEtv6crlpCLLACHj7H/R/SB/QGlY7oKgEw8i
 /gugSqcElvYIylVESqvwCShvKoQ57qEv76McJhntlfkPdfHvcw6aG3mVIjKD7JPHxAzj
 rm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a/BMDiqhoEnI0+MK5kOQbygtLUupSGYKuie/3X93O2U=;
 b=eiF3iSvr4LyAAEFM/ka1AMgrvlJa7946z3dT/NIwb2PCG9mL6b36p+RACf84BD/rLR
 F3kS+d7OgsHC4Nsojfec32gvZbRPSPudl4qbuHqXCDfMPH8mSfpRoFL1LtjHSgYpw2H7
 O/u/nSq7PuOkCQx/mInMC+9rSFmttKAM+CzppkYralGP0JHAHcwRSnYpDiJhOlyyZu2R
 KEmLRJQ/9mgF97FNLxcQzbnymmC3zJMFEJRCYO7uGcx7pLe3YAlXKCjciMlp+zlkm06S
 nAMz0+FoTCDg6poly5BhZ+rff2vtQ0Df9NbXSM9dbyrtqRC/0Ld5Jgm2Icgeqhjma2T8
 +T6Q==
X-Gm-Message-State: APjAAAXvlKofoetWwRCic0/GNPHL7i0NGF5chu+Zcai+zKy/K6smKNF8
 BkHzR7qunWlZR8O4N7ABkuFSGfka
X-Google-Smtp-Source: APXvYqx4lNwPhHjvDgbyj0a1AEG6sY5YOl5VqwwYKHkRePM2oddWriRhDYWdB1p9Y4ImixWRE1B4yg==
X-Received: by 2002:ac8:1e08:: with SMTP id n8mr462183qtl.175.1581105074423;
 Fri, 07 Feb 2020 11:51:14 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id w16sm1752226qkj.135.2020.02.07.11.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 11:51:13 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/15] drm/amdgpu: don't call drm_connector_register for
 non-MST ports
Date: Fri,  7 Feb 2020 14:50:52 -0500
Message-Id: <20200207195058.2354-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207195058.2354-1-alexander.deucher@amd.com>
References: <20200207195058.2354-1-alexander.deucher@amd.com>
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

VGhlIGNvcmUgZG9lcyB0aGlzIGZvciB1cyBub3cuCgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Nvbm5lY3RvcnMuYyAgICB8IDEgLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZGNlX3ZpcnR1YWwuYyAgICAgICAgICB8IDEgLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDEgLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9j
b25uZWN0b3JzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY29ubmVjdG9y
cy5jCmluZGV4IGE2MmNiYzgxOTlkZS4uZWMxNTAxZTNhNjNhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY29ubmVjdG9ycy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jb25uZWN0b3JzLmMKQEAgLTE5MzEsNyArMTkzMSw2IEBA
IGFtZGdwdV9jb25uZWN0b3JfYWRkKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQljb25u
ZWN0b3ItPnBvbGxlZCA9IERSTV9DT05ORUNUT1JfUE9MTF9IUEQ7CiAKIAljb25uZWN0b3ItPmRp
c3BsYXlfaW5mby5zdWJwaXhlbF9vcmRlciA9IHN1YnBpeGVsX29yZGVyOwotCWRybV9jb25uZWN0
b3JfcmVnaXN0ZXIoY29ubmVjdG9yKTsKIAogCWlmIChoYXNfYXV4KQogCQlhbWRncHVfYXRvbWJp
b3NfZHBfYXV4X2luaXQoYW1kZ3B1X2Nvbm5lY3Rvcik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9kY2VfdmlydHVhbC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZGNlX3ZpcnR1YWwuYwppbmRleCBlNGY5NDg2MzMzMmMuLjNjOWYyZDI0OTBhNSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3ZpcnR1YWwuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdmlydHVhbC5jCkBAIC02MDksNyArNjA5LDYgQEAg
c3RhdGljIGludCBkY2VfdmlydHVhbF9jb25uZWN0b3JfZW5jb2Rlcl9pbml0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LAogCWNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLnN1YnBpeGVsX29yZGVy
ID0gU3ViUGl4ZWxIb3Jpem9udGFsUkdCOwogCWNvbm5lY3Rvci0+aW50ZXJsYWNlX2FsbG93ZWQg
PSBmYWxzZTsKIAljb25uZWN0b3ItPmRvdWJsZXNjYW5fYWxsb3dlZCA9IGZhbHNlOwotCWRybV9j
b25uZWN0b3JfcmVnaXN0ZXIoY29ubmVjdG9yKTsKIAogCS8qIGxpbmsgdGhlbSAqLwogCWRybV9j
b25uZWN0b3JfYXR0YWNoX2VuY29kZXIoY29ubmVjdG9yLCBlbmNvZGVyKTsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IGJkNzk4
YjZiZGYwZi4uNTAxMzdkZjljZGFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTU4MzksNyArNTgzOSw2IEBAIHN0YXRpYyBp
bnQgYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2Vy
ICpkbSwKIAlkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKAogCQkmYWNvbm5lY3Rvci0+YmFz
ZSwgJmFlbmNvZGVyLT5iYXNlKTsKIAotCWRybV9jb25uZWN0b3JfcmVnaXN0ZXIoJmFjb25uZWN0
b3ItPmJhc2UpOwogI2lmIGRlZmluZWQoQ09ORklHX0RFQlVHX0ZTKQogCWNvbm5lY3Rvcl9kZWJ1
Z2ZzX2luaXQoYWNvbm5lY3Rvcik7CiAJYWNvbm5lY3Rvci0+ZGVidWdmc19kcGNkX2FkZHJlc3Mg
PSAwOwotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
