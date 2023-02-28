Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7906A5B4B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 16:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F0610E4BB;
	Tue, 28 Feb 2023 15:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5D310E4D8;
 Tue, 28 Feb 2023 15:06:15 +0000 (UTC)
Received: from [192.168.2.206] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 317CB660220A;
 Tue, 28 Feb 2023 15:06:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677596773;
 bh=fRRUDnN0sb5ppJBWZN3lIN1aOeviwF/hqQ4fPqDGiDQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=opq0X2VNoHFfm2D9D40LcwvMSFVKGPtka90s3AOKwWM03Iwdsxanbf6cZZyTBsHBw
 /x2InbdVeVOvRY7gL6KbdH6H4hvrPayh58b/Ywv469txzabTIa2KJf1eHbjA7N9CEl
 s0x/14KZDnatHemq5sDu04jZ93GUQIPRWZoD+mQ2aHII5MQ0zFZ8scKjt78W/BjRR0
 g4N4CYeewC0qHHCsdZBbykHwD5AxE3xXdLHhWrd2VsjTWYzRfU57phIYua1FZEP4pa
 e04mfpZaRm8tmmBBScQ13K+GltGkdMG2KNHUokuQLzlJll1Jr1cECLG4umoldFbfQL
 dWM/WlxOngrpw==
Message-ID: <007c2cab-f721-7a49-44e6-529957f3ab73@collabora.com>
Date: Tue, 28 Feb 2023 18:06:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/shmem-helper: Fix compile error
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20230228125054.1952657-1-andi.shyti@linux.intel.com>
 <71dee5cf-3c12-8d5f-5d2a-be0a39647d8c@collabora.com>
 <Y/4AMJ/+3BhTa+FF@ashyti-mobl2.lan> <87bkldzxv1.fsf@intel.com>
 <Y/4OrBltJz1J0qxe@ashyti-mobl2.lan> <877cw1zwdf.fsf@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <877cw1zwdf.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Asahi Lina <lina@asahilina.net>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>, "Saarinen,
 Jani" <jani.saarinen@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/28/23 17:40, Jani Nikula wrote:
...
>>> And the build is indeed currently broken.
>>>
>>> Moreover, when the build was fine for a while, apparently the changes in
>>> shmem broke a bunch of machines in Intel CI. And due to this, we aren't
>>> getting any CI results for incoming patches right now.
>>
>> Is there any plans for fixing it?
> 
> Someone(tm) needs to step up and do it. Personally, I'm clueless.
> 
> The whole thing is made worse by the conflict and the various
> resolutions. At this time, I'm not certain whether the whole thing was
> broken to begin with, or if it's just the conflict resolution that
> caused the issues.
> 
> I'll just note that for future reference, Cc'ing intel-gfx for anything
> non-trivial touching the guts of drm will be useful for running CI on
> our test farm pre-merge. Now, we don't know.

Apparently, there is a missing lock for dma-buf vgem (and probably some
other similar drivers) exporting code path that I missed before. I've
reproduced the IGT warning locally and looking into fixing it. Will keep
updating you on it. Thanks for reporting it!

-- 
Best regards,
Dmitry

