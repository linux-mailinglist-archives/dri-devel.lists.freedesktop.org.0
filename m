Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD6155A23F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393F710F225;
	Fri, 24 Jun 2022 20:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D120E10E3F6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=hEGNVGl+SZAARGmSdNCweniFlHwABQxHwPZBDjq6yRA=;
 b=JLLEI6ujyiAG3rp3H7xyLxcYlGJ/hVLLREa1VgsJE8xHDdvmm+Iife+Nbt/zQPlwx/H4iM6uWAKVe
 wDq4IbRtLMNB0uywL0gx+xeWMCGZoXK7QjfheGvH7KjYq/rZqPooQoyZRXmNnqaYDX+udBaoWQgJ6l
 fDnQ8p6KsXzpnLyo17Ih/28E7dkiT2lflfZhaVpcuVj13DUIUQSiVS1k/iA2PbN/07PcRJ8ZGtJ3Zn
 aQaz0M5ujKiLK8ekyngWDhj0YtUVpzKdZGbnlQCv74guMkiSiOdzCwz1kt7qa5MYtDSKrQn3n96RNA
 K/iD+EKV93MY2O0tod78jr/ww3rQlBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=hEGNVGl+SZAARGmSdNCweniFlHwABQxHwPZBDjq6yRA=;
 b=N/OQDvIb5H+8xT6dShXqQLCs9XlMGb8LNYHSwiX5IRt+1RJg4qnFf8gZ77AiODkC1ZM6bCVi7V8or
 DwipM+MBg==
X-HalOne-Cookie: 03ce154afd92931682423ec165f1f06fae96aef2
X-HalOne-ID: 42830791-f3f8-11ec-8233-d0431ea8bb10
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 42830791-f3f8-11ec-8233-d0431ea8bb10;
 Fri, 24 Jun 2022 20:00:13 +0000 (UTC)
Date: Fri, 24 Jun 2022 22:00:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH] drm/bridge: parade-ps8622: Use backlight helper
Message-ID: <YrYXzGWWwMA46ltE@ravnborg.org>
References: <20220607181022.1119546-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607181022.1119546-1-steve@sk2.org>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 07, 2022 at 08:10:22PM +0200, Stephen Kitt wrote:
> backlight_properties.fb_blank is deprecated. The states it represents
> are handled by other properties; but instead of accessing those
> properties directly, drivers should use the helpers provided by
> backlight.h.
> 
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
Thanks, applied to drm-misc (drm-misc-next).
I kept the full changelog.

	Sam
