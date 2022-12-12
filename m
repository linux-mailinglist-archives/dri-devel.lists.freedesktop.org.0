Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DCE64A3C8
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 15:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F2B10E188;
	Mon, 12 Dec 2022 14:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E463010E210
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 14:55:21 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id t2so9339492ply.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 06:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QOete+/cDIPb7SHD7JQ+FV6lea22kcASfLRxjQgXkuU=;
 b=osnTVlUH9FvnBWkSTEZ8YnbhCKxVFasFUu8IqZ7WSUZfh1aA6bpTnJqkLyZRz3E77R
 ExpkoAn2Y0a5mmEutqqMksV74nXXAL7cmdrQIpgQDJjrFqNilB9Ft2T7WV0KtOHIZYXY
 49TvknntItq99dN+4OwtNOv/qvyyOjy3Rd4Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QOete+/cDIPb7SHD7JQ+FV6lea22kcASfLRxjQgXkuU=;
 b=FhbmLQYYtByD7xOR5MCNJnoXZeamwBaeysGe0uPi8pqwRtfmjHhSOiC52QwA9NUVno
 UsZS7CYE2dI16BVJAovhr7t0sVB26hMVYHkhLxqd31/XHKWVlkG4p+lRUlCIHrrSKjko
 DEj3trs8VTwkw8JDzw26b9tvzOgjIJLauz6SLjSq/C9g58zjVz0MPybLslrjvjrBsGS4
 RbdOGKeo0u2CRstCnsNwVAXgE7ph9S6ylVsXmvYkjN5LBImHDvxrFszgU7vEEBAKy9gk
 k6QIe7h6qskHjzRMkLP7oCNdPH/DZBW7p5mGMJjRfXYY0Ch2Mjcpdj529oXsG+sjFcFc
 BoJA==
X-Gm-Message-State: ANoB5pnMXi+qwGeXLkBdK5HHq3w+DvqZkCsT9omWouBKz12BXhAy7V0V
 lSAR/dOlo9jkO7bGETIWdl55LQ==
X-Google-Smtp-Source: AA0mqf64O+JwryeZ4HIgcewJKQ/FQ9AOe6MuQOsueYEOV7CvaQyiGRGuwSN19o4rN9ZTYOZBmVBWEA==
X-Received: by 2002:a17:902:6a8c:b0:185:441e:4cef with SMTP id
 n12-20020a1709026a8c00b00185441e4cefmr15104152plk.31.1670856921060; 
 Mon, 12 Dec 2022 06:55:21 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170902784b00b001782aab6318sm6463272pln.68.2022.12.12.06.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 06:55:20 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v10 0/3] drm: exynos: dsi: Restore the bridge chain
Date: Mon, 12 Dec 2022 20:25:05 +0530
Message-Id: <20221212145508.15096-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split the Exynos DSI bridge chain update patches from Samsung DSIM
bridge driver for easy to apply.

Changes for v10:
- collect Marek.V Review tag

Any inputs?
Jagan.

Jagan Teki (1):
  drm: panel: Enable prepare_prev_first flag for samsung-s6e panels

Marek Szyprowski (2):
  drm/bridge: tc358764: Enable pre_enable_prev_first flag
  drm: exynos: dsi: Restore proper bridge chain order

 drivers/gpu/drm/bridge/tc358764.c                | 1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c          | 8 ++++++--
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c    | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c    | 1 +
 5 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.25.1

