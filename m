Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIS/DQN1omk+3QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 05:54:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E621C05CC
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 05:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C52710E1F6;
	Sat, 28 Feb 2026 04:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l0yFnV7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E79C10E1F7
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 04:54:23 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-7927261a3acso23763847b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 20:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772254462; x=1772859262; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EmSz6Ee1J0Z/MD/2JF/g5iVQIYrLtpWsPv+WCazK24Q=;
 b=l0yFnV7JKVw3/BuJzmr5K96J/0C7edJISAKcUQ7zW8X2996JKo1BC2KVhQe6duEuQL
 SFdzNCy7urU/RDzCImB+qLrZIHxzLh7DM/L0U/j+XBZug2qUt9wC3F1av6rqvXkG5T7w
 HwfSvK1VWHbDU2FlfhVVYpWkh8jC8spgZsYYjqJSnZmpYlEHOxhO0b3JmnSpXCFWvSu7
 ufebCJbVtWKTiDZKmXaGqNTg83i9PkACvYNyMhNSqsJNVfvH2jeXqu/o/XSeYLB38WRT
 rDvvMxLGK/oz4y6QrGlEjeJ3CEUvOVr2bQj7azkSTIlSCNA3FVGLPqt3L2knM9OHLWCn
 U2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772254462; x=1772859262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EmSz6Ee1J0Z/MD/2JF/g5iVQIYrLtpWsPv+WCazK24Q=;
 b=CcfyxXeGahcu3ZEc+lZ+Q95914vvsVc2EcE2ejoA8kwOyGk9OeLWGEivZsA00RYWOJ
 dboso2UwSJNNo5SxabxNglDwMHhT2Bs/aQE3JzZT46xipjpUy4a8eMu0v85RE923d+VI
 3tTt4GsRhjVx8bheCw6EHQCNlKY2oCIctyrrtPHlE1GQVZu0HHuPuWO+HE9XIDssEbj+
 ihw4nYyOvnNToBz+Eb/OioAphITPJI1oKTI2dPTMVC3pgAtYObJpwpKctTu5j3BpxLPM
 DvQiyBdudVOfXL0yE87JMWYzuxYevVvxvy5BZPuFt7GCmWj1rEHpxupgluGCjQlYw8m0
 OSSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyPQtshg/Ut/BGF62+qgJ3P4XzFOGvM0yhJjPqQBWQDpbQg2OpAf86bteH0VY4zc4i9Ov3upWn3xk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMKnY+x9AGnCdsVOmgtPtuM4XwgpRpsMf40nePJvZsFmtv78OJ
 gnD5A8l+gqYeh1gFn1FtU9kcBJlJbAA3HjvNcc+6k4WcLzB/sw+TqUvN
X-Gm-Gg: ATEYQzyxQVIjUBMTytozEloY7G9WA9H/fqPsiTjmMlfRAHebVZDoSDOQZnnhWI7AD3E
 NGF2g3g9vXojDBJHK2LSeqi/6Xs4J5jE54NjTnm8j2yLCisQcTOZeUlnIMy0zfOSyhA8+ahPae4
 avL1eBhs4FhrEnvgUHV3B9xhJJj0eYZBo+vPGFJNXjq7qDhy6rdGFmnOqfsjLHxlzppTZN3SidB
 glBbvhQ4X+4PgkikmzZWel0cpTonBDHSVhQe32VHZobk9hZCnAPa+GoDRpL9wiRAtGrhXVuRxe3
 hRhuPrAmM1ftBJshx9RW+IkKYi3ycJhitePe5z+TpXcqF0FlKzdix8kidXpUx+0KtBSSaW4uSgI
 72rTp1zzueXuQumOtI21QAZbgOtVFMiAMxau211OviQ0+Lxl8F6HPCIhzXQihSK/goQv+24xdcx
 Wt0FAOE2iJK//iHZrWfP5sm992BBYmktGaY65Fs/XLoUsaX0k3EjlEBQ==
X-Received: by 2002:a05:690c:ed6:b0:798:6561:2a5e with SMTP id
 00721157ae682-7988549d803mr48648597b3.19.1772254461949; 
 Fri, 27 Feb 2026 20:54:21 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-79876bf8103sm29865967b3.27.2026.02.27.20.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 20:54:20 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: stable@vger.kernel.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Alex Hung <alex.hung@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lijo Lazar <lijo.lazar@amd.com>, "chr[]" <chris@rudorff.com>,
 Sasha Levin <sashal@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 for 6.112 and 6.6 1/2] drm/amd/display: Add pixel_clock to
 amd_pp_display_configuration
Date: Fri, 27 Feb 2026 20:53:55 -0800
Message-ID: <20260228045356.3561-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228045356.3561-1-rosenp@gmail.com>
References: <20260228045356.3561-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:Rodrigo.Siqueira@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kenneth.feng@amd.com,m:timur.kristof@gmail.com,m:alex.hung@amd.com,m:gregkh@linuxfoundation.org,m:lijo.lazar@amd.com,m:chris@rudorff.com,m:sashal@kernel.org,m:vulab@iscas.ac.cn,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linuxfoundation.org,rudorff.com,kernel.org,iscas.ac.cn,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 77E621C05CC
X-Rspamd-Action: no action

From: Timur Kristóf <timur.kristof@gmail.com>

[ Upstream commit b515dcb0dc4e85d8254f5459cfb32fce88dacbfb ]

This commit adds the pixel_clock field to the display config
struct so that power management (DPM) can use it.

We currently don't have a proper bandwidth calculation on old
GPUs with DCE 6-10 because dce_calcs only supports DCE 11+.
So the power management (DPM) on these GPUs may need to make
ad-hoc decisions for display based on the pixel clock.

Also rename sym_clock to pixel_clock in dm_pp_single_disp_config
to avoid confusion with other code where the sym_clock refers to
the DisplayPort symbol clock.

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c       | 1 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c | 2 +-
 drivers/gpu/drm/amd/display/dc/dm_services_types.h             | 2 +-
 drivers/gpu/drm/amd/include/dm_pp_interface.h                  | 1 +
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
index 848c5b4bb301..016230896d0e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
@@ -97,6 +97,7 @@ bool dm_pp_apply_display_requirements(
 			const struct dm_pp_single_disp_config *dc_cfg =
 						&pp_display_cfg->disp_configs[i];
 			adev->pm.pm_display_cfg.displays[i].controller_id = dc_cfg->pipe_idx + 1;
+			adev->pm.pm_display_cfg.displays[i].pixel_clock = dc_cfg->pixel_clock;
 		}

 		amdgpu_dpm_display_configuration_change(adev, &adev->pm.pm_display_cfg);
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c
index 13cf415e38e5..d50b9440210e 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c
@@ -164,7 +164,7 @@ void dce110_fill_display_configs(
 			stream->link->cur_link_settings.link_rate;
 		cfg->link_settings.link_spread =
 			stream->link->cur_link_settings.link_spread;
-		cfg->sym_clock = stream->phy_pix_clk;
+		cfg->pixel_clock = stream->phy_pix_clk;
 		/* Round v_refresh*/
 		cfg->v_refresh = stream->timing.pix_clk_100hz * 100;
 		cfg->v_refresh /= stream->timing.h_total;
diff --git a/drivers/gpu/drm/amd/display/dc/dm_services_types.h b/drivers/gpu/drm/amd/display/dc/dm_services_types.h
index facf269c4326..b4eefe3ce7c7 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_services_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_services_types.h
@@ -127,7 +127,7 @@ struct dm_pp_single_disp_config {
 	uint32_t src_height;
 	uint32_t src_width;
 	uint32_t v_refresh;
-	uint32_t sym_clock; /* HDMI only */
+	uint32_t pixel_clock; /* Pixel clock in KHz (for HDMI only: normalized) */
 	struct dc_link_settings link_settings; /* DP only */
 };

diff --git a/drivers/gpu/drm/amd/include/dm_pp_interface.h b/drivers/gpu/drm/amd/include/dm_pp_interface.h
index acd1cef61b7c..349544504c93 100644
--- a/drivers/gpu/drm/amd/include/dm_pp_interface.h
+++ b/drivers/gpu/drm/amd/include/dm_pp_interface.h
@@ -65,6 +65,7 @@ struct single_display_configuration {
 	uint32_t view_resolution_cy;
 	enum amd_pp_display_config_type displayconfigtype;
 	uint32_t vertical_refresh; /* for active display */
+	uint32_t pixel_clock; /* Pixel clock in KHz (for HDMI only: normalized) */
 };

 #define MAX_NUM_DISPLAY 32
--
2.53.0

