Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4227D7FBC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 11:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B3210E798;
	Thu, 26 Oct 2023 09:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACE010E796
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698313204; x=1729849204;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DPj1eBqbjst8n9ED5LlFWtA72X7oJtzx20L4oY4onyE=;
 b=auszF4aZcikTtvkayasueVdJZ6sPTP8E/ssnrouQ3e2SK+IVLYzbLf7k
 J0/jQvNAnGMZtkP5IBp3zKN3UBn9fyk3c5Eg8+TbKJEUhvr3wgA2trQgj
 qDXuw9Iy3BgAMDhb1mu/p6vimtMIx1E138lcnUpJTAdt6AX8py34PJ1n4
 9EP3RgI6FmEd3IE+ytSDsXMcyd3QMTw37zFbWqoeZkDd5OPj8Lhe9rbom
 2Ud9hEftTD4EaV86+vGohwSexaSiHG/iMjSeU2kH/k7HkXBqiI4s00Mkh
 D2gqeY3w93Av7KnuvE5k/JgIs0Nt3HrIFQShTkrMOBGa9XbbPR75lf+ig g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="384708278"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="384708278"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 02:40:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="7203782"
Received: from tzirr-desk2.ger.corp.intel.com (HELO localhost) ([10.252.49.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 02:39:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] drm/bridge: start moving towards struct drm_edid
Date: Thu, 26 Oct 2023 12:39:54 +0300
Message-Id: <cover.1698312534.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is just the first two patches of a lengthy series that I'm not
really sure how to proceed with. Basically the series converts all of
drm/bridge to the new struct drm_edid infrastructure. It's safer than
struct edid, because it contains meta information about the allocated
size of the EDID, instead of relying on the size (number of extensions)
originating from outside of the kernel.

The rest is at [1]. The commit messages are lacking, and I don't really
have the toolchain to even build test most of it. But I think this is
where drm/bridge should go. Among all of drm, I think bridge has the
most uses of struct edid that do not originate from the drm_get_edid()
family of functions, which means the validity checks are somewhat
inconsistent, and having the meta information is more crucial.

Bridge maintainers, please instruct how to best proceed with this.


Thanks,
Jani.



[1] https://gitlab.freedesktop.org/jani/linux/-/commits/drm-edid-bridge



Jani Nikula (2):
  drm/bridge: add ->edid_read hook and drm_bridge_edid_read()
  drm/bridge: switch to drm_bridge_read_edid()

 drivers/gpu/drm/drm_bridge.c           | 46 +++++++++++++++++++++++++-
 drivers/gpu/drm/drm_bridge_connector.c | 16 ++++-----
 include/drm/drm_bridge.h               | 33 ++++++++++++++++++
 3 files changed, 86 insertions(+), 9 deletions(-)

-- 
2.39.2

