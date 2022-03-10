Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A18554D497E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 15:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCE110E3A7;
	Thu, 10 Mar 2022 14:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1648710E382;
 Thu, 10 Mar 2022 14:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646923247; x=1678459247;
 h=from:to:cc:subject:date:message-id;
 bh=eayi+oq15692aYofIN5ji8ojHZ2Jfo5qTz4SqBOCw6U=;
 b=Kq/oPYx5CuD+8XHmO7PvfIUCfGvgs9EyluIgaw+uRPJ6nbaR8I/NVwx8
 uheUlWemVTnwP91ljIl3vhsV23m1RSTHa3Gqj8RhSuZdBT17GsImVy0oT
 xMMkjvS6TXluDhJ3kOnovtQwCQ0NjeYwEbj53Todg3iRwDB0yWwYnE2y7
 24Nn95aCZOD8luAPergKljBxAG7j2w/eKHaUWM97O+/kFeZP0gPmwwnob
 zSA9RE8i+GRnkgQwu95DFiaKjPT0ZgUBXRcy8o42DGj5XpdYcPtbTz65i
 t+5FGdEfHXjckrtx/8vi3GiRR/ySSVA5BaFuIGTLHvcBQRrcbsKpZFzsN g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="255000894"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="255000894"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 06:40:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="538477302"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga007.jf.intel.com with ESMTP; 10 Mar 2022 06:40:45 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v5 0/5] enhanced edid driver compatibility
Date: Thu, 10 Mar 2022 22:54:19 +0800
Message-Id: <20220310145424.32643-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: jani.nikula@intel.com, ankit.k.nautiyal@intel.com,
 Lee Shawn C <shawn.c.lee@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support to parse multiple CEA extension blocks and HF-EEODB to
extend drm edid driver's capability.

v4: add one more patch to support HF-SCDB
v5: HF-SCDB and HF-VSDBS carry the same SCDS data. Reuse
    drm_parse_hdmi_forum_vsdb() to parse this packet.

Lee Shawn C (5):
  drm/edid: seek for available CEA block from specific EDID block index
  drm/edid: parse multiple CEA extension block
  drm/edid: read HF-EEODB ext block
  drm/edid: parse HF-EEODB CEA extension block
  drm/edid: check for HF-SCDB block

 drivers/gpu/drm/drm_connector.c |   8 +-
 drivers/gpu/drm/drm_displayid.c |   5 +-
 drivers/gpu/drm/drm_edid.c      | 172 ++++++++++++++++++++++++--------
 include/drm/drm_edid.h          |   4 +-
 4 files changed, 142 insertions(+), 47 deletions(-)

-- 
2.31.1

