Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2656665E78
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 15:54:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A1D10E752;
	Wed, 11 Jan 2023 14:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26EC10E752
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:54:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C365061D11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310B4C433D2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673448867;
 bh=5991q1wXtvebgUykJ5NYVRTE1uZrMxXzr1nAKepdlS8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LQWeU5VG/JImzmbaXmRaFlNv+qK912ckHmEpaO53u+xu0W9sgAX04JiV6A8YfPmJP
 N3OWRrEDRXNSEvKTRqGIuOiM766jzVF6uiuTGqO6AWsIw/aVdYc/MPVuPhTGl7d65E
 eeHNm3iVs2MF17RBqdS06relccnSyWOo+ii2uUuNPiBHYVpf6CCFOAwaDvzypJTgvc
 9vsxfdvnB0hLoABSrAf0XXq1FkfVQA/0cWZnoxCAfwHRgIkFOWHkxsbCjn5lKaMI2V
 ng4vsvD7+2Az4HuhqyWRHhJB0YPmKpXWx4DTsZMsI93oDh9+KsQMBxARRbUZxSVWDk
 5I1M9waX80yTw==
Received: by mail-pj1-f45.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso20334609pjt.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 06:54:27 -0800 (PST)
X-Gm-Message-State: AFqh2krhwdvRvsUDJU+iviv/w5FhG16RHNWApNU+7kA9NypBliDjxzlI
 gvzdfuM8Fz3bA8SMw9iZyBrfRswGKpKnQNOomg==
X-Google-Smtp-Source: AMrXdXuLjGWkrJgzvCsRL34zMGz/o9XODdn1icG/0kwllXKQUYcQoLyaKOC+UHWHVBhznJfC3GM3r3lDlYFHXzS35BM=
X-Received: by 2002:a1f:1e50:0:b0:3c1:1c3b:c4d9 with SMTP id
 e77-20020a1f1e50000000b003c11c3bc4d9mr9659628vke.19.1673448856184; Wed, 11
 Jan 2023 06:54:16 -0800 (PST)
MIME-Version: 1.0
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
 <20230111113018.459199-2-gregkh@linuxfoundation.org>
In-Reply-To: <20230111113018.459199-2-gregkh@linuxfoundation.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 11 Jan 2023 08:54:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ4QsLym-bQGGjUpzT14MYuTE1n8BQkGn6Ey9NiFF7u7w@mail.gmail.com>
Message-ID: <CAL_JsqJ4QsLym-bQGGjUpzT14MYuTE1n8BQkGn6Ey9NiFF7u7w@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] of: device: make of_device_uevent_modalias()
 take a const device *
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Liang He <windhl@126.com>,
 Zou Wei <zou_wei@huawei.com>, Samuel Holland <samuel@sholland.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Chen-Yu Tsai <wens@csie.org>,
 Corentin Labbe <clabbe@baylibre.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 5:30 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> of_device_uevent_modalias() does not modify the device pointer passed to
> it, so mark it constant.  In order to properly do this, a number of
> busses need to have a modalias function added as they were attempting to
> just point to of_device_uevent_modalias instead of their bus-specific
> modalias function.  This is fine except if the prototype for a bus and
> device type modalias function diverges and then problems could happen.  To
> prevent all of that, just wrap the call to of_device_uevent_modalias()
> directly for each bus and device type individually.

Why not just put the wrapper function in the DT code instead of making
4 copies of it?

Rob
