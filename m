Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D4FCE2B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 19:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9656EE9F;
	Thu, 14 Nov 2019 18:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F7B6EE78;
 Thu, 14 Nov 2019 18:54:12 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id n13so4902297pff.1;
 Thu, 14 Nov 2019 10:54:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lv3vbSb0hoGBjroJ2Tdn1yzUDZjbGKNm38UA4zcYa4s=;
 b=ssFDfN5bKZ8aaGrbth9PW/yalUak97S0hv/j1GV/xWu+/xsXgR4R2PKOuCa9GjUBav
 utrFdCq6GfDTETD6XvTYujkPVL10nU011u9gNzCqHwXlG3sRQirjjOhZBDIMsKvZx0Vv
 8SEJlkEelyxNWW4S9e2j7q0BndYlH6pPbtU8Q1dsYlFBD6Kwd3FmzQO1R4tFWyLXznfi
 xuYXMBWP1juCKXnKB1EujBmOcE3E1AF6r//Ln4UJmq629KksCUfCpZg7IGrjImkVOWTH
 DokdRPgpxUzqH7+onklgx/4vQqfWThCW37g22mtGPnB6QjaFxEt3N6GW9tcmWqp6OmGq
 8vfg==
X-Gm-Message-State: APjAAAXJ8KfIcfJGfxwu9YePJLyhSbE3a9q6FIhv6eM2izdBwwRGPZsS
 IXAvXGFOMB1/XUQgsLMixeH09CHMLLQ=
X-Google-Smtp-Source: APXvYqxUcHD8QYR04zvjEfVRrevsRkXrCYCaiTtozRf4mEoOkYqRB3I7hM7yBUhdoONpAtm79wmvnw==
X-Received: by 2002:a63:c24f:: with SMTP id l15mr4182842pgg.279.1573757651698; 
 Thu, 14 Nov 2019 10:54:11 -0800 (PST)
Received: from localhost ([100.118.89.215])
 by smtp.gmail.com with ESMTPSA id y123sm7220013pfg.64.2019.11.14.10.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 10:54:11 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: ignore NULL clocks
Date: Thu, 14 Nov 2019 10:51:50 -0800
Message-Id: <20191114185152.101059-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lv3vbSb0hoGBjroJ2Tdn1yzUDZjbGKNm38UA4zcYa4s=;
 b=JYzvXJ92P3URGM1EZVGOx6BuS8G4Mdx15aVK361Xo3brwt7T11v6tN/M85BmixF8gm
 x9yQqCmBVzfduyEnfCvp8OvAk6hx93Hdz2OR6cgIh01VVT+oRC/15Y6ffc5bxDSPIH+m
 27S1Q27OQ7Oxi4IShfALB58nC8gzc6U+FByDvqh9wnV4JmJNdvXSxxlAoOLKmUdPw7Km
 cMBy+MuOmR00vi49P8s0QN2KOrFwtwaacAeRm4lOENFwdo6f8jaqq3LOY8PSAzf5k2w6
 lgrxioLslzBMzzYyOtWC3JQaQOGjqlMdG1lnsTx/I1ofrt3o+CF2UEEzPD4WoTP6FM0U
 61aA==
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Matthias Kaehlcke <mka@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVGhpcyBpc24ndCBhbiBl
cnJvci4gIEFsc28gdGhlIGNsayBBUElzIGhhbmRsZSB0aGUgTlVMTCBjYXNlLCBzbyB3ZSBjYW4K
anVzdCBkZWxldGUgdGhlIGNoZWNrLgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xh
cmtAY2hyb21pdW0ub3JnPgpUZXN0ZWQtYnk6IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21p
dW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9pb191dGlsLmMg
fCAyNiArKysrKystLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDE5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9kcHUxL2RwdV9pb191dGlsLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVf
aW9fdXRpbC5jCmluZGV4IDI3ZmJlYjUwNDM2Mi4uZWMxNDM3YjBlZjc1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9pb191dGlsLmMKQEAgLTkzLDE5ICs5MywxMiBAQCBp
bnQgbXNtX2Rzc19lbmFibGVfY2xrKHN0cnVjdCBkc3NfY2xrICpjbGtfYXJyeSwgaW50IG51bV9j
bGssIGludCBlbmFibGUpCiAJCQlERVZfREJHKCIlcFMtPiVzOiBlbmFibGUgJyVzJ1xuIiwKIAkJ
CQlfX2J1aWx0aW5fcmV0dXJuX2FkZHJlc3MoMCksIF9fZnVuY19fLAogCQkJCWNsa19hcnJ5W2ld
LmNsa19uYW1lKTsKLQkJCWlmIChjbGtfYXJyeVtpXS5jbGspIHsKLQkJCQlyYyA9IGNsa19wcmVw
YXJlX2VuYWJsZShjbGtfYXJyeVtpXS5jbGspOwotCQkJCWlmIChyYykKLQkJCQkJREVWX0VSUigi
JXBTLT4lczogJXMgZW4gZmFpbC4gcmM9JWRcbiIsCi0JCQkJCQlfX2J1aWx0aW5fcmV0dXJuX2Fk
ZHJlc3MoMCksCi0JCQkJCQlfX2Z1bmNfXywKLQkJCQkJCWNsa19hcnJ5W2ldLmNsa19uYW1lLCBy
Yyk7Ci0JCQl9IGVsc2UgewotCQkJCURFVl9FUlIoIiVwUy0+JXM6ICclcycgaXMgbm90IGF2YWls
YWJsZVxuIiwKLQkJCQkJX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApLCBfX2Z1bmNfXywKLQkJ
CQkJY2xrX2FycnlbaV0uY2xrX25hbWUpOwotCQkJCXJjID0gLUVQRVJNOwotCQkJfQorCQkJcmMg
PSBjbGtfcHJlcGFyZV9lbmFibGUoY2xrX2FycnlbaV0uY2xrKTsKKwkJCWlmIChyYykKKwkJCQlE
RVZfRVJSKCIlcFMtPiVzOiAlcyBlbiBmYWlsLiByYz0lZFxuIiwKKwkJCQkJX19idWlsdGluX3Jl
dHVybl9hZGRyZXNzKDApLAorCQkJCQlfX2Z1bmNfXywKKwkJCQkJY2xrX2FycnlbaV0uY2xrX25h
bWUsIHJjKTsKIAogCQkJaWYgKHJjICYmIGkpIHsKIAkJCQltc21fZHNzX2VuYWJsZV9jbGsoJmNs
a19hcnJ5W2kgLSAxXSwKQEAgLTExOSwxMiArMTEyLDcgQEAgaW50IG1zbV9kc3NfZW5hYmxlX2Ns
ayhzdHJ1Y3QgZHNzX2NsayAqY2xrX2FycnksIGludCBudW1fY2xrLCBpbnQgZW5hYmxlKQogCQkJ
CV9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcygwKSwgX19mdW5jX18sCiAJCQkJY2xrX2FycnlbaV0u
Y2xrX25hbWUpOwogCi0JCQlpZiAoY2xrX2FycnlbaV0uY2xrKQotCQkJCWNsa19kaXNhYmxlX3Vu
cHJlcGFyZShjbGtfYXJyeVtpXS5jbGspOwotCQkJZWxzZQotCQkJCURFVl9FUlIoIiVwUy0+JXM6
ICclcycgaXMgbm90IGF2YWlsYWJsZVxuIiwKLQkJCQkJX19idWlsdGluX3JldHVybl9hZGRyZXNz
KDApLCBfX2Z1bmNfXywKLQkJCQkJY2xrX2FycnlbaV0uY2xrX25hbWUpOworCQkJY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlKGNsa19hcnJ5W2ldLmNsayk7CiAJCX0KIAl9CiAKLS0gCjIuMjMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
