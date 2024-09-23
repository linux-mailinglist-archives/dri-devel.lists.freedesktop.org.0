Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6724097EE9F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 17:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574EB10E113;
	Mon, 23 Sep 2024 15:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBaoXmHk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF93D10E113
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 15:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727107074; x=1758643074;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=muGHoCCaLZKDvvKk4fGUvlM2RGHvVEFX1RUoVGXV2hQ=;
 b=hBaoXmHkxojBUkSZqCPy1RX3ZyFm0pAjSZDeYOROPkR8A0Jv7y8kM+tv
 sGccniop9V8XqQrnuHgOK6FJatLNXBUFIdMgqc4hVkW1fW+8db7mTzVMZ
 dV9SeEyeYtVtBQRgoanR2KDAri+1KovFhzGr571lxH8Rw1vvI/UCr/a3O
 dpmN850C/kELP2uuAebFaKbqlZa4bPuyu+T074E9I4ijP2d7YzclwKC4n
 Vy1AXmdVJy1Lw3Ef7CPeXTWelPa/+LB0CnkBWpfUCM1nrNUUU55WjVBGY
 yGwCGEgqfppziIqJ9laaw5u7/ZPSjceoxNIKGrH45n5/406kkIfaC6d31 w==;
X-CSE-ConnectionGUID: PPUbPPf/RRWtDQdcMcQSqg==
X-CSE-MsgGUID: yAbxW0C1QYS/avrLg0nkzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="28957214"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="28957214"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 08:57:53 -0700
X-CSE-ConnectionGUID: CaVJQAmXReiE3PPyM/F/1Q==
X-CSE-MsgGUID: rzJgEVMBRcmDm8IMVM0A7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="71250754"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 08:57:51 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 18:57:49 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: linux-fbdev@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] fbcon: Fix 'cursor_blink' sysfs attribute
Date: Mon, 23 Sep 2024 18:57:43 +0300
Message-ID: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make the 'cursor_blink' sysfs attribute actually usable from
udev rules. I also took the opportinity to some cleanups t
the code after getting annoyed by it.

Ville Syrjälä (6):
  fbcon: Make cursor_blink=0 work when configured before fb devices
    appear
  fbcon: Add sysfs attributes before registering the device
  fbcon: fbcon_cursor_noblink -> fbcon_cursor_blink
  fbcon: fbcon_is_inactive() -> fbcon_is_active()
  fbcon: Introduce get_{fg,bg}_color()
  fbcon: Use 'bool' where appopriate

 drivers/video/fbdev/core/fbcon.c | 180 ++++++++++++-------------------
 1 file changed, 69 insertions(+), 111 deletions(-)

-- 
2.44.2

