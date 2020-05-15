Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4601D53FB
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 17:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA176ECD3;
	Fri, 15 May 2020 15:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 301E16ECD3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 15:15:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA6AF2F;
 Fri, 15 May 2020 08:15:00 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7600D3F71E;
 Fri, 15 May 2020 08:15:00 -0700 (PDT)
Subject: Re: [PATCH v2 12/38] drm/gem: add drm_object_put helper
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
 <20200515095118.2743122-13-emil.l.velikov@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <daa165a6-f99e-5b8f-3f38-b474c98b1c9b@arm.com>
Date: Fri, 15 May 2020 16:14:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515095118.2743122-13-emil.l.velikov@gmail.com>
Content-Language: en-GB
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/05/2020 10:50, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> Spelling out _unlocked for each and every driver is a annoying.
> Especially if we consider how many drivers, do not know (or need to)
> about the horror stories involving struct_mutex.
> 
> Add helper, which will allow us to transition the drivers one by one,
> dropping the suffix.
> 
> v2: add missing space after function name (Jani)
> 
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org> (v1)

NIT: The subject is wrong: s/drm_object_put/drm_gem_object_put/

With that fixed:

Reviewed-by: Steven Price <steven.price@arm.com>

Steve

> ---
>   include/drm/drm_gem.h | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index a231a2b3f5ac..2f7b86c0649c 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -364,17 +364,19 @@ static inline void drm_gem_object_get(struct drm_gem_object *obj)
>   }
>   
>   /**
> - * drm_gem_object_put_unlocked - drop a GEM buffer object reference
> + * drm_gem_object_put - drop a GEM buffer object reference
>    * @obj: GEM buffer object
>    *
>    * This releases a reference to @obj.
>    */
>   static inline void
> -drm_gem_object_put_unlocked(struct drm_gem_object *obj)
> +drm_gem_object_put(struct drm_gem_object *obj)
>   {
>   	kref_put(&obj->refcount, drm_gem_object_free);
>   }
>   
> +#define drm_gem_object_put_unlocked drm_gem_object_put
> +
>   void drm_gem_object_put_locked(struct drm_gem_object *obj);
>   
>   int drm_gem_handle_create(struct drm_file *file_priv,
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
