Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DF22CF8AE
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 02:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F23A6E33F;
	Sat,  5 Dec 2020 01:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5D16E332
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 01:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607132627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LW+4VRCw8R3F3WRgitjgSML8vOT8dg+Dh8HEUAO8kA4=;
 b=LCR70ees0Cbj7IoHe0yg6iB9ZhzvjdJrLlQck+faR1j1RSl9u+dt/MDL2Oj57kdwZTaaoe
 xaaJmziSDEnMM52aseQubieCj7IAonyzbhayQW/9rlg2vY+NATUsbrDjzEEpzESvURT2pK
 TiepChXPMTcb8hS4fwr43M/A4jry06s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-85zLLKAcNpie_eVxFlDWIA-1; Fri, 04 Dec 2020 20:43:45 -0500
X-MC-Unique: 85zLLKAcNpie_eVxFlDWIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E6E0518E;
 Sat,  5 Dec 2020 01:43:43 +0000 (UTC)
Received: from cantor.redhat.com (ovpn-114-119.phx2.redhat.com [10.3.114.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9787160936;
 Sat,  5 Dec 2020 01:43:41 +0000 (UTC)
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] tpm_tis: Detect interrupt storms
Date: Fri,  4 Dec 2020 18:43:36 -0700
Message-Id: <20201205014340.148235-1-jsnitsel@redhat.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 Matthew Garrett <mjg59@google.com>, intel-gfx@lists.freedesktop.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-integrity@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset is an attempt to try and catch tpm_tis devices that have
interrupt storm issues, disable the interrupt, and use polling. In
2016 the tpm_tis interrupt code was accidently disabled, and polling
was just being used. When we initially tried to enable interrupts
again there were some reports of systems being hit with interrupt
storms. It turned out that the ThinkPad T490s had misconfigured a gpio
pin being used for the interrupt.  The problem is more widespread
though, with interrupt storms also being seen on other platforms and
different TPM vendors. With the L490 the system hangs at tpm_tis
initialization even with the detection code, so change the earlier
detection code that used dmi to look for the T490s to instead look for
the L490 and disable interrupts.

Since kstat_irqs needs to be exported to allow building of tpm_tis
as a module, I've included a patch to change the i915_pmu code to
use kstat_irqs where before it was using its own version. If this
isn't desired it can be dropped.

I've been testing this on top of James' proposed patchset which
re-enables interrupts for tpm_tis. With the patchsets applied
it detects the problem on the T490s and on the Ice Lake development
system where I found the issue. I have Lenovo verifying that the
dmi detection code will now detect the L490 and avoid the hang
it experiences. I'm also working on getting access to an L490
to see if I can figure out what the underlying issue is.



Changes from v2:
	- Export kstat_irqs to allow building tpm_tis as a module.
    	- Change i915_pmu.c to use kstat_irqs instead of it's own
      	  version count_interrupts.
    	- Change include from linux/kernel_stat.h to linux/irq.h.
    	- Change dmi checking code to now look for L490 instead of
	  T490s.

Changes from v1:
	- drop tpm_tis specific workqueue and use just system_w.

Jerry Snitselaar (4):
  irq: export kstat_irqs
  drm/i915/pmu: Use kstat_irqs to get interrupt count
  tpm_tis: Disable interrupts if interrupt storm detected
  tpm_tis: Disable Interrupts on the ThinkPad L490


Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org 
Cc: dri-devel@lists.freedesktop.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Peter Huewe <peterhuewe@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Matthew Garrett <mjg59@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: linux-integrity@vger.kernel.org

 drivers/char/tpm/tpm_tis.c      |  4 ++--
 drivers/char/tpm/tpm_tis_core.c | 27 +++++++++++++++++++++++++++
 drivers/char/tpm/tpm_tis_core.h |  2 ++
 drivers/gpu/drm/i915/i915_pmu.c | 18 +-----------------
 include/linux/irqdesc.h         |  1 +
 kernel/irq/irqdesc.c            |  1 +
 6 files changed, 34 insertions(+), 19 deletions(-)

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
