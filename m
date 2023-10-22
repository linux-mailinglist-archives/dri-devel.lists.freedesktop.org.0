Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D540D7D22CF
	for <lists+dri-devel@lfdr.de>; Sun, 22 Oct 2023 13:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E02110E0C4;
	Sun, 22 Oct 2023 11:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC3B10E0C4
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 11:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697972821; x=1729508821;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2Ns3EHM0GGbKNIFnrn8QPMuDPeGzAj+D05NON+PgWlk=;
 b=e82HaRLO9FLZQDN9VugYbxb9hx2YE7zw1/WxQYkXi+UbyHVcBmz3RQtk
 qPt87KeSRrMeJdGPM5Vr8H+9CfP+f9hyvLnbOwE7zQOnKGyoMqo86G3o0
 e4s0jABogR0VnlN2PiVzv+YoJBx827Ltt4UNIbM82TY2HtXu7gVkzEzn5
 YGaYRrLBbYmYNVBFkf7nlxSIbE+5qb5f3eG3ozp/feVSDrt8G29hsvTGn
 N8jkXTJhNIQlydgJKPlIfZExOj8ndapiIgDRbTgu5NN4V1eckGKuKvUnp
 8deKBzZQEWe+ndp4aufdnS/+4ycEivW6KPzCG29WyrUjyo9zMmOfEsmZD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="385576642"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; d="scan'208";a="385576642"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2023 04:07:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="761478247"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; d="scan'208";a="761478247"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2023 04:06:58 -0700
Date: Sun, 22 Oct 2023 13:06:56 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2 1/2] accel/qaic: Add support for periodic timesync
Message-ID: <20231022110656.GB704032@linux.intel.com>
References: <20231016170114.5446-1-quic_jhugo@quicinc.com>
 <20231016170114.5446-2-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016170114.5446-2-quic_jhugo@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, ogabbay@kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 16, 2023 at 11:01:13AM -0600, Jeffrey Hugo wrote:
> From: Ajit Pal Singh <quic_ajitpals@quicinc.com>
> 
> Device and Host have a time synchronization mechanism that happens once
> during boot when device is in SBL mode. After that, in mission-mode there
> is no timesync. In an experiment after continuous operation, device time
> drifted w.r.t. host by approximately 3 seconds per day. This drift leads
> to mismatch in timestamp of device and Host logs. To correct this
> implement periodic timesync in driver. This timesync is carried out via
> QAIC_TIMESYNC_PERIODIC MHI channel.
> 
> Signed-off-by: Ajit Pal Singh <quic_ajitpals@quicinc.com>
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

> @@ -586,8 +587,16 @@ static int __init qaic_init(void)
>  		goto free_pci;
>  	}
>  
> +	ret = qaic_timesync_init();
> +	if (ret) {
> +		pr_debug("qaic: qaic_timesync_init failed %d\n", ret);
> +		goto free_mhi;
I would print at error level here. Or if timesync is optional do not error exit. 

> +#ifdef readq
> +static u64 read_qtimer(const volatile void __iomem *addr)
> +{
> +	return readq(addr);
> +}
> +#else
> +static u64 read_qtimer(const volatile void __iomem *addr)
> +{
> +	u64 low, high;
> +
> +	low = readl(addr);
> +	high = readl(addr + sizeof(u32));
> +	return low | (high << 32);
> +}
If that's only for compile on 32-bit PowerPC, I think would be better
to limit supported architectures on Kconfig. 

Regards
Stanislaw
