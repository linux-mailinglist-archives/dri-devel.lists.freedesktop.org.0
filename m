Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466FF4405AE
	for <lists+dri-devel@lfdr.de>; Sat, 30 Oct 2021 01:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0DE6EA8E;
	Fri, 29 Oct 2021 23:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB066EA8E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 23:10:07 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id y1so7736716plk.10
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 16:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Khuc1pXaYRofI6UFT+rSjF/BH8l2xaVqJxEXbWNhoCI=;
 b=j8fihy9A+vPnYIT8fw/af9uk1vDrLXfUnYL7Y19yFfcmFAN142nUhBww+jcsbZbBJ0
 nBf5oCCHnGN3Z1kU04lJYCZB1o8OG82JZqP78x7yL39g2jSfxAPDWS1FXEUclJQDi+wQ
 7z5rz89qkltJ6fmszGfzOHbclRL0Zwsikf6es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Khuc1pXaYRofI6UFT+rSjF/BH8l2xaVqJxEXbWNhoCI=;
 b=n48QM2fDR9ph86cct6t0LHbCZLVsSBrYrrAljnY+eXdrCQbJ5MEQfOlm/samvc5Cno
 XTCcoAjzNZcrDYRWGnJJGF+DGmYAC8IsDuSJ8gMC6qQu1lg5VTM1/Dw6M+GoTNgcvqy4
 IlfKxMMcWY4jgiP5xstNi/MJ3OaEar5S5u83w7WZiIaYHr7kGc7GvCYOz9gI79lEHM1w
 URMFkeSz6WL0Qp1KrvT8BWgAhMpHuuJNYP9xPn+ndQtJS4i7AJR6B7I3hH1Z1pyZFtJh
 0E/2SiwAmqOIt2RBSBxsaYw1657JiAcadIqyWBt3R5w6dhQIsLN5o1s4Q+Dguio3Atch
 pYqw==
X-Gm-Message-State: AOAM533+8nBVs5fKPlMf98UK39fPTdDurfyZya6zxHySkwF7iT9wJGrr
 HQSRiFpx3XGCS7xQ0LdRBxyzIA==
X-Google-Smtp-Source: ABdhPJwGxsHcbLvcYaXN2qrTqidhM1hKN02zmGXtgdzYbdQKgNcPjnuobNEDquVUL1R26dWR0qrPOg==
X-Received: by 2002:a17:903:2451:b0:141:7907:674e with SMTP id
 l17-20020a170903245100b001417907674emr12386715pls.45.1635549006674; 
 Fri, 29 Oct 2021 16:10:06 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:be89:1308:1b03:6bc4])
 by smtp.gmail.com with ESMTPSA id mi11sm11824219pjb.5.2021.10.29.16.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 16:10:06 -0700 (PDT)
Date: Fri, 29 Oct 2021 16:10:04 -0700
From: Brian Norris <briannorris@chromium.org>
To: Sean Paul <sean@poorly.run>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 stable@vger.kernel.org, Zain Wang <wzz@rock-chips.com>,
 Tomasz Figa <tfiga@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Make PSR-disable non-blocking
Message-ID: <YXx/TJ6CAXHfTdrQ@google.com>
References: <20211020161724.1.I67612ea073c3306c71b46a87be894f79707082df@changeid>
 <20211021004015.GD2515@art_vandelay>
 <CA+ASDXNNPHfAVuN_Q7UJR6GLaepHghtovDUKyMKrVM_UboiM2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+ASDXNNPHfAVuN_Q7UJR6GLaepHghtovDUKyMKrVM_UboiM2A@mail.gmail.com>
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

On Wed, Oct 20, 2021 at 06:23:35PM -0700, Brian Norris wrote:
> On Wed, Oct 20, 2021 at 5:40 PM Sean Paul <sean@poorly.run> wrote:
> > The actual latency gains from doing this synchronously are minimal since the
> > panel will display new content as soon as it can regardless of whether the
> > kernel is blocking. There is likely a perceptual difference, but that's only
> > because kernel is lying to userspace and skipping frames without consent.
> 
> Hmm, you might well be right about some of the first points (I'm still
> learning the DRM framework), but I'm a bit skeptical that the
> perceptual difference is "only" because we're cheating in some way.
> I'm not doing science here, and it's certainly not a blinded test, but
> I'm nearly certain this patch cuts out approx 50-80% of the cursor lag
> I see without this patch (relative to the current Chrome OS kernel). I
> don't see how cheating would produce a smoother cursor movement --
> we'd still be dropping frames, and the movement would appear jumpy
> somewhere along the way.

Aha, so I think I found {a,the} reason for some disagreement here:
looking at the eDP PSR spec, I see that while the current implementation
is looking for psr_state==DP_PSR_SINK_INACTIVE to signal PSR-exit
completion, the spec shows an intermediate state
(DP_PSR_SINK_ACTIVE_RESYNC == 4), where among other things, "the Sink
device must display the incoming active frames from the Source device
with no visible glitches and/or artifacts."

And it happens that we move to DP_PSR_SINK_ACTIVE_RESYNC somewhat
quickly (on the order of 20-40ms), while the move to
DP_PSR_SINK_INACTIVE is a good chunk longer (approx 60ms more). So
pre-commit-6c836d965bad might have been cheating a little (we'd claim
we're "done" about 20-40ms too early), but post-commit-6c836d965bad
we're waiting about 60ms too long.

I'll send v2 to make this block for DP_PSR_SINK_ACTIVE_RESYNC ||
DP_PSR_SINK_INACTIVE, which gets much or all of the same latency win,
and I'll try to document the reasons, etc., better.

I'll probably also include a patch to drop the 'blocking' parameter,
since it's unused, and gives the wrong idea about this state machine.

> In any case, I'm absolutely certain that mainline Linux performs much
> much worse with PSR than the current CrOS kernel, but there are some
> other potential reasons for that, such as the lack of an
> input-notifier [1].
...
> [1] This got locked up in "controversy":
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20180405095000.9756-25-enric.balletbo@collabora.com/

While I'm here: I also played with this a bit, and I still haven't
gotten all the details right, but I don't believe this alone will get
the latency wins we'd like. We still need something like the above.

Brian
