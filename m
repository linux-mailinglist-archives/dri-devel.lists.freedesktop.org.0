Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06AD9D79F7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 03:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA8F10E37D;
	Mon, 25 Nov 2024 02:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="OL0NxSR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7966510E37D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 02:08:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732500481; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PlJrcSF8k6fT8zvPRgm4XLRvCW0PBPO46cNTcSLt4ypYHSgrq99FijZ+KI6ArHV7svIIz4MTlCw+22YY/y39+ytxShWyvfOWIxGH82XmDhA4yaUKCCXVzX5y44G5cQyIPM6rE8/6iv/nflVAoRUD503NMGgQyIBocK3EXnJkOrQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732500481;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=CJK3wIeZu63wDw2RMahrFHD02TTMoqbjQb+a8C51wA0=; 
 b=n8urYU5X61qTYZwUfxNDpWK47ObXjuHMfkAKp38chauRgsFnnh8m/Bv9mIcm1WzGHgK5OJEy8/1udlpdqnBZ+DtKH4Cqo+cAHFeFtnPBgeFOYlhAfhmnY3UCZdSXvezHXVpkwt8k3p6LmMD0QC7hGPcOIv7PwBDnnzMwzu+KEqU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732500481; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=CJK3wIeZu63wDw2RMahrFHD02TTMoqbjQb+a8C51wA0=;
 b=OL0NxSR6yOyq3Whq75y8ypVih7RJDnciSSzc3YTohCqjF1Ry3ARBgDj/lAIYU5Cf
 /CDpbI7j5vsD96yAl7HrYvyCoYfk6hpBefNqOzbeGOGzYFdsBFYSau6xqHKJBudENfq
 Zy6njGduSSd+qPBXthtDqeBGxQCpcgo3YyyEhzjk=
Received: by mx.zohomail.com with SMTPS id 1732500478818668.7913579944168;
 Sun, 24 Nov 2024 18:07:58 -0800 (PST)
Message-ID: <5ced9a2c-3ac6-4dd6-aa98-a015f9287f17@collabora.com>
Date: Mon, 25 Nov 2024 05:07:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20241119060248.3312553-1-vivek.kasireddy@intel.com>
 <20241119060248.3312553-3-vivek.kasireddy@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20241119060248.3312553-3-vivek.kasireddy@intel.com>
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
> +long virtgpu_dma_buf_import_sgt(struct virtio_gpu_mem_entry **ents,
> +				unsigned int *nents,
> +				struct virtio_gpu_object *bo,
> +				struct dma_buf_attachment *attach)

Nit: No need to use long type for return here, usual int will be fine.

-- 
Best regards,
Dmitry
