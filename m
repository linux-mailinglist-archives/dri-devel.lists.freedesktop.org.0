Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D740B31502
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 12:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05F910E0E0;
	Fri, 22 Aug 2025 10:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XzazrvfB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581D110E08B;
 Fri, 22 Aug 2025 10:18:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DD40640BB7;
 Fri, 22 Aug 2025 10:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9CEC4CEED;
 Fri, 22 Aug 2025 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755857898;
 bh=1fB27n5JTMjVzGa/sTr3HtsBVkgmIvD/LusC6aVNuMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XzazrvfBhQctEI2vRi4/G+q8Ayv22aSTeDVUPajlFIkTi5MrPnmJLvTZ3FUA2vMkh
 AfB3iHWpsrTa7JO+n/mKg1zx2JuDbTgD2IeApU+1rFcfw/oQVb2SwsQb24cES6wSQ/
 4XsTUDn4RAbVor3qQqehPCXTsWhzARGO5VSxC3xmJuyVmbldzf4+XUsHTknj9PeiWG
 g/eylqQvMWtam+SrECS4tOgsRryDIC6Y/kScWqLVacPuCjZO5cjxt0bkZyc60GF2pw
 Z1rPuhHtCDZU7Kk9hE7IispjjJXitmWu9dH5/qPOzysY+lO+3WF2r36uDeWfHfDtG1
 A2N7DwX+B+O/A==
Date: Fri, 22 Aug 2025 09:18:14 -0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?6ZmI5rab5rab?= Taotao Chen <chentaotao@didiglobal.com>
Cc: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, 
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>, 
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>, 
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "chentao325@qq.com" <chentao325@qq.com>,
 kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915: set O_LARGEFILE in __create_shmem()
Message-ID: <wccu37vpmx7ylxwkivizw2yplxg5syupi5ugmrms7zvrk23wzs@ogtt3fybbmjo>
References: <20250822030651.28099-1-chentaotao@didiglobal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822030651.28099-1-chentaotao@didiglobal.com>
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

Hi Taotao,

On Fri, Aug 22, 2025 at 03:06:59AM +0000, 陈涛涛 Taotao Chen wrote:
> From: Taotao Chen <chentaotao@didiglobal.com>
> 
> Without O_LARGEFILE, file->f_op->write_iter calls
> generic_write_check_limits(), which enforces a 2GB (MAX_NON_LFS) limit,
> causing -EFBIG on large writes.
> 
> In shmem_pwrite(), this error is later masked as -EIO due to the error
> handling order, leading to igt failures like gen9_exec_parse(bb-large).
> 
> Set O_LARGEFILE in __create_shmem() to prevent -EFBIG on large writes.
> 
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202508081029.343192ec-lkp@intel.com
> Fixes: 048832a3f400 ("drm/i915: Refactor shmem_pwrite() to use kiocb and write_iter")
> Signed-off-by: Taotao Chen <chentaotao@didiglobal.com>

looks good to me:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
