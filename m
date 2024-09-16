Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B839597A444
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 16:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A3910E398;
	Mon, 16 Sep 2024 14:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="INsR3Jyk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A2010E398
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mk0BMKWk4Yat1PFjBVRQb4W9AI5Uqy55m+bOikpeIBE=; b=INsR3JykpH5yhclqPUEKpuzZKZ
 lAtqtfypGfO7a+xjIhJeJsIPl594AmDIb5Figmwxke6JRaSiJQKESXGksNlCkHmjS+HSYhyZsLnaG
 UpcmvaZw4ZTKXrs7ia14lNbmT7g8m9wLojgND/K7lMdkAHs9em6QZuOR8vhawqWriIfxy0WPkVSvh
 x2mRePurR4/KQmB6XgScmcqxnqz3s0viY+ZynnXAF+Zm0WeEhvCbiCtnpRkxoQqshq9sRv5f+RSqG
 ssL5tPBV6JwVTkxAThILeni1tvKjZ2V7jAH86AZjvvAlXEICr5tMq8YvdHGYrrEnicZRzr7ejoDqB
 fK2wH1gg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sqCq8-00ETuh-6g; Mon, 16 Sep 2024 16:36:32 +0200
Message-ID: <f5a15815-14f4-40b6-9908-cacd1691ab5f@igalia.com>
Date: Mon, 16 Sep 2024 15:36:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm: use drm_file name in fdinfo
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com
References: <20240916133223.1023773-1-pierre-eric.pelloux-prayer@amd.com>
 <20240916133223.1023773-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240916133223.1023773-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 16/09/2024 14:32, Pierre-Eric Pelloux-Prayer wrote:
> Add an optional drm-client-name field to drm fdinfo's output.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   Documentation/gpu/drm-usage-stats.rst | 5 +++++
>   drivers/gpu/drm/drm_file.c            | 5 +++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index a80f95ca1b2f..ed1d7edbbc5f 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -73,6 +73,11 @@ scope of each device, in which case `drm-pdev` shall be present as well.
>   Userspace should make sure to not double account any usage statistics by using
>   the above described criteria in order to associate data to individual clients.
>   
> +- drm-client-name: <valstr>
> +
> +String optionally set by userspace using DRM_IOCTL_SET_NAME.
> +
> +
>   Utilization
>   ^^^^^^^^^^^
>   
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index e9dd0e90a1f9..6a3621f50784 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -955,6 +955,11 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>   			   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
>   	}
>   
> +	mutex_lock(&file->name_lock);
> +	if (file->name)
> +		drm_printf(&p, "drm-client-name:\t%s\n", file->name);
> +	mutex_unlock(&file->name_lock);
> +
>   	if (dev->driver->show_fdinfo)
>   		dev->driver->show_fdinfo(&p, file);
>   }

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
