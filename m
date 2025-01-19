Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DB8A161A1
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2025 13:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EC910E0B5;
	Sun, 19 Jan 2025 12:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="fyhSFS/T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0438A10E0B5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2025 12:31:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1737289875; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gev1gz5PmspMEAdGEPRzq2P40zscVCMhyop7btfAC7gEAHV1PiBBl2fMoVBqt4ksPepO7JPpr6dsZ/kGUFkwYmhy5SK9+WMru7ttfgpX/922+cQIg/qM2a9iehfnFSvfgd2MXrx8iRRAivDjbrdVko3+DVuGfkJBc7TyUI/FUZY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1737289875;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9a6ZqbsnQj4KjRT6USDlwgoyt0sTTegmko0sC8QZYNU=; 
 b=AoU1yziWuktsK8zphyO1PxNiDl1Kd8PUm2Dk6D/YJjgaYSP7SlL9k0dEt44QmpyUd1fARzrPYPMrqr6okodgMC2qiUUYFOfPApBgTElXlrtgTgHmnNMSq7Uyidw/jOcLqXmgKR9ojBzo1qmNdT1m56TFX+EghIRQgH4G+TnvrnQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737289875; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=9a6ZqbsnQj4KjRT6USDlwgoyt0sTTegmko0sC8QZYNU=;
 b=fyhSFS/TPaheooQMANFPjSNwcOZSECxX2Hz695azrE2vpAYKFMHruU/zjQoR/OjP
 6FpqphFhzr8r07+hzHhtONK+iO83GtoOTLeV3HkxhfhW4yVjEDrHAKd0LXAckks1ERU
 J2rj91cH7QLboWJ0j1oOnJxQh/QQwLO0E6Bv9AHc=
Received: by mx.zohomail.com with SMTPS id 1737289873704115.23023763006847;
 Sun, 19 Jan 2025 04:31:13 -0800 (PST)
Message-ID: <8e0149b6-3177-4101-a23e-dec3f1c41a24@collabora.com>
Date: Sun, 19 Jan 2025 15:31:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Don't return error if virtio-gpu PCI dev is
 not found
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20250114075759.2616551-1-vivek.kasireddy@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250114075759.2616551-1-vivek.kasireddy@intel.com>
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

On 1/14/25 10:57, Vivek Kasireddy wrote:
> While fixing a shared VGA resource ownership issue, commit 5dd8b536bb
> ("drm/virtio: Lock the VGA resources during initialization") wrongly
> assumed that there is always a PCI device associated with virtio-gpu
> and it would return error if this device is not found during init.
> 
> This is incorrect, as virtio-gpu can be operated in MMIO mode (M68K)
> where a PCI device would probably not be created for it. Therefore,
> fix this issue by not erroring out if the associated PCI device is
> not found during initialization.
> 
> Fixes: 5dd8b536bb ("drm/virtio: Lock the VGA resources during initialization")
> Suggested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)

Applied to misc-next, thanks!

-- 
Best regards,
Dmitry
