Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF646A18F2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 10:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD0610E0B0;
	Fri, 24 Feb 2023 09:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FF110E0B0;
 Fri, 24 Feb 2023 09:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677231712; x=1708767712;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OeOLLVSe1/js5PTlYfPJkePsPkE4JB+cWEgIxLEaucY=;
 b=YSK0+k2TbdbxjwL+yakxCz5DOzRC4XhLreUq4cETU9RJPh0jbBsWiJ71
 lR8GEogFBi1VP0qwArA2/2bNvilq5t3SMIYExt0tmBEs1qMbSRJLhrdsd
 kPRSY7gjEcOyrCEVH+wEiQS0bTX72jDdY5Nh//gzrlHqzsKKkRFE8dEgC
 VXLmTp0LmPzC4g8z/vq799XdPdxKYynVzDS+KunmtfOn8kksaAkEGOEgn
 FuuUfjfwY8CjBZCK3VNOjywyeORtf2cGzoF9hDuwVurZ7I12f+o26D4KI
 VN7CTCwzdDhnUMSU95oevQ8hoOJxIasx/OeuzDaWk1Hkax06ZZcbqdsWk g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="334858028"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; d="scan'208";a="334858028"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 01:41:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="736744871"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; d="scan'208";a="736744871"
Received: from wmao-mobl.amr.corp.intel.com (HELO [10.212.63.133])
 ([10.212.63.133])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 01:41:48 -0800
Message-ID: <a47e2686-1e35-39a3-0f0c-6c3b9522f8ff@linux.intel.com>
Date: Fri, 24 Feb 2023 09:41:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-7-robdclark@gmail.com>
 <20230220105345.70e46fa5@eldfell>
 <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
 <cdd5f892-49b9-1e22-4dc1-95a8a733c453@amd.com>
 <CAF6AEGuMn3FywPkEtfJ7oZ16A0Bk2aiaRvj4si4od1d3wzXkPw@mail.gmail.com>
 <20230222114900.1b6baf95@eldfell>
 <CAF6AEGs1_75gg+LCBj6=PH8Jn60PXiE+Kx_2636nP-+pajN8Hg@mail.gmail.com>
 <20230223113814.3010cedc@eldfell>
 <CAF6AEGuE89kuKTjjzwW1xMppcVw-M4-hcrtifed-mvsCA=cshQ@mail.gmail.com>
 <20230224112630.313d7b76@eldfell>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230224112630.313d7b76@eldfell>
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/02/2023 09:26, Pekka Paalanen wrote:
> On Thu, 23 Feb 2023 10:51:48 -0800
> Rob Clark <robdclark@gmail.com> wrote:
> 
>> On Thu, Feb 23, 2023 at 1:38 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>>
>>> On Wed, 22 Feb 2023 07:37:26 -0800
>>> Rob Clark <robdclark@gmail.com> wrote:
>>>   
>>>> On Wed, Feb 22, 2023 at 1:49 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> 
> ...
> 
>>>>> On another matter, if the application uses SET_DEADLINE with one
>>>>> timestamp, and the compositor uses SET_DEADLINE on the same thing with
>>>>> another timestamp, what should happen?
>>>>
>>>> The expectation is that many deadline hints can be set on a fence.
>>>> The fence signaller should track the soonest deadline.
>>>
>>> You need to document that as UAPI, since it is observable to userspace.
>>> It would be bad if drivers or subsystems would differ in behaviour.
>>>   
>>
>> It is in the end a hint.  It is about giving the driver more
>> information so that it can make better choices.  But the driver is
>> even free to ignore it.  So maybe "expectation" is too strong of a
>> word.  Rather, any other behavior doesn't really make sense.  But it
>> could end up being dictated by how the hw and/or fw works.
> 
> It will stop being a hint once it has been implemented and used in the
> wild long enough. The kernel userspace regression rules make sure of
> that.

Yeah, tricky and maybe a gray area in this case. I think we eluded 
elsewhere in the thread that renaming the thing might be an option.

So maybe instead of deadline, which is a very strong word, use something 
along the lines of "present time hint", or "signalled time hint"? Maybe 
reads clumsy. Just throwing some ideas for a start.

Regards,

Tvrtko

> See the topic of implementing triple-buffering in Mutter in order to
> put more work to the GPU in order to have the GPU ramp up clocks in
> order to not miss rendering deadlines. I don't think that patch set has
> landed in Mutter upstream, but I hear distributions in downstream are
> already carrying it.
> 
> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1383
> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1441
> 
> Granted, GPU clocks are just one side of that story it seems, and
> triple-buffering may have other benefits.
> 
> If SET_DEADLINE would fix that problem without triple-buffering, it is
> definitely userspace observable, expected and eventually required
> behaviour.
> 
> 
> Thanks,
> pq
