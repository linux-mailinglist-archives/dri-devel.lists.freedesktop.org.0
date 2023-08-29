Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A679478C7D1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C927910E35D;
	Tue, 29 Aug 2023 14:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E54010E35D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:42:56 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5EEFA660721F;
 Tue, 29 Aug 2023 15:42:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693320174;
 bh=7J3qoWKoLwewdttgwX13Sls6N7O60tJI8/BPm3wkyVA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=buthp9J8r9fIDPm9S1s1gxT8J7Mh8euuT2zsFviGpL0kbnwAojmq5wb6PctMBMXKy
 sq9g28Loqqrg/8ygWt/pgISDXLaPXCloXo3sgtybNTFgtV+lMnFKdiX7Ii0KvKC745
 4u8wSth53MlIvAj+ySv2LmVO83cYKwN/xFPUfML4YFjPuqP6kEwslHN/Co30ORiQM1
 CWtyoT1FKNizcJkY1WQ/svdnnAmAhS/C+P3IRbEwrBMC8ql8GPNuq/ntAxoHwiDIwg
 1pj67rrN5Ldrbo3doF/nL/u4gK0E76NFgS4cV4vdAg42PqyMlqhrNTjo9O0A0Zw0u5
 ml99ZSjKh59Ng==
Date: Tue, 29 Aug 2023 16:42:51 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 05/15] drm/panthor: Add the GPU logical block
Message-ID: <20230829164251.762d818c@collabora.com>
In-Reply-To: <13815072-9403-0a9a-e6a8-d97fd727e2a0@arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-6-boris.brezillon@collabora.com>
 <b1c4d260-93a5-d1f0-7f4b-4dcb444e7a24@arm.com>
 <13815072-9403-0a9a-e6a8-d97fd727e2a0@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2w=?= =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Aug 2023 17:09:49 +0100
Robin Murphy <robin.murphy@arm.com> wrote:

> On 2023-08-14 11:54, Steven Price wrote:
> [...]
> >> +/**
> >> + * panthor_gpu_l2_power_on() - Power-on the L2-cache
> >> + * @ptdev: Device.
> >> + *
> >> + * Return: 0 on success, a negative error code otherwise.
> >> + */
> >> +int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
> >> +{
> >> +	u64 core_mask = U64_MAX;
> >> +
> >> +	if (ptdev->gpu_info.l2_present != 1) {
> >> +		/*
> >> +		 * Only support one core group now.
> >> +		 * ~(l2_present - 1) unsets all bits in l2_present except
> >> +		 * the bottom bit. (l2_present - 2) has all the bits in
> >> +		 * the first core group set. AND them together to generate
> >> +		 * a mask of cores in the first core group.
> >> +		 */
> >> +		core_mask = ~(ptdev->gpu_info.l2_present - 1) &
> >> +			     (ptdev->gpu_info.l2_present - 2);
> >> +		drm_info_once(&ptdev->base, "using only 1st core group (%lu cores from %lu)\n",
> >> +			      hweight64(core_mask),
> >> +			      hweight64(ptdev->gpu_info.shader_present));  
> > 
> > I'm not sure what the point of this complexity is. This boils down to
> > the equivalent of:
> > 
> > 	if (ptdev->gpu_info.l2_present != 1)
> > 		core_mask = 1;  
> 
> Hmm, that doesn't look right - the idiom here should be to set all bits 
> of the output below the *second* set bit of the input, i.e. 0x11 -> 
> 0x0f.

Ah ah, I should really read the whole thread before replying :-).

> However since panthor is (somewhat ironically) unlikely to ever 
> run on T628, and everything newer should pretend to have a single L2 
> because software-managed coherency is a terrible idea, I would agree 
> that ultimately it does all seem a bit pointless.

Okay, good to know.

> 
> > If we were doing shader-core power management manually (like on pre-CSF
> > GPUs, rather than letting the firmware control it) then the computed
> > core_mask would be useful. So I guess it comes down to the
> > drm_info_once() output and counting the cores - which is nice to have
> > but it took me some time figuring out what was going on here.  
> As for the complexity, I'd suggest you can have some choice words with 
> the guy who originally suggested that code[1] ;)

:'-)
