Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1718B3EDAF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 20:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C994610E4ED;
	Mon,  1 Sep 2025 18:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36A110E178;
 Mon,  1 Sep 2025 18:16:46 +0000 (UTC)
Message-ID: <9c296c72-768e-4893-a099-a2882027f2b9@lankhorst.se>
Date: Mon, 1 Sep 2025 20:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/3] cgroups: Add support for pinned device memory
To: David Hildenbrand <david@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?=27Thomas_Hellstr=C3=B6m=27?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Natalie Vock <natalie.vock@gmx.de>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?=27Michal_Koutn=C3=BD=27?=
 <mkoutny@suse.com>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "'Liam R . Howlett'" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michal Hocko <mhocko@suse.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org
References: <20250819114932.597600-5-dev@lankhorst.se>
 <dc21e54c-d7ae-4d7e-9acb-6a3fa573b20f@redhat.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <dc21e54c-d7ae-4d7e-9acb-6a3fa573b20f@redhat.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello David,

Den 2025-09-01 kl. 14:25, skrev David Hildenbrand:
> On 19.08.25 13:49, Maarten Lankhorst wrote:
>> When exporting dma-bufs to other devices, even when it is allowed to use
>> move_notify in some drivers, performance will degrade severely when
>> eviction happens.
>>
>> A perticular example where this can happen is in a multi-card setup,
>> where PCI-E peer-to-peer is used to prevent using access to system memory.
>>
>> If the buffer is evicted to system memory, not only the evicting GPU wher
>> the buffer resided is affected, but it will also stall the GPU that is
>> waiting on the buffer.
>>
>> It also makes sense for long running jobs not to be preempted by having
>> its buffers evicted, so it will make sense to have the ability to pin
>> from system memory too.
>>
>> This is dependant on patches by Dave Airlie, so it's not part of this
>> series yet. But I'm planning on extending pinning to the memory cgroup
>> controller in the future to handle this case.
>>
>> Implementation details:
>>
>> For each cgroup up until the root cgroup, the 'min' limit is checked
>> against currently effectively pinned value. If the value will go above
>> 'min', the pinning attempt is rejected.
>>
>> Pinned memory is handled slightly different and affects calculating
>> effective min/low values. Pinned memory is subtracted from both,
>> and needs to be added afterwards when calculating.
> 
> The term "pinning" is overloaded, and frequently we refer to pin_user_pages() and friends.
> 
> So I'm wondering if there is an alternative term to describe what you want to achieve.
> 
> Is it something like "unevictable" ?
It could be required to include a call pin_user_pages(), in case a process wants to pin 
from a user's address space to the gpu.

It's not done yet, but it wouldn't surprise me if we want to include it in the future.
Functionally it's similar to mlock() and related functions.

Perhaps call it mlocked instead?

Kind regards,
~Maarten Lankhorst
