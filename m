Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE84DD24C47
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 14:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CB610E75E;
	Thu, 15 Jan 2026 13:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZziHddup";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7336B10E75F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:39:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E35CE44057
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB677C2BCB1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768484395;
 bh=mrAbzAWxr60dAFBMUskJrOYI7tum+hisLhbJRq6FwWM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZziHddupwweaDJHKB4QPDQsEU/zifxtBTtF2Aszv7k8FMgBOh+/UgJZAm7gnsd1+S
 MDMIt6yw5kr4GVTIvjLvwZ83aCmimHfRs2MycQ0LaxXCOlbTGXDE7WGDe3qk5wJaKT
 f3mZBoRADLMYpH3zNxqDPqP37fhA7bVcQqfejpGg/JP8XUBLG5IkYAfY69LAFlJYto
 R7rUd/c2gDx1L9Cxfz1FWsXRrq5jUj9JNFUVvxXWYvHSZi90APdQ9EXkKROIHzdIcW
 AkdjWGIc3kFueo2+WypYz4CQcUlpvaT3nR/PWMddvha6Rj+Gxo73nI8xHRrJYUzKXe
 RHqgjzNs+h5lg==
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-7cfd8ca8191so186379a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 05:39:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXHr2LJmVXQd/wAd5JU7OZLDlCFkMaDcQ2uYyhADcijbZMxQ5CElVlD87Cjgfey7ewNQYR2eYvZ6e4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHupgUUhjYUnEFOA0kiC0Jfz0o3v4lN5aIR1uiTABlrOiE/9ES
 WyRpPB0wnqcKmzQ5nAuQsBHeJOCxRdiLgJnW3LqUKcyibzMhBMvQbmqysDxqpw44A7J9hRUDMxA
 HdkyGtliYhK98DDrVeF02euA1dNrEvOc=
X-Received: by 2002:a05:6820:229b:b0:660:fd8d:9567 with SMTP id
 006d021491bc7-661006caf58mr4486708eaf.42.1768484394669; Thu, 15 Jan 2026
 05:39:54 -0800 (PST)
MIME-Version: 1.0
References: <2256082.irdbgypaU6@rafael.j.wysocki>
 <CAJZ5v0gdj6Oe=LSJX8+6JbxTt42W3RkabLDWh=VqEkjUvAWxow@mail.gmail.com>
 <aWjbPpkDd_SORcfC@e142607>
In-Reply-To: <aWjbPpkDd_SORcfC@e142607>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 15 Jan 2026 14:39:43 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0i+uXsCRk7kxLb8t+96k-SOJY-wEwNvYBXTdMKWSCdR9w@mail.gmail.com>
X-Gm-Features: AZwV_QjYJ0BHmX3LmoNRKoKvX64bvSOuZN1goYZbg_jJwN3xZNHgDMdAG5htFnI
Message-ID: <CAJZ5v0i+uXsCRk7kxLb8t+96k-SOJY-wEwNvYBXTdMKWSCdR9w@mail.gmail.com>
Subject: Re: [RESEND][PATCH v1] drm: Discard pm_runtime_put() return value
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, imx@lists.linux.dev, 
 LKML <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 dri-devel@lists.freedesktop.org
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

On Thu, Jan 15, 2026 at 1:20=E2=80=AFPM Liviu Dudau <liviu.dudau@arm.com> w=
rote:
>
> On Wed, Jan 14, 2026 at 01:03:25PM +0100, Rafael J. Wysocki wrote:
> > On Thu, Jan 8, 2026 at 4:38=E2=80=AFPM Rafael J. Wysocki <rafael@kernel=
.org> wrote:
> > >
> > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > >
> > > Multiple DRM drivers use the pm_runtime_put() return value for printi=
ng
> > > debug or even error messages and all of those messages are at least
> > > somewhat misleading.
> > >
> > > Returning an error code from pm_runtime_put() merely means that it ha=
s
> > > not queued up a work item to check whether or not the device can be
> > > suspended and there are many perfectly valid situations in which that
> > > can happen, like after writing "on" to the devices' runtime PM "contr=
ol"
> > > attribute in sysfs for one example.  It also happens when the kernel
> > > has been configured with CONFIG_PM unset.
> > >
> > > For this reason, modify all of those drivers to simply discard the
> > > pm_runtime_put() return value which is what they should be doing.
> > >
> > > This will facilitate a planned change of the pm_runtime_put() return
> > > type to void in the future.
> > >
> > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> > > ---
> > >
> > > This patch is requisite for converting pm_runtime_put() into a void
> > > function.
> > >
> > > If you decide to pick it up, please let me know.
> > >
> > > Otherwise, an ACK or equivalent will be appreciated, but also the lac=
k
> > > of specific criticism will be eventually regarded as consent.
> > >
> > > Originally posted here:
> > >
> > > https://lore.kernel.org/linux-pm/3045480.e9J7NaK4W3@rafael.j.wysocki/
> >
> > This is the last patch from the "discard pm_runtime_put() return
> > values" lot that has not been applied yet, AFAICS, so this is the last
> > call for objections or concerns related to it.
>
> I think you can go ahead and apply it, I don't see how the imx8 driver wi=
ll
> be affected by the lack of debug messages.

Applied then, thanks!
