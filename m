Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9863647FF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 18:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F3C898EE;
	Mon, 19 Apr 2021 16:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522D1898EE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 16:11:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1618848700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQk9ADfQaNNFXvOrL+COJm80KdTtBuYEviWO6Fo/Waw=;
 b=uZzLRuEcAcZqW9RJseYmlhzfQHtxaf/mRn2Ut7Qy1w2i9hxJBbXTJJG8y2qjBse3YB3hIK
 XX+mNgRpm3ShzDsuzVAUJtdhz2+8b4y2j3Mbqth0GB4N/GeyDWEmGDrzdOGY5VzrXbpsOi
 XueYIA/gwpQVL5G1iD4exIV3wvMOlKg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0857B000;
 Mon, 19 Apr 2021 16:11:39 +0000 (UTC)
Date: Mon, 19 Apr 2021 18:11:39 +0200
From: Michal Hocko <mhocko@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
Message-ID: <YH2ru642wYfqK5ne@dhcp22.suse.cz>
References: <20210417104032.5521-1-peter.enderborg@sony.com>
 <YH10s/7MjxBBsjVL@dhcp22.suse.cz>
 <c3f0da9c-d127-5edf-dd21-50fd5298acef@sony.com>
 <YH2a9YfRBlfNnF+u@dhcp22.suse.cz>
 <23aa041b-0e7c-6f82-5655-836899973d66@sony.com>
 <d70efba0-c63d-b55a-c234-eb6d82ae813f@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d70efba0-c63d-b55a-c234-eb6d82ae813f@amd.com>
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
Cc: willy@infradead.org, neilb@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Peter.Enderborg@sony.com,
 linaro-mm-sig@lists.linaro.org, shakeelb@google.com, rppt@kernel.org,
 samitolvanen@google.com, songmuchun@bytedance.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, adobriyan@gmail.com,
 guro@fb.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 19-04-21 17:44:13, Christian K=F6nig wrote:
> Am 19.04.21 um 17:19 schrieb Peter.Enderborg@sony.com:
> > On 4/19/21 5:00 PM, Michal Hocko wrote:
> > > On Mon 19-04-21 12:41:58, Peter.Enderborg@sony.com wrote:
> > > > On 4/19/21 2:16 PM, Michal Hocko wrote:
> > > > > On Sat 17-04-21 12:40:32, Peter Enderborg wrote:
> > > > > > This adds a total used dma-buf memory. Details
> > > > > > can be found in debugfs, however it is not for everyone
> > > > > > and not always available. dma-buf are indirect allocated by
> > > > > > userspace. So with this value we can monitor and detect
> > > > > > userspace applications that have problems.
> > > > > The changelog would benefit from more background on why this is n=
eeded,
> > > > > and who is the primary consumer of that value.
> > > > > =

> > > > > I cannot really comment on the dma-buf internals but I have two r=
emarks.
> > > > > Documentation/filesystems/proc.rst needs an update with the count=
er
> > > > > explanation and secondly is this information useful for OOM situa=
tions
> > > > > analysis? If yes then show_mem should dump the value as well.
> > > > > =

> > > > >  From the implementation point of view, is there any reason why t=
his
> > > > > hasn't used the existing global_node_page_state infrastructure?
> > > > I fix doc in next version.=A0 Im not sure what you expect the commi=
t message to include.
> > > As I've said. Usual justification covers answers to following questio=
ns
> > > 	- Why do we need it?
> > > 	- Why the existing data is insuficient?
> > > 	- Who is supposed to use the data and for what?
> > > =

> > > I can see an answer for the first two questions (because this can be a
> > > lot of memory and the existing infrastructure is not production suita=
ble
> > > - debugfs). But the changelog doesn't really explain who is going to =
use
> > > the new data. Is this a monitoring to raise an early alarm when the
> > > value grows? Is this for debugging misbehaving drivers? How is it
> > > valuable for those?
> > > =

> > > > The function of the meminfo is: (From Documentation/filesystems/pro=
c.rst)
> > > > =

> > > > "Provides information about distribution and utilization of memory."
> > > True. Yet we do not export any random counters, do we?
> > > =

> > > > Im not the designed of dma-buf, I think=A0 global_node_page_state a=
s a kernel
> > > > internal.
> > > It provides a node specific and optimized counters. Is this a good fit
> > > with your new counter? Or the NUMA locality is of no importance?
> > Sounds good to me, if Christian Koenig think it is good, I will use tha=
t.
> > It is only virtio in drivers that use the global_node_page_state if
> > that matters.
> =

> DMA-buf are not NUMA aware at all. On which node the pages are allocated
> (and if we use pages at all and not internal device memory) is up to the
> exporter and importer.

The question is not whether it is NUMA aware but whether it is useful to
know per-numa data for the purpose the counter is supposed to serve.
-- =

Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
