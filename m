Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1CBA87DB9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 12:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2B810E54B;
	Mon, 14 Apr 2025 10:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="di8kxo1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F9810E54B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 10:32:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744626744; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=R9oRGIKNkYU6EiiFpKAm8qCHbPJEfMgEutjfYqP29IMxrQ96FyziWesR5nPSMG1sFAoj523nmL6787NHGE46UP7BW9ZAieg/e6n5m7gVWvNGfN5TwbcL6YdbiX59dZVyDi2VsW6vojLXt3PrZJPnmODDTfII7Jp4CaFteyWdB1I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744626744;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=3R3SboKCmglqPlGDkIEnW9WjUC0kuL0/IVs9qW/9QwU=; 
 b=MXZdolQ7QDvdraRqCKrEclvjfimNXksGL+yh0lagnvgGHRaucsXRaVOopUrUWkbMriwpIzN8fze17r3Md5KG4YAnxLyEkh6xnZZ1vIwyiH6zU5JGa7y5K1hRxjiRXdVzsioNkw5jorvU9Uf/L5OHuS64Ny4UzeeRNnSGsOiJA1o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744626744; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=3R3SboKCmglqPlGDkIEnW9WjUC0kuL0/IVs9qW/9QwU=;
 b=di8kxo1/f8XJ+HGYVjdMsmV3mV9jr+yV4Q8coTF+TS8g67kkzB1C8z6+3GEXnhoX
 4qd5eGx+3K4gMQbN6Qes+axczNr9gGp7SelaEy13PWM8xognqrf8ToNTrPBfSSKRr9F
 lRXTxV4YZqasP2jlFJZUiB2d/M5xBlywrcqZGU+A=
Received: by mx.zohomail.com with SMTPS id 1744626741951935.5539872103354;
 Mon, 14 Apr 2025 03:32:21 -0700 (PDT)
Message-ID: <2995a061-7a0c-4dce-9a19-54ef224dd3d1@collabora.com>
Date: Mon, 14 Apr 2025 13:32:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/gem-vram: Do not set pin and unpin callbacks
To: Thomas Zimmermann <tzimmermann@suse.de>, boris.brezillon@collabora.com,
 airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20250404132907.225803-1-tzimmermann@suse.de>
 <20250404132907.225803-3-tzimmermann@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250404132907.225803-3-tzimmermann@suse.de>
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

On 4/4/25 16:23, Thomas Zimmermann wrote:
> Gem-vram helpers do not support PRIME dma-buf sharing. No nothing
> will ever call pin/unpin on its buffer objects. Do not set these
> callbacks in struct drm_gem_object_funcs.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
