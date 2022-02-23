Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C560E4C1D2E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 21:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630D010ED4A;
	Wed, 23 Feb 2022 20:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F6210ED4A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 20:34:33 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 0d61aa81-94e8-11ec-b2df-0050568cd888;
 Wed, 23 Feb 2022 20:34:51 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id AB273194B4E;
 Wed, 23 Feb 2022 21:34:35 +0100 (CET)
Date: Wed, 23 Feb 2022 21:34:29 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 5/5] drm: Add TODO item for optimizing format helpers
Message-ID: <YhaaVSc0oV824aUh@ravnborg.org>
References: <20220223193804.18636-1-tzimmermann@suse.de>
 <20220223193804.18636-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223193804.18636-6-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 23, 2022 at 08:38:04PM +0100, Thomas Zimmermann wrote:
> Add a TODO item for optimizing blitting and format-conversion helpers
> in DRM and fbdev. There's always demand for faster graphics output.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  Documentation/gpu/todo.rst | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 7bf7f2111696..7f113c6a02dd 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -241,6 +241,28 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
>  
>  Level: Advanced
>  
> +Benchmark and optimize blitting and format-conversion function
> +--------------------------------------------------------------
> +
> +Drawing to dispay memory quickly is crucial for many applications'
              display
> +performance.
> +
> +On at least x86-64, sys_imageblit() is significantly slower than
   On, at least x86-64, ...
   To me the extra comma makes sense, but grammar is not my strong side.
 
> +cfb_imageblit(), even though both use the same blitting algorithm and
> +the latter is written for I/O memory. It turns out that cfb_imageblit()
> +uses movl instructions, while sys_imageblit apparently does not. This
> +seems to be a problem with gcc's optimizer. DRM's format-conversion
> +heleprs might be subject to similar issues.
   helpers
> +
> +Benchmark and optimize fbdev's sys_() helpers and DRM's format-conversion
> +helpers. In cases that can be further optimized, maybe implement a different
> +algorithm, For micro-optimizations, use movl/movq instructions explicitly.
   algorithm. (period, not comma)
> +That might possibly require architecture specific helpers (e.g., storel()
> +storeq()).
> +
> +Contact: Thomas Zimmermann <tzimmermann@suse.de>
> +
> +Level: Intermediate

With the small fixes above:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

Another option would be to re-implement imageblit() to be drm specific.
Maybe we can then throw out some legacy code and optimize only for the drm
use. And then maybe only a small part of the code would differ if this
is I/O memory or direct accessible memory.

	Sam
