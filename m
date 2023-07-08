Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0552874BF05
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 21:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FB110E025;
	Sat,  8 Jul 2023 19:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 14806 seconds by postgrey-1.36 at gabe;
 Sat, 08 Jul 2023 19:47:48 UTC
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E6F10E025;
 Sat,  8 Jul 2023 19:47:48 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2FFE3857D5;
 Sat,  8 Jul 2023 21:47:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1688845666;
 bh=B6m3KXWyvChAYfRvxzC5qi1nQeSeMFoku/wb6vMb394=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LxEe3UAIqo8DCfEDmM+whOOYEEyZzWAcXSJpwNk09Pfi0WCTZzvlwdwC9bhEwu17e
 HgCdm+BFHI7FIsKYrQ2xp+k4M4wLljQGQZYi5waU5KlhFUyazfR4mvc7Q5OoPidWbv
 ORTonJPllGR7xB76/djrCNt0tVBRJJNKbaXqnhrjhgtsL0Zncx8Jb20FkO54XdLB0S
 htjXeajLCKn7fWBw4t1ihX933xhPQ0T25arIxXj4hLDMETzN2gNk1VL7zKCZmovoBC
 +Y/ATlIEUbwxQx5JbFAMmWw7FoEDaF3637bYxp79HocTfVXiyolq1AjhbMnBePt5wC
 gAOxMFRLx3NVA==
Message-ID: <5fb1e183-dc82-821f-54d7-51494cb0c6e8@denx.de>
Date: Sat, 8 Jul 2023 21:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
 <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
 <d5fb8106-b8f3-0acf-1267-d4d6d0860e25@linaro.org>
 <d28b0090-bd1e-6737-d92b-348dc6c30750@linaro.org>
 <800f9e1a-cb66-5bf5-d225-ef338c1c1584@denx.de>
 <4bc710b1-f361-c525-7692-1dc275ec9bb7@linaro.org>
 <19f50ec2-f22d-100f-cc40-511b8b6153cf@denx.de>
 <CAA8EJppkQSY1yNyG8oXjmYCa+1Pe9X6Zp4nLPwUvHMbODsvayQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAA8EJppkQSY1yNyG8oXjmYCa+1Pe9X6Zp4nLPwUvHMbODsvayQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Amit Pundir <amit.pundir@linaro.org>, neil.armstrong@linaro.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/8/23 21:40, Dmitry Baryshkov wrote:
> On Sat, 8 Jul 2023 at 22:39, Marek Vasut <marex@denx.de> wrote:
>>
>> On 7/8/23 17:53, Dmitry Baryshkov wrote:
>>> On 08/07/2023 18:40, Marek Vasut wrote:
>>>> On 7/7/23 10:47, Neil Armstrong wrote:
>>>>> On 07/07/2023 09:18, Neil Armstrong wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 06/07/2023 11:20, Amit Pundir wrote:
>>>>>>> On Wed, 5 Jul 2023 at 11:09, Dmitry Baryshkov
>>>>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>>>>
>>>>>>>> [Adding freedreno@ to cc list]
>>>>>>>>
>>>>>>>> On Wed, 5 Jul 2023 at 08:31, Jagan Teki
>>>>>>>> <jagan@amarulasolutions.com> wrote:
>>>>>>>>>
>>>>>>>>> Hi Amit,
>>>>>>>>>
>>>>>>>>> On Wed, Jul 5, 2023 at 10:15 AM Amit Pundir
>>>>>>>>> <amit.pundir@linaro.org> wrote:
>>>>>>>>>>
>>>>>>>>>> Hi Marek,
>>>>>>>>>>
>>>>>>>>>> On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
>>>>>>>>>>>
>>>>>>>>>>> Do not generate the HS front and back porch gaps, the HSA gap and
>>>>>>>>>>> EOT packet, as these packets are not required. This makes the
>>>>>>>>>>> bridge
>>>>>>>>>>> work with Samsung DSIM on i.MX8MM and i.MX8MP.
>>>>>>>>>>
>>>>>>>>>> This patch broke display on Dragonboard 845c (SDM845) devboard
>>>>>>>>>> running
>>>>>>>>>> AOSP. This is what I see
>>>>>>>>>> https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-display/PXL_20230704_150156326.jpg.
>>>>>>>>>> Reverting this patch fixes this regression for me.
>>>>>>>>>
>>>>>>>>> Might be msm dsi host require proper handling on these updated
>>>>>>>>> mode_flags? did they?
>>>>>>>>
>>>>>>>> The msm DSI host supports those flags. Also, I'd like to point out
>>>>>>>> that the patch didn't change the rest of the driver code. So even if
>>>>>>>> drm/msm ignored some of the flags, it should not have caused the
>>>>>>>> issue. Most likely the issue is on the lt9611 side. I's suspect that
>>>>>>>> additional programming is required to make it work with these flags.
>>>>>>>
>>>>>>> I spent some time today on smoke testing these flags (individually and
>>>>>>> in limited combination) on DB845c, to narrow down this breakage to one
>>>>>>> or more flag(s) triggering it. Here are my observations in limited
>>>>>>> testing done so far.
>>>>>>>
>>>>>>> There is no regression with MIPI_DSI_MODE_NO_EOT_PACKET when enabled
>>>>>>> alone and system boots to UI as usual.
>>>>>>>
>>>>>>> MIPI_DSI_MODE_VIDEO_NO_HFP always trigger the broken display as in the
>>>>>>> screenshot[1] shared earlier as well.
>>>>>>>
>>>>>>> Adding either of MIPI_DSI_MODE_VIDEO_NO_HSA and
>>>>>>> MIPI_DSI_MODE_VIDEO_NO_HBP always result in no display, unless paired
>>>>>>> with MIPI_DSI_MODE_VIDEO_NO_HFP and in that case we get the broken
>>>>>>> display as reported.
>>>>>>>
>>>>>>> In short other than MIPI_DSI_MODE_NO_EOT_PACKET flag, all other flags
>>>>>>> added in this commit break the display on DB845c one way or another.
>>>>>>
>>>>>> I think the investigation would be to understand why samsung-dsim
>>>>>> requires
>>>>>> such flags and/or what are the difference in behavior between MSM
>>>>>> DSI and samsung DSIM
>>>>>> for those flags ?
>>>>>>
>>>>>> If someone has access to the lt9611 datasheet, so it requires
>>>>>> HSA/HFP/HBP to be
>>>>>> skipped ? and does MSM DSI and samsung DSIM skip them in the same way ?
>>>>
>>>> I don't have the LT9611 datasheet, no.
>>>
>>> I also don't have an lt9611 datasheet, unfortunately. I was using the
>>> existing third-party drivers as a source.
>>>
>>>>
>>>> The MX8M DSI (samsung-dsim) skips the HSA/HFP/HBP completely (see
>>>> i.MX8MP RM 13.6.2.7.2 RGB Interface , there is infographics on the
>>>> following pages).
>>>
>>> Do you know, why did you have to disable HPB/HSA/HFP on your platform?
>>> What was the result otherwise?
>>
>> No image on the HDMI monitor at all. This flags change has fixed the
>> problem for multiple other bridges too btw, not just the LT9611, but
>> also TI SN65DSI83 and ICN6211. The flags were likely not set in all
>> those bridge drivers because no DSI host implemented them so far.
> 
> MSM DSI host have had those implemented for ages, but we never needed
> them AFAIR.

The MSM one is exception in more ways than one it seems (in a positive way).
