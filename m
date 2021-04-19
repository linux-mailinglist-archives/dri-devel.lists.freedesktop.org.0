Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01B9364695
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 17:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE026E3D6;
	Mon, 19 Apr 2021 15:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740F06E3D6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 15:00:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1618844406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wif7xFamvaZAIzcaSwXiFOKU2ayIr8fdot8BMxjAWOs=;
 b=hnWLD+YYgLB1hJLch8Q0Us+SAQdF9bY2lARPYc+xgthdBTMLWOnNXdT2PXqo+COy6sGSZV
 rpUvHzVpK2ULuoPAyKjkv01PqHD4Pj1QC6hDzyI5FoDNQsfvNNu2mVCa0Ke+SqqeCS/cbM
 kco/IXaDcfPFu/KOLOV6ruIiArhFYyI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0D86B301;
 Mon, 19 Apr 2021 15:00:05 +0000 (UTC)
Date: Mon, 19 Apr 2021 17:00:05 +0200
From: Michal Hocko <mhocko@suse.com>
To: Peter.Enderborg@sony.com
Subject: Re: [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
Message-ID: <YH2a9YfRBlfNnF+u@dhcp22.suse.cz>
References: <20210417104032.5521-1-peter.enderborg@sony.com>
 <YH10s/7MjxBBsjVL@dhcp22.suse.cz>
 <c3f0da9c-d127-5edf-dd21-50fd5298acef@sony.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3f0da9c-d127-5edf-dd21-50fd5298acef@sony.com>
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
Cc: willy@infradead.org, neilb@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, adobriyan@gmail.com,
 linaro-mm-sig@lists.linaro.org, shakeelb@google.com, rppt@kernel.org,
 samitolvanen@google.com, songmuchun@bytedance.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 christian.koenig@amd.com, guro@fb.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 19-04-21 12:41:58, Peter.Enderborg@sony.com wrote:
> On 4/19/21 2:16 PM, Michal Hocko wrote:
> > On Sat 17-04-21 12:40:32, Peter Enderborg wrote:
> >> This adds a total used dma-buf memory. Details
> >> can be found in debugfs, however it is not for everyone
> >> and not always available. dma-buf are indirect allocated by
> >> userspace. So with this value we can monitor and detect
> >> userspace applications that have problems.
> > The changelog would benefit from more background on why this is needed,
> > and who is the primary consumer of that value.
> >
> > I cannot really comment on the dma-buf internals but I have two remarks.
> > Documentation/filesystems/proc.rst needs an update with the counter
> > explanation and secondly is this information useful for OOM situations
> > analysis? If yes then show_mem should dump the value as well.
> >
> > From the implementation point of view, is there any reason why this
> > hasn't used the existing global_node_page_state infrastructure?
> =

> I fix doc in next version.=A0 Im not sure what you expect the commit mess=
age to include.

As I've said. Usual justification covers answers to following questions
	- Why do we need it?
	- Why the existing data is insuficient?
	- Who is supposed to use the data and for what?

I can see an answer for the first two questions (because this can be a
lot of memory and the existing infrastructure is not production suitable
- debugfs). But the changelog doesn't really explain who is going to use
the new data. Is this a monitoring to raise an early alarm when the
value grows? Is this for debugging misbehaving drivers? How is it
valuable for those?

> The function of the meminfo is: (From Documentation/filesystems/proc.rst)
> =

> "Provides information about distribution and utilization of memory."

True. Yet we do not export any random counters, do we?

> Im not the designed of dma-buf, I think=A0 global_node_page_state as a ke=
rnel
> internal.

It provides a node specific and optimized counters. Is this a good fit
with your new counter? Or the NUMA locality is of no importance?

> dma-buf is a device driver that provides a function so I might be
> on the outside. However I also see that it might be relevant for a OOM.
> It is memory that can be freed by killing userspace processes.
> =

> The show_mem thing. Should it be a separate patch?

This is up to you but if you want to expose the counter then send it in
one series.

-- =

Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
