Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ABDA07882
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 15:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC6A10E04C;
	Thu,  9 Jan 2025 14:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="WuemZPtz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C6F10E04C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 14:04:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1736431480; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KGT+pVEVs4jKJQOl5p3/F7gu7ZF/JVYNgrGIMEIeAaLp+YV6eU6LqWMPQIFH1rXGVBadY10xVzw4tcNF6A9OYjZNGKx83r7owDuFZHxW2UluLvo0yQRgfeCKjQwR7R7rL7pxQbsmz5ydLDOpgRPJ41H7hAHbC7IpVuJ7NSQSPrE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1736431480;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=bcqWNMUStJZ6jHPZb3MXrarOvbjtKx/W6s5RI+ES+io=; 
 b=lQmUA/c6n42ycbdr3htviEExMukcvp6BX8NdL9HaKMiwYd3Vo/BzQtW6uoy1jOOSW9Zlg2zjCkUNH5a5kVF6eR42T6i2XuVrDe1Fr42IxKfn5ZnVt75Nv1mCJn+3t42StAYJiMgUEYFI6kbpSF4pyEbPXf4sbWff3BKQM1PRLVI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736431480; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=bcqWNMUStJZ6jHPZb3MXrarOvbjtKx/W6s5RI+ES+io=;
 b=WuemZPtzzqAAT8fofaOA/nd6wACy0kowej3TLJf5vXITQyDJfulZwxV2Xwr3VwAD
 5iqYMjSmO/8RRPyenAmM1TULOwxw0vXC4QblmnEOCgc+FjQcRYV4lQstnZvB+6W4Hun
 sfmpvx26TUCYDuJDqjwHZrWK8AREvN9mK4p4JS6Y=
Received: by mx.zohomail.com with SMTPS id 1736431477342198.9363372975331;
 Thu, 9 Jan 2025 06:04:37 -0800 (PST)
Message-ID: <f545d847-404b-4eea-91b5-2a7f80156fd4@collabora.com>
Date: Thu, 9 Jan 2025 17:04:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/virtio: Set missing bo->attached flag
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Kim Dongwon <dongwon.kim@intel.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>
Cc: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20241129155357.2265357-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20241129155357.2265357-1-dmitry.osipenko@collabora.com>
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

On 11/29/24 18:53, Dmitry Osipenko wrote:
> VirtIO-GPU driver now supports detachment of shmem BOs from host, but
> doing it only for imported dma-bufs. Mark all shmem BOs as attached, not
> just dma-bufs. This is a minor correction since detachment of a non-dmabuf
> BOs not supported today.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 1 -
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 3 +++
>  2 files changed, 3 insertions(+), 1 deletion(-)

Applied to misc-next

-- 
Best regards,
Dmitry
