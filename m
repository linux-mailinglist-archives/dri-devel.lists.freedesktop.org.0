Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B283970E4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2896E9CD;
	Tue,  1 Jun 2021 10:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27A76E10C;
 Tue,  1 Jun 2021 10:05:58 +0000 (UTC)
IronPort-SDR: c/vbje3Fx/CEwGvFw60OHDJ5UYCVa08ELqEiQBNM+dZ4NyX/ZV2sR+vI+JpMrFs9sl4biWUD73
 qlgx4rykXsLw==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="183197715"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="183197715"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:44 -0700
IronPort-SDR: l42+PHjSaC1K4ps+/dH7HHDocTMwtzxbw07I2bUR2qCVhgeM6rugvH6aC9YzWEuBXD597Ynjqm
 k6W7dczNhIpQ==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="399245118"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:35 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] Enhance pipe color support for multi segmented luts
Date: Tue,  1 Jun 2021 16:11:26 +0530
Message-Id: <20210601104135.29020-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Uma Shankar <uma.shankar@intel.com>, bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modern hardwares have multi segmented lut approach to prioritize
the darker regions of the spectrum. This series introduces a new
UAPI to define the lut ranges supported by the respective hardware.

This also enables Pipe Color Management Support for Intel's XE_LPD hw.
Enable Support for Pipe Degamma with the increased lut samples
supported by hardware. This also adds support for newly introduced
Logarithmic Gamma for XE_LPD. Also added the gamma readout support.

The Logarithmic gamma implementation on XE_LPD is non linear and adds 25
segments with non linear lut samples in each segment. The expectation
is userspace will create the luts as per this distribution and pass
the final samples to driver to be programmed in hardware.

+-----+------------------------------+
| x   |  2 pow x segment|No of Entries
|     |  0              | 1          |
| 0   |  1              | 1          |
| 1   |  2              | 2          |
| 2   |  4              | 2          |
| 3   |  8              | 2          |
| 4   |  16             | 2          |
| 5   |  32             | 4          |
| 6   |  64             | 4          |
| 7   |  128            | 4          |
| 8   |  256            | 8          |
| 9   |  512            | 8          |
| 10  |  1024           | 8          |
| 11  |  2048           | 16         |
| 12  |  4096           | 16         |
| 13  |  8192           | 16         |
| 14  |  16384          | 32         |
| 15  |  32768          | 32         |
| 16  |  65536          | 64         |
| 17  |  131072         | 64         |
| 18  |  262144         | 64         |
| 19  |  524288         | 32         |
| 20  |  1048576        | 32         |
| 21  |  2097152        | 32         |
| 22  |  4194304        | 32         |
| 23  |  8388608        | 32         |
| 24  |  16777216       | 1          |
|     | Total Entries   | 511        |
 -----+-----------------+------------+

Credits: Special mention and credits to Ville Syrjala for coming up
with a design for this feature and inputs. This series is based on
his original design.

Note: Userspace support for this new UAPI will be done on Chrome and
plan is to get this supported on mutter as well. We will notify the
list once we have that ready for review.

Uma Shankar (9):
  drm: Add gamma mode property
  drm/i915/xelpd: Define color lut range structure
  drm/i915/xelpd: Add support for Logarithmic gamma mode
  drm/i915/xelpd: Attach gamma mode property
  drm: Add Client Cap for advance gamma mode
  drm/i915/xelpd: logarithmic gamma enabled only with advance gamma mode
  drm/i915/xelpd: Enable Pipe Degamma
  drm/i915/xelpd: Add Pipe Color Lut caps to platform config
  drm/i915/xelpd: Enable XE_LPD Gamma Lut readout

 drivers/gpu/drm/drm_atomic_uapi.c          |   8 +
 drivers/gpu/drm/drm_color_mgmt.c           |  75 ++++
 drivers/gpu/drm/drm_ioctl.c                |   5 +
 drivers/gpu/drm/i915/display/intel_color.c | 454 ++++++++++++++++++++-
 drivers/gpu/drm/i915/i915_pci.c            |   3 +-
 drivers/gpu/drm/i915/i915_reg.h            |   7 +
 include/drm/drm_atomic.h                   |   1 +
 include/drm/drm_color_mgmt.h               |   8 +
 include/drm/drm_crtc.h                     |  25 ++
 include/drm/drm_file.h                     |   8 +
 include/uapi/drm/drm.h                     |   8 +
 include/uapi/drm/drm_mode.h                |  43 ++
 12 files changed, 630 insertions(+), 15 deletions(-)

-- 
2.26.2

