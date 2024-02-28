Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FBB86C386
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3258310E2AD;
	Thu, 29 Feb 2024 08:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 339 seconds by postgrey-1.36 at gabe;
 Wed, 28 Feb 2024 18:38:34 UTC
Received: from relay161.nicmail.ru (relay161.nicmail.ru [91.189.117.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693CE10E062;
 Wed, 28 Feb 2024 18:38:34 +0000 (UTC)
Received: from [10.28.138.149] (port=32378 helo=[192.168.95.111])
 by relay.hosting.mail.nic.ru with esmtp (Exim 5.55)
 (envelope-from <kiryushin@ancud.ru>) id 1rfOja-00034v-6A;
 Wed, 28 Feb 2024 21:32:51 +0300
Received: from [87.245.155.195] (account kiryushin@ancud.ru HELO
 [192.168.95.111]) by incarp1102.mail.hosting.nic.ru (Exim 5.55)
 with id 1rfOja-000Yz9-2h; Wed, 28 Feb 2024 21:32:50 +0300
Message-ID: <79c92cfa-cf5a-4a23-8a93-11c1af7432fc@ancud.ru>
Date: Wed, 28 Feb 2024 21:32:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nikita Kiryushin <kiryushin@ancud.ru>
Subject: [PATCH] drm/i915: Remove unneeded double drm_rect_visible call in
 check_overlay_dst
References: <>
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Manasi Navare <manasi.d.navare@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 project@linuxtesting.org
In-Reply-To: <>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MS-Exchange-Organization-SCL: -1
X-Mailman-Approved-At: Thu, 29 Feb 2024 08:32:59 +0000
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
Reply-To: Nikita Kiryushin <kiryushin@ancud.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


check_overlay_dst for clipped is called 2 times: in drm_rect_intersect 
and than directly. Change second call for check of drm_rect_intersect 
result to save some time (in locked code section).

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 8d8b2dd3995f ("drm/i915: Make the PIPESRC rect relative to the 
entire bigjoiner area")
Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>
---
  drivers/gpu/drm/i915/display/intel_overlay.c | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c 
b/drivers/gpu/drm/i915/display/intel_overlay.c
index 2b1392d5a902..1cda1c163a92 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -972,9 +972,8 @@ static int check_overlay_dst(struct intel_overlay 
*overlay,
  		      rec->dst_width, rec->dst_height);
   	clipped = req;
-	drm_rect_intersect(&clipped, &crtc_state->pipe_src);
  -	if (!drm_rect_visible(&clipped) ||
+	if (!drm_rect_intersect(&clipped, &crtc_state->pipe_src) ||
  	    !drm_rect_equals(&clipped, &req))
  		return -EINVAL;
  -- 2.34.1

