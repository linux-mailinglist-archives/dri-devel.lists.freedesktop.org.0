Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D1E51233D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 22:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97BA10E23D;
	Wed, 27 Apr 2022 20:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79CC10E23D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 20:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651089807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rEkeuIdB35PHG3bUObFOQepcEtD/UETXCeHTXiNw/W4=;
 b=gxyFivBnWm2ccPoNc0+7vH4YY9YxaYGWepGmWCAr+Y9TH0Ty8dXlVUizDm46WpzUir8ZXs
 laQVQNEe7dnowk7FhA/o74uiE+1BLp3GjZGpgoKW3V0XiYZl7APQHK8DTaEZM0Kgr0kGyg
 H588KsSAk3LQpuqVOiCZuRlGjld7BQU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-ue9yikiaOze3pcESmgHcQA-1; Wed, 27 Apr 2022 16:03:24 -0400
X-MC-Unique: ue9yikiaOze3pcESmgHcQA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E67B3C10AA2;
 Wed, 27 Apr 2022 20:03:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 080E87C55;
 Wed, 27 Apr 2022 20:03:15 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v3 00/19] RFC: nested AVIC
Date: Wed, 27 Apr 2022 23:02:55 +0300
Message-Id: <20220427200314.276673-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is V3 of my nested AVIC patches.=0D
=0D
I fixed few more bugs, and I also split the cod insto smaller patches.=0D
=0D
Review is welcome!=0D
=0D
Best regards,=0D
	Maxim Levitsky=0D
=0D
Maxim Levitsky (19):=0D
  KVM: x86: document AVIC/APICv inhibit reasons=0D
  KVM: x86: inhibit APICv/AVIC when the guest and/or host changes apic=0D
    id/base from the defaults.=0D
  KVM: x86: SVM: remove avic's broken code that updated APIC ID=0D
  KVM: x86: mmu: allow to enable write tracking externally=0D
  x86: KVMGT: use kvm_page_track_write_tracking_enable=0D
  KVM: x86: mmu: add gfn_in_memslot helper=0D
  KVM: x86: mmu: tweak fast path for emulation of access to nested NPT=0D
    pages=0D
  KVM: x86: SVM: move avic state to separate struct=0D
  KVM: x86: nSVM: add nested AVIC tracepoints=0D
  KVM: x86: nSVM: implement AVIC's physid/logid table access helpers=0D
  KVM: x86: nSVM: implement shadowing of AVIC's physical id table=0D
  KVM: x86: nSVM: make nested AVIC physid write tracking be aware of the=0D
    host scheduling=0D
  KVM: x86: nSVM: wire nested AVIC to nested guest entry/exit=0D
  KVM: x86: rename .set_apic_access_page_addr to reload_apic_access_page=0D
  KVM: x86: nSVM: add code to reload AVIC physid table when it is=0D
    invalidated=0D
  KVM: x86: nSVM: implement support for nested AVIC vmexits=0D
  KVM: x86: nSVM: implement nested AVIC doorbell emulation=0D
  KVM: x86: SVM/nSVM: add optional non strict AVIC doorbell mode=0D
  KVM: x86: nSVM: expose the nested AVIC to the guest=0D
=0D
 arch/x86/include/asm/kvm-x86-ops.h    |   2 +-=0D
 arch/x86/include/asm/kvm_host.h       |  23 +-=0D
 arch/x86/include/asm/kvm_page_track.h |   1 +=0D
 arch/x86/kvm/Kconfig                  |   3 -=0D
 arch/x86/kvm/lapic.c                  |  25 +-=0D
 arch/x86/kvm/lapic.h                  |   8 +=0D
 arch/x86/kvm/mmu.h                    |   8 +-=0D
 arch/x86/kvm/mmu/mmu.c                |  21 +-=0D
 arch/x86/kvm/mmu/page_track.c         |  10 +-=0D
 arch/x86/kvm/svm/avic.c               | 985 +++++++++++++++++++++++---=0D
 arch/x86/kvm/svm/nested.c             | 141 +++-=0D
 arch/x86/kvm/svm/svm.c                |  39 +-=0D
 arch/x86/kvm/svm/svm.h                | 166 ++++-=0D
 arch/x86/kvm/trace.h                  | 157 +++-=0D
 arch/x86/kvm/vmx/vmx.c                |   8 +-=0D
 arch/x86/kvm/x86.c                    |  19 +-=0D
 drivers/gpu/drm/i915/Kconfig          |   1 -=0D
 drivers/gpu/drm/i915/gvt/kvmgt.c      |   5 +=0D
 include/linux/kvm_host.h              |  10 +-=0D
 19 files changed, 1507 insertions(+), 125 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

