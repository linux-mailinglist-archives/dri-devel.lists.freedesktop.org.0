Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FB6987022
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 11:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703E510EB36;
	Thu, 26 Sep 2024 09:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bmjZOuLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFFA10EB36
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 09:29:43 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-208ccde82e6so6057475ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 02:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727342983; x=1727947783;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LhqiIDQ5Jqu/fSndHOna+E70YcD1T5+jR0brWu5czp4=;
 b=bmjZOuLdlSu59lI5J7Q096swP0HpDTru8o5//UwY3F26O2Nc2QDJH5QGulbnKgEdQ+
 +5NmBzvNAJq523jVWhDXgLzgjy80SMBYm6o/Yv+opkMuoxaaNoSvWKx+BtLCoukv1Zar
 oPVRATUhTFAbCKI44rO94dKKvL80Oq34dYu/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727342983; x=1727947783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LhqiIDQ5Jqu/fSndHOna+E70YcD1T5+jR0brWu5czp4=;
 b=kAHvugSCv3LzzBmkatiEFRBVp2V/p0t6az0AFIjbIobeGQ0jE2mlQzuycPsNKCa5Ch
 A5x8fxKoHnMnlQRCFzk7oeSL4uAf+Y2GYZ1RWDhrvYUX+Bg6GNESu/eNDALOH+QbWZKH
 UjHP/Bh0klshZm8pD1EkYEF9ryHt0ACaWMhkJjG1GSTqT2IQ7bJlUHTOBmCFzrzli83e
 skcUfWhAOwNkrSCFxAAic0qOjrOILzKCIR2b4o7MzZrTi4plydsGnmdYVBXOR+hcwCT1
 bFocbMUT6thLk3e/rIB9X4VqhIpQfl9XQECml+MOxWqv0VZqzcNtGNhQlVKyX9M1TJy/
 HrgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn22ng0aFOeSRjbYZZzZEOENm1rDvYp954Ul7dwgex9UMvxbwBnObewV1sPwgfZuihL7mYKJIq5Qw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZTk1x+Ws2vxgp18EyuADzzKixXcFJqDxJBtjJl7iVckdX40DE
 0tFOaTBvncfkJEZBjOB8Cef5NofMUMVlG/4JVYfD3u7suinfxIF3pPHwW64Esw==
X-Google-Smtp-Source: AGHT+IEdG39v0Vfwfch9vcjFuBKfPvx9YOlmD0blQWme8C0zQJMHMM2ZuXN87DCP03QyVmgMacA7Sw==
X-Received: by 2002:a17:903:110f:b0:207:1737:2c66 with SMTP id
 d9443c01a7336-20afc4c127fmr79900895ad.35.1727342983478; 
 Thu, 26 Sep 2024 02:29:43 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:4234:cfaa:3b83:d75a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20af1720b00sm34819105ad.64.2024.09.26.02.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 02:29:43 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 2/2] drm/bridge: it6505: Drop EDID cache on bridge power off
Date: Thu, 26 Sep 2024 17:29:09 +0800
Message-ID: <20240926092931.3870342-3-treapking@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240926092931.3870342-1-treapking@chromium.org>
References: <20240926092931.3870342-1-treapking@chromium.org>
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

The bridge might miss the display change events when it's powered off.
This happens when a user changes the external monitor when the system
is suspended and the embedded controller doesn't not wake AP up.

It's also observed that one DP-to-HDMI bridge doesn't work correctly
when there is no EDID read after it is powered on.

Drop the cache to force an EDID read after system resume to fix this.

Fixes: 11feaef69d0c ("drm/bridge: it6505: Add caching for EDID")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

---

Changes in v2:
- Collect review tags

 drivers/gpu/drm/bridge/ite-it6505.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 1e1c06fdf206..bb449efac2f4 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3101,6 +3101,8 @@ static __maybe_unused int it6505_bridge_suspend(struct device *dev)
 {
 	struct it6505 *it6505 = dev_get_drvdata(dev);
 
+	it6505_remove_edid(it6505);
+
 	return it6505_poweroff(it6505);
 }
 
-- 
2.46.0.792.g87dc391469-goog

