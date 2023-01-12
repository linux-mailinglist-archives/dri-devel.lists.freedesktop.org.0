Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 831E366702B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 11:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E242510E199;
	Thu, 12 Jan 2023 10:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2778810E181
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 10:48:41 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230112104839euoutp029672ed9ff23805511db68805281676d8~5igung9He1883718837euoutp028
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 10:48:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230112104839euoutp029672ed9ff23805511db68805281676d8~5igung9He1883718837euoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673520519;
 bh=79Ba/yX7N4skoomyF3EMjwUuSdgVUQgkCvbj9yiw4Gg=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=qLH2fItdRfyaxd0xhhMESauZoup0Pedje5qf+uHrWrvGmPu0CME628Dzs7t6UkQ5j
 AlrlJ8hBWqxa8tZ3jNg4uuzgXUDXVxa9DiMioLnTEvMYsuamqrRTtPUlR6srg4nzgU
 Fi8hu9pffVM8PLB5w5Agq6oM69oURVBzB6YTd3DE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230112104838eucas1p13c4ff844fa434de443d5dc82d7e43c76~5iguJyZC70782607826eucas1p1E;
 Thu, 12 Jan 2023 10:48:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id EF.74.43884.685EFB36; Thu, 12
 Jan 2023 10:48:38 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230112104837eucas1p1175552b28e3fb5fdc05467a9e40c5ecc~5igtZOOzj1412714127eucas1p1-;
 Thu, 12 Jan 2023 10:48:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230112104837eusmtrp14ea19a13ff4cebcc124832ce372382f7~5igtYTJLU0323503235eusmtrp1K;
 Thu, 12 Jan 2023 10:48:37 +0000 (GMT)
X-AuditID: cbfec7f5-25bff7000000ab6c-f3-63bfe586e234
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 63.FB.52424.585EFB36; Thu, 12
 Jan 2023 10:48:37 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230112104836eusmtip1c9276f1e75546de975814cc8bcb1179e~5igsP4R631232112321eusmtip1O;
 Thu, 12 Jan 2023 10:48:36 +0000 (GMT)
Message-ID: <8dda3dcc-6204-d3f2-f551-c4a4a2a00051@samsung.com>
Date: Thu, 12 Jan 2023 11:48:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [v3,3/7] drm/bridge_connector: rely on drm_kms_helper_poll_*
 for HPD enablement
Content-Language: en-US
To: neil.armstrong@linaro.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Laurentiu Palcu
 <laurentiu.palcu@oss.nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Philipp
 Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team
 <linux-imx@nxp.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Tomi Valkeinen
 <tomba@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <c7a6714c-edcc-fa1c-ff83-2e066c7bbd84@linaro.org>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJJsWRmVeSWpSXmKPExsWy7djP87ptT/cnG8z6p2Jx4voiJov/2yYy
 W0w8/5PN4srX92wWD6/6W8x5fpbRYtXUnSwWD+beZLLY+XUPi8WC2dwWmx5fY7WYuP8su0XX
 r5XMFgs/bmWxaOtcxmrxfuctRou7906wWLw5OIHV4vnCH8wWf7dvYrG4O/kIo8WLLeIW726u
 YLbY8mYiq4OEx95vC1g8ds66y+6xaVUnm8eda3vYPOadDPS4332cyWPzknqPje92MHk8OrKb
 xaP/r4HH8V232D0m7qnz2Hy62uPzJrkAvigum5TUnMyy1CJ9uwSujEcvXjEWfBGveDzpFmsD
 43qRLkZODgkBE4nFL/qYuhi5OIQEVjBKfL7QwQLhfGGU6G27wwbhfGaU+LS+hRWm5cGz/1CJ
 5YwS5699Z4dwPjJKHPt8gQmkilfATuLMurlAVRwcLAKqEpPn1kCEBSVOznzCAhIWFUiR2PSn
 DCQsLBAncf7YE0YQm1lAXOLWk/lgJ4kIfGGVeHHgEpjDLLCBUaLz5S6w+WwChhJdb7vYQGxO
 oF1fr31gh+iWl2jeOpsZpEFCYCqXxImT95ggznaR2NF4lxHCFpZ4dXwLO4QtI3F6cg8LREM7
 o8SC3/eZIJwJjBINz29BdVhL3Dn3C+wdZgFNifW79CHCjhIX/j4BC0sI8EnceCsIcQSfxKRt
 05khwrwSHW1CENVqErOOr4Nbe/DCJeYJjEqzkMJlFlIAzELyziyEvQsYWVYxiqeWFuempxYb
 56WW6xUn5haX5qXrJefnbmIEpt7T/45/3cG44tVHvUOMTByMhxglOJiVRHj3HN2fLMSbklhZ
 lVqUH19UmpNafIhRmoNFSZx3xtb5yUIC6YklqdmpqQWpRTBZJg5OqQamhTmLXy1QzJ8TXLdU
 JVHZyLOiyrp148p6preLGy+uLBYzUv+ud/lkzzsfmct7fwX2mM8qEp65lbPrn8x3pqZEbpu/
 F1aabXlVf0lT5UjVXPuk2Plil7xnhqqu1761cHF3luH/W1q5ElMnXTDyqr2tOCv0cPV3veQd
 lvKaB9t6z3zYm2Crs6uzen2utuh8x6lrrZRcZpTvCIx5/rHd1e/utY9ZaryLphYxxZ3a8n86
 F7/1i/NnlnhuNO883WKdvCo06Lm5VpW8t4v23OBpx8IfzrhosS1jcnfQZnPxKdf4433uNf/s
 yDJh7dqxz32zlb9Wo6FAhPSHypT3aQp7LX/fkE349CNwQ+LngF9HH+xUYinOSDTUYi4qTgQA
 xCtwQSwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsVy+t/xu7qtT/cnGxzYrm1x4voiJov/2yYy
 W0w8/5PN4srX92wWD6/6W8x5fpbRYtXUnSwWD+beZLLY+XUPi8WC2dwWmx5fY7WYuP8su0XX
 r5XMFgs/bmWxaOtcxmrxfuctRou7906wWLw5OIHV4vnCH8wWf7dvYrG4O/kIo8WLLeIW726u
 YLbY8mYiq4OEx95vC1g8ds66y+6xaVUnm8eda3vYPOadDPS4332cyWPzknqPje92MHk8OrKb
 xaP/r4HH8V232D0m7qnz2Hy62uPzJrkAvig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1D
 Y/NYKyNTJX07m5TUnMyy1CJ9uwS9jEcvXjEWfBGveDzpFmsD43qRLkZODgkBE4kHz/6zdTFy
 cQgJLGWUaJu3ix0iISNxcloDK4QtLPHnWhdU0XtGibt7d4AleAXsJM6smwuU4OBgEVCVmDy3
 BiIsKHFy5hMWEFtUIEWi+flJsHJhgTiJkz82g8WZBcQlbj2ZzwQyU0TgG6vEuglLWUAcZoEN
 jBLnVn9jgtj2j1Fi4tomsJPYBAwlut6CnMHJwQm0+eu1D+wQo8wkurZ2MULY8hLNW2czT2AU
 moXkkllINs5C0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgclm27GfW3Ywrnz1
 Ue8QIxMH4yFGCQ5mJRHePUf3JwvxpiRWVqUW5ccXleakFh9iNAWGxkRmKdHkfGC6yyuJNzQz
 MDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRqYMpWUV/w7yIru8DSN63n77F6
 TQ64yrt63weOw+IvLhQffLLKUYutvWUHy6I22XSjx/INNRUXfPOvZu1wPL9AudPDWdtEdCpf
 euSqv/oH589IvbLnYc/twgzfKXXV7xOnT1jWtL2M84WKHaPT/piwfbXO/KfFJNu61n/tWapV
 w/Txj5gkl8yGPMVF3/9s5TFjvv64p3xlerL4ikf228o7V937fEbG7ujDe4t8fnvyahUnRs5/
 4KO6+cxE1851ptFBBQ5vHrnJvly/7Wp01t5DU47YtuezmZUKrrPfzyzzlCP9TuK8hdGzAp6K
 HX/jamBbIXlEvNfaZ5nc9NCnf1OEWGbldgvNqgxco+C24JDfGyWW4oxEQy3mouJEAGgkBwu/
 AwAA
X-CMS-MailID: 20230112104837eucas1p1175552b28e3fb5fdc05467a9e40c5ecc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230111124140eucas1p21242c8b4cb0fc8a994d66827ca76a3ee
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230111124140eucas1p21242c8b4cb0fc8a994d66827ca76a3ee
References: <20221102180705.459294-4-dmitry.baryshkov@linaro.org>
 <CGME20230111124140eucas1p21242c8b4cb0fc8a994d66827ca76a3ee@eucas1p2.samsung.com>
 <a3f59ce3-8426-2af0-4663-ee948490d75c@samsung.com>
 <c7a6714c-edcc-fa1c-ff83-2e066c7bbd84@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On 12.01.2023 10:35, Neil Armstrong wrote:
> On 11/01/2023 13:41, Marek Szyprowski wrote:
>> On 02.11.2022 19:07, Dmitry Baryshkov wrote:
>>> Use drm_connector's helpers enable_hpd and disable_hpd to enable and
>>> disable HPD automatically by the means of drm_kms_helper_poll_*
>>> functions. As the drm_bridge_connector_enable_hpd() and
>>> drm_bridge_connector_disable_hpd() functions are now unused, replace
>>> them with stubs to ease driver migration.
>>>
>>> Enabling the HPD from drm_bridge_connector_init() can happen too early,
>>> before the driver is prepared to handle HPD events. As the
>>> drm_bridge_connector_enable_hpd() is empty anyway, drop this call
>>> anyway.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> This patch, merged to recent linux-next as commit 92d755d8f13b
>> ("drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD
>> enablement"), triggers the following warning on all my Amlogic Meson
>> based boards:
>>
>> ------------[ cut here ]------------
>> Hot plug detection already enabled
>> WARNING: CPU: 2 PID: 285 at drivers/gpu/drm/drm_bridge.c:1257
>> drm_bridge_hpd_enable+0x90/0xa0
>> Modules linked in: snd_soc_meson_axg_frddr snd_soc_meson_axg_fifo
>> dwmac_generic panfrost(+) reset_meson_audio_arb(+) drm_shmem_helper
>> meson_dw_hdmi(+) dw_hdmi rc_odroid drm_display_helper meson_ir(+)
>> gpu_sched meson_rng rng_core meson_gxbb_wdt crct10dif_ce dwmac_meson8b
>> stmmac_platform snd_soc_meson_axg_sound_card snd_soc_meson_card_utils
>> mdio_mux_meson_g12a stmmac meson_drm pwm_meson pcs_xpcs meson_canvas
>> snd_soc_meson_axg_tdm_interface rtc_meson_vrtc
>> snd_soc_meson_axg_tdm_formatter nvmem_meson_efuse display_connector
>> CPU: 2 PID: 285 Comm: systemd-udevd Not tainted 6.1.0-rc6+ #13236
>> Hardware name: Hardkernel ODROID-C4 (DT)
>> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : drm_bridge_hpd_enable+0x90/0xa0
>> lr : drm_bridge_hpd_enable+0x90/0xa0
>> ...
>> Call trace:
>>    drm_bridge_hpd_enable+0x90/0xa0
>>    _drm_bridge_connector_enable_hpd+0x24/0x34
>
> Weird because _drm_bridge_connector_enable_hpd() has been removed with
> 4c00ac500d0e ("drm/bridge_connector: drop 
> drm_bridge_connector_en/disable_hpd()")

The above log has been captured at commit 92d755d8f13b during bisecting, 
so 4c00ac500d0e is not applied yet. Maybe I should have mention that. 
The issue on top of linux-next is similar.

>
>>  drm_kms_helper_poll_enable.part.0+0x50/0xd0
>
> It seems drm_kms_helper_poll_enable is called again by
> drm_helper_probe_single_connector_modes() because poll_running isn't set.
>
> Can you try with this change:

This fixes the issue on top of linux next-20230112. Thanks! Feel free to 
add if you plan to submit it as a formal patch:

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

