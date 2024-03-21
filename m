Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70544886222
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 21:58:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF3110FB71;
	Thu, 21 Mar 2024 20:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="kRTHJthC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5892E10FB71
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 20:58:13 +0000 (UTC)
Message-ID: <2731c8a9-5394-4f49-8ce9-166805663a0b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711054690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lzxVjr40cV/sZougYOlctn2dSP5aNLQM+EP0dwuYv/E=;
 b=kRTHJthColXqwSwjCBGe/shEmkeUcLyhkUSTyDdxGoZEhsQI4c0AwThU1ObV0yfGLf2FkI
 prwVpBOxH2N8O2U+pVqXGM8wBDqI3/qIe4YndHKqp0iWzuTHbtqgyCU5hX5QZH9xP7RFIH
 OXSestw79EapUNs4e/WMMLaSKQuTyYU=
Date: Fri, 22 Mar 2024 04:57:55 +0800
MIME-Version: 1.0
Subject: Re: [v5,13/13] drm/ast: Automatically clean up poll helper
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240320093738.6341-14-tzimmermann@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240320093738.6341-14-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/3/20 17:34, Thomas Zimmermann wrote:



> +
> +/**
> + * devm_drm_kms_helper_poll_init - initialize and enable output polling

Should be drmm_kms_helper_poll_init() here.

> + * @dev: drm_device
> + *
> + * This function initializes and then also enables output polling support for
> + * @dev similar to drm_kms_helper_poll_init(). Polling will automatically be
> + * cleaned up when the DRM device goes away.
> + *
> + * See drm_kms_helper_poll_init() for more information.
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + */
> +int drmm_kms_helper_poll_init(struct drm_device *dev)
> +{
> +	drm_kms_helper_poll_init(dev);
> +
> +	return drmm_add_action_or_reset(dev, drm_kms_helper_poll_init_release, dev);
> +}
> +EXPORT_SYMBOL(drmm_kms_helper_poll_init);

-- 
Best regards,
Sui

