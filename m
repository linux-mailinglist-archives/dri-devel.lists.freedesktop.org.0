Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 934F8788658
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 13:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF70D10E652;
	Fri, 25 Aug 2023 11:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9A410E652;
 Fri, 25 Aug 2023 11:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692964285; x=1724500285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PAS9NabjFqrUrSSQsCDos1WbWOfw5xiBf7+ecBmOrHM=;
 b=TGTQkivogcbr54QCLCQ2qFeFPOux2HwSWcPMQ6f73/tjDMRV6qjTcgMX
 QEppWXNNx7xbwa5iHppvu4lN1MbmxKUk8R1i8HzVKbYQIY7/hP00F9r5d
 slXgZaDrREPvhuRyN/v/2eb8lgoY2Ywu6NJAyLjxNtt/lsXO45IduXOEY
 IDGq5vQXNCHzWsXiHsQze+b1a3mjh5PAZLITYWhwDbok9cIDLe7ZMy7tE
 2l9wyWOF1v/O0Ln8icv5Kgfe4aSLmok7bFrparTuggNjxyH5zMVNpNsvZ
 oo0XrfVIeFKDDFl8iOSSpl8DP4E65FY0KshXNbZIeQQpq+uWN52L69Frb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="359694697"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="359694697"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="881153533"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:51:24 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC v2 0/5] Proposal to use netlink for RAS and Telemetry across drm
 subsystem
Date: Fri, 25 Aug 2023 17:25:26 +0530
Message-Id: <20230825115531.800574-1-aravind.iddamsetty@linux.intel.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 dri-devel@lists.freedesktop.org, Tuikov Luben <Luben.Tuikov@amd.com>,
 Tomer Tayar <ttayar@habana.ai>, Alex Deucher <alexander.deucher@amd.com>,
 Kuehling Felix <Felix.Kuehling@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Respin on old xe base, would like to get agreement on the design first.
 
Our hardware supports RAS(Reliability, Availability, Serviceability) by
reporting the errors to the host, which the KMD processes and exposes a
set of error counters which can be used by observability tools to take 
corrective actions or repairs. Traditionally there were being exposed 
via PMU (for relative counters) and sysfs interface (for absolute 
value) in our internal branch. But, due to the limitations in this 
approach to use two interfaces and also not able to have an event based 
reporting or configurability, an alternative approach to try netlink 
was suggested by community for drm subsystem wide UAPI for RAS and 
telemetry as discussed in [1]. 

This [1] is the inspiration to this series. It uses the generic
netlink(genl) family subsystem and exposes a set of commands that can
be used by every drm driver, the framework provides a means to have
custom commands too. Each drm driver instance in this example xe driver
instance registers a family and operations to the genl subsystem through
which it enumerates and reports the error counters. An event based
notification is also supported to which userpace can subscribe to and
be notified when any error occurs and read the error counter this avoids
continuous polling on error counter. This can also be extended to
threshold based notification.

[1]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html

this series is on top of https://patchwork.freedesktop.org/series/116181/

v2: define common interfaces to genl netlink subsystem that all drm drivers
can leverage.

Below is an example tool drm_ras which demonstrates the use of the
supported commands. The tool will be sent to ML with the subject
"[RFC i-g-t v2 0/1] A tool to demonstrate use of netlink sockets to read RAS error counters"

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
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Tomer Tayar <ttayar@habana.ai>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Cc: Kuehling Felix <Felix.Kuehling@amd.com>
Cc: Tuikov Luben <Luben.Tuikov@amd.com>


Aravind Iddamsetty (5):
  drm/netlink: Add netlink infrastructure
  drm/xe/RAS: Register netlink capability
  drm/xe/RAS: Expose the error counters
  drm/netlink: Define multicast groups
  drm/xe/RAS: send multicast event on occurrence of an error

 drivers/gpu/drm/Makefile             |   1 +
 drivers/gpu/drm/drm_drv.c            |   7 +
 drivers/gpu/drm/drm_netlink.c        | 177 +++++++++++
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device.c       |   6 +-
 drivers/gpu/drm/xe/xe_device_types.h |   1 +
 drivers/gpu/drm/xe/xe_irq.c          |  32 ++
 drivers/gpu/drm/xe/xe_netlink.c      | 419 +++++++++++++++++++++++++++
 include/drm/drm_device.h             |   8 +
 include/drm/drm_drv.h                |  14 +
 include/drm/drm_netlink.h            |  49 ++++
 include/uapi/drm/drm_netlink.h       |  66 +++++
 include/uapi/drm/xe_drm.h            |  64 ++++
 13 files changed, 844 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_netlink.c
 create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
 create mode 100644 include/drm/drm_netlink.h
 create mode 100644 include/uapi/drm/drm_netlink.h

-- 
2.25.1

