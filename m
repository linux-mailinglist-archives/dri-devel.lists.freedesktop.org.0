Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2B97E2566
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 14:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342DC10E315;
	Mon,  6 Nov 2023 13:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E384C10E315
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 13:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aC6+4w1Q6ice1++6GMv5WaahyDe2LHnMhdKW4ELi6D0=; b=NEMX3HKD08zSpgHu8vvLLQbX2c
 ucSjte5Nb5VFyZAYsMw6K4bOrWsiW/AYAAzj2xS+aUTmZyOrW6hb39gqY8T7zh43Ib9EMH3KsQ5sn
 sgHlFt2lFVLLzJjhQPBXyHklhEx4pXk5lGXX/iXP/OA5G7/+5tWba1JW9OjMqzZXSptebEVXnrxo0
 JHBLqZgpmHKx2GJ5U2geSe2tn+1YHKMGFpoMwLZcsixDR8Zdfyv6hboOS1nJ2He/ELIH9Eq4APnNB
 HNtLBMywbajQNlyE4txtfC/K5EK4Wld4Nd+6Ap67MJohv8jaqOYZjPlaQJwf5mqJa5uts2vEpniHV
 5t/wZtHw==;
Received: from [177.34.168.16] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qzzhF-00HZvq-4W; Mon, 06 Nov 2023 14:31:17 +0100
Message-ID: <47de1adc-b079-6f11-bd4c-ce9ee7702c7e@igalia.com>
Date: Mon, 6 Nov 2023 10:31:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 0/2] drm/v3d: Expose GPU usage stats
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>
References: <20230905213416.1290219-1-mcanal@igalia.com>
Content-Language: en-US
From: Maira Canal <mcanal@igalia.com>
In-Reply-To: <20230905213416.1290219-1-mcanal@igalia.com>
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

Hi,

I've just applied this patchset to drm-misc/drm-misc-next.

Thanks Melissa and Chema for reviewing it!

Best Regards,
- Maíra

On 9/5/23 18:06, Maíra Canal wrote:
> This patchset exposes GPU usages stats both globally and per-file
> descriptor.
> 
> The first patch exposes the accumulated amount of active time per client
> through the fdinfo infrastructure. The amount of active time is exposed
> for each V3D queue. Moreover, it exposes the number of jobs submitted to
> each queue.
> 
> The second patch exposes the accumulated amount of active time for each
> V3D queue, independent of the client. This data is exposed through the
> sysfs interface.
> 
> With these patches, it is possible to calculate the GPU usage percentage
> per queue globally and per-file descriptor.
> 
> * Example fdinfo output:
> 
> $ cat /proc/1140/fdinfo/4
> pos:    0
> flags:  02400002
> mnt_id: 24
> ino:    209
> drm-driver:     v3d
> drm-client-id:  44
> drm-engine-bin:         1661076898 ns
> v3d-jobs-bin:   19576 jobs
> drm-engine-render:      31469427170 ns
> v3d-jobs-render:        19575 jobs
> drm-engine-tfu:         5002964 ns
> v3d-jobs-tfu:   13 jobs
> drm-engine-csd:         188038329691 ns
> v3d-jobs-csd:   250393 jobs
> drm-engine-cache_clean:         27736024038 ns
> v3d-jobs-cache_clean:   250392 job
> 
> * Example gputop output:
> 
> DRM minor 128
>   PID         bin               render               tfu                csd            cache_clean     NAME
> 1140 |▎                ||██▋               ||                 ||█████████████▍   ||█▋               | computecloth
> 1158 |▍                ||████████▉         ||                 ||                 ||                 | gears
> 1002 |▏                ||█▎                ||                 ||                 ||                 | chromium-browse
> 
> Best Regards,
> - Maíra
> 
> ---
> 
> v1 -> v2: https://lore.kernel.org/dri-devel/20230727142929.1275149-1-mcanal@igalia.com/T/
> 
> * Use sysfs to expose global GPU stats (Tvrtko Ursulin)
> 
> v2 -> v3: https://lore.kernel.org/dri-devel/20230807211849.49867-1-mcanal@igalia.com/T/
> 
> * Document the expected behavior in case of a GPU reset (Melissa Wen)
> * Add a brief description about the sysfs outputs (Melissa Wen)
> * Instead of having multiple sysfs files, use only one sysfs file,
>    called gpu_stats, with all the information (Chema Casanova)
> * Add the number of jobs submitted in the global GPU stats (Chema Casanova)
> * Now, the number of jobs submitted is only incremented if the job was
>    completed
> 
> Maíra Canal (2):
>    drm/v3d: Implement show_fdinfo() callback for GPU usage stats
>    drm/v3d: Expose the total GPU usage stats on sysfs
> 
>   drivers/gpu/drm/v3d/Makefile    |  3 +-
>   drivers/gpu/drm/v3d/v3d_drv.c   | 45 ++++++++++++++++++++-
>   drivers/gpu/drm/v3d/v3d_drv.h   | 31 +++++++++++++++
>   drivers/gpu/drm/v3d/v3d_gem.c   |  7 +++-
>   drivers/gpu/drm/v3d/v3d_irq.c   | 49 +++++++++++++++++++++++
>   drivers/gpu/drm/v3d/v3d_sched.c | 33 ++++++++++++++++
>   drivers/gpu/drm/v3d/v3d_sysfs.c | 69 +++++++++++++++++++++++++++++++++
>   7 files changed, 234 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/gpu/drm/v3d/v3d_sysfs.c
> 
> --
> 2.41.0
> 
