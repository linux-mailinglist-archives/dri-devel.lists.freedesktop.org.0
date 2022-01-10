Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A525489E91
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 18:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FDE112E19;
	Mon, 10 Jan 2022 17:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F44112D95
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 17:42:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 5A06E1F43EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641836572;
 bh=i3BsaG3+9txF0hL7sD+dOncjvycYUSgtrjkjrBXPt/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bt77E/Vk6J6qUmGkOV3EsgrRIru1UpllDQAb2NdpC/No5UlSYk/h203TOl2znG7rc
 8KPwjcKjM+SFtwGXYD/d6hNTQi2bVSpB0cdXATvmeZaO+EK2CekF7tScoP3whHOmhA
 5O7Cyq1vQI+511mtrLJn8muQBIu716aGh7daDogugb0ItaTMlDwmqYeyPD1g4veWaB
 Kt/cUmkwqGP57NCbzrKwvfvCkcYhgGQNS3P5I4c7jJeDX2HM23+aNM83EbKMUAWyzT
 hA2SR2AI9cOexlpEGHQrFD/LeJZKPBAG2NUKlSgQ11dRtvN5261g6/rdbWC9fZUBgD
 qfGa3SSq63pQQ==
Date: Mon, 10 Jan 2022 12:42:44 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 2/2] drm/panfrost: adjusted job affinity for dual core
 group GPUs
Message-ID: <YdxwFCfWYtLd1Qqb@maud>
References: <20211223110616.2589851-1-asheplyakov@basealt.ru>
 <20211223110616.2589851-3-asheplyakov@basealt.ru>
 <YcSDgIwrmHZ/BC2n@maud>
 <c94bafaa-3029-fea3-b623-1961b4b5e4cf@basealt.ru>
 <fca08e3c-c239-efdd-6ae5-132d84637d1f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fca08e3c-c239-efdd-6ae5-132d84637d1f@arm.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "Vadim V . Vlasov" <vadim.vlasov@elpitech.ru>, dri-devel@lists.freedesktop.org,
 Alexey Sheplyakov <asheplyakov@basealt.ru>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Whether it's worth the effort depends on whether anyone really cares
> about getting the full performance out of this particular GPU.
> 
> At this stage I think the main UABI change would be to add the opposite
> flag to kbase, (e.g. "PANFROST_JD_DOESNT_NEED_COHERENCY_ON_GPU"[1]) to
> opt-in to allowing the job to run across all cores.
> 
> The second change would be to allow compute jobs to be run on the second
> core group, so another flag: PANFROST_RUN_ON_SECOND_CORE_GROUP.
> 
> But clearly there's little point adding such flags until someone steps
> up to do the Mesa work.

I worry about the maintainence burden (both Mesa and kernel) of adding
UABI only used by a piece of hardware none of us own, and only useful
"sometimes" for that hardware. Doubly so for the second core group
support; currently Mesa doesn't advertise any compute support on
anything older than Mali T760 ... to the best of my knowledge, nobody
has missed that support either...

To be clear I am in favour of merging the patches needed for GLES2 to
work on all Malis, possibly at a performance cost on these dual-core
systems. That's a far cry from the level of support the DDK gave these
chips back in the day ... of course, the DDK doesn't support them at all
anymore, so Panfrost wins there by default! ;)
