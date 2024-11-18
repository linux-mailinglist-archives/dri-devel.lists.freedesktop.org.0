Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466EA9D0B78
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 10:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C16C10E352;
	Mon, 18 Nov 2024 09:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="WROV3G+I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB2A10E352
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 09:15:28 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-38248b810ffso390438f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 01:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1731921327; x=1732526127;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vgBc0WpMo9WuNAB3fbwxkobyvq9Qa1bYqtOSW5URvVE=;
 b=WROV3G+Iy0v9fVh3IxxIuDcyBhW74Q5nsDlNOZ8E7CtVhofDuj8arecE2Y9KGDFLLD
 UfNZbzMKIGWLFRMqs1s6TxaogP2LAKXQWGfInPXsoGndZpef0ZcLY82JBWM9JGKZyWGy
 h1Tf08FKrD/f0l8DF/FHdbYZp+X/xbske5tkT1hxrXn/HhXdewICMs4Cw3WjGIv/sCzi
 cUF2XTDXGdsAuKgd7jwdW8aPwWvronhl9ZREqINOZGnsAvfig3Yqovd6ZPZCvPRsgWrg
 7c9PADWhdanzqRcIa6ojQfO/JRftuRlQDo/q/XDC68Ll3FKHzg1duiCK7Dfzs7fHSQZF
 /1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731921327; x=1732526127;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vgBc0WpMo9WuNAB3fbwxkobyvq9Qa1bYqtOSW5URvVE=;
 b=p4NnogJZETEO7t/bk5pNowd+A9Fu0eNG4AjkZSVtab48PAnpV5HWN501hvj5BwaFmB
 epI0U68mI1sco3sGJ2tchXJml7lQc0lV2stTBX/lLp75on0xPYGKooVdNiOZCKRCMG1e
 82+xwbOfbNNrkRZ66LYic2eI7cmOpQN/FXewaCDkVxrObDGA88x618toPhlTpTXTQqUH
 1qB6sJ++YdX2TvgYbm6BGSjVS7XAQ7x2u80kUauCcgkm6j64egqBqBC32bn+zYxlkiw7
 YEkLl//Lusxo0c8N0TWtUlMh3nYlJ79sFvpWp+9fDrp/y1OrdypnFTkGSNvIFTuQb4/E
 Rhag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx5KuLp7CIK71+KEqaMXpx/iHYcxObURHSlpf4qdaNuL0aaFvaXvQY/Kj1RAfUyEQ+fzv8WdB8FEA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWJO7EgSvJvx067RnvAyV6gRafOsCsNnrovSXEUaOHaxZkrGps
 8ZXGl6D7iIsyeqfyrzwDeK4eFRmrhaJiD8p//YKXaZWf5OXsvgiazM08VaK6gUtUtgGAM58caIF
 z
X-Google-Smtp-Source: AGHT+IEIFBDAw5D+ahQKLZjgRDXj6yIsgMktblXupw/QSnASFZwhVB5g5FmH8LJ0iyETcG1odFzaHg==
X-Received: by 2002:a05:6000:4189:b0:382:4a66:f517 with SMTP id
 ffacd0b85a97d-3824a66f66fmr577502f8f.4.1731921326636; 
 Mon, 18 Nov 2024 01:15:26 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38244220183sm3552606f8f.99.2024.11.18.01.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 01:15:26 -0800 (PST)
Message-ID: <468d41ad-9f89-4a83-8eb1-9bd7efaf1367@ursulin.net>
Date: Mon, 18 Nov 2024 09:15:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Fix __dma_buf_debugfs_list_del argument for
 !CONFIG_DEBUG_FS
To: "T.J. Mercier" <tjmercier@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20241117170326.1971113-1-tjmercier@google.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20241117170326.1971113-1-tjmercier@google.com>
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


On 17/11/2024 17:03, T.J. Mercier wrote:
> The arguments for __dma_buf_debugfs_list_del do not match for both the
> CONFIG_DEBUG_FS case and the !CONFIG_DEBUG_FS case. The !CONFIG_DEBUG_FS
> case should take a struct dma_buf *, but it's currently struct file *.
> This can lead to the build error:
> 
> error: passing argument 1 of ‘__dma_buf_debugfs_list_del’ from
> incompatible pointer type [-Werror=incompatible-pointer-types]
> 
> dma-buf.c:63:53: note: expected ‘struct file *’ but argument is of
> type ‘struct dma_buf *’
>     63 | static void __dma_buf_debugfs_list_del(struct file *file)
> 
> Fixes: bfc7bc539392 ("dma-buf: Do not build debugfs related code when !CONFIG_DEBUG_FS")
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>   drivers/dma-buf/dma-buf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 8892bc701a66..afb8c1c50107 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -60,7 +60,7 @@ static void __dma_buf_debugfs_list_add(struct dma_buf *dmabuf)
>   {
>   }
>   
> -static void __dma_buf_debugfs_list_del(struct file *file)
> +static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
>   {
>   }
>   #endif

Huh I wonder how this sneaked by until now.. thanks for fixing!

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
