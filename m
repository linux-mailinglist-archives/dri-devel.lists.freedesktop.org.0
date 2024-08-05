Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A62947EC6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 17:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C3A10E23F;
	Mon,  5 Aug 2024 15:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jv3c2KKs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF5410E23F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 15:56:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 43EFDCE0B37
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 15:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25919C4AF15
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 15:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722873362;
 bh=O64NYu880rqL2vAe5DF2UI4nW5Vor48k2+RqN8IruA0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jv3c2KKsPC6IBcIZ183Z4DuUuGtTgFi60WgbAsT31qQ+WqoDc4rsGT23F63teohMo
 XpavfzKUCJhiKO5nCGect3NHv2MfhuF7jIWz5tdD77MmWab1NsM4PRNxFom6vac6AC
 /7HWjc1iKW7ClYCdcFNe/fZ5j4pZusTbWG9sHG2mVG8xasTYWDNkWtHKzED8rwFoPg
 V2b6u0vHAzIQH2Db2X7i1I18vjHFixdFYNrFFYkjn7Q3BT/VEObVzuwgF7h9mOhag7
 qtff5UefW1RuzTPm9MYy4e21I3AfM8NhFvbnKcDOQLlG/ywpnnp6IAbMBhAomIUZOm
 l/0XK7vx3cDnA==
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dff1ccdc17bso9054866276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 08:56:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVBUeZpBMNrNpp5YyEfBRMncvwqiQu4xbeJHdwYsy461LAPty1yqOaj0r36qYiyaDFswVLNQhMmvQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yypiu5HDtUlRwC/0y4x0t5vY4zAG3skv2RR9eIMdkyD1wVSGCE7
 puZmydWjc6TZ2WjSztQg6uB8AOUd5GOMAAaLgFRYULidgENWEGn2VbMBUXUCPqq+uJIm8flFJP4
 9T1TUkrsVX314tmoTmRaUWXU//8CxcAhyJTl5Lw==
X-Google-Smtp-Source: AGHT+IFhVEa97W19iJiU4YfGPEHP0NCg+Vunle/l1WsPpRgiBJMInv5bwTpraA29Ri76riqt83eESbiXfRb2/Rp2cf0=
X-Received: by 2002:a05:6902:1003:b0:e0b:fa84:5839 with SMTP id
 3f1490d57ef6-e0bfa845b3dmr9644580276.8.1722873361325; Mon, 05 Aug 2024
 08:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240711-bridge-connector-fix-dbl-free-v1-1-d558b2d0eb93@collabora.com>
 <172130413876.532897.864210015976659933.b4-ty@kernel.org>
 <8d9e8947-5d13-40eb-a887-06a809174fc6@collabora.com>
In-Reply-To: <8d9e8947-5d13-40eb-a887-06a809174fc6@collabora.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 5 Aug 2024 17:55:50 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6Jz0S=B7yzokb5oHmRt1jYot91bMTrBbVBqdjTG88MBA@mail.gmail.com>
Message-ID: <CAN6tsi6Jz0S=B7yzokb5oHmRt1jYot91bMTrBbVBqdjTG88MBA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge-connector: Fix double free in error handling
 paths
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Jul 31, 2024 at 10:03=E2=80=AFPM Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Hi Robert,
>
> On 7/18/24 3:02 PM, Robert Foss wrote:
> > On Thu, 11 Jul 2024 14:26:55 +0300, Cristian Ciocaltea wrote:
> >> The recent switch to drmm allocation in drm_bridge_connector_init() ma=
y
> >> cause double free on bridge_connector in some of the error handling
> >> paths.
> >>
> >> Drop the explicit kfree() calls on bridge_connector.
> >>
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/1] drm/bridge-connector: Fix double free in error handling paths
> >       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Dca5442ed8f=
53
>
> The fix is supposed to reach v6.11 tree, hence wondering if this fall
> through the cracks as it haven't shown up in -rc1, neither in linux-next
> - should have been applied to drm-misc-fixes instead of drm-misc?!

I'm seeing the commit in linux-next.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?qt=
=3Dgrep&q=3Ddrm/bridge-connector:+Fix+double+free+in+error+handling+paths

It was probably submitted to drm-misc-next, and not drm-misc-fixes and
thereby missed 6.11 inclusion. Let me push it to drm-misc-fixes too.


>
> Sorry for the noise if this already follows the regular DRM workflow and
> just needs more time to get picked into the target branches.
>
> Thanks,
> Cristian
>
