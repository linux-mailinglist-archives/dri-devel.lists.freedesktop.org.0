Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 071287AEE5B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 16:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D9110E36B;
	Tue, 26 Sep 2023 14:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A746810E36B;
 Tue, 26 Sep 2023 14:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id B5A90408B3;
 Tue, 26 Sep 2023 16:15:16 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kHaaUA-fcTNJ; Tue, 26 Sep 2023 16:15:16 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1695737716; bh=7YORCs9Vk62LP4SO7qG+lf0cOTVErcdenHOWvRs5y2c=;
 h=From:To:Cc:Subject:Date;
 b=Sho8qWewI6rjLALnAx39pAjiZK+VPZ/ix2ETa08yTJm9zX+N4i+mzEzMaukHr3AMN
 N69PDiDge4s6dSCmaeE3MK7y8z9NGDIwSBUnU1VDgUraqZ0LGL4u19V6Qw1DLl5Bj5
 NFfURsa2Wa3jgRdMWt3O6/M+WW2dLBjUAWIIISMyJUhFXDxg6aC0oC1T+y7qs6QY+X
 aRlP6KmmyVrlKmPF2sUt3GIuomDDtdeoug6/znfqSDyfw2106aI5QXnqqDb9xGr7We
 yInRuCZwl2ynQPUZh1+agYvleVayYi/qo+ryylX/VuuQFoSnTFUtC8Q2u8U3L4Rqp0
 175LbNyF5A2JQ==
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RESEND PATCH v2 0/2] drm: Refactor plane size calculation by core
 helper functions
Date: Tue, 26 Sep 2023 11:15:17 -0300
Message-ID: <20230926141519.9315-1-gcarlos@disroot.org>
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Tales Aparecida <tales.aparecida@gmail.com>,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maxime Ripard <mripard@kernel.org>, Maira Canal <mairacanal@riseup.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's duplicated functions on drm that do the same job of calculating
the size of planes from a drm_format_info and the size of its first
plane. So this patchset throw away the more specific version intended
to be used from a given framebuffer and make the generic version way
more portable against the drivers.

Thanks,
Carlos

---
v2:
  - New patch "[PATCH v2 1/2] drm: Remove plane hsub/vsub alignment requirement
    for core helpers".

Carlos Eduardo Gallo Filho (2):
  drm: Remove plane hsub/vsub alignment requirement for core helpers
  drm: Replace drm_framebuffer plane size functions with its equivalents

 drivers/gpu/drm/drm_framebuffer.c       | 64 ++-----------------------
 drivers/gpu/drm/i915/display/intel_fb.c |  2 +-
 include/drm/drm_fourcc.h                |  5 +-
 include/drm/drm_framebuffer.h           |  5 --
 4 files changed, 8 insertions(+), 68 deletions(-)

-- 
2.41.0

