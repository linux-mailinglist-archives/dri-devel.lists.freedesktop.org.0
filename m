Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 196BD67D708
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 21:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B10D10E3C4;
	Thu, 26 Jan 2023 20:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A5410E091;
 Thu, 26 Jan 2023 14:51:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4EA0C61756;
 Thu, 26 Jan 2023 14:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3695EC433EF;
 Thu, 26 Jan 2023 14:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674744706;
 bh=vTtNm5B4uxkFGkyUcD6bt7bUv740cC5zoLQ3n4iCXig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r54XDevqCxaIthjhpV90e/3PReNDit6CxkjYziBMldcr+DpwGPcGH7s0yFhPlYu8B
 NohDoJ7KVIUCX5Zs7V0ydKB7t9XQRchAYOCR8XLnEbVPCZ8e7MIHv0UEcp73VODAq8
 aFhcsGcrVCc28IZRly/gODnl3cguu4R9trJCc4u2GtQ9ygUwR4IFSGftEKj188geBR
 3987kGANtDLWA/GzBI6W69E/F450ClXU14kAngo3y+A1wCivQR2InkOef4HeCwIwVj
 QYEspA95Wv7WS3mfCUr9QMGnsDd2HsZvTUBOWl52ZSZiQBqHvpwy1Yy3PsmXixNWVQ
 B28KDvwGClVRQ==
Date: Thu, 26 Jan 2023 16:50:59 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 1/6] mm: introduce vma->vm_flags modifier functions
Message-ID: <Y9KTUw/04FmBVplw@kernel.org>
References: <20230125083851.27759-1-surenb@google.com>
 <20230125083851.27759-2-surenb@google.com>
 <Y9JFFYjfJf9uDijE@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9JFFYjfJf9uDijE@kernel.org>
X-Mailman-Approved-At: Thu, 26 Jan 2023 20:58:31 +0000
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
Cc: michel@lespinasse.org, nvdimm@lists.linux.dev, leewalsh@google.com,
 dri-devel@lists.freedesktop.org, perex@perex.cz, jglisse@google.com,
 arjunroy@google.com, m.szyprowski@samsung.com, linux-arch@vger.kernel.org,
 qianweili@huawei.com, linux-samsung-soc@vger.kernel.org,
 aneesh.kumar@linux.ibm.com, chenhuacai@kernel.org, kasan-dev@googlegroups.com,
 linux-acpi@vger.kernel.org, rientjes@google.com,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org, minchan@google.com,
 robert.jarzmik@free.fr, linux-um@lists.infradead.org,
 etnaviv@lists.freedesktop.org, npiggin@gmail.com, alex.williamson@redhat.com,
 viro@zeniv.linux.org.uk, luto@kernel.org, gthelen@google.com,
 tglx@linutronix.de, ldufour@linux.ibm.com, linux-sgx@vger.kernel.org,
 martin.petersen@oracle.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linux-media@vger.kernel.org,
 freedreno@lists.freedesktop.org, joelaf@google.com, linux-aio@kvack.org,
 linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, david@redhat.com,
 dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org,
 edumazet@google.com, target-devel@vger.kernel.org, punit.agrawal@bytedance.com,
 linux-s390@vger.kernel.org, dave@stgolabs.net, deller@gmx.de, hughd@google.com,
 andrii@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, linux-graphics-maintainer@vmware.com,
 kernel-team@android.com, jayalk@intworks.biz, soheil@google.com,
 selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org, shakeelb@google.com,
 haojian.zhuang@gmail.com, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, tytso@mit.edu, nico@fluxnic.net,
 muchun.song@linux.dev, hjc@rock-chips.com, mcoquelin.stm32@gmail.com,
 tatashin@google.com, mike.kravetz@oracle.com, songliubraving@fb.com,
 jasowang@redhat.com, alsa-devel@alsa-project.org, peterx@redhat.com,
 linux-tegra@vger.kernel.org, kraxel@redhat.com, will@kernel.org,
 dmaengine@vger.kernel.org, bhe@redhat.com, miklos@szeredi.hu,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, willy@infradead.org,
 gurua@google.com, dgilbert@interlog.com, xiang@kernel.org, pabeni@redhat.com,
 jejb@linux.ibm.com, quic_abhinavk@quicinc.com, bp@alien8.de,
 mchehab@kernel.org, linux-ext4@vger.kernel.org, tomba@kernel.org,
 hughlynch@google.com, sre@kernel.org, tfiga@chromium.org,
 linux-xfs@vger.kernel.org, zhangfei.gao@linaro.org, wangzhou1@hisilicon.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 davem@davemloft.net, mhocko@suse.com, kvm@vger.kernel.org, mst@redhat.com,
 peterz@infradead.org, bigeasy@linutronix.de, alexandre.torgue@foss.st.com,
 dhowells@redhat.com, linux-mm@kvack.org, ray.huang@amd.com,
 adilger.kernel@dilger.ca, kuba@kernel.org, sparclinux@vger.kernel.org,
 anton.ivanov@cambridgegreys.com, herbert@gondor.apana.org.au,
 linux-scsi@vger.kernel.org, richard@nod.at, x86@kernel.org, vkoul@kernel.org,
 mingo@redhat.com, axelrasmussen@google.com, intel-gfx@lists.freedesktop.org,
 paulmck@kernel.org, jannh@google.com, chao@kernel.org, liam.howlett@oracle.com,
 hdegoede@redhat.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, vbabka@suse.cz, dimitri.sivanich@hpe.com,
 amd-gfx@lists.freedesktop.org, posk@google.com, lstoakes@gmail.com,
 peterjung1337@gmail.com, yoshfuji@linux-ipv6.org,
 linuxppc-dev@lists.ozlabs.org, dsahern@kernel.org, kent.overstreet@linux.dev,
 kexec@lists.infradead.org, tiwai@suse.com, krzysztof.kozlowski@linaro.org,
 tzimmermann@suse.de, hannes@cmpxchg.org, dmitry.baryshkov@linaro.org,
 johannes@sipsolutions.net, mgorman@techsingularity.net,
 linux-accelerators@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 26, 2023 at 11:17:09AM +0200, Mike Rapoport wrote:
> On Wed, Jan 25, 2023 at 12:38:46AM -0800, Suren Baghdasaryan wrote:
> > vm_flags are among VMA attributes which affect decisions like VMA merging
> > and splitting. Therefore all vm_flags modifications are performed after
> > taking exclusive mmap_lock to prevent vm_flags updates racing with such
> > operations. Introduce modifier functions for vm_flags to be used whenever
> > flags are updated. This way we can better check and control correct
> > locking behavior during these updates.
> > 
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/mm.h       | 37 +++++++++++++++++++++++++++++++++++++
> >  include/linux/mm_types.h |  8 +++++++-
> >  2 files changed, 44 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index c2f62bdce134..b71f2809caac 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -627,6 +627,43 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
> >  	INIT_LIST_HEAD(&vma->anon_vma_chain);
> >  }
> >  
> > +/* Use when VMA is not part of the VMA tree and needs no locking */
> > +static inline void init_vm_flags(struct vm_area_struct *vma,
> > +				 unsigned long flags)
> 
> I'd suggest to make it vm_flags_init() etc.

Thinking more about it, it will be even clearer to name these vma_flags_xyz()

> Except that
> 
> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> 

--
Sincerely yours,
Mike.
