Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBF385C004
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 16:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A659210E4BE;
	Tue, 20 Feb 2024 15:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EsYsytYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEAF10E4BE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 15:35:43 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4126f48411dso4689985e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 07:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708443341; x=1709048141; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0tVavBaCJCcUxEWjYt34qLoi7PjbJJd+1sJMJ7iF+N0=;
 b=EsYsytYy0ttYJS4yrevNy5dYl3NyHQ4xhfiKUYnUYNRpOjkOz5eW6nITW6yyiTm2Lm
 TWQJj9a6KTzjHbyHsb/nHEvyKgocAAfK4LmaIUIVDcqbH39WkvShBM1NOsGYKzbX36VD
 Xy+vmxcZXhTTa1Xt8WbOvbUyFWJvH1f9u3VZe1okP4mrMCrjplNoPOOsyNRsbTfGgHmF
 7jGhmNVGBcblDWsOUil/kLC4a8MbdcMaoxfSXrTEL5r9a8Hm0sHRc5tuLpDWXrAL5Oj0
 qBR91+VJoTGHYR8FXe+xPl6G5swfZTG7XlRQ8RFV7yl/oUVrV2bag68bsRzoG1azT8xi
 1x7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708443341; x=1709048141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0tVavBaCJCcUxEWjYt34qLoi7PjbJJd+1sJMJ7iF+N0=;
 b=HhiyvDNPHucBo8E8Z+YjPB8fScDlxbsPM/ihu07BQ8a9jltq+NKDi1CAM5rnZNDAv2
 xS2sKi+C1gTFpjMKUBAjABn6KB+7u1fp2PRRJGnPG/I0juOgm921gN350H8wilbFaCPx
 isMxspNQAjm3KDiDw0HtLeIX/etymNHguAiJbFfgp6hdVNbnt/zrt2ltYpKx8yySTSGE
 6ZTiv9K/7AJ3JGvEUh6TgEBhos+AEdm1OClD7xVD/1bw+u/1rvKG6PWeRlGe/QyoeUcs
 OlI7fyBktWZtvB/6iin+7xs/kW/7Wuth4uTGOgWcbruu1pcRqywVbifdEptvfGXn9j3X
 Nr6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUhccatPKBy+P1HvBeGeUIWZr0PpCsweENu+CP5cxidaEUcEHSGD2544rYx9PvJHx+PqM4qJ9WGrlMuJp4HRmMv3FOTA/PI5/yTcjpjBBN
X-Gm-Message-State: AOJu0YxLKWksrSV3hFkX09KETBH+aiKpyg1GYRYuv5g0qLWGWLVNsKBC
 TmzAoFE/U35B93BnkEAWWvQ90GUceNXpLVGB+StS79M/9DJZxV+SFs6JwCNDS+8=
X-Google-Smtp-Source: AGHT+IFiqAfHWzDOcl5xntoajL3gcHfJPqSV5AusJhnh+vyCTeJ8HBX2cswoZr0VJOsM6WG9tR94Pg==
X-Received: by 2002:a05:600c:4f8a:b0:412:4731:a5e9 with SMTP id
 n10-20020a05600c4f8a00b004124731a5e9mr10993841wmq.4.1708443341346; 
 Tue, 20 Feb 2024 07:35:41 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c310800b004126ec2f541sm2444905wmo.0.2024.02.20.07.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 07:35:41 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 0/4] Ensure all backlight drivers zero the properties
 structure
Date: Tue, 20 Feb 2024 15:35:23 +0000
Message-ID: <20240220153532.76613-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

[Sorry for the RESEND so soon... embarrassingly I got Lee's e-mail
address wrong the first time!]

Luca Weiss recently shared a patch to zero the properties structure for
lm3630a... and shortly afterwards I realized I should probably scan for
a similar class of errors in other drivers.

Results follow in the next four patches (they could all be one patch but
for the fact there are different Fixes: tags)!

Daniel Thompson (4):
  backlight: da9052: Fully initialize backlight_properties during probe
  backlight: lm3639: Fully initialize backlight_properties during probe
  backlight: lp8788: Fully initialize backlight_properties during probe
  backlight: mp3309c: Fully initialize backlight_properties during probe

 drivers/video/backlight/da9052_bl.c | 1 +
 drivers/video/backlight/lm3639_bl.c | 1 +
 drivers/video/backlight/lp8788_bl.c | 1 +
 drivers/video/backlight/mp3309c.c   | 1 +
 4 files changed, 4 insertions(+)


base-commit: b401b621758e46812da61fa58a67c3fd8d91de0d
--
2.43.0

