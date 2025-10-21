Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1216FBF686B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 14:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D228810E30F;
	Tue, 21 Oct 2025 12:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gQOnw+6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DFE10E5DB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761050865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NsAbQCPZDvKOoJwmtsqUpOBXBASGBxZqdateSFggr7Q=;
 b=gQOnw+6nvQyCdNGPw23FtHShyyb6f7w2GGamFVevSDyAtVC62+vgqb0YHBQ0XBLZdbg+rD
 0i9sFpkb8roT/IRMKG5QsPGp7HkBEu8/uFXlb9G2hTvmaCyJpmEcYivDRk5HTsKeOgSwOU
 JJ9ujiGWeeQJvvCWys3NE+w5wMSJzds=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-JO8KagAhOXO_hEvs_NDiYQ-1; Tue, 21 Oct 2025 08:47:44 -0400
X-MC-Unique: JO8KagAhOXO_hEvs_NDiYQ-1
X-Mimecast-MFC-AGG-ID: JO8KagAhOXO_hEvs_NDiYQ_1761050863
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b56f1c14b71so194932066b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 05:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761050863; x=1761655663;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NsAbQCPZDvKOoJwmtsqUpOBXBASGBxZqdateSFggr7Q=;
 b=LdaU3GV4u72M5zY3SGF9QihiCCoObhjXpyj/NenUwy2U4INspMSURZX6YPMP9yxzEa
 Mn1xucRm9rnNE5tXXqlEiNARN/Uq8OMCSdUBSrNwuAE1eGxXaszVbYXR1VROL68FLvn4
 kB36/Iaw+D3zpuG4pScnjhd57aHOZRoGeHd932WkA0GE9F91uakuJY81DxaNRv5E+8PD
 P1qREjD4THqwjUEJaDF+Ny3EDsHQJiMwXbAaqLukr5736p1mnbxy1D6BbN606EUFEvw/
 U/L2RfR4TA3N+rG1lKl4PvXtWGJ5IAKL4hqMLRs6CtvLX62HuZyM2Wdrswp5qpIiDSgd
 1dBA==
X-Gm-Message-State: AOJu0YzvClTTMO6w7h11S8RBXCkgASvJhW6TR4cDeFUC1/dpgStsuN4N
 T5Lk5i8cJ1RsQHrTdIeH8BixoSwScEjKkQzPU2/jGbRRJmUqZn1HSfp6dV68Ubq5Af6QE/olIRI
 YMFxIrjwqHwvQL0UPjAomdWcFk75kbWJiaGLEMsjhnwsSefpR69mpAeGRUKpjP3PaLcs1mw==
X-Gm-Gg: ASbGncuAldoQCLhNRzpwZfA7FVlL7oqYQfpMo7Qd4HprSDv3CSnZ8tlBKwuL7f0woax
 IqOnquekvKtBR4L8vPn1Nx2hFOAAwKgPSvEkjs2lSaextSgC34DND0zzVheK7JKMGt9zJH06BVH
 QP+7KlsIaZyGx7q2efeOWGr8hp8MiR9s2UyXS2c5yG67bqvEVNVW3wGb8KFBnWnXI7TRPAs76dK
 9fr+49xSuBtud1Wxi3oyYPaMNlzTxgFX3rTNd184tGF5tfv5vgLs3bjR+tz6W1vrOZ0Ze+JF2Vr
 G455upKSaDSPP5SHydSYkqQxgiqJYpjposzHz1nX+Zo3YSzWzwMdYQeAxoa+jLK3Bz/4KJgBamE
 OAjzV3UJjJWcCbB1byWB88f5aEjsVDkW5CN4YsO4=
X-Received: by 2002:a17:906:3688:b0:b6c:fdaa:8161 with SMTP id
 a640c23a62f3a-b6cfdaa8282mr173050066b.44.1761050863223; 
 Tue, 21 Oct 2025 05:47:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEuS93kS84TkfF2iOZ+5XlgLX7RB2A25oPnnGb0yS6ufeS81hpG+cwHRRFtiKz1vfx7xpW1w==
X-Received: by 2002:a17:906:3688:b0:b6c:fdaa:8161 with SMTP id
 a640c23a62f3a-b6cfdaa8282mr173046666b.44.1761050862744; 
 Tue, 21 Oct 2025 05:47:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb035bafsm1077252366b.42.2025.10.21.05.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 05:47:42 -0700 (PDT)
Message-ID: <dd16638b-88cc-4483-8345-b151c47e88cd@redhat.com>
Date: Tue, 21 Oct 2025 14:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/client: Move dumb-buffer handling to
 drm_client_framebuffer_create()
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 rrameshbabu@nvidia.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20251020151402.53013-1-tzimmermann@suse.de>
 <20251020151402.53013-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251020151402.53013-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A1JNokvgNm6n7SsN6xI72F97hKMhfVDuRjrmf68Rfkc_1761050863
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 20/10/2025 17:04, Thomas Zimmermann wrote:
> Dumb-buffer creation within the client code is asymetrically balanced
> across drm_client_buffer_create() and drm_client_framebuffer_create().
> Put all dumb-buffer code into drm_client_framebuffer_create() and leave
> client-buffer initialization to drm_client_buffer_create(). Clarifies
> responsibility between these functions.
> 
> Apart form the architectural improvements, drm_client_buffer_create()
> can now be exported if needed by clients. The client will be able to
> initialize buffers that have been created from other interfaces than
> dumb buffers.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_client.c | 56 +++++++++++++++++++-----------------
>   1 file changed, 29 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 5fa8a1628563..9bf2edfb7b64 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -184,11 +184,8 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>   
>   static struct drm_client_buffer *
>   drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
> -			 u32 format, u32 *handle, u32 *pitch)
> +			 u32 format, u32 handle, u32 pitch)
>   {
> -	const struct drm_format_info *info = drm_format_info(format);
> -	struct drm_mode_create_dumb dumb_args = { };
> -	struct drm_device *dev = client->dev;
>   	struct drm_client_buffer *buffer;
>   	struct drm_gem_object *obj;
>   	int ret;
> @@ -199,28 +196,18 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
>   
>   	buffer->client = client;
>   
> -	dumb_args.width = width;
> -	dumb_args.height = height;
> -	dumb_args.bpp = drm_format_info_bpp(info, 0);
> -	ret = drm_mode_create_dumb(dev, &dumb_args, client->file);
> -	if (ret)
> -		goto err_delete;
> -
> -	obj = drm_gem_object_lookup(client->file, dumb_args.handle);
> +	obj = drm_gem_object_lookup(client->file, handle);
>   	if (!obj)  {
>   		ret = -ENOENT;
>   		goto err_delete;
>   	}
>   
>   	buffer->gem = obj;
> -	*handle = dumb_args.handle;
> -	*pitch = dumb_args.pitch;
>   
>   	return buffer;
>   
>   err_delete:
> -	drm_client_buffer_delete(buffer);
> -
> +	kfree(buffer);
>   	return ERR_PTR(ret);
>   }
>   
> @@ -394,16 +381,30 @@ static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
>   struct drm_client_buffer *
>   drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format)
>   {
> +	const struct drm_format_info *info = drm_format_info(format);
> +	struct drm_device *dev = client->dev;
> +	struct drm_mode_create_dumb dumb_args = { };
>   	struct drm_client_buffer *buffer;
> -	u32 handle, pitch;
>   	int ret;
>   
> +	dumb_args.width = width;
> +	dumb_args.height = height;
> +	dumb_args.bpp = drm_format_info_bpp(info, 0);
> +	ret = drm_mode_create_dumb(dev, &dumb_args, client->file);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	buffer = drm_client_buffer_create(client, width, height, format,
> -					  &handle, &pitch);
> -	if (IS_ERR(buffer))
> -		return buffer;
> +					  dumb_args.handle, dumb_args.pitch);
> +	if (IS_ERR(buffer)) {
> +		ret = PTR_ERR(buffer);
> +		goto err_drm_mode_destroy_dumb;
> +	}
>   
> -	ret = drm_client_buffer_addfb(buffer, width, height, format, handle, pitch);
> +	ret = drm_client_buffer_addfb(buffer, width, height, format,
> +				      dumb_args.handle, dumb_args.pitch);
> +	if (ret)
> +		goto err_drm_client_buffer_delete;
>   
>   	/*
>   	 * The handle is only needed for creating the framebuffer, destroy it
> @@ -411,14 +412,15 @@ drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 heig
>   	 * object as DMA-buf. The framebuffer and our buffer structure are still
>   	 * holding references to the GEM object to prevent its destruction.
>   	 */
> -	drm_mode_destroy_dumb(client->dev, handle, client->file);
> -
> -	if (ret) {
> -		drm_client_buffer_delete(buffer);
> -		return ERR_PTR(ret);
> -	}
> +	drm_mode_destroy_dumb(client->dev, dumb_args.handle, client->file);
>   
>   	return buffer;
> +
> +err_drm_client_buffer_delete:
> +	drm_client_buffer_delete(buffer);
> +err_drm_mode_destroy_dumb:
> +	drm_mode_destroy_dumb(client->dev, dumb_args.handle, client->file);
> +	return ERR_PTR(ret);
>   }
>   EXPORT_SYMBOL(drm_client_framebuffer_create);
>   

