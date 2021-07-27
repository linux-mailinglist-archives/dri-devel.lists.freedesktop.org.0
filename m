Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 786F63D78A6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 16:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450DA6E46B;
	Tue, 27 Jul 2021 14:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC1306E46B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 1247720201C;
 Tue, 27 Jul 2021 16:41:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id LbFgcm9rFac0; Tue, 27 Jul 2021 16:41:06 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 368B120201A;
 Tue, 27 Jul 2021 16:41:06 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1m8OGW-000qa4-SG; Tue, 27 Jul 2021 16:41:04 +0200
To: Rob Clark <robdclark@gmail.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
Message-ID: <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
Date: Tue, 27 Jul 2021 16:41:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726233854.2453899-1-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
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
Cc: Matthew Brost <matthew.brost@intel.com>, Rob Clark <robdclark@chromium.org>,
 Jack Zhang <Jack.Zhang1@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-27 1:38 a.m., Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Based on discussion from a previous series[1] to add a "boost" mechanism
> when, for example, vblank deadlines are missed.  Instead of a boost
> callback, this approach adds a way to set a deadline on the fence, by
> which the waiter would like to see the fence signalled.
> 
> I've not yet had a chance to re-work the drm/msm part of this, but
> wanted to send this out as an RFC in case I don't have a chance to
> finish the drm/msm part this week.
> 
> Original description:
> 
> In some cases, like double-buffered rendering, missing vblanks can
> trick the GPU into running at a lower frequence, when really we
> want to be running at a higher frequency to not miss the vblanks
> in the first place.
> 
> This is partially inspired by a trick i915 does, but implemented
> via dma-fence for a couple of reasons:
> 
> 1) To continue to be able to use the atomic helpers
> 2) To support cases where display and gpu are different drivers
> 
> [1] https://patchwork.freedesktop.org/series/90331/

Unfortunately, none of these approaches will have the full intended effect once Wayland compositors start waiting for client buffers to become idle before using them for an output frame (to prevent output frames from getting delayed by client work). See https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880 (shameless plug :) for a proof of concept of this for mutter. The boost will only affect the compositor's own GPU work, not the client work (which means no effect at all for fullscreen apps where the compositor can scan out the client buffers directly).


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
