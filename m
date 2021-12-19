Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFBF47A16A
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 17:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA6912BFAC;
	Sun, 19 Dec 2021 16:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DC712BFA9
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 16:41:27 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id j6so8256179edw.12
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 08:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zjxQWD/r6t/DCN45F9Bg/v/DEmb6oJTw6IHZYeDe120=;
 b=f4wA/tu1JEP7AXCRq3JgPbgtpHfluF1OHSLByWLF4RrpfQA5ndVzsRn2hmiYASQ/Ga
 mqd4pscSjagIs1EgeVqieacKPwQwGOy0kPPeX/1jH2nzcbjfnGf9GPsIYC65d9qvttVG
 LOP3Ef8FEZ3VradIVEvGhYqHg50Bw8zxWfJFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zjxQWD/r6t/DCN45F9Bg/v/DEmb6oJTw6IHZYeDe120=;
 b=H6uOYYUhyj1VRuSPWAFj5tSW2ZvqFSM+SKk1sFM7fr+s/oZdIt8vP7RGn/FZI+r+3p
 32EzlgF18/DokAclEbBfr5DFCRhmxJBvzZSmZODHq221pfErE1Dj53tviVCRUVSgudio
 wWvP9GWgqqbAOfPBgm3raadAEw82Yj1J0ru/Bx7E4Sc72AT7rjdznehoN0zRbggR3V6n
 a1QN+8RYRbHuCqJi5RR+6DvxhPol1Ka4jhMO8RZkcqIHAq7s2d8HOJHn9IBX8oRuOj9C
 UjBaHuQRzzijs6vIb9PKjypQrX1DXA5dcN/ChDhT+4v3l5qRtUrwBCBgUkhSfZhyoV5v
 gv+w==
X-Gm-Message-State: AOAM533zEt4AbciDBCqLOg8ww8dY4iJljpdzHD74IkUkdpdEUh0Q0oMq
 MnrzIoiCKt0wImdwcx/Ki6x1pVI54/iiAUEwNFtYRw==
X-Google-Smtp-Source: ABdhPJwPHm2C76/SIpn1W85IG5kH5CUG9YO77XSZ+NX1Fcm8zLfJy1jL2b+L95I+vK0cA/vKGayOqbHHdOpEg8L69qA=
X-Received: by 2002:a17:907:dab:: with SMTP id
 go43mr10560630ejc.537.1639932085635; 
 Sun, 19 Dec 2021 08:41:25 -0800 (PST)
MIME-Version: 1.0
References: <20211119145325.1775046-1-jagan@amarulasolutions.com>
In-Reply-To: <20211119145325.1775046-1-jagan@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 19 Dec 2021 22:11:14 +0530
Message-ID: <CAMty3ZBGeHHWQ9C7mJn7i3i1HFEiqNmTUVe0_3O1uNwCHeFM5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: chipone-icn6211: Switch to atomic
 operations
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
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
Cc: linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 8:23 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Replace atomic version of the pre_enable/enable/post_disable
> operations to continue the transition to the atomic API.
>
> Also added default drm atomic operations for duplicate, destroy
> and reset state API's in order to have smooth transition on
> atomic API's.
>
> Tested on Allwinner R16/R40 DSI.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---

Gentle ping!
