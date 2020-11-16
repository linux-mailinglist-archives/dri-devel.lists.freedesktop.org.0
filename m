Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E16C2B4DD2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174F16EA15;
	Mon, 16 Nov 2020 17:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC826E9FA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:42:20 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id u12so12446526wrt.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AA3ifXfkFgEiPb/+ErWAHaArtQGSrp8moUYg4qmaDWk=;
 b=UjF5WqGyB7EH7OhySfFTVMXhaSx34pvV4mfdWl92PAWblT7uWjt4EwdhGq4opaxfLb
 orZ7sxKafXTs+opxYnQzhDGyotWpmYeb9VKFYp3i+810+f64cW0rKZ68feO0yDcmvLC1
 S/Q/4p8zK32nfoxT6fR/BCXo/GZfP2gSDppe75Kbss/WbsbJoHmBR866lH3s/zfwKhZf
 IuYlJIjyzMQaEBu6dsOnwYELcHmpH4/Hb3o9cYIe+FWPQz+C+BvpuXW783/4+ZjzjPIM
 +8Wn80vVhpZXESufXsvdhx5gvWEKTRfxtfegS/nbCAdJUjwMpwutlXm4gYEVbmSZmHCW
 /k6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AA3ifXfkFgEiPb/+ErWAHaArtQGSrp8moUYg4qmaDWk=;
 b=p/HzWUdme/ot7ZC6BbGqhHfpOGBUXpYVSRNLPflbama/Jh919F3Or8uu+Gv1cviqyB
 WRsLAN+44jIkIScoZD/ecgVH9yee53igZbZrqCjg0HCmpqtDUHixaiU+cuJ1W8pFoPmX
 p+Op2SQVuquya28piUp63jvHBx6m76rw2iM10kVUsb/7+JPGGuA/yaXBbQwr1pfif7iv
 gxCYsj0VgZji5dLhXsIxK9F+MLTSZ6R0JQkaecb0tuROlrJ5vP9LVgIHMy0Wdzzh7nu/
 XaeSgzhphaUchQ4tm5Bff1T/AmipQvCWtaFdi2J7SK2bfb5crB2HDSxD/Bgulrvkf4ib
 9xww==
X-Gm-Message-State: AOAM531Pn5k/cQDgwk7cgusPpxvbVpjs3joWt8v0aRw4zvUH8+b4DUH4
 ll6/6siuuQflNdF4pgTQy4f+hg==
X-Google-Smtp-Source: ABdhPJw6r7DlQ++cTDY1efHbC5r3WHHMN2X6WMtV3NiC9i0Cnqx0lR2bC+5andsXJU2Z2O4IncQtrA==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr20119219wrj.162.1605548539468; 
 Mon, 16 Nov 2020 09:42:19 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:42:18 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 42/42] include/drm/drm_atomic: Make use of 'new_crtc_state'
Date: Mon, 16 Nov 2020 17:41:12 +0000
Message-Id: <20201116174112.1833368-43-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIG1hY3JvIGZvcl9lYWNoX29sZG5ld19jcnRjX2luX3N0YXRlKCkgJ2NydGNfc3RhdGUn
IGlzIHByb3ZpZGVkCmFzIGEgY29udGFpbmVyIGZvciBzdGF0ZS0+Y3J0Y3NbaV0ubmV3X3N0YXRl
LCBidXQgaXMgbm90IHV0aWxpc2VkIGluCnNvbWUgdXNlLWNhc2VzLCBzbyB3ZSBmYWtlLXVzZSBp
dCBpbnN0ZWFkLgoKRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmco
cyk6CgogZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5jOiBJbiBmdW5jdGlvbiDigJhp
cHVfcGxhbmVzX2Fzc2lnbl9wcmXigJk6CiBkcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5l
LmM6NzQ2OjQyOiB3YXJuaW5nOiB2YXJpYWJsZSDigJhjcnRjX3N0YXRl4oCZIHNldCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogUGhpbGlwcCBaYWJlbCA8cC56
YWJlbEBwZW5ndXRyb25peC5kZT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFNoYXduIEd1byA8c2hhd25n
dW9Aa2VybmVsLm9yZz4KQ2M6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4K
Q2M6IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+CkNjOiBG
YWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+CkNjOiBOWFAgTGludXggVGVhbSA8bGlu
dXgtaW14QG54cC5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25l
ZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogaW5jbHVkZS9k
cm0vZHJtX2F0b21pYy5oIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fYXRvbWljLmggYi9p
bmNsdWRlL2RybS9kcm1fYXRvbWljLmgKaW5kZXggZGM1ZTBmYmVjYzA0ZS4uNTRlMDUxYTk1N2Rm
YyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oCisrKyBiL2luY2x1ZGUvZHJt
L2RybV9hdG9taWMuaApAQCAtNzgzLDcgKzc4Myw4IEBAIHZvaWQgZHJtX3N0YXRlX2R1bXAoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9wcmludGVyICpwKTsKIAkJCSAgICAgICh2
b2lkKShjcnRjKSAvKiBPbmx5IHRvIGF2b2lkIHVudXNlZC1idXQtc2V0LXZhcmlhYmxlIHdhcm5p
bmcgKi8sIFwKIAkJCSAgICAgKG9sZF9jcnRjX3N0YXRlKSA9IChfX3N0YXRlKS0+Y3J0Y3NbX19p
XS5vbGRfc3RhdGUsIFwKIAkJCSAgICAgKHZvaWQpKG9sZF9jcnRjX3N0YXRlKSAvKiBPbmx5IHRv
IGF2b2lkIHVudXNlZC1idXQtc2V0LXZhcmlhYmxlIHdhcm5pbmcgKi8sIFwKLQkJCSAgICAgKG5l
d19jcnRjX3N0YXRlKSA9IChfX3N0YXRlKS0+Y3J0Y3NbX19pXS5uZXdfc3RhdGUsIDEpKQorCQkJ
ICAgICAobmV3X2NydGNfc3RhdGUpID0gKF9fc3RhdGUpLT5jcnRjc1tfX2ldLm5ld19zdGF0ZSwg
XAorCQkJICAgICAodm9pZCkobmV3X2NydGNfc3RhdGUpIC8qIE9ubHkgdG8gYXZvaWQgdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGUgd2FybmluZyAqLywgMSkpCiAKIC8qKgogICogZm9yX2VhY2hfb2xk
X2NydGNfaW5fc3RhdGUgLSBpdGVyYXRlIG92ZXIgYWxsIENSVENzIGluIGFuIGF0b21pYyB1cGRh
dGUKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
