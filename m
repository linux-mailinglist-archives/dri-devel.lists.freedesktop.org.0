Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C7A4D7149
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 23:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973F810E025;
	Sat, 12 Mar 2022 22:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (relay.hostedemail.com [64.99.140.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920FD10E025
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 22:27:48 +0000 (UTC)
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay13.hostedemail.com (Postfix) with ESMTP id D544D603B9;
 Sat, 12 Mar 2022 22:27:46 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf02.hostedemail.com (Postfix) with ESMTPA id 927AA80011; 
 Sat, 12 Mar 2022 22:27:45 +0000 (UTC)
Message-ID: <05dbfbd2670e2b28229d0ab96c1bd99787d4a187.camel@perches.com>
Subject: Re: [PATCH] drm/v3d: Use kvcalloc
From: Joe Perches <joe@perches.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Date: Sat, 12 Mar 2022 14:27:44 -0800
In-Reply-To: <20220312152656.51625-1-harshit.m.mogalapalli@oracle.com>
References: <20220312152656.51625-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 927AA80011
X-Spam-Status: No, score=0.05
X-Stat-Signature: fpmtk5ye341iyaf6udwzfgyky1pez8ws
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18grHNWCCtKCR1M4ZlyWIVxGMpFIRxX0Fs=
X-HE-Tag: 1647124065-574508
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2022-03-12 at 07:26 -0800, Harshit Mogalapalli wrote:
> kvcalloc is same as kvmalloc_array + __GFP_ZERO.
[]
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
[]
> @@ -308,9 +308,8 @@ v3d_lookup_bos(struct drm_device *dev,
>  		return -EINVAL;
>  	}
>  
> -	job->bo = kvmalloc_array(job->bo_count,
> -				 sizeof(struct drm_gem_cma_object *),
> -				 GFP_KERNEL | __GFP_ZERO);
> +	job->bo = kvcalloc(job->bo_count, sizeof(struct drm_gem_cma_object *),
> +			   GFP_KERNEL);
>  	if (!job->bo) {
>  		DRM_DEBUG("Failed to allocate validated BO pointers\n");
>  		return -ENOMEM;

trivia:

The DRM_DEBUG could also be removed as the the alloc will do a
a dump_stack on failure.


