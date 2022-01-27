Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0201E49DE0A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 10:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DB510EF8E;
	Thu, 27 Jan 2022 09:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3918210EF7B;
 Thu, 27 Jan 2022 09:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643276014; x=1674812014;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=70bvD9FchQOD0i4lLqg413fUh6fr+M8PLj6aT5wcP/A=;
 b=Yep//h8gQivjJcqN+rzl0kTulNkCNgpCIwP03DBKLLBCt4UFqArvlAEh
 TScKWxPNPqq6edUYefSykcZWt7o5cfXOACl0aLyBeN1U3f0sH3lGFWE4Z
 pf5ZfR8caLdFWCfUHzn0pcQE86ZOIVc7461YMH2uCaDwyx9df9G/FwG0W
 Ctkahkf4BfxsJ2BC2VyJuC6eMQMtQ7dFwRZ30ySy66TjcE47W/VmWMZ12
 Obq/OAVu/SXrtCZq7ybqpnPsck8x/HVuiyo2GK3rvoQ+guTvUHSuGlsHa
 sEHithKnj5SzSNRju28bCy9Xh421RRCmAXjtsatJRdEE3uy+HvebXw1vc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="244400077"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="244400077"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 01:33:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="480224705"
Received: from anithaha-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.224.126])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 01:33:32 -0800
Date: Thu, 27 Jan 2022 01:33:32 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH 02/19] dma-buf-map: Add helper to initialize
 second map
Message-ID: <20220127093332.wnkd2qy4tvwg5i5l@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <f0dbdcc0-13b5-c484-0bf3-a1f8c3e48954@amd.com>
 <20220127075728.ygwgorhnrwaocdqv@ldmartin-desk2>
 <3066c6a7-fc73-d34d-d209-a3ff6818dfb6@amd.com>
 <YfJedaoeJjE3grum@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YfJedaoeJjE3grum@phenom.ffwll.local>
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

On Thu, Jan 27, 2022 at 09:57:25AM +0100, Daniel Vetter wrote:
>On Thu, Jan 27, 2022 at 09:02:54AM +0100, Christian König wrote:
>> Am 27.01.22 um 08:57 schrieb Lucas De Marchi:
>> > On Thu, Jan 27, 2022 at 08:27:11AM +0100, Christian König wrote:
>> > > Am 26.01.22 um 21:36 schrieb Lucas De Marchi:
>> > > > When dma_buf_map struct is passed around, it's useful to be able to
>> > > > initialize a second map that takes care of reading/writing to an offset
>> > > > of the original map.
>> > > >
>> > > > Add a helper that copies the struct and add the offset to the proper
>> > > > address.
>> > >
>> > > Well what you propose here can lead to all kind of problems and is
>> > > rather bad design as far as I can see.
>> > >
>> > > The struct dma_buf_map is only to be filled in by the exporter and
>> > > should not be modified in this way by the importer.
>> >
>> > humn... not sure if I was  clear. There is no importer and exporter here.
>>
>> Yeah, and exactly that's what I'm pointing out as problem here.
>>
>> You are using the inter driver framework for something internal to the
>> driver. That is an absolutely clear NAK!
>>
>> We could discuss that, but you guys are just sending around patches to do
>> this without any consensus that this is a good idea.
>
>Uh I suggested this, also we're already using dma_buf_map all over the
>place as a convenient abstraction. So imo that's all fine, it should allow
>drivers to simplify some code where on igpu it's in normal kernel memory
>and on dgpu it's behind some pci bar.
>
>Maybe we should have a better name for that struct (and maybe also a
>better place), but way back when we discussed that bikeshed I didn't come
>up with anything better really.

I suggest iosys_map since it abstracts access to IO and system memory.

>
>> > There is a role delegation on filling out and reading a buffer when
>> > that buffer represents a struct layout.
>> >
>> > struct bla {
>> >     int a;
>> >     int b;
>> >     int c;
>> >     struct foo foo;
>> >     struct bar bar;
>> >     int d;
>> > }
>> >
>> >
>> > This implementation allows you to have:
>> >
>> >     fill_foo(struct dma_buf_map *bla_map) { ... }
>> >     fill_bar(struct dma_buf_map *bla_map) { ... }
>> >
>> > and the first thing these do is to make sure the map it's pointing to
>> > is relative to the struct it's supposed to write/read. Otherwise you're
>> > suggesting everything to be relative to struct bla, or to do the same
>> > I'm doing it, but IMO more prone to error:
>> >
>> >     struct dma_buf_map map = *bla_map;
>> >     dma_buf_map_incr(map, offsetof(...));
>
>Wrt the issue at hand I think the above is perfectly fine code. The idea
>with dma_buf_map is really that it's just a special pointer, so writing
>the code exactly as pointer code feels best. Unfortunately you cannot make
>them typesafe (because of C), so the code sometimes looks a bit ugly.
>Otherwise we could do stuff like container_of and all that with
>typechecking in the macros.

I had exactly this code above, but after writting quite a few patches
using it, particularly with functions that have to write to 2 maps (see
patch 6 for example), it felt much better to have something to
initialize correctly from the start

	struct dma_buf_map other_map = *bla_map;
	/* poor Lucas forgetting dma_buf_map_incr(map, offsetof(...)); */

is error prone and hard to debug since you will be reading/writting
from/to another location rather than exploding

While with the construct below

	other_map;
	...
	other_map = INITIALIZER()

I can rely on the compiler complaining about uninitialized var. And
in most of the cases I can just have this single line in the beggining of the
function when the offset is constant:

	struct dma_buf_map other_map = INITIALIZER(bla_map, offsetof(..));

Lucas De Marchi

>-Daniel
>
>> > IMO this construct is worse because at a point in time in the function
>> > the map was pointing to the wrong thing the function was supposed to
>> > read/write.
>> >
>> > It's also useful when the function has double duty, updating a global
>> > part of the struct and a table inside it (see example in patch 6)
>> >
>> > thanks
>> > Lucas De Marchi
>>
>
>-- 
>Daniel Vetter
>Software Engineer, Intel Corporation
>http://blog.ffwll.ch
