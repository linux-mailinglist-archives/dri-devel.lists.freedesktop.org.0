Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C12AB62436D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 14:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A899610E7C3;
	Thu, 10 Nov 2022 13:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2545 seconds by postgrey-1.36 at gabe;
 Thu, 10 Nov 2022 13:42:31 UTC
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DA410E7B4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CZcNVqk8g0KSBhUkHK8jBepdav+GnxjrdTrEFAD5npc=; b=hjFFxIsGFN79BXqIS1Crj19qI/
 /s46Ipu4kc9GHOn8iSyndnI/QJZvzLmLk9GcEpZyVJUtPwmCiLITMSdQk9cCkfTJDUDgaQV+tAkdr
 5v66hVVTrzJ3stkcqg9+u+g7OiXbRkIlBH22hub2aYlJjdc9uduRXMiLjVRA85U2V/tJwOH545Rw3
 ZIFtBZNuS+EcLCR9xnzK56CejdPpXtLGrOSp+YZ5NwKVXMLGq31alJykB6OFr9n16/gpkWQw2TY5u
 WnvgM/b7WAB0Zqh1v2LNXTkQX/Kow40L/0GoeeYVTPH1AY2FCSAvPP6M/7oSDYb6yA9gA0yFz+Pxb
 yFc/5F+A==;
Received: from [186.214.225.177] (helo=[192.168.15.50])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ot7A0-00FVOM-Nr; Thu, 10 Nov 2022 14:00:01 +0100
Message-ID: <335b511f-ecfd-6e83-ef2e-7a74c8293b00@igalia.com>
Date: Thu, 10 Nov 2022 11:59:54 -0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 0/2] Balance mutex_init and mutex_destroy calls
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221108175425.39819-1-mcanal@igalia.com>
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20221108175425.39819-1-mcanal@igalia.com>
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
Cc: "Juan A . Suarez" <jasuarez@igalia.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/8/22 16:54, Maíra Canal wrote:
> This series introduces some changes to assure the correct resource release on
> the V3D driver, especially the mutex. Currently, the V3D has no mutex_destroy()
> calls, which means that a mutex is being instantiated, but it is not being
> released by the end of its use.
>
> So, use the DRM-managed mutex_init variants when possible to manage the mutex
> release and add mutex_destroy() calls when not possible.
>
> Best Regards,
> - Maíra Canal
>
> v1 -> v2: https://lore.kernel.org/dri-devel/20221107224656.278135-1-mcanal@igalia.com/T/#m3c23e3f21fe6aaae51138c746c74e94b2a7b3bfc
>
> - Move mutex_destroy() to v3d_perfmon_put() (Daniel Vetter).
> - Add mutex_destroy() on error case in v3d_perfmon_create_ioctl() (Daniel Vetter).
> - Add Daniel Vetter's tags.

Applied to drm-misc-next.

Thanks,

Melissa

>
> Maíra Canal (2):
>    drm/v3d: switch to drmm_mutex_init
>    drm/v3d: add missing mutex_destroy
>
>   drivers/gpu/drm/v3d/v3d_gem.c     | 17 +++++++++++++----
>   drivers/gpu/drm/v3d/v3d_perfmon.c |  6 +++++-
>   2 files changed, 18 insertions(+), 5 deletions(-)
>
