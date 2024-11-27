Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CB29DA73F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 12:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A47610EAA6;
	Wed, 27 Nov 2024 11:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="BtBPao++";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F8E10EAA6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 11:56:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732708613; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=m2j6onJP+KI3QHaJbdgtCARLtvX9qAiTQcgIHrXa9lIyhVrhexJaXe7WOfT7e8HyTje2ZTIs9EcC/Ate9Vz2ustrwzt/E24HCm0KPbUP8WpQHMymbXGdPhbCxd0hbNJoLRsQZNCJAVH8oLFfWWzWlOiNW6Tl6osypjSlQdVr6lA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732708613;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=lIKbR+w0ByjT0AGo5bKcT8TigeWbo0Et06/uLUS4VtA=; 
 b=hPFuT52nlJWDfXq9TZ+JDWR/1gZidEOCQM/bkSfM7dXYRP7vHWeO2wIb5Xcq5PpWfNQhr+iX8Hiy1B0nI4kImokNw/CLZwo2GXFefnZrkb6OebTe81/rUCF653QvqCkBoD/B0jyc9zDo0Y8NrXKJMCJU/gwnKdAjZVeI0gGdtac=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732708613; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=lIKbR+w0ByjT0AGo5bKcT8TigeWbo0Et06/uLUS4VtA=;
 b=BtBPao++21Pp4ziAObLrBG1KIQdStNH+DCCUlwTfWZ2PpTJTycg2uCasEyLioIMs
 35Zbzp3O9TkGD2pKmtgY61zPx/r3LjeNFAMxurRxtOB8ByHP793eLMTY5iBHgFY+iKz
 eATim27kK8SLTnv7EXLh/UnZCkqYdXxLgTWW3XmY=
Received: by mx.zohomail.com with SMTPS id 1732708610876940.1140999939159;
 Wed, 27 Nov 2024 03:56:50 -0800 (PST)
Message-ID: <5c3ddf5a-4b38-4e31-abf6-076e7206c9e0@collabora.com>
Date: Wed, 27 Nov 2024 14:56:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] drm/virtio: Import scanout buffers from other
 devices
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon"
 <dongwon.kim@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>, Rob Clark
 <robdclark@gmail.com>, Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
References: <20241126031643.3490496-1-vivek.kasireddy@intel.com>
 <658bff3c-2cda-4a8a-94fb-9a1737d71d68@collabora.com>
 <IA0PR11MB7185DFC580227B5B7164BED8F8282@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <IA0PR11MB7185DFC580227B5B7164BED8F8282@IA0PR11MB7185.namprd11.prod.outlook.com>
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

On 11/27/24 09:30, Kasireddy, Vivek wrote:
>> Note: While verifying move_notify(), I noticed that AMD/TTM driver moves
>> same shared FB GEMs after each framebuffer update when it renders into
>> FB, despite of the 32GB BAR. This should be rather inefficient. I'd
>> expect dma-buf staying static if there is no need to evict it. Something
>> to check how it works with DG2.
> IIUC, I think the exporting driver (AMD GPU driver) in the Guest VM migrates the
> FB to System RAM because during export it determines that virtio-gpu is not P2P
> compatible. This behavior is expected and seen with other dGPU drivers (i915/Xe)
> as well. However, I am trying to fix this in Xe driver for specific use-cases (SRIOV)
> where we know for sure that the importer on the Host is another dGPU:
> https://patchwork.kernel.org/project/dri-devel/
> cover/20241012024524.1377836-1-vivek.kasireddy@intel.com/
> https://patchwork.kernel.org/project/dri-devel/
> cover/20240624065552.1572580-1-vivek.kasireddy@intel.com/

Are the dmabufs static with a disabled MOVE_NOTIFY or TTM uses bounce
buffer in this case?

-- 
Best regards,
Dmitry
