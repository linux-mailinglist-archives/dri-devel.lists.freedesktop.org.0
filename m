Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC4F145E48
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 22:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD83B6F90C;
	Wed, 22 Jan 2020 21:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72176F90E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 21:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 351B040283;
 Wed, 22 Jan 2020 22:52:27 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=l4xB613+; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gBHKem6YwskI; Wed, 22 Jan 2020 22:52:26 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id AC9FD4026C;
 Wed, 22 Jan 2020 22:52:24 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id EE48A360057;
 Wed, 22 Jan 2020 22:52:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579729944; bh=CE+m6jz9osyaGNkFMzcG8nTiif0YN1jWHHmULGfPXgs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=l4xB613+3TmCZRv5IMA+dZl5OQwyD2T8xC4xKAL39auq7BUpy18+xZKYPKgFvMnES
 yUjsiAfAcWtOV91F1qOL3YajPDz+0eCNmG36F6wPIa/Bfezn+LrEM0sFXH9J34BaEo
 zZlk0V+ZhOl7uD7YqzGd7JXEliuboDK7FPWRglM8=
Subject: Re: [PATCH] drm: Release filp before global lock
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20200122155637.496291-1-chris@chris-wilson.co.uk>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <d5facf06-14d6-0203-f43c-22400588ab70@shipmail.org>
Date: Wed, 22 Jan 2020 22:52:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200122155637.496291-1-chris@chris-wilson.co.uk>
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Chris,

On 1/22/20 4:56 PM, Chris Wilson wrote:
> The file is not part of the global drm resource and can be released
> prior to take the global mutex to drop the open_count (and potentially
> close) the drm device.
>
> However, inside drm_close_helper() there are a number of dev->driver
> callbacks that take the drm_device as the first parameter... Worryingly
> some of those callbacks may be (implicitly) depending on the global
> mutex.

I read this as you suspect that there are driver callbacks inside 
drm_close_helper() that might need the global mutex held? But then it 
wouldn't be safe to move the lock? Is there a strong motivation for 
moving the locking in the first place? Also a minor nit below:

>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   drivers/gpu/drm/drm_file.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 92d16724f949..84ed313ee2e9 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -438,12 +438,12 @@ int drm_release(struct inode *inode, struct file *filp)
>   	struct drm_minor *minor = file_priv->minor;
>   	struct drm_device *dev = minor->dev;
>   
> -	mutex_lock(&drm_global_mutex);
> -
>   	DRM_DEBUG("open_count = %d\n", dev->open_count);

The read of dev->open_count should still be inside the lock to be 
consistent with the value that is decremented below. Perhaps move the 
DRM_DEBUG()?

>   
>   	drm_close_helper(filp);
>   
> +	mutex_lock(&drm_global_mutex);
> +
>   	if (!--dev->open_count)
>   		drm_lastclose(dev);
>   

Thanks,

Thomas


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
