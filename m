Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A715640D689
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 11:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219276EB3A;
	Thu, 16 Sep 2021 09:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4B26EB3A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 09:44:18 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t18so8518534wrb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 02:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ObqEUP3qi14NyfW7JJbtv2i7uqDxPO9r8TYVpyd2ZDo=;
 b=W8fNDqpy6OlEHXP7oec3/cxIhHaTYQPgcbnUfR6f3SrAlYEkfMreGMFnFl3QS15OnZ
 cPZaF2axcSu+XduTF2MC7o0fkkfbkDlYmtRhgiwM0dC9bOwjQvcB6Dd2w8SLW30CMYkT
 6GeK6KtZKg9caUAMGmcmeIlO/zngu9fyqjXHYC/bjwEj1UCdOimtb9X+KA+oyI8YH70u
 hXSfPWOQ0jrxgE5LtI6xQ6CWSDATnOBMLZLmledvHvYWLId909EoA6ISD08j6Yf2Kl44
 yVPA9ZTXOTkBtr8WYevYwbdp7FRCc8Ax7+v6slqEsptl9qkIa+jPtZz3OyABAQU5S8dy
 HGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ObqEUP3qi14NyfW7JJbtv2i7uqDxPO9r8TYVpyd2ZDo=;
 b=AS/x9Vp2n+sKcYLz29s+mMLzwyyU52AcUOxW0FfOPYWYUbq09x/RRL70taK4rl0gPU
 JEaAYaJlcHzj1MUDnVi9SqmpmMfM012eNNQHRqjsj6UsBSPPqFMu3vMKd1bmTNpgbqLk
 eLm6bodmISrRjRMGmo/ex+krardEnbwloEePWjyT8R5wLlEnK0JHwpliGsVgdKmv3FEm
 eTXNB65V6AzmpfMwl31p+CRI0cw26xYKZ2CRhwwSxvHuxSPZEx+1Q9Vl6FUvq1xvO4Ha
 jwlwOikEDO6URaAEBzqCAoqcnU4hS2DcB4R6AVs5d1NDEc7SwlCDs7wC8oQf6e/TmVyh
 xRxQ==
X-Gm-Message-State: AOAM530wLBHwfIGOV3CaL1ZDZzgZKBjxGrfyXImqL90NqXIoGt7SxI4f
 Z9K4wNMtS75tTVYUH4yB0TQ=
X-Google-Smtp-Source: ABdhPJzFIBV/AFPzv49Wbp2BXqvcU39J/We2bG7prD/rUYc/OzBlzrEEDg1d3S3r4/zB4uWxtUv9Ug==
X-Received: by 2002:adf:f185:: with SMTP id h5mr5042555wro.302.1631785457242; 
 Thu, 16 Sep 2021 02:44:17 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id v8sm2872677wrt.12.2021.09.16.02.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 02:44:16 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 5/6] drm/tegra: Propagate errors from
 drm_gem_plane_helper_prepare_fb()
Date: Thu, 16 Sep 2021 11:44:03 +0200
Message-Id: <20210916094404.888267-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916094404.888267-1-thierry.reding@gmail.com>
References: <20210916094404.888267-1-thierry.reding@gmail.com>
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

From: Thierry Reding <treding@nvidia.com>

Currently this function doesn't return an error, but that may change in
the future, so make sure to propagate any error codes that it might
return.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/plane.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index f8e8afcbcbf2..321cb1f13da6 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -200,11 +200,14 @@ int tegra_plane_prepare_fb(struct drm_plane *plane,
 			   struct drm_plane_state *state)
 {
 	struct tegra_dc *dc = to_tegra_dc(state->crtc);
+	int err;
 
 	if (!state->fb)
 		return 0;
 
-	drm_gem_plane_helper_prepare_fb(plane, state);
+	err = drm_gem_plane_helper_prepare_fb(plane, state);
+	if (err < 0)
+		return err;
 
 	return tegra_dc_pin(dc, to_tegra_plane_state(state));
 }
-- 
2.33.0

