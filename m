Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEBE9D79F9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 03:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F13010E380;
	Mon, 25 Nov 2024 02:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="bVCJYqoS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E87B10E380
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 02:08:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732500497; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hpbux2RkgfClTwyCOtwHk/Wu689i7eLdznzzr4yHgHEmJ3SpB4ZJvthO8/LxmvOn9G5rCivqwbVfJvAq39z1nl7Eivnf9gOsu3dXi5kpFeVKw4PVHtzoxehNOPtYqzSdB/zgjB6PibaxwDh+smlpFp8dYCxFIf3Ydpo5C4qoM/0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732500497;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=104qiT3WFrSKRfxEHbe+rOLFsbA3HOp+bFqQcja6SwI=; 
 b=K1np8e8c5Y3P9g7T/V3Lfx9vTuZFSf7r6chXRUhyGh2pGrYpBMdQt61abR6G14ZDrKYNd5H8MBtnz1X38e6VxzSk3fRxIotP5YZvHiZU9ZZq0goxVhOR7TavQJdNGfQ/6SHjYKATQ958Npqh5sNRF3lwPvheODe3oJRneVPgmCY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732500497; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=104qiT3WFrSKRfxEHbe+rOLFsbA3HOp+bFqQcja6SwI=;
 b=bVCJYqoSxAIiv2tM8LXvFuhS1xZJWXC6b1kEz24J8IWMd5iZvRly8voOKIxmUWk0
 ohjZGhU79My9B8I4O6VG9JWD0wYdg1ugmBtb1sIOAeuYkUSioW6j/rQY9JkWHgZ5FJw
 t4lt7oL8i8LGSxojfbiBog4mdbwgWSRWThVGNUOo=
Received: by mx.zohomail.com with SMTPS id 1732500496022957.8799877353773;
 Sun, 24 Nov 2024 18:08:16 -0800 (PST)
Message-ID: <89a0eb5c-341d-4099-9adb-6f7cfb9438b3@collabora.com>
Date: Mon, 25 Nov 2024 05:08:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/virtio: Import prime buffers from other
 devices as guest blobs
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20241119060248.3312553-1-vivek.kasireddy@intel.com>
 <20241119060248.3312553-5-vivek.kasireddy@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20241119060248.3312553-5-vivek.kasireddy@intel.com>
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

On 11/19/24 08:59, Vivek Kasireddy wrote:
>  struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
> @@ -281,3 +335,4 @@ struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
>  {
>  	return ERR_PTR(-ENODEV);
>  }
> +

Nit: superfluous extra newline


-- 
Best regards,
Dmitry
