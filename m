Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E150B6A23C1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 22:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA41910ED1B;
	Fri, 24 Feb 2023 21:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6FE10ED1B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 21:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t9ApZL/TyOoD4R+s4Rg0Tn7+3RS24Xc1018QCdX9cQk=; b=LpZkeM1v9cnu/lKxZW1s0bQd+b
 jLaJmiWth47AQGuB6N9izoBdswEPmEyVULrfeRfcgvhDunMUzH1FO+YITjPkhM20eEYxLxApQxSxe
 U0iquIgsATjG3xtL6IEzAUyJAVZLrRfmMjCE0m3CO1BTPYN6FeVW2czics4JhJ1qoYqdKcHUFA3pG
 oR4qqwCzkxV6YkA8mIrWW6oGUZQodhHIJUZJhA8qP6XAzelE6IMimG/dwNOr/GJw3KLVubm9lcUj8
 LkE3R/MMFxOgfESxM5QGnJBnJpwjaEwBwpiXf8VotQzEsW6xrgGx8hHhJceZROB4Wq/D3cn0oV8yz
 6hTui6LA==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pVfZi-00Du85-Qr; Fri, 24 Feb 2023 22:25:55 +0100
Message-ID: <b29e442c-6c61-e4f1-a366-e96821fa61fc@igalia.com>
Date: Fri, 24 Feb 2023 18:25:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 5/5] drm/v3d: Use drm_sched_job_add_syncobj_dependency()
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
 <20230209124447.467867-6-mcanal@igalia.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230209124447.467867-6-mcanal@igalia.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/23 09:44, Maíra Canal wrote:
> As v3d_job_add_deps() performs the same steps as
> drm_sched_job_add_syncobj_dependency(), replace the open-coded
> implementation in v3d in order to simply use the DRM function.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_gem.c | 22 ++++------------------
>   1 file changed, 4 insertions(+), 18 deletions(-)
> 

Applied to drm-misc-next.

Best Regards,
- Maíra Canal
