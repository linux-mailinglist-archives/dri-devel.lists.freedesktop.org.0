Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E40AE64B7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 14:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F2E10E58E;
	Tue, 24 Jun 2025 12:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="S2Um+0qp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5E410E589;
 Tue, 24 Jun 2025 12:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=u2DmQaokTW2/gnjH2cgnlfjmMToaryjzjXcqnXsp80s=; b=S2Um+0qpagjVrhSQsPtu/Y9Ki/
 qT4VCiz5D6Hf7xDHltAe+KRt7fHQLqHv0UCpc9w1zthcz8KjmNZ2CVeMcpCwT/TJqEXysR8c9CwDu
 vqzHC65Fq240pfKWV3nGQhGhzdCTpTIGbZvyf/Z0ZGRBRPGNbX1WRxPt034gUSlPqPHkBj9DzWuNS
 BaFAqEYcflqmFmayixuy5iaOWNh4p7Tih0ACK126a0Z16IkyVDVQOtz91tRsBCpCpTvEzylIiHonW
 zakG4Ry8rOhUB7dD3NNe9m2JxYVEHbBSgzM+IbcRxItxFOPiXEyubfjCK2Ty3Fxr3Hi91Y7XGbXMY
 Jyayik5A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uU2g7-00000006YWM-2gs3;
 Tue, 24 Jun 2025 12:23:07 +0000
Date: Tue, 24 Jun 2025 13:23:07 +0100
From: Matthew Wilcox <willy@infradead.org>
To: =?utf-8?B?6ZmI5rab5rab?= Taotao Chen <chentaotao@didiglobal.com>
Cc: "tytso@mit.edu" <tytso@mit.edu>, "hch@infradead.org" <hch@infradead.org>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chentao325@qq.com" <chentao325@qq.com>
Subject: Re: [PATCH v2 1/5] drm/i915: Use kernel_write() in shmem object create
Message-ID: <aFqYq-tLtjZjU0Ko@casper.infradead.org>
References: <20250624121149.2927-1-chentaotao@didiglobal.com>
 <20250624121149.2927-2-chentaotao@didiglobal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624121149.2927-2-chentaotao@didiglobal.com>
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

On Tue, Jun 24, 2025 at 12:12:04PM +0000, 陈涛涛 Taotao Chen wrote:
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -637,8 +637,7 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *i915,
>  {
>  	struct drm_i915_gem_object *obj;
>  	struct file *file;
> -	const struct address_space_operations *aops;
> -	loff_t pos;
> +	loff_t pos = 0;
>  	int err;

I think 'err' needs to become ssize_t to avoid writes larger than 2GB
from being misinterpreted as errors.

