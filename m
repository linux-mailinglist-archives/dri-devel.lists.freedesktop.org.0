Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23618800CA2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 14:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D688710E102;
	Fri,  1 Dec 2023 13:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5558210E102
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 13:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W/gQuARnGEQvJRg/Tx7uTyn3ciJTiu0kU0S0SRCukyQ=; b=FXFevFEC3h2Uz3B55dE8TCNLpn
 W/gsVAu+Y2FYrceldaavWTIRHUATwK5Smr43KPpNAWR5nAEOcz4Lpcn0rFDpzGdSG1hLvlZiTBzKc
 3MjbqnjrvqjnHDQDa6Mk0lDgRVqDiex2kdPGWG7S9gK8LyYA3mRTyKrkEdGsVx831bO84pfcp00c5
 JZ0saUKw+SfI+FL9ARLgWu9ZqSLX4pUf+/qomC/UMIEMDY3F4A2AI/I5mp8fiSaeR+1sq1e/xx+f0
 XELDE0JBLom+Q1oaSNq6JoBuRtO29cXtOGE1hjOTSqXRJxnPBKgvVLHSlEkgkC9CiwvKS9tQZD75t
 cx4hVlZw==;
Received: from [177.34.169.138] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1r93yQ-009DaU-3A; Fri, 01 Dec 2023 14:54:30 +0100
Message-ID: <40865d30-42b7-639c-d15a-1977e884d38f@igalia.com>
Date: Fri, 1 Dec 2023 10:54:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 00/17] drm/v3d: Introduce CPU jobs
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20231130164420.932823-2-mcanal@igalia.com>
From: Maira Canal <mcanal@igalia.com>
In-Reply-To: <20231130164420.932823-2-mcanal@igalia.com>
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
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/30/23 13:40, Maíra Canal wrote:
> 
> Maíra Canal (11):
>    drm/v3d: Don't allow two multisync extensions in the same job
>    drm/v3d: Decouple job allocation from job initiation
>    drm/v3d: Use v3d_get_extensions() to parse CPU job data
>    drm/v3d: Create tracepoints to track the CPU job
>    drm/v3d: Enable BO mapping
>    drm/v3d: Create a CPU job extension for a indirect CSD job
>    drm/v3d: Create a CPU job extension for the timestamp query job
>    drm/v3d: Create a CPU job extension for the reset timestamp job
>    drm/v3d: Create a CPU job extension to copy timestamp query to a buffer
>    drm/v3d: Create a CPU job extension for the reset performance query job
>    drm/v3d: Create a CPU job extension for the copy performance query job
> 
> Melissa Wen (6):
>    drm/v3d: Remove unused function header
>    drm/v3d: Move wait BO ioctl to the v3d_bo file
>    drm/v3d: Detach job submissions IOCTLs to a new specific file
>    drm/v3d: Simplify job refcount handling
>    drm/v3d: Add a CPU job submission
>    drm/v3d: Detach the CSD job BO setup
> 

Pushed to drm-misc/drm-misc-next!

Best Regards,
- Maíra

>   drivers/gpu/drm/v3d/Makefile     |    3 +-
>   drivers/gpu/drm/v3d/v3d_bo.c     |   51 ++
>   drivers/gpu/drm/v3d/v3d_drv.c    |    4 +
>   drivers/gpu/drm/v3d/v3d_drv.h    |  134 ++-
>   drivers/gpu/drm/v3d/v3d_gem.c    |  768 -----------------
>   drivers/gpu/drm/v3d/v3d_sched.c  |  315 +++++++
>   drivers/gpu/drm/v3d/v3d_submit.c | 1318 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/v3d/v3d_trace.h  |   57 ++
>   include/uapi/drm/v3d_drm.h       |  240 +++++-
>   9 files changed, 2110 insertions(+), 780 deletions(-)
>   create mode 100644 drivers/gpu/drm/v3d/v3d_submit.c
> 
> --
> 2.42.0
> 
