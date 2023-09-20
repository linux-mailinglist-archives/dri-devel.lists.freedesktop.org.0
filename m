Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AA17A7A88
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 13:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D69110E170;
	Wed, 20 Sep 2023 11:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3A410E170
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 11:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695210045; x=1726746045;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TraNpoB3AlMV8UZchexPNu/US2GFT5zg6qDhWprNbOs=;
 b=hoHEA/IqZu/Zdoam4gcfYc+GMUV+9lJWvuHLBkuUQlOvOMrZAXJadk5a
 SweCKY0O6/evvt2zIn3ZldES0D/LWB2S6o2qYV4GCNKkW910xH1ShTr2i
 ssn3iYuRyeRTiygYW1Hp3dLmePbLgsrzGzEYiQS1thLP+VUy5cyHw0Hgy
 5pZ4BwGRA4akddU3i0IOn/NRvIp8iR7qUGhCNDPWfvjJl8IVlD/3tcXD3
 F40sTzAsaxd+XkX3xRT+yOVPla2EUXrSy24uMX1GCuQgBlJcuJgwo5Jjb
 6GDUGpW+RWmVMlMqiNbZF35hS3JmFsCfv+IIyvQjIj7WWybV63jvR7TMO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="380100977"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="380100977"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 04:40:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="696268559"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="696268559"
Received: from ptelkov-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.38.103])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 04:40:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 jfalempe@redhat.com, jose.exposito89@gmail.com, arthurgrillo@riseup.net,
 mairacanal@riseup.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH 2/8] drm/format-helper: Pass xfrm buffer to
 format-conversion helpers
In-Reply-To: <20230920112508.11770-3-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230920112508.11770-1-tzimmermann@suse.de>
 <20230920112508.11770-3-tzimmermann@suse.de>
Date: Wed, 20 Sep 2023 14:40:37 +0300
Message-ID: <871qetrs22.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, David Lechner <david@lechnology.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Sep 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 1a6bd291345de..c6deabb6c64e5 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -20,6 +20,10 @@
>  
>  #define TEST_USE_DEFAULT_PITCH 0
>  
> +static unsigned char conversion_buf_mem[PAGE_SIZE];
> +static struct drm_xfrm_buf xfrm =
> +	DRM_XFRM_BUF_INIT_PREALLOCATED(conversion_buf_mem, ARRAY_SIZE(conversion_buf_mem));
> +

Just something that caught my eye, that should be sizeof() instead of
ARRAY_SIZE(), I think, even though makes no difference for unsigned
char.

BR,
Jani.


-- 
Jani Nikula, Intel
