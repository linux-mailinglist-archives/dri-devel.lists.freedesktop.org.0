Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7DB2B0D3A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CC76E3D3;
	Thu, 12 Nov 2020 19:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3246E3D3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:42 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o15so7156849wru.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vIBIVuzBlrGyaebIimJgPfSPXPdePz/jLOplaNl77Uc=;
 b=S9tZWZNQXIkRV9mPM6OEmeVeYu0c4QMcShen80UEKoX4pqHBh/GmCzilomqYNxV5r+
 Gvfd1aJzgRPBkD/CPATnf//LEkjmtVu73Mvst7Yw5of7zAwHLJiLWbOtttCx5SQ0HFYd
 HRAKO81DLHM+HxOmmHNxqpv4R5H1NdLISE28IMLAp83hNQ96sMDrtPXh3rhl1ZRlosu4
 3sd6MsCuUE/vPrKmay52fIdQIi0vi0tOvBK04HHiUj+In+L8e08Qlzamx2gTq+STIq5G
 HGbFhB8xc0BlejFY8N8U+27dYAqSatMBbQPiyHrOuFIw0XjG2VeuIN7LeOTTFKJ6XrWu
 fB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vIBIVuzBlrGyaebIimJgPfSPXPdePz/jLOplaNl77Uc=;
 b=XkrDtrptEPJBbQNKKU2atWYLwgGxjQZ0JFftm0Vx+4+dvhOGqDTMrF/k1J7rokdBhd
 yixeZxSuRcdNosyom18Fx40xonxLOcu4N+3uHLx35wl41OPTSlDdBhAMspNnGXKYpj8H
 dun7v63toyPRVogd/mZI0qPx0sFWaPFoR9xDwQXd9wx+YbBeed+Scs3Hxk+Xpab+ilzS
 VcROwbenU0+OpVStyREvw5eTnvhcvlZQwj5U/+qEChpDqFs0sK2y9PGhVDFtWQa3Ow/z
 87fhD+l1KM433d8OID7MkFKILHXWts+oIQkVIiFfhhxg6RAG1tvdTetwtP2UmnxISZRX
 lH1Q==
X-Gm-Message-State: AOAM530J5eJMw2d1+gZv3wBxgn7ZewcQrac4riyV/aSkBFuiBt2BB418
 GvzGA4y+xU11lcC7jCT2JJMFeQ==
X-Google-Smtp-Source: ABdhPJzi00lpmiu98Uws9+8H0DTTCUdhvJWoWsZRfmSHcUmZJrPN5bkxKIJNvHUJveEjzIibaQ/d5A==
X-Received: by 2002:a05:6000:110c:: with SMTP id
 z12mr1108335wrw.214.1605207700757; 
 Thu, 12 Nov 2020 11:01:40 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:40 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 23/30] drm/rockchip/rockchip_rgb: Consume our own header
Date: Thu, 12 Nov 2020 19:00:32 +0000
Message-Id: <20201112190039.2785914-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3JnYi5jOjcxOjIyOiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yIOKAmHJvY2tjaGlwX3JnYl9pbml04oCZIFstV21pc3NpbmctcHJv
dG90eXBlc10KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9yZ2IuYzoxNTk6Njog
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhyb2NrY2hpcF9yZ2JfZmluaeKA
mSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBz
LmNvbT4KQ2M6ICJIZWlrbyBTdMO8Ym5lciIgPGhlaWtvQHNudGVjaC5kZT4KQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9yZ2IuYyB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX3JnYi5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3Jn
Yi5jCmluZGV4IDlhNzcxYWY1ZDBjOTUuLmMwNzk3MTQ0NzdkOGEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9yZ2IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvcm9ja2NoaXBfcmdiLmMKQEAgLTE4LDYgKzE4LDcgQEAKIAogI2luY2x1ZGUgInJv
Y2tjaGlwX2RybV9kcnYuaCIKICNpbmNsdWRlICJyb2NrY2hpcF9kcm1fdm9wLmgiCisjaW5jbHVk
ZSAicm9ja2NoaXBfcmdiLmgiCiAKICNkZWZpbmUgZW5jb2Rlcl90b19yZ2IoYykgY29udGFpbmVy
X29mKGMsIHN0cnVjdCByb2NrY2hpcF9yZ2IsIGVuY29kZXIpCiAKLS0gCjIuMjUuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
