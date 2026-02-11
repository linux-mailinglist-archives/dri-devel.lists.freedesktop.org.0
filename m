Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FAwiEXISjWl/ygAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 00:36:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A5D12850E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 00:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3774310E66A;
	Wed, 11 Feb 2026 23:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="UnzV3fwd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC71B10E669
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 23:36:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770852967; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=b7TeAgBvOkPhQZuu0FxXmM4SYQf8W+TvazFZQkMLrvNCwd9b7HiUjh4ufjCaq7xGy6oIditvg5CXhNlgl1S3OXDUvhD6Gsbybdj8T1vdidctYApI2fyg5ln9DERACErw7Gzc4jj0c4kfApTmlZFGH7RGeUdQpepFb1FzjIHoJ4w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770852967;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NuDprhfp0CipY6Sg+IILW80aGPA17nB5ISnMg3x56Ak=; 
 b=GA1RrGrcmA75x/E2ezH7eRMuXiQkMhtLcQ1l9tVcHgzETTh1cvJtWIkXpRhfMRBG6MeIB+Bb+lyVcjkXzuMkg5OI2t/9D4EofXQapB7DV3SP5OhmpxA6ROcBCRuY0fi+SbZnQvJUM0Xdfxn+mvWeGh5Ft63IkqpGFP3sqdzIlMo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770852967; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=NuDprhfp0CipY6Sg+IILW80aGPA17nB5ISnMg3x56Ak=;
 b=UnzV3fwdzMrI7UludT0TFpSJGgHjk5zhvvafsVGFlq5xfPzx4C/uQBvtcTjMqrpb
 MrbTLtYzOCMhUL9AaboKWqPlYMnNB8yFQeHsD388l5PsCMUknDtpbZFUErgTcYHa5SD
 A4rbyTZDU5+r/spYh2TJXwuY2WawHT106CtvLADQ=
Received: by mx.zohomail.com with SMTPS id 1770852966508980.015296459701;
 Wed, 11 Feb 2026 15:36:06 -0800 (PST)
Message-ID: <c00ef6a9-cb27-456a-b3c2-81856f4cb56d@collabora.com>
Date: Thu, 12 Feb 2026 02:35:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Allow importing prime buffers when 3D is
 enabled
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Val Packett <val@invisiblethingslab.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251210154755.1119861-2-val@invisiblethingslab.com>
 <b871f1d3-7a38-4f02-ac7a-7b8db188f464@collabora.com>
Content-Language: en-US
In-Reply-To: <b871f1d3-7a38-4f02-ac7a-7b8db188f464@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:val@invisiblethingslab.com,m:airlied@redhat.com,m:kraxel@redhat.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:vivek.kasireddy@intel.com,m:dongwon.kim@intel.com,m:christian.koenig@amd.com,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[dmitry.osipenko@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[invisiblethingslab.com,redhat.com,chromium.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email]
X-Rspamd-Queue-Id: 75A5D12850E
X-Rspamd-Action: no action

On 2/12/26 01:58, Dmitry Osipenko wrote:
> On 12/10/25 18:39, Val Packett wrote:
>> This functionality was added for using a KMS-only virtgpu with a physical
>> (or SR-IOV) headless GPU in passthrough, but it should not be restricted
>> to KMS-only mode. It can be used with cross-domain to pass guest memfds
>> to the host compositor with zero copies (using udmabuf on both sides).
>>
>> Drop the check for the absence of virgl_3d to allow for more use cases.
>>
>> Fixes: ca77f27a2665 ("drm/virtio: Import prime buffers from other devices as guest blobs")
>> Signed-off-by: Val Packett <val@invisiblethingslab.com>
>> ---
>>
>> Hi. I couldn't find any comments on that line in the reviews (on patchwork), so I assume
>> there was never a specific technical reason for that check, just an abundance of caution?
>>
>> BTW, while here.. The drm_gem_prime_import "fallback" seems pretty much equivalent to
>> `return (-ENODEV)`, as drm_gem_prime_import(_dev) just translates the call to
>> gem_prime_import_sg_table which we don't use. Should it be replaced with `return (-ENODEV)`?
>>
>> ---
>>  drivers/gpu/drm/virtio/virtgpu_prime.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
>> index ce49282198cb..2fedd5d3bd62 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
>> @@ -312,7 +312,7 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
>>  		}
>>  	}
>>  
>> -	if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
>> +	if (!vgdev->has_resource_blob)
>>  		return drm_gem_prime_import(dev, buf);
>>  
>>  	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
> 
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Applied to misc-next, thanks

-- 
Best regards,
Dmitry
