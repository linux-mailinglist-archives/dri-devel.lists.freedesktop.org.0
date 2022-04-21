Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243DC509652
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 07:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997BF10F36E;
	Thu, 21 Apr 2022 05:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400E010F36D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 05:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650517979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gw2WgO3NdEKefNIzU7OyyGWhN8RKFPXQkhGeUbUxcYw=;
 b=bXWFymTU1YhMot0ygIAWHVUwWR3480h/b4biVKexypqSC/1G45dVy7PE8UQelq9VSFMQWj
 X5XKtY+LZBXxEZkis0wBPaAEGAeB3ouWl84TyBZ680xPIG+KIqWACsnJhr8jIUQQYy0446
 w/rhLpFP7vWoqmZ8/jHYsA57QU/N8bY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-L9HPRdJxNBmr5i5MKpw9hg-1; Thu, 21 Apr 2022 01:12:53 -0400
X-MC-Unique: L9HPRdJxNBmr5i5MKpw9hg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1D6880A0AD;
 Thu, 21 Apr 2022 05:12:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.194.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEF55145B96B;
 Thu, 21 Apr 2022 05:12:45 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v2 00/10] RFCv2: nested AVIC
Date: Thu, 21 Apr 2022 08:12:34 +0300
Message-Id: <20220421051244.187733-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: Wanpeng Li <wanpengli@tencent.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series implement everything that is needed to=0D
use AMD's AVIC while a nested guest is running including=0D
ability of the nested guest to use it, and brings feature=0D
parity vs APICv.=0D
=0D
Compared to v1 of the series, there are lot of fixes,=0D
and refactoring.=0D
=0D
This version still use unconditional read-only apic id,=0D
which will be addressed in the next version.=0D
=0D
For the last patch, which allows to avoid cleaning is_running=0D
bit in physid pages as long as it is possible, I measured=0D
what would happen in a worst case:=0D
=0D
- A malicious guest runs with 2 vCPUs pinned,=0D
its first vCPU pounds on ICR sending IPIs to the 2nd vCPU=0D
=0D
and 2nd vCPU scheduled out forever and not halted=0D
(something that should not happen with Qemu though)=0D
=0D
- A normal guest with single vCPU is pinned to run=0D
on the same CPU as the 2nd vCPU of the first guest.=0D
=0D
The normal guest continued to run, but was observed to run=0D
about 40% slower.=0D
=0D
Therefore AVIC doorbel is strict by default but if the admin=0D
policy is to pin guests and not allow them to share a physical=0D
cpu, then strict doorbel can be set to false and that does=0D
improves the nested (and not nested as well) AVIC perf futher.=0D
=0D
Suggestions, comments are welcome.=0D
=0D
Best regards,=0D
	Maxim Levitsky=0D
=0D
Maxim Levitsky (10):=0D
  KVM: x86: mmu: allow to enable write tracking externally=0D
  x86: KVMGT: use kvm_page_track_write_tracking_enable=0D
  KVM: x86: mmu: add gfn_in_memslot helper=0D
  KVM: x86: mmu: tweak fast path for emulation of access to nested NPT=0D
    pages=0D
  KVM: x86: lapic: don't allow to change APIC ID when apic acceleration=0D
    is enabled=0D
  KVM: x86: SVM: remove avic's broken code that updated APIC ID=0D
  KVM: x86: SVM: move avic state to separate struct=0D
  KVM: x86: rename .set_apic_access_page_addr to reload_apic_access_page=0D
  KVM: nSVM: implement support for nested AVIC=0D
  KVM: SVM: allow to avoid not needed updates to is_running=0D
=0D
 arch/x86/include/asm/kvm-x86-ops.h    |   2 +-=0D
 arch/x86/include/asm/kvm_host.h       |   5 +-=0D
 arch/x86/include/asm/kvm_page_track.h |   1 +=0D
 arch/x86/kvm/Kconfig                  |   3 -=0D
 arch/x86/kvm/lapic.c                  |  28 +-=0D
 arch/x86/kvm/mmu.h                    |   8 +-=0D
 arch/x86/kvm/mmu/mmu.c                |  21 +-=0D
 arch/x86/kvm/mmu/page_track.c         |  10 +-=0D
 arch/x86/kvm/svm/avic.c               | 949 ++++++++++++++++++++++++--=0D
 arch/x86/kvm/svm/nested.c             | 131 +++-=0D
 arch/x86/kvm/svm/svm.c                |  31 +-=0D
 arch/x86/kvm/svm/svm.h                | 165 ++++-=0D
 arch/x86/kvm/trace.h                  | 140 +++-=0D
 arch/x86/kvm/vmx/vmx.c                |   8 +-=0D
 arch/x86/kvm/x86.c                    |  17 +-=0D
 drivers/gpu/drm/i915/Kconfig          |   1 -=0D
 drivers/gpu/drm/i915/gvt/kvmgt.c      |   5 +=0D
 include/linux/kvm_host.h              |  10 +-=0D
 18 files changed, 1413 insertions(+), 122 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

