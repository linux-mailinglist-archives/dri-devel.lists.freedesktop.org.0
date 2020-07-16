Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4D6221FDA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 11:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9066889D83;
	Thu, 16 Jul 2020 09:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F8A6E1A5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 01:59:50 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 094F3E12A9A918CC266D;
 Thu, 16 Jul 2020 09:59:41 +0800 (CST)
Received: from [10.174.179.105] (10.174.179.105) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 16 Jul
 2020 09:59:39 +0800
Subject: Re: [PATCH] drm: remove redundant assignment to variable 'ret'
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <ajax@redhat.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20200715070559.180986-1-jingxiangfeng@huawei.com>
 <20200715120503.GJ3278063@phenom.ffwll.local>
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Message-ID: <5F0FB48A.6080407@huawei.com>
Date: Thu, 16 Jul 2020 09:59:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <20200715120503.GJ3278063@phenom.ffwll.local>
X-Originating-IP: [10.174.179.105]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 16 Jul 2020 09:42:42 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2020/7/15 20:05, Daniel Vetter wrote:
> On Wed, Jul 15, 2020 at 03:05:59PM +0800, Jing Xiangfeng wrote:
>> The variable ret has been assigned the value '-EINVAL'. The assignment
>> in the if() is redundant. We can remove it.
>
> Nope, that's not correct. Before this assignement ret is guaranteed to be
> 0.

Before this assignment ret is '-EINVAL'(see commit 45bc3d26c95a: "drm: 
rework SET_MASTER and DROP_MASTER perm handling"). It is set to 0 above
around the drm_drop_master() calls.

Thanks
> -Daniel
>
>>
>> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
>> ---
>>   drivers/gpu/drm/drm_auth.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>> index 800ac39f3213..6e1b502f2797 100644
>> --- a/drivers/gpu/drm/drm_auth.c
>> +++ b/drivers/gpu/drm/drm_auth.c
>> @@ -299,7 +299,6 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>>
>>   	if (file_priv->master->lessor != NULL) {
>>   		DRM_DEBUG_LEASE("Attempt to drop lessee %d as master\n", file_priv->master->lessee_id);
>> -		ret = -EINVAL;
>>   		goto out_unlock;
>>   	}
>>
>> --
>> 2.17.1
>>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
