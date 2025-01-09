Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C45EA07861
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 15:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17F110EDE9;
	Thu,  9 Jan 2025 14:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="FE8ciWQA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD4210EDE9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 14:01:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1736431260; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FDODwzPOR01R8oHl92Qo5+gNl+cJa/rA3PIjakLjxVD8Wz+F/7oaLcp+VrOHuaSLZE43MPDjktOCOLUmO6YETxMMlcN0eowRai1gX3V1+lRO24NRqoq8bGhJN0TlG+plk0y4elROu2PoRsSravXxXkhZ4KkseJQCZLPHhuV3lR0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1736431260;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0d2bJVsinDjIzXhfiYVQja03rVshWPufq+iadEJnZvY=; 
 b=Z5jygFH4i3cMEbZZrfwhO3dIfuRDRzJiQIxLMZjnIWU3HbHAZfdMyjJjOoGda6Wgu5CW1HAmwKv/obo0BX3s3ofq0YM3EHfd1Ey7D4+Lys14X/TCBPXhADlKeFyrR2reEwIRYY3fbOAM38KZIvIICOfoT0Temz/pLMLXprhbbQ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736431260; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=0d2bJVsinDjIzXhfiYVQja03rVshWPufq+iadEJnZvY=;
 b=FE8ciWQA7q3gMD8YNdvkoANb6brihJUphDiKWGY23V6IL4tdghXrhUMuNdRKL0he
 eyjn1ZQa5i9zdykIjQk64Or1g/3K1Adi/SHfVOu/YhN5/3ww4OOuVCtaI8uPJP/uzsB
 3bdgE0XHqsmM8CWKl16zjVCLuWF0hwfkt8CQsnQs=
Received: by mx.zohomail.com with SMTPS id 1736431257325677.1193258433084;
 Thu, 9 Jan 2025 06:00:57 -0800 (PST)
Message-ID: <098907a3-5bf8-4c0d-a514-3a7a77d791b1@collabora.com>
Date: Thu, 9 Jan 2025 17:00:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Fix Smatch tool warnings in
 virtgpu_dma_buf_free_obj()
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>
References: <20241212055421.775759-1-vivek.kasireddy@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20241212055421.775759-1-vivek.kasireddy@intel.com>
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

On 12/12/24 08:54, Vivek Kasireddy wrote:
> Fix the following issues identified by Smatch static checker:
> - The call to dma_buf_put(attach->dmabuf) after dma_buf_detach()
>   leads to a UAF bug as dma_buf_detach() frees the attach object.
>   Fix this by extracting the dmabuf object from attach and using
>   that in the call to dma_buf_put().
> 
> - The resv object is extracted from attach before checking to see
>   if attach is valid (that is !NULL) or not. Although, attach would
>   very likely be valid, fix this by making sure that the resv object
>   is used only after ensuring that attach is valid.
> 
> Fixes: 2885e575abc7 ("drm/virtio: Add helpers to initialize and free the imported object")
> Fixes: ca77f27a2665 ("drm/virtio: Import prime buffers from other devices as guest blobs")
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Applied to misc-next with edited commit title, thanks!

P.S.: This patch may also be needed applied to next-fixes, but that
branch is locked at the moment. I'll keep an eye on whether patch will
be missed in 6.14-rc1 and I'll need to re-add it to the -fixes.

-- 
Best regards,
Dmitry
