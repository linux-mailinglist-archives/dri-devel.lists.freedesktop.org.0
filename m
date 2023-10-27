Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 320D47D92E9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 10:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6522310E00C;
	Fri, 27 Oct 2023 08:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE9610E00C;
 Fri, 27 Oct 2023 08:59:35 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4SGxS35yYYz9ssp;
 Fri, 27 Oct 2023 10:59:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1698397171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2gGNaTCqkab7QvfSknu3VyUM45w+oLENV/JOYhuM1Mw=;
 b=O2xajuZB2Gcz7P3UMR3xOcQXZyEuGddLBFDWbd+vY6yu+bU/8huEXrz2DWoSnd0QZdxrgf
 gbohQ6QVpDBGeiR5Ui3qRBZ8ss62/tU1mg96y4PDD+2RC+EbZ6Ycrgtng96mIGLG9NJAZT
 lmSSzVT+92SiKKnz3kB5CBn3lLBP00FkUi8PEEGXQYOTJH3fPVcs73/tIcz1d4YFiW9RfE
 x+9i3Cy2vRQ+Q43YSYje2eVzBsDsONwXSlbjlG9LofGM2egJkJo5a9cfyff+a73yOxMuK9
 yxIU8j0MLYg27VcrVX0gj+8/AS7rDkWXsoV4FLmWsKtTJLWTzVviArz69ayblQ==
Message-ID: <34be9d0b-18d7-7568-cf30-b3b1b9f77045@mailbox.org>
Date: Fri, 27 Oct 2023 10:59:25 +0200
MIME-Version: 1.0
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Content-Language: en-CA
To: Alex Goins <agoins@nvidia.com>, Sebastian Wick <sebastian.wick@redhat.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
 <20231023111219.6e287958@eldfell>
 <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
 <20231026115747.44cbddad@eldfell> <20231026173003.GA319477@toolbox>
 <1255ad3-e22b-063-ffb8-18ea852f054@nvidia.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <1255ad3-e22b-063-ffb8-18ea852f054@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 310027a340249191e0a
X-MBO-RS-META: 6u9fbndamq1tpo3sxdw1pnarcgg9no1p
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
Cc: Aleix Pol <aleixpol@kde.org>, Sasha McIntosh <sashamcintosh@google.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Hector Martin <marcan@marcan.st>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Victoria Brekenfeld <victoria@system76.com>, dri-devel@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Joshua Ashton <joshua@froggi.es>,
 wayland-devel@lists.freedesktop.org,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/26/23 21:25, Alex Goins wrote:
> On Thu, 26 Oct 2023, Sebastian Wick wrote:
>> On Thu, Oct 26, 2023 at 11:57:47AM +0300, Pekka Paalanen wrote:
>>> On Wed, 25 Oct 2023 15:16:08 -0500 (CDT)
>>> Alex Goins <agoins@nvidia.com> wrote:
>>>
>>>> Despite being programmable, the LUTs are updated in a manner that is less
>>>> efficient as compared to e.g. the non-static "degamma" LUT. Would it be helpful
>>>> if there was some way to tag operations according to their performance,
>>>> for example so that clients can prefer a high performance one when they
>>>> intend to do an animated transition? I recall from the XDC HDR workshop
>>>> that this is also an issue with AMD's 3DLUT, where updates can be too
>>>> slow to animate.
>>>
>>> I can certainly see such information being useful, but then we need to
>>> somehow quantize the performance.
> 
> Right, which wouldn't even necessarily be universal, could depend on the given
> host, GPU, etc. It could just be a relative performance indication, to give an
> order of preference. That wouldn't tell you if it can or can't be animated, but
> when choosing between two LUTs to animate you could prefer the higher
> performance one.
> 
>>>
>>> What I was left puzzled about after the XDC workshop is that is it
>>> possible to pre-load configurations in the background (slow), and then
>>> quickly switch between them? Hardware-wise I mean.
> 
> This works fine for our "fast" LUTs, you just point them to a surface in video
> memory and they flip to it. You could keep multiple surfaces around and flip
> between them without having to reprogram them in software. We can easily do that
> with enumerated curves, populating them when the driver initializes instead of
> waiting for the client to request them. You can even point multiple hardware
> LUTs to the same video memory surface, if they need the same curve.
> 
>>
>> We could define that pipelines with a lower ID are to be preferred over
>> higher IDs.
> 
> Sure, but this isn't just an issue with a pipeline as a whole, but the
> individual elements within it and how to use them in a given context.
> 
>>
>> The issue is that if programming a pipeline becomes too slow to be
>> useful it probably should just not be made available to user space.
> 
> It's not that programming the pipeline is overall too slow. The LUTs we have
> that are relatively slow to program are meant to be set infrequently, or even
> just once, to allow the scaler and tone mapping operator to operate in fixed
> point PQ space. You might still want the tone mapper, so you would choose a
> pipeline that includes them, but when it comes to e.g. animating a night light,
> you would want to choose a different LUT for that purpose.
> 
>>
>> The prepare-commit idea for blob properties would help to make the
>> pipelines usable again, but until then it's probably a good idea to just
>> not expose those pipelines.
> 
> The prepare-commit idea actually wouldn't work for these LUTs, because they are
> programmed using methods instead of pointing them to a surface. I'm actually not
> sure how slow it actually is, would need to benchmark it. I think not exposing
> them at all would be overkill, since it would mean you can't use the preblending
> scaler or tonemapper, and animation isn't necessary for that.
> 
> The AMD 3DLUT is another example of a LUT that is slow to update, and it would
> obviously be a major loss if that wasn't exposed. There just needs to be some
> way for clients to know if they are going to kill performance by trying to
> change it every frame.

Might a first step be to require the ALLOW_MODESET flag to be set when changing the values for a colorop which is too slow to be updated per refresh cycle?

This would tell the compositor: You can use this colorop, but you can't change its values on the fly.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

