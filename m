Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8193D718FCB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 02:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8453B10E1F7;
	Thu,  1 Jun 2023 00:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id 598EC10E06E;
 Thu,  1 Jun 2023 00:59:37 +0000 (UTC)
Received: from [172.30.38.103] (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 80066180000131; 
 Thu,  1 Jun 2023 08:59:33 +0800 (CST)
Message-ID: <a3905de3-265a-b69b-10f7-044bc18808b0@nfschina.com>
Date: Thu, 1 Jun 2023 08:59:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/nouveau/nvif: use struct_size()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <00e84595-e2c9-48ea-8737-18da34eaafbf@kili.mountain>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/5/31 16:31, Dan Carpenter wrote:
> On Wed, May 31, 2023 at 12:38:26PM +0800, Su Hui wrote:
>> Use struct_size() instead of hand writing it.
>> This is less verbose and more informative.
>>
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>   drivers/gpu/drm/nouveau/nvif/object.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
>> index 4d1aaee8fe15..4bd693aa4ee0 100644
>> --- a/drivers/gpu/drm/nouveau/nvif/object.c
>> +++ b/drivers/gpu/drm/nouveau/nvif/object.c
>> @@ -65,7 +65,7 @@ nvif_object_sclass_get(struct nvif_object *object, struct nvif_sclass **psclass)
>>   	u32 size;
>>   
>>   	while (1) {
>> -		size = sizeof(*args) + cnt * sizeof(args->sclass.oclass[0]);
>> +		size = struct_size(args, sclass.oclass, cnt);
> This is from the original code, but now that you are using the
> struct_size() macro static checkers will complain about it.  (Maybe they
> don't yet?).  size is a u32.  Never save struct_size() returns to
> anything except unsigned long or size_t.  (ssize_t is also fine, I
> suppose).  Otherwise, you do not benefit from the integer overflow
> checking.
Sorry, I don't notice the issue caused by type size.
You are right, this patch is wrong because of the type mismatch.
Thanks for your reply!

Su Hui

>>   		if (!(args = kmalloc(size, GFP_KERNEL)))
>>   			return -ENOMEM;
>>   		args->ioctl.version = 0;
> regards,
> dan carpenter
