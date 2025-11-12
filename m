Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FC8C51D23
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 12:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D0310E08E;
	Wed, 12 Nov 2025 11:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="PBAM4iJP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293E710E08E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 11:03:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1762945392; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HL2OMW3J6pZTesujcjaWAwX1PbhlhUwiHf8KB+JcopzYLKER9iwKBzhNDh14Mvweg6nagQIFnkIu2Ko6NrgxvbaDltWe6wC0NmVtFgmDZPneylHyfCK3Upj6RBhYzqHjmXq1/QPAByCKb/SomS4Kh/yoPR7iLjb3q30qCvynGVQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1762945392;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=qQ+7fL9JyrI59uCS4sJTmBWIJAgukWX92498v72fvjI=; 
 b=FqHU0zAbitKxZl+bHHd0JF4p4BXKe4mTo9qRkbTwyFim8ghd3IFBuOJ0O+5Dejmq3cMGCj3q0iANBe3rKE8LHqrGdYzpWKfpwMYbD7aFgzYa+ap7thupXh1jeLnB3DsXyVSeoG4gjHEpiVjNhPKIqxqJ0X+jkxiKQuGXLgEDH4E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762945392; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=qQ+7fL9JyrI59uCS4sJTmBWIJAgukWX92498v72fvjI=;
 b=PBAM4iJPPBY2IasZoRmIzVZbOImFGYeX3UqqNxytep68zz6YVY2sjaDpZTjyRUN3
 blg6IDLdEiIRC87EcdUv/Ohq/DH/lyyommO7pK4qEGGx6iG1L71Ed9Yv+RC2Uudr6Tp
 qY32iFCVGS09l3Zrs5xfmB2Y3SM2zrDwNMrydxmY=
Received: by mx.zohomail.com with SMTPS id 1762945389615395.46636171307784;
 Wed, 12 Nov 2025 03:03:09 -0800 (PST)
Message-ID: <80e30da1-1a66-47ba-a773-ea4e3ea94740@collabora.com>
Date: Wed, 12 Nov 2025 14:03:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
Cc: airlied@redhat.com, kraxel@redhat.com, nirmoyd@nvidia.com
References: <20251027205323.491349-1-dongwon.kim@intel.com>
 <20251027205323.491349-3-dongwon.kim@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20251027205323.491349-3-dongwon.kim@intel.com>
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

On 10/27/25 23:53, dongwon.kim@intel.com wrote:
> +	/* store the dmabuf imported object with its params to
> +	 * the restore list
> +	 */
> +	memcpy(&bo->params, &params, sizeof(params));

Nit: using memcpy is unnecessary for structs, "bo->params = params"
would look cleaner

-- 
Best regards,
Dmitry
