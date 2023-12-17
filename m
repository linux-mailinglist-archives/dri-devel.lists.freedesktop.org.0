Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF5C815D0B
	for <lists+dri-devel@lfdr.de>; Sun, 17 Dec 2023 02:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2242510E03A;
	Sun, 17 Dec 2023 01:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C6510E03A
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Dec 2023 01:37:58 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2cc6a52231cso1647551fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 17:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702777017; x=1703381817;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=k4WycKPSFzunUdkSJRY1N3XmhnoQWoEYL5xkeoe24vI=;
 b=DI1FhWdLBngHQJHlHx4QFJMzSS3coPw0YbVcnHLsdhZ5mo9upg7Kk1RyoLNrZ0dLrT
 +U/J4QFjaX0WzCx/2e18yu9+nF3Nd93TM9gs0RtXrMSPkcuIEryFAL+qWg2Zyn1Zw6rY
 VNjDRqLKLXGM8fM04q7EENVBQJGWymxRfjOJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702777017; x=1703381817;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k4WycKPSFzunUdkSJRY1N3XmhnoQWoEYL5xkeoe24vI=;
 b=YO5WLxzX6RrvJrw+IhUqgOKyn7VHDaW5a/BHcCRtsNkuVYHrA+TIUPdARLz08HELVP
 DdSYLQl53sf/oMfYed2aRLjba9BFNy6sJdRzjkrjqj8WF831q9tQKgJ+XUDsCRoByQtF
 D/frbCmbTuZALWVfckHZ7uWk/LfUGGzSBimrJIE5rkreu1SaOFwjJN5ZSUh/dDKLR1rO
 eo9wIO5B5YrWYtsgE+qWScdcQF02eMfGv3JaJezVTZqaphWZMhL0uEc8YvI3pXXYEfLu
 m0VUsb1hLtehlFLDDOw58niJRSDdsA2Sg/uqvRu2xNVcCiGaN93MBiF8QEq2QmLCAyyJ
 IaFg==
X-Gm-Message-State: AOJu0YwFzw7oujKyAxDryO7bj5QFQ6cLBPKrrM8UAstDhfPpfHc3SAj+
 iec6kX0tJJcPUglAsgESGGRz5daqrdNDjf4oW2RJhQ1/ml+/Knv7
X-Google-Smtp-Source: AGHT+IFO9xNmf66MdIUeGEiEWBXaFelFHf4mK55JIAy/3AVccBXR5tgQMzTNwFyMQT05VUEWPQ2FtQBbNhcIVJ+J328=
X-Received: by 2002:a05:6512:33c2:b0:50e:1a9f:3c36 with SMTP id
 d2-20020a05651233c200b0050e1a9f3c36mr2788651lfg.15.1702775176464; Sat, 16 Dec
 2023 17:06:16 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 Dec 2023 01:06:16 +0000
MIME-Version: 1.0
In-Reply-To: <20231214123752.v3.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
References: <20231214123752.v3.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Sun, 17 Dec 2023 01:06:16 +0000
Message-ID: <CAE-0n51EkQt2FbwJUaXqkohwEGRzZ1qYw8c3+cY3o_ubj+YN2w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/bridge: parade-ps8640: Never store more than
 msg->size bytes in AUX xfer
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philip Chen <philipchen@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2023-12-14 12:37:51)
> While testing, I happened to notice a random crash that looked like:
>
>   Kernel panic - not syncing: stack-protector:
>   Kernel stack is corrupted in: drm_dp_dpcd_probe+0x120/0x120
>
> Analysis of drm_dp_dpcd_probe() shows that we pass in a 1-byte buffer
> (allocated on the stack) to the aux->transfer() function. Presumably
> if the aux->transfer() writes more than one byte to this buffer then
> we're in a bad shape.
>
> Dropping into kgdb, I noticed that "aux->transfer" pointed at
> ps8640_aux_transfer().
>
> Reading through ps8640_aux_transfer(), I can see that there are cases
> where it could write more bytes to msg->buffer than were specified by
> msg->size. This could happen if the hardware reported back something
> bogus to us. Let's fix this so we never write more than msg->size
> bytes. We'll still read all the bytes from the hardware just in case
> the hardware requires it since the aux transfer data comes through an
> auto-incrementing register.
>
> NOTE: I have no actual way to reproduce this issue but it seems likely
> this is what was happening in the crash I looked at.
>
> Fixes: 13afcdd7277e ("drm/bridge: parade-ps8640: Add support for AUX channel")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
