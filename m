Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319509670FA
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 12:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94CF10E075;
	Sat, 31 Aug 2024 10:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="iWSOQxHJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr
 [80.12.242.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2C410E075
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 10:57:37 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id kLewsd95c6mdlkLews593w; Sat, 31 Aug 2024 12:48:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1725101330;
 bh=jWhl45GhCInF4jIxORGfZyY2AMGshnhXMxuMEz4hBUk=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=iWSOQxHJoDSMbOQzbXx6fpKqvOzFo6iD/jctkMfqp68dsOu1gg3To2GoWL3P/GyGq
 wwlJjHCPf5qLNRlmVunnvjtHHkg43rmVJuc03g7KGqW1u998TRKAXrW+L0JdnuI8qC
 0f1xr8MEG1ILdl2FPjrmSsnVXkDEbv4uCEupgRqNPwkWn6s2WfQqg3J1O3qVycsVQN
 CyWWt2x5cBrDGT1Xik0t+HeBZ/8/W3WqXtRhDb2+2JuaUx090szYr6gTRv4jCdHX4x
 EoILVoQ1Sgm4BcJdlBj7zGLQYRMp1cnba4ESwccdMOXIxRTDTHDVG7l+b0KdPT5W4Q
 7BLzdhvpflg5w==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 31 Aug 2024 12:48:50 +0200
X-ME-IP: 90.11.132.44
Message-ID: <74dfe952-2055-4152-90c6-ac9cc42fcad9@wanadoo.fr>
Date: Sat, 31 Aug 2024 12:48:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] drm/imagination: Use memdup_user() helper
To: Jinjie Ruan <ruanjinjie@huawei.com>, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240831103047.99499-1-ruanjinjie@huawei.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240831103047.99499-1-ruanjinjie@huawei.com>
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

Le 31/08/2024 à 12:30, Jinjie Ruan a écrit :
> Switching to memdup_user(), which combines kmalloc() and copy_from_user(),
> and it can simplfy code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   drivers/gpu/drm/imagination/pvr_context.c | 22 +++++++---------------
>   1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imagination/pvr_context.c b/drivers/gpu/drm/imagination/pvr_context.c
> index eded5e955cc0..e75fd50a4d9f 100644
> --- a/drivers/gpu/drm/imagination/pvr_context.c
> +++ b/drivers/gpu/drm/imagination/pvr_context.c
> @@ -69,27 +69,19 @@ process_static_context_state(struct pvr_device *pvr_dev, const struct pvr_stream
>   	void *stream;
>   	int err;
>   
> -	stream = kzalloc(stream_size, GFP_KERNEL);
> -	if (!stream)
> -		return -ENOMEM;
> -
> -	if (copy_from_user(stream, u64_to_user_ptr(stream_user_ptr), stream_size)) {
> -		err = -EFAULT;
> -		goto err_free;
> -	}
> +	stream = memdup_user(u64_to_user_ptr(stream_user_ptr), stream_size);
> +	if (IS_ERR(stream))
> +		return PTR_ERR(stream);
>   
>   	err = pvr_stream_process(pvr_dev, cmd_defs, stream, stream_size, dest);
> -	if (err)
> -		goto err_free;
> +	if (err) {
> +		kfree(stream);
> +		return err;
> +	}
>   
>   	kfree(stream);
>   
>   	return 0;
> -
> -err_free:
> -	kfree(stream);
> -
> -	return err;
>   }

It could also be:
  	err = pvr_stream_process(...);

  	kfree(stream);

  	return err;

as you did for drivers/gpu/drm/imagination/pvr_job.c.

CJ

>   
>   static int init_render_fw_objs(struct pvr_context *ctx,

