Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B25B8C3BB3
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 09:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031BD10E3E6;
	Mon, 13 May 2024 07:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4hToYKR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F7F10E3E6;
 Mon, 13 May 2024 07:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715584012; x=1747120012;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PftKofuWUcC6leo1FDVnPS965n+TKE45fKeH65Tls10=;
 b=Z4hToYKR4Q+YWyaESt6BsPYyMR5d9edrtex7/YdwVoSPi+0k5Bwaxh8/
 m9EGykailLJj82noYsDpS8oqakBWyrtzdQz0QwJAyiZnvqAfSE8huptn6
 ujGT0NLQ2D98M12Ui43wjCRw8SocfLbDFM4z6FGmb7Kw530Lq+32zICKG
 2f2/DwFMHaiOMPBhy2369V5/ktvyyefVzNDwwx6mlbXPx58D3s4iBq+88
 18Kw9FkmZ1rtiTeEPkZwuw2JXrKJ4eU3LMv6eWd4imzMc/QpvzLph8QwX
 ykJpnbnEQFHXK0v+SSr2ttsnH/6+yPlUWVWDIVAX8MYuAs9pJ6RNl3Jy9 g==;
X-CSE-ConnectionGUID: 9Q0/FrPLTceA5RtvnrcFrg==
X-CSE-MsgGUID: bpQllw0lRkKvC+YWAShOng==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11494067"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11494067"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:06:50 -0700
X-CSE-ConnectionGUID: /FfsnYM/QvaQPG95Z9kABg==
X-CSE-MsgGUID: P5+ohKYLRj+zRTSdBMla8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30636016"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:06:49 -0700
Message-ID: <3169ea93-8da8-4386-b239-8fffe8eaa088@intel.com>
Date: Mon, 13 May 2024 09:06:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/20] drm/drm_managed: try to improve the drmm DOC
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-23-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240510181212.264622-23-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 10.05.2024 20:12, Matthew Auld wrote:
> Hopefully make it clearer when to use devm vs drmm.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/drm_managed.c | 42 +++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index 7646f67bda4e..20d705bbc0a3 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -34,6 +34,48 @@
>    * during the lifetime of the driver, all the functions are fully concurrent
>    * safe. But it is recommended to use managed resources only for resources that
>    * change rarely, if ever, during the lifetime of the &drm_device instance.
> + *
> + * Note that the distinction between devm and drmm is important to get right.
> + * Consider some hotunplug scenarios, where it is valid for there to be multiple
> + * unplugged struct &drm_device instances each being kept alive by an open
> + * driver fd. The driver needs a clean separation between what needs to happen
> + * when the struct &device is removed and what needs to happen when a given
> + * struct &drm_device instance is released, as well as in some cases a more
> + * finer grained marking of critical sections that require hardware interaction.
> + * See below.
> + *
> + * devm
> + * ~~~~
> + * In general use devm for cleaning up anything hardware related. So removing
> + * pci mmaps, releasing interrupt handlers, basically anything hw related.  The
> + * devm release actions are called when the struct &device is removed, shortly
> + * after calling into the drivers struct &pci_driver.remove() callback, if this
> + * is a pci device.
> + *
> + * devm can be thought of as an alternative to putting all the hw related
> + * cleanup directly in the struct &pci_driver.remove() callback, where the
> + * correct ordering of the unwind steps needs to be manually done in the error
> + * path of the struct &pci_driver.probe() and again on the remove side.  With
> + * devm this is all done automatically.
> + *
> + * drmm
> + * ~~~~
> + * In general use this for cleaning up anything software related. So data
> + * structures and the like which are tied to the lifetime of a particular struct
> + * &drm_device instance.
> + *
> + * drmm can be thought of as an alternative to putting all the software related
> + * cleanup directly in the struct &drm_driver.release() callback, where again
> + * the correct ordering of the unwind steps needs to be done manually. As with
> + * devm this is instead done automatically.
> + *
> + * Sometimes there is no clean separation between software and hardware, which
> + * is where drm_dev_enter() comes in. For example, a driver might have some
> + * state tied to a struct &drm_device instance, for which the same cleanup path
> + * is called for both a plugged and unplugged device, and the cleanup itself
> + * might require talking to the device if it's still attached to this particular
> + * struct &drm_device. For that we instead mark the device sections.  See
> + * drm_dev_enter(), drm_dev_exit() and drm_dev_unplug().

I would emphasize somewhere that after device unbind any interaction 
with physical device is forbidden (are some exceptions for this?).
Anyway nice stuff.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>    */
>   
>   struct drmres_node {

