Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBA5AA67CB
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 02:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D63E10E008;
	Fri,  2 May 2025 00:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QqyRsHya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2DC10E008
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 00:22:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 84627A4C2D7;
 Fri,  2 May 2025 00:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99E1C4CEE3;
 Fri,  2 May 2025 00:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746145365;
 bh=nBHd2cZf4R+cHZ+wJh4m6Bb1+QjKzoKeYIHTc695MJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QqyRsHyahyNXeevAGyrZazEdyJlBlHyMhijhJ/4/eaMwroO49FJU3C51V3KF46Keo
 2u+u0Xtaf6oL6JuK6WMiHNJVgsaYyOuGDa2XbFQUqeIwnQZUfS+BmN7iK2q2FHFN0g
 Ikx9RhdjlxY8gA8XR4m9fcLA3xffoeXGY99qpYpqf7z04c6hFLWIOuI7BvXHSEWl5H
 YBXsG4YxDmTs0g45eb6z63ngRxe7JaTFLU7VVqDJv0X8v7NTTp+xs+amrma59xQnDh
 Q6br6izxkT6Kg/9Czp3keEM/wqugeubt1ToCiniGh0lZYgBhIeDyQOJVV0BEBLlzns
 2Q80kN0QsWLcQ==
Date: Thu, 1 May 2025 17:22:41 -0700
From: Kees Cook <kees@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drm/ttm: Silence randstruct warning about casting struct
 file
Message-ID: <202505011722.9622324F6@keescook>
References: <20250501195859.work.107-kees@kernel.org>
 <aBPZhFho+Z3e1/+g@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBPZhFho+Z3e1/+g@lstrano-desk.jf.intel.com>
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

On Thu, May 01, 2025 at 01:28:52PM -0700, Matthew Brost wrote:
> On Thu, May 01, 2025 at 12:59:03PM -0700, Kees Cook wrote:
> > Casting through a "void *" isn't sufficient to convince the randstruct
> > GCC plugin that the result is intentional. Instead operate through an
> > explicit union to silence the warning:
> > 
> > drivers/gpu/drm/ttm/ttm_backup.c: In function 'ttm_file_to_backup':
> > drivers/gpu/drm/ttm/ttm_backup.c:21:16: note: randstruct: casting between randomized structure pointer types (ssa): 'struct ttm_backup' and 'struct file'
> >    21 |         return (void *)file;
> >       |                ^~~~~~~~~~~~
> > 
> > Fixes: e7b5d23e5d47 ("drm/ttm: Provide a shmem backup implementation")
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> 
> What if we did something like this instead:
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
> index 93c007f18855..fe936a87c959 100644
> --- a/drivers/gpu/drm/ttm/ttm_backup.c
> +++ b/drivers/gpu/drm/ttm/ttm_backup.c
> @@ -7,18 +7,22 @@
>  #include <linux/page-flags.h>
>  #include <linux/swap.h>
> 
> +struct ttm_backup {
> +       struct file file;
> +};
> +
>  /*
>   * Casting from randomized struct file * to struct ttm_backup * is fine since
>   * struct ttm_backup is never defined nor dereferenced.
>   */
>  static struct file *ttm_backup_to_file(struct ttm_backup *backup)
>  {
> -       return (void *)backup;
> +       return &backup->file;
>  }
> 
>  static struct ttm_backup *ttm_file_to_backup(struct file *file)
>  {
> -       return (void *)file;
> +       return container_of(file, struct ttm_backup, file);
>  }

Yup, that works too! I'll send this as a v2.

-- 
Kees Cook
