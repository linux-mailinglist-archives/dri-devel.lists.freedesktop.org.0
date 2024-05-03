Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 894FD8BB371
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 20:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05997112930;
	Fri,  3 May 2024 18:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="bBZwbpby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10F911292C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 18:49:14 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2b42ce569b8so15729a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 11:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1714762154; x=1715366954;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R6sVd1TZfxbwE7hyL107cZLQAt+SkbJAdkmwm2tiV/I=;
 b=bBZwbpbykDfXXbUJlNph5vE5oGT3I7yZufGedSYNFVKCTGxTet19Wb9I6ZJCNUv488
 ZrBoard/UQOo6h1JoFPtDg8Zpd96Sn4VrUpJDv8TxjJrYblHl0UGnnU19IBUizOJBQp6
 rCUp/R6N/1275PlgUAb48/H9Eptx5NpHv4knDl93KWjTLqbnDfqK0TvwjdokfEV/7V9B
 FQydGjLH+75/0gjJXhOBby4So+KNHNioTgVyQsD5FJBxnhqkicPFw15K22MejebHVvLx
 xbCUe0BOYRai6pEm8N06TKIK7oRu4Aj8jV4nhOwdrVdqa74dE9xFcxKMwUjIT6L7jyja
 6M8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714762154; x=1715366954;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R6sVd1TZfxbwE7hyL107cZLQAt+SkbJAdkmwm2tiV/I=;
 b=s1Fd+GmDR7fxVZk5CA+V/+C1BCcZ5IcMjtwsFPXQA4+/3Y3N+cuwiYUMip1SBU9Kvt
 z0Xl26nu+wKKzJJ1bc83nU18mtOR3N824uS6x815p59ppRYY+jUfSSxBOaziiD/+zabK
 isBgzYUtWEPnNhHux3BejoiO4I2WW8QLNVKEiQswSTVhXfRTk7wENzDBEWAw5chAqAMa
 HuwgAiri4PhNysmSUyktIZjFO9FUL+BROasact9cHwmhfGpNRjH3BxwrPDja3oWG2IVG
 fP1XZ01Cuu54zYABTExOxqEjvnRjwrQZpnwq2qsqe7PXDtKjdGP4HkEayX/yqQiH1nCU
 VM4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnTJzK/qzdeXrsrG3BuU7py0SWV5AMTuXl4ZeiHljSOrOoQs3ZZLFsdoqg58wag38Zfs0OjQC55+khWjXezAgkgxeTm1Ouc3eZ+z9J4Obm
X-Gm-Message-State: AOJu0YwlswdfYh3OoOWscn6xDKkpx7NbDROOJDu5hY3t4nJkqdXUqifV
 UIMkIYU/+XtKdtRSibSjGn0Z2mfTVZxcT1wUU7l8zvJ9RKrFCbsRfibpgRyQndo=
X-Google-Smtp-Source: AGHT+IG3+qjTWapc+Q+wN/PJnBYud4dggeONIpdmMvZWXIbQyfbY8nF72QViuq38TDN9fCmFOCrwSg==
X-Received: by 2002:aa7:8617:0:b0:6ea:6f18:887a with SMTP id
 p23-20020aa78617000000b006ea6f18887amr3538580pfn.1.1714762153806; 
 Fri, 03 May 2024 11:49:13 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.194])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a056a000cc800b006f0ba75b6b7sm3374417pfv.208.2024.05.03.11.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 11:49:13 -0700 (PDT)
Message-ID: <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
Date: Fri, 3 May 2024 12:49:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: get_file() unsafe under epoll (was Re: [syzbot] [fs?] [io-uring?]
 general protection fault in __ep_remove)
To: Kees Cook <keescook@chromium.org>,
 Bui Quang Minh <minhquangbui99@gmail.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Cc: syzbot <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Laura Abbott <laura@labbott.name>
References: <0000000000002d631f0615918f1e@google.com>
 <7c41cf3c-2a71-4dbb-8f34-0337890906fc@gmail.com>
 <202405031110.6F47982593@keescook>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202405031110.6F47982593@keescook>
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

On 5/3/24 12:26 PM, Kees Cook wrote:
> Thanks for doing this analysis! I suspect at least a start of a fix
> would be this:
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 8fe5aa67b167..15e8f74ee0f2 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -267,9 +267,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>  
>  		if (events & EPOLLOUT) {
>  			/* Paired with fput in dma_buf_poll_cb */
> -			get_file(dmabuf->file);
> -
> -			if (!dma_buf_poll_add_cb(resv, true, dcb))
> +			if (!atomic_long_inc_not_zero(&dmabuf->file) &&
> +			    !dma_buf_poll_add_cb(resv, true, dcb))
>  				/* No callback queued, wake up any other waiters */

Don't think this is sane at all. I'm assuming you meant:

	atomic_long_inc_not_zero(&dmabuf->file->f_count);

but won't fly as you're not under RCU in the first place. And what
protects it from being long gone before you attempt this anyway? This is
sane way to attempt to fix it, it's completely opposite of what sane ref
handling should look like.

Not sure what the best fix is here, seems like dma-buf should hold an
actual reference to the file upfront rather than just stash a pointer
and then later _hope_ that it can just grab a reference. That seems
pretty horrible, and the real source of the issue.

> Due to this issue I've proposed fixing get_file() to detect pathological states:
> https://lore.kernel.org/lkml/20240502222252.work.690-kees@kernel.org/

I don't think this would catch this case, as the memory could just be
garbage at this point.

-- 
Jens Axboe

