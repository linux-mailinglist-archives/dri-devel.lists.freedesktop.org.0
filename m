Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F85CA13538
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C4F10E8E9;
	Thu, 16 Jan 2025 08:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="gR8FApBG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4059A10E8F2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 08:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1737015609; x=1737620409; i=friedrich.vock@gmx.de;
 bh=/RHLlbc4PW8R9gp+t/in1mtnrEju6WaZEupfBALpjfo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=gR8FApBGALYfRCY67/CwEde2UjnFdfWccX7H3oLJfLISOrjS8Xb/5SDr5f4dmkw5
 WQ8h2FW+HV85W6imnmYEI0ihuOAKq4Jx0wDjKruT99FDTOURrvjHmXJgxhcZ9gSNk
 EBZvISFFBIQ6b82+QyjW35XQ5MHciXpOSxdkEyi4ccTKp955H6DLrTm4Rl76KOXZ0
 10jgkOPl4YXTauVza0h7pLOHdj3f4KYpMs0YBFIS25IZNIxusN/yGCyst7mgnbhWs
 3odohk9lMWpYH0J4lgM3vjmyplSWgCi22sLpc7bs7KYptbDTYArPM2qm/u1mu7Y5N
 y2qFLdsDtDqeKFPmTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.16.110] ([134.34.7.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgvvJ-1t2bmm0G5d-00lhcQ; Thu, 16
 Jan 2025 09:20:09 +0100
Message-ID: <4d6ccc9a-3db9-4d5b-87c9-267b659c2a1b@gmx.de>
Date: Thu, 16 Jan 2025 09:20:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cgroup/dmem: Don't clobber pool in
 dmem_cgroup_calculate_protection
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, cgroups@vger.kernel.org
References: <20250114153912.278909-1-friedrich.vock@gmx.de>
 <ijjhmxsu5l7nvabyorzqxd5b5xml7eantom4wtgdwqeq7bmy73@cz7doxxi57ig>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
In-Reply-To: <ijjhmxsu5l7nvabyorzqxd5b5xml7eantom4wtgdwqeq7bmy73@cz7doxxi57ig>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9vRwhu7cYH3l3nQNyx4UESIEEF6MUpfdauZlOt/NmAn3SLx/gPy
 JWhXXtrBcX6D6Cpg6HB8EJZYq/vUQxihciR2Fk7rtwXn7CWHeuxeVvoglNGVHbk5lPEjNyr
 UK2FzmEp6Wfg5nCymfv4fCOp3oA7lZYcZLDfFlcv7R2QAh83ReymaLZRNl5ZQLmKjKUHW1Q
 S2lIiWfIaEfMm7n9Hc4Kw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Cu/3UwpS19U=;v5KsVh8RdsptcHqNt75KrsHadhC
 lwZbeJWl10DGv9Xy4Jb7uE8LlGx+IZ5VGAKI4WIxm5n9+w2s+WMPixi74PjLJDVmW0JjKNxL6
 zX7zKLAUIqtF5OGyRbjbKNLI65vWITTkugcQJMXzCkBG6JTjMwvZNNJm90U1MKZQ2otr8E9ic
 0u5US7Mu6mnsxR95uRVC0AmGJahcu8MZvTnEuU7HYx3n5reTi5qBWlXgyEx5P0EqeUk/cORSw
 dy2De15F9+J+nIm1k4LJN+5PIgEQXcB02cV3FdcNFY51mNaMlIxiSiO8qEse1Ra6DpTqHhKKl
 9+kfATRgPUA8GKfyuW0mJHsWJ3lm2dtiKnqOJqocMyMXOP5l7mJhOvz3YYB8yHESGW2SYoBSS
 ZOtzbnOIv1s+qDPuNamvfo6cI/ZSbmqVA9yi8GlZhEpRDVJ+GRmFu45Wo1EIZUtGYhfypD7Ml
 2OvzHWooM2HV/bAFcPrGFsYkgTW9La4LPBDNDaIaM+LIAEoHn+/wlunNbiPhx1oDdscL14do5
 6vnIbIYspor0lfUFR5bN3qmwJvs/1gdPLFTrczglvZzluSY7Cyaysx39IiDaowilnJ5cuLDTP
 6PC6ltWY1woiUaZgWQEcZLSzZ6NGgpXQ3cIpXPQKQmB6MDjonjt9yVehX/etix0KEalRdjQ2m
 sTlpTC1fu/OClNxzAslAgmn8rGDK42chfZe8DT9Q0I3jQ3AX8NhM9Krwd/n8wQ42QN21L+qLq
 6L3Nd27UPj45L47oyILg2SRVm7yTbnMJ7JJc/FTjsNfkfaGPypbMjIhYAmKi4tZ2N1Sy5cN70
 wRlzcm9llSEW1I3gRiUswrhj+YWaRfdSFrxt1rV5xghjjUGdxbKa5OA1MCwLi8ndPq+YPh3v/
 6EeXUeeUdGMFP98MwSXyiFHYgrPszLhVTvb8GHjd2bpxbBn5ydTjNRI7qdWufp39PixHT8aqt
 KxVAXSUvmyoeYhtfCeH9RruQuE2k0pyhJUP0VbP13Be9EjJ4VjFEp913xRFYel8Dp/aFzr9Yv
 /o+ltN5i5mdWc8klT4/2A7AvqVxpZO2gHI22qdTsFQ3gtOpC+bWfZKAVbUl8ZSfDNJIxZJ/sO
 sZnxmml6jQWfj2kbSSUOfgHGIXBsEW77+BbWF5Cd6nfJ7aM8U3yleokTCbiDRegCYgm3WmhW6
 7vDTXD8Fft81Vt/xEoCyoeANVx89T5nJNxNJ0EcOXBA==
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

On 14.01.25 16:58, Michal Koutn=C3=BD wrote:
> On Tue, Jan 14, 2025 at 04:39:12PM +0100, Friedrich Vock <friedrich.vock=
@gmx.de> wrote:
>> If the current css doesn't contain any pool that is a descendant of
>> the "pool" (i.e. when found_descendant =3D=3D false), then "pool" will
>> point to some unrelated pool. If the current css has a child, we'll
>> overwrite parent_pool with this unrelated pool on the next iteration.
>
> Could this be verified with more idiomatic way with
> cgroup_is_descendant()? (The predicate could be used between pools [1]
> if they pin respective cgroups).

I'm not sure if I'm missing something, but I don't think
cgroup_is_descendant is really related to this issue. Each css can
contain some amount of "pools" representing memory from different
devices (e.g. with the current DRM implementation, one pool corresponds
to VRAM of a specific GPU). These pools are allocated on-demand, so if a
cgroup has not made any allocations for a specific device, there will be
no pool corresponding to that device's memory. Pools have a hierarchy of
their own (that is, for a given cgroup's pool corresponding to some
device, the "parent pool" refers to the parent cgroup's pool
corresponding to the same device).

In dmem_cgroup_calculate_protection, we're trying to update the
protection values for the entire pool hierarchy between
limit_pool/test_pool (with the end goal of having accurate
effective-protection values for test_pool). Since pools only store
parent pointers to establish that hierarchy, to find child pools given
only the parent pool, we iterate over the pools of all child cgroups and
check if the parent pointer matches with our current "parent pool" pointer=
.

The bug happens when some cgroup doesn't have any pool in the hierarchy
we're iterating over (that is, we iterate over all pools but don't find
any pool whose parent matches our current "parent pool" pointer). The
cgroup itself is part of the (cgroup) hierarchy, so the result of
cgroup_is_descendant is obviously true - but because of how we allocate
pools on-demand, it's still possible there is no pool that is part of
the (pool) hierarchy we're iterating over.

Thanks,
Friedrich

>
> Thanks,
> Michal
>
> [1] https://lore.kernel.org/all/uj6railxyazpu6ocl2ygo6lw4lavbsgg26oq57px=
xqe5uzxw42@fhnqvq3tia6n/

