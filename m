Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24682330B3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 13:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C079B6E8D3;
	Thu, 30 Jul 2020 11:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8046E8D3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 11:04:20 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id kq25so14575864ejb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 04:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zwiu18VeI3AwF7Mq31CPp3fUZwxix3OSGRZw2/o7hgo=;
 b=HAEjFBhCxtN19MeL1pZ1dkns2q1qsNQgEhrLzjylz3pmInUbLbRwPtZJ4AX3rOEXEh
 dgLl8suv7maule1x8O2Sg86qbvuQyPqGt470Jh2whMdvcZgFH2nZKc8/XCXvhrj1r94F
 BDfVfA9376C2gvXQyuPQToLb2hG4zcR5ezzWPcWIrWC19UYl8rYFQCE9mS7RCj0LfW0w
 xw05jnrzSrMgvl3RQcUz65PtBa687eK62f4JJ+LS75j2FDWtHYMrqBg0rmdCdcKTOIRr
 FRZLgI0pOz/tjuHV42maG0XIe5+yNq5DHfzfez3W9T+cTcidY7wMcYylDv8jJJi59/O3
 TrJw==
X-Gm-Message-State: AOAM532j+SBhCX1v/vanLY1vE+qwgCVX78GIkjRfWJHLOZpMLITFD7Oq
 KQRpXMMTerF6VkFMDoBQ5mY=
X-Google-Smtp-Source: ABdhPJzK4O+pWjSZycMb/tNKwLewvzSFulIOo2Z0a0uHVoXKCMkWJchSKrnqKtpcW7GSqHduRUGYlQ==
X-Received: by 2002:a17:906:95cb:: with SMTP id
 n11mr1968648ejy.506.1596107059516; 
 Thu, 30 Jul 2020 04:04:19 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id t2sm5735565eds.60.2020.07.30.04.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 04:04:18 -0700 (PDT)
Subject: Re: [PATCH] vgacon: Fix an out-of-bounds in vgacon_scrollback_update()
To: Yang Yingliang <yangyingliang@huawei.com>, b.zolnierkie@samsung.com
References: <20200713105730.550334-1-yangyingliang@huawei.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <220220f1-48f7-46f6-952f-ab41fa57d6a1@kernel.org>
Date: Thu, 30 Jul 2020 13:04:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713105730.550334-1-yangyingliang@huawei.com>
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13. 07. 20, 12:57, Yang Yingliang wrote:
> I got a slab-out-of-bounds report when I doing fuzz test.
> 
> [  334.989515] ==================================================================
> [  334.989577] BUG: KASAN: slab-out-of-bounds in vgacon_scroll+0x57a/0x8ed
> [  334.989588] Write of size 1766 at addr ffff8883de69ff3e by task test/2658
> [  334.989593]
> [  334.989608] CPU: 3 PID: 2658 Comm: test Not tainted 5.7.0-rc5-00005-g152036d1379f #789
> [  334.989617] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.org 04/01/2014
> [  334.989624] Call Trace:
> [  334.989646]  dump_stack+0xe4/0x14e
> [  334.989676]  print_address_description.constprop.5+0x3f/0x60
> [  334.989699]  ? vgacon_scroll+0x57a/0x8ed
> [  334.989710]  __kasan_report.cold.8+0x92/0xaf
> [  334.989735]  ? vgacon_scroll+0x57a/0x8ed
> [  334.989761]  kasan_report+0x37/0x50
> [  334.989789]  check_memory_region+0x1c1/0x1e0
> [  334.989806]  memcpy+0x38/0x60
> [  334.989824]  vgacon_scroll+0x57a/0x8ed
> [  334.989876]  con_scroll+0x4ef/0x5e0
...
> Because vgacon_scrollback_cur->tail plus memcpy size is greater than
> vgacon_scrollback_cur->size. Fix this by checking the memcpy size.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/video/console/vgacon.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
> index 998b0de1812f..b51ffb9a208d 100644
> --- a/drivers/video/console/vgacon.c
> +++ b/drivers/video/console/vgacon.c
> @@ -243,6 +243,7 @@ static void vgacon_scrollback_startup(void)
>  static void vgacon_scrollback_update(struct vc_data *c, int t, int count)
>  {
>  	void *p;
> +	int size;
>  
>  	if (!vgacon_scrollback_cur->data || !vgacon_scrollback_cur->size ||
>  	    c->vc_num != fg_console)
> @@ -251,13 +252,17 @@ static void vgacon_scrollback_update(struct vc_data *c, int t, int count)
>  	p = (void *) (c->vc_origin + t * c->vc_size_row);
>  
>  	while (count--) {
> +		size = vgacon_scrollback_cur->size - vgacon_scrollback_cur->tail;
> +		if (size > c->vc_size_row)
> +			size = c->vc_size_row;
> +
>  		scr_memcpyw(vgacon_scrollback_cur->data +
>  			    vgacon_scrollback_cur->tail,
> -			    p, c->vc_size_row);
> +			    p, size);

Are you sure the consumer can handle split lines? As vgacon_scrolldelta
(soff in particular) looks to me like it doesn't.

Have you tested you patch? I mean with soft scrollback on the vga console?

>  		vgacon_scrollback_cur->cnt++;
> -		p += c->vc_size_row;
> -		vgacon_scrollback_cur->tail += c->vc_size_row;
> +		p += size;
> +		vgacon_scrollback_cur->tail += size;
>  
>  		if (vgacon_scrollback_cur->tail >= vgacon_scrollback_cur->size)
>  			vgacon_scrollback_cur->tail = 0;
> 

thanks,
-- 
js
suse labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
