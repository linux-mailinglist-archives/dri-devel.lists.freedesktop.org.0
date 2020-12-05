Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF4B2CF8B5
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 02:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4ED6E3AA;
	Sat,  5 Dec 2020 01:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB956E334
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 01:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607132628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yfnbcXnKaxVtlJzzNRHF0Gxnxvp6ml+K62fOuuwG0xQ=;
 b=UOBNKItaXodSjHut27y4LSKlrS9+UyRI+u/Hl7C2G/kJC4WGf5qIpbtRnzhZMIOPJINuvJ
 W+6rAAG0k5IUBZVEmwLeMEPPparZ1furhFWwTqvBH2qktzaXGzVFGnk6nVrNgc76nHW3P8
 znRQJEq+YtM6E4tY1ivMctMtyleAoNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-4ZINpmTlOnSepeF3G2brOA-1; Fri, 04 Dec 2020 20:43:46 -0500
X-MC-Unique: 4ZINpmTlOnSepeF3G2brOA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D26CC80ED8A;
 Sat,  5 Dec 2020 01:43:43 +0000 (UTC)
Received: from cantor.redhat.com (ovpn-114-119.phx2.redhat.com [10.3.114.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C0F160917;
 Sat,  5 Dec 2020 01:43:43 +0000 (UTC)
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] irq: export kstat_irqs
Date: Fri,  4 Dec 2020 18:43:37 -0700
Message-Id: <20201205014340.148235-2-jsnitsel@redhat.com>
In-Reply-To: <20201205014340.148235-1-jsnitsel@redhat.com>
References: <20201205014340.148235-1-jsnitsel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: kernel test robot <lkp@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>,
 Matthew Garrett <mjg59@google.com>, linux-integrity@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To try and detect potential interrupt storms that
have been occurring with tpm_tis devices it was suggested
to use kstat_irqs() to get the number of interrupts.
Since tpm_tis can be built as a module it needs kstat_irqs
exported.

Reported-by: kernel test robot <lkp@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Peter Huewe <peterhuewe@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Matthew Garrett <mjg59@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>
---
 include/linux/irqdesc.h | 1 +
 kernel/irq/irqdesc.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
index 5745491303e0..fff88c1f1ac6 100644
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -153,6 +153,7 @@ static inline void generic_handle_irq_desc(struct irq_desc *desc)
 }
 
 int generic_handle_irq(unsigned int irq);
+unsigned int kstat_irqs(unsigned int irq);
 
 #ifdef CONFIG_HANDLE_DOMAIN_IRQ
 /*
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 1a7723604399..12398ef1796b 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -1000,6 +1000,7 @@ unsigned int kstat_irqs(unsigned int irq)
 		sum += *per_cpu_ptr(desc->kstat_irqs, cpu);
 	return sum;
 }
+EXPORT_SYMBOL_GPL(kstat_irqs);
 
 /**
  * kstat_irqs_usr - Get the statistics for an interrupt
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
