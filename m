Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DBF67D6FA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 21:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE74B10E2BA;
	Thu, 26 Jan 2023 20:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC7910E1CC;
 Thu, 26 Jan 2023 09:18:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2FD8B818BE;
 Thu, 26 Jan 2023 09:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B686C433EF;
 Thu, 26 Jan 2023 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674724682;
 bh=A3jqgSV9WUxdb3ZkujtLcqAQwnfqkoU5ybDSQdNw5cg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sky5enLFwJr3DfJ9b2ymbv/d7rE2oypuJvDM2cNeWmTa68+LJkoJeMjxMVF911xjR
 /p46Fe2/pbyCsXipax42/Hou3ZWrY6fA7yy3y0E4tly4hSn7A+WSEbwQZyXAjmF/fy
 t3crMkotzOdGBKQN+I5JbdstqSnsQJbVUv4CaD/JnI/YsWTl+N0fRV5BPO+OqFre41
 7ERJV1xNKFLVanuVeJ94drHEBHBdP99mIJAbLamNbCF2r05esRYyfEqSbQFmRXAtIl
 xm2AXIIoDKu6q2SCf9/o5Ej3L+rCFY/nYnTN8yhQCyREfEIhRdSCFxGuw7sIOiHW7k
 L6KyLx8xuXeew==
Date: Thu, 26 Jan 2023 11:17:09 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 1/6] mm: introduce vma->vm_flags modifier functions
Message-ID: <Y9JFFYjfJf9uDijE@kernel.org>
References: <20230125083851.27759-1-surenb@google.com>
 <20230125083851.27759-2-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125083851.27759-2-surenb@google.com>
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

On Wed, Jan 25, 2023 at 12:38:46AM -0800, Suren Baghdasaryan wrote:
> vm_flags are among VMA attributes which affect decisions like VMA merging
> and splitting. Therefore all vm_flags modifications are performed after
> taking exclusive mmap_lock to prevent vm_flags updates racing with such
> operations. Introduce modifier functions for vm_flags to be used whenever
> flags are updated. This way we can better check and control correct
> locking behavior during these updates.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  include/linux/mm.h       | 37 +++++++++++++++++++++++++++++++++++++
>  include/linux/mm_types.h |  8 +++++++-
>  2 files changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index c2f62bdce134..b71f2809caac 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -627,6 +627,43 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>  	INIT_LIST_HEAD(&vma->anon_vma_chain);
>  }
>  
> +/* Use when VMA is not part of the VMA tree and needs no locking */
> +static inline void init_vm_flags(struct vm_area_struct *vma,
> +				 unsigned long flags)

I'd suggest to make it vm_flags_init() etc.
Except that

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> +{
> +	vma->vm_flags = flags;
> +}
> +
> +/* Use when VMA is part of the VMA tree and modifications need coordination */
> +static inline void reset_vm_flags(struct vm_area_struct *vma,
> +				  unsigned long flags)
> +{
> +	mmap_assert_write_locked(vma->vm_mm);
> +	init_vm_flags(vma, flags);
> +}
> +
> +static inline void set_vm_flags(struct vm_area_struct *vma,
> +				unsigned long flags)
> +{
> +	mmap_assert_write_locked(vma->vm_mm);
> +	vma->vm_flags |= flags;
> +}
> +
> +static inline void clear_vm_flags(struct vm_area_struct *vma,
> +				  unsigned long flags)
> +{
> +	mmap_assert_write_locked(vma->vm_mm);
> +	vma->vm_flags &= ~flags;
> +}
> +
> +static inline void mod_vm_flags(struct vm_area_struct *vma,
> +				unsigned long set, unsigned long clear)
> +{
> +	mmap_assert_write_locked(vma->vm_mm);
> +	vma->vm_flags |= set;
> +	vma->vm_flags &= ~clear;
> +}
> +
>  static inline void vma_set_anonymous(struct vm_area_struct *vma)
>  {
>  	vma->vm_ops = NULL;
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 2d6d790d9bed..6c7c70bf50dd 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -491,7 +491,13 @@ struct vm_area_struct {
>  	 * See vmf_insert_mixed_prot() for discussion.
>  	 */
>  	pgprot_t vm_page_prot;
> -	unsigned long vm_flags;		/* Flags, see mm.h. */
> +
> +	/*
> +	 * Flags, see mm.h.
> +	 * WARNING! Do not modify directly.
> +	 * Use {init|reset|set|clear|mod}_vm_flags() functions instead.
> +	 */
> +	unsigned long vm_flags;
>  
>  	/*
>  	 * For areas with an address space and backing store,
> -- 
> 2.39.1
> 
> 
