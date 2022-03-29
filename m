Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 979AA4EB37D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 20:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F371310E1C6;
	Tue, 29 Mar 2022 18:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A4310E1C6;
 Tue, 29 Mar 2022 18:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648579346; x=1680115346;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F3eevdYc5FgtlFS1Nvp79MLaywQ6Ilktwn1G/65OeEA=;
 b=j6E1dy33Z+KioisaDtmT/nZ80Q4xeIEusIqfEwWXnGyaESOQTprDQAhh
 9pmQ/yAl1oHKNJHrt3niYZxJHuMwHGknuFSpUvCvLCNUJr0OHOPCkC0/2
 6m9rDVSVI/DQyIMTU45pTFYAK6Fz4tmhJTwFaJTvB7EanpSOZ0888v4z+
 kBkA0zd430wUQUcfbkhaWpk9HuHbMZwJMPuvnERZZoliBmR+2V/crIAk9
 oPnqNOcM3xRC1z031+xJMYP9P/kQ1ec+H8MUSo+zghaewys5bPQxp/kRR
 0SuZUqvueizsRIt5mEjN3kY0sO2spy+vUyeUxfiGlXIDInsQ1pJmejlA5 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="246827959"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="246827959"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:42:25 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="564858604"
Received: from dmendyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.121])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:42:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/12] drm/edid: cleanup and refactoring around validity checks
Date: Tue, 29 Mar 2022 21:42:07 +0300
Message-Id: <cover.1648578814.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Another day, another batch of EDID code refactoring.

Mostly the goal was to simplify drm_do_get_edid(), but trying to extract
a const function for checking a single block validity lead me down a
rabbit hole...

BR,
Jani.


Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Emil Velikov <emil.l.velikov@gmail.com>

Jani Nikula (12):
  drm/edid: use struct edid * in drm_do_get_edid()
  drm/edid: clean up EDID block checksum functions
  drm/edid: add edid_block_tag() helper to get the EDID extension tag
  drm/edid: make drm_edid_header_is_valid() accept void pointer
  drm/edid: clean up edid_is_zero()
  drm/edid: split out edid_header_fix()
  drm/edid: split drm_edid_block_valid() to check and act parts
  drm/edid: use a better variable name for EDID block read retries
  drm/edid: simplify block check when filtering invalid blocks
  drm/edid: split out invalid block filtering to a separate function
  drm/edid: track invalid blocks in drm_do_get_edid()
  drm/edid: reduce magic when updating the EDID block checksum

 drivers/gpu/drm/drm_edid.c | 293 +++++++++++++++++++++----------------
 include/drm/drm_edid.h     |   2 +-
 2 files changed, 171 insertions(+), 124 deletions(-)

-- 
2.30.2

