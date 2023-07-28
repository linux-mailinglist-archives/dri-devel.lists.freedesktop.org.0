Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9075C766FAE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 16:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C1A10E027;
	Fri, 28 Jul 2023 14:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B12A10E027;
 Fri, 28 Jul 2023 14:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oiMutyUMmVTk99ASOanACyUD72nSCbLfCygSg1z4+14=; b=Y1pdF6VAaU5RBGv2OSYBkSpK9G
 qAkOTLW06hJyFxgChOD8q1GLjdJltoz4LI80qJInTti5eo8pZMdho56qPQIYTP+onXpNhM/GtGZfP
 Dg4jJ9eoZao82TSWhPGvDgJi+QWT9deZw0Tzcsyzz6UJldyFIb/1V6Nume99Uij9oT30HM41QGyqX
 2HxLgbkDqiRLdsAZnuCLny+y0XlxpxxM+Wot3bwpamG2WFb0ZvFhTPUqF6jOnveBmrhbD6x0dRAdK
 vuZZ9PTrYrPPWNajYZ1px+zXpWmtvsfwgE5yCDTAdINWjUhy/c00rJPzt4HuVxOPthR79machWgt3
 jjCw25Lg==;
Received: from [189.111.93.147] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qPOix-005De2-UM; Fri, 28 Jul 2023 16:45:48 +0200
Message-ID: <24fc3974-a303-e792-b6d5-5ca634c2bc4b@igalia.com>
Date: Fri, 28 Jul 2023 11:45:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] drm/amdgpu: Add new reset option and rework
 coredump
Content-Language: en-US
To: christian.koenig@amd.com
References: <20230714161128.69545-1-andrealmeid@igalia.com>
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20230714161128.69545-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 dri-devel@lists.freedesktop.org, michel.daenzer@mailbox.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian, gently ping here

Em 14/07/2023 13:11, André Almeida escreveu:
> Hi,
> 
> The goal of this patchset is to improve debugging device resets on amdgpu.
> 
> The first patch creates a new module parameter to disable soft recoveries,
> ensuring every recovery go through the full device reset, making easier to
> generate resets from userspace tools like [0] and [1]. This is important to
> validate how the stack behaves on resets, from end-to-end.
> 
> The last patches are a rework to alloc devcoredump dynamically and to move it to
> a better source file.
> 
> I have dropped the patches that add more information to devcoredump for now,
> until I figure out a better way to do so, like storing the IB address in the
> fence.
> 
> Thanks,
> 	André
> 
> [0] https://gitlab.freedesktop.org/andrealmeid/gpu-timeout
> [1] https://github.com/andrealmeid/vulkan-triangle-v1
> 
> Changelog:
> 
> v2: https://lore.kernel.org/dri-devel/20230713213242.680944-1-andrealmeid@igalia.com/
> - Drop the IB and ring patch
> - Drop patch that limited information from kernel threads
> - Add patch to move coredump to amdgpu_reset
> 
> v1: https://lore.kernel.org/dri-devel/20230711213501.526237-1-andrealmeid@igalia.com/
>   - Drop "Mark contexts guilty for causing soft recoveries" patch
>   - Use GFP_NOWAIT for devcoredump allocation
> 
> André Almeida (5):
>    drm/amdgpu: Create a module param to disable soft recovery
>    drm/amdgpu: Allocate coredump memory in a nonblocking way
>    drm/amdgpu: Rework coredump to use memory dynamically
>    drm/amdgpu: Move coredump code to amdgpu_reset file
>    drm/amdgpu: Create version number for coredumps
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 67 +-----------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  9 +++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 79 ++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  | 14 ++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c   |  6 +-
>   6 files changed, 111 insertions(+), 70 deletions(-)
> 
