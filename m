Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FE4490BA3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 16:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A108810E3D4;
	Mon, 17 Jan 2022 15:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EF010E3D9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 15:42:49 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id j7so18885110edr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 07:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H0643+8gKh9512ohcHyBxU3hxXBHW+yND0A0j7B84Us=;
 b=rhFS8JL2KNlWCFqfgru/ughQOpLVLpX00LEPw+qqZO5vAtE1xmvNh+VEU7l+8TtFGe
 72QS8U+7D0qrTAsmFF3AYSAlHFoQ+vtUdQZUNRgtysB325df84xkIt77f3RvvP+NM88/
 s0pvIg1ULi+DNlEqFkOsNk52K4gBtQtMzQIuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H0643+8gKh9512ohcHyBxU3hxXBHW+yND0A0j7B84Us=;
 b=rlx+qdGj10CUST9eHau4eMOCDslrzb43067/UzsHOclE9g/78p00l3O4rC6/tidVTp
 zs6cAIM/nuimuzafwegvvYairVYn49C4Ji4maYo7nMTFmJeLimgiXjnUuF7fQkfNQ4ZX
 9aVsoDAB/BzT2qc7W3mAM6ukSXun0RSNsc2CFj2y3GQAt5/qTvBUVKIjh5uXMSbMjSEd
 zG1tV4jMLVO2uUswibVhjxkt+0duQtlvGupu2y3t62/jbJb5H6XNbtJ2GiqXuqle8CZ5
 1pH5xuMwqKNYsctDJog0REagA2gc4Ktdcjhn+cuxzxAJT7lkqJAN1io11nkue/IoQBeG
 ifzg==
X-Gm-Message-State: AOAM531UD2knjI/UZeJLV7cUI4cvqdlPvb1TFlqaxqQ9Q/Bbm0e90Yvx
 mej3h3OdAF4Sl01YIYPHY6nFQ9x6eTohUYo3Kn+wDA==
X-Google-Smtp-Source: ABdhPJzQ1CMgvRtUEYhSLErdB8IK2y6NKOm1fP24a3qYQLLp1xYUnb5Q0pjf6XoS6yn+e1uL/AtftZNvwnP8h75eue8=
X-Received: by 2002:a17:907:961d:: with SMTP id
 gb29mr17037141ejc.123.1642434168402; 
 Mon, 17 Jan 2022 07:42:48 -0800 (PST)
MIME-Version: 1.0
References: <20211210111711.2072660-1-jagan@amarulasolutions.com>
 <20211210111711.2072660-2-jagan@amarulasolutions.com>
 <20211213170223.fx5656vjk3fwizbg@houat>
In-Reply-To: <20211213170223.fx5656vjk3fwizbg@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 17 Jan 2022 21:12:37 +0530
Message-ID: <CAMty3ZAetcXpcokJ418VGHzbi4ivJg4Rt0OVgh7WaZ6GAJQY1Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] drm: sun4i: dsi: Drop DRM bind race with bridge
 attach
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 13, 2021 at 10:32 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, Dec 10, 2021 at 04:47:06PM +0530, Jagan Teki wrote:
> > Existing host driver will keep looking for DRM pointer in
> > sun6i_dsi_attach and defers even if the particular DSI device
> > is found for the first time. Meanwhile it triggers the bind
> > callback and gets the DRM pointer and then continues the
> > sun6i_dsi_attach.
> >
> > This makes a deadlock situation if sun6i_dsi_attach is trying
> > to find the bridge.
>
> I'm not sure what you mean by deadlock here, there's no lock involved?

deadlock parse here for general understanding, where bind is trying to
attach bridge but drm pointer is not available that point and drm
pointer will available only when bind done. This is what I'm calling
as deadlock here.

Anyway, now I'm able to support both panel and bridge to support
hotplug so no need to drop the hotplug support.

Please let me know, if you have any questions so-that I can send next
version series.

Thanks,
Jagan.
