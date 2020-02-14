Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C93D415D584
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 11:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D87E6E591;
	Fri, 14 Feb 2020 10:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1F56E591
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 10:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581675976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ONNmrAeewpZsw1kEozg1dZObc72nt/dFoN8o41OdwuM=;
 b=eiUoQu0+lyPojIBNmwXYc3QyOzRrbRkJWiEZEWpSfrLEI5dmzQZF2oWcH6PuQVK/Ota73q
 lqphiAOs6boHUScHJv3Gkx/DT7jQq2YuJLlR2rRA+ztVRR2FEUUulOC3FfQT1WNdyP2YDF
 g3W63v+wOGuAOO1lQvbz3o9Hr7i9vNA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-UjQPPT35M6qZQE3wUe1aDQ-1; Fri, 14 Feb 2020 05:26:07 -0500
Received: by mail-wm1-f71.google.com with SMTP id m4so3626483wmi.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 02:26:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ONNmrAeewpZsw1kEozg1dZObc72nt/dFoN8o41OdwuM=;
 b=PJEyc+F+OSgCcmq2eTuizUsMZsF443gW+Y2p+FfcPKA05CXE1pMTQ74Vqy4u08WjGD
 LaBsuLRM3on5rgTmpznAnCmA3OsY1ivG97S/2gdgRhVu6cniMv0bd6eNoe4tqGk5pVub
 7zMPEzROxa7189bI3xV3RuudkmNTE3RKfsA7i6bj9ylYiizxpNy6dvfvLWIuOAdv7ixi
 rvnl00+VooCQqXn5j1NiAN2gHHK4vQen2TDuBcLizoc/FegpTdog/uBaLm8EzAovQrxp
 a5byOeZGxV4LHLi2wPEFn255pq6jUV4trbjv5IoMIhJRYuDBikIAzkpPBsvKY4w3Wgen
 lLww==
X-Gm-Message-State: APjAAAWNujeq/ys7h93yTaxZaNzzvWbMSzxw1cLMn5HFrwFSof7WgL4t
 EnMwkpBarRMDBx6cPGoWkvLidCRVTPjf24ZIyY8R08CV6NeqisDAU1TkIByIh5bqlPF1ptcgssK
 f+NbDlklfXrOQx3zTHygPWPdgFI3h
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr3947491wmk.172.1581675966462; 
 Fri, 14 Feb 2020 02:26:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqxOxoyuoQgeKU8ruuYi1oJzwcvjf4P2mwb19V73aRm1o42eA+eLa0nXBJck5B62MHQXs5N2Sw==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr3947459wmk.172.1581675966123; 
 Fri, 14 Feb 2020 02:26:06 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:59c7:c3ee:2dec:d2b4?
 ([2001:b07:6468:f312:59c7:c3ee:2dec:d2b4])
 by smtp.gmail.com with ESMTPSA id v5sm6694372wrv.86.2020.02.14.02.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 02:26:05 -0800 (PST)
Subject: Re: [RFC PATCH 0/3] KVM: x86: honor guest memory type
To: Chia-I Wu <olvaffe@gmail.com>
References: <20200213213036.207625-1-olvaffe@gmail.com>
 <8fdb85ea-6441-9519-ae35-eaf91ffe8741@redhat.com>
 <CAPaKu7T8VYXTMc1_GOzJnwBaZSG214qNoqRr8c7Z4Lb3B7dtTg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b82cd76c-0690-c13b-cf2c-75d7911c5c61@redhat.com>
Date: Fri, 14 Feb 2020 11:26:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPaKu7T8VYXTMc1_GOzJnwBaZSG214qNoqRr8c7Z4Lb3B7dtTg@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: UjQPPT35M6qZQE3wUe1aDQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, joro@8bytes.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, vkuznets@redhat.com, jmattson@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/20 23:18, Chia-I Wu wrote:
> 
> The bug you mentioned was probably this one
> 
>   https://bugzilla.kernel.org/show_bug.cgi?id=104091

Yes, indeed.

> From what I can tell, the commit allowed the guests to create cached
> mappings to MMIO regions and caused MCEs.  That is different than what
> I need, which is to allow guests to create uncached mappings to system
> ram (i.e., !kvm_is_mmio_pfn) when the host userspace also has uncached
> mappings.  But it is true that this still allows the userspace & guest
> kernel to create conflicting memory types.

Right, the question is whether the MCEs were tied to MMIO regions 
specifically and if so why.

An interesting remark is in the footnote of table 11-7 in the SDM.  
There, for the MTRR (EPT for us) memory type UC you can read:

  The UC attribute comes from the MTRRs and the processors are not 
  required to snoop their caches since the data could never have
  been cached. This attribute is preferred for performance reasons.

There are two possibilities:

1) the footnote doesn't apply to UC mode coming from EPT page tables.
That would make your change safe.

2) the footnote also applies when the UC attribute comes from the EPT
page tables rather than the MTRRs.  In that case, the host should use
UC as the EPT page attribute if and only if it's consistent with the host
MTRRs; it would be more or less impossible to honor UC in the guest MTRRs.
In that case, something like the patch below would be needed.

It is not clear from the manual why the footnote would not apply to WC; that
is, the manual doesn't say explicitly that the processor does not do snooping
for accesses to WC memory.  But I guess that must be the case, which is why I
used MTRR_TYPE_WRCOMB in the patch below.

Either way, we would have an explanation of why creating cached mapping to
MMIO regions would, and why in practice we're not seeing MCEs for guest RAM
(the guest would have set WB for that memory in its MTRRs, not UC).

One thing you didn't say: how would userspace use KVM_MEM_DMA?  On which
regions would it be set?

Thanks,

Paolo

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index dc331fb06495..2be6f7effa1d 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6920,8 +6920,16 @@ static u64 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
 	}
 
 	cache = kvm_mtrr_get_guest_memory_type(vcpu, gfn);
-
 exit:
+	if (cache == MTRR_TYPE_UNCACHABLE && !is_mmio) {
+		/*
+		 * We cannot set UC in the EPT page tables as it can cause
+		 * machine check exceptions (??).  Hopefully the guest is
+		 * using PAT.
+		 */
+		cache = MTRR_TYPE_WRCOMB;
+	}
+
 	return (cache << VMX_EPT_MT_EPTE_SHIFT) | ipat;
 }
 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
