Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKnfKiJ0p2ljhgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 00:52:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7F51F87DB
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 00:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A6C10E0BE;
	Tue,  3 Mar 2026 23:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="ZhZDh+nh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B81610E0BE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 23:51:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772581904; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Q80XbsvtuVAQsmFPuoq/6zr+/oK7Kf9YFQSawVzzJqOIK0/QQlx3lAoqQS2VsfjazsCpgQUxFpBtxyRY46IIqQICgk/kfW799LU9+fk+aNjoaO+CVMaxLzQFNgoChFeZRaRPihen87XxzPKLcn2o3UVcZJajPCrG5aD9FBorjG0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772581904;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=XVXWwjOao24+lehwACLHpjLtJk6m5zyKvGu/1VnP2Ro=; 
 b=jR5xnu+5iOu/s/rye5FtNmyVb/NCoYoC7vJsXzdMn0uhwcsc3X4WCJwvOh+EvJp0tNy85+Z4XHPCxVyAeTdmdUirnRJuuTzvQgQvxljmfUv2D4N4/0+33wCAoDR/xqT1kGaENe8bALQCqagHhazZ9BQ+GkzDbEwwauY7iu4wkkI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772581904; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=XVXWwjOao24+lehwACLHpjLtJk6m5zyKvGu/1VnP2Ro=;
 b=ZhZDh+nhogEqNukm2fVZGCwX3nh7S1ezt/6mSsyl5dCyaZutN0+wyC2x5wmjC7ms
 4ysVKXgL5JaSsEPeJGGHvq8MoBgrou8/AhRzZcgLcvWfl42QxP3EMkO8cM8HhMPnH+6
 326gw+Pla8ttc6dB7Q2GhUKJiPePcj48/gZRyFcU=
Received: by mx.zohomail.com with SMTPS id 1772581903106480.1003236269638;
 Tue, 3 Mar 2026 15:51:43 -0800 (PST)
Message-ID: <7f9c5d89-68a7-4c52-b214-56197cd5ad9c@collabora.com>
Date: Wed, 4 Mar 2026 02:51:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Open-code drm_simple_encoder_init()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Hardik Phalet <hardik.phalet@pm.me>
Cc: Hardik Phalet <hardik.phalet@gmail.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260227103515.413685-1-hardik.phalet@pm.me>
 <5cdb4e34-7964-4456-9311-eac8b3d37371@suse.de>
 <4fa6bc36-3507-4171-8955-29c90db9254b@collabora.com>
 <cf8cb929-2339-46a9-8b76-e76778787b9d@suse.de>
 <e008ca24-83ee-427e-b2a2-8f93e390b199@collabora.com>
 <83824dfb-dbde-4466-bb5d-3fb4348dca6e@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <83824dfb-dbde-4466-bb5d-3fb4348dca6e@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: 1F7F51F87DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dmitry.osipenko@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:hardik.phalet@pm.me,m:hardik.phalet@gmail.com,m:airlied@redhat.com,m:kraxel@redhat.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:hardikphalet@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,redhat.com,chromium.org,linux.intel.com,kernel.org,ffwll.ch,lists.freedesktop.org,lists.linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 3/2/26 18:40, Thomas Zimmermann wrote:
> 
> 
> Am 02.03.26 um 16:31 schrieb Dmitry Osipenko:
>> On 3/2/26 17:15, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 02.03.26 um 14:57 schrieb Dmitry Osipenko:
>>>> On 3/2/26 16:48, Thomas Zimmermann wrote:
>>>>> Hi
>>>>>
>>>>> Am 27.02.26 um 11:35 schrieb Hardik Phalet:
>>>>>> drm_simple_encoder_init() is a thin wrapper around drm_encoder_init()
>>>>>> that only provides a minimal drm_encoder_funcs instance with
>>>>>> .destroy = drm_encoder_cleanup.
>>>>>>
>>>>>> Inline the helper in virtgpu_display.c and provide a local
>>>>>> drm_encoder_funcs instance instead. This removes the unnecessary
>>>>>> indirection and prepares for the eventual removal of
>>>>>> drm_simple_encoder_init().
>>>>>>
>>>>>> No functional changes intended.
>>>>>>
>>>>>> Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
>>>>>> ---
>>>>>>     drivers/gpu/drm/virtio/virtgpu_display.c | 7 ++++++-
>>>>>>     1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/
>>>>>> drm/virtio/virtgpu_display.c
>>>>>> index f1dae9569805..8bd6cdc6c16e 100644
>>>>>> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
>>>>>> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
>>>>>> @@ -232,6 +232,10 @@ static enum drm_mode_status
>>>>>> virtio_gpu_conn_mode_valid(struct drm_connector *con
>>>>>>         return MODE_BAD;
>>>>>>     }
>>>>>>     +static const struct drm_encoder_funcs
>>>>>> virtio_gpu_enc_cleanup_funcs = {
>>>>>> +    .destroy = drm_encoder_cleanup
>>>>>> +};
>>>>>> +
>>>>>>     static const struct drm_encoder_helper_funcs
>>>>>> virtio_gpu_enc_helper_funcs = {
>>>>>>         .mode_set   = virtio_gpu_enc_mode_set,
>>>>>>         .enable     = virtio_gpu_enc_enable,
>>>>>> @@ -306,7 +310,8 @@ static int vgdev_output_init(struct
>>>>>> virtio_gpu_device *vgdev, int index)
>>>>>>         if (vgdev->has_edid)
>>>>>>             drm_connector_attach_edid_property(connector);
>>>>>>     -    drm_simple_encoder_init(dev, encoder,
>>>>>> DRM_MODE_ENCODER_VIRTUAL);
>>>>>> +    drm_encoder_init(dev, encoder, &virtio_gpu_enc_cleanup_funcs,
>>>>>> +             DRM_MODE_ENCODER_VIRTUAL, NULL);
>>>>> This looks correct, but you should also remove the include statement
>>>>> at [1]
>>>>>
>>>>> [1] https://elixir.bootlin.com/linux/v6.19/source/drivers/gpu/drm/
>>>>> virtio/virtgpu_display.c#L35
>>>> The patch adds more lines than removes. What's wrong with
>>>> drm_simple_encoder_init() and why it needs to be removed eventually?
>>> I added it myself a few years ago in an attempt to save some lines of
>>> code. That was a mistake. It's a helper without any purpose. Helpers
>>> should do something.
>> It saves few lines and makes code easier to read. Don't see value in
>> removal of the helper.
> 
> All it does is to set a default cleanup function. But that's not even
> clear from the helper's name.
> 
> If we really want a default cleanup, we should call
> drm_encoder_cleanup() as a default at [1]. Drivers could then just leave
> out the encoder funcs entirely.
> 
> [1] https://elixir.bootlin.com/linux/v6.19/source/drivers/gpu/drm/
> drm_mode_config.c#L530

There are a lot of drivers using drm_simple_encoder_init() in kernel.
What problem the default cleanup function creates? If none, to me the
drm_simple_encoder_init() serves its purpose, improving the drivers'
code. I won't object much if you'll insist on merging the patch, but so
far it looks like a very bikeshed change without a clear explanation of
the solved problem.

-- 
Best regards,
Dmitry
