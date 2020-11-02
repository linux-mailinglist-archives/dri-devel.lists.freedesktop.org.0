Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7702A2F87
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 17:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA47A6E55C;
	Mon,  2 Nov 2020 16:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8D36E55C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 16:19:01 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id h26so1566927uan.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 08:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ucUZbGTTJZ2A+pmmh62lxQnSfQrQByyqZCyVaS0GnE=;
 b=nS+eIPFzs8lalHYmoDlSPmIimpnifAzfi+4EBIILxr4b0LU/HWYjA/0P/PZ15lFWF+
 1rpF35AW43xqYxc4dIdl8bDaBRcrGYzgOCOZ1SnUBZVePCe38dZHgiJ+ww7nIZwdVh2v
 2NWHhkzk5YC9dM6gXQvbBQeu7AVVzv8/SoLyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ucUZbGTTJZ2A+pmmh62lxQnSfQrQByyqZCyVaS0GnE=;
 b=WCowPz5SoAo0bVvf8Wu3cnB3EIEzbUWQd7gI5SxcwqJz+iwxR5RTndBhxPd9DoopMW
 0dAQzJELq92g1l+/R7nLsgrWoj/tlmm70vCzbyU3UZDzZiFpxxt1f8HKSWb23YWLOiGk
 fTdORhA8Nrkx28vMTnul6JrWZvWP7yqqt0hR8Tcij4d0TqLQC3mondcHUDh71kgGmril
 PtlBKklimPOY5MfD1gUoI4ayP870476VdxULZX/rGF4+e2AW0DrXDPjTYyFrHyAqTzNs
 YzuofWqS/SgedZpZlszMJKDMHFlmGA6j4vzyx9zWh97manQ9iORlir5ogyFpOLf5YiRE
 Ghpw==
X-Gm-Message-State: AOAM532Cx+vA/K0RGWQSZcOyDhkkTn0+Je0knagv0SH73LWp+stx9CHH
 7fyj77iupYxSSA38OFHQ/TzCjFLduYK9ZA==
X-Google-Smtp-Source: ABdhPJxOpvWDS1tPL0104HZCBfp+CqZAE/M8zVT809XNrfNlOsD/dieQmB8/y0U2XjyIw+xbfabaTg==
X-Received: by 2002:ab0:6156:: with SMTP id w22mr8221325uan.122.1604333939788; 
 Mon, 02 Nov 2020 08:18:59 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51])
 by smtp.gmail.com with ESMTPSA id c21sm1617006vsh.31.2020.11.02.08.18.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 08:18:59 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id f7so1981012vsh.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 08:18:58 -0800 (PST)
X-Received: by 2002:a67:ef98:: with SMTP id r24mr1060059vsp.37.1604333938604; 
 Mon, 02 Nov 2020 08:18:58 -0800 (PST)
MIME-Version: 1.0
References: <20201030011738.2028313-1-swboyd@chromium.org>
 <20201030011738.2028313-2-swboyd@chromium.org>
In-Reply-To: <20201030011738.2028313-2-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Nov 2020 08:18:47 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VHvL4A3U==CECbgkfvRcy51v4cSBjodvRGA2463L+CZQ@mail.gmail.com>
Message-ID: <CAD=FV=VHvL4A3U==CECbgkfvRcy51v4cSBjodvRGA2463L+CZQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/bridge: ti-sn65dsi86: Combine register
 accesses in ti_sn_aux_transfer()
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 29, 2020 at 6:17 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> These register reads and writes are sometimes directly next to each
> other in the register address space. Let's use regmap bulk read/write
> APIs to get the data with one transfer instead of multiple i2c
> transfers. This helps cut down on the number of transfers in the case of
> something like reading an EDID where we read in blocks of 16 bytes at a
> time and the last for loop here is sending an i2c transfer for each of
> those 16 bytes, one at a time. Ouch!
>
> Changes in v2:
>  - Combined AUX_CMD register write

The change from v1 to v2 makes me slightly nervous, though I guess
it's fine.  Specifically, all the examples in the datasheet show
programming the CMD before the ADDR and LEN.  This change will make it
programmed after.  Since there's a separate START bit I guess it's OK,
though.  Nothing in the datasheet explicitly says that the order in
the examples is the only order that will work...

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
