Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2FD5A2355
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 10:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE84110E752;
	Fri, 26 Aug 2022 08:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B49710E766;
 Fri, 26 Aug 2022 08:41:33 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id
 w88-20020a17090a6be100b001fbb0f0b013so907406pjj.5; 
 Fri, 26 Aug 2022 01:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=HIeIpyWVKIcmfqIV5lirkvwwNNDOVYt8bI+0hEb74pQ=;
 b=DCG5UCppYuAnzeCBzX+YNkPGOGlHliULuc8rG7InIqeJxYSnfoWs/u7jYy7wUkF/L2
 7hbQRNTq6W+GpIySpjO3d7A15jPogE14HkSZXqpt5vW83awnpAUKjqRuO7BXeTcN9sQp
 JEPL6bHNsutxllGgJufmTXIG4+eRsctBZIorKr7dnGqf+frYE5eLyw9vHiX2esR87z8n
 gBSdW04OcjcUM+v60tnnq/s0AB9yUnHUovGyNFJroZsHQOZN8mNb2T+3ig/xbLP3cRiD
 CrtHdlAUBW6k787ujYY9N3UTYDvCFefiq+hpgP4byF5yKsQLnaqF6hwDf8hqh8Dz0grt
 JaXA==
X-Gm-Message-State: ACgBeo0rrgycmmwHpT1aNNSATZ8De1st2mb2Z4YR5xoi+GUyqY/MBVdV
 sYYThn8IXaEPwIvgVaYKJ31wTzdcBDqW
X-Google-Smtp-Source: AA6agR7Xwb0bLnunGKQsV2loxRVQznyp5x72nqQRbT4GixsvoFpb2+hG9OudZfw7hw450gqkeA/meQ==
X-Received: by 2002:a17:90b:1c0c:b0:1fb:6b2c:ca9f with SMTP id
 oc12-20020a17090b1c0c00b001fb6b2cca9fmr3421599pjb.90.1661503292597; 
 Fri, 26 Aug 2022 01:41:32 -0700 (PDT)
Received: from localhost.localdomain ([156.146.53.107])
 by smtp.gmail.com with ESMTPSA id
 n33-20020a17090a5aa400b001fb371c01bfsm1075740pji.37.2022.08.26.01.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 01:41:32 -0700 (PDT)
From: sunliming <sunliming@kylinos.cn>
To: Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/amd/display: Fix variable dereferenced before check
Date: Fri, 26 Aug 2022 16:41:21 +0800
Message-Id: <20220826084121.94319-1-sunliming@kylinos.cn>
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
Cc: kernel test robot <lkp@intel.com>, kelulanainsley@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sunliming <sunliming@kylinos.cn>, amd-gfx@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following smatch warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:311 dc_dmub_srv_p_state_delegate()
warn: variable dereferenced before check 'dc' (see line 309)

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: sunliming <sunliming@kylinos.cn>
---
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 09b304507bad..ebf99e8f93e0 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -323,11 +323,13 @@ bool dc_dmub_srv_p_state_delegate(struct dc *dc, bool should_manage_pstate, stru
 	struct dmub_cmd_fw_assisted_mclk_switch_config *config_data = &cmd.fw_assisted_mclk_switch.config_data;
 	int i = 0;
 	int ramp_up_num_steps = 1; // TODO: Ramp is currently disabled. Reenable it.
-	uint8_t visual_confirm_enabled = dc->debug.visual_confirm == VISUAL_CONFIRM_FAMS;
+	uint8_t visual_confirm_enabled;
 
 	if (dc == NULL)
 		return false;
 
+	visual_confirm_enabled = dc->debug.visual_confirm == VISUAL_CONFIRM_FAMS;
+
 	// Format command.
 	cmd.fw_assisted_mclk_switch.header.type = DMUB_CMD__FW_ASSISTED_MCLK_SWITCH;
 	cmd.fw_assisted_mclk_switch.header.sub_type = DMUB_CMD__FAMS_SETUP_FW_CTRL;
-- 
2.25.1

