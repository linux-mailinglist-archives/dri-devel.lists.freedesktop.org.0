Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAA08256AD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 16:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14EC10E622;
	Fri,  5 Jan 2024 15:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E336B10E622
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 15:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E+LMJEa3mPlgXD2P3iPiQZx+1y/qNHXCMQpmVI3QvV4=; b=jAtLV7LP4/FNkqmNFNlN2M3tS0
 +9Z1+oOyxtzwFjnYURp4C4o89ROjyqizhriW7m9o9nmt29M1wyCPuhCsWXz5Jtc3bKFSJCTrT5x8Y
 YI3qbKTJk7/s6Xnxy8mJBmoiLNSZQFST4Tn5eFuMBeNcFctAKmr/uFyM1J3ZNzqACTZNEy9XN0pyf
 J8sDsQjIea9Sut4pT9OP8kPse1+tdYEn7o31YWfhtLmC5M6lvaDCU9zrSfv4ntJ/dV7HTN7kZyrOa
 OqCY9SISHqgZIATiZrEzxSsXyTejbM7ejz+sLyhdlojzKBqPOqMyHR1avZAr62l56JU05LfnhGJN9
 uunPId3g==;
Received: from [102.213.205.115] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rLmCI-003Ecs-WC; Fri, 05 Jan 2024 16:33:23 +0100
Date: Fri, 5 Jan 2024 14:32:37 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/v3d: Show the memory-management stats on debugfs
Message-ID: <raexpawp3v2tpyw7gwnxb6ijmohaw62odyspjigbulddny57ga@7mjwwheh5zca>
References: <20240105145851.193492-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240105145851.193492-1-mcanal@igalia.com>
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
Cc: kernel-dev@igalia.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Iago Toral <itoral@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/05, Maíra Canal wrote:
> Dump the contents of the DRM MM allocator of the V3D driver. This will
> help us to debug the VA ranges allocated.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/v3d/v3d_debugfs.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
> index f843a50d5dce..cdfe1d3bf5ee 100644
> --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
> +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
> @@ -260,11 +260,26 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
>  	return 0;
>  }
> 
> +static int v3d_debugfs_mm(struct seq_file *m, void *unused)
> +{
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct drm_debugfs_entry *entry = m->private;
> +	struct drm_device *dev = entry->dev;
> +	struct v3d_dev *v3d = to_v3d_dev(dev);
> +
> +	spin_lock(&v3d->mm_lock);
> +	drm_mm_print(&v3d->mm, &p);
> +	spin_unlock(&v3d->mm_lock);
> +
> +	return 0;
> +}

LGTM.

Reviewed-by: Melissa Wen <mwen@igalia.com>

> +
>  static const struct drm_debugfs_info v3d_debugfs_list[] = {
>  	{"v3d_ident", v3d_v3d_debugfs_ident, 0},
>  	{"v3d_regs", v3d_v3d_debugfs_regs, 0},
>  	{"measure_clock", v3d_measure_clock, 0},
>  	{"bo_stats", v3d_debugfs_bo_stats, 0},
> +	{"v3d_mm", v3d_debugfs_mm, 0},
>  };
> 
>  void
> --
> 2.43.0
> 
