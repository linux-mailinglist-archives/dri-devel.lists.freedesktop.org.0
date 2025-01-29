Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB77A21D3D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 13:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D27010E7E2;
	Wed, 29 Jan 2025 12:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPp72oRP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B489910E7E2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 12:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738154414; x=1769690414;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WZwAKJHpzRQyMQw3IDx6Ox2Ft1VLKyaZGg/BnViWav8=;
 b=KPp72oRPxzR+01VKA8nCPUGCbOTj6NZw++K5RPSZ7cNtMkJwxkvpLq4A
 XrPhyk7cScCoh9wgTQbFABis6XnVK9O93kyL3QJ4xrnhSbIsXZyBE1Z4D
 34F0goW8DhTmIrSgIrzPN6Svw3SkVaLGr0UZrdB3CMGZa1ECCiC//q1Kg
 WP8Od6LiP5ElTGlh3vjgYjP5gMEN6YpLFOCbZwiErVsEMmkB9WR/0VD73
 VTS6ZhjWz4z7zmREe+DbR8jvidkDayMV0pvY/Tk84NkLki57hmhhSB5QG
 aA5UwBAv1Oh8U+GNipVCgTHw+M2ImonH4kag5nZ8PdblSoNHkEwaw0xJ3 A==;
X-CSE-ConnectionGUID: f6EyhyOKTAemdNO+CU90gw==
X-CSE-MsgGUID: 3fKvyTa8QHyGgCkxRN8uLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49647257"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="49647257"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:40:14 -0800
X-CSE-ConnectionGUID: 4rT3YA3tSkiuJmHpypX2OQ==
X-CSE-MsgGUID: dyaRBujQScqfnWMVqAdIag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113030858"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:40:11 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 0/3] accel/ivpu: Fixes for 6.14
Date: Wed, 29 Jan 2025 13:40:06 +0100
Message-ID: <20250129124009.1039982-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

Stability fixes focused around power management and error handling.

Jacek Lawrynowicz (3):
  accel/ivpu: Fix error handling in ivpu_boot()
  accel/ivpu: Clear runtime_error after pm_runtime_resume_and_get()
    fails
  accel/ivpu: Fix error handling in recovery/reset

 drivers/accel/ivpu/ivpu_drv.c |  8 +++-
 drivers/accel/ivpu/ivpu_pm.c  | 84 ++++++++++++++++++++---------------
 2 files changed, 53 insertions(+), 39 deletions(-)

--
2.45.1
