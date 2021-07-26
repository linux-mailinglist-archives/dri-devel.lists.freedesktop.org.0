Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481E23D5C96
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 17:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E33B6EC87;
	Mon, 26 Jul 2021 15:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A61989E0D;
 Mon, 26 Jul 2021 15:06:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="199489137"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="199489137"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 08:06:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="662039456"
Received: from mandhav-mobl3.gar.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.20.227])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 08:06:19 -0700
Date: Mon, 26 Jul 2021 08:06:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 18/30] drm/i915: remove explicit CNL handling from
 i915_irq.c
Message-ID: <20210726150618.ue3f6snpdpzwmt6p@ldmartin-desk2>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-19-lucas.demarchi@intel.com>
 <YP6Vl2b0iBuQZSJi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YP6Vl2b0iBuQZSJi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Jose Souza <jose.souza@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 06:59:35AM -0400, Rodrigo Vivi wrote:
>On Fri, Jul 23, 2021 at 05:11:02PM -0700, Lucas De Marchi wrote:
>> Remove special handling of PORT_F in i915_irq.c and only do it for
>> DISPLAY_VER == 11.
>
>oh! ignore my previous thought about removing the port F...

of course I only saw this after replying to your comment :)

thanks
Lucas De Marchi

>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>
>> ---
>>  drivers/gpu/drm/i915/i915_irq.c | 7 +++----
>>  drivers/gpu/drm/i915/i915_reg.h | 2 +-
>>  2 files changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
>> index e2171bd2820e..17d336218b67 100644
>> --- a/drivers/gpu/drm/i915/i915_irq.c
>> +++ b/drivers/gpu/drm/i915/i915_irq.c
>> @@ -2297,11 +2297,10 @@ static u32 gen8_de_port_aux_mask(struct drm_i915_private *dev_priv)
>>  			GEN9_AUX_CHANNEL_C |
>>  			GEN9_AUX_CHANNEL_D;
>>
>> -	if (IS_CNL_WITH_PORT_F(dev_priv) || DISPLAY_VER(dev_priv) == 11)
>> -		mask |= CNL_AUX_CHANNEL_F;
>> -
>> -	if (DISPLAY_VER(dev_priv) == 11)
>> +	if (DISPLAY_VER(dev_priv) == 11) {
>> +		mask |= ICL_AUX_CHANNEL_F;
>>  		mask |= ICL_AUX_CHANNEL_E;
>> +	}
>>
>>  	return mask;
>>  }
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index d198b1a2d4b5..fdc8fd424d36 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -7945,7 +7945,7 @@ enum {
>>  #define  DSI1_NON_TE			(1 << 31)
>>  #define  DSI0_NON_TE			(1 << 30)
>>  #define  ICL_AUX_CHANNEL_E		(1 << 29)
>> -#define  CNL_AUX_CHANNEL_F		(1 << 28)
>> +#define  ICL_AUX_CHANNEL_F		(1 << 28)
>>  #define  GEN9_AUX_CHANNEL_D		(1 << 27)
>>  #define  GEN9_AUX_CHANNEL_C		(1 << 26)
>>  #define  GEN9_AUX_CHANNEL_B		(1 << 25)
>> --
>> 2.31.1
>>
