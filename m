Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D14282741
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 00:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD806E154;
	Sat,  3 Oct 2020 22:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0956E154
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Oct 2020 22:52:38 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7900800000>; Sat, 03 Oct 2020 15:51:44 -0700
Received: from [10.2.58.214] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 3 Oct
 2020 22:52:32 +0000
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <cb56763e-4fda-a783-03ae-7f749ec55981@nvidia.com>
 <CAKMK7uGzZ2dBe040vP1BJmQ7cuhj_OQHL0ncyz5XyUcb=bPjmg@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <f5130c7f-eebe-7b21-62b8-68f08212b106@nvidia.com>
Date: Sat, 3 Oct 2020 15:52:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGzZ2dBe040vP1BJmQ7cuhj_OQHL0ncyz5XyUcb=bPjmg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601765504; bh=5ppvHLUO/9fbIncZBsX0QRcDvjgd285ERncHZH+jBTQ=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=Ji1FUw05hePaqwM1D5cwu0YizjaQWb5Mp458Rnbz7PTao0aGPynwrhOclhjCKrJU0
 TuxSCKhpy2o33ZbQ6qctuVu+ZH6TjebLlAv44xr1m5C0eM5O/KFwFMsP29suyi4HxU
 7niB1RXiaToj7nlQHwVmz22ekwMcQmAfv1SQB4LhZWP2ztwPzMu0Jo22dFhBC9TRtB
 cXXl6qFqoXI2Qrn049sPT6pv80tx1yV3OVUJgOrgdkV8M6TTcCMzJ+5wIKXAUWpm9T
 x/g3UL5urU1erhjCn4JTTyUhitwG8XonVuxdQJYZPMYoqax5wISjFnhnUnAkLbQ+KR
 1GnsY+nrXhBJQ==
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/3/20 2:45 AM, Daniel Vetter wrote:
> On Sat, Oct 3, 2020 at 12:39 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> On 10/2/20 10:53 AM, Daniel Vetter wrote:
>>> For $reasons I've stumbled over this code and I'm not sure the change
>>> to the new gup functions in 55a650c35fea ("mm/gup: frame_vector:
>>> convert get_user_pages() --> pin_user_pages()") was entirely correct.
>>>
>>> This here is used for long term buffers (not just quick I/O) like
>>> RDMA, and John notes this in his patch. But I thought the rule for
>>> these is that they need to add FOLL_LONGTERM, which John's patch
>>> didn't do.
>>
>> Yep. The earlier gup --> pup conversion patches were intended to not
>> have any noticeable behavior changes, and FOLL_LONGTERM, with it's
>> special cases and such, added some risk that I wasn't ready to take
>> on yet. Also, FOLL_LONGTERM rules are only *recently* getting firmed
>> up. So there was some doubt at least in my mind, about which sites
>> should have it.
>>
>> But now that we're here, I think it's really good that you've brought
>> this up. It's definitely time to add FOLL_LONGTERM wherever it's missing.
> 
> So should I keep this patch, or will it collide with a series you're working on?

It doesn't collide with anything on my end yet, because I've been slow to
pick up on the need for changing callsites to add FOLL_LONGTERM. :)

And it looks like that's actually a problem, because:

> 
> Also with the firmed up rules, correct that I can also drop the
> vma_is_fsdax check when the FOLL_LONGTERM flag is set?

That's the right direction to go *in general*, but I see that the
pin_user_pages code is still a bit stuck in the past. And this patch
won't actually work, with or without that vma_is_fsdax() check.
Because:

get_vaddr_frames(FOLL_LONGTERM)
    pin_user_pages_locked()
	if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
		return -EINVAL;


So, again, pin_user_pages*() is at least partly behind the times here.
I can jump in and start fixing it up, but it depends on what you and
Oded and others are planning? Note: there is a particular combination of
dax and locking that we have to still avoid, within gup.c. That's
already covered, but needs to continue to be covered when we enable
FOLL_LONGTERM in the remaining pin_user_pages*() calling paths.



thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
