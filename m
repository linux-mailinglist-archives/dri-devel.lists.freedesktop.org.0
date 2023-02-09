Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9BA69063D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 12:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1ACA10E98E;
	Thu,  9 Feb 2023 11:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015CE10E17D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 11:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=es/f8tsoNpnBdz/hijlrPyn8DRqu183Lgn2j5/G0UOc=; b=q1bk4vIHL++mJ36fdpf30dp9hU
 nHldgtt+GokutZnf8nuMxY3QQVJzB7NebDIsrdBBJ8a3uwdi+hZb3YMiLbz3Bo2VjoUyjpKyxeDOe
 Fr1S0t+7BzuRbZAzGVA99F/aBJiDlasK20hubdzAWe8OC1EDoFK5L4P4JrQ6sYSwr7wxs8gOjgaSv
 3iCNtH+9jlCA+NpBV+OXdPWRtJdANujvny6XHg3/7YGUTKjzYXmq2qUexQclGQTkbShc0z+6dmssc
 RS9NE1aOhgGa2pugClkfIR98hXrjCqKmVn6dnA51lfWsrOFr0BmRtjvmwT684kWVqNbMuGkGCpw3G
 mF2p+IRg==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pQ4rL-00DsCF-ER; Thu, 09 Feb 2023 12:12:59 +0100
Message-ID: <9cac40bd-ce7f-ec39-ed5b-25a7ba34bc02@igalia.com>
Date: Thu, 9 Feb 2023 08:12:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] drm/debugfs: split registration into dev and minor
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, wambui.karugax@gmail.com, maxime@cerno.tech,
 mwen@igalia.com, mairacanal@riseup.net
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-3-christian.koenig@amd.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230209081838.45273-3-christian.koenig@amd.com>
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

On 2/9/23 05:18, Christian König wrote:
> The different subsystems should probably only register their debugfs
> files once.
> 
> This temporary removes the common files from the render node directory.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/drm_atomic.c        |  4 ++--
>   drivers/gpu/drm/drm_client.c        |  4 ++--
>   drivers/gpu/drm/drm_crtc_internal.h |  2 +-
>   drivers/gpu/drm/drm_debugfs.c       | 24 ++++++++++++------------
>   drivers/gpu/drm/drm_drv.c           |  4 +++-
>   drivers/gpu/drm/drm_framebuffer.c   |  4 ++--
>   drivers/gpu/drm/drm_internal.h      |  5 +++--
>   include/drm/drm_client.h            |  2 +-
>   8 files changed, 26 insertions(+), 23 deletions(-)
> 

[...]

> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 332fb65a935a..5ff7bf88f162 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -185,7 +185,8 @@ int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
>   #if defined(CONFIG_DEBUG_FS)
>   int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>   		     struct dentry *root);
> -void drm_debugfs_register(struct drm_minor *minor);
> +void drm_debugfs_dev_register(struct drm_device *dev);
> +void drm_debugfs_minor_register(struct drm_minor *minor);

For this patch and the previous one, I believe you need to add the functions
to the #else path as well, otherwise it won't compile for CONFIG_DEBUG_FS=n.

Best Regards,
- Maíra Canal

>   void drm_debugfs_cleanup(struct drm_minor *minor);
>   void drm_debugfs_late_register(struct drm_device *dev);
>   void drm_debugfs_connector_add(struct drm_connector *connector);
> @@ -261,4 +262,4 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>   /* drm_framebuffer.c */
>   void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
>   				const struct drm_framebuffer *fb);
> -void drm_framebuffer_debugfs_init(struct drm_minor *minor);
> +void drm_framebuffer_debugfs_init(struct drm_device *dev);
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 39482527a775..507d132cf494 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -200,6 +200,6 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
>   	drm_for_each_connector_iter(connector, iter) \
>   		if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
>   
> -void drm_client_debugfs_init(struct drm_minor *minor);
> +void drm_client_debugfs_init(struct drm_device *dev);
>   
>   #endif
