Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3C2747E46
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 09:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E50110E10F;
	Wed,  5 Jul 2023 07:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C825610E10F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 07:32:03 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 21F6885241;
 Wed,  5 Jul 2023 09:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1688542319;
 bh=NsgHjHOtkMUFlzu/DAehFea6k3vOfcJfJ2pn8Oy6jmw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iibcjsyndHS6YsbCOJG8wfHKBJxzFPkcWJAF4LH3pAmy1Ak+bOWkFoIifBlXaNA96
 QLD1WC8DFkvBo/t6KZHwV0IIC8HVP6Qq/sIdq6AToRy5gtwiYCq8X49drt2VVEWcIl
 +3Tbex9gba1cU3qJ7f8pi74tZlVsHFW6Vzh2RLiDcbIIfbxOpGziGo5D1OVUUydUMP
 srfKG7ikJ/loPcb1Buo152RyuDeIRLvyxVl6jdJdFs5v5uOO8zgrmq/IYAUJicY5tx
 v2WWiSoSzqQ5s0krgZ9tSFzqfZi9Sqj40tmvwHrVv4meFxnU+t4eAbXpyx67dT0OPb
 Vxsj2OCQet4OQ==
Message-ID: <707c8123-f2be-a803-f4d7-5406c8f32a6b@denx.de>
Date: Wed, 5 Jul 2023 09:31:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
 <CAMty3ZBQajyg0SNz+AjQzth_O_EmrZ9cUyfM--0ptJQ5F0MRfg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZBQajyg0SNz+AjQzth_O_EmrZ9cUyfM--0ptJQ5F0MRfg@mail.gmail.com>
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Michael Walle <michael@walle.cc>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/5/23 07:46, Jagan Teki wrote:
> On Wed, Jul 5, 2023 at 11:09 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> [Adding freedreno@ to cc list]
>>
>> On Wed, 5 Jul 2023 at 08:31, Jagan Teki <jagan@amarulasolutions.com> wrote:
>>>
>>> Hi Amit,
>>>
>>> On Wed, Jul 5, 2023 at 10:15 AM Amit Pundir <amit.pundir@linaro.org> wrote:
>>>>
>>>> Hi Marek,
>>>>
>>>> On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
>>>>>
>>>>> Do not generate the HS front and back porch gaps, the HSA gap and
>>>>> EOT packet, as these packets are not required. This makes the bridge
>>>>> work with Samsung DSIM on i.MX8MM and i.MX8MP.
>>>>
>>>> This patch broke display on Dragonboard 845c (SDM845) devboard running
>>>> AOSP. This is what I see
>>>> https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-display/PXL_20230704_150156326.jpg.
>>>> Reverting this patch fixes this regression for me.
>>>
>>> Might be msm dsi host require proper handling on these updated
>>> mode_flags? did they?
>>
>> The msm DSI host supports those flags. Also, I'd like to point out
>> that the patch didn't change the rest of the driver code. So even if
>> drm/msm ignored some of the flags, it should not have caused the
>> issue. Most likely the issue is on the lt9611 side. I's suspect that
>> additional programming is required to make it work with these flags.
> 
> True, But I'm not quite sure, most of these mode_flags were handled
> more on the host. Maybe Marek can comment on this.

So, we have the same flags, but two different controllers produce 
different DSI streams ? Do we have any way to analyze the stream 
produced by each controller, to figure out which one is wrong and which 
one is right ?
