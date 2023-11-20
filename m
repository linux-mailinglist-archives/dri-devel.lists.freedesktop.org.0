Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 726A57F0D5F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 09:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC9610E140;
	Mon, 20 Nov 2023 08:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AA810E140
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700468309; x=1732004309;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=HBRHGIAvj9rJJZ0TJijfWiClr+BpfsTO3xGVZz0v5Pg=;
 b=Wmjf1td5O3OS4gtxdRB09fBtHOOUsT5kHAoKxhjsLNVUBdCwxhPpq6+P
 /5UTWFYeosgF1nwrJe3VS10aUH+yxquqDUFOwFkJti2GHWLY77fsykRs2
 tPZGOeEsjbvg9N2tKDZNwYrbeKniWt0FEL5zPKTKCY5N7apDacq8cTb1y
 viCD96rma5zaus29n4U2SS2RBPMrxE8rsdqZtAMmJ2hta8iWS/EV6lgxU
 8HTY8EtVzE4kbm7BeMsuGkbhjXvj+RQtE+sbrfnBOe1EnIuzzJ7hvvntY
 fO8m07ng3B8TRh8ABcXEQsf62IYlawP0FoFh9K9V+nR2PXVfrGAHhtNoU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="4692739"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="4692739"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 00:18:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="856922086"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="856922086"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.217.160.78])
 ([10.217.160.78])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 00:18:28 -0800
Message-ID: <d68dc3ab-ed5c-416e-a189-f8ac30941a35@linux.intel.com>
Date: Mon, 20 Nov 2023 09:18:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/qaic: Increase number of in_reset states
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20231117174337.20174-1-quic_jhugo@quicinc.com>
 <20231117174337.20174-2-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231117174337.20174-2-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 17.11.2023 18:43, Jeffrey Hugo wrote:
> From: Carl Vanderlip <quic_carlv@quicinc.com>
> 
> 'in_reset' holds the state of the device. As part of bringup, the device
> needs to be queried to check if it's in a valid state. Add a new state
> that indicates that the device is coming up, but not ready for users
> yet. Rename to 'reset_state' to better describe the variable.
> 
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/accel/qaic/qaic.h         | 13 +++++++++++--
>  drivers/accel/qaic/qaic_control.c |  5 +++--
>  drivers/accel/qaic/qaic_data.c    | 16 ++++++++--------
>  drivers/accel/qaic/qaic_drv.c     | 12 ++++++------
>  4 files changed, 28 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
> index bc40d52dc010..bd0c884e6bf7 100644
> --- a/drivers/accel/qaic/qaic.h
> +++ b/drivers/accel/qaic/qaic.h
> @@ -31,6 +31,15 @@
>  #define to_drm(qddev) (&(qddev)->drm)
>  #define to_accel_kdev(qddev) (to_drm(qddev)->accel->kdev) /* Return Linux device of accel node */
>  
> +enum __packed reset_states {
> +	/* Device is offline or will be very soon */
> +	QAIC_OFFLINE,
> +	/* Device is booting, not clear if it's in a usable state */
> +	QAIC_BOOT,
> +	/* Device is fully operational */
> +	QAIC_ONLINE,
> +};
> +
>  extern bool datapath_polling;
>  
>  struct qaic_user {
> @@ -121,8 +130,8 @@ struct qaic_device {
>  	struct workqueue_struct	*cntl_wq;
>  	/* Synchronizes all the users of device during cleanup */
>  	struct srcu_struct	dev_lock;
> -	/* true: Device under reset; false: Device not under reset */
> -	bool			in_reset;
> +	/* Track the state of the device during resets */
> +	enum reset_states	reset_state;
I would rename this to dev_state but otherwise:

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
