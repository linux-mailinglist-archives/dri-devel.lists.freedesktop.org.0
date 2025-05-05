Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40EBAA981E
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 17:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4161D10E30A;
	Mon,  5 May 2025 15:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="f49hcz9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E4910E30A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 15:58:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746460699; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hkUgx6Mj/ja9r8LQOpbhvnz1tEB+uND8C0BBBexnI5VPuVRmlXjhYVAadafBQ15CdzBdIRUx8FegOjiFlym9ZtjgkE9ODh1Mt6ZZSbIR1f9e11P4e3QctvXi1EHd82wzxM6kbBOSXj4S7wJIHMJId/O7icQXyS/TzkmDO3u5gZU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746460699;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=TBneRj8Wi3aNUjuAlFYRMoAHRWU9YFWZYst/MYENSsQ=; 
 b=YflmZBIk1tFU68O2ldxn8mopG7vCn7GTdSFAwknks0prURZvK9A7rPQjV6FTt1uiMhFZBcbvkoFhGXE25+k5VXbaDzGogEEBvfO7VyBJnIuX6mY0G7V99aGizFPypIg+j2bW7sLDOeiGeBhM7B7KxD1h484CkrVllc5TyBSVGkc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746460699; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=TBneRj8Wi3aNUjuAlFYRMoAHRWU9YFWZYst/MYENSsQ=;
 b=f49hcz9h3d8aXahF6KPCqBKJrWYbRPoyLvDAgCu9MCKQjf694ZHcTHtrzmuJr/bB
 4kRh+yznnWV8nhiOHyqMEO8AjlBXISA0t4Ggo7CqaA7m4avMt+jeyMZVj2hj/9K1Hr4
 Olo9ZhRpErCWAmyQItoVLm5iQq4gqgKGOzLEqP0k=
Received: by mx.zohomail.com with SMTPS id 1746460696721946.0446506917006;
 Mon, 5 May 2025 08:58:16 -0700 (PDT)
Message-ID: <5271820d-7afd-45e5-8103-b7d4fc818278@collabora.com>
Date: Mon, 5 May 2025 18:58:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] virtgpu: deallocate capsets on device deinit
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250505-virtgpu-queue-cleanup-v1-v1-0-810923da2b1e@linaro.org>
 <20250505-virtgpu-queue-cleanup-v1-v1-3-810923da2b1e@linaro.org>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20250505-virtgpu-queue-cleanup-v1-v1-3-810923da2b1e@linaro.org>
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

On 5/5/25 11:59, Manos Pitsidianakis wrote:
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 7b3c4d314f8eee692e2842a7056d6dc64936fc2f..a8b751179332b9ec2fbba1392a6ee0e638a5192e 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -286,6 +286,10 @@ void virtio_gpu_deinit(struct drm_device *dev)
>  	flush_work(&vgdev->cursorq.dequeue_work);
>  	flush_work(&vgdev->config_changed_work);
>  	virtio_reset_device(vgdev->vdev);
> +	spin_lock(&vgdev->display_info_lock);
> +	drmm_kfree(dev, vgdev->capsets);
> +	vgdev->capsets = NULL;
> +	spin_unlock(&vgdev->display_info_lock);

Isn't this lock superfluous?

-- 
Best regards,
Dmitry
