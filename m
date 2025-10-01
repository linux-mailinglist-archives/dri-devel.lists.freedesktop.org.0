Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9280BB0B18
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 16:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CE710E239;
	Wed,  1 Oct 2025 14:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="eCcD+iXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7685D10E239
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 14:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759328700; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Rv2cNhOCuaqDc1QDy08AbOMwZWPuQmSbN6Rbdmye0tT3vqYXyuvYnB5a5sugOlo44qhpugaqA4W2vktVNoCETzF7QUnaU7M8e0xUHx6E/bfYOy8IoVLk2B7SWUt5QD7yUs66ZeJjOhkj6qz309ibEFU36Vxw6hd1z14/I5Bw7mM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759328700;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=XNf7OAJAD3ABFMwrDHm7YHw5GpjfHo5AGxjnFKrFezg=; 
 b=PfcpDSQIRF6dEhbq2fyP545/VTDiZC7i98X3VoaDyPweO94stD6RoV/ObNHOk0u1ulRG9+o3njjRMHvWQXLjpmsUb6HMgweAJ8aUHcmQVmC06RVR7PiFIpUDP8+6ftfgHZjZlwSbldLPGoSWkqgsHOB+E/5eH0CQ6idJz6F6hDU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759328699; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=XNf7OAJAD3ABFMwrDHm7YHw5GpjfHo5AGxjnFKrFezg=;
 b=eCcD+iXMj8Wtw6K4KAVqrS3yVucCZaEB78ogvKI70y1XhMJq639P1hev7MUfhTiZ
 SXBxsghfZZufpAZMoqxArvXP2Hv1+GWp6ZG15ZCYCREs6yJagQZ4fvFqQXAAJytwWQu
 c77VVohUyGiV6/I5EQlqLxkErgSL37RWcw3tY+iQ=
Received: by mx.zohomail.com with SMTPS id 1759328697415464.29970337418104;
 Wed, 1 Oct 2025 07:24:57 -0700 (PDT)
Message-ID: <31aec005-6fc8-4f16-abe2-b4cf23a684ec@collabora.com>
Date: Wed, 1 Oct 2025 17:24:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
To: Nirmoy Das <nirmoyd@nvidia.com>, dongwon.kim@intel.com,
 dri-devel@lists.freedesktop.org
References: <20250924194755.1265531-1-dongwon.kim@intel.com>
 <20250924194755.1265531-3-dongwon.kim@intel.com>
 <abcef795-4c39-4334-9ae2-91e6fb3b11d1@nvidia.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <abcef795-4c39-4334-9ae2-91e6fb3b11d1@nvidia.com>
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

On 10/1/25 16:13, Nirmoy Das wrote:
...
>>   struct virtio_gpu_vbuffer;
>>   struct virtio_gpu_device;
>>   @@ -265,6 +271,7 @@ struct virtio_gpu_device {
>>       struct work_struct obj_free_work;
>>       spinlock_t obj_free_lock;
>>       struct list_head obj_free_list;
>> +    struct list_head obj_restore;
> 
> I am not very familiar with the code but I am curious do we not a lock
> to keep the list same?

There should be a lock to protect list

...
>>   void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
>>   {
>>       struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
>> @@ -84,6 +116,7 @@ void virtio_gpu_cleanup_object(struct
>> virtio_gpu_object *bo)
>>           drm_gem_object_release(&bo->base.base);
>>           kfree(bo);
>>       }
>> +    virtio_gpu_object_del_restore_list(vgdev, bo);
> 
> Is there a possibility to hitting use after free here ?  I see kfree(bo)
> before this.

It's UAF bug here. Thanks for the review.

-- 
Best regards,
Dmitry
