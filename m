Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGAVF1wrd2nacwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:52:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E3F85A0D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F006710E1A8;
	Mon, 26 Jan 2026 08:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HEdx1wUs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67DF89209
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9yDDnUML34EwSFqiYGW4g3jjzJ4Wv78SXcUZkWPmfWU=; b=HEdx1wUs6/lvT9QvUo1ZcNOwGq
 SIH3A7kRq7i2//VtipfXTTLxceHYGGKm3gDYf1cjU8Sme0ty38pL9gGmDEuf/cko5UbN8vZaUIjS8
 BltKjeOmkMkPuRfeuq28O8EGFBlm7ODvMCTiSCOdTfHDSmeWO585xxXkpKD4aWHiNkXzPSTEe1IqZ
 gMF3njwDfODgmOvZANlQU1ltJ8JxRVrrBOQAt7QhWxXJlOa65Lt26U/yFUsgn0e9pX+JAep/5Cu0j
 yBx+yz2vu7Hrqyvh0+4r70ofYHDEbbXo1iG9blSVjgkl4BKXVLfz26tcnEchAaZFi4gxzJ7+XzGgI
 O9b+juIA==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vkIKo-009xBx-Ak; Mon, 26 Jan 2026 09:52:34 +0100
Message-ID: <1db24d1e-113e-4bbf-8785-b608f725afb5@igalia.com>
Date: Mon, 26 Jan 2026 08:52:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: Do not allow userspace to trigger kernel warnings
 in drm_gem_change_handle_ioctl()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Zhi Wang <wangzhi@stu.xidian.edu.cn>,
 David Francis <David.Francis@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 stable@vger.kernel.org
References: <9bde8c39-ba4c-49c5-a0bc-4e78338f055a@amd.com>
 <20260123141540.76540-1-tvrtko.ursulin@igalia.com>
 <0286a6fa-d767-41d3-8c61-c0b34e9a9b47@oracle.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <0286a6fa-d767-41d3-8c61-c0b34e9a9b47@oracle.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harshit.m.mogalapalli@oracle.com,m:kernel-dev@igalia.com,m:wangzhi@stu.xidian.edu.cn,m:David.Francis@amd.com,m:felix.kuehling@amd.com,m:christian.koenig@amd.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: A7E3F85A0D
X-Rspamd-Action: no action


On 23/01/2026 23:42, Harshit Mogalapalli wrote:
> Hi,
> 
> On 23/01/26 19:45, Tvrtko Ursulin wrote:
>> Since GEM bo handles are u32 in the uapi and the internal implementation
>> uses idr_alloc() which uses int ranges, passing a new handle larger than
>> INT_MAX trivially triggers a kernel warning:
>>
>> idr_alloc():
>> ...
>>     if (WARN_ON_ONCE(start < 0))
>>         return -EINVAL;
>> ...
>>
>> Fix it by rejecting new handles above INT_MAX and at the same time make
>> the end limit calculation more obvious by moving into int domain.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Reported-by: Zhi Wang <wangzhi@stu.xidian.edu.cn>
>> Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM 
>> handle")
>> Cc: David Francis <David.Francis@amd.com>
>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: <stable@vger.kernel.org> # v6.18+
> 
> 
> Thanks,
> 
> I have seen this WARN_ON as well and I have tested the reproducer 
> against your patch and it works.
> 
> So:
> 
> Tested-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Thank you! May I ask what test cases are you using to exercise it?

> 
> A question below:
> 
>> ---
>> v2:
>>   * Rename local variable, re-position comment, drop the else block. 
>> (Christian)
>>   * Use local at more places.
>> ---
>>   drivers/gpu/drm/drm_gem.c | 18 ++++++++++++------
>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 7ff6b7bbeb73..ffa7852c8f6c 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1001,16 +1001,21 @@ int drm_gem_change_handle_ioctl(struct 
>> drm_device *dev, void *data,
>>   {
>>       struct drm_gem_change_handle *args = data;
>>       struct drm_gem_object *obj;
>> -    int ret;
>> +    int handle, ret;
>>       if (!drm_core_check_feature(dev, DRIVER_GEM))
>>           return -EOPNOTSUPP;
>> +    /* idr_alloc() limitation. */
>> +    if (args->new_handle > INT_MAX)
>> +        return -EINVAL;
> 
> INT_MAX is allowed.
> 
>> +    handle = args->new_handle;
>> +
>>       obj = drm_gem_object_lookup(file_priv, args->handle);
>>       if (!obj)
>>           return -ENOENT;
>> -    if (args->handle == args->new_handle) {
>> +    if (args->handle == handle) {
>>           ret = 0;
>>           goto out;
>>       }
>> @@ -1018,18 +1023,19 @@ int drm_gem_change_handle_ioctl(struct 
>> drm_device *dev, void *data,
>>       mutex_lock(&file_priv->prime.lock);
>>       spin_lock(&file_priv->table_lock);
>> -    ret = idr_alloc(&file_priv->object_idr, obj,
>> -        args->new_handle, args->new_handle + 1, GFP_NOWAIT);
>> +    ret = idr_alloc(&file_priv->object_idr, obj, handle, handle + 1,
> 
> handle + 1 here would cause a signed integer overflow ?

For the kernel it is fine due -fno-strict-overflow and idr_alloc() 
explicitly handles it:

...
  * Allocates an unused ID in the range specified by @start and @end.  If
  * @end is <= 0, it is treated as one larger than %INT_MAX.  This allows
  * callers to use @start + N as @end as long as N is within integer range.
...
	ret = idr_alloc_u32(idr, ptr, &id, end > 0 ? end - 1 : INT_MAX, gfp);

So for start == INT_MAX it ends up passing end == INT_MAX to 
idr_alloc_u32, which, contrary to idr_alloc(), has it's end range 
parameter _inclusive_.

Simple huh? :))

Regards,

Tvrtko

> 
> 
> 
> Thanks,
> Harshit
>> +            GFP_NOWAIT);
>>       spin_unlock(&file_priv->table_lock);
>>       if (ret < 0)
>>           goto out_unlock;
>>       if (obj->dma_buf) {
>> -        ret = drm_prime_add_buf_handle(&file_priv->prime, obj- 
>> >dma_buf, args->new_handle);
>> +        ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf,
>> +                           handle);
>>           if (ret < 0) {
>>               spin_lock(&file_priv->table_lock);
>> -            idr_remove(&file_priv->object_idr, args->new_handle);
>> +            idr_remove(&file_priv->object_idr, handle);
>>               spin_unlock(&file_priv->table_lock);
>>               goto out_unlock;
>>           }
> 

