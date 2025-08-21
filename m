Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588A1B2F6EB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 13:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F46410E945;
	Thu, 21 Aug 2025 11:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462BD10E93E;
 Thu, 21 Aug 2025 11:41:54 +0000 (UTC)
Message-ID: <533447a9-098a-4509-9014-631af83e0e5a@lankhorst.se>
Date: Thu, 21 Aug 2025 13:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/3] drm/xe: Add DRM_XE_GEM_CREATE_FLAG_PINNED flag and
 implementation
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Natalie Vock <natalie.vock@gmx.de>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?=27Michal_Koutn=C3=BD=27?=
 <mkoutny@suse.com>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "'Liam R . Howlett'" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michal Hocko <mhocko@suse.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org
References: <20250819114932.597600-5-dev@lankhorst.se>
 <20250819114932.597600-8-dev@lankhorst.se>
 <a781f7781a9bf510c3707a5c9a235e1dab785617.camel@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <a781f7781a9bf510c3707a5c9a235e1dab785617.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

Den 2025-08-19 kl. 18:22, skrev Thomas Hellström:
> Hi, Maarten,
> 
> On Tue, 2025-08-19 at 13:49 +0200, Maarten Lankhorst wrote:
>> Add an option to pin memory through the science of cgroup accounting.
>> A bo will be pinned for its entire lifetime, and this allows buffers
>> that are pinned for dma-buf export without requiring the pinning to
>> be
>> done at the dma-buf layer for all devices.
>>
>> For now only implement VRAM pinning. Dave Airlie has a series to
>> implement
>> memcg accounting for the GPU but that is not ready yet.
> 
> Previous discussions around this have favoured a UAPI where we pin a
> gpu-vm range, with a pin at mapping time, or dma-buf pin time where
> required, this allows for dynamic pinning and unpinning, and would
> avoid having separate pinning interfaces for bos and userptr.
> 
> In particular if we don't know at bo creation time which buffer objects
> will be exported with a method requiring pinning, how would UMD deduce
> what buffer objects to pin?
> 
> Thanks,
> Thomas
> For discussion purposes, it seems compute preferred pinning at allocation time,
so I wanted to propose that solution since it's easiest to implement.

I will change it for the next version, but I'm very interested in feedback
on the adjustments I made in cgroups. Those are the ones that will have the
most impact, and changes how effective min/low is calculated when memory
pinned is involved.

Kind regards,
~Maarten
