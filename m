Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4211CD248
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86C46E1F8;
	Mon, 11 May 2020 07:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108E289FC8
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 16:55:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l18so7932686wrn.6
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hYaO3vIFzjPS+OfApN0NYSAANmGhGDH0gcx3AO0sLnU=;
 b=uiAh446YfKtgnRC1fQcABQkMfbqSQvqvqmPuS8O26UEmq/dcUXoHl3BYwBQ1bqoeDk
 lzpm+0QFhTRLE5YzGMKlaQBoEXO2Xqo/Lm9lWaN7ZoL2k1x97RG65AvnDp7PuK1e1Waj
 jq2osBsVEmu6irLO0dkRnNqkhV/4mHhZr/aEupDm9Wvh6Npc9eluv3hSWCfmukrX66m2
 a8Ji6vS1BCHQmz4h8NqcXjbrCwFFZmLV3TVPifVI54WSgy5j1RJsQ6cUO8RNN88WPS1R
 pqlm8rAmkuLvdL5CLpQaR++IHipHx360nAQqQdwnV9HT8rbSs0JX7kLhsYv3U3Og/S+C
 gjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hYaO3vIFzjPS+OfApN0NYSAANmGhGDH0gcx3AO0sLnU=;
 b=dWSwMOKHZ0vWHOQoFykgE52uiOSaHrpVD0hhC76OHBfZCK0iALaTAcC1wmTGwOugmi
 kOWzYeV0FzgoOrswAJW01cbqj3Hq0pCnFrO4j3vcpNDw/4plrHj2G8dZOy4V6j7oXN08
 ykn//WCIf/ywNygUsNOMGmLYmK7qzg7brpjoyiraWWsuBfFBb4koK0O78SDvxNC5SmJJ
 W9N2s8g30QoxwWXjpRTxdQd4yK7wvFcV3hQj7h4FTEa8FpgDpTN79sVIlj9aU32t5QzN
 2xzOJuSZ8PRqR//u0dgnYmHm23cLafC15HyJoPAm56g+nmS2JV9Ympiq2fVe0zjz8mG1
 tuqg==
X-Gm-Message-State: AGi0PuYHpB468BNG75udpHVKqfPiLObPvFw3SqnVgOkXuNCnhzYFDJxN
 WUcdgZSJZ+YAmMC8B2JVm0g=
X-Google-Smtp-Source: APiQypIW4OiL8jyn7DImLpe0ow+y3YcsSLrPBYX2kzMMClad8smYzUnb3uZIPJ1/AW7spP8aYpKVLQ==
X-Received: by 2002:a05:6000:12c2:: with SMTP id
 l2mr2556186wrx.133.1589129749565; 
 Sun, 10 May 2020 09:55:49 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:1cc8:b1f1:a2b8:a1ee])
 by smtp.gmail.com with ESMTPSA id
 g15sm13637670wrp.96.2020.05.10.09.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 09:55:48 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 07/15] drm/panfrost: use device_property_present to check for
 OPP
Date: Sun, 10 May 2020 18:55:30 +0200
Message-Id: <20200510165538.19720-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510165538.19720-1-peron.clem@gmail.com>
References: <20200510165538.19720-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:28 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiBleHBlY3RpbmcgYW4gZXJyb3IgZnJvbSBkZXZfcG1fb3BwX29mX2FkZF90YWJs
ZSgpCmRvIGEgc2ltcGxlIGRldmljZV9wcm9wZXJ0eV9wcmVzZW50KCkgY2hlY2suCgpTaWduZWQt
b2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgfCAxNCArKysrKysrKystLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwppbmRleCBkOTAwN2Y0NGI3
NzIuLmZjZTIxYzY4MjQxNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2RldmZyZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
ZGV2ZnJlcS5jCkBAIC05NiwxNSArOTYsMTkgQEAgaW50IHBhbmZyb3N0X2RldmZyZXFfaW5pdChz
dHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAlzdHJ1Y3QgdGhlcm1hbF9jb29saW5nX2Rl
dmljZSAqY29vbGluZzsKIAlzdHJ1Y3QgcGFuZnJvc3RfZGV2ZnJlcSAqcGZkZXZmcmVxID0gJnBm
ZGV2LT5wZmRldmZyZXE7CiAKLQlyZXQgPSBkZXZfcG1fb3BwX29mX2FkZF90YWJsZShkZXYpOwot
CWlmIChyZXQgPT0gLUVOT0RFVikgLyogT3B0aW9uYWwsIGNvbnRpbnVlIHdpdGhvdXQgZGV2ZnJl
cSAqLworCWlmICghZGV2aWNlX3Byb3BlcnR5X3ByZXNlbnQoZGV2LCAib3BlcmF0aW5nLXBvaW50
cy12MiIpKQorCQkvKiBPcHRpb25hbCwgY29udGludWUgd2l0aG91dCBkZXZmcmVxICovCiAJCXJl
dHVybiAwOwotCWVsc2UgaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKLQlwZmRldmZyZXEtPm9wcF9v
Zl90YWJsZV9hZGRlZCA9IHRydWU7CiAKIAlzcGluX2xvY2tfaW5pdCgmcGZkZXZmcmVxLT5sb2Nr
KTsKIAorCXJldCA9IGRldl9wbV9vcHBfb2ZfYWRkX3RhYmxlKGRldik7CisJaWYgKHJldCkgewor
CQlEUk1fREVWX0VSUk9SKGRldiwgIkNvdWxkbid0IGFkZCBPUFAgdGFibGVcbiIpOworCQlnb3Rv
IGVycl9maW5pOworCX0KKwlwZmRldmZyZXEtPm9wcF9vZl90YWJsZV9hZGRlZCA9IHRydWU7CisK
IAlwYW5mcm9zdF9kZXZmcmVxX3Jlc2V0KHBmZGV2ZnJlcSk7CiAKIAljdXJfZnJlcSA9IGNsa19n
ZXRfcmF0ZShwZmRldi0+Y2xvY2spOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
