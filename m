Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B30185B6F29
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 16:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5868510E720;
	Tue, 13 Sep 2022 14:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549B710E720;
 Tue, 13 Sep 2022 14:10:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 95728614BC;
 Tue, 13 Sep 2022 14:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615A8C433D7;
 Tue, 13 Sep 2022 14:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1663078203;
 bh=pI/efMIRfMPLZEbOkc0FWEqztzpGq+Ww3EmELNCn0n8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=APFRULcUUQhC5Bjf2hZrozIk651s9UUhovWW7RF/UgQKuWUHVLcP7a9zomh0ASfDR
 FOfu95e72+aCsHrbMLQ9DMjuVdtAl4MglEUtrQ1HDaQ2W7u/TCVYGUVf3VnaftrPGU
 17kJf6VuzQTZS+ZBgwSPLbFwArlnTny9zZUIp9hc=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.19 052/192] drm/amd/display: fix memory leak when using
 debugfs_lookup()
Date: Tue, 13 Sep 2022 16:02:38 +0200
Message-Id: <20220913140412.529529553@linuxfoundation.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913140410.043243217@linuxfoundation.org>
References: <20220913140410.043243217@linuxfoundation.org>
User-Agent: quilt/0.67
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
Cc: David Airlie <airlied@linux.ie>, Wenjing Liu <wenjing.liu@amd.com>,
 dri-devel@lists.freedesktop.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Yongzhi Liu <lyz_cs@pku.edu.cn>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Thelford Williams <tdwilliamsiv@gmail.com>, Leo Li <sunpeng.li@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Mikita Lipski <mikita.lipski@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, stable@vger.kernel.org,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 hersen wu <hersenxs.wu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

commit cbfac7fa491651c57926c99edeb7495c6c1aeac2 upstream.

When calling debugfs_lookup() the result must have dput() called on it,
otherwise the memory will leak over time.  Fix this up by properly
calling dput().

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: hersen wu <hersenxs.wu@amd.com>
Cc: Wenjing Liu <wenjing.liu@amd.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Thelford Williams <tdwilliamsiv@gmail.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: Yongzhi Liu <lyz_cs@pku.edu.cn>
Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -3188,7 +3188,7 @@ void crtc_debugfs_init(struct drm_crtc *
 				   &crc_win_y_end_fops);
 	debugfs_create_file_unsafe("crc_win_update", 0644, dir, crtc,
 				   &crc_win_update_fops);
-
+	dput(dir);
 }
 #endif
 /*


