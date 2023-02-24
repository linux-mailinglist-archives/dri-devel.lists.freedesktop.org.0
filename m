Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF986A23BF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 22:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F76010ED17;
	Fri, 24 Feb 2023 21:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA0410ED17
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 21:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KZ2/FpbcHDbGf/3nGkNn1d/aX4RdrWnn4gHJXmj2aRc=; b=OCUyx+bpJVYzrK/fkLIWim9wVR
 V7k/RVRbBDUZE6wYpseVrNQohD9gjZx5/wmXKToo1nLjCJh/tatC9uF8XZwHjKnEYGEQTWtK4emOs
 N/tufkGA87hvE8bAyV+OPWnhW4ABWH/n1MR41csgVE/5pBf3hBGBgCq30Q2CMyh6tde53zS+U7X7S
 YWujLjtn24jJU4yT+C3uPV6zU/UTDmvJ6IhP0zK5Qq2icKUCqqvQRYRn6o9Fs1QFQ401o1ghdtoZs
 1RZOeUUcOdbAf39o6lKDNJC3N5+XuMB0Z+Snh/iQG7ukuO1J4OWazhW5AjLR3D2VEbrwbUIfvMUYx
 jHn/zcug==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pVfZD-00Du6p-9b; Fri, 24 Feb 2023 22:25:23 +0100
Message-ID: <e171253c-87e6-5c63-c7df-8137ad858879@igalia.com>
Date: Fri, 24 Feb 2023 18:25:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 4/5] drm/panfrost: Use
 drm_sched_job_add_syncobj_dependency()
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Melissa Wen <mwen@igalia.com>
References: <20230209124447.467867-1-mcanal@igalia.com>
 <20230209124447.467867-5-mcanal@igalia.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230209124447.467867-5-mcanal@igalia.com>
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
Cc: dri-devel@lists.freedesktop.org, Alyssa Rosenzweig <alyssa@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/23 09:44, Maíra Canal wrote:
> As panfrost_copy_in_sync() performs the same steps as
> drm_sched_job_add_syncobj_dependency(), replace the open-coded
> implementation in Panfrost in order to simply use the DRM function.
> 
> Reviewed-by: Alyssa Rosenzweig <alyssa@collabora.com>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_drv.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
> 

Applied to drm-misc-next.

Best Regards,
- Maíra Canal
