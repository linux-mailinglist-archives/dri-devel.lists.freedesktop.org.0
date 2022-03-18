Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FA54DDF9F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 18:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863F910E1FC;
	Fri, 18 Mar 2022 17:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4F510E1FC
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 17:09:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 7B65B1F462F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647623347;
 bh=H01ftYPqiPEr26pDA0JowPbSkvWk4iU/Q+hYbeow3a4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AzjW6P70cgA1pp9umPQYQC1H7tPH6/ZwBk70jIlv6XcAx+ut6Bd2GghAA/IjBntyX
 86fznN+iqmsFfNmWJ/16HhhNhI2qBmoXyRLqriX+QaguUVKFLGT10AId7OIheEqA2Y
 F+xIKbDewssmb33NGvdqBXs3T3ySqnMQ7id84zIp6om/HQx2Ei+inuT/mZb0YtXL5x
 YqcW7xOrIacsCsgGbdYE7P8MaljeIr0+UyORkURZlyHzbOCOFdKnoNq+8AdboojivN
 VS/jIVLeWbvDSiazAtjBmmh7lRYx8AzfuY6E/omAmnZvx6xgCNVhepOLv1nwHBjTvs
 W6NJgqGVyDKag==
Message-ID: <bdfbe26c-2071-1586-f2a7-0c4a9ed52451@collabora.com>
Date: Fri, 18 Mar 2022 20:09:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 8/8] drm/panfrost: Switch to generic memory shrinker
Content-Language: en-US
To: Steven Price <steven.price@arm.com>
References: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
 <20220314224253.236359-9-dmitry.osipenko@collabora.com>
 <4e6256d0-a3c6-ba01-c31f-a5757b79a9ce@arm.com>
 <3dda45b8-1f49-eefd-0167-1f3c13b2c73f@collabora.com>
 <b8d74d79-7d49-658f-5e0b-4a5da4fa2afc@collabora.com>
 <049f8b0c-7c3e-8ee1-5ae0-a4348278ee63@arm.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <049f8b0c-7c3e-8ee1-5ae0-a4348278ee63@arm.com>
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

On 3/18/22 17:47, Steven Price wrote:
> On 18/03/2022 14:41, Dmitry Osipenko wrote:
>>
>> On 3/17/22 02:04, Dmitry Osipenko wrote:
>>>
>>> On 3/16/22 18:04, Steven Price wrote:
>>>> On 14/03/2022 22:42, Dmitry Osipenko wrote:
>>>>> Replace Panfrost's memory shrinker with a generic DRM memory shrinker.
>>>>>
>>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>>> ---
>>>> I gave this a spin on my Firefly-RK3288 board and everything seems to
>>>> work. So feel free to add a:
>>>>
>>>> Tested-by: Steven Price <steven.price@arm.com>
>>>>
>>>> As Alyssa has already pointed out you need to remove the
>>>> panfrost_gem_shrinker.c file. But otherwise everything looks fine, and
>>>> I'm very happy to see the shrinker code gone ;)
>>>
>>> Awesome, thank you.
>>
>> Steven, could you please tell me how exactly you tested the shrinker?
>>
>> I realized that today's IGT doesn't have any tests for the Panfrost's
>> madvise ioctl.
>>
>> You may invoke "echo 2 > /proc/sys/vm/drop_caches" manually in order to
>> trigger shrinker while 3d app is running actively (like a game or
>> benchmark). Nothing crashing will be a good enough indicator that it
>> works okay.
>>
>> I may get an RK board next week and then will be able to test it by
>> myself, so please don't hurry.
> 
> I have to admit it wasn't a very thorough test. I run glmark on the
> board with the following hack:
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index b014dadcf51f..194dec00695a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -279,6 +279,14 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>         if (ret)
>                 goto out_cleanup_job;
>  
> +       {
> +       struct shrink_control sc = {
> +               .nr_to_scan = 1000
> +       };
> +       dev->shmem_shrinker->base.scan_objects(&dev->shmem_shrinker->base,
> +                       &sc);
> +       }
> +
>         ret = panfrost_job_push(job);
>         if (ret)
>                 goto out_cleanup_job;
> 
> That hack was specifically because I had some doubts about the removal
> of the 'gpu_usecount' counter and wanted to ensure that purging as the
> job is submitted wouldn't cause problems.
> 
> The drop_caches file should also work AFAIK.

Yours variant of testing looks okay, thanks.

We check BO's reservation dma-fence status in the shrinker's scan(), so
BO won't be purged until the last job has completed using the BO. The
'gpu_usecount' is redundant now, and thus, I removed it.
