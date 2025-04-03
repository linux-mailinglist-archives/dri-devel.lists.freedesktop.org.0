Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7B6A7A831
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 18:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2142610EA2E;
	Thu,  3 Apr 2025 16:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="aNiXaaf4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B8C10E2C4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 16:49:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743698989; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PvL03y2mKKtDbbzoWadMFpA42dP9rW5Iw1NgTcLbcu7hKx+2gqR4xU1z7ZTeMxocXamSXkLLTcrzF5kSQCe9nOBJwqv8UtuWDiGtMZ4Kqyrk5aLxdtdl6z4i8tbG21sMWFirwjyLXBvRRt6vdnsNW4NMFcZP85GO4R9JM9zdIXA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743698989;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=P0rUllkZNhOc/K0eG/q1fbeiU31K6a1atlL6dbjH7wE=; 
 b=i9MK+YZ5xuihinl3YOhhoHziQDdTzb2QCsh2wck1oW/uJ/ebaeyaEu+d0QiQCUeESFleEQ1pLBVKNKLdxvV/F4dbrbj5vx5KepiCMx+MbJ9nFe8pXd3x23tWkrzL2BqZKtYYVk5sgTeMD682cFxqLwdSuWuAio2z1CMexWjeKck=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743698989; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=P0rUllkZNhOc/K0eG/q1fbeiU31K6a1atlL6dbjH7wE=;
 b=aNiXaaf4g0jwjm3d/BOjz0l0JVkD8GN+/9I0GCoSECKfPXw26XacfwJ+XGD21kor
 TTJgky4Ez0+0FsxkoKEQBggZnNtINWTGQjvgSQEWqJ0WmynR1cKrYzJY4lKu8yc70Si
 6G8YSPmhXJHBowD4yKamYmtihlrao9BxfYsuRuLQ=
Received: by mx.zohomail.com with SMTPS id 1743698987522585.1673470029504;
 Thu, 3 Apr 2025 09:49:47 -0700 (PDT)
Message-ID: <9af42e2f-7c5c-4b71-822d-eb39946448df@collabora.com>
Date: Thu, 3 Apr 2025 19:49:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Sergio Lopez <slp@redhat.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250402-virtio-gpu-host-page-size-v2-0-0afdc8c16cb9@redhat.com>
 <20250402-virtio-gpu-host-page-size-v2-1-0afdc8c16cb9@redhat.com>
 <712de3a8-83c2-4ae7-8a5c-dd1baa3d50e4@collabora.com>
Content-Language: en-US
In-Reply-To: <712de3a8-83c2-4ae7-8a5c-dd1baa3d50e4@collabora.com>
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

On 4/2/25 20:55, Dmitry Osipenko wrote:
> On 4/2/25 20:46, Sergio Lopez wrote:
>> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
>> index bf2c9cabd20793e3851e749baadf210341445501..adc264df4e458e9c754936c3015c069e5ee6b899 100644
>> --- a/include/uapi/linux/virtio_gpu.h
>> +++ b/include/uapi/linux/virtio_gpu.h
>> @@ -64,6 +64,10 @@
>>   * context_init and multiple timelines
>>   */
>>  #define VIRTIO_GPU_F_CONTEXT_INIT        4
>> +/*
>> + * Config struct contains host page size
>> + */
>> +#define VIRTIO_GPU_F_HOST_PAGE_SIZE      5
>>  
>>  enum virtio_gpu_ctrl_type {
>>  	VIRTIO_GPU_UNDEFINED = 0,
>> @@ -364,6 +368,7 @@ struct virtio_gpu_config {
>>  	__le32 events_clear;
>>  	__le32 num_scanouts;
>>  	__le32 num_capsets;
>> +	__le32 host_page_size;
>>  };
> 
> Hi, this is still a spec change and the virtio-gpu spec update is need.
> Please send the spec patch, I'd want to see that it won't have new
> objections before merging the kernel patches.

Noticed the virtio-spec patch now. My bad for missing it a day ago,
thanks for sending it!

-- 
Best regards,
Dmitry
