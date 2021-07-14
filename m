Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC363C88F9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 18:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C356F6E3F5;
	Wed, 14 Jul 2021 16:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E506E3F5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 16:49:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B302D613C3;
 Wed, 14 Jul 2021 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626281359;
 bh=6SKB3Qqjs+EC5rQxtbZljNFZlyLM4HZOJZxqpbfl9sM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ko/UfbhD+PKfNZ3iK4ym6LzrxkwTJIAnlAs+qXdzedMZaGQBceXrGL4yO3Mhi8Yui
 vMOTVVJx+4Ujke2mPgfBk3Ht3ixeEAIiueMcl+Mt3nZdEGKe/obO9fAbsIwGZd2S1E
 wlHDb7pZo4ORM9aKt7vjHyClabpj5MHNp1aihZ0eiiUfnZphY1Cf8Si2OtplBMmvoA
 FklATVbj/QyXl8hG1qWEX00mxNkUQ0OdAccH8p4pfKml6iQ2yveG5hqAcabY/0PnHT
 ShhjQGUDah6fa1UE1UZsYnAqBBPNlHHBWN0dRxflqSplK04t3uzsQ1hpgqx1ZY+qSN
 8z4l8b9ME85bA==
Date: Wed, 14 Jul 2021 12:49:18 -0400
From: Sasha Levin <sashal@kernel.org>
To: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH AUTOSEL 4.4 08/31] drm/virtio: Fixes a potential NULL
 pointer dereference on probe failure
Message-ID: <YO8VjgdgHXoAcOMY@sashalap>
References: <20210706112931.2066397-1-sashal@kernel.org>
 <20210706112931.2066397-8-sashal@kernel.org>
 <20210712215937.GA9488@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210712215937.GA9488@amd>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Xie Yongji <xieyongji@bytedance.com>, stable@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 11:59:37PM +0200, Pavel Machek wrote:
>Hi!
>
>> From: Xie Yongji <xieyongji@bytedance.com>
>>
>> [ Upstream commit 17f46f488a5d82c5568e6e786cd760bba1c2ee09 ]
>>
>> The dev->dev_private might not be allocated if virtio_gpu_pci_quirk()
>> or virtio_gpu_init() failed. In this case, we should avoid the cleanup
>> in virtio_gpu_release().
>
>The check is in wrong place at least in 4.4:
>
>> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
>> @@ -257,6 +257,9 @@ int virtio_gpu_driver_unload(struct drm_device *dev)
>>  	flush_work(&vgdev->config_changed_work);
>>  	vgdev->vdev->config->del_vqs(vgdev->vdev);
>>
>> +	if (!vgdev)
>> +		return;
>> +
>
>Pointer is dereferenced before being tested.

Heh, yes, thanks for catching that. I'll drop it for now and rework it
next week.

-- 
Thanks,
Sasha
