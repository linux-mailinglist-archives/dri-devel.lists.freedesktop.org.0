Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A161E6DC8
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 23:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4341189B27;
	Thu, 28 May 2020 21:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70616892EF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 21:37:50 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id k3so315790vsg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 14:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6EBXP08UfA+20wnVaOt/Z0KcauZvdNBVCxlQRkCKiaE=;
 b=hQE6rkU9ZVc2K3wj2lHCfZ6PCW6mEVrt6pyiaSDGWcBIMcQg9CeU1m6QiV/RMjl/FO
 QW+xgDshAs1RIO/5kskBlpD5CGQInHMf4OK055PDNSV+BHB9yk9TxBI+8Xml915AGrxN
 CRVyAjb8Q9DR9q6ppylctJsVaX7mnSK1Ql2rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6EBXP08UfA+20wnVaOt/Z0KcauZvdNBVCxlQRkCKiaE=;
 b=dJZu2sgeNbM/XYGSiBjmj9Tk71bo+71vxDoxR5KegJmL2EDZSrce7yaWI2uN1hulcL
 WoCHx72U7xgOxrcRyNjzdlcdKld1HHapAVuGiY4yzQqmW8lUhobW+h/M805HHCWqo7EM
 MP+dDJjKV1HYiYKcq4vW14IttD3QTG9o/hlEemaqTWLyYO/Zg7Ulw3iR7OO/7m+e8Gfc
 EL/NNqQLBqPj4m/0TmjXQeVq/kSpe/usIkrxy0WjFvrzjABytGenzuS0nYoLhTvEO/wC
 tvYOLw9nf6at2G02HuoqSSlg07BqvsgrGTv8fWNsZJ0yfoUzEYoSQDqqjAB6iNQS2qSM
 gD0A==
X-Gm-Message-State: AOAM532sb2lzztdoD2QQiuHMtMmNOFcrL6AsK0NprGXqphLgo1D/81TN
 gjbTN1nmPM0qFQv2v9q2f3B74Uy7M3M=
X-Google-Smtp-Source: ABdhPJxBvWarUrdeCX9xXjXQxLYQ3/BIjuJQ5tMozVsy0DGTUbyXq7L21SX1Wrfm8AJtsSP4xlKCwQ==
X-Received: by 2002:a67:b149:: with SMTP id z9mr3134508vsl.85.1590701869396;
 Thu, 28 May 2020 14:37:49 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53])
 by smtp.gmail.com with ESMTPSA id i23sm667527vso.33.2020.05.28.14.37.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2020 14:37:48 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id e48so55777uad.11
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 14:37:48 -0700 (PDT)
X-Received: by 2002:ab0:1684:: with SMTP id e4mr3531314uaf.22.1590701867624;
 Thu, 28 May 2020 14:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200422090443.12529-1-harigovi@codeaurora.org>
 <158931520588.215346.14524550377627605126@swboyd.mtv.corp.google.com>
In-Reply-To: <158931520588.215346.14524550377627605126@swboyd.mtv.corp.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 28 May 2020 14:37:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLNuG7ZGN_yRe9zN3fahBKhevjkJDBTh7G4kozKvnDnQ@mail.gmail.com>
Message-ID: <CAD=FV=VLNuG7ZGN_yRe9zN3fahBKhevjkJDBTh7G4kozKvnDnQ@mail.gmail.com>
Subject: Re: [v1] drm/bridge: ensure bridge suspend happens during PM sleep
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Harigovindan P <harigovi@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 12, 2020 at 1:26 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> The subject is not specific enough. I'd expect it to be something like:
>
> drm/bridge: ti-sn65dsi86: ensure bridge suspend happens during PM sleep
>
> Quoting Harigovindan P (2020-04-22 02:04:43)
> > ti-sn65dsi86 bridge is enumerated as a runtime device.
> >
> > Adding sleep ops to force runtime_suspend when PM suspend is
> > requested on the device.
> >
> > This change needs to be taken along with the series:
> > https://patchwork.kernel.org/patch/11494309/
>
> Why? It doesn't seem like it should be required to go along with a qcom
> specific driver patch.
>
> >
> > Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> > ---
>
> Besides the subject:
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Are you planning to re-post with the changes Stephen requested?  Maybe
CC Sam too who was nice enough to help land some of my recent changes
to this driver.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
