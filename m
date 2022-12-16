Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD33F64EBDB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 14:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B1310E5D0;
	Fri, 16 Dec 2022 13:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8D110E5D5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 13:06:00 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id cg5so2547234qtb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 05:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jXF9c7i/pRZwb/zK4b3gP0kYwDE/+CkuRpF8ttFbdN4=;
 b=Z7BvKvXQyWULdV9IzoMxb9ID3Ugu4G+zbh+dgucsIq4EsXjwk6mwZkBxA4gROShi+r
 MInwwBnubtqCr5N0gwy/8FQWso2x0Qe8omHtlb41/IpjFXCIIF08C6/Xh7zrgOD/sz7M
 OjHKZTNKNyB13Qj7qJjXxJyyu2DibPrVL8eR/SXn/APVcwO7m4JV6mJQh1vMkgA3ZbPi
 ElV539UYV4Z/vBrwObbeTNSZQ0oxW7drBqy/tZWxC/Lj3Tiec6Bls6NWA2q72RQh+a0J
 0gs+o7+2RTONalTtksyTjOl9A56Iv8V/x4ANOn55wQWSfG4CGPyVNw4eN0ChxwajNN49
 de1Q==
X-Gm-Message-State: ANoB5pn+QHcoLT+VIYz8dYaP/MoBWhbKUSPTEVRHpmLNclU77yi9H+3U
 ylXVbinqiQHXh3NqYWMVJVbf8DGHcqI4pg==
X-Google-Smtp-Source: AA0mqf6F+6bN0/2ynVzZU7DvcHggO0fHJbKhdEoCHss+Opzcw9RX4rZVPg08wgayQoPs4BJ20gQ2xw==
X-Received: by 2002:a05:622a:4c0f:b0:3a5:7a30:bd22 with SMTP id
 ey15-20020a05622a4c0f00b003a57a30bd22mr44644446qtb.53.1671195959104; 
 Fri, 16 Dec 2022 05:05:59 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 j8-20020ac86648000000b0039467aadeb8sm1289484qtp.13.2022.12.16.05.05.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 05:05:58 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-3b5d9050e48so32094977b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 05:05:58 -0800 (PST)
X-Received: by 2002:a0d:dd4b:0:b0:370:61f5:b19e with SMTP id
 g72-20020a0ddd4b000000b0037061f5b19emr28600389ywe.316.1671195958287; Fri, 16
 Dec 2022 05:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20221215170234.2515030-1-arnd@kernel.org>
In-Reply-To: <20221215170234.2515030-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Dec 2022 14:05:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZX9_c7Wvpbu2E9JSm4eoh6S4U+aNfPQ-kk0zyEQdj7A@mail.gmail.com>
Message-ID: <CAMuHMdWZX9_c7Wvpbu2E9JSm4eoh6S4U+aNfPQ-kk0zyEQdj7A@mail.gmail.com>
Subject: Re: [PATCH] fbdev: omapfb: avoid stack overflow warning
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 Zhang Qilong <zhangqilong3@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Thu, Dec 15, 2022 at 6:05 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The dsi_irq_stats structure is a little too big to fit on the
> stack of a 32-bit task, depending on the specific gcc options:
>
> fbdev/omap2/omapfb/dss/dsi.c: In function 'dsi_dump_dsidev_irqs':
> fbdev/omap2/omapfb/dss/dsi.c:1621:1: error: the frame size of 1064 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
>
> Since this is only a debugfs file, performance is not critical,
> so just dynamically allocate it, and print an error message
> in there in place of a failure code when the allocation fails.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> @@ -1536,22 +1536,28 @@ static void dsi_dump_dsidev_irqs(struct platform_device *dsidev,
>  {
>         struct dsi_data *dsi = dsi_get_dsidrv_data(dsidev);
>         unsigned long flags;
> -       struct dsi_irq_stats stats;
> +       struct dsi_irq_stats *stats;
> +
> +       stats = kzalloc(sizeof(*stats), GFP_KERNEL);
> +       if (!stats) {
> +               seq_printf(s, "out of memory\n");

I guess this is futile?
No need to increase kernel size for OOM messages.

> +               return;
> +       }
>
>         spin_lock_irqsave(&dsi->irq_stats_lock, flags);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
