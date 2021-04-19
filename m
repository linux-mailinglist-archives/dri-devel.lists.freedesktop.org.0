Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FCE36415C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 14:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D336B6E2D1;
	Mon, 19 Apr 2021 12:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E96D6E255
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 12:16:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1618834612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1QG3FZepALNOXbfOMZTZu4JoFLk2WHpD1FD7YNk9rFs=;
 b=RhyVY6F1oXXJJ0u02/my9iujY24PbMKXnhcPvKnsIWwqBhMALOOoQ7RunU7EpQkZkfxyBm
 lx6Qa712ew80FHgx4LWwEE0vXZvseFWiNf2aX/33YqJTRPqlJj6YSOwl3tET9DaVJ8jqnA
 NFsJCiCri0lP+QT64xWntvhNif6TALw=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2094AF65;
 Mon, 19 Apr 2021 12:16:52 +0000 (UTC)
Date: Mon, 19 Apr 2021 14:16:51 +0200
From: Michal Hocko <mhocko@suse.com>
To: Peter Enderborg <peter.enderborg@sony.com>
Subject: Re: [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
Message-ID: <YH10s/7MjxBBsjVL@dhcp22.suse.cz>
References: <20210417104032.5521-1-peter.enderborg@sony.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210417104032.5521-1-peter.enderborg@sony.com>
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
Cc: Matthew Wilcox <willy@infradead.org>, NeilBrown <neilb@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alexey Dobriyan <adobriyan@gmail.com>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, Mike Rapoport <rppt@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Muchun Song <songmuchun@bytedance.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Roman Gushchin <guro@fb.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat 17-04-21 12:40:32, Peter Enderborg wrote:
> This adds a total used dma-buf memory. Details
> can be found in debugfs, however it is not for everyone
> and not always available. dma-buf are indirect allocated by
> userspace. So with this value we can monitor and detect
> userspace applications that have problems.

The changelog would benefit from more background on why this is needed,
and who is the primary consumer of that value.

I cannot really comment on the dma-buf internals but I have two remarks.
Documentation/filesystems/proc.rst needs an update with the counter
explanation and secondly is this information useful for OOM situations
analysis? If yes then show_mem should dump the value as well.

From the implementation point of view, is there any reason why this
hasn't used the existing global_node_page_state infrastructure?
-- 
Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
