Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B2515139F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 01:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B186E4FF;
	Tue,  4 Feb 2020 00:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685C46E4FF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 00:22:11 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id 59so6069617uap.12
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 16:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6JzKdfECxoshT8PyZexTPl31WOYvekoaoJj1TOgyVRs=;
 b=VkXItU6SO3y2jWpMgCyH42sXvEkyaTeh7YrrJfXF10BOcoXkCJ07Xp/sSFGgoieUEN
 +V5ilf5JGQ2XKWjmGM25z+sABorUTNDDAdbRINCgG1mOjZ8gzmi8zvvFPMBq73lJfdmx
 XeN3dmpIlgZJwRgq3xz1Ifi9Gfj4iWJZ4xreI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6JzKdfECxoshT8PyZexTPl31WOYvekoaoJj1TOgyVRs=;
 b=l9AUUff1Qx8M9ps7IFmrjvGesWyIDEnH7WMXn4shUtAs83D+6SKxioEobWobFjt4Tu
 PeSy8zmuWyCoF393trVmdrC9UF4oX+m3xUN8x9D9Vy9R4cO7cFyMWR0/XkatjpQ3i/xN
 hVHlyV4LB3dVoLTMKtK15rUtye3ualKNRjg0n3fF7Yk8UslfZx9ug4jyT1WeV5YbSge/
 /3XLCTSlIKkBg/qhJO1szKGZ4wY3x0FKxfYtw7BPyirmJ0Bcq0io27HP3GUzsmasDDAF
 JMV/XQm2X1TQSfz2xpBn3pi3AQ7sDtUaK5eu5ALvoaADliG5+F1CJDqBl8iTViuhTgpr
 Fnwg==
X-Gm-Message-State: APjAAAU5rQVuU8PrOag7VZOlG+7SFEeNAWP05BprIipK2FdwoGigxHUI
 V/AAWVafCfH3UM9/qGCjn6h+/UrMcRw=
X-Google-Smtp-Source: APXvYqz+V2Kh0m7NHHnQiMbUJ9Id0GamFA4oaYcG4onj0UFthDiaGaFGngEvI4CERGpF+FtKzOizyQ==
X-Received: by 2002:ab0:488b:: with SMTP id x11mr15711115uac.86.1580775730094; 
 Mon, 03 Feb 2020 16:22:10 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53])
 by smtp.gmail.com with ESMTPSA id g26sm6744732vkl.16.2020.02.03.16.22.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2020 16:22:09 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id n27so10259839vsa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 16:22:09 -0800 (PST)
X-Received: by 2002:a67:fbcb:: with SMTP id o11mr16294171vsr.109.1580775728583; 
 Mon, 03 Feb 2020 16:22:08 -0800 (PST)
MIME-Version: 1.0
References: <20191218223530.253106-1-dianders@chromium.org>
 <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
 <20200203233711.GF311651@builder>
In-Reply-To: <20200203233711.GF311651@builder>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 3 Feb 2020 16:21:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VTKfv93BiNRYBxWg8o8YKrQy3Z85MzR8XFr=GCS5xhdg@mail.gmail.com>
Message-ID: <CAD=FV=VTKfv93BiNRYBxWg8o8YKrQy3Z85MzR8XFr=GCS5xhdg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andrzej / Neil,

On Mon, Feb 3, 2020 at 3:37 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 18 Dec 14:35 PST 2019, Douglas Anderson wrote:
>
> > The current bridge driver always forced us to use 24 bits per pixel
> > over the DP link.  This is a waste if you are hooked up to a panel
> > that only supports 6 bits per color or fewer, since in that case you
> > ran run at 18 bits per pixel and thus end up at a lower DP clock rate.
>
> s/ran/can/

I'm going to make the assumption that you can fix this typo when
applying the patch and I'm not planning to send a v4.  If that's not a
good assumption then please yell.

Thanks!

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
