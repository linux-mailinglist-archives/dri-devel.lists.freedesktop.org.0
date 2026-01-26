Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO5IEABVd2nMeAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 12:50:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9419987D53
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 12:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C1D10E1CD;
	Mon, 26 Jan 2026 11:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="b9J9SHkj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE8910E1CD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 11:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fNdXdx3qpgtP8W7eHWimmJlGqGjPkF4bLSPE3qsDDxw=; b=b9J9SHkjo7vDS8rVgQb9Ekv8XW
 ZtJu4j7xsdILnMAyjAO9GiewSYRe3AqXcUtC3oNZkFLsu+cFwKW+b2KrW0JRCeIx7hPqu0Quj7Fef
 yWC58z14q3GHqX8XonMeb6IojX98lIgHoguoCfhj7NaaurZjqcELugQSshlb34/e/DhkPZjbqsg2c
 ETBYK4Pi6fqz0FEX4RzXxufJ2WzZ6b+tzoOesfO5OTo6YgRXqHGOrUGCK7s2gnExgeiJVl6cjc4Gf
 KwijCChSx+WQ/b1yfPzQUPmbXeZRRkHOao3cFmUlEraxiugChA+jE4qwuI5mqEG8glI/F1PQ1kA3G
 j6DQYMSw==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vkL6j-00A1TM-Hn; Mon, 26 Jan 2026 12:50:13 +0100
Message-ID: <03cd76ac-7cb9-4493-8695-3d2d60358709@igalia.com>
Date: Mon, 26 Jan 2026 11:50:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: Do not allow userspace to trigger kernel warnings
 in drm_gem_change_handle_ioctl()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Zhi Wang <wangzhi@stu.xidian.edu.cn>,
 David Francis <David.Francis@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, stable@vger.kernel.org
References: <9bde8c39-ba4c-49c5-a0bc-4e78338f055a@amd.com>
 <20260123141540.76540-1-tvrtko.ursulin@igalia.com>
 <9e5f8140-d197-46f2-8324-bd705a889ecf@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <9e5f8140-d197-46f2-8324-bd705a889ecf@amd.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:kernel-dev@igalia.com,m:wangzhi@stu.xidian.edu.cn,m:David.Francis@amd.com,m:felix.kuehling@amd.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	URIBL_MULTI_FAIL(0.00)[igalia.com:server fail,amd.com:server fail,xidian.edu.cn:server fail,gabe.freedesktop.org:server fail];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: 9419987D53
X-Rspamd-Action: no action


On 26/01/2026 09:02, Christian König wrote:
> 
> 
> On 1/23/26 15:15, Tvrtko Ursulin wrote:
>> Since GEM bo handles are u32 in the uapi and the internal implementation
>> uses idr_alloc() which uses int ranges, passing a new handle larger than
>> INT_MAX trivially triggers a kernel warning:
>>
>> idr_alloc():
>> ...
>> 	if (WARN_ON_ONCE(start < 0))
>> 		return -EINVAL;
>> ...
>>
>> Fix it by rejecting new handles above INT_MAX and at the same time make
>> the end limit calculation more obvious by moving into int domain.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Reported-by: Zhi Wang <wangzhi@stu.xidian.edu.cn>
>> Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM handle")
>> Cc: David Francis <David.Francis@amd.com>
>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: <stable@vger.kernel.org> # v6.18+
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Pushed to drm-misc-fixes, thank you!

Regards,

Tvrtko

> 
>> ---
>> v2:
>>   * Rename local variable, re-position comment, drop the else block. (Christian)
>>   * Use local at more places.
>> ---
>>   drivers/gpu/drm/drm_gem.c | 18 ++++++++++++------
>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 7ff6b7bbeb73..ffa7852c8f6c 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1001,16 +1001,21 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>>   {
>>   	struct drm_gem_change_handle *args = data;
>>   	struct drm_gem_object *obj;
>> -	int ret;
>> +	int handle, ret;
>>   
>>   	if (!drm_core_check_feature(dev, DRIVER_GEM))
>>   		return -EOPNOTSUPP;
>>   
>> +	/* idr_alloc() limitation. */
>> +	if (args->new_handle > INT_MAX)
>> +		return -EINVAL;
>> +	handle = args->new_handle;
>> +
>>   	obj = drm_gem_object_lookup(file_priv, args->handle);
>>   	if (!obj)
>>   		return -ENOENT;
>>   
>> -	if (args->handle == args->new_handle) {
>> +	if (args->handle == handle) {
>>   		ret = 0;
>>   		goto out;
>>   	}
>> @@ -1018,18 +1023,19 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>>   	mutex_lock(&file_priv->prime.lock);
>>   
>>   	spin_lock(&file_priv->table_lock);
>> -	ret = idr_alloc(&file_priv->object_idr, obj,
>> -		args->new_handle, args->new_handle + 1, GFP_NOWAIT);
>> +	ret = idr_alloc(&file_priv->object_idr, obj, handle, handle + 1,
>> +			GFP_NOWAIT);
>>   	spin_unlock(&file_priv->table_lock);
>>   
>>   	if (ret < 0)
>>   		goto out_unlock;
>>   
>>   	if (obj->dma_buf) {
>> -		ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf, args->new_handle);
>> +		ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf,
>> +					       handle);
>>   		if (ret < 0) {
>>   			spin_lock(&file_priv->table_lock);
>> -			idr_remove(&file_priv->object_idr, args->new_handle);
>> +			idr_remove(&file_priv->object_idr, handle);
>>   			spin_unlock(&file_priv->table_lock);
>>   			goto out_unlock;
>>   		}
> 

