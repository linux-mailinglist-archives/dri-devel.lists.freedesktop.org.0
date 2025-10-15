Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8B9BDD357
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 09:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC6B10E324;
	Wed, 15 Oct 2025 07:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KU1ZYWOy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE8D10E733
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 07:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760514765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MHykXUHzy3P15VrWtRxCqfqVXwzZ2Ylga+RWIrK7dZE=;
 b=KU1ZYWOyDIwp4S0YN5O9G5v4PiTcyS4tN2OQ/zFd0tL87xUu7N5utJO4rRX6rfjM5Tep26
 Bu+ls5UIsYWtXP0m1ccwoy7RBnvhQu42i7X6UWwHXKRfzSKKL01F0/My/kbWlUsQI+uqgl
 mdqwvQiqrlRTGWgul8yBE/ZqBjORHc8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-qOnjImm7PKqbR0qC2qXLGA-1; Wed, 15 Oct 2025 03:52:44 -0400
X-MC-Unique: qOnjImm7PKqbR0qC2qXLGA-1
X-Mimecast-MFC-AGG-ID: qOnjImm7PKqbR0qC2qXLGA_1760514763
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-46e36686ca1so56133905e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760514763; x=1761119563;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MHykXUHzy3P15VrWtRxCqfqVXwzZ2Ylga+RWIrK7dZE=;
 b=DBfd+FbShKKKhEQu/EDrnJFP3vmkvID+MtcnQnHdqiK267xCukTdsxOzFZMW2rzNKm
 /xaOerwrNkhGEkeF9UNh6ok0wA6h8yyYdF45N3YGNAEHKhMnEx7O8+RgmZwc+LP4BfvV
 3tXGx7OoOpWu9fBVtAblFW2DPppK2Acd2oOhlk6tIH8VVnzfNFfza8S643KyzW6fvzQW
 NdAz3KSb52w9eTsSYYz+xw+q6khozQcvRjDIv04VgHv9IH4ASQ3eXRnUU2tnxcMhlfLI
 brer0rV0KfiHWXYOXl24iJKoFnQh7QrEGZrZjnu8CSn9Rp3/J0pFCZBY1UrfrbvNFKtt
 bQow==
X-Gm-Message-State: AOJu0Yw8Y8c2gKnHuP8gUKKB7eNt1s+J19K6DXTASC59v/bYE/4JjKo3
 VXCnrJDfxLuWgGDxZZ6XxtAGlRcOGkLo4WvFJZOXQfc1QMYDuiv+7oSHyYg19kzQXU7zSgbc7PH
 lKcHTYbKsp8Phzkb6QsYchrTlplKv6u0SBS8A0vAeTkttU2s3XQL3keul+DnUPW2R4+/RTw==
X-Gm-Gg: ASbGnctF4lG1F7vASFwn8wLYM/dBCu3gWr/tqHrZSJ84D+D+v+OWm2bCLyl860t/xZM
 2UpNlAMF3z/1ZRWIhuAD8rg7kkvFFCLVzrB4mjzim5HG23iJP1JMO7GLVRWZ0hC44if+ISORlQk
 nrXrYtwYXvQcxNdtgceRiL3aj5vpvjYbwEipW87iBmDuxdkcwcPMmrq2D+bpMmouj97s/QspKcR
 P/SRlj79QXTlIRNwUyIHZhAa6qUvmF11dLzeAPXUQjLOtNZoBuVydFqaSbAznzdHClrsvSRKUGw
 ZKvdRfO/cJORKWngJ0yDDRKoSb4p/0MHoh8m16KG9lF2nR3hOAx36qFlNW8806JPjFE7XLx3/3x
 wQw3c
X-Received: by 2002:a05:600c:34cc:b0:46e:59dd:1b4d with SMTP id
 5b1f17b1804b1-46fa9aa2076mr211303425e9.16.1760514763142; 
 Wed, 15 Oct 2025 00:52:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW2ZDBPJxUfYCX0H6nLEKOLye2i61674dJQY/ZLYYwFVcv5Uohdp1HeQRReQYkGVWqF+Eh1g==
X-Received: by 2002:a05:600c:34cc:b0:46e:59dd:1b4d with SMTP id
 5b1f17b1804b1-46fa9aa2076mr211303305e9.16.1760514762767; 
 Wed, 15 Oct 2025 00:52:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47106fc97adsm2155395e9.9.2025.10.15.00.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 00:52:42 -0700 (PDT)
Message-ID: <3d07c6ba-02d6-4d3f-8684-65a41b128539@redhat.com>
Date: Wed, 15 Oct 2025 09:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/log: Do not hold lock across drm_client_release()
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009132006.45834-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kMIruqHIZKNbG1lYolHvYOcrOxmL62A7bw6q9rqSt_o_1760514763
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

On 09/10/2025 15:16, Thomas Zimmermann wrote:
> When calling drm_client_release(), the client is already quiescent.
> Internal locks should therefore be dropped before the caller releases
> the client.
> 
> In the case of the DRM log, concurrency originates from the console or
> from client events. The console has been unregistered in the previous
> line. The caller of the unregister callback, drm_log_client_unregister(),
> holds clientlist_mutex from struct drm_device to protect against concurrent
> client events. It is therefore safe to release the client without holding
> locks.

Thanks, I agree, it should be safe to move drm_client_release() after 
the lock.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/clients/drm_log.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index d239f1e3c456..116e0ef9ae5d 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -302,8 +302,8 @@ static void drm_log_client_unregister(struct drm_client_dev *client)
>   
>   	mutex_lock(&dlog->lock);
>   	drm_log_free_scanout(client);
> -	drm_client_release(client);
>   	mutex_unlock(&dlog->lock);
> +	drm_client_release(client);
>   	kfree(dlog);
>   	drm_dbg(dev, "Unregistered with drm log\n");
>   }

