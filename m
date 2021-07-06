Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576493BCDF1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE8C6E3D6;
	Tue,  6 Jul 2021 11:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B1F6E3D2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:22:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6792061CF6;
 Tue,  6 Jul 2021 11:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570533;
 bh=DUSuP3xpVunXUKujzsYqMPC2DM91doTCrKuRNo5jVGo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FiZ9wcYcJEhrC5r+1yCplbuKsm4S1wDh5M800UqaHJ82qpZ9tHoOtatAPyGT5xAcP
 lPfCr+iCr9far25P/2rj7mwYJzH27+KAYVAle6spwx2vwuhMAEUpz0NLDSvMRe/zkz
 6i05LJtCtpVcpHhL9ssCmFpF4IgKiWflHu/N8z4IXkpi5iiAQIAmp05fHCoSdEiWnE
 p05MwkWPlD7/+JSuQ1em+VZ6+0yEYiLzCow0fY1K15133SV7OCIpbS3AWdIC/3y6u3
 e0qvI8Nh2TftdhEP9PJ0B16BB05q0y9IUe5OX3JRPqIuDXJzVo6vT2LTfh716Rievu
 +Sf8eas6BryEA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 007/137] drm/vc4: fix argument ordering in
 vc4_crtc_get_margins()
Date: Tue,  6 Jul 2021 07:19:53 -0400
Message-Id: <20210706112203.2062605-7-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112203.2062605-1-sashal@kernel.org>
References: <20210706112203.2062605-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit e590c2b03a6143ba93ddad306bc9eaafa838c020 ]

Cppcheck complains that the declaration doesn't match the function
definition.  Obviously "left" should come before "right".  The caller
and the function implementation are done this way, it's just the
declaration which is wrong so this doesn't affect runtime.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://patchwork.freedesktop.org/patch/msgid/YH/720FD978TPhHp@mwanda
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index c5f2944d5bc6..9809c3a856c6 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -837,7 +837,7 @@ void vc4_crtc_destroy_state(struct drm_crtc *crtc,
 void vc4_crtc_reset(struct drm_crtc *crtc);
 void vc4_crtc_handle_vblank(struct vc4_crtc *crtc);
 void vc4_crtc_get_margins(struct drm_crtc_state *state,
-			  unsigned int *right, unsigned int *left,
+			  unsigned int *left, unsigned int *right,
 			  unsigned int *top, unsigned int *bottom);
 
 /* vc4_debugfs.c */
-- 
2.30.2

