Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B16BF1DFB5D
	for <lists+dri-devel@lfdr.de>; Sun, 24 May 2020 00:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6396E0C2;
	Sat, 23 May 2020 22:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31886E0C2;
 Sat, 23 May 2020 22:33:48 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec9a4c00000>; Sat, 23 May 2020 15:33:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sat, 23 May 2020 15:33:48 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sat, 23 May 2020 15:33:48 -0700
Received: from [10.2.58.199] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 23 May
 2020 22:33:48 +0000
Subject: Re: [PATCH v2 0/4] mm/gup, drm/i915: refactor gup_fast, convert to
 pin_user_pages()
To: Chris Wilson <chris@chris-wilson.co.uk>, Andrew Morton
 <akpm@linux-foundation.org>
References: <20200522051931.54191-1-jhubbard@nvidia.com>
 <159022688563.11139.3402294435382936623@build.alporthouse.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <d87cdee8-aa0f-91ca-ea86-e89c4536458f@nvidia.com>
Date: Sat, 23 May 2020 15:33:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <159022688563.11139.3402294435382936623@build.alporthouse.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
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
Cc: Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Souptick Joarder <jrdr.linux@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld <matthew.auld@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-23 02:41, Chris Wilson wrote:
> Quoting John Hubbard (2020-05-22 06:19:27)
>> The purpose of posting this series is to launch a test in the
>> intel-gfx-ci tree. (The patches have already been merged into Andrew's
>> linux-mm tree.)
>>
>> This applies to today's linux.git (note the base-commit tag at the
>> bottom).
>>
>> Changes since V1:
>>
>> * Fixed a bug in the refactoring patch: added FOLL_FAST_ONLY to the
>>    list of gup_flags *not* to WARN() on. This lead to a failure in the
>>    first intel-gfx-ci test run [1].
>>
>> [1] https://lore.kernel.org/r/159008745422.32320.5724805750977048669@build.alporthouse.com
> 
> Ran this through our CI, warn and subsequent lockup were gone. That
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1590273216; bh=oK85oUq4LCrgTs8kxvJryKE7a7GUQfAveFtGpNOU2dQ=;
	h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
	 Content-Transfer-Encoding;
	b=QoI4eJbYYVxcoARKgFJdRrxzB/GBPqy5yKIF46/pjR75LEiZvvAX947VBwywSMYhx
	 It8aQpMm6kMaF/rxiv0IPBf3tNGxNziWBAAhDXCyNqmvAS5s1HfdQh5ZoYbyDynKbJ
	 uF+u9JjBOYo5uTnn3IUaGPRgl/p9k6OhwRhbJ9nYreDwIF1/1pPeo97jwP2jW7AtDf
	 xDO5iJhGmwLYHPzRLilgiDdLbNhIGAP1XJ/4t/DByshidOUalduU7HxVQ9IOnysnCw
	 QcqSlpyPgx5LkJOvs63gO8n28hHJnoJ4FggNXC3D311lBWRuD7iekdP5WuvmrxUb8N
	 rZKwTpl0vJl9w==


Yea! Thanks again for these test runs. I really don't like posting
patches that I can't run-time test, but this CI system mitigates
that pretty well.


> lockup is worrying me now, but that doesn't seem to be an issue from
> this series.


I do think it's worth following up on. And it seems like it would be
very easy to repro: just hack in a forced failure at the call site of
pin_user_pages_fast_only(), and follow the breadcrumbs.


> 
> The i915 changes were simple enough, I would have computed the pin flags
> just once (since the readonly bit is static, that would be interesting
> if that was allowed to change mid gup :)
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> -Chris
> 

Thanks for the review! And if lifting that check up higher in the call
stack is desired, I'm all in favor of that being done...in a separate
patch. :)

I'm trying to keep a very light touch when converting these call sites.

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
