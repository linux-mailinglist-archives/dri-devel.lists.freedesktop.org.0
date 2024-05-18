Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40BB8C91AD
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 18:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABA610E13C;
	Sat, 18 May 2024 16:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="TCDtg3Be";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr
 [80.12.242.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9900F10E05D
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 16:54:41 +0000 (UTC)
Received: from [192.168.1.37] ([86.243.17.157]) by smtp.orange.fr with ESMTPA
 id 8NKOsDKB5rcIM8NKOs66mv; Sat, 18 May 2024 18:54:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1716051279;
 bh=NQUX/UKoeWYpHl5nclkHEYXVWH0iNXBos3sbtmi02Oc=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=TCDtg3BeyPLHPzxmB8apkDFp5cEt851ceBSNxIPUG0zaEvoB1HXG9ADmllOSafhCV
 xiMSRtrRg49ddbeGq9GBBTaiXYU9RwokOGiM6sEBkiLxmGY5axibYntwUYri5QU2PE
 jYvKhi/zUtdYUXVh7X5PXZUgOxvIDHBl8qIGQDq1neVNDQxiJ/v7PSgNfBb5XeZHjW
 wTEhDy7FrkJbaeMHWqV2+EFaCKZCkWNCFghQWXhaMG0/QMeySbDaywPAft9DzIOXUb
 a/mvRt9YIiWc26GmA4Dvi8YXHGFPNcibmoHh2Wga8th0vqmO/ggx2ReILJ03dDXg1V
 Mjeo8LUyqHyFw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 18 May 2024 18:54:39 +0200
X-ME-IP: 86.243.17.157
Message-ID: <34a6d812-b4ed-4465-b0ec-e641d185b9b1@wanadoo.fr>
Date: Sat, 18 May 2024 18:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/nvif: Avoid build error due to potential
 integer overflows
To: Guenter Roeck <linux@roeck-us.net>
Cc: airlied@gmail.com, dakr@redhat.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, jani.nikula@intel.com, javierm@redhat.com,
 kherbst@redhat.com, linux-kernel@vger.kernel.org, lyude@redhat.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, tzimmermann@suse.de,
 linux-hardening@vger.kernel.org
References: <20240518143743.313872-1-linux@roeck-us.net>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240518143743.313872-1-linux@roeck-us.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(adding linux-hardening@vger.kernel.org)


Le 18/05/2024 à 16:37, Guenter Roeck a écrit :
> Trying to build parisc:allmodconfig with gcc 12.x or later results
> in the following build error.
> 
> drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_mthd':
> drivers/gpu/drm/nouveau/nvif/object.c:161:9: error:
> 	'memcpy' accessing 4294967264 or more bytes at offsets 0 and 32 overlaps 6442450881 bytes at offset -2147483617 [-Werror=restrict]
>    161 |         memcpy(data, args->mthd.data, size);
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_ctor':
> drivers/gpu/drm/nouveau/nvif/object.c:298:17: error:
> 	'memcpy' accessing 4294967240 or more bytes at offsets 0 and 56 overlaps 6442450833 bytes at offset -2147483593 [-Werror=restrict]
>    298 |                 memcpy(data, args->new.data, size);
> 
> gcc assumes that 'sizeof(*args) + size' can overflow, which would result
> in the problem.
> 
> The problem is not new, only it is now no longer a warning but an error since W=1
> has been enabled for the drm subsystem and since Werror is enabled for test builds.
> 
> Rearrange arithmetic and add extra size checks to avoid the overflow.
> 
> Fixes: a61ddb4393ad ("drm: enable (most) W=1 warnings by default across the subsystem")
> Cc: Javier Martinez Canillas <javierm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Jani Nikula <jani.nikula-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
> Cc: Danilo Krummrich <dakr-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> ---
> checkpatch complains about the line length in the description and the (pre-existing)
> assignlemts in if conditions, but I did not want to split lines in the description
> or rearrange the code further.
> 
> I don't know why I only see the problem with parisc builds (at least so far).
> 
>   drivers/gpu/drm/nouveau/nvif/object.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
> index 4d1aaee8fe15..baf623a48874 100644
> --- a/drivers/gpu/drm/nouveau/nvif/object.c
> +++ b/drivers/gpu/drm/nouveau/nvif/object.c
> @@ -145,8 +145,9 @@ nvif_object_mthd(struct nvif_object *object, u32 mthd, void *data, u32 size)
>   	u8 stack[128];
>   	int ret;
>   
> -	if (sizeof(*args) + size > sizeof(stack)) {
> -		if (!(args = kmalloc(sizeof(*args) + size, GFP_KERNEL)))
> +	if (size > sizeof(stack) - sizeof(*args)) {
> +		if (size > INT_MAX ||
> +		    !(args = kmalloc(sizeof(*args) + size, GFP_KERNEL)))

Hi,

Would it be cleaner or better to use size_add(sizeof(*args), size)?

>   			return -ENOMEM;
>   	} else {
>   		args = (void *)stack;
> @@ -276,7 +277,8 @@ nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle,
>   	object->map.size = 0;
>   
>   	if (parent) {
> -		if (!(args = kmalloc(sizeof(*args) + size, GFP_KERNEL))) {
> +		if (size > INT_MAX ||
> +		    !(args = kmalloc(sizeof(*args) + size, GFP_KERNEL))) {

Same.

CJ

>   			nvif_object_dtor(object);
>   			return -ENOMEM;
>   		}

