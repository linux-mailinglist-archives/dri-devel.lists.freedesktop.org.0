Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C26445B265
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 04:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8356B6E147;
	Wed, 24 Nov 2021 03:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C206E147;
 Wed, 24 Nov 2021 03:04:38 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id de30so1406047qkb.0;
 Tue, 23 Nov 2021 19:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g3UKjW7fmUe9JRzmjdiiBs6fkzP9ZvlZsvWeHL4ExR0=;
 b=BBddd5ZUGiBGsnJmx7bTL7Ov17NuqWLJ7XumhtNZtHWj90Eo9myNX757frsBUn49pi
 CG1hcOFC2xKZ9U1FSPDhqUajYJezCfSi7Zkbb7xEJStZYAD3J+QISUHdYkeP4G3z3Lh0
 imEtCAnQGzNbxrA1iy5netuKQ4/F47gwGLjI+uggEsMUR0IQ8EwSZQH9PGfPmdq0N/CU
 eYOihzo7MyaFhCtDCHw5dcBBBcUc3uI2A27iNFvyrBE34aV4v4HAIm1YBOPxcS/Pq6ge
 L1ncErC64CNx+oSGSuc/2RnvdWj06cCVMRvjvnq60LRWOKygWaxk4B/Fet4bLzdbtioI
 oqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g3UKjW7fmUe9JRzmjdiiBs6fkzP9ZvlZsvWeHL4ExR0=;
 b=dh5QfnPnKE0M0MSoS1odeSCq7rLMo7nMh/TK5HfMzMSQppp5L0tJTg53ZG+yYT20lm
 jwS3ehYFf6+oqgAj3smXU6nFqwv1O03WW+OXj4kflZ24a5Jfb/vW8QZHhcsm1uIQY9GK
 caBhV3KESZ64qmo+UjejDis5FeLC8FfNcXc1zbT+kBK0jI9jby4CqhcdSVZkYqNBluJ5
 pF21Vuv5zrBnnoFxiXRVWrjOOYJ42JCWrialFbaj3BSKfaZBSCSGY1IfdTrOUF/Rm8Eh
 8j/NLwZhUlzotN+N0B15801paLY3pmzkontnFtfDf/FcTtHUfrvDeR2dKkPv8mY/euSy
 MUTQ==
X-Gm-Message-State: AOAM532iBw/L06sLPbLKQhAgYY9O7lAHJQ4k0tW37q7W3CoMgBAvmd7P
 9IDItiNvZ3bXo5dRRQHgYMQ=
X-Google-Smtp-Source: ABdhPJzMa9PpQpZk9WGjY47S9dF0nk8A++HjGijauQYx1EqOq/o2FrQ5Ema1QEDpfwkZ7iqimV/fcw==
X-Received: by 2002:a05:620a:288b:: with SMTP id
 j11mr2315125qkp.257.1637723077907; 
 Tue, 23 Nov 2021 19:04:37 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id i23sm6973927qkl.101.2021.11.23.19.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 19:04:37 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: sunpeng.li@amd.com
Subject: [PATCH] drm/amd/display: fix application of sizeof to pointer
Date: Wed, 24 Nov 2021 03:04:26 +0000
Message-Id: <20211124030426.34830-1-lv.ruyi@zte.com.cn>
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
Cc: airlied@linux.ie, lv.ruyi@zte.com.cn, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 dri-devel@lists.freedesktop.org, wayne.lin@amd.com, alexander.deucher@amd.com,
 jun.lei@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

Both of split and merge are pointers, not arrays.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
index ece34b0b8a46..91810aaee5a3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
@@ -1223,8 +1223,8 @@ static void dml_full_validate_bw_helper(struct dc *dc,
 		*pipe_cnt = dml_populate_dml_pipes_from_context(dc, context, pipes, false);
 		*vlevel = dml_get_voltage_level(&context->bw_ctx.dml, pipes, *pipe_cnt);
 		if (*vlevel < context->bw_ctx.dml.soc.num_states) {
-			memset(split, 0, sizeof(split));
-			memset(merge, 0, sizeof(merge));
+			memset(split, 0, MAX_PIPES * sizeof(*split));
+			memset(merge, 0, MAX_PIPES * sizeof(*merge));
 			*vlevel = dml_validate_apply_pipe_split_flags(dc, context, *vlevel, split, merge);
 		}
 
-- 
2.25.1

