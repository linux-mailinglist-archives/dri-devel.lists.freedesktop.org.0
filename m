Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 268BA2222DD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 14:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF17C6E2EC;
	Thu, 16 Jul 2020 12:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D4F6EC52
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 12:50:45 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g75so10178344wme.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 05:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MVt2UIP9z62sIXejPtAZcSw37yhcfnBWkAmW3FivEeA=;
 b=AW/huOfSPeOD0OSs/yEe+txByn/6DykdE6z+LT2LlxV4//EnKvijLvt8GAEynEP3QN
 MhPAFlI2Ysw8cZ6niHaVpOOzeQv4PtTsW0kA4xD0jbRtfgTZG1QKVytjGIzaX0Tr3Cip
 CNvk7f4JJYI6dUsgxztzf2UxCwUBkaeeRUPMVRR+diVppYwKGXpiJTNvPQ3UVVuQqYwe
 S888ImcfCBN24XVeS7Uo1WZ9sdYtLq8HWxoqY6SBrnKVby1ou98Q4ZXYFcvz6SFSMAN1
 qjFfQYOW+WpVlGNIC3a6pfFlO3Ex4QtnDtU3euzIEiwmcoU+TjfNLgDxhZDD1vs5tWvg
 gm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MVt2UIP9z62sIXejPtAZcSw37yhcfnBWkAmW3FivEeA=;
 b=NZSGV2SvRvP0tIWH/nP5Tl0jZgcL03R/1jfmWl1L1Yw6KHkhrGF781h+bUNKwzNjEY
 taAIiNNlyFjDjAfdFEG05ZvvwdF7tkxVbsHV4c7lkqvd8tgnzE5hJeJG2AQqtJOIVs+S
 9QJT1ZFAx/ereaAVCJb4/1sasvr2zmf2pY+TTS4zGZBeOfs4xPxP1PbKsYIbii9JfKBL
 K5a5ZM8f31W/5CSBJBuu5Y5mBWJQ3nNYbr2N3cXzEJR8svMUnR0MYJL1PkGrJdqpEiBN
 RcRu4jKB20AtvWyJQDFJbkEWMiseX/oIYG1chHbg+gkjI+skETdGqwbaPPhVWEd5P+s7
 64aA==
X-Gm-Message-State: AOAM5325M95tajK4FXJQg12oGujZ5Gkfcfp2nhXg00pmEbd9sHmOEWRJ
 RyYOHnStIgHf1QGIMuvT1tnotOD+
X-Google-Smtp-Source: ABdhPJx7tjPKzcVsRQcQHvVEgAaTnz5OB18EbhXl4ryhc2QxIr4aAG86CcAgnnrEq8xRrIHWfrUQZQ==
X-Received: by 2002:a7b:c4d8:: with SMTP id g24mr4023199wmk.127.1594903844032; 
 Thu, 16 Jul 2020 05:50:44 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:efc1:eb01:18eb:bff2])
 by smtp.gmail.com with ESMTPSA id z25sm7669872wmk.28.2020.07.16.05.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 05:50:43 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/qxl: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Date: Thu, 16 Jul 2020 14:50:35 +0200
Message-Id: <20200716125037.67437-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716125037.67437-1-christian.koenig@amd.com>
References: <20200716125037.67437-1-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBkb2Vzbid0IGV4cG9zZSBhbnkgbm90LW1hcGFibGUgbWVtb3J5IHJlc291cmNl
cy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYyB8IDggKysrLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4
bF90dG0uYwppbmRleCBhNmU2NzE0OWVmNGEuLjgyMGViMTkwZDI5MiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxf
dHRtLmMKQEAgLTU0LDcgKzU0LDcgQEAgc3RhdGljIGludCBxeGxfaW5pdF9tZW1fdHlwZShzdHJ1
Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgdWludDMyX3QgdHlwZSwKIAlzd2l0Y2ggKHR5cGUpIHsK
IAljYXNlIFRUTV9QTF9TWVNURU06CiAJCS8qIFN5c3RlbSBtZW1vcnkgKi8KLQkJbWFuLT5mbGFn
cyA9IFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7CisJCW1hbi0+ZmxhZ3MgPSAwOwogCQltYW4t
PmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX01BU0tfQ0FDSElORzsKIAkJbWFuLT5kZWZhdWx0
X2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7CiAJCWJyZWFrOwpAQCAtNjIsOCArNjIsNyBA
QCBzdGF0aWMgaW50IHF4bF9pbml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2
LCB1aW50MzJfdCB0eXBlLAogCWNhc2UgVFRNX1BMX1BSSVY6CiAJCS8qICJPbi1jYXJkIiB2aWRl
byByYW0gKi8KIAkJbWFuLT5mdW5jID0gJnR0bV9ib19tYW5hZ2VyX2Z1bmM7Ci0JCW1hbi0+Zmxh
Z3MgPSBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVEIHwKLQkJCSAgICAgVFRNX01FTVRZUEVfRkxBR19N
QVBQQUJMRTsKKwkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfRklYRUQ7CiAJCW1hbi0+
YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19DQUNISU5HOwogCQltYW4tPmRlZmF1bHRf
Y2FjaGluZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsKIAkJYnJlYWs7CkBAIC0xMDcsOCArMTA2LDcg
QEAgaW50IHF4bF90dG1faW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYs
CiAJbWVtLT5idXMuc2l6ZSA9IG1lbS0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQ7CiAJbWVtLT5i
dXMuYmFzZSA9IDA7CiAJbWVtLT5idXMuaXNfaW9tZW0gPSBmYWxzZTsKLQlpZiAoIShtYW4tPmZs
YWdzICYgVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRSkpCi0JCXJldHVybiAtRUlOVkFMOworCiAJ
c3dpdGNoIChtZW0tPm1lbV90eXBlKSB7CiAJY2FzZSBUVE1fUExfU1lTVEVNOgogCQkvKiBzeXN0
ZW0gbWVtb3J5ICovCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
