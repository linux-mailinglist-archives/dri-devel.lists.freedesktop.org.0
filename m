Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13706530253
	for <lists+dri-devel@lfdr.de>; Sun, 22 May 2022 12:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D668F10E03D;
	Sun, 22 May 2022 10:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADFD10E03D
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 10:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653214936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/PRTGgzJSajLmASm1ImWykhYRAoLKce07yOgwd/E/o=;
 b=F8hcFq49Cq72X8AhWXVlo8cPF5QC9+KynXsvQGGN6Ctpqrg4rGhmrRhKomR4nVjM0o3iGo
 /L1w2tZXuf7rziyYeBEa5O5Mv2wI+kMHqeJyI4nKLdEGQUS6tggxDavkhk++Pp1Ls3I6ex
 RTu+X8C43/faGzPsMKM3xH/EgvqWzL0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-78527TvaMxCx363TuhOEMA-1; Sun, 22 May 2022 06:22:13 -0400
X-MC-Unique: 78527TvaMxCx363TuhOEMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0ADC71C05AEF;
 Sun, 22 May 2022 10:22:12 +0000 (UTC)
Received: from starship (unknown [10.40.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7845340CFD00;
 Sun, 22 May 2022 10:22:06 +0000 (UTC)
Message-ID: <5ed0d0e5a88bbee2f95d794dbbeb1ad16789f319.camel@redhat.com>
Subject: Re: [RFC PATCH v3 04/19] KVM: x86: mmu: allow to enable write
 tracking externally
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Date: Sun, 22 May 2022 13:22:05 +0300
In-Reply-To: <YoZyWOh4NPA0uN5J@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-5-mlevitsk@redhat.com> <YoZyWOh4NPA0uN5J@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-05-19 at 16:37 +0000, Sean Christopherson wrote:
> On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> > @@ -5753,6 +5752,10 @@ int kvm_mmu_init_vm(struct kvm *kvm)
> >  	node->track_write = kvm_mmu_pte_write;
> >  	node->track_flush_slot = kvm_mmu_invalidate_zap_pages_in_memslot;
> >  	kvm_page_track_register_notifier(kvm, node);
> 
> Can you add a patch to move this call to kvm_page_track_register_notifier() into
> mmu_enable_write_tracking(), and simultaneously add a WARN in the register path
> that page tracking is enabled?
> 
> Oh, actually, a better idea. Add an inner __kvm_page_track_register_notifier()
> that is not exported and thus used only by KVM, invoke mmu_enable_write_tracking()
> from the exported kvm_page_track_register_notifier(), and then do the above.
> That will require modifying KVMGT and KVM in a single patch, but that's ok.
> 
> That will avoid any possibility of an external user failing to enabling tracking
> before registering its notifier, and also avoids bikeshedding over what to do with
> the one-line wrapper to enable tracking.
> 

This is a good idea as well, especially looking at kvmgt and seeing that
it registers the page track notifier, when the vGPU is opened.

I'll do this in the next series.

Thanks for the review!

Best regards,
	Maxim Levitsky

