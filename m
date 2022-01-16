Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1624903EF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 09:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC6389BAE;
	Mon, 17 Jan 2022 08:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD2810F841
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 16:29:02 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id 30so55349604edv.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 08:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BcPCNdgGsarAOPIhv+DH/SRgqXOeYGiUXIB78zv1eaQ=;
 b=ZCpe5OGk6TJ9Gqk6evznoypIQpHpZAY9/N3Yc08tkEK3QnTVpE+wrHSxNCblRUJkjW
 ZYFuY2qtnOz98so9HanQsnNQXQsZ+AML0CUuTTnE6RA7TKZVUTHq95fE4lWUodARr+xx
 smCnOrm7nnErM2ZdfvDwUF+fTaN6om7v0q8nHeOQse02y0Jlu4Qwxo4P+u7fU4XN2hDv
 czdvqsL6Fodxug1ExAVj4DlJz/EleVDxpsYo90Ab9wbdtriyP8xaKxoSZvkcN0xtATpZ
 lER5nFrPSdHv9fibxyCRRWa4FuD2niOdqOHLnrqMCNPmTBxeP2AITDaFv6pQ+8gM+JED
 hhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BcPCNdgGsarAOPIhv+DH/SRgqXOeYGiUXIB78zv1eaQ=;
 b=z0fU3JLlcYO65o66PaupWQGR8HrYl+YfxsIIFEM/8zmRWiVLp55q/lPUYYq264KYQ7
 0pTrx6S+pEGChnEaE5oostFHklYh4xzwrq17IodJWYUlgzAQQ9JQjY3PMqtFWVL0ZyfC
 zMg+A8uCU1JOe+1KnMpqxedMVL+x4hsttd3afcdFWwF5HNuFEoniR4BSREtChhdYn2gF
 hnAdulguKgRCMaRbA2rexXAleglJwuT3Ev2gx4z5LZjZHc/r6hqfGp8RaDHOJC4RYABU
 49wPCgw2DqYxrOiObdX1z+cdzzNWNxgilYvyeQs/g0P/EzdNq1neHh1YBKXDmi7rH92F
 Gtyg==
X-Gm-Message-State: AOAM533qH1cbrsdlxl7d6ZIy+5pNkFZgHeGCA5nMpOsx+d/w9UY4Uapx
 ZfhZ5jk+Q51G5llTDOdfKVc=
X-Google-Smtp-Source: ABdhPJxgBgqDQjhW2WA9dKL/J8VRTg0NrW/N0blkBgpvvjch1NxO7ivZpEkb6Q5hcicV/0tGkuhQiA==
X-Received: by 2002:a17:906:4c87:: with SMTP id
 q7mr15069370eju.460.1642350541377; 
 Sun, 16 Jan 2022 08:29:01 -0800 (PST)
Received: from tom-desktop (net-93-71-218-227.cust.vodafonedsl.it.
 [93.71.218.227])
 by smtp.gmail.com with ESMTPSA id ja23sm1352637ejc.32.2022.01.16.08.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 08:29:00 -0800 (PST)
Date: Sun, 16 Jan 2022 17:28:58 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] drm/i2c/tda998x: Switch to atomic operations
Message-ID: <20220116162858.GA2454@tom-desktop>
References: <20211231013930.139754-1-festevam@gmail.com>
 <YdLifIoB8eClztlG@pendragon.ideasonboard.com>
 <CAOMZO5DVzvPXs2-0Vzsunh=OZ0qhyMhSKyPTKQ+mGXfF8G8Rtw@mail.gmail.com>
 <20220108191658.GC2633@tom-desktop>
 <CAOMZO5Db9WuFTckQ=ngT32Q5EgOFf9_T+duuT1nzemWRTSwoQA@mail.gmail.com>
 <20220111202151.GB4503@tom-desktop>
 <20220115232306.GA30488@tom-desktop>
 <CAOMZO5AKLQuvh5_ZL9vYCp_1MijGmGdj+vxfofRsCN=d2v+rKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5AKLQuvh5_ZL9vYCp_1MijGmGdj+vxfofRsCN=d2v+rKw@mail.gmail.com>
X-Mailman-Approved-At: Mon, 17 Jan 2022 08:34:35 +0000
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
Cc: Marek Vasut <marex@denx.de>, Peter Robinson <pbrobinson@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 16, 2022 at 10:27:19AM -0300, Fabio Estevam wrote:
> Hi Tommaso,
> 
> On Sat, Jan 15, 2022 at 8:23 PM Tommaso Merciai <tomm.merciai@gmail.com> wrote:
> 
> > Hi Fabio,
> > I'm working on bring up urt,umsh-8596md-20t lvds kit panel, but after enable
> > following node I get the following error:
> 
> I assume you are trying to connect an external panel via connector CN3.

Hi Fabio,
Right.

> 
> This connector is for LVDS panel, not parallel.

Yep, for that I try also urt,umsh-8596md-19t without success.

> 
> The eLCDIF parallel interface is connected to the TDA19988.

Thanks for the info.
> 
> Anyway, this is a different topic. My goal here is to fix the kernel
> warning when using the TDA19988 HDMI output.

My bad sorry, I'm looking for a second HDMI Display for try to reproduce
the issue on my side. Meanwhile I'm working on lvds.

Thanks,
Tommaso

> 
> Thanks
