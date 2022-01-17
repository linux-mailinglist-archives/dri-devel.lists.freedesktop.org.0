Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D18A490307
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 08:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6D210E339;
	Mon, 17 Jan 2022 07:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681D610E339
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 07:45:22 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id x11so28554525lfa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 23:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nVojK749fmbikJ8Ylv61w+rfH9eMOuHdf6x9SWu9cSY=;
 b=SUwsxZsxjvlQaEwoE7XT7C+KHZ9jGQQayZYDeXg5DlUCjdR5AwuUOSqu5Vnxhj5hfU
 cZct8MLYPqEIXtyX72Hymgmw/UKBQ1+Skmdl8fCeXQDsuDDeIpc+chJKRuX7BUddxkgp
 I/CiGnBzl6R++Z3e4nfaDlKGmOZMTWnoQWeYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nVojK749fmbikJ8Ylv61w+rfH9eMOuHdf6x9SWu9cSY=;
 b=Te+cqb8UgWtT6SPx2ctNlAcXFO8XOtWPQ0jFYA470qnf9S3OM4quPKNImov5W5sylY
 IRbFROqIJD8OqHeqopCuCJ9NbbPaLHEaj65lITSSxtrc14qq8dmwF++ELUvJla3ijGC1
 9509VnUJqarr19bJU5tvdubAJHgvXD9k1qdif6UP4Z/7oncJ5CqpKvgAkE/cw5vEQsFn
 2E4vyJtS+s+5rLJ+6cJqjDJFgZjJIRduSxxvWpvtvKDC6m3oY1NmI6I5m9LAExt0vwrM
 DkvZeM98z4BapIsGBmI2RgN6KCUzCgY2uaj4HAH1wRWtz5aGTD9hluB8/4cGyWPwiTTT
 aJzw==
X-Gm-Message-State: AOAM532Va/rANl3upMwvY7s3+n/pNzqokGq5UW2GKgbg1aHUo8SQ87mK
 djLBReuKV2cBGHcw3VchnJAs6meAEApyAsQilcBByA==
X-Google-Smtp-Source: ABdhPJwG9NvWR9p35lcYW0jwX/k5v4481qRKalDO5NxJSEYxWGLzootcvrIELTsY/GzSoLCDQfiA7L3OWsPgQKfrGNM=
X-Received: by 2002:a2e:2285:: with SMTP id i127mr4064849lji.414.1642405520722; 
 Sun, 16 Jan 2022 23:45:20 -0800 (PST)
MIME-Version: 1.0
References: <20220114230209.4091727-1-briannorris@chromium.org>
 <20220114150129.v2.2.I20d754a1228aa5c51a18c8eb15a2c60dec25b639@changeid>
In-Reply-To: <20220114150129.v2.2.I20d754a1228aa5c51a18c8eb15a2c60dec25b639@changeid>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 17 Jan 2022 15:45:09 +0800
Message-ID: <CAGXv+5Gm4ru8m5bZV_zm10U+FQRBSw7qq1eiL+hh+Z=5pZ7pYQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/rockchip: cdn-dp: Support HDMI codec
 plug-change callback
To: Brian Norris <briannorris@chromium.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Lin Huang <hl@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 15, 2022 at 7:03 AM Brian Norris <briannorris@chromium.org> wrote:
>
> Some audio servers like to monitor a jack device (perhaps combined with
> EDID, for audio-presence info) to determine DP/HDMI audio presence.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
