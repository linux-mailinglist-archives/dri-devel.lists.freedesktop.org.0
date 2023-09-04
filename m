Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D66791210
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B34610E0FE;
	Mon,  4 Sep 2023 07:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1C310E2AC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693812415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQTKqj30qmlqwetoVCjU/RMzfvQVNzpUtjmq1iYKbmU=;
 b=XcckfbVPLsL1Quwh+7WvH/DzxfIZmc5d9U/5KuDirk6fClkdeGNAu+pDVFRBW3RSIqYpHL
 dxqB/HYjapAVv/0bOZXJRWPQnEwAe0esv8ELgvlPHYWADGwOn7WJ9uRcEixP+9RprCHVAd
 xoCTripvwj7TeZlbfftYMNjPGzAw9io=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-l6BG4ZeTPiSJqGPeKkpKSQ-1; Mon, 04 Sep 2023 03:26:54 -0400
X-MC-Unique: l6BG4ZeTPiSJqGPeKkpKSQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-993d7ca4607so80365966b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 00:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693812413; x=1694417213;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eQTKqj30qmlqwetoVCjU/RMzfvQVNzpUtjmq1iYKbmU=;
 b=lEwYgu1G9+e013CiU/ymjZo5CFyQdZs/pS8v2tpZrscdExpPuoPYAAhY7zN9hfhccb
 Q2BxDcuoBF/zx7wdNGlajRoky4ycJvPK0w0qm711XR0lUogF3s7cM5bnW0EaNXFkraJw
 N+CWyX5JSoLmHxmJyDia8wr52ZK7tS6welIwpAcukXcGK7GVfQHKAbZGL0d9nB90QI1k
 L1X3m1xncjJBuvNYcR1MQR0iHTVAyoCvF0bLfZ5vEMX5rgn1nf8QjGpwpAStZRKgtqhO
 dPilT4eiqOOTHf6YWw2RH8ClpJLlLyjuxd5ye37PJ6fUOlCkn+e7TPwGK3IqwYoTUrMY
 4x2g==
X-Gm-Message-State: AOJu0YwzHmi08VhozwhS7M5ODeSMRUJmUEVLl+uBDOUxtxoUYCKHfz2+
 xcs5b3tAgTnoa905b28qTFsOeH/2rszGMvZu9j+8uolpIve8UxXK83BqrY/D/VnsKCdIoZkUHZZ
 xqLw3qbbKGC5GcEmJ7wWCBE5dpTDM
X-Received: by 2002:a17:906:845b:b0:9a4:119b:741 with SMTP id
 e27-20020a170906845b00b009a4119b0741mr5508662ejy.8.1693812413028; 
 Mon, 04 Sep 2023 00:26:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuqtBne35pLNQ6lqPUh58J5E5GhOFfbZit8/nrwF5gzKQ4seLbF7epGvm7A+5tbh4D9prZbw==
X-Received: by 2002:a17:906:845b:b0:9a4:119b:741 with SMTP id
 e27-20020a170906845b00b009a4119b0741mr5508656ejy.8.1693812412721; 
 Mon, 04 Sep 2023 00:26:52 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a170906259a00b0099ca4f61a8bsm5777632ejb.92.2023.09.04.00.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 00:26:51 -0700 (PDT)
Message-ID: <6614854c-7408-362e-32fe-d1532a065361@redhat.com>
Date: Mon, 4 Sep 2023 09:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm: gm12u320: Fix the timeout usage for usb_bulk_msg()
To: Jinjie Ruan <ruanjinjie@huawei.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20230904021421.1663892-1-ruanjinjie@huawei.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230904021421.1663892-1-ruanjinjie@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/4/23 04:14, Jinjie Ruan wrote:
> The timeout arg of usb_bulk_msg() is ms already, which has been converted
> to jiffies by msecs_to_jiffies() in usb_start_wait_urb(). So fix the usage
> by removing the redundant msecs_to_jiffies() in the macros.
> 
> And as Hans suggested, also remove msecs_to_jiffies() for the IDLE_TIMEOUT
> macro to make it consistent here and so change IDLE_TIMEOUT to
> msecs_to_jiffies(IDLE_TIMEOUT) where it is used.
> 
> Fixes: e4f86e437164 ("drm: Add Grain Media GM12U320 driver v2")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> ---
> v2:
> - Remove the msecs_to_jiffies() also for IDLE_TIMEOUT.
> - Update the fix tag.
> - Update the commit message.

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Note I don't gave time to merge this myself atm.

If one of the drm-misc maintainers can pick this up that would
be great.

Regards,

Hans



> ---
>  drivers/gpu/drm/tiny/gm12u320.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index c5bb683e440c..0187539ff5ea 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -70,10 +70,10 @@ MODULE_PARM_DESC(eco_mode, "Turn on Eco mode (less bright, more silent)");
>  #define READ_STATUS_SIZE		13
>  #define MISC_VALUE_SIZE			4
>  
> -#define CMD_TIMEOUT			msecs_to_jiffies(200)
> -#define DATA_TIMEOUT			msecs_to_jiffies(1000)
> -#define IDLE_TIMEOUT			msecs_to_jiffies(2000)
> -#define FIRST_FRAME_TIMEOUT		msecs_to_jiffies(2000)
> +#define CMD_TIMEOUT			200
> +#define DATA_TIMEOUT			1000
> +#define IDLE_TIMEOUT			2000
> +#define FIRST_FRAME_TIMEOUT		2000
>  
>  #define MISC_REQ_GET_SET_ECO_A		0xff
>  #define MISC_REQ_GET_SET_ECO_B		0x35
> @@ -389,7 +389,7 @@ static void gm12u320_fb_update_work(struct work_struct *work)
>  	 * switches back to showing its logo.
>  	 */
>  	queue_delayed_work(system_long_wq, &gm12u320->fb_update.work,
> -			   IDLE_TIMEOUT);
> +			   msecs_to_jiffies(IDLE_TIMEOUT));
>  
>  	return;
>  err:

