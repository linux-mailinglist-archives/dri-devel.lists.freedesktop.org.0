Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B96E87707D
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 11:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E42310EC90;
	Sat,  9 Mar 2024 10:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UCmfrTP7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB4510EC90
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 10:40:11 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-d9b9adaf291so1580961276.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 02:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709980810; x=1710585610; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NP3cQDF260viwDSlbauqEdXoECn6VqXHgFbcF4uWnK8=;
 b=UCmfrTP7HYO5wyo46I6ajmiYbbPTb1zewuB/5nwd8BpbeJEv30AHIb4YqDvnriDWLR
 NM6v33MzcUqojwC0v8LiDY20VPcJ4P/4MoorjkOznave3WBw+MMa0HbcKrpOI+23BLHy
 wbOKuH6a9W8p6L7mEI22q8Rh4qu/qvDN1bMgaKf+HIR6MfY8qqGV4n/KoihSsGPomez7
 bOnoLqaLZ85/n9d+KIgjF8zFHWtvqO4hZcBfr9o4QA1P5C1eu+/Lzewi9TEoOkG1T2jY
 cPVyS5niyoSBrMuJRGENXd/h5GTPzrR33WAoBHWxE4LefNrlFFRfHrZRYVt6tTL17+YD
 nu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709980810; x=1710585610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NP3cQDF260viwDSlbauqEdXoECn6VqXHgFbcF4uWnK8=;
 b=VSyDfBdN2EmxRrqj+2Llsyf0viUf7Hiq2GLc1hQlAoDUxs1k7EB96Fn60SydKmh+jS
 jh/DH3/FQ5TzcMRHN01NK6v+VDcbmjBHUwfLcX8tm1fpHFEWE55FdhuRXTrPBPzl/3xW
 HEGKxtoBBgkESs+Aa9CWoailblYz5bAAaeDF4LQssf5b41H+BXwaG6b0duhLYdVOT3hC
 lWv/IXxtkReYW8d3VkYedb3OXAacAmkMhoKcv/r8nOvl9BjLKtZhnq1AMBjOgrlbxd8l
 B+NHL+SFa5/oTNaxLX+0mrg5NFUyXjCl/Pof91l1Bj0L0pjITnBCdCCwTWJ3Xk2ae3tz
 0PcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV31cZgXW3ElLcSeQj+bIriSLxM5M53g8MxfxXuynoTi2271mVNf9KC+EDBnWKbTWFCaCb/1nrv6WuCU25InYvT+Dbg9MOGhcNClSFlPqan
X-Gm-Message-State: AOJu0Yxbk3kOjvmtbVpDmVWzCq48JJRxJuzI6YVLgM8eb56AEZcqD6Y8
 18G0OezJqOTllJxbH8VYChP8yuWfcu23v5qMi4JeQLkFXrpSCEMdg/lLbibfPEfrINsQh4Rt19Q
 CYsngSi/PijcRoPBO2/Os4b01b8N1uA+Z888tgQ==
X-Google-Smtp-Source: AGHT+IEJwcizfo5A8gfKqIygwwbgsE2Tdi29/QzTZ5gb8cld1hDMTE9LBt/lM02SHJSSn4cViiX35Os1mROyOKGXZFA=
X-Received: by 2002:a25:874c:0:b0:dc7:4460:878a with SMTP id
 e12-20020a25874c000000b00dc74460878amr855917ybn.3.1709980810558; Sat, 09 Mar
 2024 02:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20240307172334.1753343-1-sui.jingfeng@linux.dev>
 <20240307172334.1753343-2-sui.jingfeng@linux.dev>
 <CAA8EJpp8tsHi0RhsJXG+r6nOsV3AUC_n6jNHL0Cr6Ku2h3NMog@mail.gmail.com>
 <45f59f31-1f03-4a96-adb6-25c7cdd5e8a1@linux.dev>
 <CAA8EJpqq1-cEke6wEFZFDnpz4tFBcL6HF3=Qtf-8Q3WbogLS8A@mail.gmail.com>
 <c84fcdba-af50-4212-a8e3-f492c2b02ce4@linux.dev>
 <CAA8EJppTcPO3j7GpGcGbKPUjQ=3rTMMOrU1SYR3mtkWLztf2qQ@mail.gmail.com>
 <7535b3ba-6bbb-411c-82a4-cd4ac45de1a6@linux.dev>
In-Reply-To: <7535b3ba-6bbb-411c-82a4-cd4ac45de1a6@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Mar 2024 12:39:59 +0200
Message-ID: <CAA8EJpp3yd33pYweL_exrXMJ3g-m7-yjJrjiVMVMevOadBtt8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/bridge: Add fwnode based helpers to get the
 next bridge
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Phong LE <ple@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, 9 Mar 2024 at 11:33, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
>
> On 2024/3/8 04:40, Dmitry Baryshkov wrote:
> >>> But really, there is nothing so hard about it:
> >>> - Change of_node to fw_node, apply an automatic patch changing this i=
n
> >>> bridge drivers.
> >>> - Make drm_of_bridge functions convert passed of_node and comp
> >>>
> >>> After this we can start cleaning up bridge drivers to use fw_node API
> >>> natively as you did in your patches 2-4.
> >> Yes, it's not so hard. But I'm a little busy due to other downstream d=
eveloping
> >> tasks. Sorry, very sorry!
> >>
> >> During the talk with you, I observed that you are very good at fwnode =
domain.
> >> Are you willing to help the community to do something? For example, cu=
rrently
> >> the modern drm bridge framework is corrupted by legacy implement, is i=
t possible
> >> for us to migrate them to modern? Instead of rotting there? such as th=
e lontium-lt9611uxc.c
> >> which create a drm connector manually, not modernized yet and it's DT =
dependent.
> >> So, there are a lot things to do.
> > Actually, lontium-lt9611uxc.c does both of that =F0=9F=98=89 It support=
s
> > creating a connector and it as well supports attaching to a chain
> > without creating a connector. Pretty nice, isn't it?
>
>
> But why the drm_bridge_connector helpers and/or the drm_connector bridge =
can't suit you need?
> Coding this way just add boilerplate into drm bridge subsystem, right?

Because there are platforms, like iMX LCDIF which can use the
lt9611uxc bridge, but do not make use of the drm_bridge_connector yet.

> The code path of "creating a connector" plus the code path of "not creati=
ng a connector"
> forms a 'side-by-side' implementation imo.
>
> Besides, I have repeated many times: the DT already speak everything.
> Device drivers can completely know if there is a display connector OF dev=
ice created and how many
> display bridges in the whole chain. If there are connector device node in=
 the DT, then it should
> has a device driver bound to it(instead of create it manually) for a perf=
ect implementation. As
> you told me we should not *over play* the device-driver model, right?

Please, don't mix the connector node in DT and the drm_connector. If
you check the code, you will see that the driver for hdmi-connector,
dp-connector and other such devices creates a drm_bridge.

--=20
With best wishes
Dmitry
