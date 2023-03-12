Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AB16B6AA6
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 20:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E5310E102;
	Sun, 12 Mar 2023 19:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0020F10E102
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 19:28:56 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id nn12so9945773pjb.5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 12:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678649336;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qfhIXoQOHQJr+gGO2qxo4oT4JoKm/10nWr5b3EbxW40=;
 b=Izm1xtXUrM5ET2LFvnd9qHyz2wuer8S4f0kqpsoe6aV2R7hdUbRk4Y5j4/bbOgGI+z
 RvIbIb9Z697jvIbHAC5lHHo1P3s0GpO9h14HyRwX3Hp9AMJZsxF/9kMozJ0irjgwKf6v
 M99Lkn004juVqxQRx6Rhh6p5BaSvxIVHHOHZshP/uc6XPc0BzF6qNpJgDnAp3B+5FDHZ
 zbgiApcjam4s+U1La0LbTdLOoWnWHFGKZhCyY8VhgaeoPv2U7tsudi1EKEgC1+XMpipV
 p0rgqf19aHsK3J1VeIAWukvmSicd3ga8IcQ6CqIidw1OgZX4XXNOGG1HxuQEq/PAXm2B
 1u5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678649336;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qfhIXoQOHQJr+gGO2qxo4oT4JoKm/10nWr5b3EbxW40=;
 b=JKqoGz69eU+HAybEUfKbgbe9UcyIrZIOuW8D9J7ci8G5m3eRf/HexTNi7dlWxVOuFQ
 h2PhRMNxpdsfXpPO7UESJbmXwsUo/ZGV1LAi6kV3WMifd4SZU7SmiNOefHdjwBqZQJvd
 hpCTQVoFNRgU1+zCjoi0LEfc2jzBtGQcoKMitpxM+Bg2fdacK5KvdbeOs4mdebZY7wDi
 k4kqFMb3JcHjXPl7UricZUKYeS6/e++JetIaxkZpfFt6N/Z4KBnYIH6V/hKR4/O5evRC
 DI0xH8pR/+p9KN5zZrRsgbxNuofzEU9UIWnwQbrh/27yq03OIn8wIU5R5GxeWjBHSl6b
 Jv9g==
X-Gm-Message-State: AO0yUKX/SwJDhZVfTZ+235IHJ+cg5J64Bh3WxQM3h0rTe1tTju6gFA6x
 Bt3UAU+/Tx66EAWq+yXoKeJ5N3mnpmaw7toW9e4=
X-Google-Smtp-Source: AK7set+Ujk1wsgXpvSnRx5mIG+1Ilcjk1Xpo2ZGuCMkVBMpDf41SDnjqHHM8VTZ1TpnWOY3pZu/dWNZX8KpyGOJclvY=
X-Received: by 2002:a17:903:710:b0:19f:30be:e9f6 with SMTP id
 kk16-20020a170903071000b0019f30bee9f6mr1424089plb.6.1678649336371; Sun, 12
 Mar 2023 12:28:56 -0700 (PDT)
MIME-Version: 1.0
From: Adam Ford <aford173@gmail.com>
Date: Sun, 12 Mar 2023 14:28:45 -0500
Message-ID: <CAHCN7xJXMmwYqD=Eb2=_vJw390KAd6NgkWCpq6yCbAyaJ3xK5A@mail.gmail.com>
Subject: MXSFB and Video PLL clock on i.MX8M Mini/Nano Question
To: arm-soc <linux-arm-kernel@lists.infradead.org>
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
Cc: Marek Vasut <marex@denx.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I am trying to work through a series that was submitted for enabling
the DSI on the i.MX8M Mini and Nano.  I have extended this series to
route the DSI to an HDMI bridge, and I am able to get several
resolutions to properly sync on my monitor.  However, there are also a
 bunch that appear on the list when I run modetest that do not sync on
my monitor.

When running some debug code, it appears that it's related to the
clocking of the MXSFB driver.

From what I can tell, the MSXFB driver attempts to set the clock based
on the desired resolution and refresh rate.  When the default
VIDEO_PLL clock is set to 594MHz, many of the resolutions that cleanly
divide from the 594MHz clock appear to sync with my monitor.  However,
in order to get other resolutions to appear, I have to manually change
the device tree to set VIDEO_PLL to a different clock rate so MSXFB
can use it.  Unfortunately, that breaks the resolutions that used to
work.

I threw together a hack into the MXSFB driver which adds a new
optional clock to the MSXFB driver.  When I pass VIDEO_PLL to this
driver, it can automatically set the clock rate to match that of
whatever the desired clock is, and I can get many more resolutions to
appear.
Another advantage of this is that the Video_PLL can be the minimum
speed needed for a given rate instead of setting a higher rate, then
dividing it down.

I wasn't sure if that would be the best way to approach this, or if
someone had a better suggestion.

If this is the best approach, I can try to clean up my patch and
submit it to the mailing list for review.

thanks,

adam
