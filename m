Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFC23E41C0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 10:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D4D89803;
	Mon,  9 Aug 2021 08:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2DD897EB;
 Mon,  9 Aug 2021 08:43:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5850C61019;
 Mon,  9 Aug 2021 08:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628498593;
 bh=vhFRMUfry1hcL4yr1bTOCWEQeeGGHpAHF1gbIyRTBBQ=;
 h=Subject:To:Cc:From:Date:From;
 b=EIWEVF+9qj9wybKPqyYsSzOQX7kJxdhrbvpLAqiMI6e4afsEzu2F5DOjf3qcvK7Ct
 8Z6JqCu+w9mdkm6w3R52zR2A6XQJPBLX22tEcZ1y/owY+KJVihizWc/YxmfTV0QkJ0
 efsUkzUeyDLFksNilwtJzdX8G7KsGmp7oY7TqDZk=
Subject: Patch "drm/amdgpu: fix checking pmops when PM_SLEEP is not enabled"
 has been added to the 5.13-stable tree
To: Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 rdunlap@infradead.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 09 Aug 2021 10:43:02 +0200
Message-ID: <1628498582207164@kroah.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/amdgpu: fix checking pmops when PM_SLEEP is not enabled

to the 5.13-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-amdgpu-fix-checking-pmops-when-pm_sleep-is-not-enabled.patch
and it can be found in the queue-5.13 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 5706cb3c910cc8283f344bc37a889a8d523a2c6d Mon Sep 17 00:00:00 2001
From: Randy Dunlap <rdunlap@infradead.org>
Date: Thu, 29 Jul 2021 20:03:47 -0700
Subject: drm/amdgpu: fix checking pmops when PM_SLEEP is not enabled
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Randy Dunlap <rdunlap@infradead.org>

commit 5706cb3c910cc8283f344bc37a889a8d523a2c6d upstream.

'pm_suspend_target_state' is only available when CONFIG_PM_SLEEP
is set/enabled. OTOH, when both SUSPEND and HIBERNATION are not set,
PM_SLEEP is not set, so this variable cannot be used.

../drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c: In function ‘amdgpu_acpi_is_s0ix_active’:
../drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:1046:11: error: ‘pm_suspend_target_state’ undeclared (first use in this function); did you mean ‘__KSYM_pm_suspend_target_state’?
    return pm_suspend_target_state == PM_SUSPEND_TO_IDLE;
           ^~~~~~~~~~~~~~~~~~~~~~~
           __KSYM_pm_suspend_target_state

Also use shorter IS_ENABLED(CONFIG_foo) notation for checking the
2 config symbols.

Fixes: 91e273712ab8dd ("drm/amdgpu: Check pmops for desired suspend state")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -904,7 +904,7 @@ void amdgpu_acpi_fini(struct amdgpu_devi
  */
 bool amdgpu_acpi_is_s0ix_supported(struct amdgpu_device *adev)
 {
-#if defined(CONFIG_AMD_PMC) || defined(CONFIG_AMD_PMC_MODULE)
+#if IS_ENABLED(CONFIG_AMD_PMC) && IS_ENABLED(CONFIG_PM_SLEEP)
 	if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
 		if (adev->flags & AMD_IS_APU)
 			return pm_suspend_target_state == PM_SUSPEND_TO_IDLE;


Patches currently in stable-queue which might be from rdunlap@infradead.org are

queue-5.13/drm-i915-fix-i915_globals_exit-section-mismatch-erro.patch
queue-5.13/drm-amdgpu-fix-checking-pmops-when-pm_sleep-is-not-enabled.patch
