Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F173D360C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 10:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE6D6EAC1;
	Fri, 23 Jul 2021 08:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0EBAA6EAC1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 08:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 7136920201C;
 Fri, 23 Jul 2021 10:04:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 0r4-p7gQVT_L; Fri, 23 Jul 2021 10:04:19 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id E142C20201A;
 Fri, 23 Jul 2021 10:04:18 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1m6qAL-000B1T-SD; Fri, 23 Jul 2021 10:04:17 +0200
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210720131110.88512-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v7
Message-ID: <97ea61fb-aa20-5220-8304-e71145cc7587@daenzer.net>
Date: Fri, 23 Jul 2021 10:04:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210720131110.88512-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-20 3:11 p.m., Christian König wrote:
> Daniel pointed me towards this function and there are multiple obvious problems
> in the implementation.
> 
> First of all the retry loop is not working as intended. In general the retry
> makes only sense if you grab the reference first and then check the sequence
> values.
> 
> Then we should always also wait for the exclusive fence.
> 
> It's also good practice to keep the reference around when installing callbacks
> to fences you don't own.
> 
> And last the whole implementation was unnecessary complex and rather hard to
> understand which could lead to probably unexpected behavior of the IOCTL.
> 
> Fix all this by reworking the implementation from scratch. Dropping the
> whole RCU approach and taking the lock instead.
> 
> Only mildly tested and needs a thoughtful review of the code.
> 
> v2: fix the reference counting as well
> v3: keep the excl fence handling as is for stable
> v4: back to testing all fences, drop RCU
> v5: handle in and out separately
> v6: add missing clear of events
> v7: change coding style as suggested by Michel, drop unused variables
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: stable@vger.kernel.org

Working fine with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880

Tested-by: Michel Dänzer <mdaenzer@redhat.com>


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
