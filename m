Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8D839533E
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 00:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A046E095;
	Sun, 30 May 2021 22:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138DD6E095
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 22:40:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F6386120D;
 Sun, 30 May 2021 22:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622414446;
 bh=sc3R+OcBRxHghAUonKX5pP6gZpOYy1KwZ2uEQyTtgFw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pkNqwGTUxIdX8NjYWGh7LlXj3qo9xJzzdxmWUnGf0UtzHzSVGof15D1EMCk8OhlHH
 FEYaTPYsZ0JQaskZIZe64uXcTAzWyP5b9cM0pbaPjdxg2pv5PoGjrND94f2st1fTEH
 sDR+w6tQZGFKO41jYYrCqcL3I/uScXN5Nx3UwbJT5qVCG7z+wDS/Dte/FQc4PSS8yq
 YbV+h702IRtxidsqPz3C5vBbulyYjuubmqWJXlM8fLckJzeC84QUm/V9S4jSk/0Lwr
 zADbsy7BQEAgJORLamFXccqqXooOjc96fmYGXHdJoJJ+OYAzTF7b+E0Ure7w4BOdIY
 +Z6ZPIuxh0iUg==
Subject: Re: [PATCH v2] fb_defio: Remove custom address_space_operations
To: Matthew Wilcox <willy@infradead.org>
References: <20210310185530.1053320-1-willy@infradead.org>
 <YLPjwUUmHDRjyPpR@Ryzen-9-3900X.localdomain>
 <YLQALv2YENIDh77N@casper.infradead.org>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <2977064f-42d0-7b64-176d-9509c205bfc3@kernel.org>
Date: Sun, 30 May 2021 15:40:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YLQALv2YENIDh77N@casper.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, linux-mm@kvack.org,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 William Kucharski <william.kucharski@oracle.com>,
 Ian Campbell <ijc@hellion.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaya Kumar <jayakumar.lkml@gmail.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/30/2021 2:14 PM, Matthew Wilcox wrote:
> On Sun, May 30, 2021 at 12:13:05PM -0700, Nathan Chancellor wrote:
>> Hi Matthew,
>>
>> On Wed, Mar 10, 2021 at 06:55:30PM +0000, Matthew Wilcox (Oracle) wrote:
>>> There's no need to give the page an address_space.  Leaving the
>>> page->mapping as NULL will cause the VM to handle set_page_dirty()
>>> the same way that it's handled now, and that was the only reason to
>>> set the address_space in the first place.
>>>
>>> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>> Reviewed-by: William Kucharski <william.kucharski@oracle.com>
>>
>> This patch in mainline as commit ccf953d8f3d6 ("fb_defio: Remove custom
>> address_space_operations") causes my Hyper-V based VM to no longer make
>> it to a graphical environment.
> 
> Hi Nathan,
> 
> Thanks for the report.  I sent Daniel a revert patch with a full
> explanation last week, which I assume he'll queue up for a pull soon.
> You can just git revert ccf953d8f3d6 for yourself until that shows up.
> Sorry for the inconvenience.
> 

Thank you for the quick response! I will keep an eye out for the patch 
while reverting it locally in the meantime.

Cheers,
Nathan
