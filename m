Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 073D0601059
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 15:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E7310E4E8;
	Mon, 17 Oct 2022 13:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA8C10E459
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 13:37:26 +0000 (UTC)
Date: Mon, 17 Oct 2022 13:37:11 +0000
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="FP9YI0Lp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1666013838; x=1666273038;
 bh=O8U0/rSJcp6Znld+LgNmARLp2ZlKY3y+428lcdHw/Ck=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=FP9YI0LpS3NtMj7aU54Mch6ZnaBxrpwwrUPWiZeYoMw0G3T3yqCAT/tciY5CEYWi7
 rYyKgglMC+Jhl0jZMYKR6qHzuoUuah1oeWr7SZ+x39iKu8jJPoV5diyyp+FCOa4pQN
 TKuVBN2XwYw1mVYNNGfa5hDUCz9MQcLtLOx8yApg=
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
From: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [Freedreno] [PATCH v3 06/10] drm/msm/dsi: Migrate to
 drm_dsc_compute_rc_parameters()
Message-ID: <0642a664-3eed-21b7-a417-c6c607908f51@connolly.tech>
In-Reply-To: <20221017085944.2r24uqg73irmziqm@SoMainline.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009185058.460688-1-marijn.suijten@somainline.org>
 <5c178d7e-5022-f5e5-791d-d3800114b42b@quicinc.com>
 <20221013093646.c65mbjc6oekd7gha@SoMainline.org>
 <32af4444-9c88-eb0f-eda7-24fa0418aff6@quicinc.com>
 <20221017085944.2r24uqg73irmziqm@SoMainline.org>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Sean Paul <sean@poorly.run>, Newbyte <newbie13xd@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 Vinod Koul <vkoul@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17/10/2022 09:59, Marijn Suijten wrote:
> On 2022-10-13 09:02:44, Abhinav Kumar wrote:
>> On 10/13/2022 2:36 AM, Marijn Suijten wrote:
>>> On 2022-10-12 16:03:06, Abhinav Kumar wrote:
>>>> [..]
>>>> But I would like to hold back this change till Vinod clarifies because
>>>> Vinod had mentioned that with drm_dsc_compute_rc_parameters() he was
>>>> seeing a mismatch in the computation of two values.
>>>>
>>>> slice_bpg_offset and the final_offset.
>>>
>>> Unsurprisingly so because final_offset, and slice_bpg_offset through
>>> initial_offset depend directly on bits_per_pixel.  The main takeaway of
>>> this series is that Vinod was interpreting this field as integer instea=
d
>>> of containing 4 fractional bits.  If he updates his the panel driver [1=
]
>>> to set bits_per_pixel =3D 8 << 4 instead of just 8 to account for this,
>>> the values should check out once again.
>>>
>>> [1]: https://git.linaro.org/people/vinod.koul/kernel.git/commit/?h=3Dto=
pic/pixel3_5.18-rc1&id=3D1d7d98ad564f1ec69e7525e07418918d90f247a1
>>>
>>> Once Vinod (or someone else in the posession of a Pixel 3) confirms
>>> this, I can respin this series and more explicitly explain why the FIXM=
E
>>> was put in place, instead of being resolved outright?
>>>
>>> - Marijn
>>
>> Makes perfect sense to me.
>>
>> Will just wait for Vinod's tested-by.
>
> Unfortunately Vinod doesn't have access to this device anymore, but
> Caleb recently sent the support series including display driver for
> Pixel 3 and is picking up the testing.  User "Newbyte" from #linux-msm
> promised to test on the LG G7 to have even more input samples.

Hi,

I'm hoping to pick the Pixel 3 stuff back up at some point, but right now t=
here
seem to be quite a few issues outside of DSC which make testing it a bit of=
 a pain.

I gave Marijn's series [1] a go but wasn't able to get anything usable out =
of the
panel, however I doubt this is a DSC issue as I've always needed some hacks=
 to
get the panel working - I've never had any success with it without skipping=
 both
the initial panel reset and sending the PPS payload.

I think if Marijn has managed to initialise a panel properly then the lack =
of
Pixel 3 for validation shouldn't be a blocker to merge these fixes.

[1]:
https://lore.kernel.org/linux-arm-msm/20221009184824.457416-1-marijn.suijte=
n@somainline.org/

>
> - Marijn

--
Kind Regards,
Caleb

