Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMYVDlmGrmnKFgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 09:35:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094C22358A0
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 09:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4F810E4A7;
	Mon,  9 Mar 2026 08:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C7H1YE57";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C121910E4A7;
 Mon,  9 Mar 2026 08:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773045334; x=1804581334;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qOqiVkph/8zjmtN4+mdspfe+MLPcrHlnN8h98oCe/H0=;
 b=C7H1YE57Sn+xh/gLVqbMm8WKRzXG2m+ZvfVVKSabuNGg7miAvwsyt6i8
 Ck2tqAWS+meeuqHBq/bNOrN6yRCF4haX+zVx/1iSf6pmciQkcJgp251vs
 ELiiLK/WYNEvQlu/N0QVrEqd+y/kYl6pJoQNe0hzv1UpLIdla0lmbkCFw
 Aebc3qUZ+1eykasOVmofVirkbIwSPvU56c+g6CfYFWR6mKDCIAGnpzXtD
 3tpFMkP4oEPPP+xY2hokAz47Ltq+WA8rEKuqL8ObYw3BvOx79rskma2rT
 0ur2Cbfbr9XIr1kZP8kIqnYk+Ns6asChMliKEEwXYR3FV1pV2YjYwWzR5 Q==;
X-CSE-ConnectionGUID: dn0Hk8a1TdGW8uP78b06ug==
X-CSE-MsgGUID: Mg7//N0XRuCDYy614ocarg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77940896"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77940896"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 01:35:33 -0700
X-CSE-ConnectionGUID: IpyLOqx6RbSW9QHWgfNdqw==
X-CSE-MsgGUID: aV5QNBGhRGukG3SmV20ZXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224617899"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 01:35:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, anvesh.bakwad@intel.com, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, Riana Tauro
 <riana.tauro@intel.com>
Subject: Re: [PATCH v10 1/5] drm/ras: Introduce the DRM RAS infrastructure
 over generic netlink
In-Reply-To: <20260304074412.464435-8-riana.tauro@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260304074412.464435-7-riana.tauro@intel.com>
 <20260304074412.464435-8-riana.tauro@intel.com>
Date: Mon, 09 Mar 2026 10:35:22 +0200
Message-ID: <4d0a00281e4e69a5366699b1ee3fbb40f402c6ef@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 094C22358A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,ffwll.ch,gmail.com,oss.qualcomm.com,amd.com,kernel.org,davemloft.net,redhat.com,google.com,vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, 04 Mar 2026, Riana Tauro <riana.tauro@intel.com> wrote:
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 0d0657dd1b41..5386248e75b6 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -130,6 +130,16 @@ config DRM_PANIC_SCREEN_QR_VERSION
>  	  Smaller QR code are easier to read, but will contain less debugging
>  	  data. Default is 40.
>  
> +config DRM_RAS
> +	bool "DRM RAS support"

I encountered this with 'make oldconfig' today:

  DRM RAS support (DRM_RAS) [N/y/?] (NEW) y

Is it too much to ask to spell out "Reliability, Availability and
Serviceability" in the one-line bool documentation instead of the TLA
soup?


BR,
Jani.

> +	depends on DRM
> +	depends on NET
> +	help
> +	  Enables the DRM RAS (Reliability, Availability and Serviceability)
> +	  support for DRM drivers. This provides a Generic Netlink interface
> +	  for error reporting and queries.
> +	  If in doubt, say "N".
> +



-- 
Jani Nikula, Intel
