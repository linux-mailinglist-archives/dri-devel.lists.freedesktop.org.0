Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FCEB051E7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 08:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB6C10E516;
	Tue, 15 Jul 2025 06:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BqMFnonY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A754710E516
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 06:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752561441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PJNrGnddCS+K+I/ghI3UvfktypplC8pV6M7MGR0tlpY=;
 b=BqMFnonYsln6af2sq5S9vRUVECuMm7OtaLUeqMjcSjKbP9+f7AUa66SWq9k+Np4F8n0Bce
 lC+mGSTzFDdgGecqaok0zmiDlliglSbqGPf6xbxWdRoXzAly2hQHHkoChAKmiKV52JUUKj
 JVYc0Ab3h4zRR/IrNV8v07052RdJ8pA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-502-Y2ABCGivMxinmS1AsXatdQ-1; Tue,
 15 Jul 2025 02:37:19 -0400
X-MC-Unique: Y2ABCGivMxinmS1AsXatdQ-1
X-Mimecast-MFC-AGG-ID: Y2ABCGivMxinmS1AsXatdQ_1752561437
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D71671801233; Tue, 15 Jul 2025 06:37:16 +0000 (UTC)
Received: from localhost (unknown [10.72.112.210])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 62AE2180174E; Tue, 15 Jul 2025 06:37:13 +0000 (UTC)
Date: Tue, 15 Jul 2025 14:37:09 +0800
From: Baoquan He <bhe@redhat.com>
To: Askar Safin <safinaskar@zohomail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: regressions <regressions@lists.linux.dev>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 kexec <kexec@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 iommu <iommu@lists.linux.dev>, Ben Hutchings <benh@debian.org>,
 anushasrivatsa <anusha.srivatsa@intel.com>,
 joonaslahtinen <joonas.lahtinen@linux.intel.com>,
 tvrtkoursulin <tvrtko.ursulin@linux.intel.com>,
 josesouza <jose.souza@intel.com>, davehansen <dave.hansen@linux.intel.com>
Subject: Re: Second kexec_file_load (but not kexec_load) fails on i915 if
 CONFIG_INTEL_IOMMU_DEFAULT_ON=n
Message-ID: <aHX3FSMif/LDmTtq@MiWiFi-R3L-srv>
References: <197d1dc3bff.c01ddb9024897.1898328361232711826@zohomail.com>
 <cd3ca680ac5751368941713c1071e04d69544d47@intel.com>
MIME-Version: 1.0
In-Reply-To: <cd3ca680ac5751368941713c1071e04d69544d47@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R7OQDhFj6RkYAieLTdWeWBFxGE3trGi81oEe-JUEYrg_1752561437
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/04/25 at 11:29am, Jani Nikula wrote:
> On Thu, 03 Jul 2025, Askar Safin <safinaskar@zohomail.com> wrote:
> > TL;DR: I found a bug in strange interaction in kexec_file_load (but not kexec_load) and i915
> > TL;DR#2: Second (sometimes third or forth) kexec (using kexec_file_load) fails on my particular hardware
> > TL;DR#3: I did 55 expirements, each of them required a lot of boots, in total I did 1908 boots
> 
> Thanks for the detailed debug info. I'm afraid all I can say at this
> point is, please file all of this in a bug report as described in
> [1]. Please add the drm.debug related options, and attach the dmesgs and
> configs in the bug instead of pointing at external sites.

Yeah, that's very great example people can refer to when reporting
issues to upstream, thanks for the details.

For the bug itself, I would hope Intel GPU people can have a look, see
what's happened and how to fix. For kexec reboot, we have got problems
on Nvidia GPU and amdgpu which makes kexec reboot hard to do continuous
switching to 2nd kernel. In Redhat, we have met this several years ago,
and we tried to contact GPU dev, while there's no way to fix it. Finaly
we have to declare not supporting kexec reboot formally. This Intel GPU
issue could be a different one, I still hope GPU dev can have a look.

Currently, many people are investing much effort on KHO, K-state, etc
in upstream to make kexec reboot versatile and flexible. I am very glad
to see that. And I guess people possiblly have met the same GPU issues on
Nvidia and AMD gpu as I mentioned, and trying to solve them. Otherwise,
no matter how wonderful KHO, K-state or K-anything are, they are just sky
scraper on sand.

Personal opinion.

Thanks
Baoquan

