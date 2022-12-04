Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBD9641F9B
	for <lists+dri-devel@lfdr.de>; Sun,  4 Dec 2022 21:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD4A10E057;
	Sun,  4 Dec 2022 20:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E4510E057
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Dec 2022 20:45:35 +0000 (UTC)
Received: from [192.168.2.103] (109-252-124-61.nat.spd-mgts.ru
 [109.252.124.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5C5D6660035C;
 Sun,  4 Dec 2022 20:45:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1670186733;
 bh=UMQoP9W0p04vTQUQWO237zkx10mRI/dKkIw7Lig3+Kc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=P78D5QejvBCnU95dIIBU2WXl6Y/iMoyzuJoF+NatKvsMyvwrDBD5o/N4WFQifIVaB
 Jxb5iwKC7SUiUyWiaFzTbw04in4CDe/uC8+3un87bqKREnzMMsfm4Vgfp811B9Qr7s
 EL/5hBesdvE0ONOBqssdnuJUc+U1fzPUjQ2NJBA43X5vD5zpqp6MTNq5qXTzuqefBH
 lYBp9BZ5qUZhgaEb9K+TeRK8i8Ooano/6isOBSuC8dVv9VJQbfouTUIJ3Yiq3ZgYYE
 NLuTSbzWwZIHU2mTJPcFMEsMG2t3vBXrK1KVkfeJPhqGyjC79HlE4qkLuPM94ZDicR
 tDR7M5h7cTk+A==
Message-ID: <3e9e157d-e740-ee5b-b8d3-07822b2c9a9b@collabora.com>
Date: Sun, 4 Dec 2022 23:45:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/2] drm/shmem-helper: Remove errant put in error path
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20221130185748.357410-1-robdclark@gmail.com>
 <20221130185748.357410-2-robdclark@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20221130185748.357410-2-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Eric Anholt <eric@anholt.net>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/30/22 21:57, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> drm_gem_shmem_mmap() doesn't own this reference, resulting in the GEM
> object getting prematurely freed leading to a later use-after-free.
> 
> Link: https://syzkaller.appspot.com/bug?extid=c8ae65286134dd1b800d
> Reported-by: syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com
> Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 35138f8a375c..3b7b71391a4c 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -622,10 +622,8 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>  	}
>  
>  	ret = drm_gem_shmem_get_pages(shmem);
> -	if (ret) {
> -		drm_gem_vm_close(vma);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
>  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);

AFAICS, the dmabuf mmaping code path needs a similar fix, isn't it?

-		/* Drop the reference drm_gem_mmap_obj() acquired.*/
-		drm_gem_object_put(obj);
		vma->vm_private_data = NULL;

-		return dma_buf_mmap(obj->dma_buf, vma, 0);
+		ret = dma_buf_mmap(obj->dma_buf, vma, 0);
+
+		/* Drop the reference drm_gem_mmap_obj() acquired.*/
+		if (!ret)
+			drm_gem_object_put(obj);
+
+		return ret;


-- 
Best regards,
Dmitry

