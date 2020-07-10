Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71C221AC85
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 03:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882FE6EB57;
	Fri, 10 Jul 2020 01:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F816EB57
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 01:38:47 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id p6so1325369uaq.12
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 18:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rwZ3DYshMM6TxgS7HlmiJMG3O0eqLFDjVA0qiqONL9c=;
 b=kxMyTpnOoVqLAx06Eq/BG8dsTt2HetQM+osslhZwLZLc6qwsmlW+bGHiIJ4xrH96dS
 b8Z4AmXJ6eAlGURzDiRvOaW6caIuXF3dnOU9Me9Ji2G9SrPTWdoTpsd8DSYGzmMWDoCP
 9QKK+ffBMstJ7DjkzVsc4yRl/QNqfbFX9q+ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rwZ3DYshMM6TxgS7HlmiJMG3O0eqLFDjVA0qiqONL9c=;
 b=E+eq8xefahkEQBMpoo0oMNACXiLxcbtHnsmoTTC20SYAAEKpmtqAnultGabfDhdvq+
 tgJ5WOdtgPJ6ygkx3Th35Y6KgSNhAm6ufoFSSbaTC0QAjZ/gfTEPoCNPlXFsFvfTjYsJ
 QC+Slvfmd0kbfkVRkcElWPcDcekEXvXzhz1wtOP483PRXJONBBKiF3iGs349GEvkn8sB
 eWVdXWRykUGNTmIqNKLsnnfcbeSNWqp8c0tHi+z+abceeo6dacipdsGy5mCPbzD1BRqO
 ovYHksZdn/mml4/9LFxVwXb+Yqf+7+f25p7fGeEIcFE4ItPX2y0wBEJ7NMFuzLEDuL2c
 /mNA==
X-Gm-Message-State: AOAM532+YCAMM1NMvmYGGvEXIB80pjya++OVXnJtUePhUQ5ImQpNRksh
 iWtjX07ldyG3P+XXX3mSxTRbmoSbNSY=
X-Google-Smtp-Source: ABdhPJz9gVmdGIXU+DqFiEUdohlbS0g9CXjk1Jk2gOe1cR5BCdTQ11K+LtoAAzae/bQqFno2dCdOdA==
X-Received: by 2002:a9f:2e16:: with SMTP id t22mr47838680uaj.84.1594345125799; 
 Thu, 09 Jul 2020 18:38:45 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47])
 by smtp.gmail.com with ESMTPSA id e18sm541281vsp.7.2020.07.09.18.38.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 18:38:44 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id x205so2136511vsc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 18:38:43 -0700 (PDT)
X-Received: by 2002:a67:e046:: with SMTP id n6mr20302730vsl.6.1594345122863;
 Thu, 09 Jul 2020 18:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
 <20200710011935.GA7056@gentoo.org>
In-Reply-To: <20200710011935.GA7056@gentoo.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 Jul 2020 18:38:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X3oazamoKR1jHoXm-yCAp9208ahNd8y+NDPt1pU=5xRg@mail.gmail.com>
Message-ID: <CAD=FV=X3oazamoKR1jHoXm-yCAp9208ahNd8y+NDPt1pU=5xRg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
To: steev@kali.org
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Steev Klimaszewski <steev@gentoo.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 9, 2020 at 6:19 PM Steev Klimaszewski <steev@gentoo.org> wrote:
>
> Hi Doug,
>
> I've been testing 5.8 and linux-next on the Lenovo Yoga C630, and with this patch applied, there is really bad banding on the display.
>
> I'm really bad at explaining it, but you can see the differences in the following:
>
> 24bit (pre-5.8) - https://dev.gentoo.org/~steev/files/image0.jpg
>
> 18bit (5.8/linux-next) - https://dev.gentoo.org/~steev/files/image1.jpg

Presumably this means that your panel is defined improperly?  If the
panel reports that it's a 6 bits per pixel panel but it's actually an
8 bits per pixel panel then you'll run into this problem.

I would have to assume you have a bunch of out of tree patches to
support your hardware since I don't see any device trees in linuxnext
(other than cheza) that use this bridge chip.  Otherwise I could try
to check and confirm that was the problem.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
