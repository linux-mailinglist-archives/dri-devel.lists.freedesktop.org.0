Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F932ADA03F
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 00:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C69110E04E;
	Sat, 14 Jun 2025 22:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="V2O/wL6s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB0F10E04E
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 22:26:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749939989; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=D1LZURzkb6q0S9Bue0AAKESyTSrlW9cdo3+6b9cs6MLs1FaTsfbjQHwJVpu7IM/pJ2m3oGmQhvEvVHL1mmKhLSzOa6Zjx8E7vs4j9bbA7Mu7O8/6nbkM7sYuRdvDiBbbUntFyVGMVq1Fhh8eV2ds8LuKOwsOIl+V0lJBrmPhJJk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749939989;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=pwFnZGJTNZjT1OpNK2KnMMF5RUAHZRKOkFer0VB+0Lk=; 
 b=D+z7v6/eeRl5wCOp2VCqxk88xV3DQEK9Pz0PIm+sxkMD6Uwy7K8raFLI8jmwB8LAtKm3HkNfNj3RpuT5aw8lCYUPEpgTprMfQ212e3UYGVKJ655XxQKlVucCNK/rFlqtgT5qkf0W0W3+bbkt8Ae8c0Ai/Dzd3b9/IB9UL2c0fVw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749939989; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=pwFnZGJTNZjT1OpNK2KnMMF5RUAHZRKOkFer0VB+0Lk=;
 b=V2O/wL6snBIc4ilrqzx7PIIGS0vEZMB54u+PZpXmqahL80+On+lRChhReMICCNUY
 JLIcuZOkGGuV9e8YST9qkxIOYNP2nn+HJsKOwjvzsOE3CZHAM6daZH1lAnSXPKJfabc
 6kZaje63hKRpK5raBzUxrd3n9FMfRXoX4+Xt/m7A=
Received: by mx.zohomail.com with SMTPS id 1749939987753441.0436665438757;
 Sat, 14 Jun 2025 15:26:27 -0700 (PDT)
Message-ID: <23e2560e-276f-42d3-a525-0c0405c8641c@collabora.com>
Date: Sun, 15 Jun 2025 01:26:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/2] Virtio-GPU suspend and resume
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
References: <20250523220015.994716-1-dongwon.kim@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20250523220015.994716-1-dongwon.kim@intel.com>
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

Hi,

On 5/24/25 01:00, dongwon.kim@intel.com wrote:
> From: Dongwon Kim <dongwon.kim@intel.com>
> 
> This patch series introduces a freeze and restore mechanism for
> the virtio-gpu driver:
> 
> First patch adds `virtgpu_freeze` and `virtgpu_restore` functions.
> These functions handle the deletion of virtio queues before suspension and
> their recreation during the restoration process.
> 
> Second patch implements a mechanism for restoring `virtio_gpu_object` instances.
> This is necessary because the host (QEMU) deletes all associated resources during
> the virtio-gpu reset, which occurs as part of the restoration process.
> 
> These changes ensure that the virtio-gpu driver can properly handle suspend and
> resume scenarios without resource loss.
> 
> Dongwon Kim (2):
>   drm/virtio: Freeze and restore hooks to support suspend and resume
>   drm/virtio: Implement save and restore for virtio_gpu_objects
> 
>  drivers/gpu/drm/virtio/virtgpu_drv.c    | 65 +++++++++++++++++++++-
>  drivers/gpu/drm/virtio/virtgpu_drv.h    | 11 ++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c    | 24 ++++++---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 72 +++++++++++++++++++++++++
>  4 files changed, 165 insertions(+), 7 deletions(-)

Tested the patches, applied to v6.15.2. Suspend-resume works with v2,
display works on resume.

Have you figured out why 10ms workaround is needed?

-- 
Best regards,
Dmitry
