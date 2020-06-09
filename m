Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EED1F4F1A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D006E39E;
	Wed, 10 Jun 2020 07:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264F989DBD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 14:19:16 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E8FE6CA63AF4BE8F121B;
 Tue,  9 Jun 2020 22:19:09 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.204) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 9 Jun 2020 22:19:01 +0800
Subject: Re: [PATCH 1/2] drm/v3d: remove duplicated kfree in
 v3d_submit_cl_ioctl()
To: <eric@anholt.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <navid.emamdoost@gmail.com>
References: <20200601123202.3892415-1-yukuai3@huawei.com>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <3d92e51c-9c6a-e75b-ff0f-2ae27d299502@huawei.com>
Date: Tue, 9 Jun 2020 22:19:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200601123202.3892415-1-yukuai3@huawei.com>
X-Originating-IP: [10.166.215.204]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: dri-devel@lists.freedesktop.org, yi.zhang@huawei.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ping ?

On 2020/6/1 20:32, yu kuai wrote:
> kfree() is called twice for the same variable 'bin', the first is
> introduced in commit 0d352a3a8a1f ("drm/v3d: don't leak bin job if
> v3d_job_init fails."), while the second is introduced in
> commit 29cd13cfd762 ("drm/v3d: Fix memory leak in v3d_submit_cl_ioctl").
> The latter one should fail since there is a conflict, however, it got
> merged somehow.
> 
> Fix it by removing the function call which is introduced later.
> 
> Fixes: 29cd13cfd762 ("drm/v3d: Fix memory leak in v3d_submit_cl_ioctl")
> Signed-off-by: yu kuai <yukuai3@huawei.com>
> ---
>   drivers/gpu/drm/v3d/v3d_gem.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 549dde83408b..271567600921 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -570,7 +570,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
>   		if (ret) {
>   			kfree(bin);
>   			v3d_job_put(&render->base);
> -			kfree(bin);
>   			return ret;
>   		}
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
