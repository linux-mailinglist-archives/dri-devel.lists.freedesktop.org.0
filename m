Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB76C3F4097
	for <lists+dri-devel@lfdr.de>; Sun, 22 Aug 2021 18:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0791789D87;
	Sun, 22 Aug 2021 16:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A03589D87
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 16:50:35 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so29444146otf.6
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 09:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dtfidEe/qjxfHjRkhW97hyLbAhf+ZJVGWplTJWO3Pbs=;
 b=KUQ1Wd1A9uHMPtRYx40LKABn7voa02Y4leoq1TyTTpx+BBE1w/r1SsSTOIUgCT4xfr
 oGJeHu5D3NKbu0d+8lZPwpu82/jyg8bA5oOOPJc+3h3eqD/tm+u+bfsB0MVHDBtL1LXy
 QLAGHfOtjkqC9xyeHfDXqtqW8CfEM4VOleO7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dtfidEe/qjxfHjRkhW97hyLbAhf+ZJVGWplTJWO3Pbs=;
 b=FILvoR6w3EmZnsFCrfrcB2YX/WhwHtEWFXOH1aX+yAGVjQ6ACaoWrBewPCv4HJZtxz
 6vi5ZjYpsVZOuUxDl3FmmPm+ImfpqXGV/YaYL2ycGCIlBOAGh2BC6pP1d/WO9ifjEja2
 9pfY1espKFTbGPCxuhLVDmWLOxmiL6TzxGE+hYwPuswmqf+2WunbgqjOdq0pNJxcbXAB
 22jPfZdxiSWo51HzcUBMGV8/VYRwwCpLQagoCBVybYFA5ZgTMef/PM0uSt7NXd8QwNpC
 mMfqGydX2clyVGcO2M7n1H9d2Ro670qaOWaPzxlhUjHEqaZpRGeKtE9Xxp9021Y64MQ1
 Km3Q==
X-Gm-Message-State: AOAM533+pxrou3+PDQJr1Km8vQeAUS/vHJG+OHZY/8SI9TRRYmj7w0mG
 KSyr9O3htOTtz4S2LB7P/m4PA5HWutlKkmVM3wMmxQ==
X-Google-Smtp-Source: ABdhPJzsqYUkGnoKx6cZL/MZd0xVLARgQAiHA36o4mNFCThs4ItbOa2X5Lm6FYKo4igPkf8VSlPht+LiVtxMvPa5diM=
X-Received: by 2002:a05:6808:1449:: with SMTP id
 x9mr9094210oiv.14.1629651034674; 
 Sun, 22 Aug 2021 09:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
In-Reply-To: <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 22 Aug 2021 18:50:23 +0200
Message-ID: <CAKMK7uFW3Z=Up=OCJO4dNR9ffaTdFjHwoND9CrUw6LHmQ4t_AQ@mail.gmail.com>
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 George Sun <george.sun@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 18, 2021 at 4:12 PM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> +danvet
>
> Hi,
>
> On Tue, 10 Aug 2021 at 23:58, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> >
> > This series adds support for multi hardware decode into mtk-vcodec, by first
> > adding component framework to manage each hardware information: interrupt,
> > clock, register bases and power. Secondly add core thread to deal with core
> > hardware message, at the same time, add msg queue for different hardware
> > share messages. Lastly, the architecture of different specs are not the same,
> > using specs type to separate them.
> >
>
> I don't think it's a good idea to introduce the component API in the
> media subsystem. It doesn't seem to be maintained, IRC there's not even
> a maintainer for it, and it has some issues that were never addressed.

Defacto dri-devel folks are maintainer component.c, but also I'm not
aware of anything missing there?

There has been discussions that in various drm subsystems like
drm_bridge or drm_panel a few things are missing, which prevent
drivers from moving _away_ from component.c to the more specific
solutions for panel/bridges. But nothing that's preventing them from
using component.c itself.

I'm happy to merge a MAINTAINERS patch to clarify the situation if
that's needed.
-Daniel

> It would be really important to avoid it. Is it really needed in the
> first place?
>
> Thanks,
> Ezequiel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
