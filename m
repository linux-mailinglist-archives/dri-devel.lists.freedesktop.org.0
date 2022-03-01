Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9504C9307
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 19:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F93F10E5A3;
	Tue,  1 Mar 2022 18:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E7910E6E9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 18:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646159237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vzjWdcHRTHDRPwgL5xAIJJ+6OIz16Rt5thfeij3VhC0=;
 b=brl0ezCViJiS9SzyIH8h0xnbLYW+/HvoCaqxx/rXDtJVG50Ekk8EEO38istPr0Qwu4FJgl
 ibcF4G7tFcjvF5cKE8aVvlYseXBIZ3fnR8l50Zr5Dqy1yumFI92Iew4eW+pU6/CjXbpYUi
 O8D3EnTTVzDMlobDjd5SqkVzl2Bb0KE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-SfvRU821MJqmlxM7UYYEDg-1; Tue, 01 Mar 2022 13:27:13 -0500
X-MC-Unique: SfvRU821MJqmlxM7UYYEDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F6201854E21;
 Tue,  1 Mar 2022 18:27:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.195.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 590B486C42;
 Tue,  1 Mar 2022 18:26:40 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH v3 00/11] RFC: nested AVIC
Date: Tue,  1 Mar 2022 20:26:28 +0200
Message-Id: <20220301182639.559568-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
I already posted patch 2, and patch 1 is extracted from another=0D
patch I posted today =E2=80=98KVM: x86: nSVM: implement nested VMLOAD/VMSAV=
E=E2=80=99=0D
To make this series not depend on anything.=0D
=0D
This is RFC. There still corner cases that need to be fixed in regard to lo=
cking,=0D
especially around RCU use, locking is IMHO a bit ugly and inefficient.=0D
=0D
I did test this with nested guests (even 3 level of nesting, all with AVIC =
enabled),=0D
I also did a light test with VFIO passthrough.=0D
=0D
Suggestions, comments are welcome.=0D
=0D
Best regards,=0D
	Maxim Levitsky=0D
=0D
Maxim Levitsky (11):=0D
  KVM: x86: SVM: move nested_npt_enabled to svm.h=0D
  KVM: x86: SVM: allow AVIC to co-exist with a nested guest running=0D
  KVM: x86: mmu: allow to enable write tracking externally=0D
  x86: KVMGT: use kvm_page_track_write_tracking_enable=0D
  KVM: x86: mmu: add gfn_in_memslot helper=0D
  KVM: x86: lapic: don't allow to change APIC ID when apic acceleration=0D
    is enabled=0D
  KVM: x86: SVM: remove avic's broken code that updated APIC ID=0D
  KVM: x86: SVM: move avic state to separate struct=0D
  KVM: x86: rename .set_apic_access_page_addr to reload_apic_access_page=0D
  KVM: nSVM: implement support for nested AVIC=0D
  KVM: SVM: allow to avoid not needed updates to is_running=0D
=0D
 arch/x86/include/asm/kvm-x86-ops.h    |   3 +-=0D
 arch/x86/include/asm/kvm_host.h       |  12 +-=0D
 arch/x86/include/asm/kvm_page_track.h |   1 +=0D
 arch/x86/include/asm/svm.h            |   8 +-=0D
 arch/x86/kvm/Kconfig                  |   3 -=0D
 arch/x86/kvm/lapic.c                  |  28 +-=0D
 arch/x86/kvm/mmu.h                    |   8 +-=0D
 arch/x86/kvm/mmu/mmu.c                |  16 +-=0D
 arch/x86/kvm/mmu/page_track.c         |  10 +-=0D
 arch/x86/kvm/svm/avic.c               | 763 +++++++++++++++++++++++---=0D
 arch/x86/kvm/svm/nested.c             | 147 ++++-=0D
 arch/x86/kvm/svm/svm.c                |  61 +-=0D
 arch/x86/kvm/svm/svm.h                | 158 +++++-=0D
 arch/x86/kvm/trace.h                  | 164 +++++-=0D
 arch/x86/kvm/vmx/vmx.c                |   8 +-=0D
 arch/x86/kvm/x86.c                    |  31 +-=0D
 drivers/gpu/drm/i915/Kconfig          |   1 -=0D
 drivers/gpu/drm/i915/gvt/kvmgt.c      |   5 +=0D
 include/linux/kvm_host.h              |  10 +-=0D
 virt/kvm/kvm_main.c                   |   3 +-=0D
 20 files changed, 1298 insertions(+), 142 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

