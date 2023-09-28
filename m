Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1262B7B1AEF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612BD10E620;
	Thu, 28 Sep 2023 11:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4838510E61C;
 Thu, 28 Sep 2023 11:25:00 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 23087660733A;
 Thu, 28 Sep 2023 12:24:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695900299;
 bh=hYbCeLnlTSQfRAgC7ALpkheWCkzbYcpdRuwjsO0GqDs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CKRSIceL+5qHqhFGqwgl1BvbRF73hBlPflXssfoTGIkcUTbdjtWBfByxsrM0hcJo6
 Q2dbBUhqpO/TYIjcwwtAH41K2gOruB3sRfZYXgzyrN7e6bE6M9qkBxCpABERFusjkf
 wS/iTamCpvkHOJCk+SfzC66cDmyGOgPNSS8pS8TEk5UhxMylRYD8fzxDMp6TKauKlH
 0mAGm/4LSUZEA5xXoXpBQKGwRkAYvbO7u1LRl/AwTfdUSRGWVm0tF31gHAFQ68EynQ
 yqWL8CNIGCBrts58LWr1C0h5EKVmlSshteK352FmtlUneJ3RgP/EutWTqUhtnSFkyu
 WoayComFkmNxg==
Message-ID: <3fd7e291-4254-c6b3-893a-b8e457cccb58@collabora.com>
Date: Thu, 28 Sep 2023 13:24:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 2/5] drm/panfrost: Add fdinfo support GPU load metrics
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
References: <20230927213133.1651169-1-adrian.larumbe@collabora.com>
 <20230927213133.1651169-3-adrian.larumbe@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927213133.1651169-3-adrian.larumbe@collabora.com>
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
Cc: tvrtko.ursulin@linux.intel.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 healych@amazon.com, boris.brezillon@collabora.com, kernel@collabora.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/09/23 23:29, Adrián Larumbe ha scritto:
> The drm-stats fdinfo tags made available to user space are drm-engine,
> drm-cycles, drm-max-freq and drm-curfreq, one per job slot.
> 
> This deviates from standard practice in other DRM drivers, where a single
> set of key:value pairs is provided for the whole render engine. However,
> Panfrost has separate queues for fragment and vertex/tiler jobs, so a
> decision was made to calculate bus cycles and workload times separately.
> 
> Maximum operating frequency is calculated at devfreq initialisation time.
> Current frequency is made available to user space because nvtop uses it
> when performing engine usage calculations.
> 
> It is important to bear in mind that both GPU cycle and kernel time numbers
> provided are at best rough estimations, and always reported in excess from
> the actual figure because of two reasons:
>   - Excess time because of the delay between the end of a job processing,
>     the subsequent job IRQ and the actual time of the sample.
>   - Time spent in the engine queue waiting for the GPU to pick up the next
>     job.
> 
> To avoid race conditions during enablement/disabling, a reference counting
> mechanism was introduced, and a job flag that tells us whether a given job
> increased the refcount. This is necessary, because user space can toggle
> cycle counting through a debugfs file, and a given job might have been in
> flight by the time cycle counting was disabled.
> 
> The main goal of the debugfs cycle counter knob is letting tools like nvtop
> or IGT's gputop switch it at any time, to avoid power waste in case no
> engine usage measuring is necessary.
> 
> Add also documentation file explaining the possible values for fdinfo's

Also add a documentation file explaining .....

or

Moreover, add a documentation file explaining .....

> engine keystrings and Panfrost-specific drm-curfreq-<keystr> pairs.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Nitpick apart:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


