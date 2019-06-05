Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C1357E6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3208969E;
	Wed,  5 Jun 2019 07:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04730892C6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 07:05:44 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id a186so13590394pfa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 00:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d2izPr39F3F0VHRMOQwIEoQfvTiBqRIbKynBXN0NUa0=;
 b=OqhLEIcTuZNfEmaFGzsJZeVQlobXuhc1Rwb8qGDEHAX1yI3V+DgxHl2477SqvlQaWy
 lAli8Cz7g6wuXebroTaEjaKeTRTgRfBWlOZltzabBFY66kpxq3yQH+PbwlN4P77GSX82
 o0cfIPC1gl0kelbcRT+zMIg/2CgP6HoODNSwPhtIfds/xFjmGyuFKKU55DmaTV5zoUFX
 zRsrnthDgz14VUzbZBLOWPFBTujMq2sxSrxF6Vgg4U2r205kjvgkfIpLpefc/pMA4SiO
 /vLMHEHsgxXshknYKujh5BGi/cJJG8am5NLsd+5QRC7sHg+EhZjHNy2V5/zbpZv/EFJv
 RnJQ==
X-Gm-Message-State: APjAAAU8AJKWbB4pLhToUhRRfbOxOLkqDtB+KHLDR5hhCJWoCTzqk9C4
 6L6S9be47E93VQItlk8gkYEtQhvZtzo=
X-Google-Smtp-Source: APXvYqxifsh8LBT0sk9LAzZyDwQ07jHD8F1USZwx/MC+2mwHbldjh1VnrJKg1q3DGXF67e3q25xX8w==
X-Received: by 2002:a63:a449:: with SMTP id c9mr2466787pgp.149.1559718343138; 
 Wed, 05 Jun 2019 00:05:43 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d132sm6527348pfd.61.2019.06.05.00.05.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 00:05:42 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 13/15] drm/bridge: tc358767: Simplify tc_aux_wait_busy()
Date: Wed,  5 Jun 2019 00:05:05 -0700
Message-Id: <20190605070507.11417-14-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605070507.11417-1-andrew.smirnov@gmail.com>
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d2izPr39F3F0VHRMOQwIEoQfvTiBqRIbKynBXN0NUa0=;
 b=BySmcBdri3W99nnsQSAV43VhgYjxYbf/4s1H2Ffq8FJOzXMN069qRgTdjBnaBeXkKe
 hyOQGqkICDAwG9O/U+MqLX3sX8C5cWdggkkH5I5PUYi6ALpkAfYnyKBwfMuSGHE03tGV
 +4eS3liPY8ScJWNsOwZbtepvi9X8H/xWmeApo+/0QzjdkD2LicPI/WhnFLM5HcyS1Usd
 VEwauu6vJt8efqTX3u8HgwaXCBX2GCwjNmbwJK9jBF/7fbz6sMOz4uKZPDOAckDiw9Nc
 vCe3jvE+6mHuL+l/IW7M29zfaLOGvuWh2ajB2HcMfXGRFeXi5KKlPFWFfYAb2AZYQJdx
 8nQQ==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Archit Taneja <architt@codeaurora.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbmV2ZXIgcGFzcyBhbnl0aGluZyBidXQgMTAwIGFzIHRpbWVvdXRfbXMgdG8gdGNfYXV4X3dh
aXRfYnVzeSgpLCBzbwp3ZSBtYXkgYXMgd2VsbCBoYXJkY29kZSB0aGF0IHZhbHVlIGFuZCBzaW1w
bGlmeSBmdW5jdGlvbidzIHNpZ25hdHVyZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBTbWlybm92
IDxhbmRyZXcuc21pcm5vdkBnbWFpbC5jb20+CkNjOiBBcmNoaXQgVGFuZWphIDxhcmNoaXR0QGNv
ZGVhdXJvcmEub3JnPgpDYzogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KQ2M6
IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6
IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+CkNjOiBBbmRyZXkgR3VzYWtv
diA8YW5kcmV5Lmd1c2Frb3ZAY29nZW50ZW1iZWRkZWQuY29tPgpDYzogUGhpbGlwcCBaYWJlbCA8
cC56YWJlbEBwZW5ndXRyb25peC5kZT4KQ2M6IENvcnkgVHVzYXIgPGNvcnkudHVzYXJAemlpLmFl
cm8+CkNjOiBDaHJpcyBIZWFseSA8Y3BoZWFseUBnbWFpbC5jb20+CkNjOiBMdWNhcyBTdGFjaCA8
bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RjMzU4NzY3LmMgfCA5ICsrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXgg
YTA0NDAxY2YyYTkyLi40ZmU3NjQxZjg0ZWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMK
QEAgLTI5NCwxMCArMjk0LDkgQEAgc3RhdGljIGlubGluZSBpbnQgdGNfcG9sbF90aW1lb3V0KHN0
cnVjdCB0Y19kYXRhICp0YywgdW5zaWduZWQgaW50IGFkZHIsCiAJCQkJCXNsZWVwX3VzLCB0aW1l
b3V0X3VzKTsKIH0KIAotc3RhdGljIGludCB0Y19hdXhfd2FpdF9idXN5KHN0cnVjdCB0Y19kYXRh
ICp0YywgdW5zaWduZWQgaW50IHRpbWVvdXRfbXMpCitzdGF0aWMgaW50IHRjX2F1eF93YWl0X2J1
c3koc3RydWN0IHRjX2RhdGEgKnRjKQogewotCXJldHVybiB0Y19wb2xsX3RpbWVvdXQodGMsIERQ
MF9BVVhTVEFUVVMsIEFVWF9CVVNZLCAwLAotCQkJICAgICAgIDEwMDAsIDEwMDAgKiB0aW1lb3V0
X21zKTsKKwlyZXR1cm4gdGNfcG9sbF90aW1lb3V0KHRjLCBEUDBfQVVYU1RBVFVTLCBBVVhfQlVT
WSwgMCwgMTAwMCwgMTAwMDAwKTsKIH0KIAogc3RhdGljIGludCB0Y19hdXhfd3JpdGVfZGF0YShz
dHJ1Y3QgdGNfZGF0YSAqdGMsIGNvbnN0IHZvaWQgKmRhdGEsCkBAIC0zNzAsNyArMzY5LDcgQEAg
c3RhdGljIHNzaXplX3QgdGNfYXV4X3RyYW5zZmVyKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCiAJ
dTMyIGF1eHN0YXR1czsKIAlpbnQgcmV0OwogCi0JcmV0ID0gdGNfYXV4X3dhaXRfYnVzeSh0Yywg
MTAwKTsKKwlyZXQgPSB0Y19hdXhfd2FpdF9idXN5KHRjKTsKIAlpZiAocmV0KQogCQlyZXR1cm4g
cmV0OwogCkBAIC0zOTcsNyArMzk2LDcgQEAgc3RhdGljIHNzaXplX3QgdGNfYXV4X3RyYW5zZmVy
KHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCXJl
dCA9IHRjX2F1eF93YWl0X2J1c3kodGMsIDEwMCk7CisJcmV0ID0gdGNfYXV4X3dhaXRfYnVzeSh0
Yyk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
