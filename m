Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2C855A1F2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D657710E56C;
	Fri, 24 Jun 2022 19:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C19A10E56C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Ad+DhE3IbR2iex/yzIihLX8YVyGXpjxJ1bB/wP9flSI=;
 b=mytJqSGFcuARUCabX8nUTEB/63IYrkijltDqr6UmmHvKrxZ9w44lUTPvkutRRZleY7JX9dHMVTBzO
 xfzQ3HKpGMUL8EDCjwY0/iFTf8rNPqV4kJcGEiypUxGpexBZF90ic6klsxM3I+rfbKYwecIYTLUJno
 ggtNWD1np/PoeZv48NfpW3mdKYCWg6ZReiWn5cIGGVDuyZCOOITQVuzCJa7dnkFltzV1Ak7dO4KNWh
 oLQWZCkqPqDVD+Gbinx/r83gD7NMdQq0ZY6XHrZcFmdmUwB90Zzo+0NIBw9GbACmRUYvZ8OKc8CRL2
 w4LU4YaYf3nPI32LawHlnqgyK96wmUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Ad+DhE3IbR2iex/yzIihLX8YVyGXpjxJ1bB/wP9flSI=;
 b=rR+tHXGotv42P7yrodke39gH5FV4pav+ErgJmaVngNqdZ1iIOVUbe5MgOgl6gpeguV06GZemdMnpK
 pJvNDIgCQ==
X-HalOne-Cookie: f849e6918b8cd146939bcb738a198ec6a476cb6a
X-HalOne-ID: 8b496d47-f3f5-11ec-a6c4-d0431ea8a283
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 8b496d47-f3f5-11ec-a6c4-d0431ea8a283;
 Fri, 24 Jun 2022 19:40:47 +0000 (UTC)
Date: Fri, 24 Jun 2022 21:40:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH v2 1/3] drm/panel: Use backlight helper
Message-ID: <YrYTPbn32QM5wLa1@ravnborg.org>
References: <20220616172316.1355133-2-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616172316.1355133-2-steve@sk2.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 David Airlie <airlied@linux.ie>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 16, 2022 at 07:23:13PM +0200, Stephen Kitt wrote:
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
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
Thanks, applied to drm-misc (drm-misc-next)

	Sam
