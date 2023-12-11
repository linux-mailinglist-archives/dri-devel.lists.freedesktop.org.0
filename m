Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F0580C7F3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 12:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15C710E0B6;
	Mon, 11 Dec 2023 11:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D6210E0B6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 11:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702294039; x=1733830039;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=e2qjUoYlDX2/F/FQicGoHFCLqzCozr4HwXhAgVyGlWw=;
 b=aXjPTBUT5Y4UhepRK5WLwm5GQ2M6q9QmPxTuDVc0Pbv8/x6+vODTSYXp
 sOd2SYvmSwXOFdIHvACAaQ5yCEMjjI5MerZT7UiM73hXxEno5hqcbubez
 +IHmvcCMdejoeJo9sxNRyxxeXtSywobU5XiSV7Bnyci0PI6ByHXMa3jwN
 9XCsMELO/H1Dbr+DqaIWddGOjynOLClcD4VEXm86CYE5b88svkm5s87q+
 uR5S2ObfBYS9BRZ+lvnig3A0sZUOWyxHq38GGAgqC7Dedjw8xfsurB9n5
 SFaVfdNllEHPPFiyZyDa3+VzEUIBcCM38gN2NAv/5JwZwHKlhJgcAmb8x w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="379627353"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="379627353"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:27:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="891092063"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="891092063"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.128.67])
 ([10.249.128.67])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:27:17 -0800
Message-ID: <698b25fb-89fd-4395-a58a-35df0fa1973f@linux.intel.com>
Date: Mon, 11 Dec 2023 12:27:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] accel/qaic: Order pci_remove() operations in reverse
 of probe()
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
 <20231208163457.1295993-8-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231208163457.1295993-8-quic_jhugo@quicinc.com>
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 08.12.2023 17:34, Jeffrey Hugo wrote:
> In probe() we create the drm_device, and then register the MHI controller.
> In remove(), we should unregister the controller first, then remove the
> drm_device.  Update the remove() operations to match.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> ---
>  drivers/accel/qaic/qaic_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 10a43d02844f..d1a632dbaec6 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -550,8 +550,8 @@ static void qaic_pci_remove(struct pci_dev *pdev)
>  		return;
>  
>  	qaic_dev_reset_clean_local_state(qdev);
> -	qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
>  	qaic_mhi_free_controller(qdev->mhi_cntrl, link_up);
> +	qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
>  }
>  
>  static void qaic_pci_shutdown(struct pci_dev *pdev)
