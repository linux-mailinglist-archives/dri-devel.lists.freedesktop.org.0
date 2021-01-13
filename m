Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D342F450A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 08:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438E089E86;
	Wed, 13 Jan 2021 07:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DCF89E98
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 07:17:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id 5C62D1F455D0
Subject: Re: [PATCH v10 0/4] drm/panfrost: Add support for mt8183 GPU
To: Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20210113060703.3122661-1-drinkcat@chromium.org>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <3fa8f9c5-5956-73fc-e464-4df68a564b64@collabora.com>
Date: Wed, 13 Jan 2021 08:17:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113060703.3122661-1-drinkcat@chromium.org>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/13/21 7:06 AM, Nicolas Boichat wrote:
> Hi!
> 
> Follow-up on the v5 [1], things have gotten significantly
> better in the last 9 months, thanks to the efforts on Bifrost
> support by the Collabora team (and probably others I'm not
> aware of).
> 
> I've been testing this series on a MT8183/kukui device, with a
> chromeos-5.10 kernel [2], and got basic Chromium OS UI up with
> mesa 20.3.2 (lots of artifacts though).

Btw, don't know if you plan to retest with a newer Mesa, but a recent 
master should have pretty good ES 3.0 compliance on the Duet.

Cheers,

Tomeu

> devfreq is currently not supported, as we'll need:
>   - Clock core support for switching the GPU core clock (see 2/4).
>   - Platform-specific handling of the 2-regulator (see 3/4).
> 
> Since the latter is easy to detect, patch 3/4 just disables
> devfreq if the more than one regulator is specified in the
> compatible matching table.
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/cover/20200306041345.259332-1-drinkcat@chromium.org/
> [2] https://crrev.com/c/2608070
> 
> Changes in v10:
>   - Fix the binding to make sure sram-supply property can be provided.
> 
> Changes in v9:
>   - Explain why devfreq needs to be disabled for GPUs with >1
>     regulators.
> 
> Changes in v8:
>   - Use DRM_DEV_INFO instead of ERROR
> 
> Changes in v7:
>   - Fix GPU ID in commit message
>   - Fix GPU ID in commit message
> 
> Changes in v6:
>   - Rebased, actually tested with recent mesa driver.
> 
> Nicolas Boichat (4):
>    dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
>    arm64: dts: mt8183: Add node for the Mali GPU
>    drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
>    drm/panfrost: Add mt8183-mali compatible string
> 
>   .../bindings/gpu/arm,mali-bifrost.yaml        |  28 +++++
>   arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   6 +
>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   6 +
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
>   drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 ++
>   drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
>   6 files changed, 164 insertions(+)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
