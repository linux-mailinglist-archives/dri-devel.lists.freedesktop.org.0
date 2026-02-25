Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBwlG14en2lcZAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 17:07:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA07619A410
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 17:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1667410E79C;
	Wed, 25 Feb 2026 16:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="ciBmbI7n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E6610E79C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 16:07:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772035673; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FTQXQhr7ehSn0BOF4fYxOl4uKIQsbuyOrb/z7ifNuyWBByBXQN251vwJGGmFoiYFcsD0g8upiae3d14cEQJzaq7QBCvxvn0yZIv3q3zQ0zJMkjOmUmtDopbOsjV863KdKwHfF/Gp59oRuj8m/GRswv4mpyPKpR6tmA4coqeY5b8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772035673;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=MGlakZFs5VvCYWqJt6HzHfogAmIjP9TlO0lqNM0P8/k=; 
 b=SGAxvGi64OtVU9YtxkrUIADERPu/mmH01kbo9ls1PK29Wg+X1WZVO1W8iPTVFxl15emoLBnp/TLHFzKUxrkpKwG0GwJhQtiuHR457mcErcapcI9HfFPJYjKw4MEkPJNWAOemZCsWaE/riml1aNst2MSqINjNrYxhAWgALqA/xaE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772035673; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=MGlakZFs5VvCYWqJt6HzHfogAmIjP9TlO0lqNM0P8/k=;
 b=ciBmbI7nPCy/m+JcXl57zR2+ihkos8/vRaSZKCLRXmxtXDOOLTDHgayBX0kmUE6t
 xXOPaDAvbLE2VmmtBeBo/Q4Vkf4WMyueSPGIFgXaKF4ahRpCrPNuDAhvRBLEERzsagr
 yk25uBMW8NfnnHoFfkV65vk+iPrcfW3De6G6NN3E=
Received: by mx.zohomail.com with SMTPS id 1772035672324316.130730279727;
 Wed, 25 Feb 2026 08:07:52 -0800 (PST)
Message-ID: <482bac4b-9fd8-46ca-b44e-664b9b1870bd@collabora.com>
Date: Wed, 25 Feb 2026 19:07:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, kraxel@redhat.com
Cc: nirmoyd@nvidia.com, vivek.kasireddy@intel.com
References: <20260107182745.229481-1-dongwon.kim@intel.com>
 <20260107182745.229481-3-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20260107182745.229481-3-dongwon.kim@intel.com>
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
	FORGED_RECIPIENTS(0.00)[m:dongwon.kim@intel.com,m:airlied@redhat.com,m:kraxel@redhat.com,m:nirmoyd@nvidia.com,m:vivek.kasireddy@intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: DA07619A410
X-Rspamd-Action: no action

On 1/7/26 21:27, dongwon.kim@intel.com wrote:
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index e6363c887500..8e8a8ec4a361 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -65,6 +65,12 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
>  {
>  	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
>  
> +	if (!list_empty(&bo->restore_node)) {
> +		mutex_lock(&vgdev->obj_restore_lock);
> +		list_del(&bo->restore_node);
> +		mutex_unlock(&vgdev->obj_restore_lock);
> +	}

This looks fragile to me, I'd use list_del_init() unconditionally.

Also, looks wrong to delete object's node from the list by the
virtio_gpu_cleanup_object() that is invoked from cmd-completion
callback. You calling virtio_gpu_object_unref_all() that walks up
obj_restore_list while obj already may be in process of async unref'ing?

-- 
Best regards,
Dmitry
