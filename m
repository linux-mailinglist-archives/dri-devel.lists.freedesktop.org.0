Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0729EFAF0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 19:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA2710E1E9;
	Thu, 12 Dec 2024 18:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qciiiCWe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3BD10E1E9;
 Thu, 12 Dec 2024 18:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zUh/YyW/cI4qga3mWzSJPGqn9vM7x5xrmfx3htv+gmM=; b=qciiiCWeSsH1CyvmDpCIANNec1
 XzMtbePqIRr3MwbVnGAok0CEMvqYOZnt2bE5q24cH0N0usNQ158oeakGf74pFuDEXyweoWPDdm6E6
 pH1Kw9Z70NVWxcFk/DCF/xjHrHGQeVaAfQAWbzwPWiNKn17qHW1nAft23gXPfVypVDGffbXz6nPx0
 GxRTi1nKHHiHWH1+1JixpFfNq1d9fLunCqDkIDpAtrvo8DiLw1644ev/SVVhirEWVT7bWkSF42g3S
 VU+YDx2zsaKIabzkob584HYUFb2J/4JBIrdXLr8f2A7XZ8OY28DCb7SgkN9LsF1Fz/DeWvOJVizRe
 tZhZaPPA==;
Received: from [179.193.1.214] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tLnxt-002LzM-DL; Thu, 12 Dec 2024 19:31:09 +0100
Message-ID: <9557db3c-0837-4dfb-ba69-84dbaf13f082@igalia.com>
Date: Thu, 12 Dec 2024 15:31:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] drm: Introduce device wedged event
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com, christian.koenig@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-2-raag.jadav@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20241128153707.1294347-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Raag,

Thank you for your patch.

Em 28/11/2024 12:37, Raag Jadav escreveu:

[...]

> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> +{
> +	const char *recovery = NULL;
> +	unsigned int len, opt;
> +	/* Event string length up to 28+ characters with available methods */
> +	char event_string[32];
> +	char *envp[] = { event_string, NULL };
> +
> +	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
> +
> +	for_each_set_bit(opt, &method, BITS_PER_TYPE(method)) {
> +		recovery = drm_get_wedge_recovery(opt);
> +		if (drm_WARN(dev, !recovery, "device wedged, invalid recovery method %u\n", opt))
> +			break;
> +
> +		len += scnprintf(event_string + len, sizeof(event_string), "%s,", recovery);
> +	}
> +
> +	if (recovery)
> +		/* Get rid of trailing comma */
> +		event_string[len - 1] = '\0';
> +	else
> +		/* Caller is unsure about recovery, do the best we can at this point. */
> +		snprintf(event_string, sizeof(event_string), "%s", "WEDGED=unknown");
> +
> +	drm_info(dev, "device wedged, needs recovery\n");

As documented in the commit message "No explicit device recovery is 
expected from the consumer in this case", I think this should be like this:

if (method != DRM_WEDGE_RECOVERY_NONE)
     drm_info(dev, "device wedged, needs recovery\n");

and maybe a note like this:

else
     drm_info(dev, "device reseted, but managed to recover\n");

Either way, this patch is:

Reviewed-by: André Almeida <andrealmeid@igalia.com>

