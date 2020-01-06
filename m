Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDD91320E8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B226B898A3;
	Tue,  7 Jan 2020 08:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EFC6E4F3
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 18:06:35 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y11so50694098wrt.6
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 10:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iTe9+RLNffHu/ad7NEHFKxDU/IzNOBu2mtFXYASMjmc=;
 b=IkpA3yisnjqni9PK0f42tCjPmWvEPZAsF/3Ju3W9vAfJJXZQlcfKEaMHZG/oZRj5y1
 V7otnP8Qhap2YC7dDs67F0hsJ8968bWZh2kcff/7KoMM3m/9Wd3uHP3PjGvoYHhzjn6r
 j1jlgbMhfWvNozAkrQw4Cw0h+Hr7qmMnUWS9pEh88dDH24ioXDcrPNbuF8UTdRCBtRtU
 S+3R1KTRZ/i3OJWCKmlsy1wRNEsjcZan8vZWtNtpXBFCRMpuT4SmuVctpaFL5QNdmNdM
 v1b7rZgfxwZE0VBAUzPur6DZK90yorDY7Mi0O28GpdWiwYvI0YDHL1XtDdY3OkRczfh5
 04Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=iTe9+RLNffHu/ad7NEHFKxDU/IzNOBu2mtFXYASMjmc=;
 b=mDfsUXsdsYwCHis7ILU9AsbOLrDvDfI8z47ZDScm4iu4+F2mWjSNQ9Fg9/OHd/emi+
 YbNZySjZmJ5VuTrV8bBcelpdLQThqpdRk2R0MliHSe6r+qr9+3afg0hUvKJhs+rE85fU
 mk3Qx4IVGiD/++UV47WWbY2L/Qi2Wgs0FaUw6HM+MR036OEUJqstIN9KAlKBcEw8kkek
 8bDM/MzgxKAi8TCnYGfh63+xhF5CXPcHNmsxNDc3UmL+XSLUx5rcIxKyw6lzLIgzcISD
 5reG94BOSf52Hp2oMRR4RzYKPbFU4Wi+/J27pygTpeRuTHZqETrkWBzA74Y5KcutBOWl
 xNpQ==
X-Gm-Message-State: APjAAAVwyCXmtSfKyiO9gOubMqeojF8VnBQAGHbNqcipuDMenDrbg2o9
 aA1IrXXtjoG1CGiOL+HwmHY=
X-Google-Smtp-Source: APXvYqyYInOLcOk9eja/GXjbS6IeZS8kEy4iVcWk43HrE2Bm1HGMym4qCJ+kRdQnetfCSe9aWKwZBA==
X-Received: by 2002:a5d:690e:: with SMTP id t14mr103319848wru.65.1578333994339; 
 Mon, 06 Jan 2020 10:06:34 -0800 (PST)
Received: from chinchilla ([2001:981:5f7c:1:6ea:56ff:fe7e:c6b0])
 by smtp.gmail.com with ESMTPSA id q3sm23723806wmc.47.2020.01.06.10.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 10:06:33 -0800 (PST)
Date: Mon, 6 Jan 2020 19:06:31 +0100
From: Matthijs van Duin <matthijsvanduin@gmail.com>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] drm/omap: gem: Fix tearing with BO_TILED
Message-ID: <20200106180631.GA30670@chinchilla>
Mail-Followup-To: Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org,
 "H . Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>
References: <20191221005711.47314-1-tony@atomide.com>
 <20191221164141.GI35479@atomide.com>
 <20200104050950.GA11429@chinchilla>
 <20200104055011.GA5885@atomide.com>
 <20200105203704.GD5885@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200105203704.GD5885@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 07 Jan 2020 08:05:10 +0000
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
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 05, 2020 at 12:37:04PM -0800, Tony Lindgren wrote:
> - Linux use of tiler aligned to 128 bytes

which is presumably a simplification of the alignment imposed by hardware:
-  64 bytes (64 pixels) for 8bpp
- 128 bytes (64 pixels) for 16bpp
- 128 bytes (32 pixels) for 32bpp


> - Fast userspace mapping aligned to 4096 bytes

Also for kernel mapping (vmap), e.g. for supporting a rotated fbdev


> 2. The alignment need may need to be configured by the tiler consumer

I guess omap_gem_pin should check for the alignment requirement by
iterating over all dma_buf attachments and intersecting their
attach->dev->dma_parms.segment_boundary_mask or something like that?
Since I feel like this is something more dma_buf exporters presumably
need, is there no existing utility function for this?


Of course in principle it ought to be possible (modulo bugs and API
restrictions) to use buffers that aren't aligned to MMU page size if
either

a. hardware is trusted to not read or touch data from unrelated buffers
that share MMU pages, or

b. buffers are only permitted to share MMU pages if they belong to the
same security context (though this is something that could also be done
in userspace: e.g. instead of allocating three separate 720-pixel wide
buffers, each one page per line, allocate one buffer that's 720*3 pixels
wide (2 pages per line) and use three slices thereof).


> - SGX use of tiler aligned to 4096 bytes (or 512 bytes?)
> 
> ...
> 
> 3. The alignment need for SGX seems to be based on SGX MMU page size

which is 4096 bytes apparently:

#define SGX_MMU_PAGE_SHIFT	(12)
#define SGX_MMU_PAGE_SIZE	(1U<<SGX_MMU_PAGE_SHIFT)

or rather, this is the smallest page size it supports:
#define SGX_MMU_PDE_PAGE_SIZE_4K	(0x00000000U)
#define SGX_MMU_PDE_PAGE_SIZE_16K	(0x00000002U)
#define SGX_MMU_PDE_PAGE_SIZE_64K	(0x00000004U)
#define SGX_MMU_PDE_PAGE_SIZE_256K	(0x00000006U)
#define SGX_MMU_PDE_PAGE_SIZE_1M	(0x00000008U)
#define SGX_MMU_PDE_PAGE_SIZE_4M	(0x0000000AU)
#define SGX_MMU_PDE_PAGE_SIZE_MASK	(0x0000000EU)


> 4. The issue I'm seeing with stellarium on droid4 may be a stride
>    issue as about one out of 3 or 4 frames is OK and aligning to
>    512 also fixes the issue maybe because it happens to make
>    multiple frames align to 4096

Yeah if your buffers are 960 pixels wide (assuming the droid4's screen
is natively portrait) and 32bpp then 512-byte alignment suffices to
automatically make them 4KB alignment.

The most obvious thing I can think of that could do wrong is that it
might contiguously map the pages that cover each line, which is what
will happen if they use e.g. for_each_sg_page, but subsequently assume
that the stride in sgx virtual memory is ALIGN( width * cpp, PAGE_SIZE )
without taking the offset of the buffer inside the mapping into account.

If each line is at most 4KB (i.e. 1024 pixels @ 32bpp) but each line
straddles an MMU page boundary, then the result would be that the even
lines of the frame are written to the top half of the buffer, causing it
to be scaled to 50% vertically, while the odd lines are "lost" (written
outside the buffer, either to a different buffer or unmapped tiler
memory).  This sounds like what you described on irc?


Matthijs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
