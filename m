Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D16B64EE201
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 21:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C6310E175;
	Thu, 31 Mar 2022 19:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4173E10E082;
 Thu, 31 Mar 2022 19:41:22 +0000 (UTC)
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown
 [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AD5941F46A5D;
 Thu, 31 Mar 2022 20:41:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648755680;
 bh=XyZcQg6pqR159jgtxwGtbmonYgk2JzV10bPGOcjl0Qc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DE4VWC1bnVsxalr1+sXEPphCLUZNPnQ1i5KR46hOq9wpUWFkfxPTdYNwayv5PeJMy
 x1usxrG78HxHgRkrg80QEw4tYf9RiS2VsRKfx4c//GaCzdwCB134eYNMsU1X/Am5PZ
 CHMG8SEJbZRSQozYR+iQMjJ5aTBptRVxwbuCqS+5WoiwEuHs+PYVimXUgW6hIIW+0q
 JTspnl+6ZAsyyUGvZJl4MEjp2Gdx7k35YQiEeqnhVlJ76iikG1BaLgGjDc5dRxQ8Fj
 JKaP1em6qv0X5Nh8PQwTuJymfxQiVRhRauJ1KZVi3CiwsRah4g89P4jCPW3xXpeBWe
 SDDqSfoz/jJSQ==
Message-ID: <22d9a9ff-1c44-ed41-6ae1-59a1f965ab6c@collabora.com>
Date: Thu, 31 Mar 2022 22:41:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 10/10] drm/msm: Add a way for userspace to allocate GPU
 iova
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220330204804.660819-1-robdclark@gmail.com>
 <20220330204804.660819-11-robdclark@gmail.com>
 <ad97096f-cc90-4f20-0f73-f33e9b275f1a@collabora.com>
 <CAF6AEGvZqM1OT_n1C+x+C1GTd4PbFkH4c7P-BseDOUGj7yj3Eg@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGvZqM1OT_n1C+x+C1GTd4PbFkH4c7P-BseDOUGj7yj3Eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Emma Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/31/22 22:02, Rob Clark wrote:
> On Thu, Mar 31, 2022 at 11:52 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> ...
>>> +/*
>>> + * Get the requested iova but don't pin it.  Fails if the requested iova is
>>> + * not available.  Doesn't need a put because iovas are currently valid for
>>> + * the life of the object.
>>> + *
>>> + * Setting an iova of zero will clear the vma.
>>> + */
>>> +int msm_gem_set_iova(struct drm_gem_object *obj,
>>> +                  struct msm_gem_address_space *aspace, uint64_t iova)
>>> +{
>>> +     int ret = 0;
>>
>> nit: No need to initialize the ret
> 
> actually, we do

Indeed, sorry :)

...
>>>  int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
>>>               struct msm_gem_address_space *aspace, uint64_t *iova,
>>>               u64 range_start, u64 range_end);
>> nit: There is an odd mix of uint64_t and u64 (and alike) in the MSM code
>> :) The uint64_t variant shouldn't be used by kernel code in general and
>> checkpatch should want about it.
> 
> one of many things that I disagree with checkpatch about ;-)
> 
> I prefer standard types to custom ones.  I _kinda_ get the argument in
> case of uapi (but IMHO that doesn't apply to how drm uapi headers are
> used)

I'd understand if it was all either uint64_t or u64, but the mix.. hm.
