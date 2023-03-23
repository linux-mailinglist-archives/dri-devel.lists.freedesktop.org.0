Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4516C72EA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 23:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7AF10E499;
	Thu, 23 Mar 2023 22:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD40110E499
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 22:19:19 +0000 (UTC)
Received: from [192.168.2.179] (109-252-120-116.nat.spd-mgts.ru
 [109.252.120.116])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 677B86603101;
 Thu, 23 Mar 2023 22:19:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1679609958;
 bh=13qVgcP+l402P7/bUsTCXjHnBiBLeTZcTgT6kSPNWb0=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=Uf3/eNdZhGOsKSWW+wFFZJ6SCAGucTcsjedMz7X0kGqPhoroFdQpqSfN58NCXdNHM
 XHuuJLFzA63hNuh/hylex9xAK/fp4qMWcqJPuFnE3c0pYA0546tyH987EBn50LW+6b
 LP7MKjL7rJgPKL+wf3lBrrvoqB0QdKoKbbFoD7XJrL+SqdLt8ikeV7eXzoGyyFBw51
 OUnvBc0xOovAoDYoSp8+OHZDHtatjo9Lgt9HdSNYbRB2vjzH/G/5P9LbmeCKHLH2VY
 xqHRzJXXkRNTMa3lQ88ScL1Tk0ATT5lmktMYO6hR21pFMPFgtKw52ZDuonSmVQFhuK
 6sVMtc+lR6Stw==
Message-ID: <be12c081-61a9-f476-7afe-b1bb78c35dea@collabora.com>
Date: Fri, 24 Mar 2023 01:19:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] drm/virtio: Support sync objects
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Rob Clark <robdclark@gmail.com>
References: <20230323190340.950875-1-dmitry.osipenko@collabora.com>
 <20230323190340.950875-3-dmitry.osipenko@collabora.com>
 <CAF6AEGs28wzuXc3w+qYvcUH+dT271w=dtxmzKfR6zgHqXqjMzQ@mail.gmail.com>
 <889ce0e7-f61a-ed0a-35d5-1a9290521d49@collabora.com>
In-Reply-To: <889ce0e7-f61a-ed0a-35d5-1a9290521d49@collabora.com>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/24/23 00:51, Dmitry Osipenko wrote:
> On 3/24/23 00:18, Rob Clark wrote:
> ...
>>> +static int
>>> +virtio_gpu_parse_deps(struct virtio_gpu_submit *submit)
>>> +{
>>> +       struct drm_virtgpu_execbuffer *exbuf = submit->exbuf;
>>> +       struct drm_virtgpu_execbuffer_syncobj syncobj_desc;
>>> +       size_t syncobj_stride = exbuf->syncobj_stride;
>>> +       struct drm_syncobj **syncobjs;
>>> +       int ret = 0, i;
>>> +
>>> +       if (!submit->num_in_syncobjs)
>>> +               return 0;
>>> +
>>> +       syncobjs = kcalloc(submit->num_in_syncobjs, sizeof(*syncobjs),
>>> +                          GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
>> I *think*, assuming I'm reading where this is called correctly (kinda
>> wish git would show more lines of context by default) that these don't
>> need to be NOWARN|NORETRY (same for post_deps).  I guess you inherited
>> this from drm/msm, where I appear to have forgotten to update the
>> syncobj path in commit f0de40a131d9 ("drm/msm: Reorder lock vs submit
>> alloc").  I don't see anything obvious that would require NORETRY, but
>> lockdep should be able to tell you otherwise if needed.
> 
> The NORETRY should prevent waking up OOM killer, it shouldn't help with
> lockdep. Nothing prevents userspace from giving a big number of
> num_in_syncobjs. But perhaps indeed not very practical to care about
> this case, given that other similar memalloc paces of execbuffer_ioctl()
> aren't using NORETRY. Alright, let's drop it in v4.
> 

Although no, there is only a kvmalloc_array() in the code and vmalloc
uses NOWARN and NORETRY flags implicitly. May be better switch to use
kvmalloc everywhere, for consistency. Technically, vmalloc shouldn't
ever be needed for a submit code path and kmalloc should be enough. On
the other hand, vmalloc acts like kmalloc until there is no enough
contig memory.

-- 
Best regards,
Dmitry

