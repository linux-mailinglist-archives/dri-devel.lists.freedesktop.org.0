Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2407A57B8AE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 16:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806E88A8C7;
	Wed, 20 Jul 2022 14:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8452D8A8C7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658328147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cvhT3S9WVM0zbX99AylzeVt8EncWc0nM5sQ4BeMLhBk=;
 b=UzvpBvIv0zEd7m4CXN88yg4EWop+mXthhR84RibTwejlWl0LCUUUgaCYDDXiYSU+S/peyT
 tkLhMKPfXnrCwV2tX95MP7yx8D45MZgZtvpmgxqdDAuTsVLNfUJtrhPJ4wBFaT1HQrmpcS
 GxaaeJUq56j+WbLtKLs8gZ7We3XVMWs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-RuvBWanNPaKCIvaUszRxAA-1; Wed, 20 Jul 2022 10:42:26 -0400
X-MC-Unique: RuvBWanNPaKCIvaUszRxAA-1
Received: by mail-qk1-f200.google.com with SMTP id
 x22-20020a05620a259600b006b552a69231so14333036qko.18
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 07:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=cvhT3S9WVM0zbX99AylzeVt8EncWc0nM5sQ4BeMLhBk=;
 b=5uDUqvSXmqIu3hCjSk24X9K++9WCFrKg63XhF2Rbh4vCQnw5NY9PsHIXV6iDawVPaj
 QL9dmn4LorHoXLCYl7u4P5J+Ra3tx63u+qf6owl+dDLieEqiyFw9AFqM+gl/ClLq87fk
 tJKSZWQIZqGRd/LoSQk98AbU5/DPiCv4tj82YGp1c2vzjzZRTpyelLuBROOO3OMUfRsM
 y8eFWYD1jvB7YYNGGRLG5SisFlTUVc3hG7krRebvFYF3jB23DAsv3/sLM+/ONG6hsevt
 CELyOtasxh2nevMINZWehoKCYTR++q92ItvTYNrg+vxN5XapeAhzOnRfeFwp0vhv94Hn
 Io8g==
X-Gm-Message-State: AJIora+wNHOmRa9e1YCsFCmkREwniQzRfMdvWoO7qkqtE9Qfz4K521tO
 YQiWdOyT2q5R8HXCiEcAsIgAr2m4cc9o+t3X+mcqueNKlyz3Wr9G9AC95++w39W1W1auZLHqkdT
 VZ3rwHWdtuQvYeyN12fdVbpYCRCXH
X-Received: by 2002:a05:622a:1a14:b0:31e:e89f:4dda with SMTP id
 f20-20020a05622a1a1400b0031ee89f4ddamr15317187qtb.622.1658328145884; 
 Wed, 20 Jul 2022 07:42:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tGn9yFp45TY6RYzVBxsl9nb/67MqV9TQtVWfuHzl2vf0hFiw4YH/r3ee/crX2uGuJr5QQhHQ==
X-Received: by 2002:a05:622a:1a14:b0:31e:e89f:4dda with SMTP id
 f20-20020a05622a1a1400b0031ee89f4ddamr15317158qtb.622.1658328145616; 
 Wed, 20 Jul 2022 07:42:25 -0700 (PDT)
Received: from [10.35.4.238] (bzq-82-81-161-50.red.bezeqint.net.
 [82.81.161.50]) by smtp.gmail.com with ESMTPSA id
 y206-20020a3764d7000000b006b5652edb93sm16190459qkb.48.2022.07.20.07.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 07:42:24 -0700 (PDT)
Message-ID: <c22a18631c2067871b9ed8a9246ad58fa1ab8947.camel@redhat.com>
Subject: Re: [RFC PATCH v3 04/19] KVM: x86: mmu: allow to enable write
 tracking externally
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Date: Wed, 20 Jul 2022 17:42:17 +0300
In-Reply-To: <5ed0d0e5a88bbee2f95d794dbbeb1ad16789f319.camel@redhat.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-5-mlevitsk@redhat.com> <YoZyWOh4NPA0uN5J@google.com>
 <5ed0d0e5a88bbee2f95d794dbbeb1ad16789f319.camel@redhat.com>
User-Agent: Evolution 3.40.4 (3.40.4-5.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 2022-05-22 at 13:22 +0300, Maxim Levitsky wrote:
> On Thu, 2022-05-19 at 16:37 +0000, Sean Christopherson wrote:
> > On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> > > @@ -5753,6 +5752,10 @@ int kvm_mmu_init_vm(struct kvm *kvm)
> > >         node->track_write = kvm_mmu_pte_write;
> > >         node->track_flush_slot = kvm_mmu_invalidate_zap_pages_in_memslot;
> > >         kvm_page_track_register_notifier(kvm, node);
> > 
> > Can you add a patch to move this call to kvm_page_track_register_notifier() into
> > mmu_enable_write_tracking(), and simultaneously add a WARN in the register path
> > that page tracking is enabled?
> > 
> > Oh, actually, a better idea. Add an inner __kvm_page_track_register_notifier()
> > that is not exported and thus used only by KVM, invoke mmu_enable_write_tracking()
> > from the exported kvm_page_track_register_notifier(), and then do the above.
> > That will require modifying KVMGT and KVM in a single patch, but that's ok.
> > 
> > That will avoid any possibility of an external user failing to enabling tracking
> > before registering its notifier, and also avoids bikeshedding over what to do with
> > the one-line wrapper to enable tracking.
> > 
> 
> This is a good idea as well, especially looking at kvmgt and seeing that
> it registers the page track notifier, when the vGPU is opened.
> 
> I'll do this in the next series.
> 
> Thanks for the review!

After putting some thought into this, I am not 100% sure anymore I want to do it this way.
 
Let me explain the current state of things:

For mmu: 
- write tracking notifier is registered on VM initialization (that is pretty much always),
and if it is called because write tracking was enabled due to some other reason
(currently only KVMGT), it checks the number of shadow mmu pages and if zero, bails out.
 
- write tracking enabled when shadow root is allocated.
 
This can be kept as is by using the __kvm_page_track_register_notifier as you suggested.
 
For KVMGT:
- both write tracking and notifier are enabled when an vgpu mdev device is first opened.
That 'works' only because KVMGT doesn't allow to assign more that one mdev to same VM,
thus a per VM notifier and the write tracking for that VM are enabled at the same time
 
 
Now for nested AVIC, this is what I would like to do:
 
- just like mmu, I prefer to register the write tracking notifier, when the VM is created.
- just like mmu, write tracking should only be enabled when nested AVIC is actually used
  first time, so that write tracking is not always enabled when you just boot a VM with nested avic supported,
  since the VM might not use nested at all.
 
Thus I either need to use the __kvm_page_track_register_notifier too for AVIC (and thus need to export it)
or I need to have a boolean (nested_avic_was_used_once) and register the write tracking
notifier only when false and do it not on VM creation but on first attempt to use nested AVIC.
 
Do you think this is worth it? I mean there is some value of registering the notifier only when needed
(this way it is not called for nothing) but it does complicate things a bit.
 
I can also stash this boolean (like 'bool registered;') into the 'struct kvm_page_track_notifier_node', 
and thus allow the kvm_page_track_register_notifier to be called more that once - 
then I can also get rid of __kvm_page_track_register_notifier. 

What do you think about this?
 
Best regards,
	Maxim Levitsky


> 
> Best regards,
>         Maxim Levitsky


