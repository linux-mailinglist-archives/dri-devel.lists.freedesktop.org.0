Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754DC99441F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 11:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B4F10E032;
	Tue,  8 Oct 2024 09:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fDTf9Qcr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688D910E032
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 09:23:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4162A5C014C;
 Tue,  8 Oct 2024 09:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9A5C4CECF;
 Tue,  8 Oct 2024 09:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1728379379;
 bh=GQmaoKOmh0KbA2vGuB7EWKSh13e51GqPKizukdss1h8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fDTf9QcrJ9RWbwh8Z1lGNGHhDi+VzCLWatbkzZD726LPLmFoFs+8w9CAZsVWRUL0C
 zT9RdnCPuKP8lXH9qVK7tqmTGg9ZUMzdQBe+uXCFlVZ9SgbX9lYghhc3eSuR53K8Bi
 Y7ukT2TkWpiTdDSdVsDyeDx8BGUPn2ZCUXvVCPwo=
Date: Tue, 8 Oct 2024 11:22:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Gray <jsg@jsg.id.au>
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Subject: Re: [PATCH 6.6.y] Revert "drm/amd/display: Skip Recompute DSC Params
 if no Stream on Link"
Message-ID: <2024100842-tidiness-buzz-ad6a@gregkh>
References: <20241007035711.46624-1-jsg@jsg.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007035711.46624-1-jsg@jsg.id.au>
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

On Mon, Oct 07, 2024 at 02:57:11PM +1100, Jonathan Gray wrote:
> This reverts commit a53841b074cc196c3caaa37e1f15d6bc90943b97.
> 
> duplicated a change made in 6.6.46
> 718d83f66fb07b2cab89a1fc984613a00e3db18f
> 
> Cc: stable@vger.kernel.org # 6.6
> Signed-off-by: Jonathan Gray <jsg@jsg.id.au>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 7fb11445a28f..d390e3d62e56 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -1266,9 +1266,6 @@ static bool is_dsc_need_re_compute(
>  		}
>  	}
>  
> -	if (new_stream_on_link_num == 0)
> -		return false;
> -
>  	if (new_stream_on_link_num == 0)
>  		return false;
>  
> -- 
> 2.46.1
> 

The whole drm tree is messed up when it comes to stable patches.
Duplicates like this happen all the time due to their bizarre workflow
that causes this to happen at least once a release, and is still a major
pain to deal with.

I dread the -rc1 merge window each time for the drm patches and put them
off until I have gotten through everything else.  Can you please work
with those developers to make this go better to prevent this from
constantly happening?

thanks,

greg k-h
