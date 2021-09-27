Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5828341A35C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 00:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A39B6E047;
	Mon, 27 Sep 2021 22:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C885F6E047
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 22:53:04 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 d4-20020a17090ad98400b0019ece228690so305597pjv.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 15:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JA7b+17NeQa8MxRoYAOMDqy2vhM9dB7W8X4n526ZCa0=;
 b=Z5O9ySOI18c257QEjUpy/S8DkTMRZbS+Opwm+B06YkbXyoON66i8zm0NmG1G1POeYS
 EBc7b9mKjFHhjnVmjWrHyrtObPg/oquR2Jn3r5VzpoNSSmbzAFUXVpMR0KdMkvSO3ils
 f2HFYDCiCdJkcZJt36DLQZwmQu3Xu5F9SFcdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JA7b+17NeQa8MxRoYAOMDqy2vhM9dB7W8X4n526ZCa0=;
 b=hjCzL1pBI7qbShwzkKUxZ3kf20siZzUMqRkSC1U5s1TjsMC1O0MKGGNyUn5ZifNq3r
 M7BmzW5Suuq05ACy9UgThhvuhGpdUTNYdj9YwlEqfsnKw26mn7kU3Tt6yyTW0skEOL4w
 muXG8hqfcM9zeoQjAPSc7UPRW2J2dOyJpioQoI7fxzzr/vPmawiKH3lBGWWfo0ZW5k4h
 GpSExWCVQXdZDG99mvr+6UUKkrWA5jAozZTzXgV6RhMDQkZwcAWbNG+fV3zbn6UD171K
 qnvYumc7c8l1oNMZrx1HFeBtlJ4hgxdKHIHxy8aid9iGI0ruJpQ+YEAjHm0nmRIQMdFk
 1MJQ==
X-Gm-Message-State: AOAM531iRxkkCJDyAXI8TFMHIubqhQHEhkq6KX39pthAXCldr5K1fXWl
 pUhlY8SPXrpI0bDhV3eRJRXBiA==
X-Google-Smtp-Source: ABdhPJxkB1+hIdcbUYUE1kpFcUSeQp8QyXRmiFqUkg3nIfTORYYZ8be8QnFQ8D4kae1TnKknxs4a/A==
X-Received: by 2002:a17:902:db11:b0:13c:7a6e:4b57 with SMTP id
 m17-20020a170902db1100b0013c7a6e4b57mr2025768plx.43.1632783184202; 
 Mon, 27 Sep 2021 15:53:04 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:82d7:f099:76bc:7017])
 by smtp.gmail.com with ESMTPSA id gk14sm172195pjb.35.2021.09.27.15.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 15:53:03 -0700 (PDT)
Date: Mon, 27 Sep 2021 15:53:00 -0700
From: Brian Norris <briannorris@chromium.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Thomas Hebb <tommyhebb@gmail.com>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wenst@chromium.org>, linux-rockchip@lists.infradead.org,
 Sandy Huang <hjc@rock-chips.com>, linux-kernel@vger.kernel.org,
 aleksandr.o.makarov@gmail.com, stable@vger.kernel.org,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH v2 1/3] drm/rockchip: dsi: Hold pm-runtime across
 bind/unbind
Message-ID: <YVJLTLuNHNAzVq5V@google.com>
References: <20210927175944.3381314-1-briannorris@chromium.org>
 <20210927105928.v2.1.Ic2904d37f30013a7f3d8476203ad3733c186827e@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927105928.v2.1.Ic2904d37f30013a7f3d8476203ad3733c186827e@changeid>
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

On Mon, Sep 27, 2021 at 10:59:42AM -0700, Brian Norris wrote:
> In commit 43c2de1002d2, we moved most HW configuration to bind(), but we
> didn't move the runtime PM management. Therefore, depending on initial
> boot state, runtime-PM workqueue delays, and other timing factors, we
> may disable our power domain in between the hardware configuration
> (bind()) and when we enable the display. This can cause us to lose
> hardware state and fail to configure our display. For example:
> 
>   dw-mipi-dsi-rockchip ff968000.mipi: failed to write command FIFO
>   panel-innolux-p079zca ff960000.mipi.0: failed to write command 0
> 
> or:
> 
>   dw-mipi-dsi-rockchip ff968000.mipi: failed to write command FIFO
>   panel-kingdisplay-kd097d04 ff960000.mipi.0: failed write init cmds: -110
> 
> We should match the runtime PM to the lifetime of the bind()/unbind()
> cycle.

Hmm, sorry to reply to my own patch so quickly, but after a bit more
testing I'm finding we still have yet another problem here -- that
suspend/resume does not work. For suspend/resume,
drm_mode_config_helper_{suspend,resume}() are expecting to only do
teardown/setup via disable()/enable() -- there is no re-bind() (which
makes sense). But the DSI hardware state may be lost, so the resume-time
enable() may find the panel initialization timing out yet again.

Possible solutions:

(1) I can add PM suspend()/resume() operations just to call
    dw_mipi_dsi_rockchip_config().

(2) Switch back to using mode_set() for HW configuration, like the
    downstream/BSP driver does (and the initial versions Rockchip and
    later Heiko were working on did the same), since that's always
    called at the right time before both panel and encoder enable().
    That also happens to be where some other DSI drivers [1] do similar
    init.

Have we been avoiding (2) just because that doesn't really match the
intended purpose of the callback? I can't find any cleaner callback for
this at the moment, and I'd rather not try to introduce entirely new drm
helper callbacks just for this particularly-unfriendly sequence.

I have a patch written for option (1), and may send a v3 soon to include
that as well (because that's also a regression from the same commit).

Brian

[1] e.g., drivers/gpu/drm/bridge/nwl-dsi.c
