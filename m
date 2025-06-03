Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC63ACCC06
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 19:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C404710E737;
	Tue,  3 Jun 2025 17:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CBE10E8E6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 17:26:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2E0E45C4B81;
 Tue,  3 Jun 2025 17:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5343C4CEEE;
 Tue,  3 Jun 2025 17:26:21 +0000 (UTC)
Date: Tue, 3 Jun 2025 13:27:36 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Hugh Dickins <hughd@google.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Christian Koenig
 <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
Message-ID: <20250603132736.554f611d@gandalf.local.home>
In-Reply-To: <aD8iL4cFoXpIVK_0@casper.infradead.org>
References: <20250602170500.48713a2b@gandalf.local.home>
 <20250602171458.7ceabb1c@gandalf.local.home>
 <aD4boBrdZXtz_5kL@casper.infradead.org>
 <fc2b6a94-bd2d-a5d9-c935-381a1613f47e@google.com>
 <20250603102959.20c85adb@gandalf.local.home>
 <aD8iL4cFoXpIVK_0@casper.infradead.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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


[ Adding DRM folks ]

On Tue, 3 Jun 2025 17:26:23 +0100
Matthew Wilcox <willy@infradead.org> wrote:

> On Tue, Jun 03, 2025 at 10:29:59AM -0400, Steven Rostedt wrote:
> > On Tue, 3 Jun 2025 01:02:36 -0700 (PDT)
> > Hugh Dickins <hughd@google.com> wrote:
> >   
> > > Agreed that ramfs does not use swap, so calling swap_writepage() would
> > > be weird.  But, thanks for the build fix Steve, but it cannot be right
> > > because return 0 says shmem_writeout() successfully sent the page to
> > > swap, and that has unlocked the page (or soon will do so).  It should
> > > return an error (-ENXIO?), but I haven't checked what the callers do with  
> > 
> > Yeah, I figured it should return an error, but looking at the code I
> > couldn't figure out what the proper error would be. Then I also noticed
> > that the other stub functions just returned zero so I did the same.
> > 
> > Perhaps add a WARN_ON_ONCE() if it is called without CONFIG_SHMEM configured?  
> 
> Or just make this module depend on SHMEM?  I don't think it makes much
> sense to use it without being able to swap, and shmem can't swap ...

Heh, not exactly sure what to make depend on CONFIG_SHMEM. The function is:

  ttm_backup_backup_page()

Which is defined when CONFIG_DRM_TTM is set, but just doing:

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f094797f3b2b..ebb948a0142f 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -187,7 +187,7 @@ source "drivers/gpu/drm/display/Kconfig"
 
 config DRM_TTM
 	tristate
-	depends on DRM && MMU
+	depends on DRM && MMU && SHMEM
 	help
 	  GPU memory management subsystem for devices with multiple
 	  GPU memory types. Will be enabled automatically if a device driver

Isn't good enough because "select" can override depends on :-p and DRM_TTM
gets selected by:

 Symbol: DRM_TTM [=y]
 Type  : tristate
 Defined at drivers/gpu/drm/Kconfig:188
   Depends on: HAS_IOMEM [=y] && DRM [=y] && MMU [=y] && SHMEM [=n]
 Selected by [y]:
   - DRM_TTM_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]
   - DRM_RADEON [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (AGP [=n] || !AGP [=n])
   - DRM_VMWGFX [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (X86 [=y] && HYPERVISOR_GUEST [=y] || ARM64)
 Selected by [n]:
   - DRM_TTM_KUNIT_TEST [=n] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=n] && MMU [=y] && (UML || COMPILE_TEST [=n])
   - DRM_AMDGPU [=n] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && !UML
   - DRM_NOUVEAU [=n] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y]
   - DRM_I915 [=n] && HAS_IOMEM [=y] && DRM [=y] && X86 [=y] && PCI [=y] && !PREEMPT_RT [=n]
   - DRM_XE [=n] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (m [=m] && MODULES [=n] || KUNIT [=n]=y [=y]
   - DRM_QXL [=n] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && HAS_IOPORT [=y]
   - DRM_LOONGSON [=n] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (LOONGARCH || MIPS || COMPILE_TEST [=n])
   - DRM_HISI_HIBMC [=n] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y]
   - DRM_VBOXVIDEO [=n] && HAS_IOMEM [=y] && DRM [=y] && X86 [=y] && PCI [=y]

Should DRM itself depend on SHMEM?

-- Steve
