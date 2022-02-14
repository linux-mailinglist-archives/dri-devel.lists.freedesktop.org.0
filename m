Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B26164B4337
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 09:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6988110E143;
	Mon, 14 Feb 2022 08:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6E610E17E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 08:05:45 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id a6so8312424vkc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 00:05:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EuaFh4R/zObETHWYBEmlGLpeIw2W/ozuVWTZLGlRemg=;
 b=nkZmPBdpkq7hLEnoTXZX0T9SQ/PV7/s+1GYFtOYyCDMMoVWqFvl6L6WC9ldZfTmBKM
 gyeVwdTp66TeDh7Zhqdj538jojt6yN3WJ0w1B2nDBxSimJjUT13Cv5Qy2OSeDrvJf7R2
 GBOA2hrVjlzdbEiU6/ZNaI8w6D6CWioD+Q64zLIUT0SAN1T8KqOy8JJIS5apoyadqYH4
 HFf08nCQRYdcp050qPtgaqc53+er9JERcQYSaLJDGpqy6fTAYIO9HgtiDJW8+z7fiAxx
 iy+vbzzBjzixiX4H6qvy9rRvhP48g0AVJaVQeOCNd31TglTSgDXRHoQcgnHgnWp0QhC4
 3MLQ==
X-Gm-Message-State: AOAM530XPT+ma8ocE638NkEmp2Dhw3TMzsYM/1RIE9ruAJ/sgg1WX1UD
 K6cAJUXfCl0q9xiDagG1cumMQ8QHb9AtBw==
X-Google-Smtp-Source: ABdhPJynfucHxeU5VY3AqTkZgUbWu4eZ2ZO1vyRbylAraZVboXtrXM8n0hoB8y401r/G2ehVMdQ78Q==
X-Received: by 2002:ac5:c20e:: with SMTP id m14mr3474801vkk.0.1644825943676;
 Mon, 14 Feb 2022 00:05:43 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45])
 by smtp.gmail.com with ESMTPSA id b191sm5441514vkb.32.2022.02.14.00.05.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 00:05:43 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id m24so17789490vsp.7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 00:05:42 -0800 (PST)
X-Received: by 2002:a05:6102:440d:: with SMTP id
 df13mr877893vsb.5.1644825942770; 
 Mon, 14 Feb 2022 00:05:42 -0800 (PST)
MIME-Version: 1.0
References: <20220210141111.5231-1-tzimmermann@suse.de>
 <20220210141111.5231-3-tzimmermann@suse.de>
In-Reply-To: <20220210141111.5231-3-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Feb 2022 09:05:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVb1JjZkEo-PM6DTXOywcmJDRr0a=Ci94DJCj7dXbbihw@mail.gmail.com>
Message-ID: <CAMuHMdVb1JjZkEo-PM6DTXOywcmJDRr0a=Ci94DJCj7dXbbihw@mail.gmail.com>
Subject: Re: [PATCH 2/2] fbdev: Don't sort deferred-I/O pages by default
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, linux-staging@lists.linux.dev,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, bernie@plugable.com,
 noralf@tronnes.org, andriy.shevchenko@linux.intel.com, jayalk@intworks.biz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Feb 10, 2022 at 4:24 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Fbdev's deferred I/O sorts all dirty pages by default, which incurs a
> significant overhead. Make the sorting step optional and update the few
> drivers that require it. Use a FIFO list by default.
>
> Sorting pages by memory offset for deferred I/O performs an implicit
> bubble-sort step on the list of dirty pages. The algorithm goes through
> the list of dirty pages and inserts each new page according to its
> index field. Even worse, list traversal always starts at the first
> entry. As video memory is most likely updated scanline by scanline, the
> algorithm traverses through the complete list for each updated page.
>
> For example, with 1024x768x32bpp a page covers exactly one scanline.
> Writing a single screen update from top to bottom requires updating
> 768 pages. With an average list length of 384 entries, a screen update
> creates (768 * 384 =) 294912 compare operation.

What about using folios?
If consecutive pages are merged into a single entry, there's much less
(or nothing in the example above) to sort.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
