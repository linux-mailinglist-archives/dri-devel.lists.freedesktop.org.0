Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C02AC52357
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 13:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E26210E6FA;
	Wed, 12 Nov 2025 12:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="SRs5tryj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5489B10E6FA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 12:14:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1762949666; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Tq41fjFTE3/OKHQwL7fEBdcp85ytUO1rZb9J9zC19p5oD41+fTOzFcII58A4LjcN1GByptyv58IGJRmAFpk1L6FFz6xe9xJlKp+fLWsL7rStjlwto7FGezaIeSSWaqut8WgdU+dtDQKOxh11+Sb5q2/Q/ugY8UCkRmO+CfVtT1Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1762949666;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=nmNu0BqiQLMXek9pjsJjeBE69VJ7PBIoc9imrwDBnVg=; 
 b=YOpuWJFMlrkISfgVrifEWm+2MnwoMq4GSzBK2a0Whe1nZe4nzAG4E9pLfnH8ETGq71kHTCRaLrXZrAbEnl7ZHE0zliQ0qVP2WL80KEglRHm4WxfAB/6KO11pza12VbnnIntm6vrL0Fd5q55PwWUlEoefPd04Jhc8OTQWdrkeEHg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762949666; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=nmNu0BqiQLMXek9pjsJjeBE69VJ7PBIoc9imrwDBnVg=;
 b=SRs5tryjPucGQ9+xDnpxckIRb8Irfyf6zeo6F2nS3USjvphhDEKpJkbh1VuzX0Aq
 S8kc9BVBIQYUf2nyhYT6gh85Pt/kC8IvzOpngAwdR6pW1e4I0GGWdbbvq1sfK2thICB
 Kk+6YZSm1S6CAwB6FgY4zyuWu9S2/qpZuEmL2rQE=
Received: by mx.zohomail.com with SMTPS id 1762949664552644.4534275519923;
 Wed, 12 Nov 2025 04:14:24 -0800 (PST)
Message-ID: <855ebbf1-0b02-45b5-8fa9-b50c05793e19@collabora.com>
Date: Wed, 12 Nov 2025 15:14:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/virtio: support VIRTIO_GPU_F_BLOB_ALIGNMENT
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
 <20251110125213.12633-2-slp@redhat.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20251110125213.12633-2-slp@redhat.com>
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
> +	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_BLOB_ALIGNMENT)) {
> +		vgdev->has_blob_alignment = true;
> +		virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
> +				blob_alignment, &blob_alignment);
> +		vgdev->blob_alignment = blob_alignment;

Shouldn't blob_alignment be max(guest_alignment, host_alignment)?

-- 
Best regards,
Dmitry
