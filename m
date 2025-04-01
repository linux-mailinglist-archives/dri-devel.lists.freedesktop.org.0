Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FBDA7833F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 22:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF5910E145;
	Tue,  1 Apr 2025 20:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="DLsPkpwo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957B710E145
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 20:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743539065; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nVudeP4HRTu5n6x8T1kjhZ9lFBAIcFkeUZcWcCRlPbxbnQwC44HjoJ2asVO+njogrhAFBWiuZVQ5q9evu+ZaeTkU9+Mk+vTDEummX+QsAoM2d1qzu0VbO/Q0sO48BVqZ0retUsOWynmdIA5Lc8RU+yhy9frEtgpxphI3konFD4k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743539065;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=J2P0Ic2aVRrBbXcHSHgdkSjSn8amYT/Pw5QVusBb3qg=; 
 b=LErVpSmuRttut35FgdqocVT5vRgDLwUKSWE4KmuOgyaxb5oHaWs9he+PKPx78BupcY3fL018xcdIc/jFlJUHgkokVyrn+I0qTuL+SEQ38HdAQU75jRU6bR4I+SDY55QTgGqBTB/6XHvHvmM19No6HG01MffP8/e0kfeS2h3TR6U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743539065; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=J2P0Ic2aVRrBbXcHSHgdkSjSn8amYT/Pw5QVusBb3qg=;
 b=DLsPkpwokYbjjdPkgRazsC4bS0DE+Pactxb2YADSstoQSoQ5IkLowZ7ZSO/JjfrS
 G6JO2PvIRNeC8/rYdant2Smbnx3DAdVNbsbps6GDxAYKNjnE8T3T1Espu79HW8s0aJj
 HKPmI1zK63Uq36+eK+i8OaRF/H5xlWjDpmJ51EFE=
Received: by mx.zohomail.com with SMTPS id 174353906464838.705516079159906;
 Tue, 1 Apr 2025 13:24:24 -0700 (PDT)
Message-ID: <0f16673f-9758-4790-ae6c-e81150241ba2@collabora.com>
Date: Tue, 1 Apr 2025 23:24:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/virtio: Don't attach GEM to a non-created
 context in gem_object_open()
To: Rob Clark <robdclark@gmail.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20250401123842.2232205-1-dmitry.osipenko@collabora.com>
 <CAF6AEGu8XZktM9Y0t=KEF68uGLz7D_+9H1GnAPnZqc1YsT8iGA@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <CAF6AEGu8XZktM9Y0t=KEF68uGLz7D_+9H1GnAPnZqc1YsT8iGA@mail.gmail.com>
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

On 4/1/25 22:53, Rob Clark wrote:
> On Tue, Apr 1, 2025 at 5:39 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> The vfpriv->ctx_id is always initialized to a non-zero value. Check whether
>> context was created before attaching GEM to this context ID. This left
>> unnoticed previously because host silently skips attachment if context
>> doesn't exist, still we shouldn't do that for consistency.
>>
>> Fixes: 086b9f27f0ab ("drm/virtio: Don't create a context with default param if context_init is supported")
>> Cc: <stable@vger.kernel.org> # v6.14+
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Thanks, applied both patches to misc-fixes

-- 
Best regards,
Dmitry
