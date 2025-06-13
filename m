Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF0DAD91CE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 17:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4636710EA20;
	Fri, 13 Jun 2025 15:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dMWCRMed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACAE10E113;
 Fri, 13 Jun 2025 15:46:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BC6E4A5119F;
 Fri, 13 Jun 2025 15:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B23C4CEE3;
 Fri, 13 Jun 2025 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749829603;
 bh=IDtANgWDsmydreziIfLyfgieuHG1n33t6/scdMwRLWg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dMWCRMedP6ZuLWCyvPAyztxL+6NvsbWNfoC2dt9pCYTQD/jr71lTneut+FdZQItLH
 S/iMjkvc9p/bCWZ3hiQN+SGGBAZmyRdlalMWfK5pc1uFJYfYuZgoPMk+JeTG/UfwlA
 sgpFr2nr6BsLOlzyrJde/L3PXCPk2xJDK2JrSgVmRPHWjvGZBd1C0SvMbGvly1QIjv
 Vy6KUAnZIq5BJ5KtG7Dzk9jSXzTyMP4ceelEG22fmrfCsRmcy+18HSNAL6emLZaaw5
 SwSljwYL4+4CYS3l7tGJxEuqhxph8scxg19H3M4bZw3cnmCE37Lo+thMfHsxZVEwua
 IMMJCY2bXD+EA==
Message-ID: <d1b19770-dbee-47d0-a146-409de76dee42@kernel.org>
Date: Fri, 13 Jun 2025 17:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/nouveau/bl: increase buffer size to avoid truncate
 warning
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Pierre Moreau <pierre.morrow@free.fr>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Philip Li <philip.li@intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Timur Tabi <ttabi@nvidia.com>
References: <20250610-jk-nouveua-drm-bl-snprintf-fix-v2-1-7fdd4b84b48e@intel.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250610-jk-nouveua-drm-bl-snprintf-fix-v2-1-7fdd4b84b48e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 6/10/25 11:54 PM, Jacob Keller wrote:
> The nouveau_get_backlight_name() function generates a unique name for the
> backlight interface, appending an id from 1 to 99 for all backlight devices
> after the first.
> 
> GCC 15 (and likely other compilers) produce the following
> -Wformat-truncation warning:
> 
> nouveau_backlight.c: In function ‘nouveau_backlight_init’:
> nouveau_backlight.c:56:69: error: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size 3 [-Werror=format-truncation=]
>     56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
>        |                                                                     ^~
> In function ‘nouveau_get_backlight_name’,
>      inlined from ‘nouveau_backlight_init’ at nouveau_backlight.c:351:7:
> nouveau_backlight.c:56:56: note: directive argument in the range [1, 2147483647]
>     56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
>        |                                                        ^~~~~~~~~~~~~~~~
> nouveau_backlight.c:56:17: note: ‘snprintf’ output between 14 and 23 bytes into a destination of size 15
>     56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
>        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The warning started appearing after commit ab244be47a8f ("drm/nouveau:
> Fix a potential theorical leak in nouveau_get_backlight_name()") This fix
> for the ida usage removed the explicit value check for ids larger than 99.
> The compiler is unable to intuit that the ida_alloc_max() limits the
> returned value range between 0 and 99.
> 
> Because the compiler can no longer infer that the number ranges from 0 to
> 99, it thinks that it could use as many as 11 digits (10 + the potential -
> sign for negative numbers).
> 
> The warning has gone unfixed for some time, with at least one kernel test
> robot report. The code breaks W=1 builds, which is especially frustrating
> with the introduction of CONFIG_WERROR.
> 
> The string is stored temporarily on the stack and then copied into the
> device name. Its not a big deal to use 11 more bytes of stack rounding out
> to an even 24 bytes. Increase BL_NAME_SIZE to 24 to avoid the truncation
> warning. This fixes the W=1 builds that include this driver.
> 
> Compile tested only.
> 
> Fixes: ab244be47a8f ("drm/nouveau: Fix a potential theorical leak in nouveau_get_backlight_name()")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312050324.0kv4PnfZ-lkp@intel.com/
> Suggested-by: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>

Applied to drm-misc-fixes, thanks!
