Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B972B97B638
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 01:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB9210E02A;
	Tue, 17 Sep 2024 23:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jEjo+Gyg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DB210E02A;
 Tue, 17 Sep 2024 23:37:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 113EE5C5404;
 Tue, 17 Sep 2024 23:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63B3C4CEC5;
 Tue, 17 Sep 2024 23:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726616236;
 bh=Tm9TUILRz60Jl4CaoraZYxFgqY8fZWa3v9cSGYs1EIs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jEjo+Gygwb9Qnu4gOyyghOPAxAZeFfmqupRPeHdUViI76EkTb5uFREtWfiwHvpIvw
 7DPbxsD+N6TBXLSTMeCdhXu+p9NX/OPrDnU+mahfFxOnj+hLCHx0gFwMlKrciOb9h2
 N24dB0GOAVYwH5lvoWO6/3S1wSbzAsg9WNKKEiACeS0WvrzWcnZMTzxUtzROF2wes9
 NpnJuc2g6iPmvdB1FmmygMXR21mEBIvQ1QwgzFT9wBLt5GEKjWeyt/LYJWaQS/U36i
 FGMtX083NDyTlZ1wElOYKK7Yiaaqxj/CWPRXBoHo7yiHkDF6kvHLZ5w/nIcreF60u0
 OZANZmUq4fpdg==
Message-ID: <59974e61-13f8-4080-850a-55e599c41cb5@kernel.org>
Date: Wed, 18 Sep 2024 01:37:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table
 update
To: Rob Clark <robdclark@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240913195132.8282-1-robdclark@gmail.com>
 <e6991910-5058-4ef0-bfdf-6d33953535dd@kernel.org>
 <CAF6AEGvgS-DD0+qGX_Mud75aES4AQQjmWx2j2gyz7uakTpnp0w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <CAF6AEGvgS-DD0+qGX_Mud75aES4AQQjmWx2j2gyz7uakTpnp0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 17.09.2024 5:30 PM, Rob Clark wrote:
> On Tue, Sep 17, 2024 at 6:47 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> On 13.09.2024 9:51 PM, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
>>> devices (x1-85, possibly others), it seems to pass that barrier while
>>> there are still things in the event completion FIFO waiting to be
>>> written back to memory.
>>
>> Can we try to force-fault around here on other GPUs and perhaps
>> limit this workaround?
> 
> not sure what you mean by "force-fault"...

I suppose 'reproduce' is what I meant

> we could probably limit
> this to certain GPUs, the only reason I didn't is (a) it should be
> harmless when it is not needed,

Do we have any realistic perf hits here?

> and (b) I have no real good way to get
> an exhaustive list of where it is needed.  Maybe/hopefully it is only
> x1-85, but idk.
> 
> It does bring up an interesting question about preemption, though

Yeah..

Do we know what windows does here?

Konrad
