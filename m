Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D843652D3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 09:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE52589DBD;
	Tue, 20 Apr 2021 07:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB8F89DBD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 07:04:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1618902294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S28F6Esk+D8dcXxbzF3+5LdtdDhDVFkM7q+K8PcVcuA=;
 b=lPuVJltq9PaXSJxcyrY5c4MEe/mGjPi4zdRny/TzzxMqNPSwyDX8Tg+rckvKD8F+d4z1nW
 5UFeIbGPKb2dVa8v2gnpzYTAI64GxxFnFVivgpMzhaVX8VHlLvaHb7sTWa6oNG9pbDdWP8
 HGI8DPlQu+mFoOyQgJT/icH5D4fefb0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7550B137;
 Tue, 20 Apr 2021 07:04:53 +0000 (UTC)
Date: Tue, 20 Apr 2021 09:04:51 +0200
From: Michal Hocko <mhocko@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
Message-ID: <YH59E15ztpTTUKqS@dhcp22.suse.cz>
References: <20210417104032.5521-1-peter.enderborg@sony.com>
 <YH10s/7MjxBBsjVL@dhcp22.suse.cz>
 <c3f0da9c-d127-5edf-dd21-50fd5298acef@sony.com>
 <YH2a9YfRBlfNnF+u@dhcp22.suse.cz>
 <23aa041b-0e7c-6f82-5655-836899973d66@sony.com>
 <d70efba0-c63d-b55a-c234-eb6d82ae813f@amd.com>
 <YH2ru642wYfqK5ne@dhcp22.suse.cz>
 <07ed1421-89f8-8845-b254-21730207c185@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <07ed1421-89f8-8845-b254-21730207c185@amd.com>
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

On Mon 19-04-21 18:37:13, Christian K=F6nig wrote:
> Am 19.04.21 um 18:11 schrieb Michal Hocko:
[...]
> > The question is not whether it is NUMA aware but whether it is useful to
> > know per-numa data for the purpose the counter is supposed to serve.
> =

> No, not at all. The pages of a single DMA-buf could even be from different
> NUMA nodes if the exporting driver decides that this is somehow useful.

As the use of the counter hasn't been explained yet I can only
speculate. One thing that I can imagine to be useful is to fill gaps in
our accounting. It is quite often that the memroy accounted in
/proc/meminfo (or oom report) doesn't add up to the overall memory
usage. In some workloads the workload can be huge! In many cases there
are other means to find out additional memory by a subsystem specific
interfaces (e.g. networking buffers). I do assume that dma-buf is just
one of those and the counter can fill the said gap at least partially
for some workloads. That is definitely useful.

What I am trying to bring up with NUMA side is that the same problem can
happen on per-node basis. Let's say that some user consumes unexpectedly
large amount of dma-buf on a certain node. This can lead to observable
performance impact on anybody on allocating from that node and even
worse cause an OOM for node bound consumers. How do I find out that it
was dma-buf that has caused the problem?

See where I am heading?
-- =

Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
