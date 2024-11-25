Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC019D8AFA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 18:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5313F10E054;
	Mon, 25 Nov 2024 17:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="J4yRDBFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AFE10E054
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 17:06:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732554374; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eOtpGId46INjhCm5TIeouKujWk/6SCikr2kDxLuOkd2K3hrxO9ALlOTpA1UC8GPbiUqw6J1ugGAdKpf7vtFENXd/FMTUn8/0BI4NHL2iwT5oXmnN7wAJ2lQJRMNIrNvIsPtXIYZRKl1CM/g5q5kgw/46v5FWSc+Yx5gRdqWVa/k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732554374;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vOqEGqkk7g4E4iXvh+CGhVPcKyLCYwi8c+IQDX5oV54=; 
 b=Uvp8Wq7ZBfmnUO7+SF4cbnoMBg/4ywQQyW1yNQob9l4Wc/EbM7qy9CVsyVsnWgbLh+0H7DDiyi64zIiXE4neR0aIlX0vBuI7d94baNTnm0LC2EYxYFeR+tt8T0CIG9RKXre8Y9+fSquQreIxNGIqidKufxEzajSviFhR+wqm/GU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732554374; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=vOqEGqkk7g4E4iXvh+CGhVPcKyLCYwi8c+IQDX5oV54=;
 b=J4yRDBFMydJJGEKkKn7npmtm/nQIsSRkXDLe9acP7W56XpRdVKFIVdDrEC6uBE4B
 2KbqOFQxJmK7NkEH94816kzTb/gqA5/D7e9B1whQslotGxX5STx4pqoZx4RP3zZOONm
 K2oVrOQLkx7mEOehvX4h9aHlQtyyavBsgXOZrMDo=
Received: by mx.zohomail.com with SMTPS id 1732554372359707.3003956149065;
 Mon, 25 Nov 2024 09:06:12 -0800 (PST)
Message-ID: <1ea948d4-fb67-42bb-bd58-5a97ce673fcc@collabora.com>
Date: Mon, 25 Nov 2024 20:06:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] drm/virtio: Add helpers to initialize and free the
 imported object
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20241125073313.3361612-1-vivek.kasireddy@intel.com>
 <20241125073313.3361612-4-vivek.kasireddy@intel.com>
 <9e2bd5fd-4a8c-4881-8432-435880d90a00@collabora.com>
Content-Language: en-US
In-Reply-To: <9e2bd5fd-4a8c-4881-8432-435880d90a00@collabora.com>
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

On 11/25/24 19:27, Dmitry Osipenko wrote:
> On 11/25/24 10:31, Vivek Kasireddy wrote:
>> +static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
>> +{
>> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
>> +	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
>> +	struct dma_buf_attachment *attach = obj->import_attach;
>> +
>> +	if (attach) {
>> +		virtio_gpu_detach_object_fenced(bo);
>> +
>> +		if (bo->sgt)
>> +			dma_buf_unmap_attachment(attach, bo->sgt,
>> +						 DMA_BIDIRECTIONAL);
> 
> I've caught this problem, we're not holding resv lock:
> 
> [   28.550460] WARNING: CPU: 6 PID: 759 at
> drivers/dma-buf/dma-buf.c:1228 dma_buf_unmap_attachment+0x84/0x90
> ...
> [   28.554217]  ? __warn.cold+0xb7/0x150
> [   28.554322]  ? dma_buf_unmap_attachment+0x84/0x90
> [   28.554455]  ? report_bug+0xf7/0x140
> [   28.554560]  ? handle_bug+0x4f/0x90
> [   28.554661]  ? exc_invalid_op+0x13/0x60
> [   28.554767]  ? asm_exc_invalid_op+0x16/0x20
> [   28.554885]  ? dma_buf_unmap_attachment+0x84/0x90
> [   28.555018]  ? dma_buf_unmap_attachment+0x80/0x90
> [   28.555160]  virtgpu_dma_buf_free_obj+0x3b/0x80
> [   28.555294]  drm_gem_object_release_handle+0x4d/0x60
> [   28.555435]  ? drm_gem_object_handle_put_unlocked+0xe0/0xe0
> [   28.555587]  idr_for_each+0x4b/0xb0
> [   28.555691]  drm_gem_release+0x1f/0x30
> [   28.555798]  drm_file_free+0x202/0x290
> [   28.555905]  drm_release+0x5f/0xc0
> [   28.556001]  __fput+0xf9/0x2b0
> [   28.556093]  task_work_run+0x55/0x90
> [   28.556219]  do_exit+0x313/0xaa0
> [   28.556315]  ? lock_release+0xb6/0x260
> [   28.556423]  do_group_exit+0x32/0xa0
> [   28.556525]  __x64_sys_exit_group+0x14/0x20
> [   28.556645]  x64_sys_call+0x714/0x720
> [   28.556751]  do_syscall_64+0x54/0xf0
> [   28.556854]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
> 
> both virtio_gpu_detach_object_fenced() and dma_buf_unmap_attachment()
> need to be called under resv lock.
> 
> Won't hurt adding dma_resv_assert_held() to
> virtio_gpu_detach_object_fenced().
> 

On the other hand, nobody uses BO when it's freed, hence locking
virtio_gpu_detach_object_fenced() not needed. Should be enough to use
dma_buf_unmap_attachment_unlocked() then.

-- 
Best regards,
Dmitry
