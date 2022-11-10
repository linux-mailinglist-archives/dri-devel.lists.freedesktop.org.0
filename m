Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45AA624E71
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 00:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A80E10E0F7;
	Thu, 10 Nov 2022 23:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CDA10E0F7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 23:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668122893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k6pINIfAcX8fsVQ8y2w86gjo1XSQIgtzszxe1Uy5Zew=;
 b=QTx1KiOAdNAyvW32b0oqQVgXgyPqdl8Cf19KwZ/aCr+B6PYan3q+YJ9g36IfBoKIckU+va
 silL6m4045oZKAgOY569471WzjdhF7sSnfmVX8UB/SORMDzGi46lQ1ktuxpYOvDLhanlI6
 qarJfS5UAu56voN0Vafhe2P69eivPCI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-146-UVjitzkQOkKsAG5fqfoHJg-1; Thu, 10 Nov 2022 18:28:11 -0500
X-MC-Unique: UVjitzkQOkKsAG5fqfoHJg-1
Received: by mail-qk1-f197.google.com with SMTP id
 ay43-20020a05620a17ab00b006fa30ed61fdso3444654qkb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 15:28:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k6pINIfAcX8fsVQ8y2w86gjo1XSQIgtzszxe1Uy5Zew=;
 b=u7SafvEK1TSKNzTtL5Ne5KG2bsEzpzdqvr7l3cAscVm8wW8UiJD/SI6y7afrlE59Lf
 +seoROwuxWlLAgZW17D3etvEAGLf2wMB2K94s3+4Kb8P9MGldF1eQgYKG85lQ+FXdlwr
 JeOKESm0qri7haDP+upVJqMXNEW6+i69WoDJ1HMYIO0rIXED/Blm8FCioqKSe+37pVWx
 vN0eV2AAtA79KZmiXcD3CrIaPvp6lSBif/HjmLu1yIL5ItAip5QwGIqV7Ya5zJBdNxYi
 eCwRtRF9jRa9+03IJiOsq9grUxQpK0iGb4WdVjnopXmyIsIywl2qXvN+ZpgR0s3Qs2lC
 v2sg==
X-Gm-Message-State: ANoB5pmicep8j+n0TpX0E6BQnRfx7dedrps/xqgJwWXH9sMb5kaxss/R
 8YvJvmrzyJjXAfeLbCyV4P1FavyiUPX/wMBv5TfhNReQUbhAHvDZ8KiGZXYBxJ4N/a8vHFHO875
 FS5g3PPAKKuhMMB0hM7uip/wHf9/c
X-Received: by 2002:a05:622a:15cf:b0:3a5:91e0:d69a with SMTP id
 d15-20020a05622a15cf00b003a591e0d69amr1762336qty.654.1668122888574; 
 Thu, 10 Nov 2022 15:28:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5sZ+P4MEpAkKGrG8lnSSLLkUnMA7hMcYgKQ8uuoI/wdUhyvqNFp2HXObjFXXbSpBSlYPHQWA==
X-Received: by 2002:a05:622a:15cf:b0:3a5:91e0:d69a with SMTP id
 d15-20020a05622a15cf00b003a591e0d69amr1762325qty.654.1668122888381; 
 Thu, 10 Nov 2022 15:28:08 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:9200::feb? ([2600:4040:5c6c:9200::feb])
 by smtp.gmail.com with ESMTPSA id
 bj17-20020a05620a191100b006cfc1d827cbsm470854qkb.9.2022.11.10.15.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 15:28:07 -0800 (PST)
Message-ID: <605c1305c8de1327edc275dd1d2355122ebb7de9.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/drv: Fix potential memory leak in drm_dev_init()
From: Lyude Paul <lyude@redhat.com>
To: Shang XiaoJing <shangxiaojing@huawei.com>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org
Date: Thu, 10 Nov 2022 18:28:06 -0500
In-Reply-To: <20221101070716.9189-2-shangxiaojing@huawei.com>
References: <20221101070716.9189-1-shangxiaojing@huawei.com>
 <20221101070716.9189-2-shangxiaojing@huawei.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will go ahead and push these two upstream, thanks!

On Tue, 2022-11-01 at 15:07 +0800, Shang XiaoJing wrote:
> drm_dev_init() will add drm_dev_init_release() as a callback. When
> drmm_add_action() failed, the release function won't be added. As the
> result, the ref cnt added by device_get() in drm_dev_init() won't be put
> by drm_dev_init_release(), which leads to the memleak. Use
> drmm_add_action_or_reset() instead of drmm_add_action() to prevent
> memleak.
> 
> unreferenced object 0xffff88810bc0c800 (size 2048):
>   comm "modprobe", pid 8322, jiffies 4305809845 (age 15.292s)
>   hex dump (first 32 bytes):
>     e8 cc c0 0b 81 88 ff ff ff ff ff ff 00 00 00 00  ................
>     20 24 3c 0c 81 88 ff ff 18 c8 c0 0b 81 88 ff ff   $<.............
>   backtrace:
>     [<000000007251f72d>] __kmalloc+0x4b/0x1c0
>     [<0000000045f21f26>] platform_device_alloc+0x2d/0xe0
>     [<000000004452a479>] platform_device_register_full+0x24/0x1c0
>     [<0000000089f4ea61>] 0xffffffffa0736051
>     [<00000000235b2441>] do_one_initcall+0x7a/0x380
>     [<0000000001a4a177>] do_init_module+0x5c/0x230
>     [<000000002bf8a8e2>] load_module+0x227d/0x2420
>     [<00000000637d6d0a>] __do_sys_finit_module+0xd5/0x140
>     [<00000000c99fc324>] do_syscall_64+0x3f/0x90
>     [<000000004d85aa77>] entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> Fixes: 2cbf7fc6718b ("drm: Use drmm_ for drm_dev_init cleanup")
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index e3a1243dd2ae..b2c2a5872621 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -616,7 +616,7 @@ static int drm_dev_init(struct drm_device *dev,
>  	mutex_init(&dev->clientlist_mutex);
>  	mutex_init(&dev->master_mutex);
>  
> -	ret = drmm_add_action(dev, drm_dev_init_release, NULL);
> +	ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
>  	if (ret)
>  		return ret;
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

