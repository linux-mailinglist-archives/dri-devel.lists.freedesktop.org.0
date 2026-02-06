Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKOhG/aPhWkODgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:53:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF1AFAC8B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C28710E04B;
	Fri,  6 Feb 2026 06:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JBwix+S4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C2710E04B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 06:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770360819; x=1801896819;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=F11YGOHlXJpLYSw/yPB52/n2qAFxbY2+8I/SSAGS/ao=;
 b=JBwix+S4YyEE2VLo+G2+eFoojfT89ni3B6l8kbKV7tJra3HM5nn+E/9T
 iyihDH0b1qEeGWXj6hWkxqbSNCtpdx3pOD6gk9YGLq5+EdAeaq8LObpGe
 RDpyFjOisgalxsipRL5meHVFjl8gda0s19GWwp/9ufxzKrZdgHbQF13X9
 QWqDSJoSNs3SRHalAvhXYXoJoPx2OjKM3wvKebVFkQLFJ93pmbc0Yhz27
 UrFH5mFlTTXeRU12dXbbbPwKSPtGso8WR8Qc8T8p8uu8Ie2CRpDKS/LUx
 fA7hB9h85X1QHm0Px7L5WETiL9pMJooLy6eMQDkp4T9eAaacObOzC2sTy g==;
X-CSE-ConnectionGUID: qD0yPN7WSHypER4uDrqkMg==
X-CSE-MsgGUID: aSTrq1XFQFqERrI0XpXImg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="59140180"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="59140180"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 22:53:38 -0800
X-CSE-ConnectionGUID: FY3h6evhREKyJmLGaYgxjQ==
X-CSE-MsgGUID: NZFOBaiqQuKbfkciwIBmAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210632140"
Received: from nmizonov-mobl2.ccr.corp.intel.com (HELO [10.246.19.19])
 ([10.246.19.19])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 22:53:35 -0800
Message-ID: <3e90c8cc-e5c5-44e1-b0d1-dd1cba3f60fa@linux.intel.com>
Date: Fri, 6 Feb 2026 07:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Switch to always use chained command
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com
References: <20260206060251.4050512-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260206060251.4050512-1-lizhi.hou@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[karol.wachowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karol.wachowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: 0BF1AFAC8B
X-Rspamd-Action: no action

On 2/6/2026 7:02 AM, Lizhi Hou wrote:
> Preempt commands are only supported when submitted as chained commands.
> To ensure preempt support works consistently, always submit commands in
> chained command format.
> 
> Set force_cmdlist to true so that single commands are filled using the
> chained command layout, enabling correct handling of preempt commands.
> 
> Fixes: 3a0ff7b98af4 ("accel/amdxdna: Support preemption requests")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>  drivers/accel/amdxdna/aie2_ctx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 37d05f2e986f..6378a0bc7b6e 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -23,9 +23,9 @@
>  #include "amdxdna_pci_drv.h"
>  #include "amdxdna_pm.h"
>  
> -static bool force_cmdlist;
> +static bool force_cmdlist = true;
>  module_param(force_cmdlist, bool, 0600);
> -MODULE_PARM_DESC(force_cmdlist, "Force use command list (Default false)");
> +MODULE_PARM_DESC(force_cmdlist, "Force use command list (Default true)");
>  
>  #define HWCTX_MAX_TIMEOUT	60000 /* milliseconds */
>  
Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
