Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72976524E8E
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 15:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F0310E288;
	Thu, 12 May 2022 13:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BBB10E288;
 Thu, 12 May 2022 13:45:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AAE4AB8282F;
 Thu, 12 May 2022 13:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC03DC385B8;
 Thu, 12 May 2022 13:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1652363151;
 bh=amecu+b7hUyD2IyYoX4OpKTSZNdIjnCsR7PoGb+bGAc=;
 h=Subject:To:Cc:From:Date:From;
 b=IOhDtMRUZBGPQP+3A8XQS7QOz7Gi0CbTl7/hv84rognT3t7yk0slf64k9/U8X8TC2
 jJciE15Kpk+Qdi/2in7jxvGKbTrEBweaWPwZtJ2iioAfa2zxa3wFPWVyoYprfcy1uK
 3ZYNXJKipRj/VRrynHyN+6eav3EeCVq45j8/Q78Q=
Subject: Patch "drm/amd/display/dc/gpio/gpio_service: Pass around correct
 dce_{version, environment} types" has been added to the 5.4-stable tree
To: airlied@linux.ie, alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, harry.wentland@amd.com, lee.jones@linaro.org,
 nathan@kernel.org, sunpeng.li@amd.com
From: <gregkh@linuxfoundation.org>
Date: Thu, 12 May 2022 15:45:34 +0200
Message-ID: <1652363134130192@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/amd/display/dc/gpio/gpio_service: Pass around correct dce_{version, environment} types

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-amd-display-dc-gpio-gpio_service-pass-around-correct-dce_-version-environment-types.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 353f7f3a9dd5fd2833b6462bac89ec1654c9c3aa Mon Sep 17 00:00:00 2001
From: Lee Jones <lee.jones@linaro.org>
Date: Wed, 26 May 2021 09:47:06 +0100
Subject: drm/amd/display/dc/gpio/gpio_service: Pass around correct dce_{version, environment} types
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lee Jones <lee.jones@linaro.org>

commit 353f7f3a9dd5fd2833b6462bac89ec1654c9c3aa upstream.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c: In function ‘dal_gpio_service_create’:
 drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:71:4: warning: implicit conversion from ‘enum dce_version’ to ‘enum dce_environment’ [-Wenum-conversion]
 drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:77:4: warning: implicit conversion from ‘enum dce_version’ to ‘enum dce_environment’ [-Wenum-conversion]

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c           |   12 +++++------
 drivers/gpu/drm/amd/display/include/gpio_service_interface.h |    4 +--
 2 files changed, 8 insertions(+), 8 deletions(-)

--- a/drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c
@@ -53,8 +53,8 @@
  */
 
 struct gpio_service *dal_gpio_service_create(
-	enum dce_version dce_version_major,
-	enum dce_version dce_version_minor,
+	enum dce_version dce_version,
+	enum dce_environment dce_environment,
 	struct dc_context *ctx)
 {
 	struct gpio_service *service;
@@ -67,14 +67,14 @@ struct gpio_service *dal_gpio_service_cr
 		return NULL;
 	}
 
-	if (!dal_hw_translate_init(&service->translate, dce_version_major,
-			dce_version_minor)) {
+	if (!dal_hw_translate_init(&service->translate, dce_version,
+			dce_environment)) {
 		BREAK_TO_DEBUGGER();
 		goto failure_1;
 	}
 
-	if (!dal_hw_factory_init(&service->factory, dce_version_major,
-			dce_version_minor)) {
+	if (!dal_hw_factory_init(&service->factory, dce_version,
+			dce_environment)) {
 		BREAK_TO_DEBUGGER();
 		goto failure_1;
 	}
--- a/drivers/gpu/drm/amd/display/include/gpio_service_interface.h
+++ b/drivers/gpu/drm/amd/display/include/gpio_service_interface.h
@@ -42,8 +42,8 @@ void dal_gpio_destroy(
 	struct gpio **ptr);
 
 struct gpio_service *dal_gpio_service_create(
-	enum dce_version dce_version_major,
-	enum dce_version dce_version_minor,
+	enum dce_version dce_version,
+	enum dce_environment dce_environment,
 	struct dc_context *ctx);
 
 struct gpio *dal_gpio_service_create_irq(


Patches currently in stable-queue which might be from lee.jones@linaro.org are

queue-5.4/drm-amd-display-dc-gpio-gpio_service-pass-around-correct-dce_-version-environment-types.patch
queue-5.4/block-drbd-drbd_nl-make-conversion-to-enum-drbd_ret_code-explicit.patch
