Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C248A07884
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 15:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA08010E080;
	Thu,  9 Jan 2025 14:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="RPDyYgWF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3137E10E080
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 14:05:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1736431496; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=U3Ow3LFaJH/sbNtN6KkZ4AyMXbWtrHLKpjVzAnC46PMFz94gEJvOWoRhIFnpjLqQ8QQbYIepVA/re1OGytiXSsUTi+1UT3qx0hKx/tEqU9Ot2gJdBzFTejb+uRjdeHwm6Yvpy/H8H7YSvl6n4AZ1b+hIm0A/FMziA0oniOhSgw0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1736431496;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=F9mFngC+DCR+DBz+4XxB0JwQ/lImo2qdcTd+mjD3q4w=; 
 b=TGGlzUmVMOeqF67RtMguueqt090oayv2nBv+Lz447ZkZhucKjxrelKqMMDRk9D/0R3JQKbZH/0FZvDWqnWrWjGd7qxt69oDq0o3moGCBefi1xuBV0qpj68iHse+SLfQRZ8IUlyB5gL6pHaLp4VDcX3lUvlWOExhBU5CkY7YTpB0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736431496; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=F9mFngC+DCR+DBz+4XxB0JwQ/lImo2qdcTd+mjD3q4w=;
 b=RPDyYgWFEfWqoCiL5sfiDzfhwi4Ks10esGFDv2cKapjK6EXFqu+tuHGMCBbfPFsE
 nLBKOnoRFQzDLQSNIYsaQ34x6G8/jIpXQHi/bSGvW+F3GNgYrmeEB5yXlGw8udEtmdX
 ox//GCIZtHTYeVYBZMUIhtc056k/HJmdNoDfZlJo=
Received: by mx.zohomail.com with SMTPS id 17364314932331023.2938194147448;
 Thu, 9 Jan 2025 06:04:53 -0800 (PST)
Message-ID: <2e4851e1-976d-4eb3-9171-3f77aff93979@collabora.com>
Date: Thu, 9 Jan 2025 17:04:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/virtio: Factor out common dmabuf unmapping code
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Kim Dongwon <dongwon.kim@intel.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>
Cc: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20241202053955.2451321-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202053955.2451321-1-dmitry.osipenko@collabora.com>
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

On 12/2/24 08:39, Dmitry Osipenko wrote:
> Move out dmabuf detachment and unmapping into separate function. This
> removes duplicated code and there is no need to check the GEM's kref now,
> since both bo->attached and bo->sgt are unset under held reservation lock.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 35 ++++++++++++++------------
>  1 file changed, 19 insertions(+), 16 deletions(-)

Made a minor rebase on top of the recent UAF fix and applied to misc-next.

-- 
Best regards,
Dmitry
