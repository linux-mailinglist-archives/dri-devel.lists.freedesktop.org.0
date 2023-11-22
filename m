Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F5E7F4A17
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 16:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA1410E2FA;
	Wed, 22 Nov 2023 15:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B68010E097;
 Wed, 22 Nov 2023 15:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700666374; x=1732202374;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=nrNPcz4uYEQBP3pOrCUXcuO8X6G/FSLQKBhZfBz9dLY=;
 b=jZch6GFZuvc4KL5mmkDJyV/wv9A/+3fph73dCCyQHaqJCLL0lT8/Syuo
 Ip6wdwnMOPOZZMEaRdsky+tmRcl7V08f5qMSEKjiyY0c006XuCCvx/sJx
 U91LzWyI5CGwEOgw5e8aSMOfICogT0vC9QE4dR8nw3HuMuVeM3RgxeyPL
 UyK9lTpos9um7WLiGkaqTt/Tb5hWF5htNMgccLLbexdE5E4Q+r5TAXysJ
 ekiv1MYgdTsGxvKXkTTm+qJ+qLECo9ljSstZO5cE3Ur1yGjpf7pWT8dyU
 UZzfRrb3ZBVIv1A4VV6aLtHL7aB4GcYwmOUkkouLa1MuVGDghYP4ESf2V g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="390932764"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="390932764"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 07:19:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833052538"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="833052538"
Received: from tjquresh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.41.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 07:19:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] eventfd: simplify eventfd_signal()
In-Reply-To: <20231122-vfs-eventfd-signal-v2-2-bd549b14ce0c@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
 <20231122-vfs-eventfd-signal-v2-2-bd549b14ce0c@kernel.org>
Date: Wed, 22 Nov 2023 17:19:06 +0200
Message-ID: <877cm9n7dh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-aio@kvack.org, linux-usb@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shakeel Butt <shakeelb@google.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Leon Romanovsky <leon@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>, Fei Li <fei1.li@intel.com>,
 x86@kernel.org, Roman Gushchin <roman.gushchin@linux.dev>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, intel-gfx@lists.freedesktop.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org,
 Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linuxppc-dev@lists.ozlabs.org,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 kvm@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 cgroups@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org,
 io-uring@vger.kernel.org, netdev@vger.kernel.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Christian Brauner <brauner@kernel.org>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Sean Christopherson <seanjc@google.com>, Oded Gabbay <ogabbay@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Xu Yilun <yilun.xu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Nov 2023, Christian Brauner <brauner@kernel.org> wrote:
> diff --git a/fs/eventfd.c b/fs/eventfd.c
> index 33a918f9566c..dc9e01053235 100644
> --- a/fs/eventfd.c
> +++ b/fs/eventfd.c
> @@ -74,20 +74,17 @@ __u64 eventfd_signal_mask(struct eventfd_ctx *ctx, __u64 n, __poll_t mask)
>  /**
>   * eventfd_signal - Adds @n to the eventfd counter.

This still refers to @n here, and in patch 4.

BR,
Jani.

>   * @ctx: [in] Pointer to the eventfd context.
> - * @n: [in] Value of the counter to be added to the eventfd internal counter.
> - *          The value cannot be negative.
>   *
>   * This function is supposed to be called by the kernel in paths that do not
>   * allow sleeping. In this function we allow the counter to reach the ULLONG_MAX
>   * value, and we signal this as overflow condition by returning a EPOLLERR
>   * to poll(2).
>   *
> - * Returns the amount by which the counter was incremented.  This will be less
> - * than @n if the counter has overflowed.
> + * Returns the amount by which the counter was incremented.
>   */
> -__u64 eventfd_signal(struct eventfd_ctx *ctx, __u64 n)
> +__u64 eventfd_signal(struct eventfd_ctx *ctx)
>  {
> -	return eventfd_signal_mask(ctx, n, 0);
> +	return eventfd_signal_mask(ctx, 1, 0);
>  }
>  EXPORT_SYMBOL_GPL(eventfd_signal);
>  

-- 
Jani Nikula, Intel
