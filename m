Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8738CC8C2
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 00:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDBA10EF9C;
	Wed, 22 May 2024 22:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tgY5a92S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA38310EF9C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 22:07:04 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2e1fa824504so67626801fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 15:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716415622; x=1717020422; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Kvx6yeinoVDUi5Zfkw33aV+5YjT78WJ1rv7O0iicX/w=;
 b=tgY5a92SE9hG+cvZcZJgHIbfp2FO9skz1ShUkaBtI+Y5hrMdlrvWLUlAb1XiF/d62s
 li0f/9ESRTq+EKb97sHbPYVX9hDUu7RX9CWhR0eTfcMAqOPKejkxE2KCdSyTjjfPDWlL
 8UNYPxsPONhb7rpS6lFfLXq4EGHvBv6o+4iJQ6x0ilvC1rIBhLCk59fFmdfrX2L0vSop
 fN2cZO9CLfTBRhn9tfQzqKL9dWdHucJ/0rg6/4VWHXGOxk57emRh6EwE8woOzQ9zkXVV
 ZEUQsQAGK9ZDUqfV2gtFadkSva5Bg3JczFMJSVRLaUUV7OK4yT6dx/7iAUOImD9Q1sRM
 OKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716415622; x=1717020422;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kvx6yeinoVDUi5Zfkw33aV+5YjT78WJ1rv7O0iicX/w=;
 b=PAIQ8sJlxNqV4qRUvejdf+B3dKX5AcgsajQuT3s3ChoV6j+YHDeysJazcBo5UQMiRs
 e/mlqGhYj0sep6ZQNtYyDTiBeRdTBQ4EfDaoiZNXr4b6PRAPEdt7jPIPYbh/fkJAZWgd
 nKQM2AYen5dhHqOfErx6JOwcXZLbUhfgW+4Wg+0xk3H4E8epLVlGNttvlP01sYlzEJhT
 QdDP3r5GqcLFQRgeu44K6aFm74egPl5zA3vKyiKb+ICsAm5Th0C1cTkDEgxCkyFZUnjL
 hlv0aXCb6Se2zhI8Cm7kZH1m4o4P6gilPw/WVTtQ/B8nW9jjPHUYRSnf0jm0NN8Nnt/6
 Zw0A==
X-Gm-Message-State: AOJu0YzIWvhoK1omBqruE14m8Y5z70cjHjNJWcFmHMu4CAp+6bP9IZRJ
 IsN5sIiIcQ7qQ9tEANGPku76NdT97wtZMKPkEK0oiqE1y7Y7PpEgIbmtaXMuaD4=
X-Google-Smtp-Source: AGHT+IHvvy96Pg+GUU/MU5q+kBLk9kzzZb38y4KNjSyfaRuJK/MxIVMkE4HTw90jn1n1wg6XsU8azw==
X-Received: by 2002:a2e:a444:0:b0:2e5:2c7e:257 with SMTP id
 38308e7fff4ca-2e94949dfa2mr20306221fa.30.1716415622393; 
 Wed, 22 May 2024 15:07:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95289b4fdsm295021fa.29.2024.05.22.15.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 15:07:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 May 2024 01:07:00 +0300
Subject: [PATCH RFC] drm/panel-edp: add fat warning against adding new
 panel compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240523-edp-panel-drop-v1-1-045d62511d09@linaro.org>
X-B4-Tracking: v=1; b=H4sIAINsTmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUyNj3dSUAt2CxLzUHN2UovwCXQODxEQjY8sk42SzJCWgpoKi1LTMCrC
 B0UpBbs5KsbW1AGgtl7RlAAAA
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2251;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=P3nfzAeDzHWCF/hR3Be4Vs0HK32RB+1TM1u0f2LLKPY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5pfTouUqvqtluq5hwJiZh++eFaho04xvyOfc84Jx5Liz
 DrGidadjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZhI8g8Ohn6dWValqa4re1j8
 LjjfWDWP95XCSolzv3rCNb2XLhP/56J7UfVNnMTMD0xrHJIEGveo/6xsyosOm16eZOvUr+krm5P
 sHlNjUOZj48JUIXxtwatvCiGHNe6c+H1xVvvVWYYv/1xeoDfXxS9V7FeEq07ipUrfj1PjTghl6e
 Q8Z+bQq7e0PXVYdvXrqPslUryPJWfY8Qr09iRXWomxc/HE7GLb/bPnex/jU73oiTVb2i+4a/ueE
 RY0/D5frPFFnbjI/0cBVUvyTBRUo3+bLI90qHp+49uKM2d/5y1Sm5ArOPF+tZjx2y2O7513bTZ5
 41Pt+mSDzAS5jLS1Sz/r+lSFaO58VrjoVuz942qBPTIA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a fat warning against adding new panel compatibles to the panel-edp
driver. All new users of the eDP panels are supposed to use the generic
"edp-panel" compatible device on the AUX bus. The remaining compatibles
are either used by the existing DT or were used previously and are
retained for backwards compatibility.

Suggested-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
The following compatibles were never used by the devices supported by
the upstream kernel and are a subject to possible removal:

- auo,b133han05
- auo,b140han06
- ivo,m133nwf4-r0
- lg,lp097qx1-spa1
- lg,lp129qe
- samsung,lsn122dl01-c01
- samsung,ltn140at29-301
- sharp,ld-d5116z01b
- sharp,lq140m1jw46
- starry,kr122ea0sra

I'm considering dropping them, unless there is a good reason not to do
so.
---
 drivers/gpu/drm/panel/panel-edp.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 6db277efcbb7..95b25ec67168 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1776,7 +1776,23 @@ static const struct of_device_id platform_of_match[] = {
 	{
 		/* Must be first */
 		.compatible = "edp-panel",
-	}, {
+	},
+	/*
+	 * Do not add panels to the list below unless they cannot be handled by
+	 * the generic edp-panel compatible.
+	 *
+	 * The only two valid reasons are:
+	 * - because of the panel issues (e.g. broken EDID or broken
+	 *   identification),
+	 * - because the platform which uses the panel didn't wire up the AUX
+	 *   bus properly.
+	 *
+	 * In all other cases the platform should use the aux-bus and declare
+	 * the panel using the 'edp-panel' compatible as a device on the AUX
+	 * bus. The lack of the aux-bus support is not a valid case. Platforms
+	 * are urged to be converted to declaring panels in a proper way.
+	 */
+	{
 		.compatible = "auo,b101ean01",
 		.data = &auo_b101ean01,
 	}, {

---
base-commit: 8314289a8d50a4e05d8ece1ae0445a3b57bb4d3b
change-id: 20240523-edp-panel-drop-00aa239b3c6b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

