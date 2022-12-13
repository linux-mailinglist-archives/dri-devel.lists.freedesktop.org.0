Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4180964B5E2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 14:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FDD10E1E9;
	Tue, 13 Dec 2022 13:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBACA10E1E9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 13:15:06 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D55608533E;
 Tue, 13 Dec 2022 14:14:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670937263;
 bh=j03ncAA0tG8TF0iB5bopl5ZAGLU9hl33eZyKXlnmV8I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EpVqyvS2Hhhmpz02BneS3V7HI9TEHIQWK3hgVXeG17RMLLhF6AToSrv4atTOkWgsq
 QarfQUMzXVrHzQyVwQ3aUIWr5asydgIGhg53q/Cllv0AE2GftQul7cdiU1AUDlwfM6
 WAsClBEZqMJo5uFaTy0TCkATs0TRYMvHDEzpAMqgdY3olLJ+jwXrMFsB2bWU6sRreY
 yidBRcCvIxzYmejhHnTFZ1RQWek6kipqNA1UT0vN6N0wBkOXn75+HixUnJdK4Cqvy2
 2hu3k4ETrZKukHgvS8ntb4uO0VYSjZBQ4ppE6ORVkxu6PATqIs4J94aTeOOqpzeBiM
 /dV5dvS8L3DEg==
Message-ID: <9913c39b-5a52-0b45-eed7-4bdc860aa877@denx.de>
Date: Tue, 13 Dec 2022 14:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host for
 first DSI transfer
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Fabio Estevam <festevam@gmail.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com>
 <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
 <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
 <b1e38212-985c-21c9-58a5-7504719c3af8@samsung.com>
 <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
 <CAMty3ZBzpmwAV7e7wdBu+GOmg6M7xqqc46QtGzuLsnv2kT0Zdw@mail.gmail.com>
 <395a4762-70fe-1caf-579f-2b5952232470@samsung.com>
 <CAMty3ZABHUjSHRBR6RCnyE19HOWknw67s__0WBKgMnX5nQBy9w@mail.gmail.com>
 <CAOMZO5CPfgYUhXO_JZJvVBoFpddw+LHbd58a2TzPd2nWjzx_rg@mail.gmail.com>
 <CAMty3ZD6fVps-PE=iNR2Zr0_qz--h4wcjO5Wa1czA7w7VN2SqQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZD6fVps-PE=iNR2Zr0_qz--h4wcjO5Wa1czA7w7VN2SqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Matteo Lisi <matteo.lisi@engicam.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/13/22 11:53, Jagan Teki wrote:
> Hi Fabio,

Hi,

> On Tue, Dec 13, 2022 at 4:17 PM Fabio Estevam <festevam@gmail.com> wrote:
>>
>> Hi Jagan,
>>
>> On Tue, Dec 13, 2022 at 7:40 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>>
>>> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
>>
>> Please preserve the authorship of the patches.
>>
>> This one is from Marek Vasut:
>> https://gitlab.com/openedev/kernel/-/commit/e244fa552402caebcf48cd6710fd387429f7f680
> 
> The original patch was changed with respect to this one and that is
> the reason I have to keep his signed-off-by.

You did change the authorship of the patch, not just a SoB line.
It seems that the only change is dropped comment, which was squashed 
into earlier patch in this series, see the original submission:

https://patchwork.freedesktop.org/patch/507166/

btw. it seems hunk 3 has disappeared, the samsung_dsim_attach() hw_type 
check.
