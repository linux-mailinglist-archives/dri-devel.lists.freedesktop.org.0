Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586911D6A6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 20:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B3B6E12E;
	Thu, 12 Dec 2019 19:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258256E10B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 19:02:39 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id n196so881202ybg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 11:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dzTlbSPDk2anKhVKTtI0sy9Z4bmPlFZnqKLkyDoxCLI=;
 b=Ue/LjwPF/HGXT/QEAAelM/jdEwb5xnEhipI18HUy2f+/Ov/alm0wWJYhyHlRPykHXO
 H1IyCMw9Bu7uli8HvT+kNFuxeAvIo4+5/wTYmzLwFS5bWt8qydhLIG3Qqp6iIgJ1tNXb
 OXitrTqx5/oCeKTMROsHhkDUDm1ngx+H1AelO/2076xD2a41iNsbGphYNNCZFedG/OGb
 LFJFov6oM6ZFfHjvQyGy3Hx8Ell6GADI6E+gV9bj+2w7i/Rtjipv/ynmvSgRqVxGBu94
 shuTBC63kL50lKmvm6G0M739W4zTGBNd1QG37d+7E44iUb2P/uPqV8tqlHVBQczQQuI9
 Ryjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dzTlbSPDk2anKhVKTtI0sy9Z4bmPlFZnqKLkyDoxCLI=;
 b=nJnh+St6+dPJCLfMMyeh/558c+Bf6wDetSfUjFfbDlqPgRfSmzhjXTlBJvy19X1N4b
 tkzZ5ieQIlbUnNhk+sE/k5uXlupHBlYuS+6Z6aSFGpWmZ2xXUuFBrMrkrGE3DcU3h10G
 FUWESpkx7GLhh1JKoojjzqxzo+eRLV928tMSIa3L/8zSWnN7Jdrf0nBGzKAs7NjoEGie
 Y7k/39vJRA+sDgeS3/daopd5n6DEHFLVWScJGthyJ6Uc28n3BlCYJVZVis0DfauvKJ1y
 crkB5lzJ4lPtDkNz/bHLnMGuofIaC73oOeavuyXUe49Jf1neQzg6uWya2q68PfLl5OUm
 6KbA==
X-Gm-Message-State: APjAAAU1MFzUItRAaFCKEOwr+w4jqqo0dqiPleRnX5c7nqcG+EKvSI4z
 PFWdR/Zh87mzPPUTxZyUJGYONWHgfBtTww==
X-Google-Smtp-Source: APXvYqwoJwF8xw8EvbWXFz0Bmc2FmjGXQUm8aA+PsNQUVW8bHd/RveWdG6usYEx36RrzzoD4UvVGpw==
X-Received: by 2002:a25:b95:: with SMTP id 143mr4074489ybl.182.1576177358050; 
 Thu, 12 Dec 2019 11:02:38 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id a202sm2987296ywe.8.2019.12.12.11.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 11:02:37 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 03/12] drm/i915: WARN if HDCP signalling is enabled upon
 disable
Date: Thu, 12 Dec 2019 14:02:21 -0500
Message-Id: <20191212190230.188505-4-sean@poorly.run>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191212190230.188505-1-sean@poorly.run>
References: <20191212190230.188505-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, rodrigo.vivi@intel.com,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpIRENQIHNpZ25hbGxpbmcg
c2hvdWxkIG5vdCBiZSBsZWZ0IG9uLCBXQVJOIGlmIGl0IGlzCgpDYzogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hy
b21pdW0ub3JnPgoKQ2hhbmdlcyBpbiB2MjoKLSBBZGRlZCB0byB0aGUgc2V0IGluIGxpZXUgb2Yg
anVzdCBjbGVhcmluZyB0aGUgYml0Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kZGkuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYwppbmRleCA1YjZmMzI1MTdjNzUuLjRh
NWJkZjNlZjUxZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kZGkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCkBA
IC0xOTUxLDYgKzE5NTEsOCBAQCB2b2lkIGludGVsX2RkaV9kaXNhYmxlX3RyYW5zY29kZXJfZnVu
Yyhjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZQogCWk5MTVfcmVnX3Qg
cmVnID0gVFJBTlNfRERJX0ZVTkNfQ1RMKGNwdV90cmFuc2NvZGVyKTsKIAl1MzIgdmFsID0gSTkx
NV9SRUFEKHJlZyk7CiAKKwlXQVJOX09OKHZhbCAmIFRSQU5TX0RESV9IRENQX1NJR05BTExJTkcp
OworCiAJaWYgKElOVEVMX0dFTihkZXZfcHJpdikgPj0gMTIpIHsKIAkJdmFsICY9IH4oVFJBTlNf
RERJX0ZVTkNfRU5BQkxFIHwgVEdMX1RSQU5TX0RESV9QT1JUX01BU0sgfAogCQkJIFRSQU5TX0RE
SV9EUF9WQ19QQVlMT0FEX0FMTE9DKTsKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIs
IEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
