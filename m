Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ECB49C71D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 11:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C61710E79F;
	Wed, 26 Jan 2022 10:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6B110E7C9;
 Wed, 26 Jan 2022 10:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643191720; x=1674727720;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9DdtvZ7yMVpfqtYl7aRfb2H95FdCk00oZ2LfZcvlals=;
 b=ODNemuJ2HaVLkN5DsuGz2TDK9EM7wr4IoT87cDhvwu/KL13tOvYB/qwS
 qE2wembYwZt+eRnEV5yjNe0Fj/q+EN5BsVsnkihA7Zc7Mb54EbgnUWcTg
 GejotZmNN5bUrvIsLQkA3wlFT2XJzjvWTpAjCe4m5VPSh6S0f7YQ51vUe
 LOrHe2lu71Vf4Vx+tc6YaHuiB5hRbblpDQbeCZldzEb1GB9bsrx1Z0amu
 AavbSXttPU/Jx4FCDQ+wkvGyctQSzM7KkWn2a0tal9EjgTojQzMQxwIAo
 PSQ/wAyrk5GbMAgMpsWtbQgruQYnVcypQVdoojPYfaRUdcEJft/VLFvj7 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="307234542"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="307234542"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 02:08:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="581061617"
Received: from mburchar-mobl.amr.corp.intel.com (HELO [10.212.54.252])
 ([10.212.54.252])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 02:08:37 -0800
Message-ID: <a1defc48-6b7c-8a4c-fff1-3baebab9a4f4@linux.intel.com>
Date: Wed, 26 Jan 2022 10:08:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH][next] drm/i915/guc: Use struct_size() helper in kmalloc()
Content-Language: en-US
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220125180726.GA68646@embeddedor>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220125180726.GA68646@embeddedor>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/01/2022 18:07, Gustavo A. R. Silva wrote:
> Make use of the struct_size() helper instead of an open-coded version,
> in order to avoid any potential type mistakes or integer overflows that,
> in the worst scenario, could lead to heap overflows.
> 
> Also, address the following sparse warnings:
> drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c:792:23: warning: using sizeof on a flexible structure
> 
> Link: https://github.com/KSPP/linux/issues/174
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index aa6dd6415202..e352a1aad228 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -789,7 +789,7 @@ static struct ct_incoming_msg *ct_alloc_msg(u32 num_dwords)
>   {
>   	struct ct_incoming_msg *msg;
>   
> -	msg = kmalloc(sizeof(*msg) + sizeof(u32) * num_dwords, GFP_ATOMIC);
> +	msg = kmalloc(struct_size(msg, msg, num_dwords), GFP_ATOMIC);
>   	if (msg)
>   		msg->size = num_dwords;
>   	return msg;
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Thanks for the patch, will merge shortly.

Regards,

Tvrtko
