Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E8A8B079
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 08:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECA010E221;
	Wed, 16 Apr 2025 06:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="WxL/T7L3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3CF10E221
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 06:39:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744785585; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bt2CWvj64KWcWSE++d+xgGjEUvh0qiR5be8lRv3/tEblZZJhMz+JQnH4ptcSUMG7EHtsLeXPoObAG7Krdd3iSGkNBPfDqYmj9kufkgrnPcydcWDovKlPL7/kYur6xAkGzIQBG6Au1SJkE9cvueBXqgpzrKyuWwxs6MmTCK439Zs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744785585;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=U5r6UGX9U8OpHABbRYUo1I7CyHAcCaMHqioe6LVZ+R8=; 
 b=HKa+pQ3IJqxg4NCzNrt7wC4kl0LsR303wQ1ummMbQyJ4y/nSDccWTX/dnxcC5v0MEWLnu/5pXZPtRzlelrhOHy2lE91qVI/Q8Xrqem3Tbw+asdks23IfevthdFnnJptFgudG2dv0ckXUTc8EC774TiWY/U0rI/goRXOHVao0l7A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744785585; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=U5r6UGX9U8OpHABbRYUo1I7CyHAcCaMHqioe6LVZ+R8=;
 b=WxL/T7L3lMN5IDjN6cYpX92CH3wrrdfwR+x13V5DppV7gZ0GaQf/KDdMdMvnNpx7
 QGsroN0Ceh/H7iPEZfvVByFp9ogFCFL4S2nWzhBEvN7gkGTk8meutwkuVpb4VwDQbCS
 7HwmxnvqWWWF5mgCL3ApaRbjVg2+Bexneo7xLHFY=
Received: by mx.zohomail.com with SMTPS id 1744785582031375.09536033309575;
 Tue, 15 Apr 2025 23:39:42 -0700 (PDT)
Message-ID: <2bf23739-c2cf-492e-86ec-f3e56321192b@collabora.com>
Date: Wed, 16 Apr 2025 09:39:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/virtio: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
References: <20250414131507.566072-1-tzimmermann@suse.de>
 <20250414131507.566072-2-tzimmermann@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250414131507.566072-2-tzimmermann@suse.de>
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

On 4/14/25 16:12, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The helper tests the dma_buf
> itself while import_attach is just an artifact of the import. Prepares
> to make import_attach optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 8 ++++----
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
