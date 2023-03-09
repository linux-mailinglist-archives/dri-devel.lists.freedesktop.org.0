Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D706B1E45
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 09:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DDA10E7AC;
	Thu,  9 Mar 2023 08:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2322D10E7B6;
 Thu,  9 Mar 2023 08:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 37A2F3F4B6;
 Thu,  9 Mar 2023 09:35:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Q2K6Duj6G_j; Thu,  9 Mar 2023 09:35:19 +0100 (CET)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id A03603F46B;
 Thu,  9 Mar 2023 09:35:18 +0100 (CET)
Received: from [192.168.0.209] (unknown [134.191.232.81])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D517E36282E;
 Thu,  9 Mar 2023 09:35:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1678350918; bh=3ILZun5Jh4NKwW3oGUoDQL7U/hu47cW4tbVkkfa77Hg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U0GX0hv5zoaMVm82CXcuq8j+z4thTzs6NsPG8hwBKNE2eMtW9qW/7ItROzZ/IPcx7
 NvDivDg5xO9odEbhNJNWHHEqZQiZFlcXB2GnJSOHttvOxb3/rZoSBhR5tgYEOkfIL9
 ssIC4nu3Hx9ZM4eua4oZ9hjI6IaegP8OPzaRmlZ0=
Message-ID: <6430e347-3c76-1457-68af-938ad31ae812@shipmail.org>
Date: Thu, 9 Mar 2023 09:35:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 9/9] drm: move ttm_execbuf_util into vmwgfx
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>
References: <20230228083406.1720795-1-christian.koenig@amd.com>
 <20230228083406.1720795-10-christian.koenig@amd.com>
 <b4beeee4b2a004938adc6c502443f7b3311aad50.camel@vmware.com>
 <6933b07b-af79-5350-b161-12ee73732b30@gmail.com>
 <40318db5b88601e42e68a94115da2bdcf6e18db8.camel@vmware.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <40318db5b88601e42e68a94115da2bdcf6e18db8.camel@vmware.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dakr@redhat.com" <dakr@redhat.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 "arunpravin.paneerselvam@amd.com" <arunpravin.paneerselvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/9/23 06:14, Zack Rusin wrote:
> On Wed, 2023-03-08 at 10:10 +0100, Christian König wrote:
>> Am 08.03.23 um 06:14 schrieb Zack Rusin:
>>> On Tue, 2023-02-28 at 09:34 +0100, Christian König wrote:
>>>> VMWGFX is the only remaining user of this and should probably moved over
>>>> to drm_exec when it starts using GEM as well.
>>> Is this because vmwgfx piggybacks buffer-id relocations on top of ttm
>>> validations or
>>> did you just find it too hard to port it over? I'd prefer to avoid ttm moves to
>>> vmwgfx and at least have a clear idea of what we need to do to port.
>> I've just found it to hard to port it over because vmwgfx does some
>> strange things with the validation code here.
>>
>> If you want we can take a deeper look at this together, but I need to
>> find some time.
>>
>> Alternatively just tell me how to do it and I will add that to the patch
>> set :)
> I don't want to hold up the set (it looks good btw), because I had to look at
> something else today and tomorrow.
>
> We overload the validation lists to do quite a bit more than just reservations
> though.
>
> There are, I think, four separate things that need to be refactored there
> (Christian, feel free to skip this section, this is mainly for VMware folks on the
> team):
> 1) Relocations - userspace uses the id's of the bo's in the command stream, but on
> the kernel side those id's are different (or in vmwgfx terminology gem id != mob
> id), so the buffer id's in the command stream need to be replaced,
> 2) Resource validation. vmwgfx splits the userspace objects into buffers and
> resources (shaders, surfaces, contexts). The resources are not buffers but are
> backed by them. A single buffer can back multiple different resources and sometimes
> the kernel has to actually allocate a buffer to back a resource and attach it to it
> (i.e. in common terminology buffer is the memory and resources are placed in it) .
> Now this shouldn't be in the kernel at all, the resources shouldn't have been kernel
> objects and instead we should have left them completely to userspace.

The reason behind this is partly historical, since initially the 
resources (IIRC surfaces and shaders at that time),
were per-device and not per context and not backed by buffer objects.

The main reason for not doing the transition to user-space for resources 
was the SVGA device "between-draw-call-validation". If you for example 
unbound a mob that was backing a resource that was bound to a context, 
you'd need to start a whole chain of resource invalidations to avoid the 
device complaining about invalid setups at awkward moments, for example 
when it felt like suspending.

Not sure whether that is gone now though, or whether there are better 
ways to handle that.

/Thomas


> 3) Coherency tracking. We use validation lists as a central place for tracking which
> bo's/resources are used in a command buffer and we use it to keep track of which
> buffers/resources will endup dirty to implement coherency.
> 4) Central place to allocate memory for relocation/validation nodes.
>
> Where we want to endup is with 2 completely gone from the kernel side and 1, 3 and 4
> refactored and cleaned up. I think there's at least 4 separate patches to this port,
> so it's not a trivial thing. We will take a look at this on Friday in more detail to
> see what we can do.
>
> z
