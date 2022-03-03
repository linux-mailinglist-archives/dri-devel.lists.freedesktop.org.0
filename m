Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB44CBB2D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 11:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BA110EEE2;
	Thu,  3 Mar 2022 10:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E2710EEE2;
 Thu,  3 Mar 2022 10:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646302942; x=1677838942;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vQ2UPPnpZd4j+VQpkgNjimCZveTXedd8kJbL1dgNfK8=;
 b=DOMqUhGuUvRv2yDc90L6SfegrLlTN0fqrSGTNO5y5Ejbu9dijRo1kCt3
 kF1rjpGSDpbTX3wkhCuWEnzo2vwE7AfMHtE+2r9ctYhbmF9muUCN1Ev7x
 mIht+sYWHZA2lG4I28Wmb7q4cPdjKKa2Qvq60OrBUGYB4P0oSgzUIjN8+
 L79t4ojIErRvJe+lxv4Rwrf2eayxh3xMdYJIf62SuKrBNe9vevFNjrhAV
 23OOE9CZAcIAIxNIZBBQH2G2INIw50R159oJiQJdMQGzEfjkIQFIQy4RX
 r8gFJR7TiS7BxFZTt2CkJ8/5++0Hh6epQROarUngURwRVQmfcGOT1yCtJ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="237147874"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="237147874"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 02:22:21 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="709872718"
Received: from bjoseph-mobl.ger.corp.intel.com (HELO localhost) ([10.252.1.89])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 02:22:18 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/5] drm/i915/dsi: Add some debug logging to mipi_exec_i2c
In-Reply-To: <20220225214934.383168-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220225214934.383168-1-hdegoede@redhat.com>
 <20220225214934.383168-3-hdegoede@redhat.com>
Date: Thu, 03 Mar 2022 12:22:16 +0200
Message-ID: <87sfrz49pj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Feb 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> Add some debug logging to mipi_exec_i2c, to make debugging various
> issues seen with it easier.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> index 0da91849efde..215dbfc0af0f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -464,6 +464,10 @@ static const u8 *mipi_exec_i2c(struct intel_dsi *intel_dsi, const u8 *data)
>  	u8 payload_size = *(data + 6);
>  	u8 *payload_data;
>  
> +	drm_dbg_kms(&i915->drm, "%s bus %d client-addr 0x%02x reg 0x%02x data %*ph\n",
> +		    __func__, vbt_i2c_bus_num, slave_addr, reg_offset,

__func__ is redundant with drm_dbg_kms.

BR,
Jani.

> +		    payload_size, data + 7);
> +
>  	if (intel_dsi->i2c_bus_num < 0) {
>  		intel_dsi->i2c_bus_num = vbt_i2c_bus_num;
>  		i2c_acpi_find_adapter(intel_dsi, slave_addr);

-- 
Jani Nikula, Intel Open Source Graphics Center
