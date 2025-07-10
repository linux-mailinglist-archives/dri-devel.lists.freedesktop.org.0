Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F55DB00E1D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 23:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92E010E979;
	Thu, 10 Jul 2025 21:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HPIHPs38";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5B410E979;
 Thu, 10 Jul 2025 21:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5keT94UYo+lVgUpH7G2rj3sAusxDAQ2/pkCQOehvr3g=; b=HPIHPs38ujFuAw61nlEgH1XTDD
 L9gB2acmqUVa8/5pX26zrrE7xVdNHuWnEpJTSbd3DlO4FwZNEnO8O1ZKmor/cEOTtz3S3lRTxxx1f
 gFnGOVzE7euwxR3a0SvExYl6KUDT8PKZ+aBydltznrVwzfB/TAyhC8uOL7e3kZBvG/tzLkWG9cJm3
 NhSnOSXVh3qGD6XyPeIhT5pfSSyAKoJ+4Nq0nyAlZjck3VgZ4ZpR79yO1nbu+kJnaw0+SQHVfMSM+
 tOy1q/RDqhowsM/6iNtrq7qpj/0nlmw7lExjchv4tdjQbI1xG4+lz/CRL9LahO5zXN/7R54HtMLW9
 hc5E7cgQ==;
Received: from [179.118.186.174] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uZz6U-00F7G0-P7; Thu, 10 Jul 2025 23:46:54 +0200
Message-ID: <ece437c6-52d2-4857-b9b9-cb73cbc091a0@igalia.com>
Date: Thu, 10 Jul 2025 18:46:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fix lifetime of struct amdgpu_task_info after
 ring reset
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 Dave Airlie <airlied@gmail.com>
References: <20250704030629.1064397-1-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250704030629.1064397-1-andrealmeid@igalia.com>
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

Em 04/07/2025 00:06, André Almeida escreveu:
> When a ring reset happens, amdgpu calls drm_dev_wedged_event() using
> struct amdgpu_task_info *ti as one of the arguments. After using *ti, a
> call to amdgpu_vm_put_task_info(ti) is required to correctly track its
> lifetime.
> 
> However, it's called from a place that the ring reset path never reaches
> due to a goto after drm_dev_wedged_event() is called. Move
> amdgpu_vm_put_task_info() bellow the exit label to make sure that it's
> called regardless of the code path.
> 
> amdgpu_vm_put_task_info() can only accept a valid address or NULL as
> argument, so initialise *ti to make sure we can call this function if
> *ti isn't used.
> 
> Fixes: a72002cb181f ("drm/amdgpu: Make use of drm_wedge_task_info")
> Reported-by: Dave Airlie <airlied@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/CAPM=9tz0rQP8VZWKWyuF8kUMqRScxqoa6aVdwWw9=5yYxyYQ2Q@mail.gmail.com/
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---

This patch is now merged at drm-misc-next, thanks!

