Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74340AECA14
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 21:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A6410E075;
	Sat, 28 Jun 2025 19:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wn3fadoN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DD610E075
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 19:39:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5FCF2447EE;
 Sat, 28 Jun 2025 19:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7FCC4CEEA;
 Sat, 28 Jun 2025 19:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751139574;
 bh=0ve0mmF2mhgmDngtnV383T3lwf4oomEbkWsfRSIoepM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wn3fadoN1A+sA4IlBJtqus86Uv6sAr7zn7W/46b2PAXGQd37gFBmr/7Bf9a2IsWZg
 faAAyik9jnNYeRJFvq7t1aQAcAbljejVsZbIYVkJAifsc9rz51kG16FEoCWKCfzmCy
 j2SpweNiGM+RSAVdZkjBol6ETnZlcvpyZkNuADO6weH0Lnntnh5+TUGTEZ/mxszB/8
 IxZ4vvm+8uTCjhgydqxGNXWGfkBGX+dvhPPVo+pSgcSyxz4kf4esl06rfoSr5oQlOj
 lPLvNhi/qIrFZy1CV1+I0OPkp7Q8nC+QsiRZtbc7r8kRBua1lE5eHC7eCsCUofsf6X
 d7PpaSVt8q8OA==
Date: Sat, 28 Jun 2025 21:39:28 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] workaround for Sphinx false positive preventing
 indexing
Message-ID: <20250628213928.74f0584a@foz.lan>
In-Reply-To: <aF9FrVzkZHrIRKEa@archie.me>
References: <20250627115718.17673-1-kevinpaul468@gmail.com>
 <aF9FrVzkZHrIRKEa@archie.me>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

Em Sat, 28 Jun 2025 08:30:21 +0700
Bagas Sanjaya <bagasdotme@gmail.com> escreveu:

> [also Cc'ing Mauro]
> 
> On Fri, Jun 27, 2025 at 05:27:18PM +0530, Kevin Paul Reddy Janagari wrote:
> > Functions drm_format_info, drm_modeset_lock, drm_ioctl_flags are not being
> > indexed in the documentation because there are structs with the same name 
> > and sphinx is only indexing one of them, Added them to namespaces as a
> > workaround for suppressing the warnings and indexing the functions
> > 
> > This is a bug of Sphinx >=3.1, first reported by Mauro in September 2020
> > Link: https://github.com/sphinx-doc/sphinx/issues/8241

Yes, that's the issue. It is probably worth to also a link to the still
open one:

	https://github.com/sphinx-doc/sphinx/pull/8313

> > 
> > Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
> > ---
> >  Documentation/gpu/drm-kms.rst  | 4 ++++
> >  Documentation/gpu/drm-uapi.rst | 2 ++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> > index abfe220764e1..b18a99869b6d 100644
> > --- a/Documentation/gpu/drm-kms.rst
> > +++ b/Documentation/gpu/drm-kms.rst
> > @@ -357,8 +357,10 @@ Format Functions Reference
> >  .. kernel-doc:: include/drm/drm_fourcc.h
> >     :internal:
> >  
> > +.. c:namespace-push:: gpu_drm
> >  .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
> >     :export:
> > +.. c:namespace-pop::
> >  
> >  .. _kms_dumb_buffer_objects:
> >  
> > @@ -473,8 +475,10 @@ KMS Locking
> >  .. kernel-doc:: include/drm/drm_modeset_lock.h
> >     :internal:
> >  
> > +.. c:namespace:: gpu_drm
> >  .. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
> >     :export:
> > +.. c:namespace-pop::
> >  
> >  KMS Properties
> >  ==============
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > index 69f72e71a96e..e9d7b7282a19 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -554,8 +554,10 @@ DRM specific patterns. Note that ENOTTY has the slightly unintuitive meaning of
> >  .. kernel-doc:: include/drm/drm_ioctl.h
> >     :internal:
> >  
> > +.. c:namespace-push:: gpu_drm
> >  .. kernel-doc:: drivers/gpu/drm/drm_ioctl.c
> >     :export:
> > +.. c:namespace-pop::
> >  
> >  .. kernel-doc:: drivers/gpu/drm/drm_ioc32.c
> >     :export:  
> 
> Works as expected, thanks!
> 
> Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 



Thanks,
Mauro
