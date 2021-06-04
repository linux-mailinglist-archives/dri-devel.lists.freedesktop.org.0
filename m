Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8D639B1CA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 07:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CA56EB60;
	Fri,  4 Jun 2021 05:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5CF6EB60;
 Fri,  4 Jun 2021 05:05:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13F0C61159;
 Fri,  4 Jun 2021 05:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622783103;
 bh=Mb1ozeywktabS+f+cp0NBBM7yBN1fp+yu/m+y6URUIw=;
 h=Date:From:To:Cc:Subject:From;
 b=VWOVDaljlrLSw5RF+zKgJ8gD9QiprK/kp8XAfiY/b46L2+zvyONW1JlUJz4skQ/Cm
 sudPJhRww0BnbDrjcR8q0TDsGg5giFVnvK33YJSiyEdNtSdPddCCNIsJwfwjzsYNUs
 fVukU+l/yVJWJpTHU/i3nuJSZg1hQX1AEBQ9FqiG3pz002TXD3Yl+dlcXl7BjxolZK
 ZJT7vfNHlVayYB0fpItD1f9fOyJR3S/nA7U6cWTcKaHhA02+YmmcPHoaxtxJ5sBM0X
 wcxsNTV2x3yWqo26AmGxW92l3HLt3EYnA1SPnAn3dgF52iIOm/AfRWnJTipojH9whG
 ejUSHMiZC2DWg==
Date: Fri, 4 Jun 2021 00:06:13 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] drm/amd/pm: Fix fall-through warning for Clang
Message-ID: <20210604050613.GA240889@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: amd-gfx@lists.freedesktop.org, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
JFYI: We had thousands of these sorts of warnings and now we are down
      to just 22 in linux-next. This is one of those last remaining
      warnings. :)

 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
index 8f71f6a4bb49..43c3f6e755e7 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
@@ -831,6 +831,7 @@ static int smu10_dpm_force_dpm_level(struct pp_hwmgr *hwmgr,
 		break;
 	case AMD_DPM_FORCED_LEVEL_MANUAL:
 		data->fine_grain_enabled = 1;
+		break;
 	case AMD_DPM_FORCED_LEVEL_PROFILE_EXIT:
 	default:
 		break;
-- 
2.27.0

