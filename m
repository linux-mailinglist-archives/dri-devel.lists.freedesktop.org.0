Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB57BDD36F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 09:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E13310E752;
	Wed, 15 Oct 2025 07:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Gsm9Bomr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF50810E74A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 07:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760514804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+HZgDzRdpaVTxvZqJl2rTn2R8LelhY8vbHUCgBN35M=;
 b=Gsm9BomrVDUBy65/Na6kCv/CIxpyBLmZeXQCcXwdjFZ0KCbw5uXG1hklZ4O556OkIduW4E
 hOJXvpraZWv+PUOQHDMkm3rzReeTB/ICCCd7Gi6tC93DEOwbfNNyiMv5efndqYHrIMIhlB
 86nWUyXgHDFh+msTCm1ygs7dozggJ54=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-rGEzEMO8OqW7wKLnKmCIxg-1; Wed, 15 Oct 2025 03:53:20 -0400
X-MC-Unique: rGEzEMO8OqW7wKLnKmCIxg-1
X-Mimecast-MFC-AGG-ID: rGEzEMO8OqW7wKLnKmCIxg_1760514799
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-47105bfcf15so1432665e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760514799; x=1761119599;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t+HZgDzRdpaVTxvZqJl2rTn2R8LelhY8vbHUCgBN35M=;
 b=GgoVVTkAY7BTiYkW4QCao9nGegxg3jI3uqU6bdoEZHCbfhbSP/V67gecuQFv2N1T4q
 lpu0qekjfm7euzqKfZT18pHwEPQhQYyWu4ozWbMJcVRmFmhDiYUJF8/Q/Sth4Vz+b9ln
 cJC/XdXkSY/TsLhstjP12NgJNKKS1v0oWcszQC0QkalKGGFuaJKWXWSQZ9ELmROYIHoV
 ZImeTvVFc2p2P3OKEaIUEm9CVH7sN6pbjlpB5R/IXjHDWLxN5TZs4MmmgpTwc5Wvk2/w
 +psOcxsX+RtliQ8xOtuOCuhv8xJMz+AIk6wy9otX/8HFkL4xL4a0Q8XgamZPT+nnGfzQ
 Cguw==
X-Gm-Message-State: AOJu0YwsxqOVwD1vw7xXJc4oWkGY4fLZ4YBpQDoKKPA0R1G+9jXVkg5K
 Ul/KW1RVDcJT0EMn3Xr5Sgu2E/DBQIX2K3E02NL60u3Y2caRI7LX9Pn43+H+cAq5KnweOlaE5gr
 wn4i0ga/Zlwc+Ol/DV6gnWhMjO/beqsj0Q7cioa30ja0ow4NkpZ8QqNkLmV6Jtwvuuz10Eg==
X-Gm-Gg: ASbGnctCf9+Q3N3Iasvr/+ExDdPe7AMH2yw/rXkIgPfl+0EbgYr4+k2qDR+FWk086u1
 ZlM/WtXlYU/ZOg4XC2QEW1/iP6Y0EAevrjCLjxiLr/sMav4nlNtJ1vRT4UawvLatNAfo8qP2YjJ
 fnj5f9RRT1+f9u+auaZNnhMEiCpqKwuvumKJjlvmYWBq9Vw6D2/z9mWm09gxrETri5a9X7heD6R
 agma4qNPpHScB9fNshb6JKDhn7Xov5p3FRh/gMx9zmy6WeHeKVaADWvKaYlEYG3toC3/cDkr0xS
 0dTszS/gpTEudSqcIqQUz60BmBQIWdQNQyIIGr4GqbtyhzMa0Pk+hv6Kf8phgZk77q0bktSPMEq
 qPCMF
X-Received: by 2002:a05:600c:1e28:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-46fa9b11746mr202661515e9.36.1760514799498; 
 Wed, 15 Oct 2025 00:53:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZf7d9TK63edfjPsh4LrX74Y6wRlhtOgKLsjlyk6mKGtY9U4BbM1bQ2mcLbjosAJUslcGWjg==
X-Received: by 2002:a05:600c:1e28:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-46fa9b11746mr202661265e9.36.1760514799084; 
 Wed, 15 Oct 2025 00:53:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47101c21805sm14875785e9.10.2025.10.15.00.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 00:53:18 -0700 (PDT)
Message-ID: <c256b8d9-ec9e-4841-9136-1198ad2d590a@redhat.com>
Date: Wed, 15 Oct 2025 09:53:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/log: Add free callback
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009132006.45834-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xchcbhk2dIyMwyED-xjeBsAXTHriAgNMiLdHvxdFrpI_1760514799
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
> Free the client memory in the client free callback. Also move the
> debugging output into the free callback: drm_client_release() puts
> the reference on the DRM device, so pointers to the device should
> be considered dangling afterwards.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/clients/drm_log.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index 116e0ef9ae5d..470df4148e96 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -293,19 +293,26 @@ static void drm_log_free_scanout(struct drm_client_dev *client)
>   	}
>   }
>   
> -static void drm_log_client_unregister(struct drm_client_dev *client)
> +static void drm_log_client_free(struct drm_client_dev *client)
>   {
>   	struct drm_log *dlog = client_to_drm_log(client);
>   	struct drm_device *dev = client->dev;
>   
> +	kfree(dlog);
> +
> +	drm_dbg(dev, "Unregistered with drm log\n");
> +}
> +
> +static void drm_log_client_unregister(struct drm_client_dev *client)
> +{
> +	struct drm_log *dlog = client_to_drm_log(client);
> +
>   	unregister_console(&dlog->con);
>   
>   	mutex_lock(&dlog->lock);
>   	drm_log_free_scanout(client);
>   	mutex_unlock(&dlog->lock);
>   	drm_client_release(client);
> -	kfree(dlog);
> -	drm_dbg(dev, "Unregistered with drm log\n");
>   }
>   
>   static int drm_log_client_hotplug(struct drm_client_dev *client)
> @@ -339,6 +346,7 @@ static int drm_log_client_resume(struct drm_client_dev *client, bool _console_lo
>   
>   static const struct drm_client_funcs drm_log_client_funcs = {
>   	.owner		= THIS_MODULE,
> +	.free		= drm_log_client_free,
>   	.unregister	= drm_log_client_unregister,
>   	.hotplug	= drm_log_client_hotplug,
>   	.suspend	= drm_log_client_suspend,

