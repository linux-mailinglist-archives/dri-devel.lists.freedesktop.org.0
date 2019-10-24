Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD28E3883
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701888984F;
	Thu, 24 Oct 2019 16:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB326E4B1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:45:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g7so3593174wmk.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5DYjBFdBkh2ExDAy5mIdVeU5TwdGnRp9l6pBdmT3a3c=;
 b=DB1O8mV/Pk8rJmJzm6siJMNnoVvGptwJhy0QE8mSIQ1OFa5V10rOmMLX50TesYkgI1
 8iEp3vwIm95PUB+oblAsaKMMZZHtqBDs1wFKF6tJtuGScLTmU4K7Z2xsJjP6HmK6lbwU
 rP49MdmJS+4Rt44hFLh34wfguVFtX0Uok2W4b8Op4sli5P6xeZouBNmyn+ktmV4Sqt5e
 O5P8/1k9oPkaf3yB2IsZrsbPHWbXnwNs8nYgxOwCroRHPRkA8VbpG56PkRfEIbek0tHl
 gx7I2HG+5sHj5Eo/FaW0B6BtrI44ytDubrM5M5DQ19mlip932twhFVyevl/McaOYq7qW
 x44A==
X-Gm-Message-State: APjAAAWGJZH5Cb4hHCoZfX9HnR61qmk5+7zYvPg4rhlCKnnLNsNmSene
 bZtOnDCn+KiSXp5IamJDNsj07cg7
X-Google-Smtp-Source: APXvYqwSeJIzZ3He6mdaGu8fUEI1GFMx1cvsK7/HbMJTKLryIrN8fCFQx4VE364WszsLtnqgveVxeA==
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr5368725wmk.173.1571935541531; 
 Thu, 24 Oct 2019 09:45:41 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id c189sm3953652wme.24.2019.10.24.09.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:45:40 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 02/32] drm/tegra: dp: Add drm_dp_link_reset() implementation
Date: Thu, 24 Oct 2019 18:45:04 +0200
Message-Id: <20191024164534.132764-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5DYjBFdBkh2ExDAy5mIdVeU5TwdGnRp9l6pBdmT3a3c=;
 b=QQoIImawfuOekh1LfxlRAP4b6eF5hXLjNtWE1GNNfz7nRipP4eaowMSTELRpE0navZ
 muQr9OVrzQVdbMfdaqtOyQIBD+lh1WbFNMrXBF6CQr6hRyL9BmK4mEqItglK32v64GhY
 x6MsU1bNN+/+X/xZidb26xcqO12sqT4rn5oz+PoMChVNZaXVbtyo2P5JbE5GtvSmiuuN
 BpHQ80tBKtpgRxfXGkYyUJn1ZgFIEskEtqmftdviBPcC2L4tsRb3C/v6Q3G/Qs/Fgk3x
 8nrFySjTg/JNkG+qVkz12y0jIE681ptcS9VGv3X7Pnqy97H81H/9J696YEeNk9V0EU/q
 dUOA==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClN1YnNlcXVlbnQgcGF0
Y2hlcyB3aWxsIGFkZCBub24tdm9sYXRpbGUgZmllbGRzIHRvIHN0cnVjdCBkcm1fZHBfbGluaywK
c28gaW50cm9kdWNlIGEgZnVuY3Rpb24gdG8gemVybyBvdXQgb25seSB0aGUgdm9sYXRpbGUgZmll
bGRzLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYyB8IDEzICsrKysrKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYwpp
bmRleCA1MGJhOTY3ZWJjYmQuLmMxOTA2MGI4NzUzYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmMKQEAgLTgsNiAr
OCwxNyBAQAogCiAjaW5jbHVkZSAiZHAuaCIKIAorc3RhdGljIHZvaWQgZHJtX2RwX2xpbmtfcmVz
ZXQoc3RydWN0IGRybV9kcF9saW5rICpsaW5rKQoreworCWlmICghbGluaykKKwkJcmV0dXJuOwor
CisJbGluay0+cmV2aXNpb24gPSAwOworCWxpbmstPnJhdGUgPSAwOworCWxpbmstPm51bV9sYW5l
cyA9IDA7CisJbGluay0+Y2FwYWJpbGl0aWVzID0gMDsKK30KKwogLyoqCiAgKiBkcm1fZHBfbGlu
a19wcm9iZSgpIC0gcHJvYmUgYSBEaXNwbGF5UG9ydCBsaW5rIGZvciBjYXBhYmlsaXRpZXMKICAq
IEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsCkBAIC0yNCw3ICszNSw3IEBAIGludCBkcm1f
ZHBfbGlua19wcm9iZShzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCBzdHJ1Y3QgZHJtX2RwX2xpbmsg
KmxpbmspCiAJdTggdmFsdWVzWzNdOwogCWludCBlcnI7CiAKLQltZW1zZXQobGluaywgMCwgc2l6
ZW9mKCpsaW5rKSk7CisJZHJtX2RwX2xpbmtfcmVzZXQobGluayk7CiAKIAllcnIgPSBkcm1fZHBf
ZHBjZF9yZWFkKGF1eCwgRFBfRFBDRF9SRVYsIHZhbHVlcywgc2l6ZW9mKHZhbHVlcykpOwogCWlm
IChlcnIgPCAwKQotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
