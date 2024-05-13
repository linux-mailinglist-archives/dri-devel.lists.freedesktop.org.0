Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707C78C425B
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 15:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D14E10E687;
	Mon, 13 May 2024 13:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="m0L+fG+5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CB410E431;
 Mon, 13 May 2024 13:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1715607900; x=1716212700; i=friedrich.vock@gmx.de;
 bh=4rk9PKS7gZNUzgdpoeDbkWJErnKSLRaEZsPgsJGt2Ko=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=m0L+fG+5D/RyfzCoRdBjDbHHKpw7U+VQoQOQcpz7VKJknyITNQosqW1BNXVQDgNM
 i1i8J0+cwR7APeFxHBqLBto98Uhf0qgyzkGlKjozzaW5Rue/O31hubSimTOAaIDtb
 YLn5FYLUeWH02NBxBkVH8SLfJoH3A2ihvOq+0K3rCHO6AiXj6g1zX7PFWDTeWgh59
 0K7/BVOXl2d5d+pz3JSCw8r/OO/aw8yCzDkdFsnk125tFnlxBkZACMh7cFvV/zs0I
 6vHauzbndQLLqicoMkU6m2sLwA4tnGvGiODMvBNqZqTSlPukDQ1m5So8H9ry169RI
 Kod295Yd1lENPoJGmw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.177.3] ([213.152.117.111]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGz1f-1sJSQB2vtD-00H3S5; Mon, 13
 May 2024 15:45:00 +0200
Message-ID: <e5184fc3-fca6-411f-8ced-92d88633bf81@gmx.de>
Date: Mon, 13 May 2024 15:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/18] TTM interface for managing VRAM oversubscription
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <ec27f4f8-77a0-45be-96a5-54985fb3ab25@linux.intel.com>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <ec27f4f8-77a0-45be-96a5-54985fb3ab25@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZrF9s1jDxM0xy9YRBPAlgGQ17zEqr0MFv0R8NZoSYPeoUR2skzP
 dUjvaiaLW6fYSkRHwgEpF6C56V3OxRDL9wccH68j+yNDLEfRGIHCzV+jLK6glNNXYTQuIoC
 90kr6BEwtzfWdJ02qPQYDgHjTMYhD83+iQh/3siexyVNBJPdtUHED/+BhcFFyM7g/SybUiY
 S9ZTBVedVBIf/HomT0syA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LoWy7XrxLeM=;SeTgrN+c/3QixYQkOa5phX8ExHg
 2TrECLExmJXwL6dKo4tfpUHCxwsHwq9nKxBiF+twXdp7VE7K5aEInZBL1Y8QpjnVa9yEUstGL
 Rn6jpTCIhcAAhZjXymLClsa0KqoFw+YjMTTHhaekDakM4ITISNWkvwmuGtHPmP+ILjm3MzxNf
 zcY5MNu5Va5haIm/yhvZ1s5mDb+ghL5o7aM2hbKemsLKvoepYPX6W6HtcWkFMbXOJyifySCjx
 VwJoFfwwyAA6ZfIaRUuB/TTp4t9stDhvo5y7vGIMqy5Y6mZ0KkFnqy+tyS6Wlm21jTJxYQSjo
 bsLOBuKdrjFLykx1qmOsfs7q+627trtXZVWZWapwlnsGUzOi1FKnXNXPDTA5Hclz5C/7iWG2d
 CQhobRNkj1rL0scV55dce51HX7G+Xpi/5Pz8HPqMOCtfPF1mfyDG4AuyH+ovCeoZU02yH1ErY
 1zKJNlQhfXGyIKHsGNfAnHmRfyS2d2Bgcw/p0EnBsbTsPNZvo8BnN9x5U92mQLq/c8PKlLib8
 It6VryuZR9HCQaPNSA4qNVhHN7ALy5DHzQhYknQUjFKZ7YvHMpUFQ+giBQxAlzq0Qg14CsNVp
 AlHfewFLYGtP4i1we/SUFuEOrLt6WcroxNhd+hGvw7zqum77e/lbtqwo+cJ0PZ33ls8eQIOyZ
 NHZxPnHYO5nOc0LvUFCvmlpBwz8stdeUuHIpkNRB35SfZ+EyBmnY6YN+EjPS67fa464lIPLGr
 +se68w4O94ZvRjmt8hb3uXzc6boU9po3c866uYcfnKmyEthv91nJF2SGyDPzFdOBmdu+jShU9
 OE701EPGY1tc1RfU6MfAh6W5mnCDgfH/N+hW4u3XTqrBc=
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

Hi,

On 02.05.24 16:23, Maarten Lankhorst wrote:
> Hey,
>
> [snip]
>
> For Xe, I've been loking at using cgroups. A small prototype is
> available at
>
> https://cgit.freedesktop.org/~mlankhorst/linux/log/?h=3Ddumpcg
>
> To stimulate discussion, I've added amdgpu support as well.
> This should make it possible to isolate the compositor allocations
> from the target program.
>
> This support is still incomplete and covers vram only, but I need help
> from userspace and consensus from other drivers on how to move forward.
>
> I'm thinking of making 3 cgroup limits:
> 1. Physical memory, each time a buffer is allocated, it counts towards
> it, regardless where it resides.
> 2. Mappable memory, all buffers allocated in sysmem or vram count
> towards this limit.
> 3. VRAM, only buffers residing in VRAM count here.
>
> This ensures that VRAM can always be evicted to sysmem, by having a
> mappable memory quota, and having a sysmem reservation.
>
> The main trouble is that when evicting, you want to charge the
> original process the changes in allocation limits, but it should be
> solvable.
>
> I've been looking for someone else needing the usecase in a different
> context, so let me know what you think of the idea.
>
Sorry for the late reply. The idea sounds really good! I think cgroups
are great fit for what we'd need to prioritize game+compositor over
other potential non-foreground apps.

 From what I can tell looking through the code, the current cgroup
properties are absolute memory sizes that userspace asks the kernel to
restrict the cgroup usage to?
While that sounds useful for some usecases too, I'm not sure just these
limits are a good solution for making sure that your compositor's and
foreground app's resources stay in memory (in favor of background apps)
when there is pressure.

> This can be generalized towards all uses of the GPU, but the
> compositor vs game thrashing is a good example of why it is useful to
> have.
>
IIRC Tvrtko's original proposal was about per-cgroup DRM scheduling
priorities providing lower submission latency for prioritized cgroups,
right?

I think what we need here would pretty much exactly such a priority
system, but for memory: The cgroup containing the foreground app/game
and the compositor should have some hint telling TTM to try its hardest
to avoid evicting its buffers (i.e. a high memory priority).
Your existing drm_cgroup work looks like a great base for this, and I'd
be happy to help/participate with the implementation for amdgpu.

Thanks,
Friedrich

> I should still have my cgroup testcase somewhere, this is only a
> rebase of my previous proposal, but I think it fits the usecase.
>
> Cheers,
> Maarten
