Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6DC9D2314
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 11:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB09310E607;
	Tue, 19 Nov 2024 10:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="NB5vTJCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8E710E607
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 10:10:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732011022; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QgPah7K7zl9Ui+n9l4278FXGNH/QF3ZF4pW4d90gxh1p5OsYYTIzM9eCgpdweH70zXRxGIC2lqWObcvkLpAvIsT6MioIY28rWR6p5CxmOzq56ajXlbIA90MLntkUY0T/M9stUHe/wHOk8M/gmopXjznav6U8nG4XBmtrcWy2XIU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732011022;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=k+g8j3F1tme4NsTxUII9r7aUoMjsICad4Xf/8UTilxg=; 
 b=NaaN0M9K4boonOB0pNZ1nDCIi99WnKkRlxlSwwPaBcTv3xR7Ubw/zdA+nolRspTnFpEt/mIUqAPoIYkx0MxTTMQLZVwVqkK9VCzunGRBU1I716EdCn3e5XatmH8GY5yb+7Msvf1NJJsAAEXbpf5CFszbznsJAtNau/Iw/H7HY5c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732011022; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=k+g8j3F1tme4NsTxUII9r7aUoMjsICad4Xf/8UTilxg=;
 b=NB5vTJCjNICX6Zr6b+KJwtUDlxov3AJDecviu21IuVOGxyf/Sj0CE64/THkPorjW
 IOmN4nUGZuz7m1BIDpgbtbgaeJYhb+2w6ka9sTpS2K+GpaMJE43SGUB5TVOMgLmtcOS
 nDQ14sU4m3PaZMh4NiHp8WaikVJnAbh2pIG9OaD0=
Received: by mx.zohomail.com with SMTPS id 1732011019170470.81764662086744;
 Tue, 19 Nov 2024 02:10:19 -0800 (PST)
Message-ID: <b3ac96de-8782-409b-8652-3415fa4c9f38@collabora.com>
Date: Tue, 19 Nov 2024 13:10:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/virtio: Don't create a context with default param
 if context_init is supported
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20241020224725.179937-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20241020224725.179937-1-dmitry.osipenko@collabora.com>
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

On 10/21/24 01:47, Dmitry Osipenko wrote:
> From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> 
> Xorg context creation fails for native contexts that use
> VIRTGPU_CONTEXT_INIT because context is already initialized implicitly
> when dumb buffer is created. Fix it by not creating default vrend context
> if context_init is supported.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_gem.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Applied to misc-next

-- 
Best regards,
Dmitry

