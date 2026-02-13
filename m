Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOjfErA2j2n2MgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:35:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E04D1371B9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA44810E7FD;
	Fri, 13 Feb 2026 14:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="alD5FjzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444B010E7FD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 14:35:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770993310; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JpYdjEv2gvi8W9Seb/fuHIy6SMzZPVY+FqybyP9Z7eElr6gomgcVijDJfbrd4J0AJuDSnhNOpQUq5+l8AENC1cI32wKD9Mpt00c9kv0VIgqfc57mFmvCRe/hN7Fja1Yy8OE0qT9Mk2EgAe0nLZ8vlYVCf9CoMPZ1ajqOC8hGh7Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770993310;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=yQd6Fuc3Syg5OF2rcjj2wLQjupFgjMVUbdgXsLVzFrM=; 
 b=SOuk7CtVgJigzrmjraAvJ8jzExOqKaTD2C8nIkwOGA55SgBaCN6zZKWOLbwbA2b7HiuGQ4cSOm+tvMIJOXbIXqtMQ2efV23mQREtPTBG0kQvw/uSBHfEhWadFs725sX+fH2JakyL8zqy/bBDChA2kaxOywywcOgKdAKcMsfJMYA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770993310; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=yQd6Fuc3Syg5OF2rcjj2wLQjupFgjMVUbdgXsLVzFrM=;
 b=alD5FjzE84hTDUUvk3Awlx9Q/noQlUS14dJRTqCkydAYNUL6SiYCrGEqDK5hezZi
 SPOnEvb4PX/5EU6QjdSNl+CYqfzX90eBpdXTr4ZXSbY0kmPbFaGLD7pE+hbjnXHdEOu
 vn39EGFl3+nf0eWTi0c8PBrUmWmdzZ3id6zUe9ZM=
Received: by mx.zohomail.com with SMTPS id 1770993307837496.13412221074225;
 Fri, 13 Feb 2026 06:35:07 -0800 (PST)
Message-ID: <89b9eba0-0c65-4f75-9815-49f17afa2e0f@collabora.com>
Date: Fri, 13 Feb 2026 11:34:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/vkms: Fix bad matrix offset component
 multiplication
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 daniels@collabora.com, kernel@collabora.com
References: <20260210-vkms-composer-fix-matrix-v2-0-d1ed09cb23e8@collabora.com>
 <20260210-vkms-composer-fix-matrix-v2-1-d1ed09cb23e8@collabora.com>
 <20260212133723.1ef95fd2@eldfell>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20260212133723.1ef95fd2@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:pekka.paalanen@collabora.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:simona@ffwll.ch,m:melissa.srw@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:linux-kernel@vger.kernel.org,m:nfraprado@collabora.com,m:daniels@collabora.com,m:kernel@collabora.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ariel.dalessandro@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ariel.dalessandro@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[bootlin.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,collabora.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 9E04D1371B9
X-Rspamd-Action: no action

Hi Pekka,

On 2/12/26 8:37 AM, Pekka Paalanen wrote:
> On Tue, 10 Feb 2026 14:44:00 -0300
> Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:
> 
>> Pixels values are packed as 16-bit UNORM values, so the matrix offset
>> components must be multiplied properly by the idempotent element -i.e.
>> number 1 encoded as 16-bit UNORM-.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   drivers/gpu/drm/vkms/vkms_composer.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index cd85de4ffd03d..d53ea4189c97b 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -17,6 +17,8 @@
>>   #include "vkms_composer.h"
>>   #include "vkms_luts.h"
>>   
>> +#define UNORM_16BIT_ONE			(1ULL << 16)
> 
> Hi,
> 
> shouldn't this be 0xffff instead?

Indeed, you're right, 1.0 is encoded as 0xffff.

> 
>> +
>>   static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>>   {
>>   	u32 new_color;
>> @@ -139,20 +141,25 @@ VISIBLE_IF_KUNIT void apply_3x4_matrix(struct pixel_argb_s32 *pixel,
>>   	g = drm_int2fixp(pixel->g);
>>   	b = drm_int2fixp(pixel->b);
>>   
>> +	/*
>> +	 * Pixels values are packed as 16-bit UNORM values, so the matrix offset
>> +	 * components must be multiplied properly by the idempotent element -i.e.
>> +	 * number 1 encoded as 16-bit UNORM-.
>> +	 */
>>   	rf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[0]), r) +
>>   	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[1]), g) +
>>   	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[2]), b) +
>> -	     drm_sm2fixp(matrix->matrix[3]);
>> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[3]), drm_int2fixp(UNORM_16BIT_ONE));
>>   
>>   	gf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[4]), r) +
>>   	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[5]), g) +
>>   	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[6]), b) +
>> -	     drm_sm2fixp(matrix->matrix[7]);
>> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[7]), drm_int2fixp(UNORM_16BIT_ONE));
>>   
>>   	bf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[8]), r) +
>>   	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[9]), g) +
>>   	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[10]), b) +
>> -	     drm_sm2fixp(matrix->matrix[11]);
>> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[11]), drm_int2fixp(UNORM_16BIT_ONE));
>>   
>>   	pixel->r = drm_fixp2int_round(rf);
>>   	pixel->g = drm_fixp2int_round(gf);
>>
> 
> Ok, so this is because r, g, b have the integer pixel value [0, 65535].
> A casual reader would expect them to be normalized [0.0, 1.0] (as is
> possible without any loss of precision). But since they are not
> normalized, multiplication by normalized 1.0 must be carried out
> explicitly.
> 
> If UNORM_16BIT_ONE was 0xffff, you would have my
> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Ack, will fix in v3 and add your Reviewed-by tag then.

Thanks a lot!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

