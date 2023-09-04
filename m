Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598EE7917CB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 15:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C0A10E1D9;
	Mon,  4 Sep 2023 13:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A86210E1D9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 13:09:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-85-115-nat.elisa-mobile.fi
 [85.76.85.115])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21DF4283;
 Mon,  4 Sep 2023 15:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693832875;
 bh=giOVyhY52H90PWNQUK2fo9EqlEgTcbkTBkkFfLTBjIQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GIFxdWg7d7yUO0MMt6iwilQ2sVwYOFg7zWjhNaWrk6TlHtW7geLL+ENbkFBPXX54d
 NKYoADx/567unowYnfCjNWDvpJ9OrWUzhjYCzYcMVmeudvaotNypmScT+wQeJOxgQ5
 JiJ5xAu8/qyckOWJB4PoxO7rA34Iz6ffWqWjSoDU=
Date: Mon, 4 Sep 2023 16:09:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: switch to
 drm_do_get_edid()
Message-ID: <20230904130931.GB15982@pendragon.ideasonboard.com>
References: <20230901102400.552254-1-jani.nikula@intel.com>
 <CA+MoWDrtgtT26F-rZ-7s0PtQcTLqB6g1BARkegfZ3qQnhw=3ZQ@mail.gmail.com>
 <87fs3ui79j.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fs3ui79j.fsf@intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zheyu Ma <zheyuma97@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Martyn Welch <martyn.welch@collabora.co.uk>,
 Jonas Karlman <jonas@kwiboo.se>, Peter Senna Tschudin <peter.senna@gmail.com>,
 Yuan Can <yuancan@huawei.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ian Ray <ian.ray@ge.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Martin Donnelly <martin.donnelly@ge.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 04, 2023 at 01:04:40PM +0300, Jani Nikula wrote:
> On Sat, 02 Sep 2023, Peter Senna Tschudin wrote:
> > Good morning Jani,
> >
> > It has been a long time since I wrote the driver, and many many years
> > since I sent my last kernel patch, so my memory does not serve me very
> > well, but I will try to shed some light.
> >
> > On Fri, Sep 1, 2023 at 12:24 PM Jani Nikula wrote:
> >>
> >> The driver was originally added in commit fcfa0ddc18ed ("drm/bridge:
> >> Drivers for megachips-stdpxxxx-ge-b850v3-fw (LVDS-DP++)"). I tried to
> >> look up the discussion, but didn't find anyone questioning the EDID
> >> reading part.
> >>
> >> Why does it not use drm_get_edid() or drm_do_get_edid()?
> >>
> >> I don't know where client->addr comes from, so I guess it could be
> >> different from DDC_ADDR, rendering drm_get_edid() unusable.
> >>
> >> There's also the comment:
> >>
> >>         /* Yes, read the entire buffer, and do not skip the first
> >>          * EDID_LENGTH bytes.
> >>          */
> >>
> >> But again, there's not a word on *why*.
> >
> > The video pipeline has two hardware bridges between the LVDS from the
> > SoC and DP+ output. For reasons, we would get hot plug events from one
> > of these bridges, and EDID from the other. If I am not mistaken, I
> > documented this strangeness in the DTS readme file.

This should be supported properly by the drm_bridge_connector helper,
which supports delegating HPD and EDID retrieval to different bridges.

> > Did this shed any light on the *why* or did I tell you something you
> > already knew?
> 
> I guess that answers the question why it's necessary to specify the ddc
> to use, but not why drm_do_get_edid() could not be used. Is it really
> necessary to read the EDID in one go?

-- 
Regards,

Laurent Pinchart
