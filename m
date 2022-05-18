Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AD552B90E
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 13:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AB210E29F;
	Wed, 18 May 2022 11:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAC610E2C5;
 Wed, 18 May 2022 11:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652874676; x=1684410676;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LsDlrEy/O3rSVlfRNcSoeekumU3aG2sLzMfu7YpuCuQ=;
 b=YUgs7Xqf6fb6xwDrJmnHm50SEUM3uU8uSiUzrQLnCL0HYyf/gfXijtWU
 GniBSFN2prL6b9HDfly5WOPiogHAv+o4NP5RtQiX51DNqb5wv8Dd/rbuQ
 PJ8arD5QIuivBGjXf8Mm7Pf5+YbpQqQ9RPMBMe8dyrr30S5sfn9BHYeLo
 fF+xIF46bH5GFrydOZDRCXauI7UWLs7fKW22IeT2GPmdrjnoJE4RWpr5R
 eCDjDHmcke/tL6phWzS+nPuL0fvFXsADCxpbaWuEZ/kvc3Jz+GaG+loeQ
 y+9Ycg1b3OwuZRb6l6Pq3fyLyHFCvxgU6NMnNYx2f4Kmci/bBfcwpYh+D w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="271326930"
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="271326930"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 04:51:16 -0700
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="597747941"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.23])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 04:51:10 -0700
Date: Wed, 18 May 2022 19:51:01 +0800
From: Chao Gao <chao.gao@intel.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [RFC PATCH v3 02/19] KVM: x86: inhibit APICv/AVIC when the guest
 and/or host changes apic id/base from the defaults.
Message-ID: <20220518115056.GA18087@gao-cwp>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-3-mlevitsk@redhat.com>
 <20220518082811.GA8765@gao-cwp>
 <8c78939bf01a98554696add10e17b07631d97a28.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c78939bf01a98554696add10e17b07631d97a28.camel@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 18, 2022 at 12:50:27PM +0300, Maxim Levitsky wrote:
>> > struct kvm_arch {
>> > @@ -1258,6 +1260,7 @@ struct kvm_arch {
>> > 	hpa_t	hv_root_tdp;
>> > 	spinlock_t hv_root_tdp_lock;
>> > #endif
>> > +	bool apic_id_changed;
>> 
>> What's the value of this boolean? No one reads it.
>
>I use it in later patches to kill the guest during nested VM entry 
>if it attempts to use nested AVIC after any vCPU changed APIC ID.
>
>I mentioned this boolean in the commit description.
>
>This boolean avoids the need to go over all vCPUs and checking
>if they still have the initial apic id.

Do you want to kill the guest if APIC base got changed? If yes,
you can check if APICV_INHIBIT_REASON_RO_SETTINGS is set and save
the boolean.

>
>In the future maybe we can introduce a more generic 'taint'
>bitmap with various flags like that, indicating that the guest
>did something unexpected.
>
>BTW, the other option in regard to the nested AVIC is just to ignore this issue completely.
>The code itself always uses vcpu_id's, thus regardless of when/how often the guest changes
>its apic ids, my code would just use the initial APIC ID values consistently.
>
>In this case I won't need this boolean.
>
>> 
>> > };
>> > 
>> > struct kvm_vm_stat {
>> > diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
>> > index 66b0eb0bda94e..8996675b3ef4c 100644
>> > --- a/arch/x86/kvm/lapic.c
>> > +++ b/arch/x86/kvm/lapic.c
>> > @@ -2038,6 +2038,19 @@ static void apic_manage_nmi_watchdog(struct kvm_lapic *apic, u32 lvt0_val)
>> > 	}
>> > }
>> > 
>> > +static void kvm_lapic_check_initial_apic_id(struct kvm_lapic *apic)
>> > +{
>> > +	if (kvm_apic_has_initial_apic_id(apic))
>> > +		return;
>> > +
>> > +	pr_warn_once("APIC ID change is unsupported by KVM");
>> 
>> It is misleading because changing xAPIC ID is supported by KVM; it just
>> isn't compatible with APICv. Probably this pr_warn_once() should be
>> removed.
>
>Honestly since nobody uses this feature, I am not sure if to call this supported,
>I am sure that KVM has more bugs in regard of using non standard APIC ID.
>This warning might hopefuly make someone complain about it if this
>feature is actually used somewhere.

Now I got you. It is fine to me.
