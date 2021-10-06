Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 505F9424947
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 23:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBA66E563;
	Wed,  6 Oct 2021 21:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DBC6E563;
 Wed,  6 Oct 2021 21:56:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="289612377"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="289612377"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 14:56:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="488676732"
Received: from keackerm-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.255.34.58])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 14:56:56 -0700
Date: Wed, 6 Oct 2021 17:56:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/i915_pxp: Use ioctl_wrapper
 for DRM_IOCTL_PRIME_HANDLE_TO_FD
Message-ID: <YV4bpoOQS8rXNE4O@intel.com>
References: <20211006165151.247868-1-alan.previn.teres.alexis@intel.com>
 <8dfaad70a9504fcebaec0949dc45ad90@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dfaad70a9504fcebaec0949dc45ad90@intel.com>
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

On Wed, Oct 06, 2021 at 05:11:02PM +0000, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
> >Sent: Wednesday, October 6, 2021 12:52 PM
> >To: igt-dev@lists.freedesktop.org
> >Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; dri-
> >devel@lists.freedesktop.org; Ruhl; Ruhl, Michael J
> ><michael.j.ruhl@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> >Subject: [PATCH i-g-t 1/1] tests/i915_pxp: Use ioctl_wrapper for
> >DRM_IOCTL_PRIME_HANDLE_TO_FD
> >
> >Replace private helper with call to ioctl_wrapper for
> >DRM_IOCTL_PRIME_HANDLE_TO_FD.
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

pushed, thanks

> 
> M
> 
> >Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> >---
> > tests/i915/gem_pxp.c | 20 +-------------------
> > 1 file changed, 1 insertion(+), 19 deletions(-)
> >
> >diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
> >index 79040165..0430f4b8 100644
> >--- a/tests/i915/gem_pxp.c
> >+++ b/tests/i915/gem_pxp.c
> >@@ -622,23 +622,6 @@ static void test_render_pxp_protsrc_to_protdest(int
> >i915)
> > 	buf_ops_destroy(bops);
> > }
> >
> >-static int export_handle(int fd, uint32_t handle, int *outfd)
> >-{
> >-	struct drm_prime_handle args;
> >-	int ret;
> >-
> >-	args.handle = handle;
> >-	args.flags = DRM_CLOEXEC;
> >-	args.fd = -1;
> >-
> >-	ret = drmIoctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &args);
> >-	if (ret)
> >-		ret = errno;
> >-	*outfd = args.fd;
> >-
> >-	return ret;
> >-}
> >-
> > static void test_pxp_dmabuffshare_refcnt(void)
> > {
> > 	uint32_t ctx[2], sbo[2], dbo[2];
> >@@ -659,8 +642,7 @@ static void test_pxp_dmabuffshare_refcnt(void)
> > 			dbo[0] = alloc_and_fill_dest_buff(fd[0], true,
> >TSTSURF_SIZE,
> >
> >TSTSURF_INITCOLOR1);
> > 		} else {
> >-			ret = export_handle(fd[0], dbo[0], &dmabuf_fd);
> >-			igt_assert(ret == 0);
> >+			dmabuf_fd = prime_handle_to_fd(fd[0], dbo[0]);
> > 			dbo[1] = prime_fd_to_handle(fd[1], dmabuf_fd);
> > 			igt_assert(dbo[1]);
> > 		}
> >--
> >2.25.1
> 
