Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95ABB147D1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 07:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EB110E1BE;
	Tue, 29 Jul 2025 05:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="OZyFLHyD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D47B10E1BE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 05:44:46 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-74b56b1d301so3448541b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 22:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753767886; x=1754372686;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dyl9k/+GgCioEtou2dmlzc7vsavwZ2MlrAwTUSd5lFc=;
 b=OZyFLHyDq2xlE+kDaPEBdJ1YnBHhGK7rg4iInxEevmmrf+IoW2nr40EtkC/Xdh28Ge
 W0URwl3Wv9VsEm1Fn7WiWLGoNwrw7Dd3I+B0Pta/N2OaJ4Rmyb+ASn+I7Iq8WZQh9MTZ
 SM9y6v8oOLaZ4QXlRqCZZhIABTxRBSVl7L3JOD9akyJGcVwiiMufmU8VUq+IZFP0QxQe
 3UH9YVjLdJXZ1tEtDuLaO8DsqNGOAs4GiEC224VL7Up6qaiejuaqwS6BRSkZSSy4dk2Y
 ixVRHt9YchjDOSHmuf6EyEccTsgvM2gElu2FeujAmko99ILsC1rvbLKsfiC5W2/Owlf/
 FBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753767886; x=1754372686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dyl9k/+GgCioEtou2dmlzc7vsavwZ2MlrAwTUSd5lFc=;
 b=g6/MDsDs5OD0p9vnZCCLD08y3czVWDwjb5+OCP2fP26uEAn7rqw3f9XKpPac52WuwH
 xAyRn5klKtNvY5rLa+en4uScfMrcYxjKqbg3tag6NlUUBUFsITAdJFx8wjPAj1H3m4BZ
 m3DWlKO5pJeRC2y9bRPQsZi/JTZZvdQEEUS+bHTX8qbd1Qm+lTMxs4Ee6QG7sYrK3PEn
 97kStsck01YDm1DS+II8T5ugBy9W/UvCw8NGNjC6oOVCSZLrKuJEThf0o7aFFu3jtbiW
 NnBe1BrBkoYJ2wmnfLE6MToZBN0jfq0YZvLWEr5Y1Tabx1GNspAVPmL4TsRyXYux1J6G
 NFIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/Usudgfbv9o9e7Y11XEtgiYWgOOCGgjtZMm5iBiOVd6xek/g9/rztB4Q5wDYOrRaCFJuylfmxCrs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrEK8n3201zrs5nHZpJVo6EgQk5NzhCsqBR7PwKPMytTEUWqqH
 bFY+xsvQhE3J6iuRjKqwEKyAABC2B6v92k6FldW2TRosKVgRUeD35gP3GjSl3v2aBGU=
X-Gm-Gg: ASbGnctmG316Rp0CLfLEph/a7juqswFD7byeUoH+AJzoxIeH80H1BnfC32OhrSmTvFB
 CrU05g/apaLPaOyRXEIsUmM9yv5irZBIf9AAGb6Il28KXJRouf7hjogyJT291Vd9X+nzaV/SfkG
 2HTaT0Ayt8wXi1+SsLArF9j6txITeKTUoDwGf/peh+5CStSA9m+4TkDtnZWZFVy8qwkiYMMclJC
 yEqPD3nwuVgDwA94JLopNIRBKMho/R8+OA9CJwUeLquStT0TDsX6Zvq2L+xpwN/UAvR9H9xaqgO
 Q0K9QaQFxxyYSBRZauvgMgZ3FRA0Nh62dT+DDPt9ssAy44TGjQrwh3LVwlW34J1/fwfw9w+GM7V
 UVHA5aa5VSnOv5YP+xO7DJ3zq8Wb7aj6HFJKs3L8zeHepJQPCng==
X-Google-Smtp-Source: AGHT+IEXjHtUpb2buMY+5CWdYbI8oH6HrpCcTJ3ZyV6pv+VA6IOFmuXaOileu5xjs8foum5R3PGMSQ==
X-Received: by 2002:a05:6a00:b52:b0:748:f74f:6d27 with SMTP id
 d2e1a72fcca58-76334fa7565mr21727897b3a.24.1753767885652; 
 Mon, 28 Jul 2025 22:44:45 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640872a500sm6972462b3a.22.2025.07.28.22.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 22:44:44 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org
Cc: dianders@chromium.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v2 0/3] drm/panel: novatek-nt35560: Fix bug and clean up
Date: Mon, 28 Jul 2025 23:44:32 -0600
Message-ID: <20250729054435.1209156-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
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

Fix bug in novatek-nt35560 driver's nt35560_set_brightness() which
causes the driver to incorrectly report that it "failed to disable
display backlight".

Add mipi_dsi_dcs_read_multi() to drm_mipi_dsi.c for improved error
handling in drivers which use mipi_dsi_dcs_read() multiple times in a
row. It seems like although this feature may be useful for the nt35560,
we don't expect many drivers to use it. Once again, I am happy to remove
this change if it's not worth maintaining.

Add mipi_dsi_dcs_write_var_seq_multi() and
mipi_dsi_generic_write_var_seq_multi() to drm_mipi_dsi.h to allow
drivers to more conveniently construct MIPI payloads at runtime.

Clean up novatek-nt35560 driver to use "multi" variants of MIPI
functions which promote cleaner code.

Brigham Campbell (3):
  drm/panel: novatek-nt35560: Fix invalid return value
  drm: Add MIPI support function and macros
  drm/panel: novatek-nt35560: Clean up driver

 drivers/gpu/drm/drm_mipi_dsi.c                |  37 ++++
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 198 ++++++------------
 include/drm/drm_mipi_dsi.h                    |  35 ++++
 3 files changed, 132 insertions(+), 138 deletions(-)


base-commit: 33f8f321e7aa7715ce19560801ee5223ba8b9a7d
-- 
2.50.1

