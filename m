Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8206C2654
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 01:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5407810E6B2;
	Tue, 21 Mar 2023 00:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFFD10E094
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 00:30:15 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id t5so16770856edd.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 17:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679358613;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1L2oe1r8JgTN5YL92wCuhOt6PpbfOoKr1M6Dp+nn0t4=;
 b=MQiviXW6ZpQi8IML644U4vlCOS0t332+U9QrSkFYtoGeba6CDQ45QQkggq7hlSp5hS
 PbxDNRWg3a21sZtwhBcebgC/6Sm/+UjEJQm1+L1g7dhqn+DxafEy/85NEcDGQ7sN/0pc
 ehhoebZDyYauEUQNq18CZJr69hAqXMlOHzWPBltqVwItl5duz9IN5+K02ehBOt7Hs/0V
 o5QpetfPT/83qLaSAS5KbpzhYvyOaGyA7p5irTFVBZSfMliITOC/7RxphYjYV05zL6jT
 K92MpQkGp9Y0TlqKxz4kr51UHMHrJZpm7P6VTEbfSRzh1Q599rjYhSPPQ8Pr0Yq/CN4O
 4LvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679358613;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1L2oe1r8JgTN5YL92wCuhOt6PpbfOoKr1M6Dp+nn0t4=;
 b=ugup3NKCxOL3Wk7Qbt6PecdfK1XYXWbsjeUX9NDAvuFdD69ojhPHtL8ptegkRMjEaO
 UdE9x2KZ5U5IUAooYV5kmwe2rAfAqcxc2HaZw7WHcupjwg3B314TFhi/qpVDsjkelQRo
 m3FlfNIxa6Yj+dAQlO9qHMw0aXLccVgUTO5Vf9HodGQ/brnykz9uKLaAp+H4ECTzKRoE
 5P5huzFIV8nLVeVvsYRkzOkZQh66V6riA3ANgQhVoM3p1QIyUa6vtGFbfRXm0ImE+MTZ
 fKs6dLIpGpiCxFbkOG3O7iayvu5i9mVwFAAfv5ND44Ehm/tgUMv+KGU4M4TxSqOd2X2N
 fygw==
X-Gm-Message-State: AO0yUKXZP6WusQdqklXpj2FQcVeG59iS2JCjSXxyEqbvZR+vrL26puqV
 MhN4pxH1YVqgDV8DVeVfyMZ/zWcc/gkj/xZevuU=
X-Google-Smtp-Source: AK7set/T8oFjSY2YgFlhh3dfaFrjVDqPbYWOQzNU1by41lfg3Uxnp0BTQLsCutiUXyfK/umj0VcJdk49Vjt08UHZrts=
X-Received: by 2002:a50:a451:0:b0:4fb:c8e3:1adb with SMTP id
 v17-20020a50a451000000b004fbc8e31adbmr713839edb.3.1679358613263; Mon, 20 Mar
 2023 17:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230314211445.1363828-1-zack@kde.org>
 <98e9cc9a-6986-4425-3906-03dce337a0df@gmail.com>
 <CAPM=9tyLPQ2SEGbsHXJcpDxW3AXY7sA0wDcG+5szQQqRf3swZA@mail.gmail.com>
 <33b225168ec2bb1393f2405d76b8acfe685aedd5.camel@vmware.com>
In-Reply-To: <33b225168ec2bb1393f2405d76b8acfe685aedd5.camel@vmware.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 21 Mar 2023 10:30:01 +1000
Message-ID: <CAPM=9twds+beukp1+97AeYHWmj3cEdYBUtyNat5k7=QBLoC0aw@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix src/dst_pitch confusion
To: Zack Rusin <zackr@vmware.com>
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
Cc: "martinkrastev768@gmail.com" <martinkrastev768@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Mar 2023 at 09:42, Zack Rusin <zackr@vmware.com> wrote:
>
> On Tue, 2023-03-21 at 08:46 +1000, Dave Airlie wrote:
> > !! External Email
> >
> > On Thu, 16 Mar 2023 at 01:25, Martin Krastev (VMware)
> > <martinkrastev768@gmail.com> wrote:
> > >
> > > From: Martin Krastev <krastevm@vmware.com>
> > >
> > > We reviewers botched that one.
> > >
> > > Reviewed-by: Martin Krastev <krastevm@vmware.com>
> >
> > Can someone land this into drm-misc-next please so I can start
> > building with clang again?
>
> It landed there 5 days ago:
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=328839ff93709a517e89ba1de1132c5d138e5dcb

Oops, I just pulled a tree without it so made bad assumption, sorry for noise!

Dave.
