Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C4B13187F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 20:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2866C89CF3;
	Mon,  6 Jan 2020 19:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792A289CF3;
 Mon,  6 Jan 2020 19:17:40 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e1387c20000>; Mon, 06 Jan 2020 11:17:22 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 06 Jan 2020 11:17:39 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 06 Jan 2020 11:17:39 -0800
Received: from [172.20.40.57] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Jan
 2020 19:17:39 +0000
Subject: Re: [Nouveau] [PATCH v2 0/3] drm/nouveau: Support NVIDIA format
 modifiers
To: Ben Skeggs <skeggsb@gmail.com>
References: <20191217004520.2404-1-jajones@nvidia.com>
 <CACAvsv6AKt=10JgjaEKc=pkmKfGJoUJjq_Unn0yGTuQK85Es2g@mail.gmail.com>
X-Nvconfidentiality: public
From: James Jones <jajones@nvidia.com>
Message-ID: <b273ad88-d246-3395-2fd0-8188bc41a127@nvidia.com>
Date: Mon, 6 Jan 2020 11:18:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACAvsv6AKt=10JgjaEKc=pkmKfGJoUJjq_Unn0yGTuQK85Es2g@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1578338243; bh=X6bjFnBOKk+zwefRvTuLLXoOga65HDslVx01MKp8iI0=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=fSfV/myr5gxiOvydL0Vfz6rcQlE6FKrOufTaL4S/xZbec9zlIPMjuT9ZZmruDSr0p
 peYPJ3K97WLSx39jaPysPTxaFB/a0+uXma+nEmw3E8sgul2Mo/1vdzmXmaAcgZdr2d
 b2Ov5MNjZjce+qnFu9nPvmpo76QolbD0Qhqah/15OttTE630Znpm+7WF17/k3kybJD
 NKo85Tl+/RfDH64yW5ZOZ2fSBs2tzFuBwWS6lCyW7B6ilE+TDIQ8RZXl4xmcSbxk5I
 Fo0ZfPWz6OezfgGN+YZ56aI9+eTdvZo2F40DEkkrtRkuyMkoMGN1/dNdMfLx00/0s1
 flaFP4E5xI7+A==
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/5/20 5:30 PM, Ben Skeggs wrote:
> On Tue, 17 Dec 2019 at 10:44, James Jones <jajones@nvidia.com> wrote:
>>
>> This series modifies the NV5x+ nouveau display backends to advertise
>> appropriate format modifiers on their display planes in atomic mode
>> setting blobs.
>>
>> Corresponding modifications to Mesa/userspace are available here:
>>
>> https://gitlab.freedesktop.org/cubanismo/mesa/tree/nouveau_work
>>
>> But those need a bit of cleanup before they're ready to submit.
>>
>> I've tested this on Tesla, Kepler, Pascal, and Turing-class hardware
>> using various formats and all the exposed format modifiers, plus some
>> negative testing with invalid ones.
>>
>> NOTE: this series depends on the "[PATCH v3] drm: Generalized NV Block
>> Linear DRM format mod" patch submitted to dri-devel.
>>
>> v2: Used Tesla family instead of NV50 chipset compare to avoid treating
>>      oddly numbered NV4x-class chipsets as NV50+ GPUs.  Other instances
>>      of compares with chipset number in the series were audited, deemed
>>      safe, and left as-is for consistency with existing code.
> Hey James,
> 
> These look OK to me, with the minor issue I mentioned on one of the
> patches dealt with.  I'll hold off merging anything until I get the
> go-ahead that the modifier definitions are definitely set in stone /
> userspace is ready for inclusion.

Thanks for having a look.  I'll try to get the userspace changes 
finalized soon.  I think from the NV side, we consider the modifier 
definition itself (the v3 version of the patch) final, so if there's any 
stand-alone feedback from yourself or other drm/nouveau developers on 
that layout, we'd be eager to hear it.  I don't want it rushed in, but 
we do have several projects blocked on getting that approved & committed.

I assume the sequencing should be:

* Fix the minor issue you identified here/complete review of nouveau 
kernel patches
* Complete review of the related TegraDRM new modifier support patch
* Finalize and complete review of userspace/Mesa nouveau modifier 
support patches
* Get drm_fourcc.h updates committed
* Get these patches and TegraDRM patches committed
* Integrate final drm_fourcc.h to Mesa patches and get Mesa patches 
committed

Does that sound right to you?

Thanks,
-James

> Thanks,
> Ben.
> 
>>
>> James Jones (3):
>>    drm/nouveau: Add format mod prop to base/ovly/nvdisp
>>    drm/nouveau: Check framebuffer size against bo
>>    drm/nouveau: Support NVIDIA format modifiers
>>
>>   drivers/gpu/drm/nouveau/dispnv50/base507c.c |   7 +-
>>   drivers/gpu/drm/nouveau/dispnv50/disp.c     |  59 ++++++++
>>   drivers/gpu/drm/nouveau/dispnv50/disp.h     |   4 +
>>   drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  35 ++++-
>>   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  17 +++
>>   drivers/gpu/drm/nouveau/nouveau_display.c   | 154 ++++++++++++++++++++
>>   drivers/gpu/drm/nouveau/nouveau_display.h   |   4 +
>>   7 files changed, 272 insertions(+), 8 deletions(-)
>>
>> --
>> 2.17.1
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
