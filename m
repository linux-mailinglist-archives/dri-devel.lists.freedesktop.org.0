Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A7E663E1F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 11:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D41810E596;
	Tue, 10 Jan 2023 10:25:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDA110E59E;
 Tue, 10 Jan 2023 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673346344; x=1704882344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8WwSYgOqg3tpTGHUJn6p9cqlKW6Mh8sJ4ZznLQ6zouI=;
 b=OgjYMz6bIvYWR3sOhkLnkh1nYhVmeh1I4jAj7so+jVddFt0eJmXYAI5V
 T0slwHJg6PURlH4tH7T78K5WxeqjVq9mCTMH8rPqbaiQw8gLiK/IKaEZj
 xYtkb3cNJ+3EeoestkQ1gG2AzdM8/wPtFzrjvRoCXgkB4NPP3Uyu2FegM
 we9Kn0fqc8KKVsTyVwKaWPoDEWmrTotl8vrivW2d/k1hXUuLHba1ZTtxt
 R5glHoIYSgkiCVEPpU3igE6yn72pH/xeulqDj0I2AvIbXcM8v1/CZoXUL
 R9s3Ek6uY4Qhq92sLaRaykVy8JCS5K6t2GFLsDrTQcomG+RqaIcqQcW4y Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="303475630"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="303475630"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 02:25:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="799384111"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="799384111"
Received: from whitepau-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.252.37.68])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 02:25:42 -0800
Date: Tue, 10 Jan 2023 11:25:38 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [Intel-gfx] [PATCH v3 1/1] drm/i915/gt: Start adding module
 oriented dmesg output
Message-ID: <Y709IqKuIupsGqCS@ashyti-mobl2.lan>
References: <20230109234824.1198769-1-John.C.Harrison@Intel.com>
 <20230109234824.1198769-2-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109234824.1198769-2-John.C.Harrison@Intel.com>
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

[...]

> +#define gt_WARN_ON(_gt, _condition) \
> +	gt_WARN(_gt, _condition, "%s", "gt_WARN_ON(" __stringify(_condition) ")")
> +
> +#define gt_WARN_ON_ONCE(_gt, _condition) \
> +	gt_WARN_ONCE(_gt, _condition, "%s", "gt_WARN_ONCE(" __stringify(_condition) ")")
> +
> +#define gt_WARN(_gt, _condition, _fmt, ...) \
> +	drm_WARN(&(_gt)->i915->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
> +	drm_WARN_ONCE(&(_gt)->i915->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)

do we need some order here? gt_WARN and gt_WARN_ONCE should go
before respectively gt_WARN_ON and gt_WARN_ON_ONCE.

The rest looks good.

Andi
