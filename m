Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1417A9475FF
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 09:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CE110E12C;
	Mon,  5 Aug 2024 07:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KiFZz41e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154B010E12C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 07:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722842736; x=1754378736;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=uBP+UQqllg5obArR77p1h7U2jo1hLyfB0P1taYbsllc=;
 b=KiFZz41ern5oJ+ceufvw0Gq7eZ5tz0du1FXN+iF0n/Ze45eOp5lxqJ8k
 rW/8Au6K7H8+W/l/KIt4dx/Q2IgxxCh+0qbTg1D6rQF6wBdBDONQs6vUI
 XHqUIdj8unIn23dZREyl3Rb8K8xuXXVH+iNLRSMOIhpihcbuRWVJIBHb9
 YIhsS+vS4wz0AZP1FPklyI3TemXmI6w87Pz1r3we6XbOlNObpsMn7DPwq
 IIPOdScJFzRYNMHrdfMuTbbjxYMniU7FAop5zpwV9AFjci0xY7fHYbDmX
 TVO90yxGzNmvDTjEcbmnVt7FzRN3VUR7l31GDLs8y2rGEeNhnbs+C6f6B w==;
X-CSE-ConnectionGUID: jy8Riw5HR4aoO/JMA8tKLg==
X-CSE-MsgGUID: tWsz8QBMQqCQxHt/gaZEJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="32191678"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="32191678"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 00:25:36 -0700
X-CSE-ConnectionGUID: fbvnVJLQQR2Nde23SX8ekg==
X-CSE-MsgGUID: gdhujbIERE+BPQMuRrj0Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="56006582"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 00:25:33 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tony.luck@intel.com, qiuxu.zhuo@intel.com, yudong.wang@intel.com
Subject: Re: [PATCH v2 1/1] drm/fb-helper: Don't schedule_work() to flush
 frame buffer during panic()
Date: Mon,  5 Aug 2024 15:13:55 +0800
Message-Id: <20240805071355.42636-1-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240703141737.75378-1-qiuxu.zhuo@intel.com>
References: <20240703141737.75378-1-qiuxu.zhuo@intel.com>
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

> From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
> To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
> 	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
> Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
> 	tony.luck@intel.com, qiuxu.zhuo@intel.com, yudong.wang@intel.com
> Subject: [PATCH v2 1/1] drm/fb-helper: Don't schedule_work() to flush frame buffer during panic()
> [...]
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Yudong Wang <yudong.wang@intel.com>
> Tested-by: Yudong Wang <yudong.wang@intel.com>
> Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>

Hi Maarten and maintainers, 

A gentle ping :-).

Could you please help push this v2 fix upstream?
If you have any concerns, please let me know.

Thanks!
-Qiuxu
