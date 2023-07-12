Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E56B750437
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 12:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2715A10E4BE;
	Wed, 12 Jul 2023 10:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id A9EA710E4C8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 10:15:14 +0000 (UTC)
Received: from [172.30.11.106] (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id BE9606076583E; 
 Wed, 12 Jul 2023 18:15:09 +0800 (CST)
Message-ID: <5194f82f-12d6-05aa-33b7-69c88923e455@nfschina.com>
Date: Wed, 12 Jul 2023 18:15:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/virtio: remove some redundant code
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <b82057bf-3126-4721-87f5-79ca3682cee4@kadam.mountain>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, gurchetansingh@chromium.org,
 kraxel@redhat.com, airlied@redhat.com,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/7/12 14:36, Dan Carpenter wrote:

> On Wed, Jul 12, 2023 at 09:18:42AM +0800, Su Hui wrote:
>> On 2023/7/11 19:13, Dan Carpenter wrote:
>>> On Tue, Jul 11, 2023 at 05:00:31PM +0800, Su Hui wrote:
>>>> virtio_gpu_get_vbuf always be successful,
>>>> so remove the error judgment.
>>>>
>>> No, just ignore the static checker false positive in this case.  The
>>> intent of the code is clear that if it did have an error it should
>>> return an error pointer.
>> Hi, Dan,
>>
>> Function "virtio_gpu_get_vbuf" call "kmem_cache_zalloc (vgdev->vbufs,
>> GFP_KERNEL | __GFP_NOFAIL)" to
>> allocate memory. Adding the " __GFP_NOFAIL”flag make sure it won't fail. And
>> "virtio_gpu_get_vbuf" never
>> return an error code, so I think this is not a false positive.
> We all see this and agree.
>
> However the check for if (IS_ERR()) is written deliberately because we
> might change the code to return error pointers in the future.  Static
> checkers are looking for code that does something unintentional but in
> this case the code was written that way deliberately.
Got it ,  I shouldn't remove it because the check may be useful in the 
future.
Thanks for your explanation.

Su Hui

>
> regards,
> dan carpenter
>
