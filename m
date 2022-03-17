Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8924DC06D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 08:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08EF10EE55;
	Thu, 17 Mar 2022 07:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883BC10EE53
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 07:47:39 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id 10so3725269qtz.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 00:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q83mXmOYdFBsuZJvBaUcgIbjkShWpffcywKnXCVB7/E=;
 b=vOpcS8uRMA3vbIfPjz5gpMLCbklwvbPRZ+PjmlstH51l/kc3d8Q+lA9AFxc0bKRYOv
 +2owA8fSKuVicjnr4rBVszpJjVeI+1QJ8BIAGhJu7bVHf665NW/tRwwGSOWyyDxkWD7S
 Zlappz64H4O/NfWLV+rwjuXVL4DaZ7SrIn+W0PwALw8je9Xbm5l2onXtBwNAG5FAG2aG
 O/dCNwYUoFB3/FA57U27A1SbBbduLk9n8GGhbeZSpK4qrDCIHiPF8DX0Z6ou/+YBVkfi
 XZMgJSCO4O67BVXaAQC1l8KPtdubutazorNhxaLbk1DJ+oE1j9Nplr/nXw41r5InLf8m
 KO+g==
X-Gm-Message-State: AOAM533lFWqI2GMpnN7As8n4ZP+P0jmXhTvX2q3cXVgkR3nEPJa3n72c
 e88St6pnpwDPsIpOmf6escpLmPVxScAVPg==
X-Google-Smtp-Source: ABdhPJymLSblhDT7y7hNG8tvTtpKnb1jLwGpseR1DKYB7beI16tX5/jkLS2k4HSLFXwZhJDbQqnxtA==
X-Received: by 2002:ac8:5e51:0:b0:2e1:cd1f:d2e6 with SMTP id
 i17-20020ac85e51000000b002e1cd1fd2e6mr2647525qtx.658.1647503258178; 
 Thu, 17 Mar 2022 00:47:38 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 q8-20020a05622a030800b002e1c9304db8sm3015869qtw.38.2022.03.17.00.47.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 00:47:37 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id v130so8636730ybe.13
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 00:47:37 -0700 (PDT)
X-Received: by 2002:a25:aa0e:0:b0:633:7c3b:94a0 with SMTP id
 s14-20020a25aa0e000000b006337c3b94a0mr4045552ybi.546.1647503257248; Thu, 17
 Mar 2022 00:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220317054602.28846-1-chuansheng.liu@intel.com>
In-Reply-To: <20220317054602.28846-1-chuansheng.liu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Mar 2022 08:47:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWH83xCn-OUmBArM-H0AG20CzzqmAsb5MFU9ufqFZQArA@mail.gmail.com>
Message-ID: <CAMuHMdWH83xCn-OUmBArM-H0AG20CzzqmAsb5MFU9ufqFZQArA@mail.gmail.com>
Subject: Re: [PATCH] fbdev: defio: fix the pagelist corruption
To: Chuansheng Liu <chuansheng.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Helge Deller <deller@gmx.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, jayalk@intworks.biz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chuansheng,

On Thu, Mar 17, 2022 at 7:17 AM Chuansheng Liu <chuansheng.liu@intel.com> wrote:
> Easily hit the below list corruption:
> ==
> list_add corruption. prev->next should be next (ffffffffc0ceb090), but
> was ffffec604507edc8. (prev=ffffec604507edc8).
> WARNING: CPU: 65 PID: 3959 at lib/list_debug.c:26
> __list_add_valid+0x53/0x80
> CPU: 65 PID: 3959 Comm: fbdev Tainted: G     U
> RIP: 0010:__list_add_valid+0x53/0x80
> Call Trace:
>  <TASK>
>  fb_deferred_io_mkwrite+0xea/0x150
>  do_page_mkwrite+0x57/0xc0
>  do_wp_page+0x278/0x2f0
>  __handle_mm_fault+0xdc2/0x1590
>  handle_mm_fault+0xdd/0x2c0
>  do_user_addr_fault+0x1d3/0x650
>  exc_page_fault+0x77/0x180
>  ? asm_exc_page_fault+0x8/0x30
>  asm_exc_page_fault+0x1e/0x30
> RIP: 0033:0x7fd98fc8fad1
> ==
>
> Figure out the race happens when one process is adding &page->lru into
> the pagelist tail in fb_deferred_io_mkwrite(), another process is
> re-initializing the same &page->lru in fb_deferred_io_fault(), which is
> not protected by the lock.
>
> This fix is to init all the page lists one time during initialization,
> it not only fixes the list corruption, but also avoids INIT_LIST_HEAD()
> redundantly.
>
> Fixes: 105a940416fc ("fbdev/defio: Early-out if page is already
> enlisted")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>

Thanks for your patch!

> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -220,6 +219,8 @@ static void fb_deferred_io_work(struct work_struct *work)
>  void fb_deferred_io_init(struct fb_info *info)
>  {
>         struct fb_deferred_io *fbdefio = info->fbdefio;
> +       struct page *page;
> +       int i;

unsigned int i;

>         BUG_ON(!fbdefio);
>         mutex_init(&fbdefio->lock);
> @@ -227,6 +228,12 @@ void fb_deferred_io_init(struct fb_info *info)
>         INIT_LIST_HEAD(&fbdefio->pagelist);
>         if (fbdefio->delay == 0) /* set a default of 1 s */
>                 fbdefio->delay = HZ;
> +
> +       /* initialize all the page lists one time */
> +       for (i = 0; i < info->fix.smem_len; i += PAGE_SIZE) {
> +               page = fb_deferred_io_page(info, i);
> +               INIT_LIST_HEAD(&page->lru);
> +       }
>  }
>  EXPORT_SYMBOL_GPL(fb_deferred_io_init);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
