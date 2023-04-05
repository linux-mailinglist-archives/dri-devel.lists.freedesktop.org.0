Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611B16D8313
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 18:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB9F10E156;
	Wed,  5 Apr 2023 16:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A2110E156
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 16:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PEOSsUi8JIMvoW7QnnkpkkJijxo4IUuMnZ9vv3EjUhQ=; b=PlcvWllVCZZLIxn7TA0uYZOD2i
 8Timk2idYv+lLO3yZJhWhHPsl92ZREHTEkcZ2uj1e53hz36DkB/efojzcWFV0Na8cR9Qj+10qLhOH
 ta3+36sHegS1o46TQyP99X9cQQUBT/Z1QMqvJ9krER9Ob1/RWq++SuzdzpDHI3Xhy5MHfqna5eIZw
 +3KCwr3As0xZzcRdS0d74nyj+RIivO7MbcvRaGz8ll694eT/OgE8InMgGs8kJwhgkR/6hUQpNlGNz
 Za3hBrO3EltLq0JnttfLThWdO07VZ32OqVzWbWH2mgZNY1LmC2nLtlkLnHo1jx4ghOCQVGFpuJj4L
 hqCUbhxg==;
Received: from ip98-183-112-29.ok.ok.cox.net ([98.183.112.29]:48320
 helo=[192.168.0.134]) by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <david@lechnology.com>) id 1pk5gX-00020w-28;
 Wed, 05 Apr 2023 12:08:34 -0400
Message-ID: <9d163cc7-d7ee-55e8-c01d-a1d4b3b19877@lechnology.com>
Date: Wed, 5 Apr 2023 11:07:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 54/65] clk: da8xx: clk48: Switch to determine_rate
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-54-9a1358472d52@cerno.tech>
 <04f5d305-9992-bcdc-cd54-111eb8254155@lechnology.com>
 <3nyoulu5eba6eyo644crhbtog63jh7vockbp7dz6mxquj2omsn@j56kn6vkbktg>
From: David Lechner <david@lechnology.com>
In-Reply-To: <3nyoulu5eba6eyo644crhbtog63jh7vockbp7dz6mxquj2omsn@j56kn6vkbktg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>,
 linux-tegra@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-rtc@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/5/23 10:22 AM, Maxime Ripard wrote:
> Hi David,
> 
> On Wed, Apr 05, 2023 at 10:03:24AM -0500, David Lechner wrote:
>> On 4/4/23 5:11 AM, Maxime Ripard wrote:
>>> The TI DA8xx USB0 clk48 clocks implements a mux with a set_parent
>>> hook, but doesn't provide a determine_rate implementation.
>>>
>>> This is a bit odd, since set_parent() is there to, as its name implies,
>>> change the parent of a clock. However, the most likely candidate to
>>> trigger that parent change is a call to clk_set_rate(), with
>>> determine_rate() figuring out which parent is the best suited for a
>>> given rate.
>>>
>>
>> As mentioned in my previous review, parent is selected by device
>> tree and should never be changed after init.
> 
> Great minds think alike then, because the driver implements exactly
> that, either before or after that patch.
> 
> That patch makes the current behaviour explicit but doesn't change it in
> any way.
> 
> So I guess that means that I can add your Acked-by on the three patches
> you reviewed with the same message?
> 
> Maxime

Yes, preferably with a simplified commit message.

Acked-by: David Lechner <david@lechnology.com>

