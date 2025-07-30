Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C28CB1591C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 08:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E654E10E143;
	Wed, 30 Jul 2025 06:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2UUMkZu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670AA10E143;
 Wed, 30 Jul 2025 06:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753858274; x=1785394274;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Vn/k1gJm5EUiZU20ZKCK+WUhp2u9RDKPWPB0irTdxo=;
 b=B2UUMkZum6Te+I/XNlWoRz2jRSo6V22ip8YsNsDK8Uei+NDm9THfEC68
 298zhehn3zHgbbY7O48+KdUYhaa7FupTDNioy7G1n/9kobuJmrClNNjpG
 Ttm6Q1c8VkFkBqiK28WtWzsEbtVR14acFhWfCpa16uF+bAWU6g5FdLquQ
 bu62iKMgf49FWF9NBBVhqXNe+cnY3aNUzKI7mhEvKx9OO/OvjSiGbT9Om
 k+M2GuFQxBOse5b0EuB5gFbt21WmtBVgX4VfVFhtT6N5ZikdD7rGIGtNT
 jvORorKd9zTWl9IaveN12NmIGWPifhOtXcyo7uud/L2jQ57GksipawB3L Q==;
X-CSE-ConnectionGUID: uGN4rXvrSvKLDtIPf0jZsQ==
X-CSE-MsgGUID: diXW8cr5SHOvgQrm6aLTgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="66847914"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66847914"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 23:51:14 -0700
X-CSE-ConnectionGUID: Hwxg8gKWTtWA/ePUt7o7Pg==
X-CSE-MsgGUID: Ce1cX9M3QA6XLlwOI5sQ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162178261"
Received: from aravind-dev.iind.intel.com ([10.190.239.36])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 23:51:10 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>, Ruhl@freedesktop.org,
	Michael J <michael.j.ruhl@intel.com>,
	Riana Tauro <riana.tauro@intel.com>,
	Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [RFC v5 0/5] Proposal to use netlink for RAS and Telemetry across drm
 subsystem
Date: Wed, 30 Jul 2025 12:19:51 +0530
Message-Id: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Revisiting this patch series to address pending feedback and help move
the discussion towards a conclusion. This revision includes updates
based on previous comments[1] and aims to clarify outstanding concerns.
Specifically added command to facility reporting errors from IP blocks
to support AMDGPU driver model of RAS.
[1]: https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@linux.intel.com/

I sincerely appreciate everyones patience and thoughtful reviews so
far, and I hope this refreshed series facilitates the final evaluation
and acceptance.

Please feel free to share any further suggestions or questions.

Thank you for your continued consideration.
----------------------------------------------------------------------

Our hardware supports RAS(Reliability, Availability, Serviceability) by
reporting the errors to the host, which the KMD processes and exposes a
set of error counters which can be used by observability tools to take 
corrective actions or repairs. Traditionally there were being exposed 
via PMU (for relative counters) and sysfs interface (for absolute 
value) in our internal branch. But, due to the limitations in this 
approach to use two interfaces and also not able to have an event based 
reporting or configurability, an alternative approach to try netlink 
was suggested by community for drm subsystem wide UAPI for RAS and 
telemetry as discussed in [2]. 

This [2] is the inspiration to this series. It uses the generic
netlink(genl) family subsystem and exposes a set of commands that can
be used by every drm driver, the framework provides a means to have
custom commands too. Each drm driver instance in this example xe driver
instance registers a family and operations to the genl subsystem through
which it enumerates and reports the error counters. An event based
notification is also supported to which userpace can subscribe to and
be notified when any error occurs and read the error counter this avoids
continuous polling on error counter. This can also be extended to
threshold based notification.

[2]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html

This series is on top [3] series which introduces error counting infra in Xe
driver.
[3]: https://lore.kernel.org/all/20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com/

V5:
Add support to read error corresponding to an IP BLOCK

v4:
1. Rebase
2. rename drm_genl_send to drm_genl_reply
3. catch error from xa_store and handle appropriately
4. presently xe_list_errors fills blank data for IGFX, prevent it by
having an early check of IS_DGFX (Michael J. Ruhl)

v3:
1. Rebase on latest RAS series for XE
2. drop DRIVER_NETLINK flag and use the driver_genl_ops structure to
register to netlink subsystem

v2: define common interfaces to genl netlink subsystem that all drm drivers
can leverage.

Below is an example tool drm_ras which demonstrates the use of the
supported commands. The tool will be sent to ML with the subject
"[RFC i-g-t v3 0/1] A tool to demonstrate use of netlink sockets to read RAS error counters"
https://lore.kernel.org/all/20250730061342.1380217-2-aravind.iddamsetty@linux.intel.com/

read single error counter:

$ ./drm_ras READ_ONE --device=drm:/dev/dri/card1 --error_id=0x0000000000000005
counter value 0

read all error counters:

$ ./drm_ras READ_ALL --device=drm:/dev/dri/card1
name                                                    config-id               counter

error-gt0-correctable-guc                               0x0000000000000001      0
error-gt0-correctable-slm                               0x0000000000000003      0
error-gt0-correctable-eu-ic                             0x0000000000000004      0
error-gt0-correctable-eu-grf                            0x0000000000000005      0
error-gt0-fatal-guc                                     0x0000000000000009      0
error-gt0-fatal-slm                                     0x000000000000000d      0
error-gt0-fatal-eu-grf                                  0x000000000000000f      0
error-gt0-fatal-fpu                                     0x0000000000000010      0
error-gt0-fatal-tlb                                     0x0000000000000011      0
error-gt0-fatal-l3-fabric                               0x0000000000000012      0
error-gt0-correctable-subslice                          0x0000000000000013      0
error-gt0-correctable-l3bank                            0x0000000000000014      0
error-gt0-fatal-subslice                                0x0000000000000015      0
error-gt0-fatal-l3bank                                  0x0000000000000016      0
error-gt0-sgunit-correctable                            0x0000000000000017      0
error-gt0-sgunit-nonfatal                               0x0000000000000018      0
error-gt0-sgunit-fatal                                  0x0000000000000019      0
error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a      0
error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b      0
error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c      0
error-gt0-soc-fatal-punit                               0x000000000000001d      0
error-gt0-soc-fatal-psf-0                               0x000000000000001e      0
error-gt0-soc-fatal-psf-1                               0x000000000000001f      0
error-gt0-soc-fatal-psf-2                               0x0000000000000020      0
error-gt0-soc-fatal-cd0                                 0x0000000000000021      0
error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022      0
error-gt0-soc-fatal-mdfi-east                           0x0000000000000023      0
error-gt0-soc-fatal-mdfi-south                          0x0000000000000024      0
error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025      0
error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026      0
error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027      0
error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028      0
error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029      0
error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a      0
error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b      0
error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c      0
error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d      0
error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e      0
error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f      0
error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030      0
error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031      0
error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032      0
error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033      0
error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034      0
error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035      0
error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036      0
error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037      0
error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038      0
error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039      0
error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a      0
error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b      0
error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c      0
error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d      0
error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e      0
error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f      0
error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040      0
error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041      0
error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042      0
error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043      0
error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044      0
error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045      0
error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046      0
error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047      0
error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048      0
error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049      0
error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a      0
error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b      0
error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c      0
error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d      0
error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e      0
error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f      0
error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050      0
error-gt1-correctable-guc                               0x1000000000000001      0
error-gt1-correctable-slm                               0x1000000000000003      0
error-gt1-correctable-eu-ic                             0x1000000000000004      0
error-gt1-correctable-eu-grf                            0x1000000000000005      0
error-gt1-fatal-guc                                     0x1000000000000009      0
error-gt1-fatal-slm                                     0x100000000000000d      0
error-gt1-fatal-eu-grf                                  0x100000000000000f      0
error-gt1-fatal-fpu                                     0x1000000000000010      0
error-gt1-fatal-tlb                                     0x1000000000000011      0
error-gt1-fatal-l3-fabric                               0x1000000000000012      0
error-gt1-correctable-subslice                          0x1000000000000013      0
error-gt1-correctable-l3bank                            0x1000000000000014      0
error-gt1-fatal-subslice                                0x1000000000000015      0
error-gt1-fatal-l3bank                                  0x1000000000000016      0
error-gt1-sgunit-correctable                            0x1000000000000017      0
error-gt1-sgunit-nonfatal                               0x1000000000000018      0
error-gt1-sgunit-fatal                                  0x1000000000000019      0
error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a      0
error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b      0
error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c      0
error-gt1-soc-fatal-punit                               0x100000000000001d      0
error-gt1-soc-fatal-psf-0                               0x100000000000001e      0
error-gt1-soc-fatal-psf-1                               0x100000000000001f      0
error-gt1-soc-fatal-psf-2                               0x1000000000000020      0
error-gt1-soc-fatal-cd0                                 0x1000000000000021      0
error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022      0
error-gt1-soc-fatal-mdfi-east                           0x1000000000000023      0
error-gt1-soc-fatal-mdfi-south                          0x1000000000000024      0
error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025      0
error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026      0
error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027      0
error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028      0
error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029      0
error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a      0
error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b      0
error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c      0
error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d      0
error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e      0
error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f      0
error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030      0
error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031      0
error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032      0
error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033      0
error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034      0
error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035      0
error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036      0
error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037      0
error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038      0
error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039      0
error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a      0
error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b      0
error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c      0
error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d      0
error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e      0
error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f      0
error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040      0
error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041      0
error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042      0
error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043      0
error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044      0

wait on a error event:

$ ./drm_ras WAIT_ON_EVENT --device=drm:/dev/dri/card1
waiting for error event
error event received
counter value 0

list all errors:

$ ./drm_ras LIST_ERRORS --device=drm:/dev/dri/card1
name                                                    config-id

error-gt0-correctable-guc                               0x0000000000000001
error-gt0-correctable-slm                               0x0000000000000003
error-gt0-correctable-eu-ic                             0x0000000000000004
error-gt0-correctable-eu-grf                            0x0000000000000005
error-gt0-fatal-guc                                     0x0000000000000009
error-gt0-fatal-slm                                     0x000000000000000d
error-gt0-fatal-eu-grf                                  0x000000000000000f
error-gt0-fatal-fpu                                     0x0000000000000010
error-gt0-fatal-tlb                                     0x0000000000000011
error-gt0-fatal-l3-fabric                               0x0000000000000012
error-gt0-correctable-subslice                          0x0000000000000013
error-gt0-correctable-l3bank                            0x0000000000000014
error-gt0-fatal-subslice                                0x0000000000000015
error-gt0-fatal-l3bank                                  0x0000000000000016
error-gt0-sgunit-correctable                            0x0000000000000017
error-gt0-sgunit-nonfatal                               0x0000000000000018
error-gt0-sgunit-fatal                                  0x0000000000000019
error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a
error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b
error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c
error-gt0-soc-fatal-punit                               0x000000000000001d
error-gt0-soc-fatal-psf-0                               0x000000000000001e
error-gt0-soc-fatal-psf-1                               0x000000000000001f
error-gt0-soc-fatal-psf-2                               0x0000000000000020
error-gt0-soc-fatal-cd0                                 0x0000000000000021
error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022
error-gt0-soc-fatal-mdfi-east                           0x0000000000000023
error-gt0-soc-fatal-mdfi-south                          0x0000000000000024
error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025
error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026
error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027
error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028
error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029
error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a
error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b
error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c
error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d
error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e
error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f
error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030
error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031
error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032
error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033
error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034
error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035
error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036
error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037
error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038
error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039
error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a
error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b
error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c
error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d
error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e
error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f
error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040
error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041
error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042
error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043
error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044
error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045
error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046
error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047
error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048
error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049
error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a
error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b
error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c
error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d
error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e
error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f
error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050
error-gt1-correctable-guc                               0x1000000000000001
error-gt1-correctable-slm                               0x1000000000000003
error-gt1-correctable-eu-ic                             0x1000000000000004
error-gt1-correctable-eu-grf                            0x1000000000000005
error-gt1-fatal-guc                                     0x1000000000000009
error-gt1-fatal-slm                                     0x100000000000000d
error-gt1-fatal-eu-grf                                  0x100000000000000f
error-gt1-fatal-fpu                                     0x1000000000000010
error-gt1-fatal-tlb                                     0x1000000000000011
error-gt1-fatal-l3-fabric                               0x1000000000000012
error-gt1-correctable-subslice                          0x1000000000000013
error-gt1-correctable-l3bank                            0x1000000000000014
error-gt1-fatal-subslice                                0x1000000000000015
error-gt1-fatal-l3bank                                  0x1000000000000016
error-gt1-sgunit-correctable                            0x1000000000000017
error-gt1-sgunit-nonfatal                               0x1000000000000018
error-gt1-sgunit-fatal                                  0x1000000000000019
error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a
error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b
error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c
error-gt1-soc-fatal-punit                               0x100000000000001d
error-gt1-soc-fatal-psf-0                               0x100000000000001e
error-gt1-soc-fatal-psf-1                               0x100000000000001f
error-gt1-soc-fatal-psf-2                               0x1000000000000020
error-gt1-soc-fatal-cd0                                 0x1000000000000021
error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022
error-gt1-soc-fatal-mdfi-east                           0x1000000000000023
error-gt1-soc-fatal-mdfi-south                          0x1000000000000024
error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025
error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026
error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027
error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028
error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029
error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a
error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b
error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c
error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d
error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e
error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f
error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030
error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031
error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032
error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033
error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034
error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035
error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036
error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037
error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038
error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039
error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a
error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b
error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c
error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d
error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e
error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f
error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040
error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041
error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042
error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043
error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Lijo Lazar <lijo.lazar@amd.com>
Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>


Aravind Iddamsetty (5):
  drm/netlink: Add netlink infrastructure
  drm/xe/RAS: Register netlink capability
  drm/xe/RAS: Expose the error counters
  drm/netlink: Define multicast groups
  drm/xe/RAS: send multicast event on occurrence of an error

 drivers/gpu/drm/Makefile             |   1 +
 drivers/gpu/drm/drm_drv.c            |   7 +
 drivers/gpu/drm/drm_netlink.c        | 219 +++++++++++
 drivers/gpu/drm/xe/Makefile          |   2 +
 drivers/gpu/drm/xe/xe_device.c       |   6 +
 drivers/gpu/drm/xe/xe_device_types.h |   1 +
 drivers/gpu/drm/xe/xe_hw_error.c     |  56 ++-
 drivers/gpu/drm/xe/xe_netlink.c      | 531 +++++++++++++++++++++++++++
 include/drm/drm_device.h             |  10 +
 include/drm/drm_drv.h                |   7 +
 include/drm/drm_netlink.h            |  46 +++
 include/uapi/drm/drm_netlink.h       | 105 ++++++
 include/uapi/drm/xe_drm.h            |  85 +++++
 13 files changed, 1071 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_netlink.c
 create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
 create mode 100644 include/drm/drm_netlink.h
 create mode 100644 include/uapi/drm/drm_netlink.h

-- 
2.25.1

