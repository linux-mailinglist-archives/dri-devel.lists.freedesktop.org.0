Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C56C55753
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 03:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978D910E1BB;
	Thu, 13 Nov 2025 02:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="JGviCYxa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0166110E1BB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 02:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763001617; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iyTsqEd2FhFXG6ndWp8ddjToQ7VDhIqtGT5brGbDaflRcy0yvFW0YextaL/+RlQFczoLu5NNBNh06/2DgPDFwGp27m7V7DN/MST8ZxXfMT7PF4d1xrbqBnQSG5KHOCyyVI7wby4wAzlLWtoIdyjUwLJhX3VEN7VZU9TLSZI34ho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763001617;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=t2QX/A+qd/JjOp0/QfYOpuOScoW/0U3AxoS48EJguTg=; 
 b=ARYAkchiA8nzMV0PeHivgdx4T2HhzONwxfIWLNOSsQODlxxq72OXmhNphHez97SWpVwz5DBqZHEN+d7AWxxRMCukt7M8C8UwmihXpx25VAe/6D1lTrAvBjiCB/YFZVD/D6Xf0BCJhqAr3U/Jd9TD3XSo/xZiwn0YseXSCwMlhQY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763001617; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=t2QX/A+qd/JjOp0/QfYOpuOScoW/0U3AxoS48EJguTg=;
 b=JGviCYxaaDWPjad0TWvfQIUNgXfTVuksueBNirSecCUBQ9vFS6elHNvaAREykIvL
 TIXXMep56wt5niwlT63tMyp9dFPV/49Pv2NdSz+FlfHNYBDiBMhS9dDDdqLQFO2PcG0
 YS2ReGeywAWvviH1BKorp5rID5lEEb5ckBkAi6NI=
Received: by mx.zohomail.com with SMTPS id 1763001616214779.1262853256575;
 Wed, 12 Nov 2025 18:40:16 -0800 (PST)
Message-ID: <452ccee9-11bf-437c-9b12-ca21e57f6563@collabora.com>
Date: Thu, 13 Nov 2025 05:40:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/virtio: honor blob_alignment requirements
To: Sergio Lopez <slp@redhat.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251110125213.12633-1-slp@redhat.com>
 <20251110125213.12633-3-slp@redhat.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20251110125213.12633-3-slp@redhat.com>
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

On 11/10/25 15:52, Sergio Lopez wrote:
> -void
> +int
>  virtio_gpu_cmd_resource_create_blob(struct virtio_gpu_device *vgdev,
>  				    struct virtio_gpu_object *bo,
>  				    struct virtio_gpu_object_params *params,
> @@ -1436,6 +1440,10 @@ virtio_gpu_cmd_resource_create_blob(struct virtio_gpu_device *vgdev,
>  	struct virtio_gpu_resource_create_blob *cmd_p;
>  	struct virtio_gpu_vbuffer *vbuf;
>  
> +	if (vgdev->has_blob_alignment &&
> +	    !IS_ALIGNED(params->size, vgdev->blob_alignment))
> +		return -EINVAL;

Perhaps will be better to validate params.size earlier, within
verify_blob(). Then all the added errors handling should become unnecessary.

-- 
Best regards,
Dmitry
