Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B82CC36591
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585A110E2C7;
	Wed,  5 Nov 2025 15:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PArjNynA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FF410E2C7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 15:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BqKvi6M4ezVA2lSMXdPrz1XWnKn3oMUIote1Bvn4V1I=; b=PArjNynAFNFAWI+SbdZNAq6z88
 BQ4YWzky7SZi/dXEzgEx2Y1BWJ9RQY7n712H4RVOr5nnth/PlGPY1bHtRJ5b698LbjFzxgQTYZz1w
 xoV8DXHummkbRY+mindhydmMVmT9eVfF6Cw3S1BLBHbfn3i2U6wH8d8iaBQv8gZefU8ntncNk5cHx
 8qZdXhbHH8/yi1LY8b7fGph1Um+04s5gSFv2bJgP+ihYmoT097SIZh8wrDA5vFyClcQZbEYFZk03m
 wx5B7Wm24NHVb8deT2kU2CJnhuLeYbPO+iojO2d/oxEdhKZjKkhhybxvGnsMuitXyn4pK22HgHBn4
 d8Vexxww==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vGfVv-002V9W-HQ; Wed, 05 Nov 2025 16:33:35 +0100
Message-ID: <fdbab4cb-5011-451b-bec9-f246f3949c76@igalia.com>
Date: Wed, 5 Nov 2025 15:33:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Some small TTM cleanups
To: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: kernel-dev@igalia.com
References: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


+ Christian & Thomas

On 19/09/2025 14:15, Tvrtko Ursulin wrote:
> Some small cleanups, nothing intentionally functional. It is mostly about
> applying some consistency to when to use a local variable to cache something,
> when not, and making the code use the ones already there.
> 
> Tvrtko Ursulin (4):
>    drm/ttm: Make ttm_bo_init_validate safe against ttm_operation_ctx
>      re-ordering
>    drm/ttm: Resource cannot be NULL in ttm_resource_intersects
>    drm/ttm: Tidy ttm_operation_ctx initialization
>    drm/ttm: Tidy usage of local variables a little bit

I got acks for trivial cleanups patch 1 & 3 from this series. Are you 
okay if I push the two to drm-misc-next?

Regards,

Tvrtko

>   drivers/gpu/drm/ttm/ttm_bo.c       | 64 +++++++++++++++---------------
>   drivers/gpu/drm/ttm/ttm_bo_util.c  | 57 ++++++++++++--------------
>   drivers/gpu/drm/ttm/ttm_bo_vm.c    | 12 +++---
>   drivers/gpu/drm/ttm/ttm_device.c   |  5 +--
>   drivers/gpu/drm/ttm/ttm_pool.c     | 26 ++++++------
>   drivers/gpu/drm/ttm/ttm_resource.c | 14 ++-----
>   drivers/gpu/drm/ttm/ttm_tt.c       |  2 +-
>   7 files changed, 83 insertions(+), 97 deletions(-)
> 

