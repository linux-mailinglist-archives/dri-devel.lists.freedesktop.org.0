Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E669838E4B4
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 13:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBA66E1B3;
	Mon, 24 May 2021 11:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973F66E1B3;
 Mon, 24 May 2021 11:00:52 +0000 (UTC)
IronPort-SDR: d0pM/R8gFUUlswmtA3pJWzui5bxhG1m/lkMnlJL8Ox5qj0mM3bjKvp9PBt2Up0xByO+oHBAEST
 g2LukBg4yg+g==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="198850448"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="198850448"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 04:00:51 -0700
IronPort-SDR: vpk8ik8GOiW5olUC3spCYZesZg+WodGwNVzn3O4B1wWpDItXMw7g91yIeSw0YFuAxx68B5nPq7
 DMVV3JOUoqGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="442772745"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga008.fm.intel.com with ESMTP; 24 May 2021 04:00:49 -0700
Received: from [10.249.134.123] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.134.123])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 14OB0mdn005413; Mon, 24 May 2021 12:00:48 +0100
Subject: Re: [RFC PATCH 30/97] drm/i915/uc: turn on GuC/HuC auto mode by
 default
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-31-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <44709eaa-0896-3082-82ca-54a566624f46@intel.com>
Date: Mon, 24 May 2021 13:00:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210506191451.77768-31-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: tvrtko.ursulin@intel.com, jason.ekstrand@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 06.05.2021 21:13, Matthew Brost wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> This will enable HuC loading for Gen11+ by default if the binaries
> are available on the system. GuC submission still requires explicit
> enabling by the user.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/i915_params.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
> index 14cd64cc61d0..a0575948ab61 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -59,7 +59,7 @@ struct drm_printer;
>  	param(int, disable_power_well, -1, 0400) \
>  	param(int, enable_ips, 1, 0600) \
>  	param(int, invert_brightness, 0, 0600) \
> -	param(int, enable_guc, 0, 0400) \
> +	param(int, enable_guc, -1, 0400) \

you also want to update param description from

	"(-1=auto, 0=disable [default], 1=GuC submission, 2=HuC load)");
to
	"(-1=auto [default], 0=disable, 1=GuC submission, 2=HuC load)");

>  	param(int, guc_log_level, -1, 0400) \
>  	param(char *, guc_firmware_path, NULL, 0400) \
>  	param(char *, huc_firmware_path, NULL, 0400) \
> 
