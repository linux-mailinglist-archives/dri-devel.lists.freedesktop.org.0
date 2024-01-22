Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADB5836230
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8825C10EDF9;
	Mon, 22 Jan 2024 11:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACAD10EDF1;
 Mon, 22 Jan 2024 11:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705923694; x=1737459694;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TFWI6JTKREohL41oXLi1D5cttfNwbBSLh8m7YgHZDUg=;
 b=HlD1XX14W4qAxTpQDZ7HeKVYqJ2Q29wwoQYLdnKRB+iq7ePh45Zma7PL
 3gqXSzQzTQtT1bLj3v4Smj/z8Od1yeWb5asmmiQpQHTfl1br3FOzh3O7x
 TejuouBD2zzHxPQlNLjDESuqyVsWWUusvYohrHKVYIx94xn2z+HV7iOhj
 iTiUHskdF4bFFQ2Xak2A3plGoqPDKjHAL0E721RSQnLKRlZecukQJ2VWN
 OcIyRz3TT4TzD6Jl6N2dfcPlTwOFYP32nt9yNL6MtAMuafq/XAY8OuIHz
 paxyPYb2HUzmM+P8zSTfswAfI0IUUrEBvqjPlWYi4H3SVMZK02B6qQkwK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="432347117"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="432347117"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 03:41:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="904825864"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="904825864"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 03:41:26 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id E3EFC11FAD4;
 Mon, 22 Jan 2024 13:41:21 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-pm@vger.kernel.org
Subject: [PATCH v3 0/2] Small runtime PM API changes
Date: Mon, 22 Jan 2024 13:41:20 +0200
Message-Id: <20240122114121.56752-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, David Airlie <airlied@gmail.com>,
 Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Daniel Vetter <daniel@ffwll.ch>,
 netdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi folks,

Here's a small but a different set of patches for making two relatively
minor changes to runtime PM API. I restarted version numbering as this is
meaningfully different from the previous set.

pm_runtime_get_if_active() loses its second argument as it only made sense
to have ign_usage_count argument true.

The other change is also small but it has an effect on callers:
pm_runtime_put_autosuspend() will, in the future, be re-purposed to
include a call to pm_runtime_mark_last_busy() as well. Before this,
current users of the function are moved to __pm_runtime_put_autosuspend()
(added by this patchset) which will continue to have the current
behaviour.

I haven't included the conversion patches in this set as I only want to do
that once this set has been approved and merged. The tree specific patches
can be found here, on linux-next master (there are some V4L2 patches
there, too, please ignore them for now):
<URL:https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-next.git/log/?h=pm>

Later on, users calling pm_runtime_mark_last_busy() immediately followed
by __pm_runtime_put_autosuspend() will be switched back to
pm_runtime_put_autosuspend() once its behaviour change has been done (a
patch near top of that branch). I'll provide these once the preceding ones
have been merged.

Comments are welcome.

since v2:

- Rebase on v6.8-rc1 (no changes).

- Add Rodrigo's Reviewed-by: to the 1st patch.

since v1:

- patch 1: Rename __pm_runtime_get_conditional() as
  pm_runtime_get_conditional().

- patch 1: Reword documentation on driver use of
  pm_runtime_get_conditional().

Sakari Ailus (2):
  pm: runtime: Simplify pm_runtime_get_if_active() usage
  pm: runtime: Add pm_runtime_put_autosuspend() replacement

 Documentation/power/runtime_pm.rst      | 22 ++++++++-----
 drivers/accel/ivpu/ivpu_pm.c            |  2 +-
 drivers/base/power/runtime.c            | 10 ++++--
 drivers/gpu/drm/i915/intel_runtime_pm.c |  2 +-
 drivers/gpu/drm/xe/xe_pm.c              |  2 +-
 drivers/media/i2c/ccs/ccs-core.c        |  2 +-
 drivers/media/i2c/ov64a40.c             |  2 +-
 drivers/media/i2c/thp7312.c             |  2 +-
 drivers/net/ipa/ipa_smp2p.c             |  2 +-
 drivers/pci/pci.c                       |  2 +-
 include/linux/pm_runtime.h              | 44 ++++++++++++++++++++++---
 sound/hda/hdac_device.c                 |  2 +-
 12 files changed, 68 insertions(+), 26 deletions(-)

-- 
2.39.2

