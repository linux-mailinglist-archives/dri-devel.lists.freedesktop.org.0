Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C69BA4DDBF9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 15:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C9C10E9E4;
	Fri, 18 Mar 2022 14:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B820B10E9F3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 14:47:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07B521515;
 Fri, 18 Mar 2022 07:47:49 -0700 (PDT)
Received: from [10.1.29.15] (e122027.cambridge.arm.com [10.1.29.15])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 292833F7D7;
 Fri, 18 Mar 2022 07:47:46 -0700 (PDT)
Message-ID: <049f8b0c-7c3e-8ee1-5ae0-a4348278ee63@arm.com>
Date: Fri, 18 Mar 2022 14:47:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 8/8] drm/panfrost: Switch to generic memory shrinker
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
 <20220314224253.236359-9-dmitry.osipenko@collabora.com>
 <4e6256d0-a3c6-ba01-c31f-a5757b79a9ce@arm.com>
 <3dda45b8-1f49-eefd-0167-1f3c13b2c73f@collabora.com>
 <b8d74d79-7d49-658f-5e0b-4a5da4fa2afc@collabora.com>
Content-Language: en-GB
In-Reply-To: <b8d74d79-7d49-658f-5e0b-4a5da4fa2afc@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/03/2022 14:41, Dmitry Osipenko wrote:
> 
> On 3/17/22 02:04, Dmitry Osipenko wrote:
>>
>> On 3/16/22 18:04, Steven Price wrote:
>>> On 14/03/2022 22:42, Dmitry Osipenko wrote:
>>>> Replace Panfrost's memory shrinker with a generic DRM memory shrinker.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>> ---
>>> I gave this a spin on my Firefly-RK3288 board and everything seems to
>>> work. So feel free to add a:
>>>
>>> Tested-by: Steven Price <steven.price@arm.com>
>>>
>>> As Alyssa has already pointed out you need to remove the
>>> panfrost_gem_shrinker.c file. But otherwise everything looks fine, and
>>> I'm very happy to see the shrinker code gone ;)
>>
>> Awesome, thank you.
> 
> Steven, could you please tell me how exactly you tested the shrinker?
> 
> I realized that today's IGT doesn't have any tests for the Panfrost's
> madvise ioctl.
> 
> You may invoke "echo 2 > /proc/sys/vm/drop_caches" manually in order to
> trigger shrinker while 3d app is running actively (like a game or
> benchmark). Nothing crashing will be a good enough indicator that it
> works okay.
> 
> I may get an RK board next week and then will be able to test it by
> myself, so please don't hurry.

I have to admit it wasn't a very thorough test. I run glmark on the
board with the following hack:

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index b014dadcf51f..194dec00695a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -279,6 +279,14 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
        if (ret)
                goto out_cleanup_job;
 
+       {
+       struct shrink_control sc = {
+               .nr_to_scan = 1000
+       };
+       dev->shmem_shrinker->base.scan_objects(&dev->shmem_shrinker->base,
+                       &sc);
+       }
+
        ret = panfrost_job_push(job);
        if (ret)
                goto out_cleanup_job;

That hack was specifically because I had some doubts about the removal
of the 'gpu_usecount' counter and wanted to ensure that purging as the
job is submitted wouldn't cause problems.

The drop_caches file should also work AFAIK.

Steve
