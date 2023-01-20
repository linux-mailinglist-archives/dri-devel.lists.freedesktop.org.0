Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B162675FB6
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 22:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926CA10E0F3;
	Fri, 20 Jan 2023 21:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B2E10E0F3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 21:44:54 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id v30so8271813edb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 13:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QV4xUlvMB6Ml94GZ/lP0/1VdW6RK6YzwPsgjf7qgrwQ=;
 b=iQKAwPM0wYaB3G+O8Te9N2aCGhjICMaONFSIIqU3GNAomdQFeJWurMMTzfF4cPpjkN
 gCEqSTdfz7V91sipjRt8u25nNnr9znfo/DMO+bqWJPz6uL2Yri0Hk7aCWzKVbS80I1xX
 Xw91bc8MXh+L6c8pABFFY0zhZoH4v4mz+KY+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QV4xUlvMB6Ml94GZ/lP0/1VdW6RK6YzwPsgjf7qgrwQ=;
 b=WiYsBBLZKjOWCCarVj/JaouGaJB9veg0elcUNNeFUwt6lmpDQSAG+y3OzkMnmYa/Ze
 jlEuEE3c7s/PJiE9Bdxe2f0y7HffjaQAoF2sJXjkbH2cAF8LZmEeR9NjFcOGJHo0i2fl
 3TQAjtEn3tLR2f/zcwNWqZweOsqPCukArnoXGXh0Tt4LNO9qXUR/ha9gM9V9wq7IJO3x
 aGcdOQna8UYg3fIawpw+Jfl3wVe65GYBURaIwahBJ2sKEnf3maE4YH1v+UzduL6NbQK0
 ihHt3lpugJ4v6BQJBXidTcwjpxv1zHbFaL+nEqX9GHRsk7QnlDGlbRtkzrGGSdGgJxr4
 NycQ==
X-Gm-Message-State: AFqh2kqpn4ALIOlwPwMwjk6iw/CCV1mkx0TBP+m+DuPGsEKC0oV//tId
 YQH+t2KxLrUEjF87Y5a7eMOzrtkd7J8Z4TJT2NI=
X-Google-Smtp-Source: AMrXdXsfcx4njyw3AUUsaqUTp1c8HI3bFBg9cCRr6VL4ILxkQLCXGqY63Q8WL7O61qUUbXMSznwE+A==
X-Received: by 2002:a05:6402:c84:b0:475:c640:ddd2 with SMTP id
 cm4-20020a0564020c8400b00475c640ddd2mr15957509edb.26.1674251092459; 
 Fri, 20 Jan 2023 13:44:52 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 t20-20020a056402021400b0049e210884dasm6932904edv.15.2023.01.20.13.44.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 13:44:51 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id b7so5985580wrt.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 13:44:50 -0800 (PST)
X-Received: by 2002:a5d:5965:0:b0:2be:5047:d840 with SMTP id
 e37-20020a5d5965000000b002be5047d840mr183614wri.646.1674251090648; Fri, 20
 Jan 2023 13:44:50 -0800 (PST)
MIME-Version: 1.0
References: <20230120114313.2087015-1-john@metanate.com>
In-Reply-To: <20230120114313.2087015-1-john@metanate.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Jan 2023 13:44:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UPD6c+NY8Ub37N7LmrRFpcr6gKOh0Os14DaKrf3bKo2A@mail.gmail.com>
Message-ID: <CAD=FV=UPD6c+NY8Ub37N7LmrRFpcr6gKOh0Os14DaKrf3bKo2A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: panel: Set orientation on panel_bridge
 connector
To: John Keeping <john@metanate.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jan 20, 2023 at 3:43 AM John Keeping <john@metanate.com> wrote:
>
> Commit 15b9ca1641f0 ("drm: Config orientation property if panel provides
> it") added a helper to set the panel panel orientation early but only
> connected this for drm_bridge_connector, which constructs a panel bridge
> with DRM_BRIDGE_ATTACH_NO_CONNECTOR and creates the connector itself.
>
> When the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is not specified and the
> panel_bridge creates its own connector the orientation is not set unless
> the panel does it in .get_modes which is too late and leads to a warning
> splat from __drm_mode_object_add() because the device is already
> registered.
>
> Call the necessary function to set add the orientation property when the
> connector is created so that it is available before the device is
> registered.

I have no huge objection to your patch and it looks OK to me. That
being said, my understanding is that:

1. DRM_BRIDGE_ATTACH_NO_CONNECTOR is "the future" and not using the
flag is "deprecated".

2. In general, if something about the deprecated method used to work
and a patch broke it then we should fix it until we can finish fully
deprecating. However, we should avoid adding new features to the old
deprecated method and instead encourage people to move to "the
future".

3. I don't think any of the orientation patches broke the deprecated
path. Before those patches, nothing used to configure the orientation
property properly. After those patches, "the future" method (AKA
DRM_BRIDGE_ATTACH_NO_CONNECTOR) did configure the orientation property
properly.

...so by those arguments I would say that we shouldn't land your patch
and that instead you should work to get your drivers moving to
DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Now, all that being said, your patch adds one line of code and really
doesn't seem like a big deal. I'd personally be OK with landing it,
but I'd prefer to hear an opinion from someone more senior in the DRM
world before doing so. I'm still fairly low on the totem pole. ;-)


> Fixes: 15b9ca1641f0 ("drm: Config orientation property if panel provides it")

Maybe remove the "Fixes" tag here. That patch didn't break you, right?
It just didn't happen to _also_ fix you.
