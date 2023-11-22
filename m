Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183C87F49A7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 16:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50F710E65B;
	Wed, 22 Nov 2023 15:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F6410E65A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 15:05:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A54792197D;
 Wed, 22 Nov 2023 15:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1700665509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kiNIjoy22VhgtIuHBArgiaoyvsvGoNJHeARkzxhMWGY=;
 b=gghhkSG43KQIBBJGVUaWHWPez5aSJU2oWxN0I2xdIkHy4nT299HGHkEPzB5ju783UEdGub
 quQGKg0KLRMPxc924bp7I28UpnSbuczFPYoBfNJEla47Q0VzoDIda1+kyxPGX1KLh3kS2P
 Jr9MMfR+boGxUZF/uwCU5ZOK4WMlf80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1700665509;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kiNIjoy22VhgtIuHBArgiaoyvsvGoNJHeARkzxhMWGY=;
 b=ylDzK1dNfUswNgsV2CMCxU1vr72Y1bh7nO7MfzJ/ZCx/IAxOmdSUWmUdkcoayATrj7nzRj
 dFlzvSaj+6lPeYAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B1BA13461;
 Wed, 22 Nov 2023 15:05:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UHgCHqUYXmUkGgAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 22 Nov 2023 15:05:09 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id E6C71A07DC; Wed, 22 Nov 2023 16:05:08 +0100 (CET)
Date: Wed, 22 Nov 2023 16:05:08 +0100
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v2 1/4] i915: make inject_virtual_interrupt() void
Message-ID: <20231122150508.bdkhrdrhlyva7biz@quack3>
References: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
 <20231122-vfs-eventfd-signal-v2-1-bd549b14ce0c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122-vfs-eventfd-signal-v2-1-bd549b14ce0c@kernel.org>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.30
X-Spamd-Result: default: False [-6.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; BAYES_HAM(-3.00)[100.00%];
 TAGGED_RCPT(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 REPLY(-4.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_GT_50(0.00)[78];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 FREEMAIL_CC(0.00)[vger.kernel.org,lst.de,suse.cz,redhat.com,google.com,linutronix.de,alien8.de,linux.intel.com,kernel.org,infradead.org,xen.org,intel.com,gmail.com,ffwll.ch,ziepe.ca,linux.ibm.com,arndb.de,linuxfoundation.org,linux.alibaba.com,oss.nxp.com,kvack.org,cmpxchg.org,linux.dev,nvidia.com,lists.freedesktop.org,lists.ozlabs.org,lists.linux-foundation.org,kernel.dk];
 RCVD_COUNT_TWO(0.00)[2]; SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Flag: NO
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
Cc: linux-aio@kvack.org, linux-s390@vger.kernel.org, linux-usb@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Paul Durrant <paul@xen.org>, Tom Rix <trix@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>,
 netdev@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Leon Romanovsky <leon@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>, Fei Li <fei1.li@intel.com>,
 x86@kernel.org, Roman Gushchin <roman.gushchin@linux.dev>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, intel-gfx@lists.freedesktop.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org,
 Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Shakeel Butt <shakeelb@google.com>, Heiko Carstens <hca@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linuxppc-dev@lists.ozlabs.org,
 Frederic Barrat <fbarrat@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Borislav Petkov <bp@alien8.de>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, cgroups@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org,
 io-uring@vger.kernel.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Oded Gabbay <ogabbay@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 Moritz Fischer <mdf@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Xu Yilun <yilun.xu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 22-11-23 13:48:22, Christian Brauner wrote:
> The single caller of inject_virtual_interrupt() ignores the return value
> anyway. This allows us to simplify eventfd_signal() in follow-up
> patches.
> 
> Signed-off-by: Christian Brauner <brauner@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/gpu/drm/i915/gvt/interrupt.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/gvt/interrupt.c
> index de3f5903d1a7..9665876b4b13 100644
> --- a/drivers/gpu/drm/i915/gvt/interrupt.c
> +++ b/drivers/gpu/drm/i915/gvt/interrupt.c
> @@ -422,7 +422,7 @@ static void init_irq_map(struct intel_gvt_irq *irq)
>  #define MSI_CAP_DATA(offset) (offset + 8)
>  #define MSI_CAP_EN 0x1
>  
> -static int inject_virtual_interrupt(struct intel_vgpu *vgpu)
> +static void inject_virtual_interrupt(struct intel_vgpu *vgpu)
>  {
>  	unsigned long offset = vgpu->gvt->device_info.msi_cap_offset;
>  	u16 control, data;
> @@ -434,10 +434,10 @@ static int inject_virtual_interrupt(struct intel_vgpu *vgpu)
>  
>  	/* Do not generate MSI if MSIEN is disabled */
>  	if (!(control & MSI_CAP_EN))
> -		return 0;
> +		return;
>  
>  	if (WARN(control & GENMASK(15, 1), "only support one MSI format\n"))
> -		return -EINVAL;
> +		return;
>  
>  	trace_inject_msi(vgpu->id, addr, data);
>  
> @@ -451,10 +451,10 @@ static int inject_virtual_interrupt(struct intel_vgpu *vgpu)
>  	 * returned and don't inject interrupt into guest.
>  	 */
>  	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
> -		return -ESRCH;
> -	if (vgpu->msi_trigger && eventfd_signal(vgpu->msi_trigger, 1) != 1)
> -		return -EFAULT;
> -	return 0;
> +		return;
> +	if (!vgpu->msi_trigger)
> +		return;
> +	eventfd_signal(vgpu->msi_trigger, 1);
>  }
>  
>  static void propagate_event(struct intel_gvt_irq *irq,
> 
> -- 
> 2.42.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
