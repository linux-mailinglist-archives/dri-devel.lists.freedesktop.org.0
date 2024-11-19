Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8B69D2319
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 11:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA0110E609;
	Tue, 19 Nov 2024 10:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Amx68NIj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B5C10E609
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 10:11:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732011058; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Xjs2fNE2nDGWUloIZLZLpeaaIolIQ7blIJqNCpxcZu7Vm3eSxedZ6w3akJaowhJt96S3iRiT/362irc/uFGkBzwNcLapyx/y8EuAnpPl4P2zhY+VfHWLmG98xHzWlK+JuVDS1SI5JKPcbGoTI1a0mSy8MZYzSt3tpnM0TPW+ykI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732011058;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=mjTMeSU3sTCJGKoxM7F867Kujv49vH3h9PnodMzQGU8=; 
 b=WV5Mo5Hj/dQQ7Xur3DItHiqOxUklzvgkKabC28YDQh+1+7pyU+E/TEdDcoKDkKnsM4wOD96Z2RdX2LlXtzAbOZ6KEW6mxuNTPxgITpqY8EBULc6WFEMGaYNlYBfZ40ZoDIvf5d4wYUx270JBWKfaAgW5QOHS2inVBHUSXscFRtw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732011058; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=mjTMeSU3sTCJGKoxM7F867Kujv49vH3h9PnodMzQGU8=;
 b=Amx68NIjFS7NTPccBsrF26kQLrkCHfikwwEm2NWy638tAVu1rOaHVSyCnewcIPZf
 mc32FvJ/m9eVe3KryuT4EGBsWqY1A2WluJVX71vM/OffmC4bkToFA/TtiC7ubnvREsd
 tkNGZW+gFbJh8qr7aLg7b9M5wv6nlY+xpbSG7y/k=
Received: by mx.zohomail.com with SMTPS id 1732011056423310.76166899225984;
 Tue, 19 Nov 2024 02:10:56 -0800 (PST)
Message-ID: <3f8c0fe3-6273-457b-a935-b93a3de5f695@collabora.com>
Date: Tue, 19 Nov 2024 13:10:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/virtio: Use drm_gem_plane_helper_prepare_fb()
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Kim Dongwon <dongwon.kim@intel.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20241020230803.247419-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20241020230803.247419-1-dmitry.osipenko@collabora.com>
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

On 10/21/24 02:08, Dmitry Osipenko wrote:
> From: Dongwon Kim <dongwon.kim@intel.com>
> 
> Use drm_gem_plane_helper_prepare_fb() helper for explicit framebuffer
> synchronization. We need to wait for explicit fences in a case of
> Venus and native contexts when guest user space uses explicit fencing.
> 
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> [dmitry.osipenko@collabora.com>: Edit commit message]
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Applied patchset to misc-next

-- 
Best regards,
Dmitry

