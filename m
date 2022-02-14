Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EE54B506D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 13:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C0510E358;
	Mon, 14 Feb 2022 12:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D03E10E351
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 12:43:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5197F1F4384F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644842626;
 bh=IvY7iJXZuxVISQOzxTkzNan7PoRvkvKAMjY1GwjciqA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QXQIDpL+wlcUJSteZlDsqVfHd73wuzzjWwwDOoEFCt2econPievKZC/1oAO4p4kkI
 Rw0W4lQ4fe47IkCH0j3J7XacuvmspOj0yZSG9NV+mDcZObophnvnWKosO5kKLfQwm3
 SWAdkas796uUKoJn8PJauQoPFyK5U8w5KJ3m+CU2UpSPLH405q5Ic07RMybfGVeKGx
 Zu/Wuog64S0en+WH1eYPiERDOEAEa/CdYr+Mo1tNNKxMzpwGwSrX70H/haQC71JmtV
 s4VHzu3D1EW9XrQAYjzaDOn4GDiDAq5z6BzvHwQs/m4bKByE40tK8IXG8QvPNiSZj1
 qorX5LpeI+OsA==
Message-ID: <67b2e6e8-e4fe-06ca-3d12-9bba83743989@collabora.com>
Date: Mon, 14 Feb 2022 13:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 20/23] ASoC: codecs: wcd938x: Make use of the helper
 component_compare/release_of
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Yong Wu <yong.wu@mediatek.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
 <20220214060819.7334-21-yong.wu@mediatek.com>
 <YgpNqLQzpx4J6d8K@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YgpNqLQzpx4J6d8K@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, Takashi Iwai <tiwai@suse.com>,
 James Wang <james.qian.wang@arm.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 14/02/22 13:40, Mark Brown ha scritto:
> On Mon, Feb 14, 2022 at 02:08:16PM +0800, Yong Wu wrote:
>> Use the common compare/release helpers from component.
> 
> What's the story with dependencies here?  I've just got this one patch
> with no cover letter...

Hello Mark,
I agree, the cover letter should be sent to everyone; Yong, please add the
proper Ccs to it next time.

Anyway, context:
https://patchwork.kernel.org/project/linux-mediatek/cover/20220214060819.7334-1-yong.wu@mediatek.com/

Cheers,
Angelo
