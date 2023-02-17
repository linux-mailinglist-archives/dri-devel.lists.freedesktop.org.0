Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1FC69ABA2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726BA10E1D0;
	Fri, 17 Feb 2023 12:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2B410E1D0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 12:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676637432; x=1708173432;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=OVwm0dza7bTU97dNxx5TvB91BNI0hYtwxLL1XxT3AcM=;
 b=QpwQbH28c8acjVpIwTqKgW8PBmpW7GpM39QoVQM/szzXvIFpiuoEDv1Y
 b/lQmiGihXY+l7ghDBu8PIxtd+4wIrjUDDWF8rPra2eBadziNJ0+DKcFH
 MuMrWI/5h1uQ4l0+21mHwT+3ddKNUlfKw4pexBSKUuG2EKqry0pQqvtFB
 JNdjUCdh9w4jXzbhNArjZKOfmtVgA+qJ3okgf/3Z9K+hcMOyuowzV3JmW
 pcTG/lVcLW3MzpXDhptlgkivMtK1z/04iigb226AFEW/0tLAt84gy9eIQ
 cwOJ5RMO+ez+Jd1JDERtZSlLG8od6GHy2XQaCH5EXnLqMjAS91XMKhh8K w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="359425482"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="359425482"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 04:37:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="779776025"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="779776025"
Received: from akocherg-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.53.1])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 04:37:08 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
In-Reply-To: <5c6fe661-9e96-d122-1a7a-110ecbd8a6c6@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <20230216163757.GK2849548@linux.intel.com> <87lekxzgih.fsf@intel.com>
 <20230217103501.GC2862577@linux.intel.com> <871qmozhve.fsf@intel.com>
 <20230217113621.GD2862577@linux.intel.com>
 <5c6fe661-9e96-d122-1a7a-110ecbd8a6c6@gmail.com>
Date: Fri, 17 Feb 2023 14:37:05 +0200
Message-ID: <87r0uoxyby.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: daniel.vetter@ffwll.ch, mcanal@igalia.com, dri-devel@lists.freedesktop.org,
 mwen@igalia.com, mairacanal@riseup.net, maxime@cerno.tech,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Feb 2023, Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com=
> wrote:
> If i915 have such structural problems then I strongly suggest to solve=20
> them inside i915 and not make common code out of that.

All other things aside, that's just a completely unnecessary and
unhelpful remark.


BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
