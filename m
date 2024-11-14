Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBB79C850F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 09:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A603310E02E;
	Thu, 14 Nov 2024 08:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="E90p/7+r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B487710E02E;
 Thu, 14 Nov 2024 08:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1731573944; x=1732178744; i=friedrich.vock@gmx.de;
 bh=bBiS93keTtOV2wmpsF/4OYOptNtUkrWM+gAlc78zg6w=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=E90p/7+rKpon+x/kiE1aYnGsmL9gcdI7BEy82KaEcO9UoKG7MMtYL9jlK8OJGSfI
 T0bBs+cXH6vxEDnsHRX43ZGJ9lBogMhYEeiL4gh9EzzMrzca86ypLAwXOhckth0cD
 uWnnALlgxCpU/a0uE8424j1qtFqlaU7qTPlbjwXy5VOonarTsdaD4o5xydizwF21U
 wpLV0r8OWM62rNMQBz7ir4YncdpTFFI5Gs7qOeCZxucYpeFn8SNeygrvbKZeTXXeb
 k16rQt61aeOEDajkX3Ro3qkiHmJvIBy0fl47YimafHOROFLg5znW3W8q28TT5vUFb
 CXHg1x+80S9BZe5P0g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.35.78] ([134.34.7.78]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4zAs-1tsIxg21Se-00wxRt; Thu, 14
 Nov 2024 09:45:44 +0100
Message-ID: <b7a4b0ad-81ca-4124-a117-4ed7baa99d8d@gmx.de>
Date: Thu, 14 Nov 2024 09:45:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] kernel/cgroup: Add "dev" memory accounting cgroup
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org,
 Maxime Ripard <mripard@kernel.org>
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
 <20241023075302.27194-2-maarten.lankhorst@linux.intel.com>
 <91125995-3a33-4971-a581-e6e24ccf0b47@gmx.de>
 <a3484c87-fefb-46f3-908e-d31474145a85@linux.intel.com>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
In-Reply-To: <a3484c87-fefb-46f3-908e-d31474145a85@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iDOpL3zIRDKX3KV2RISn2OPy/x/eCaRwZCjR/si/J8APj9mRlyR
 sqkptdF4qBNZJ1YSEqmLfk72J/gL1voNDwTTC+/w4/VQBSEWMpKLg+0G4U0+3OD3etpWSGi
 gGiIpCQyxW0nIwGMN361YmqDqNPZ6rYnDRSY+VZYDcQsyxfiD4NSTZhFcbIe0blvGCH9EZm
 3OoN+XmaHmk8MornHAlDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uHi1/ViB1YE=;4yBSNREK7kml6ekvAsy7RHT9aWB
 4vZIb8GRW+SPzyv6f5t3R3oTguDm0XsQELDvRUc8/nyuRU3UqagPN3izXBjJuHEQ4RIbPzte5
 Rqj7552kv+f7aNBziB2nA0OUQhkkf5P23TE5ELQTaQJ4jxJfGmjxpv18/mqzUIj7zie8ektM3
 sTZ+xmSZPmIt+nro9lFnCVVNTTlmt6xZBriHtgcOqwX6EO60Wv3C6MwRDj2bgQs3LggCPAVX3
 MbOocUIjy4DJ2OiSfRs2N+3vr5gWED3mh2wN+z8Dhr16Spt3Otiat5QtBvkDVR7JF/JQ0GDaY
 cjr0uVVj0OD5evfgYLO1NAYQsq5oFQRzkp3PxWlSFtbhc5gFWPNxVlRvSHOh4Amf5FPayx1uJ
 9GWKPy839ClSYcuY2WSk06Ok8jA4ZD0pSsKRWPJgnRgjOySOOYY7joxA97CuAhdY87p+ITINQ
 oCJlN3Vfw2P/sSp8ONinSVmO/4/ck9ThxZu8RqZT4xu/IaNbf/WnsM1nF43GKvzHd8BDcMi1R
 BZkHnPrUXl0K/SGpqhkYs70WGmJZeV8wJcfaeHRta98zN60TMef21vLnJBttZST2UzJkf87FA
 ZtFKu41A4HHumwwG+Y6jS5eHB7lNK+j1jAr+ip3lQYPOwxL0m/Qov9wn/HRDYTgmOI/rV31/q
 JVdhuthDZ3Fy6wkhasbodoEPReb0lxAwNPjdlUpb4OZOtwBQkGfXrFpxZYniqMjQxoJ+dkees
 GLkZuRUMPUMkJ2uRfnO5+KyIRJ40Sf6BwlJH/ukIPTVPtzSLdlrpE4La1hyuJ90g5/38NGuXb
 gMbAJylcHppE0EDuMfhZkLZ2Gw4HbsFPsWXXua91kMna2OT6bl5Ok0g2T2vPYL7ztq0hOV2Zj
 M0kCB0h0K35PXB7vMGruZwd9ZzIJWsSj3oJEWQFG6SwrqYYKz0JqMeKHD
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

On 11.11.24 23:53, Maarten Lankhorst wrote:
>
>
> Den 2024-10-28 kl. 15:53, skrev Friedrich Vock:
>> On 23.10.24 09:52, Maarten Lankhorst wrote:
>>> The initial version was based roughly on the rdma and misc cgroup
>>> controllers, with a lot of the accounting code borrowed from rdma.
>>>
>>> The current version is a complete rewrite with page counter; it uses
>>> the same min/low/max semantics as the memory cgroup as a result.
>>>
>>> There's a small mismatch as TTM uses u64, and page_counter long pages.
>>> In practice it's not a problem. 32-bits systems don't really come with
>>>> =3D4GB cards and as long as we're consistently wrong with units, it's
>>> fine. The device page size may not be in the same units as kernel page
>>> size, and each region might also have a different page size (VRAM vs
>>> GART
>>> for example).
>>>
>>> The interface is simple:
>>> - populate dev_cgroup_try_charge->regions[..] name and size for each
>>> active
>>> =C2=A0=C2=A0 region, set num_regions accordingly.
>>> - Call (dev,drmm)_cgroup_register_device()
>>> - Use dev_cgroup_try_charge to check if you can allocate a chunk of
>>> memory,
>>> =C2=A0=C2=A0 use dev_cgroup__uncharge when freeing it. This may return=
 an error
>>> code,
>>> =C2=A0=C2=A0 or -EAGAIN when the cgroup limit is reached. In that case=
 a reference
>>> =C2=A0=C2=A0 to the limiting pool is returned.
>>> - The limiting cs can be used as compare function for
>>> =C2=A0=C2=A0 dev_cgroup_state_evict_valuable.
>>> - After having evicted enough, drop reference to limiting cs with
>>> =C2=A0=C2=A0 dev_cgroup_pool_state_put.
>>>
>>> This API allows you to limit device resources with cgroups.
>>> You can see the supported cards in /sys/fs/cgroup/dev.region.capacity
>>> You need to echo +dev to cgroup.subtree_control, and then you can
>>> partition memory.
>>>
>>> Co-developed-by: Friedrich Vock <friedrich.vock@gmx.de>
>>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>>> Co-developed-by: Maxime Ripard <mripard@kernel.org>
>>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> ---
>>> =C2=A0 Documentation/admin-guide/cgroup-v2.rst |=C2=A0 51 ++
>>> =C2=A0 Documentation/core-api/cgroup.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 9 +
>>> =C2=A0 Documentation/core-api/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>> =C2=A0 Documentation/gpu/drm-compute.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 54 ++
>>> =C2=A0 include/linux/cgroup_dev.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 91 +++
>>> =C2=A0 include/linux/cgroup_subsys.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
>>> =C2=A0 include/linux/page_counter.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>> =C2=A0 init/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +
>>> =C2=A0 kernel/cgroup/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
>>> =C2=A0 kernel/cgroup/dev.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 893 ++++++++++++++++++++++++
>>> =C2=A0 mm/page_counter.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
>>> =C2=A0 11 files changed, 1114 insertions(+), 3 deletions(-)
>>> =C2=A0 create mode 100644 Documentation/core-api/cgroup.rst
>>> =C2=A0 create mode 100644 Documentation/gpu/drm-compute.rst
>>> =C2=A0 create mode 100644 include/linux/cgroup_dev.h
>>> =C2=A0 create mode 100644 kernel/cgroup/dev.c
>>>
>>> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/
>>> admin-guide/cgroup-v2.rst
>>> index 69af2173555fb..e8fe79244af9c 100644
>>> --- a/Documentation/admin-guide/cgroup-v2.rst
>>> +++ b/Documentation/admin-guide/cgroup-v2.rst
>>> @@ -2612,6 +2612,57 @@ RDMA Interface Files
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mlx4_0 hca_handle=3D1 hca_o=
bject=3D20
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ocrdma1 hca_handle=3D1 hca_=
object=3D23
>>>
>>> +DEV
>>> +----
>>> +
>>> +The "dev" controller regulates the distribution and accounting of
>>> +device resources, currently only memory regions. Because each memory
>>> +region may have its own page size, which does not have to be equal
>>> +to the system page size. the units are in bytes.
>>> +
>>> +DEV Interface Files
>>> +~~~~~~~~~~~~~~~~~~~~
>>> +
>>> +=C2=A0 dev.region.max, dev.region.min, dev.region.low
>>> +=C2=A0=C2=A0=C2=A0 A readwrite nested-keyed file that exists for all =
the cgroups
>>> +=C2=A0=C2=A0=C2=A0 except root that describes current configured reso=
urce limit
>>> +=C2=A0=C2=A0=C2=A0 for a device.
>>> +
>>> +=C2=A0=C2=A0=C2=A0 Lines are keyed by device name and are not ordered=
.
>>> +=C2=A0=C2=A0=C2=A0 Each line contains space separated resource name a=
nd its configured
>>> +=C2=A0=C2=A0=C2=A0 limit that can be distributed.
>>> +
>>> +=C2=A0=C2=A0=C2=A0 The following nested keys are defined.
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Maximum amount of bytes that allocatable in this region
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +=C2=A0=C2=A0=C2=A0 An example for xe follows::
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/0000:03:00.0 vram0=3D1073741824 st=
olen=3Dmax
>>> +
>>> +=C2=A0=C2=A0=C2=A0 The semantics are the same as for the memory cgrou=
p controller,
>>> and are
>>> +=C2=A0=C2=A0=C2=A0 calculated in the same way.
>>> +
>>> +=C2=A0 dev.region.capacity
>>> +=C2=A0=C2=A0=C2=A0 A read-only file that describes maximum region cap=
acity.
>>> +=C2=A0=C2=A0=C2=A0 It only exists on the root cgroup. Not all memory =
can be
>>> +=C2=A0=C2=A0=C2=A0 allocated by cgroups, as the kernel reserves some =
for
>>> +=C2=A0=C2=A0=C2=A0 internal use.
>>> +
>>> +=C2=A0=C2=A0=C2=A0 An example for xe follows::
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/0000:03:00.0 vram0=3D8514437120 st=
olen=3D67108864
>>> +
>>> +=C2=A0 dev.region.current
>>> +=C2=A0=C2=A0=C2=A0 A read-only file that describes current resource u=
sage.
>>> +=C2=A0=C2=A0=C2=A0 It exists for all the cgroup except root.
>>> +
>>> +=C2=A0=C2=A0=C2=A0 An example for xe follows::
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/0000:03:00.0 vram0=3D12550144 stol=
en=3D8650752
>>> +
>>> =C2=A0 HugeTLB
>>> =C2=A0 -------
>>>
>>> diff --git a/Documentation/core-api/cgroup.rst b/Documentation/core-
>>> api/cgroup.rst
>>> new file mode 100644
>>> index 0000000000000..475b32255bd68
>>> --- /dev/null
>>> +++ b/Documentation/core-api/cgroup.rst
>>> @@ -0,0 +1,9 @@
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +Cgroup Kernel APIs
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +Device Cgroup API (devcg)
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>>> +.. kernel-doc:: kernel/cgroup/dev.c
>>> +=C2=A0=C2=A0 :export:
>>> +
>>> diff --git a/Documentation/core-api/index.rst b/Documentation/core-
>>> api/index.rst
>>> index 6a875743dd4b7..dbd6c4f9a6313 100644
>>> --- a/Documentation/core-api/index.rst
>>> +++ b/Documentation/core-api/index.rst
>>> @@ -108,6 +108,7 @@ more memory-management documentation in
>>> Documentation/mm/index.rst.
>>> =C2=A0=C2=A0=C2=A0=C2=A0 dma-isa-lpc
>>> =C2=A0=C2=A0=C2=A0=C2=A0 swiotlb
>>> =C2=A0=C2=A0=C2=A0=C2=A0 mm-api
>>> +=C2=A0=C2=A0 cgroup
>>> =C2=A0=C2=A0=C2=A0=C2=A0 genalloc
>>> =C2=A0=C2=A0=C2=A0=C2=A0 pin_user_pages
>>> =C2=A0=C2=A0=C2=A0=C2=A0 boot-time-mm
>>> diff --git a/Documentation/gpu/drm-compute.rst b/Documentation/gpu/
>>> drm-compute.rst
>>> new file mode 100644
>>> index 0000000000000..116270976ef7a
>>> --- /dev/null
>>> +++ b/Documentation/gpu/drm-compute.rst
>>> @@ -0,0 +1,54 @@
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +Long running workloads and compute
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +Long running workloads (compute) are workloads that will not
>>> complete in 10
>>> +seconds. (The time let the user wait before he reaches for the power
>>> button).
>>> +This means that other techniques need to be used to manage those
>>> workloads,
>>> +that cannot use fences.
>>> +
>>> +Some hardware may schedule compute jobs, and have no way to pre-empt
>>> them, or
>>> +have their memory swapped out from them. Or they simply want their
>>> workload
>>> +not to be preempted or swapped out at all.
>>> +
>>> +This means that it differs from what is described in driver-api/dma-
>>> buf.rst.
>>> +
>>> +As with normal compute jobs, dma-fence may not be used at all. In
>>> this case,
>>> +not even to force preemption. The driver with is simply forced to
>>> unmap a BO
>>> +from the long compute job's address space on unbind immediately, not
>>> even
>>> +waiting for the workload to complete. Effectively this terminates
>>> the workload
>>> +when there is no hardware support to recover.
>>> +
>>> +Since this is undesirable, there need to be mitigations to prevent a
>>> workload
>>> +from being terminated. There are several possible approach, all with
>>> their
>>> +advantages and drawbacks.
>>> +
>>> +The first approach you will likely try is to pin all buffers used by
>>> compute.
>>> +This guarantees that the job will run uninterrupted, but also allows
>>> a very
>>> +denial of service attack by pinning as much memory as possible,
>>> hogging the
>>> +all GPU memory, and possibly a huge chunk of CPU memory.
>>> +
>>> +A second approach that will work slightly better on its own is
>>> adding an option
>>> +not to evict when creating a new job (any kind). If all of userspace
>>> opts in
>>> +to this flag, it would prevent cooperating userspace from forced
>>> terminating
>>> +older compute jobs to start a new one.
>>> +
>>> +If job preemption and recoverable pagefaults are not available,
>>> those are the
>>> +only approaches possible. So even with those, you want a separate
>>> way of
>>> +controlling resources. The standard kernel way of doing so is cgroups=
.
>>> +
>>> +This creates a third option, using cgroups to prevent eviction. Both
>>> GPU and
>>> +driver-allocated CPU memory would be accounted to the correct
>>> cgroup, and
>>> +eviction would be made cgroup aware. This allows the GPU to be
>>> partitioned
>>> +into cgroups, that will allow jobs to run next to each other without
>>> +interference.
>>> +
>>> +The interface to the cgroup would be similar to the current CPU memor=
y
>>> +interface, with similar semantics for min/low/high/max, if eviction c=
an
>>> +be made cgroup aware. For now only max is implemented.
>>> +
>>> +What should be noted is that each memory region (tiled memory for
>>> example)
>>> +should have its own accounting, using $card key0 =3D value0 key1 =3D
>>> value1.
>>> +
>>> +The key is set to the regionid set by the driver, for example "tile0"=
.
>>> +For the value of $card, we use drmGetUnique().
>>> diff --git a/include/linux/cgroup_dev.h b/include/linux/cgroup_dev.h
>>> new file mode 100644
>>> index 0000000000000..c6311d1d3ce48
>>> --- /dev/null
>>> +++ b/include/linux/cgroup_dev.h
>>> @@ -0,0 +1,91 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright =C2=A9 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _CGROUP_DEV_H
>>> +#define _CGROUP_DEV_H
>>> +
>>> +#include <linux/types.h>
>>> +#include <linux/llist.h>
>>> +
>>> +struct dev_cgroup_pool_state;
>>> +
>>> +/*
>>> + * Use 8 as max, because of N^2 lookup when setting things, can be
>>> bumped if needed
>>> + * Identical to TTM_NUM_MEM_TYPES to allow simplifying that code.
>>> + */
>>> +#define DEVICE_CGROUP_MAX_REGIONS 8
>>> +
>>> +/* Public definition of cgroup device, should not be modified after
>>> _register() */
>>> +struct dev_cgroup_device {
>>> +=C2=A0=C2=A0=C2=A0 struct {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 size;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *name;
>>> +=C2=A0=C2=A0=C2=A0 } regions[DEVICE_CGROUP_MAX_REGIONS];
>>> +
>>> +=C2=A0=C2=A0=C2=A0 int num_regions;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* used by cgroups, do not use */
>>> +=C2=A0=C2=A0=C2=A0 void *priv;
>>> +};
>>> +
>>> +#if IS_ENABLED(CONFIG_CGROUP_DEV)
>>> +int dev_cgroup_register_device(struct dev_cgroup_device *cgdev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *name);
>>> +void dev_cgroup_unregister_device(struct dev_cgroup_device *cgdev);
>>> +int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 u32 index, u64 size,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct dev_cgroup_pool_state **ret_pool,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct dev_cgroup_pool_state **ret_limit_pool);
>>> +void dev_cgroup_uncharge(struct dev_cgroup_pool_state *pool,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 u32 index, u64 size);
>>> +bool dev_cgroup_state_evict_valuable(struct dev_cgroup_device *dev,
>>> int index,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_cgroup_pool=
_state *limit_pool,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_cgroup_pool=
_state *test_pool,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ignore_low, bool =
*ret_hit_low);
>>> +
>>> +void dev_cgroup_pool_state_put(struct dev_cgroup_pool_state *pool);
>>> +#else
>>> +static inline int
>>> +dev_cgroup_register_device(struct dev_cgroup_device *cgdev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 const char *name)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +
>>> +static inline void dev_cgroup_unregister_device(struct
>>> dev_cgroup_device *cgdev)
>>> +{
>>> +}
>>> +
>>> +static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 index, u64 size,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_cgroup_pool=
_state **ret_pool,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_cgroup_pool=
_state **ret_limit_pool);
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 *ret_pool =3D NULL;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (ret_limit_pool)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *ret_limit_pool =3D NULL;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +
>>> +static inline void dev_cgroup_uncharge(struct dev_cgroup_pool_state
>>> *pool,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 index,=
 u64 size)
>>> +{ }
>>> +
>>> +static inline
>>> +bool dev_cgroup_state_evict_valuable(struct dev_cgroup_device *dev,
>>> int index,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_cgroup_pool=
_state *limit_pool,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_cgroup_pool=
_state *test_pool,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ignore_low, bool =
*ret_hit_low)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return true;
>>> +}
>>> +
>>> +static inline void dev_cgroup_pool_state_put(struct
>>> dev_cgroup_pool_state *pool)
>>> +{ }
>>> +
>>> +#endif
>>> +#endif=C2=A0=C2=A0=C2=A0 /* _CGROUP_DEV_H */
>>> diff --git a/include/linux/cgroup_subsys.h b/include/linux/
>>> cgroup_subsys.h
>>> index 4452354872307..898340cfe5843 100644
>>> --- a/include/linux/cgroup_subsys.h
>>> +++ b/include/linux/cgroup_subsys.h
>>> @@ -65,6 +65,10 @@ SUBSYS(rdma)
>>> =C2=A0 SUBSYS(misc)
>>> =C2=A0 #endif
>>>
>>> +#if IS_ENABLED(CONFIG_CGROUP_DEV)
>>> +SUBSYS(dev)
>>> +#endif
>>> +
>>> =C2=A0 /*
>>> =C2=A0=C2=A0 * The following subsystems are not supported on the defau=
lt
>>> hierarchy.
>>> =C2=A0=C2=A0 */
>>> diff --git a/include/linux/page_counter.h b/include/linux/page_counter=
.h
>>> index 79dbd8bc35a72..d75376a1694ee 100644
>>> --- a/include/linux/page_counter.h
>>> +++ b/include/linux/page_counter.h
>>> @@ -96,7 +96,7 @@ static inline void
>>> page_counter_reset_watermark(struct page_counter *counter)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 counter->watermark =3D usage;
>>> =C2=A0 }
>>>
>>> -#ifdef CONFIG_MEMCG
>>> +#if IS_ENABLED(CONFIG_MEMCG) || IS_ENABLED(CONFIG_CGROUP_DEVICE)
>>> =C2=A0 void page_counter_calculate_protection(struct page_counter *roo=
t,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct page_counter *counter,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bool recursive_protection);
>>> diff --git a/init/Kconfig b/init/Kconfig
>>> index 530a382ee0feb..2da595facd97f 100644
>>> --- a/init/Kconfig
>>> +++ b/init/Kconfig
>>> @@ -1123,6 +1123,13 @@ config CGROUP_RDMA
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Attaching processes with ac=
tive RDMA resources to the cgroup
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hierarchy is allowed even i=
f can cross the hierarchy's limit.
>>>
>>> +config CGROUP_DEV
>>> +=C2=A0=C2=A0=C2=A0 bool "Device controller"
>>> +=C2=A0=C2=A0=C2=A0 help
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Provides the device subsystem controll=
er.
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
>>> +
>>> =C2=A0 config CGROUP_FREEZER
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool "Freezer controller"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
>>> diff --git a/kernel/cgroup/Makefile b/kernel/cgroup/Makefile
>>> index a5c9359d516f8..441d346fdc51f 100644
>>> --- a/kernel/cgroup/Makefile
>>> +++ b/kernel/cgroup/Makefile
>>> @@ -7,4 +7,5 @@ obj-$(CONFIG_CGROUP_RDMA) +=3D rdma.o
>>> =C2=A0 obj-$(CONFIG_CPUSETS) +=3D cpuset.o
>>> =C2=A0 obj-$(CONFIG_CPUSETS_V1) +=3D cpuset-v1.o
>>> =C2=A0 obj-$(CONFIG_CGROUP_MISC) +=3D misc.o
>>> +obj-$(CONFIG_CGROUP_DEV) +=3D dev.o
>>> =C2=A0 obj-$(CONFIG_CGROUP_DEBUG) +=3D debug.o
>>> diff --git a/kernel/cgroup/dev.c b/kernel/cgroup/dev.c
>>> new file mode 100644
>>> index 0000000000000..e422ccbfbc444
>>> --- /dev/null
>>> +++ b/kernel/cgroup/dev.c
>>> @@ -0,0 +1,893 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright 2023-2024 Intel Corporation (Maarten Lankhorst
>>> <dev@lankhorst.se>)
>>> + * Copyright 2024 Red Hat (Maxime Ripard <mripard@kernel.org>)
>>> + * Partially based on the rdma and misc controllers, which bear the
>>> following copyrights:
>>> + *
>>> + * Copyright 2020 Google LLC
>>> + * Copyright (C) 2016 Parav Pandit <pandit.parav@gmail.com>
>>> + */
>>> +
>>> +#include <linux/cgroup.h>
>>> +#include <linux/cgroup_dev.h>
>>> +#include <linux/list.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/page_counter.h>
>>> +#include <linux/parser.h>
>>> +#include <linux/slab.h>
>>> +
>>> +struct devcg_device {
>>> +=C2=A0=C2=A0=C2=A0 /**
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * @ref: References keeping the device alive.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Keeps the device reference alive after a s=
uccesful RCU lookup.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 struct kref ref;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /** @rcu: RCU head for freeing */
>>> +=C2=A0=C2=A0=C2=A0 struct rcu_head rcu;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /**
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * @dev_node: Linked into &devcg_devices list=
.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Protected by RCU and global spinlock.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 struct list_head dev_node;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /**
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * @pools: List of pools linked to this devic=
e.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Protected by global spinlock only
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 struct list_head pools;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /**
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * @base: Copy of the struct passed on regist=
er.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * A copy is made to prevent lifetime issues.=
 devcg_device may
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * be kept alive when changing cgroups values=
 concurrently through
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * rcu lookups.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 struct dev_cgroup_device base;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /** @name: Name describing the node, set by
>>> dev_cgroup_register_device */
>>> +=C2=A0=C2=A0=C2=A0 const char *name;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /**
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * @unregistered: Whether the device is unreg=
istered by its caller.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * No new pools should be added to the device=
 afterwards.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 bool unregistered;
>>> +};
>>> +
>>> +struct devcg_state {
>>> +=C2=A0=C2=A0=C2=A0 struct cgroup_subsys_state css;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 struct list_head pools;
>>> +};
>>> +
>>> +struct dev_cgroup_pool_state {
>>> +=C2=A0=C2=A0=C2=A0 struct devcg_device *device;
>>> +=C2=A0=C2=A0=C2=A0 struct devcg_state *cs;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* css node, RCU protected against device teardown=
 */
>>> +=C2=A0=C2=A0=C2=A0 struct list_head=C2=A0=C2=A0=C2=A0 css_node;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* dev node, no RCU protection required */
>>> +=C2=A0=C2=A0=C2=A0 struct list_head=C2=A0=C2=A0=C2=A0 dev_node;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 int num_res, inited;
>>> +=C2=A0=C2=A0=C2=A0 struct rcu_head rcu;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 struct devcg_pool_res {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page_counter cnt;
>>> +=C2=A0=C2=A0=C2=A0 } resources[];
>>> +};
>>> +
>>> +/*
>>> + * 3 operations require locking protection:
>>> + * - Registering and unregistering device to/from list, requires
>>> global lock.
>>> + * - Adding a dev_cgroup_pool_state to a CSS, removing when CSS is
>>> freed.
>>> + * - Adding a dev_cgroup_pool_state to a device list.
>>> + *
>>> + * Since for the most common operations RCU provides enough
>>> protection, I
>>> + * do not think more granular locking makes sense. Most protection
>>> is offered
>>> + * by RCU and the lockless operating page_counter.
>>> + */
>>> +static DEFINE_SPINLOCK(devcg_lock);
>>> +static LIST_HEAD(devcg_devices);
>>> +
>>> +static inline struct devcg_state *
>>> +css_to_devcs(struct cgroup_subsys_state *css)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return container_of(css, struct devcg_state, css);
>>> +}
>>> +
>>> +static inline struct devcg_state *get_current_devcs(void)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return css_to_devcs(task_get_css(current, dev_cgrp=
_id));
>>> +}
>>> +
>>> +static struct devcg_state *parent_devcs(struct devcg_state *cg)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return cg->css.parent ? css_to_devcs(cg->css.paren=
t) : NULL;
>>> +}
>>> +
>>> +static void free_cg_pool(struct dev_cgroup_pool_state *pool)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 list_del(&pool->dev_node);
>>> +=C2=A0=C2=A0=C2=A0 kfree(pool);
>>> +}
>>> +
>>> +static void
>>> +set_resource_min(struct dev_cgroup_pool_state *pool, int i, u64 val)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 page_counter_set_min(&pool->resources[i].cnt, val)=
;
>>> +}
>>> +
>>> +static void
>>> +set_resource_low(struct dev_cgroup_pool_state *pool, int i, u64 val)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 page_counter_set_low(&pool->resources[i].cnt, val)=
;
>>> +}
>>> +
>>> +static void
>>> +set_resource_max(struct dev_cgroup_pool_state *pool, int i, u64 val)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 page_counter_set_max(&pool->resources[i].cnt, val)=
;
>>> +}
>>> +
>>> +static u64 get_resource_low(struct dev_cgroup_pool_state *pool, int
>>> idx)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return pool ? READ_ONCE(pool->resources[idx].cnt.l=
ow) : 0;
>>> +}
>>> +
>>> +static u64 get_resource_min(struct dev_cgroup_pool_state *pool, int
>>> idx)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return pool ? READ_ONCE(pool->resources[idx].cnt.m=
in) : 0;
>>> +}
>>> +
>>> +static u64 get_resource_max(struct dev_cgroup_pool_state *pool, int
>>> idx)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return pool ? READ_ONCE(pool->resources[idx].cnt.m=
ax) :
>>> PAGE_COUNTER_MAX;
>>> +}
>>> +
>>> +static u64 get_resource_current(struct dev_cgroup_pool_state *pool,
>>> int idx)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return pool ? page_counter_read(&pool->resources[i=
dx].cnt) : 0;
>>> +}
>>> +
>>> +static void reset_all_resource_limits(struct dev_cgroup_pool_state
>>> *rpool)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 int i;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < rpool->num_res; i++) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_resource_min(rpool, i,=
 0);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_resource_low(rpool, i,=
 0);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_resource_max(rpool, i,=
 PAGE_COUNTER_MAX);
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +}
>>> +
>>> +static void devcs_offline(struct cgroup_subsys_state *css)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct devcg_state *devcs =3D css_to_devcs(css);
>>> +=C2=A0=C2=A0=C2=A0 struct dev_cgroup_pool_state *pool;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 rcu_read_lock();
>>> +=C2=A0=C2=A0=C2=A0 list_for_each_entry_rcu(pool, &devcs->pools, css_n=
ode)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset_all_resource_limits(=
pool);
>>> +=C2=A0=C2=A0=C2=A0 rcu_read_unlock();
>>> +}
>>> +
>>> +static void devcs_free(struct cgroup_subsys_state *css)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct devcg_state *devcs =3D css_to_devcs(css);
>>> +=C2=A0=C2=A0=C2=A0 struct dev_cgroup_pool_state *pool, *next;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 spin_lock(&devcg_lock);
>>> +=C2=A0=C2=A0=C2=A0 list_for_each_entry_safe(pool, next, &devcs->pools=
, css_node) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *The pool is dead an=
d all references are 0,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * no need for RCU pr=
otection with list_del_rcu or freeing.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_del(&pool->css_node);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free_cg_pool(pool);
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 spin_unlock(&devcg_lock);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 kfree(devcs);
>>> +}
>>> +
>>> +static struct cgroup_subsys_state *
>>> +devcs_alloc(struct cgroup_subsys_state *parent_css)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct devcg_state *devcs =3D kzalloc(sizeof(*devc=
s), GFP_KERNEL);
>>> +=C2=A0=C2=A0=C2=A0 if (!devcs)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(-ENOMEM);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&devcs->pools);
>>> +=C2=A0=C2=A0=C2=A0 return &devcs->css;
>>> +}
>>> +
>>> +static struct dev_cgroup_pool_state *
>>> +find_cg_pool_locked(struct devcg_state *devcs, struct devcg_device
>>> *dev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct dev_cgroup_pool_state *pool;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 list_for_each_entry_rcu(pool, &devcs->pools, css_n=
ode,
>>> spin_is_locked(&devcg_lock))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pool->device =3D=3D de=
v)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn pool;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return NULL;
>>> +}
>>> +
>>> +static struct dev_cgroup_pool_state *pool_parent(struct
>>> dev_cgroup_pool_state *pool)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 if (!pool->resources[0].cnt.parent)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return container_of(pool->resources[0].cnt.parent,
>>> typeof(*pool), resources[0].cnt);
>>> +}
>>> +
>>> +/**
>>> + * dev_cgroup_state_evict_valuable() - Check if we should evict from
>>> test_pool
>>> + * @dev: &dev_cgroup_device
>>> + * @index: The index number of the region being tested.
>>> + * @limit_pool: The pool for which we hit limits
>>> + * @test_pool: The pool for which to test
>>> + * @ignore_low: Whether we have to respect low watermarks.
>>> + * @ret_hit_low: Pointer to whether it makes sense to consider low
>>> watermark.
>>> + *
>>> + * This function returns true if we can evict from @test_pool, false
>>> if not.
>>> + * When returning false and @ignore_low is false, @ret_hit_low may
>>> + * be set to true to indicate this function can be retried with
>>> @ignore_low
>>> + * set to true.
>>> + *
>>> + * Return: bool
>>> + */
>>> +bool dev_cgroup_state_evict_valuable(struct dev_cgroup_device *dev,
>>> int index,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_cgroup_pool=
_state *limit_pool,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_cgroup_pool=
_state *test_pool,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ignore_low, bool =
*ret_hit_low)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct dev_cgroup_pool_state *pool =3D test_pool;
>>> +=C2=A0=C2=A0=C2=A0 struct page_counter *climit, *ctest;
>>> +=C2=A0=C2=A0=C2=A0 u64 used, min, low;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Can always evict from current pool, despite lim=
its */
>>> +=C2=A0=C2=A0=C2=A0 if (limit_pool =3D=3D test_pool)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (limit_pool) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!parent_devcs(limit_po=
ol->cs))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn true;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (pool =3D test_pool; p=
ool && limit_pool !=3D pool; pool =3D
>>> pool_parent(pool))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {}
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!pool)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn false;
>>> +=C2=A0=C2=A0=C2=A0 } else {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If there is no cgr=
oup limiting memory usage, use the root
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * cgroup instead for=
 limit calculations.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (limit_pool =3D test_p=
ool; pool_parent(limit_pool);
>>> limit_pool =3D pool_parent(limit_pool))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {}
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 climit =3D &limit_pool->resources[index].cnt;
>>> +=C2=A0=C2=A0=C2=A0 ctest =3D &test_pool->resources[index].cnt;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 page_counter_calculate_protection(climit, ctest, t=
rue);
>>
>> I realized we can't do this. As the documentation for
>> page_counter_calculate_protection states:
>>
>>> WARNING: This function is not stateless! It can only be used as part
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of a top-down tree it=
eration, not for isolated queries.
>>
>> I authored a fix with [1], though I'm not super happy with having to
>> iterate through the entire (sub-)hierarchy like this every time we
>> consider eviction. If anyone has a better idea, feel free to propose it=
.
>>
>> This branch also contains another idea [2][3] I've been playing around
>> with. Essentially, what I'm trying to solve is TTM preferring to use
>> system memory over evicting VRAM, even if the new VRAM allocation would
>> be protected from eviction by low/min memory protection. In my testing,
>> it leads to a better experience to try evicting unprotected allocations
>> immediately in that case. I'm fine with this being follow-up work, but
>> given that the patchset is still in a rather early stage I thought I'd
>> pitch this now.
> Hey,
>
> I don't know if an alternative implementation is needed here. I think
> the current code is correct. The caller ensures that limit_pool and
> test_pool are alive.
>

The issue is not about lifetimes. If you look into the implementation of
page_counter_calculate_protection, it uses the parent's elow as part of
calculating the current node's elow. However, unless we do a top-down
iteration, the parent's elow value may be outdated or might never have
been calculated at all yet. This is why the comment about requiring a
top-down iteration exists, and I don't see why it shouldn't apply to us.

Regards,
Friedrich

> I believe it's roughly parallel to try_charge, but in 2 parts. As long
> as the caller serializes call to evict_valuable, current code should be
> fine?
>
> Kind regards,
> Maarten Lankhorst

