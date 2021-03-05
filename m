Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC4632E569
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 10:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672E16EB43;
	Fri,  5 Mar 2021 09:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABAE6EB3E;
 Fri,  5 Mar 2021 09:57:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24F6364DF4;
 Fri,  5 Mar 2021 09:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614938219;
 bh=9BmS0kveghpNaMuDKytgyUYioo9f1ZWWPnYnjLIlXiM=;
 h=Date:From:To:Cc:Subject:From;
 b=uD9p7kmeDCz9RzL6h67uN8QlU7c0YXR8MUbXic3xNHI+SKMeU/WGrWgwbDb0RNX/6
 FQ8S9XvNcqGTxy1GXmnC51vZs+cHcKG7iQInyX510KfHTrtTWR3oSM5Qu13ngY0KMm
 zaMUC7NrbGW9GoZ+kL6NLF3ysoZERtEkYS0sviPHEvUDzrpMDOn/96AIC+iX9UGwcg
 YKaT7J8WdnRlbBMtcjsI8ZH7AVb2PfaY0SLTsr2CM1aXIVCPx235Wu2UJVKJIrlQtr
 TnSl/OHqQdpnIEkiXKvvP6JqpNitXoEqTbAiAxaneNPASKUBhLlXlV4zjJh0Dt5i21
 EaQ8R14GC7gvw==
Date: Fri, 5 Mar 2021 03:56:57 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RESEND][next] drm/nouveau: Fix fall-through warnings for Clang
Message-ID: <20210305095657.GA142006@embeddedor>
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to enable -Wimplicit-fallthrough for Clang, fix a couple
of warnings by explicitly adding a couple of break statements instead
of letting the code fall through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c        | 1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 2375711877cf..62903c3b368d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -443,6 +443,7 @@ nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t domain, bool contig)
 			break;
 		case TTM_PL_TT:
 			error |= !(domain & NOUVEAU_GEM_DOMAIN_GART);
+			break;
 		default:
 			break;
 		}
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 61e6d7412505..eb844cdcaec2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -157,6 +157,7 @@ nouveau_conn_atomic_set_property(struct drm_connector *connector,
 			default:
 				break;
 			}
+			break;
 		case DRM_MODE_SCALE_FULLSCREEN:
 		case DRM_MODE_SCALE_CENTER:
 		case DRM_MODE_SCALE_ASPECT:
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
