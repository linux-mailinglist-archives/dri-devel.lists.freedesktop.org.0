Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E9E4DBAD3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 00:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3706489DA9;
	Wed, 16 Mar 2022 23:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA7089CB3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 23:04:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 6E9DA1F44C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647471855;
 bh=vypIGC9yqBVxDvY1DtMdZYum709Wnji4exA+N/PneQU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=A6tG0fKkfNiroiVkC5AuUMu0miL9hXVOUDNaQPQCpIopWYTUDzNIMIfaUkqM+N3B7
 BTKqhaNJgv7R49/bydapNWn+rNBZUPb3eA/sTT1JFBVdaWPxEhUJu3nnlh+F/+o0U6
 Rd1pFUOh54KcMnVr1n/nP/SvajR1rLXvFBIAi7DRFOdywZU58lzfAPTj1CGaXOiIbb
 tlNc/BF7NZreO7EVKH87tJVl0JmuwSGr3fYYNgCOvDxBeGDzQs98F7ev48ZfygR94W
 kyf+Zu/MchO9fRmCtryTDlgwb7C7fmDjOtobRCA7usmJukcnxb3kbuAZ16/4V9dV9x
 XlQ1qc6w6CaGg==
Message-ID: <3dda45b8-1f49-eefd-0167-1f3c13b2c73f@collabora.com>
Date: Thu, 17 Mar 2022 02:04:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 8/8] drm/panfrost: Switch to generic memory shrinker
Content-Language: en-US
To: Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
 <20220314224253.236359-9-dmitry.osipenko@collabora.com>
 <4e6256d0-a3c6-ba01-c31f-a5757b79a9ce@arm.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <4e6256d0-a3c6-ba01-c31f-a5757b79a9ce@arm.com>
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
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/16/22 18:04, Steven Price wrote:
> On 14/03/2022 22:42, Dmitry Osipenko wrote:
>> Replace Panfrost's memory shrinker with a generic DRM memory shrinker.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
> I gave this a spin on my Firefly-RK3288 board and everything seems to
> work. So feel free to add a:
> 
> Tested-by: Steven Price <steven.price@arm.com>
> 
> As Alyssa has already pointed out you need to remove the
> panfrost_gem_shrinker.c file. But otherwise everything looks fine, and
> I'm very happy to see the shrinker code gone ;)

Awesome, thank you.
