Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2638DA365F1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 19:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5E410E4A2;
	Fri, 14 Feb 2025 18:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="ORnvTjp+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263DD10E4A2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 18:55:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739559322; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Q7TQkltvlvtc3BlPowcFBXdvBn5F8IhZF06+b40ZYagQgecPUwLryWPVQ0LSuE/iLApTtl/m9pLX9pp46ItcdZ3+N3ALdkKq8h4Pir/GME46RysYn8Ch1Ex3NaKT9l0TxQRVYffIAm6eOJX5OM+bTgIhVrLgyYNDYxWFMUkp2Ho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739559322;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=5PPELiY6ciT1+8p7A5RDR516Gz4+788KY4S3xS43Ruc=; 
 b=bQ0RFEhKYDLewQqNE41D6/ShRG9EkjOSIL9E8epsSx68oHw2QFBAeLCS7OOeH9zQcbA22mpSh/r7dVjWDtl2qBxQ2YAGqBclouRCnMuIVNbtydX60VB+NxYkyTQXmEIcoGC6O9yN04eeYpkr1pc0FHlWXXzzGVPRuuYKHuZdYcY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739559322; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=5PPELiY6ciT1+8p7A5RDR516Gz4+788KY4S3xS43Ruc=;
 b=ORnvTjp+4qG2puKce7R9BGUPS6ycT2RlZx/n0ekRkcvmUtGaTLzcypaiqHHoyA53
 zeDCRivHaM3y/DmGmIyzZPgQrC75NAwjL75J0MQvowsitmut1FPE0AjeNgfbV5Iq+EG
 xVt95RvbLF1pFGnZoPekbLuVGe9O3nFdSUDwcgH8=
Received: by mx.zohomail.com with SMTPS id 1739559319060353.5195199172622;
 Fri, 14 Feb 2025 10:55:19 -0800 (PST)
Message-ID: <04bb775b-9071-4bef-afaf-a0157bbce2fe@collabora.com>
Date: Fri, 14 Feb 2025 21:55:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/virtio: Extend blob UAPI with deferred-mapping
 hinting
To: Rob Clark <robdclark@gmail.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Asahi Lina <lina@asahilina.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20250126204239.474847-1-dmitry.osipenko@collabora.com>
 <CAF6AEGsHY+kh-k+=FqNzf=d=60JqkfFC=+U039XYK-7dTkXZmA@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <CAF6AEGsHY+kh-k+=FqNzf=d=60JqkfFC=+U039XYK-7dTkXZmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 2/14/25 20:45, Rob Clark wrote:
> On Sun, Jan 26, 2025 at 12:43 PM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> If userspace never maps GEM object, then BO wastes hostmem space
>> because VirtIO-GPU driver maps VRAM BO at the BO's creating time.
>>
>> Make mappings on-demand by adding new RESOURCE_CREATE_BLOB IOCTL/UAPI
>> hinting flag telling that host mapping should be deferred until first
>> mapping is made when the flag is set by userspace.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> I suppose we could have just added a new blob_flag, but then userspace
> would need to probe the kernel to see whether the new flag was
> supported.  (Which isn't a big deal, that sort of thing is done in
> many places.)  But extending the struct does make it more transparent
> to userspace.  Either way,
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com

Thanks for the review!

-- 
Best regards,
Dmitry
