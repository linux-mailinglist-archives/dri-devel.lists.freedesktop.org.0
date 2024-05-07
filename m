Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3399B8BE316
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9EB10F532;
	Tue,  7 May 2024 13:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iVIRc7Wa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB9010F532
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:10:04 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-34e0d47bd98so3090771f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 06:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715087403; x=1715692203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zWhuKkDlnxPJbDbjOht3LPyoadKgxR6Zdq3ESsD59zE=;
 b=iVIRc7WaKd9t+85y2mm+cze373rNKZXUyLuWTk5E6h/z9QgA58/Dk20HDWfXDluzw8
 nWXzX8VMFU8skvfY3Q9/1kGM90IHugUgesPBrid3Y2a5bb2QpfN9jszuuQaV9pmaEAmu
 UHGimeLo9st0MRGDD0EvVt9iJPTwFKkFCTjyUdNijtqzV+m4VPiTMafSFOplcgXiZnIl
 H3FNfSg4MvhjrWsYoToKFhiB3adLCbpjgAW0E1kqtLhEMUIsPPEeanAu2AA+i9LZJSWC
 G2SsrYsHcU1ZzBVXkdk5awXQdKi6gJ67zy+h2VIMioYJ9ixl8W/OP3HGqJq4p6Rv90pF
 /0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715087403; x=1715692203;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zWhuKkDlnxPJbDbjOht3LPyoadKgxR6Zdq3ESsD59zE=;
 b=bLtVS4AlTtUdj4DZImaVPDR/+KcRXICdmkDeVdUuvdw5JEpmFwU4L03TSbYbD6keGl
 CF5jof99P1P+/lW7ao9ZQZ4Fkr5UGtpygqxb8qyy3nhoLpYQrGFmDj/gGFsFSoFX9AVr
 F7ZuOlOz47Tur+zN7L10lmvAA+GY9hA1WTL89b0DnnXWps0y2rdSyEkdyEDpZwnZC48P
 11zOE9TqJRXnToI3h5V8l5igse35blg7RGd0vR/Dnm54kLrqT89v4tkkcKOJFPupKUCe
 HZ5of2w5EvMTB5J8c/nSN79/u9KLPrMwmNlcthScqJBmRJfr7guqrPQYHCn3JwHfEdpp
 v0Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxnIqqtUnGdZyURmfuD8G2herBqyVdsSr+RdzDzFXZbpte1sf3fx3bguu9Nm6K2Hv9zIdAJS+2yqZZ8Z+eShT+CdrUDNJSAHonvB4Mhfsh
X-Gm-Message-State: AOJu0YwXiQRGk6QhvxNl+QxjfShfz5Vxk8lOvgdYhi9VlmYZDzU0owtd
 MpdY1MKtma9OFesyvQgVsWwJdxj6pEJAyzcTIw7AeC7fVI3vPsLH
X-Google-Smtp-Source: AGHT+IFVS0ZEkqevW9dP+NzuwvDByGtiCtcnyqB2hI1UWywKm3iKHmcKd7uoqFxyB8I12UOS6k4zcw==
X-Received: by 2002:a05:6000:901:b0:34c:ce6a:96fa with SMTP id
 ffacd0b85a97d-34f81f39e52mr2553850f8f.34.1715087402694; 
 Tue, 07 May 2024 06:10:02 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a05600c1c8800b00418a6d62ad0sm23528898wms.34.2024.05.07.06.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 06:10:02 -0700 (PDT)
Message-ID: <8980975d-87db-4d57-9e23-4fb7fbb62e7d@gmail.com>
Date: Tue, 7 May 2024 15:09:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/sw-sync: don't enable IRQ from
 sync_print_obj()
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 syzbot <syzbot+a225ee3df7e7f9372dbe@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Christian Konig <christian.koenig@amd.com>, Sean Paul
 <seanpaul@chromium.org>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
References: <0000000000000946190610bf7bd5@google.com>
 <c2e46020-aaa6-4e06-bf73-f05823f913f0@I-love.SAKURA.ne.jp>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <c2e46020-aaa6-4e06-bf73-f05823f913f0@I-love.SAKURA.ne.jp>
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

Am 05.05.24 um 16:08 schrieb Tetsuo Handa:
> Since commit a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from
> known context") by error replaced spin_unlock_irqrestore() with
> spin_unlock_irq() for both sync_debugfs_show() and sync_print_obj() despite
> sync_print_obj() is called from sync_debugfs_show(), lockdep complains
> inconsistent lock state warning.
>
> Use plain spin_{lock,unlock}() for sync_print_obj(), for
> sync_debugfs_show() is already using spin_{lock,unlock}_irq().
>
> Reported-by: syzbot <syzbot+a225ee3df7e7f9372dbe@syzkaller.appspotmail.com>
> Closes: https://syzkaller.appspot.com/bug?extid=a225ee3df7e7f9372dbe
> Fixes: a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from known context")
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/sync_debug.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
> index 101394f16930..237bce21d1e7 100644
> --- a/drivers/dma-buf/sync_debug.c
> +++ b/drivers/dma-buf/sync_debug.c
> @@ -110,12 +110,12 @@ static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
>   
>   	seq_printf(s, "%s: %d\n", obj->name, obj->value);
>   
> -	spin_lock_irq(&obj->lock);
> +	spin_lock(&obj->lock); /* Caller already disabled IRQ. */
>   	list_for_each(pos, &obj->pt_list) {
>   		struct sync_pt *pt = container_of(pos, struct sync_pt, link);
>   		sync_print_fence(s, &pt->base, false);
>   	}
> -	spin_unlock_irq(&obj->lock);
> +	spin_unlock(&obj->lock);
>   }
>   
>   static void sync_print_sync_file(struct seq_file *s,

