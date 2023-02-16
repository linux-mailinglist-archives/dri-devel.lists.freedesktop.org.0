Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7E6699447
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 13:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EA110E039;
	Thu, 16 Feb 2023 12:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C30F10ED56
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 12:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676550349; x=1708086349;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K/+/O5cGccdXEg5ZSGJsE6zri5e4gcRnHeZ1TIeinqA=;
 b=Qqq4AoelR3Q2sjay6BUlRF/xeutt2hglbp4wE0hoTzwLLTPb1C4DQBHP
 13luUwgMTCcpoLnxeDBitxf6VH9gWtU0YneEUsn3JUz2WOunB6Iwm9SXD
 rfjcVdoH9ZVsCvkeK3xug4UIjpdUkY6LUbRNagbjVDECrpxzqfsvcUiGY
 OfYxPhLOmm3sftgrYPqzzqD3UlXijdwBD9k1a1kEEwZifmMNvydev6/M5
 Q6zykkezzBBknP2HxR/RsjlcFMK3O//jWi19LHxj2Rd5NHyVZvOHAo5Ox
 k7sfaXiCrsgszyForFLRKmrIG6FMMCCqxAEhRnebvQqsfSUQ/u45kK6kN Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="359132383"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="359132383"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 04:25:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="794007926"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="794007926"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 04:25:47 -0800
Date: Thu, 16 Feb 2023 13:25:45 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 08/27] habanalabs: add info when FD released while device
 still in use
Message-ID: <20230216122545.GE2849548@linux.intel.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-8-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230212204454.2938561-8-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 12, 2023 at 10:44:35PM +0200, Oded Gabbay wrote:
> From: Tomer Tayar <ttayar@habana.ai>
> 
> When user closes the device file descriptor, it is checked whether the
> device is still in use, and a message is printed if it is.

I guess this is only for debugging your user-space component?
Because kernel driver should not make any assumption about
user-space behavior. Closing whenever user wants should be
no problem.

> +static void print_device_in_use_info(struct hl_device *hdev, const char *message)
> +{
> +	u32 active_cs_num, dmabuf_export_cnt;
> +	char buf[64], *buf_ptr = buf;
> +	size_t buf_size = sizeof(buf);
> +	bool unknown_reason = true;
> +
> +	active_cs_num = hl_get_active_cs_num(hdev);
> +	if (active_cs_num) {
> +		unknown_reason = false;
> +		compose_device_in_use_info(&buf_ptr, &buf_size, " [%u active CS]", active_cs_num);
> +	}
> +
> +	dmabuf_export_cnt = atomic_read(&hdev->dmabuf_export_cnt);
> +	if (dmabuf_export_cnt) {
> +		unknown_reason = false;
> +		compose_device_in_use_info(&buf_ptr, &buf_size, " [%u exported dma-buf]",
> +						dmabuf_export_cnt);
> +	}
> +
> +	if (unknown_reason)
> +		compose_device_in_use_info(&buf_ptr, &buf_size, " [unknown reason]");
> +
> +	dev_notice(hdev->dev, "%s%s\n", message, buf);

why not print counters directly, i.e. "active cs count %u, dmabuf export count %u" ?

>  	if (!hl_hpriv_put(hpriv)) {
> -		dev_notice(hdev->dev, "User process closed FD but device still in use\n");
> +		print_device_in_use_info(hdev, "User process closed FD but device still in use");
>  		hl_device_reset(hdev, HL_DRV_RESET_HARD);

You really need reset here ? 

Regards
Stanislaw
