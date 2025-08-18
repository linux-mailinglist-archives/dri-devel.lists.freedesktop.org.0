Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E813FB29F63
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 12:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5718610E1D0;
	Mon, 18 Aug 2025 10:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="QJp2CnbI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F3110E1D0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 10:46:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755513981; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PlznDCCrOlM59ksPQyKCE9h0d+dO2h+b1h4VFT9ZYheRIN+IY6yFNtqS8OWPr+h0LBszhzCCFVib8sJpcwRd+l5iuMLTWy0tB7Tztl8nNA0oapHPJkD7LtWlqYSGUGbEqze7CkoXmzpdkNDVYtGMBcMxvc78cHpy2T6UDMLeNx4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755513981;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=WHp4XJVWTvvmWcmkaQmduWnck0pIloPgQPEiSVQzdBk=; 
 b=SiZyZ19q28va3f4VqkqOBDoraxl26yYlTEGhJPZSVvbFsrHR/6nx6EbATnY/RyOMOBsFGSPXA67O2nDMzT1u2M275w6AQcvT1qvbZdMIT8FJEc/ZrHPTteLMxG1xR2YDLTdaXUVuvSS1HLwKnq8WvVi+uc0Wklx5rJepenBHn30=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755513981; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=WHp4XJVWTvvmWcmkaQmduWnck0pIloPgQPEiSVQzdBk=;
 b=QJp2CnbI7SwIJAc65GAmBXfw5fJrlxZJYn3qpTKlQwrsGZ+hwqTdSYSL+Q+Dcqns
 8+t6vHnKHROSqhUDoea+o91nF/982osi5GafrV3mIQvELjxgCnA/udCZg1ZN6ro1HEo
 cb6wEfBS1+wiDvcdFb1IOkIYwaJzs5qppwYJ1x0s=
Received: by mx.zohomail.com with SMTPS id 175551397875259.006396646258395;
 Mon, 18 Aug 2025 03:46:18 -0700 (PDT)
Message-ID: <26f31ab8-1b9f-466e-aa9e-2b76bec7a364@collabora.com>
Date: Mon, 18 Aug 2025 12:46:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm: vc4: Add support for additional 10/12/16bit
 YUV plane formats
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250807-drm-vc4-extra-formats-v2-0-fadc93844551@raspberrypi.com>
Content-Language: en-US, de-DE
From: Robert Mader <robert.mader@collabora.com>
In-Reply-To: <20250807-drm-vc4-extra-formats-v2-0-fadc93844551@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 07.08.25 15:28, Dave Stevenson wrote:
> We'd been asked if the S01x YUV formats could be supported on Pi5 as some
> software codecs produce them.
> The answer was yes, so this patch adds them and the P01x formats.

I tested this with the Gstreamer MR from 1 and can confirm that the 
formats P010, P012, P016, S010 and S012 work as expected.

Unfortunately S016 is not supported by Gstreamer yet - however chances 
seem high that it works as well.

Thus the series is:

Tested-by: Robert Mader <robert.mader@collabora.com>

1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8540

>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> Changes in v2:
> - Swapped from adding an extra bool hvs6_only to having a min_gen for
>    each format (suggested by Maíra)
> - Link to v1: https://lore.kernel.org/r/20250724-drm-vc4-extra-formats-v1-1-67fa80597fad@raspberrypi.com
>
> ---
> Dave Stevenson (2):
>        drm/vc4: plane: Flag formats as having a minimum generation
>        drm/vc4: plane: Add support for P01[026] and S01[026] formats
>
>   drivers/gpu/drm/vc4/vc4_plane.c | 56 +++++++++++++++++++++++++++++++++++------
>   drivers/gpu/drm/vc4/vc4_regs.h  |  9 +++++++
>   2 files changed, 58 insertions(+), 7 deletions(-)
> ---
> base-commit: d2b48f2b30f25997a1ae1ad0cefac68c25f8c330
> change-id: 20250724-drm-vc4-extra-formats-1f53e6491cc1
>
> Best regards,

-- 
Robert Mader
Consultant Software Developer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

