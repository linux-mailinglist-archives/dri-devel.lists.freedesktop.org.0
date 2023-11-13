Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D557E9795
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 09:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E04E10E0B7;
	Mon, 13 Nov 2023 08:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF9D10E0B7;
 Mon, 13 Nov 2023 08:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699863900; x=1731399900;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kGU4JUG2Lr96HBJbf/kazk1tGm2ODqpAeWA0HE3tUjU=;
 b=CQaAUdkchFAkhhRHNDDDmyuE94CxKfXT2XsxGkn2R4fmqLrT/VF7g3KP
 BYAG12T5mPvJYuH6ITy62Aho+cmtow4q2VYVrGz0msa8sOwu0Lb2bgdjB
 vTzqK7KZKkc93GqeubNl6Oo65duXuwAaqkpQ07kWAyEU+r2Ha/JHsJbXm
 8zAl6K0ZQHHkX+f75+40vahITNzkWbLfdEyow9GUzWWWLZj6iYudrZb6a
 CQG8LYN2aPTakjB4QGrPf2u05yaTUPeQ0dUy8kccaI83iGs1QC8i3UXJO
 kYHzzw9oYolvBvdKdS5W+ZZo4gPZ/0HlwN8Ae8en8FMt2o8/vRDS4BdUx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="375421983"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="375421983"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 00:24:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="740700336"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="740700336"
Received: from rdegreef-mobl2.ger.corp.intel.com (HELO [10.251.217.208])
 ([10.251.217.208])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 00:24:55 -0800
Message-ID: <f229d1ed-b71e-434a-acca-06ee81826260@linux.intel.com>
Date: Mon, 13 Nov 2023 09:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver: gpu: Fixing warning directly dereferencing a rcu
 pointer
To: Abhinav Singh <singhabhinav9051571833@gmail.com>, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com, daniel@ffwll.ch
References: <20231113081040.2947143-1-singhabhinav9051571833@gmail.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231113081040.2947143-1-singhabhinav9051571833@gmail.com>
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
Cc: nouveau@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

Den 2023-11-13 kl. 09:10, skrev Abhinav Singh:
> This patch fixes a sparse warning with this message
> "warning:dereference of noderef expression". In this context it means we
> are dereferencing a __rcu tagged pointer directly.
>
> We should not be directly dereferencing a rcu pointer, rather we should
> be using rcu helper function rcu_dereferece() inside rcu read critical
> section to get a normal pointer which can be dereferenced.
>
> I tested with qemu with this command
> qemu-system-x86_64 \
> 	-m 2G \
> 	-smp 2 \
> 	-kernel bzImage \
> 	-append "console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0" \
> 	-drive file=bullseye.img,format=raw \
> 	-net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
> 	-net nic,model=e1000 \
> 	-enable-kvm \
> 	-nographic \
> 	-pidfile vm.pid \
> 	2>&1 | tee vm.log
> with lockdep enabled.
>
> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> ---
>   drivers/gpu/drm/nouveau/nv04_fence.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c b/drivers/gpu/drm/nouveau/nv04_fence.c
> index 5b71a5a5cd85..e62bad1ac720 100644
> --- a/drivers/gpu/drm/nouveau/nv04_fence.c
> +++ b/drivers/gpu/drm/nouveau/nv04_fence.c
> @@ -39,7 +39,9 @@ struct nv04_fence_priv {
>   static int
>   nv04_fence_emit(struct nouveau_fence *fence)
>   {
> -	struct nvif_push *push = fence->channel->chan.push;
> +	rcu_read_lock();
> +	struct nvif_push *push = rcu_dereference(fence->channel)->chan.push;
> +	rcu_read_unlock();
>   	int ret = PUSH_WAIT(push, 2);
>   	if (ret == 0) {
>   		PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);

I'm not an expert in nouveau fence channel lifetime, but I'm pretty sure 
this should probably be a rcu_dereference_protected, since a fence 
likely can't lose its channel before its command to signal is submitted.

But in case it's not, I would at least advise to check for 
fence->channel lifetime before submitting a patch like this. At least 
the original code warned about it not being 100% correct.

Cheers,

~Maarten

