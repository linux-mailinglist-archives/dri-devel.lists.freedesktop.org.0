Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B92687C52
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 12:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BAA10E008;
	Thu,  2 Feb 2023 11:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A967A10E008
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8PMsa8t9/48qp4pBG6wAPkv4EWYJfGgqlN6J6TxKZQA=; b=I4km1iaOY3udJbK9imP3niOiyF
 oYg89bYQN2eK0pAcZ9Ydq3aAwYOYPd4ptG1jwbPSgRzQWLrgMuLgEzD6VZEi0nTl+J5pqWolicomf
 Ax/KxHJggaG5e1OF1E05BgA2r4TrPn1tDOEOtbd6AWHaHc+RqMIDHglWgnVOAVZw46XpHmWNc2DzV
 9PnUt+3goP8s5gMh7mWGX1TMxi/jVPX8RgjvNXX6HSf3B9abPpQ9wOy/jUbgVkhGN4nxHYIXToGVr
 ulG0cds4DJwAydT9AmvoMxDzhVApQTBNlJGZ6msFnXM4j8dPsNJMX9ly9SBciSOLWyGLySBF/FLKd
 A3Pa9IYw==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pNXoU-007IDf-Oh; Thu, 02 Feb 2023 12:31:35 +0100
Message-ID: <a199df89-4dc4-0eff-e25b-4af44f2e020d@igalia.com>
Date: Thu, 2 Feb 2023 08:31:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/client: Convert to VISIBLE_IF_KUNIT
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230202110312.808607-1-maxime@cerno.tech>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230202110312.808607-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 2/2/23 08:03, Maxime Ripard wrote:
> Commit 8fc0380f6ba7 ("drm/client: Add some tests for
> drm_connector_pick_cmdline_mode()") was meant to introduce unit tests
> for the static drm_connector_pick_cmdline_mode() function.
> 
> In such a case, the kunit documentation recommended to import the tests
> source file directly from the source file with the static function to
> test.
> 
> While it was working, it's generally frowned upon. Fortunately, commit
> 9c988fae6f6a ("kunit: add macro to allow conditionally exposing static
> symbols to tests") introduced macros to easily deal with that case. We
> can thus remove our include and use those macros instead.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/drm_client_modeset.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 1b12a3c201a3..f48882941852 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -8,6 +8,9 @@
>    */
>   
>   #include "drm/drm_modeset_lock.h"
> +
> +#include <kunit/visibility.h>
> +
>   #include <linux/module.h>
>   #include <linux/mutex.h>
>   #include <linux/slab.h>
> @@ -159,7 +162,8 @@ drm_connector_has_preferred_mode(struct drm_connector *connector, int width, int
>   	return NULL;
>   }
>   
> -static struct drm_display_mode *drm_connector_pick_cmdline_mode(struct drm_connector *connector)
> +VISIBLE_IF_KUNIT struct drm_display_mode *
> +drm_connector_pick_cmdline_mode(struct drm_connector *connector)
>   {
>   	struct drm_cmdline_mode *cmdline_mode;
>   	struct drm_display_mode *mode;
> @@ -215,6 +219,7 @@ static struct drm_display_mode *drm_connector_pick_cmdline_mode(struct drm_conne
>   
>   	return NULL;
>   }
> +EXPORT_SYMBOL_IF_KUNIT(drm_connector_pick_cmdline_mode);
>   
>   static bool drm_connector_enabled(struct drm_connector *connector, bool strict)
>   {
> @@ -1233,7 +1238,3 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
>   	return ret;
>   }
>   EXPORT_SYMBOL(drm_client_modeset_dpms);
> -
> -#ifdef CONFIG_DRM_KUNIT_TEST
> -#include "tests/drm_client_modeset_test.c"
> -#endif

As you removed this guard, you need to add drm_client_modeset_test.o
to tests/Makefile, otherwise, drm_client_modeset_test won't compile.

Best Regards,
- Maíra Canal
