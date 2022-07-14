Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9434D5750AB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 16:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D4010E449;
	Thu, 14 Jul 2022 14:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656ED10E1B3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 14:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CRDY2exPjh1T2K9wEFk+/SJJqoS2n8ZJiSND6BQFZ2U=; b=Q/9iMrIZg4Kh9k8X7T0T6kPCUd
 KYcMe1EelV9E3SYrVnNeDPWn87SuQbhS2K++jXbeeWWwtZbHSAbQGWeyhighG19wB02wKmdZ/A9Yb
 Azg4xaIfmkOqLAm4FKPA6FQHVxFbvgYSTk9UDHtr6BLxSENrPTFzFgTfxNKU1/lZ0QV3pLDTPkBjv
 lqu4IX7KsVx36tWiVfV/PrIgdgj4+7NdvY0iDiPcQbfUpHu0RzRzv3+VRFOKVbvlbNjE8JT7LZ+Oz
 Cg+A0exp75CT6UgOPhHIPEzIlrh55mk1xrh39R90+DH0/HhhyMjM3tq3LJp9WH8cisFiv+YUEYd/6
 dG9D7HAg==;
Received: from [177.139.47.106] (helo=[192.168.15.109])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1oBzkU-00GSoU-H4; Thu, 14 Jul 2022 16:23:26 +0200
Message-ID: <120a8dc1-7e5c-85da-e087-10d21fedbf20@igalia.com>
Date: Thu, 14 Jul 2022 11:23:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm: Fix EDID firmware load on resume
Content-Language: en-US
To: Matthieu CHARETTE <matthieu.charette@gmail.com>
References: <WKTLER.NFH5CX2O259Q@gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <WKTLER.NFH5CX2O259Q@gmail.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthieu,

Thanks for your patch.

Às 11:58 de 06/07/22, Matthieu CHARETTE escreveu:
> Loading an EDID using drm.edid_firmware parameter makes resume to fail
> after firmware cache is being cleaned. This is because edid_load() use a
> temporary device to request the firmware. This cause the EDID firmware
> not to be cached from suspend. And, requesting the EDID firmware return
> an error during resume.
> So the request_firmware() call should use a permanent device for each
> connector. Also, we should cache the EDID even if no monitor is
> connected, in case it's plugged while suspended.
> 
> Signed-off-by: Matthieu CHARETTE <matthieu.charette@gmail.com>
> ---
> drivers/gpu/drm/drm_connector.c | 9 ++++
> drivers/gpu/drm/drm_edid_load.c | 81 ++++++++++++++++++++++++++++-----
> include/drm/drm_connector.h | 12 +++++
> include/drm/drm_edid.h | 3 ++
> 4 files changed, 94 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c
> b/drivers/gpu/drm/drm_connector.c
> index 1c48d162c77e..e8819ebf1c4b 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -31,6 +31,7 @@
> #include <drm/drm_privacy_screen_consumer.h>
> #include <drm/drm_sysfs.h>
> 
> +#include <linux/platform_device.h>
> #include <linux/uaccess.h>
> 
> #include "drm_crtc_internal.h"
> @@ -289,6 +290,9 @@ int drm_connector_init(struct drm_device *dev,
> 
>  drm_connector_get_cmdline_mode(connector);
> 
> + connector->edid_load_pdev = NULL;
> + drm_cache_edid_firmware(connector);
> +
>  /* We should add connectors at the end to avoid upsetting the connector
>   * index too much.
>   */
> @@ -473,6 +477,11 @@ void drm_connector_cleanup(struct drm_connector
> *connector)
>   connector->tile_group = NULL;
>  }
> 
> + if (connector->edid_load_pdev) {
> + platform_device_unregister(connector->edid_load_pdev);
> + connector->edid_load_pdev = NULL;
> + }
> +

The indentation of your patch is wrong in different places, like in this
if here. It should be like

+ if (connector->edid_load_pdev) {
+ 	platform_device_unregister(connector->edid_load_pdev);
+ 	connector->edid_load_pdev = NULL;
+ }

./scripts/checkpatch.pl can help you detect those issues for your v2

Thanks,
	André
