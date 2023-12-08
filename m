Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5049480A7CF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 16:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466A510E280;
	Fri,  8 Dec 2023 15:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3704B10E280
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 15:48:53 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1fae0e518a4so1580695fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702050532; x=1702655332; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CvGIaRZZrGiaN7WfHKadaS8JLhBTOynXGjwIgWbiLpA=;
 b=g5HPI2Wt6nDiyX+y6A9a6V59lwgAMz27I7RHiTz/3U7n9l8MB8EhIU/Kkmr+Do+SsX
 zMlOwGYbszZluk2MDIz4fvI8pp05842UIpVqaq4gdtAyZYdLYV3psKo3ztrOKFHu1DZo
 GI7BWujaWC7xhAfJFsmgSLzuerWEyMYxjqJXYSckB2KIXRi1cfs7g563y9u64IR8kGno
 XlFy7WiLXte7NJFRuXNUbkkGxo/kcTPdidQR6LmoZcARKwFsN8nMin6eSbCLTjLnEMys
 7OwIYM/GBfPwOMUpCFjzYftYQGHCk02J9RwAJs9yQDU5ZzNiU8JdilzsG7Za2wdZd57W
 h7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702050532; x=1702655332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CvGIaRZZrGiaN7WfHKadaS8JLhBTOynXGjwIgWbiLpA=;
 b=mOIU+s7HaHDX8FkBzH1o4TczrMldH2Oo4Cx9TTK75vS5RwATSrmkm9VT8JxOjHzg8e
 tkv9AAf6FuKSP1vVi/gT0xXX8gpxG8KpZJ5ZQYhPHmkNkE34fKk2lRklL00CFJ7B+Fiu
 cgepqfYd+AgShudL3ECEHrSQq4pz54eKH7Gy2wLQa2nRz/AEqJCGAMjCUmsepQCZwCAs
 PuJGD+1cPtHA6ywk6ATvJF2vLKQjnOmqlj1lTOpm6rwYAH0lgcj+g8qWxqQ/HmssoOK/
 LfH3v6OSha9RqjsbvYpJOqWhSL7wqrfcNNG3hUIpgm53z+59k54r5etZ5vYtajGK1Fei
 H4Lw==
X-Gm-Message-State: AOJu0YzE2/6ILFcTkZT+qDgNkBIv/JwT1BIDOtNP9y8PfpqydBbGjPrv
 ZIr8rS0z+x/jO9/lH/ZkfGU=
X-Google-Smtp-Source: AGHT+IFcyiv07XisAWrr55TzlRfXp9Mk8AGnaOZAaI0YTkOm5TiqFGi/N32KJ7yt9vjPxevz2v9OTA==
X-Received: by 2002:a05:6870:4723:b0:1fa:477:8a93 with SMTP id
 b35-20020a056870472300b001fa04778a93mr511508oaq.24.1702050532411; 
 Fri, 08 Dec 2023 07:48:52 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 os25-20020a0568707d1900b001fb28cd0e9asm444624oab.3.2023.12.08.07.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 07:48:52 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH 1/3] drm/panel: st7701: Fix AVCL calculation
Date: Fri,  8 Dec 2023 09:48:45 -0600
Message-Id: <20231208154847.130615-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208154847.130615-1-macroalpha82@gmail.com>
References: <20231208154847.130615-1-macroalpha82@gmail.com>
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
Cc: marex@denx.de, neil.armstrong@linaro.org, conor+dt@kernel.org,
 sam@ravnborg.org, Chris Morgan <macromorgan@hotmail.com>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The AVCL register, according to the datasheet, comes in increments
of -0.2v between -4.4v (represented by 0x0) to -5.0v (represented
by 0x3). The current calculation is done by adding the defined
AVCL value in mV to -4400 and then dividing by 200 to get the register
value. Unfortunately if I subtract -4400 from -4400 I get -8800, which
divided by 200 gives me -44. If I instead subtract -4400 from -4400
I get 0, which divided by 200 gives me 0. Based on the datasheet this
is the expected register value.

Fixes: 83b7a8e7e88e ("drm/panel/panel-sitronix-st7701: Parametrize voltage and timing")

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 0459965e1b4f..036ac403ed21 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -288,7 +288,7 @@ static void st7701_init_sequence(struct st7701 *st7701)
 		   FIELD_PREP(DSI_CMD2_BK1_PWRCTRL2_AVDD_MASK,
 			      DIV_ROUND_CLOSEST(desc->avdd_mv - 6200, 200)) |
 		   FIELD_PREP(DSI_CMD2_BK1_PWRCTRL2_AVCL_MASK,
-			      DIV_ROUND_CLOSEST(-4400 + desc->avcl_mv, 200)));
+			      DIV_ROUND_CLOSEST(-4400 - desc->avcl_mv, 200)));
 
 	/* T2D = 0.2us * T2D[3:0] */
 	ST7701_DSI(st7701, DSI_CMD2_BK1_SPD1,
-- 
2.34.1

