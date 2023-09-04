Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661817914BC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 11:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A3B10E315;
	Mon,  4 Sep 2023 09:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF23110E315
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 09:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693819740; x=1725355740;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hSEf9AtIpa1+Qo/iru9dpm+rlzezvLKZKvW79Pi0lXc=;
 b=fXYG1QNNWFMuTpppbGpzOpyKnGccEMAP+8gp5D8Lb+2M/GZdhhytoasS
 nAln2Paqb/Ueya557QxxUF94Vb8VUq795P8VtOegP0NE7qyr4hNgdbEcv
 iaNKjmo/oNoLbMs4RR5uFhj3Kw706U+T6njPmvBGJa3QfXihV0wCrydjV
 1oQZ+SipNja93PCkSwqP8LX/ef7CIT+Kgp9shyksGuqwfR1FIgHaL9Xgn
 W+oaygtmbH09hjhGtrboDcBG+2pmkuXHVriAwOZ8kad8ehrtPEFAjngPS
 j/FWmRv7Enndg8lZeABZ9alCsu3xC5R65ZZdJX1oaOMZh1W8cXiifcDez w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="356055684"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="356055684"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 02:28:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="855548971"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="855548971"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 02:28:58 -0700
Date: Mon, 4 Sep 2023 11:28:55 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] accel/qaic: Use devm_drm_dev_alloc() instead of
 drm_dev_alloc()
Message-ID: <20230904092855.GC184247@linux.intel.com>
References: <20230901161236.8371-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901161236.8371-1-quic_jhugo@quicinc.com>
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
Cc: quic_pkanojiy@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_carlv@quicinc.com, ogabbay@kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 01, 2023 at 10:12:36AM -0600, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Since drm_dev_alloc() is deprecated it is recommended to use
> devm_drm_dev_alloc() instead. Update the driver to start using
> devm_drm_dev_alloc().
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> +	/*
> +	 * drm_dev_unregister() sets the driver data to NULL and
> +	 * drm_dev_register() does not update the driver data. During a SOC
> +	 * reset drm dev is unregistered and registered again leaving the
> +	 * driver data to NULL.
> +	 */
> +	dev_set_drvdata(to_accel_kdev(qddev), drm->accel);

Yeah, explicitly nullified in drm_minor_unregister() with ' /* safety belt */
comment. I think in long term goal would be device reset not require
unregister/register.

> +	drm_dev_get(drm);
> +	drm_dev_unregister(drm);

That looks odd. I guess there is use-after-free problem if you just do
drm_dev_unregister(). Additional drm_dev_get() does not seems to be right
solution, but I'm not 100% sure, so ... 

Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Regards
Stanislaw

