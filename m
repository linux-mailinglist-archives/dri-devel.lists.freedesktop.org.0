Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF2F7B9CAA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 13:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC85510E1C5;
	Thu,  5 Oct 2023 11:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830B810E1C5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LfeI/ntN/31nRir1nZz/n9kBcWcApB1eXAXKC57xtdE=; b=RqkLDRIfJ0oQA3qTnaGLObZS3k
 eh6zDqL32V0my7VlyI880ua9UjFJrA/Yb2YZE3X2zut0dhEHvinelRGNNin5i9G9JU31gn2qrF/fb
 ARYE2Va4k6RiVlzmS2ZWfMfBwyZGSd+AZBpSiZEZF2nZoLrZqYfQNMFeAgeRyWQJCz9oJq8hHOY0O
 oMfRKjRwBlG9fva58kc85X94QJ47ethCrfoxX5r285GrQEyaaqyIh4LApGByhI2wShivZo+q0A/CR
 Px+bQX6EJS960/jpWG/z2+Pj3FtgCi2YChkDOzMIFDNshlKT1f8LnbkyCv6ioc2uGmxVsEt0ed1A+
 5bJJrBUg==;
Received: from [2a01:799:95f:2800:2fb5:c6db:11b1:a10f] (port=38194)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1qoM74-005faj-4t;
 Thu, 05 Oct 2023 13:01:50 +0200
Message-ID: <1785eb28-ebcb-798c-18fe-1c3fc08657bc@tronnes.org>
Date: Thu, 5 Oct 2023 13:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 1/7] drm/format-helper: Cache buffers with struct
 drm_format_conv_state
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 jfalempe@redhat.com, jose.exposito89@gmail.com, arthurgrillo@riseup.net,
 mairacanal@riseup.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-2-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20231005090520.16511-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: noralf@tronnes.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/5/23 11:04, Thomas Zimmermann wrote:
> Hold temporary memory for format conversion in an instance of struct
> drm_format_conv_state. Update internal helpers of DRM's format-conversion
> code accordingly. Drivers will later be able to maintain this cache by
> themselves.
> 
> Besides caching, struct drm_format_conv_state will be useful to hold
> additional information for format conversion, such as palette data or
> foreground/background colors. This will enable conversion from indexed
> color formats to component-based formats.
> 
> v3:
> 	* rename struct drm_xfrm_buf to struct drm_format_conv_state
> 	  (Javier)
> 	* remove managed cleanup
> 	* add drm_format_conv_state_copy() for shadow-plane support
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 115 +++++++++++++++++++++++++---
>  include/drm/drm_format_helper.h     |  51 ++++++++++++
>  2 files changed, 155 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index f93a4efcee909..37c499ae4fe4f 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -20,6 +20,94 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_rect.h>
>  
> +/**
> + * drm_format_conv_state_init - Initialize format-conversion state
> + * @state: The state to initialize
> + *
> + * Clears all fields in struct drm_format_conv_state and installs a DRM
> + * release action for the buffer. The buffer will be empty with no
> + * preallocated resources.

You forgot to remove the release action note in this version.

With that fixed:

Acked-by: Noralf Trønnes <noralf@tronnes.org>
