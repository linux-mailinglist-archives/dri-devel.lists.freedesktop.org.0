Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB613AA5A3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 22:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEA96E822;
	Wed, 16 Jun 2021 20:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650B56E822;
 Wed, 16 Jun 2021 20:50:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79C5461076;
 Wed, 16 Jun 2021 20:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623876637;
 bh=KkBcxHtMW6CBQsdymw0nRgRZKWfSKaSXE49m9JbgpYE=;
 h=Date:From:To:Cc:Subject:From;
 b=qXnPj6G3RKf7L2+/RLuinTQjlA3QWCDZ554IK6ZPFRQppgKgKFSUClx1VVOmgjlsr
 WaghoO6kQ91hnYp5qeFWWb5b/i5K5a4Q5SySnJTccORLZqWyM4IINHEGLm+Y2zWs5K
 5cK5pKrVrsg5TS7DBFpnT/bggwlweazVrWsnUdflGJnuJlc7RZ+T8COCNbRAPOUyQj
 nNI1idYlTTck2lq0ivA9mS/41skVbtGrD7dXdViemS7MTC0r4rH39A3tf+TQdRGy0f
 tV89BKnLTOXUpo4CWo3nYPhzECd26PG5He23JiYZtwW6vKJ0dMqJi5ZaPaDJ+OMI9D
 WxvQpE731ufJQ==
Date: Wed, 16 Jun 2021 15:52:06 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] drm/amd/display: Fix fall-through warning for Clang
Message-ID: <20210616205206.GA17547@embeddedor>
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to enable -Wimplicit-fallthrough for Clang, fix
the following warning by replacing a /* fall through */ comment
with the new pseudo-keyword macro fallthrough:

rivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.c:672:4: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
                        case AUX_TRANSACTION_REPLY_I2C_OVER_AUX_DEFER:
                        ^

Notice that Clang doesn't recognize /* fall through */ comments as
implicit fall-through markings, so in order to globally enable
-Wimplicit-fallthrough for Clang, these comments need to be
replaced with fallthrough; in the whole codebase.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
JFYI: We had thousands of these sorts of warnings and now we are down
      to just 15 in linux-next. This is one of those last remaining
      warnings.

 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
index 28631714f697..2fb88e54a4bf 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
@@ -668,7 +668,7 @@ bool dce_aux_transfer_with_retries(struct ddc_service *ddc,
 				/* polling_timeout_period is in us */
 				defer_time_in_ms += aux110->polling_timeout_period / 1000;
 				++aux_defer_retries;
-				/* fall through */
+				fallthrough;
 			case AUX_TRANSACTION_REPLY_I2C_OVER_AUX_DEFER:
 				retry_on_defer = true;
 				fallthrough;
-- 
2.27.0

