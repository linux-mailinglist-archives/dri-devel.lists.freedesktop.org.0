Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B56988F30
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 14:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AEE10E0BA;
	Sat, 28 Sep 2024 12:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Q1JEH8b1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E0410E0BA;
 Sat, 28 Sep 2024 12:31:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727526705; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GmxZHlt55k7LoEZy1B3Tw16YDOsmtaZUbuvY9+1ER3UcwH+Tm+vr/CvvF5XthJe8TYuJ7wqvpVX4wy+0WsvPUpjtR6jAjzpR0TmbVW19EVaUL+GNLb6BHsN7XFMGwoYU1dHgnFjJM/Rm4u/sgJqHHCDvQh9FkYuHrfN1b6GN+Tk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1727526705;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=AIF2rpvHtLSJT+PXSyaWvv7N5A6v74RX+1DBW/+9kF4=; 
 b=M+9gVurtqs/YJ67GM281oIDk92U4GQekqdpiJD9SgZH4Td7VxaFXtcPzTxOJ8RhjMYaHn5+z1CuG4fEENUtVZLSF0YlCa69g2m3Q+ntSAz2mH9KDWo7KTLsTbuW4rKtLCjE+hoOxavBkYqsVEaf5kjDIdrNJsGTS9N4d/rvCyCI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727526705; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=AIF2rpvHtLSJT+PXSyaWvv7N5A6v74RX+1DBW/+9kF4=;
 b=Q1JEH8b1rA8e1iGrcV2UxqzbWAZQTuAlAGf+IZjm3v5kDtPteZCSKAkOuwRPkaYr
 DXpPii45DBGNstTiQMBVYmPHwupLlI3FWNIhh187qaztaKKuf5t5yEOGIkxCDBZdCc2
 EqZHcB+dyGZA9ruZnG1MbcehfVY+wwcMXt4ofdRo=
Received: by mx.zohomail.com with SMTPS id 1727526704305381.0470614329065;
 Sat, 28 Sep 2024 05:31:44 -0700 (PDT)
Message-ID: <041ff620-717c-4c6c-942d-a5bd80d82ac7@collabora.com>
Date: Sat, 28 Sep 2024 15:31:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] drm: add DRM_SET_CLIENT_NAME ioctl
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
 <20240927084848.263718-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240927084848.263718-2-pierre-eric.pelloux-prayer@amd.com>
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

On 9/27/24 11:48, Pierre-Eric Pelloux-Prayer wrote:
> Giving the opportunity to userspace to associate a free-form
> name with a drm_file struct is helpful for tracking and debugging.
> 
> This is similar to the existing DMA_BUF_SET_NAME ioctl.
> 
> Access to client_name is protected by a mutex, and the 'clients' debugfs
> file has been updated to print it.
> 
> Userspace MR to use this ioctl:
>    https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1428
> 
> If the string passed by userspace contains chars that would mess up output
> when it's going to be printed (in dmesg, fdinfo, etc), -EINVAL is returned.
> 
> A 0-length string is a valid use, and clears the existing name.
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 14 ++++++---
>  drivers/gpu/drm/drm_file.c    |  5 ++++
>  drivers/gpu/drm/drm_ioctl.c   | 55 +++++++++++++++++++++++++++++++++++
>  include/drm/drm_file.h        |  9 ++++++
>  include/uapi/drm/drm.h        | 17 +++++++++++
>  5 files changed, 96 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

