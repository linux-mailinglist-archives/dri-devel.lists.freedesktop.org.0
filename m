Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB96B2DAF6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 13:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A89810E259;
	Wed, 20 Aug 2025 11:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="WlAqn8SE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1804 seconds by postgrey-1.36 at gabe;
 Wed, 20 Aug 2025 11:31:25 UTC
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9180910E259
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type; bh=igVC+r9t1pPO+MPUsLfAQNKa2CjPT9tsw6veSywFJ7o=;
 b=WlAqn8SEoQNWxMua51YoTVqNPFgUmaOExPK+RVA2lkjis7GxmR/xaVNk49K6ev
 QBWfDq+jhDkeB0hOMOF9tU8j1lN37UN6pe8wuA1O3oM4WyjhQoej4/hdDmb4pK16
 9FviIu7XONm8gbzCL3R6/CHDVonHx2FiFVavx286OxkTU=
Received: from localhost (unknown [])
 by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id
 _____wC3r3ILp6Voc_S3Cg--.25064S2; 
 Wed, 20 Aug 2025 18:44:28 +0800 (CST)
Date: Wed, 20 Aug 2025 18:44:27 +0800
From: Qianqiang Liu <qianqiang.liu@163.com>
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: pmladek@suse.com, akpm@linux-foundation.org,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Shixiong Ou <oushixiong@kylinos.cn>,
 Sravan Kumar Gundu <sravankumarlpu@gmail.com>,
 Zsolt Kajtar <soci@c64.rulez.org>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, feng.tang@linux.alibaba.com,
 joel.granados@kernel.org, john.ogness@linutronix.de,
 namcao@linutronix.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/9] fbdev: Use panic_in_progress() helper
Message-ID: <aKWnC4N8d4lBPrNi@debian.debian.local>
References: <20250820091702.512524-1-wangjinchao600@gmail.com>
 <20250820091702.512524-2-wangjinchao600@gmail.com>
 <20250820091702.512524-3-wangjinchao600@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820091702.512524-3-wangjinchao600@gmail.com>
X-CM-TRANSID: _____wC3r3ILp6Voc_S3Cg--.25064S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr1xCF4Utr4rJF45AFW7twb_yoW8Xw43pF
 45JFW3GF4Dtr15Ga97Wr47AFyFyws7JryUXFZ7t3WFq3Way3yIg3y0kFy0qFWftryxCw1S
 vr1Ut3WrGFyUCFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UQqXQUUUUU=
X-Originating-IP: [60.166.107.169]
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiYByuamikVa45BQACsx
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

On Wed, Aug 20, 2025 at 05:14:47PM +0800, Jinchao Wang wrote:
> This patch updates the fbcon_skip_panic() function to use
> the panic_in_progress() helper.
> 
> The previous direct access to panic_cpu is less
> readable and is being replaced by a dedicated function
> that more clearly expresses the intent.
> 
> This change is part of a series to refactor the kernel's
> panic handling logic for better clarity and robustness.
> 
> Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
> ---
>  drivers/video/fbdev/core/fbcon.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 55f5731e94c3..b062b05f4128 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -279,14 +279,7 @@ static int fbcon_get_rotate(struct fb_info *info)
>  
>  static bool fbcon_skip_panic(struct fb_info *info)
>  {
> -/* panic_cpu is not exported, and can't be used if built as module. Use
> - * oops_in_progress instead, but non-fatal oops won't be printed.
> - */
> -#if defined(MODULE)
> -	return (info->skip_panic && unlikely(oops_in_progress));
> -#else
> -	return (info->skip_panic && unlikely(atomic_read(&panic_cpu) != PANIC_CPU_INVALID));
> -#endif
> +	return (info->skip_panic && unlikely(panic_in_progress()));
>  }
>  
>  static inline bool fbcon_is_active(struct vc_data *vc, struct fb_info *info)
> -- 
> 2.43.0

Acked-by Qianqiang Liu <qianqiang.liu@163.com>

-- 
Best,
Qianqiang Liu

