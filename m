Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8727D4D47
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 12:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9DB10E30B;
	Tue, 24 Oct 2023 10:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1ACE10E30B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 10:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From
 :References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fdpfmIwB1TpaxZ4EpOiQT/J1g7s4nHIX3I+9ohwLQWg=; b=H2sflMzpDu44fwA08f3hj1c1Xs
 2G5RfgQlQ7pipcpxLSo5DRwD9Au5pbIkeNTaceqgeWxqfhPMQmDgjQf4iBBan5Cl6/btQ4bD8BSO3
 omOr1VG1SwZZ15PQSsmHpMTqmpuFcN7PU3byYyhy8JncCFAGusaOhmSVRd5Mhsk6LktTcZO9jZ3kt
 CYGDxpFoUjitrVmczihCN9e1NFa/lxduuK/DKmUaMxJ5NIcFhfKGpuDB48jSgd+hxz9Y5fxNki81G
 2CmFQPvV8W5cQaTarW/tSQGH/rh8cDPjmlnls9IlQ42k/9tS21HRs3ww/kBgK3J+3isUWPomHbXhx
 KUJoJmrA==;
Received: from [177.34.168.16] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qvEIN-006NAk-BH; Tue, 24 Oct 2023 12:05:55 +0200
Message-ID: <abb70285-d7ae-7b8a-8af0-1282de9314bf@igalia.com>
Date: Tue, 24 Oct 2023 07:05:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Iago Toral <itoral@igalia.com>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20231023105927.101502-1-mcanal@igalia.com>
 <807b6fd6f6100c7cd824f4aa1a80ec1421d7222c.camel@igalia.com>
Content-Language: en-US
From: Maira Canal <mcanal@igalia.com>
Subject: Re: [PATCH 1/2] drm/v3d: wait for all jobs to finish before
 unregistering
In-Reply-To: <807b6fd6f6100c7cd824f4aa1a80ec1421d7222c.camel@igalia.com>
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

Hi Iago,

On 10/24/23 02:57, Iago Toral wrote:
> El lun, 23-10-2023 a las 07:58 -0300, Maíra Canal escribió:
>> Currently, we are only warning the user if the BIN or RENDER jobs
>> don't
>> finish before we unregister V3D. We must wait for all jobs to finish
>> before unregistering. Therefore, warn the user if TFU or CSD jobs
>> are not done by the time the driver is unregistered.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_gem.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
>> b/drivers/gpu/drm/v3d/v3d_gem.c
>> index 2e94ce788c71..afa7d170d1ff 100644
>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>> @@ -1072,6 +1072,8 @@ v3d_gem_destroy(struct drm_device *dev)
>>           */
>>          WARN_ON(v3d->bin_job);
>>          WARN_ON(v3d->render_job);
>> +       WARN_ON(v3d->tfu_job);
>> +       WARN_ON(v3d->csd_job);
> 
> I guess we should do this for cache clean jobs too, right?

As the cache clean jobs are synchronous, we don't keep track of the
current cache clean job. When I say that the cache clean jobs are
synchronous, it means that the end of the job is not determined by
an interruption. Therefore, there is no need to make sure that the
cache clean jobs are still running.

Best Regards,
- Maíra

> 
> Iago
> 
>>   
>>          drm_mm_takedown(&v3d->mm);
>>   
> 
