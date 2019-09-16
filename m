Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6F6B3D73
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 17:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF3F6E9A5;
	Mon, 16 Sep 2019 15:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E726E2BD;
 Mon, 16 Sep 2019 15:18:03 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id i16so206703wmd.3;
 Mon, 16 Sep 2019 08:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RjgDEfdLgMyuN2g1Ild8TdSds5/Lvp2NHhf+pznFLPk=;
 b=Dt6vbXPaQTrm45KyFyOv2GPAdmbSJ5Rb6r5A7MeMA0ECPsdLQbxJeKq4yThkvOKqGz
 0Ayt6dAs8vaRxJZm2s4sHeuBnIS3tyt7INY618rgH7/XWmWjb9tcm3l8HwVrruJ38SkB
 PU3/wYDCSScnwRfdBiWs4/+1mzmP/O4L90WNnJ77EUGk9hP6tjzBmwOzncb97/mKA7cn
 V91I3DcywjLHnN6VsCuRfRLfk1v52K5xs+KewfaUtyo0iflhvyRMjg5ikMhnkFCnKpVw
 wfJNzkyPDNPgIO3/WGeWVnaohzRSo46cP0DHU3tDuIhUQmSkk9u7LfVGyIB8mzcEs+Ng
 pHcQ==
X-Gm-Message-State: APjAAAXIRN5k4HrRNVDkiqe081SGaW+m47zxnSbQeMxruF1CXEsHK4RL
 h1gYUIuDySCbmzSbwn46JaUte8UN
X-Google-Smtp-Source: APXvYqx2bIrB9g4+RoE+ZdJ2xNlAQpim14ZZv97NAJZweRIDNO7XKe7LfI9POR4uIcuy2K90Y3J4ng==
X-Received: by 2002:a1c:5451:: with SMTP id p17mr42881wmi.103.1568647081746;
 Mon, 16 Sep 2019 08:18:01 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id z189sm170226wmc.25.2019.09.16.08.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 08:18:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 1/6] drm/nouveau: fault: Store aperture in fault information
Date: Mon, 16 Sep 2019 17:17:52 +0200
Message-Id: <20190916151757.10953-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916151757.10953-1-thierry.reding@gmail.com>
References: <20190916151757.10953-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RjgDEfdLgMyuN2g1Ild8TdSds5/Lvp2NHhf+pznFLPk=;
 b=mQELYYhSmLhlHUxrvccR24nojY0OIiDnK7TPcf8nbekuv0rqz/o+wJBhUnhZ0Ne0UA
 LIcLaKS1YaVjHCAHO73lCE7XnFZg7AmAfzhcdi8mvykNyUmtEFD9PMPRPMpxP8irRnLn
 rO2h1Fz47lPvZw6KF3izT7GOkgS5Y9Wu0mzeYn0jrb1CFVoGk6G7csmGF6gcmwIVihwa
 +oV+FpAsgpa9DSA4jxSt9iveIJ71iUAB3hy4dTWMSSX/i+Ax3Fuk3CDjy3YbvtB406Fd
 zokmrV0OOmn0bXVj/6hbC+DwuZCMaERCxPDBduZlN3Fw1jBBe6ywU/HPC3Hpq2ZrdFIf
 sSOQ==
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBmYXVsdCBpbmZv
cm1hdGlvbiByZWdpc3RlciBjb250YWlucyBkYXRhIGFib3V0IHRoZSBhcGVydHVyZSB0aGF0CmNh
dXNlZCB0aGUgZmFpbHVyZS4gVGhpcyBjYW4gYmUgdXNlZnVsIGluIGRlYnVnZ2luZyBhcGVydHVy
ZSByZWxhdGVkCnByb2dyYW1taW5nIGJ1Z3MuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGlu
ZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2luY2x1
ZGUvbnZrbS9zdWJkZXYvZmF1bHQuaCB8IDEgKwogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZr
bS9lbmdpbmUvZmlmby9nazEwNC5jICAgIHwgMyArKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L252a20vc3ViZGV2L2ZhdWx0L2d2MTAwLmMgICB8IDEgKwogMyBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2ZhdWx0LmggYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2ZhdWx0LmgKaW5kZXggOTczMjJmOTViM2VlLi4xY2M4
NjJiYzExMjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZr
bS9zdWJkZXYvZmF1bHQuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9pbmNsdWRlL252
a20vc3ViZGV2L2ZhdWx0LmgKQEAgLTIxLDYgKzIxLDcgQEAgc3RydWN0IG52a21fZmF1bHRfZGF0
YSB7CiAJdTY0ICBhZGRyOwogCXU2NCAgaW5zdDsKIAl1NjQgIHRpbWU7CisJdTggYXBlcnR1cmU7
CiAJdTggZW5naW5lOwogCXU4ICB2YWxpZDsKIAl1OCAgICBncGM7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9maWZvL2drMTA0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9maWZvL2drMTA0LmMKaW5kZXggNWQ0YjY5NWNhYjhl
Li44MWNiZTFjYzQ4MDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
ZW5naW5lL2ZpZm8vZ2sxMDQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2Vu
Z2luZS9maWZvL2drMTA0LmMKQEAgLTUxOSw5ICs1MTksMTAgQEAgZ2sxMDRfZmlmb19mYXVsdChz
dHJ1Y3QgbnZrbV9maWZvICpiYXNlLCBzdHJ1Y3QgbnZrbV9mYXVsdF9kYXRhICppbmZvKQogCWNo
YW4gPSBudmttX2ZpZm9fY2hhbl9pbnN0X2xvY2tlZCgmZmlmby0+YmFzZSwgaW5mby0+aW5zdCk7
CiAKIAludmttX2Vycm9yKHN1YmRldiwKLQkJICAgImZhdWx0ICUwMnggWyVzXSBhdCAlMDE2bGx4
IGVuZ2luZSAlMDJ4IFslc10gY2xpZW50ICUwMnggIgorCQkgICAiZmF1bHQgJTAyeCBbJXNdIGF0
ICUwMTZsbHggYXBlcnR1cmUgJTAyeCBlbmdpbmUgJTAyeCBbJXNdIGNsaWVudCAlMDJ4ICIKIAkJ
ICAgIlslcyVzXSByZWFzb24gJTAyeCBbJXNdIG9uIGNoYW5uZWwgJWQgWyUwMTBsbHggJXNdXG4i
LAogCQkgICBpbmZvLT5hY2Nlc3MsIGVhID8gZWEtPm5hbWUgOiAiIiwgaW5mby0+YWRkciwKKwkJ
ICAgaW5mby0+YXBlcnR1cmUsCiAJCSAgIGluZm8tPmVuZ2luZSwgZWUgPyBlZS0+bmFtZSA6IGVu
LAogCQkgICBpbmZvLT5jbGllbnQsIGN0LCBlYyA/IGVjLT5uYW1lIDogIiIsCiAJCSAgIGluZm8t
PnJlYXNvbiwgZXIgPyBlci0+bmFtZSA6ICIiLCBjaGFuID8gY2hhbi0+Y2hpZCA6IC0xLApkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmF1bHQvZ3YxMDAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZhdWx0L2d2MTAwLmMKaW5k
ZXggNjc0N2YwOWMyZGMzLi5iNWUzMjI5NTIzN2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252a20vc3ViZGV2L2ZhdWx0L2d2MTAwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbnZrbS9zdWJkZXYvZmF1bHQvZ3YxMDAuYwpAQCAtMTM4LDYgKzEzOCw3IEBAIGd2
MTAwX2ZhdWx0X2ludHJfZmF1bHQoc3RydWN0IG52a21fZmF1bHQgKmZhdWx0KQogCWluZm8uaW5z
dCA9ICgodTY0KWluc3RoaSA8PCAzMikgfCAoaW5mbzAgJiAweGZmZmZmMDAwKTsKIAlpbmZvLnRp
bWUgPSAwOwogCWluZm8uZW5naW5lID0gKGluZm8wICYgMHgwMDAwMDBmZik7CisJaW5mby5hcGVy
dHVyZSA9IChpbmZvMCAmIDB4MDAwMDBjMDApID4+IDEwOwogCWluZm8udmFsaWQgID0gKGluZm8x
ICYgMHg4MDAwMDAwMCkgPj4gMzE7CiAJaW5mby5ncGMgICAgPSAoaW5mbzEgJiAweDFmMDAwMDAw
KSA+PiAyNDsKIAlpbmZvLmh1YiAgICA9IChpbmZvMSAmIDB4MDAxMDAwMDApID4+IDIwOwotLSAK
Mi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
