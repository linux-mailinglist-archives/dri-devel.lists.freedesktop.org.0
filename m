Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C31DB31B245
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 20:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBAE6E0AF;
	Sun, 14 Feb 2021 19:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598A36E0AF
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 19:41:40 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id q72so2489612pjq.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 11:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uYz3kOtrZ6Hf5DjXT1UkBRogQ4J1lPOvWIWH1kd6QXA=;
 b=aO2QjQGa2mG9vCy1BwYu3zPMtnftm5Mg2AM9uV8EZImKreIS9VatNBo8bb0qRtNplE
 3OBD8aDO1PGAaH8XGG16wdFBOCLqqTx5nMR5pn1I8GBZO4l4CssVedKyRpXL6TVYrtw6
 TcovWJ3IIlzD1+m8i7Q6j4uqUZI5AThOLWvR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uYz3kOtrZ6Hf5DjXT1UkBRogQ4J1lPOvWIWH1kd6QXA=;
 b=TDCWNtqUbziEdEuidfbXBdh305VFau7CwpEPMDjPfuh1dm4v4S4L9v26IGDC1nph6y
 3SnaBynIvYWrAKn5GIIDu+aGbcFxOcDwzOjYUYgJsVzGojd9iXYa6s5xMa5JJvTFnD3F
 /pmYsw8MDpbOovqKHW2/rInJT4BPmN3z6Al2rleKxCgKeOD2Y9NjhGUzvqfD2SBBFDHv
 FNq3EWIzWXByiP0/KDgm6db7WYHVhVYXHdDNGFYcjuwZYrdmZDqb7eJKxQ6xEJQHtch8
 RlK54jH30yQSZ7DkyBLic9GsJe8+YU3zpb6syfb+vGoQ7MA4qlBz2GAJVnRHJn/w/+ks
 jClw==
X-Gm-Message-State: AOAM530MkURf+dXo6rPQ/ZeeCy0ZzCGn0lGRzYOGOwPqbaU4ohfJXz+b
 fyT9m0wR9qujZPGrfBTlcp5doQ==
X-Google-Smtp-Source: ABdhPJzLLpSe6h6YLhCLR1f9osYYHY7qcokxZFU5wgjVcteYh/v71KLAWqCEIpbS89QnvAza0juNXg==
X-Received: by 2002:a17:90b:4d06:: with SMTP id
 mw6mr12223997pjb.24.1613331699994; 
 Sun, 14 Feb 2021 11:41:39 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id 125sm15129247pfu.7.2021.02.14.11.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 11:41:39 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 5/7] drm: bridge: Queue the bridge chain instead of stacking
Date: Mon, 15 Feb 2021 01:11:00 +0530
Message-Id: <20210214194102.126146-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210214194102.126146-1-jagan@amarulasolutions.com>
References: <20210214194102.126146-1-jagan@amarulasolutions.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_bridge_attach has stacked the bridge chain, so the bridge
that gets pushed last can trigger its bridge function pre_enable
first from drm_atomic_bridge_chain_pre_enable.

This indeed gives a chance to trigger slave bridge pre_enable
first without triggering its host bridge pre_enable for the
usual host to slave device model like DSI host with panel slave.

For fully enabled bridge drivers, host bridge pre_enable has all
host related clock, reset, PHY configuration code that needs to
initialized before sending commands or configuration from a slave
to communicate its host.

Queue the bridge chain instead of stacking it so-that the bridges
that got enqueued first can have a chance to trigger first.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- new patch

 drivers/gpu/drm/drm_bridge.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 64f0effb52ac..e75d1a080c55 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -191,9 +191,9 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	bridge->encoder = encoder;
 
 	if (previous)
-		list_add(&bridge->chain_node, &previous->chain_node);
+		list_add_tail(&bridge->chain_node, &previous->chain_node);
 	else
-		list_add(&bridge->chain_node, &encoder->bridge_chain);
+		list_add_tail(&bridge->chain_node, &encoder->bridge_chain);
 
 	if (bridge->funcs->attach) {
 		ret = bridge->funcs->attach(bridge, flags);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
