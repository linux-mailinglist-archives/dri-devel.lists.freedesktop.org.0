Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A75A14DDBD4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 15:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7465B10E9C5;
	Fri, 18 Mar 2022 14:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5194510E9C5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 14:41:24 +0000 (UTC)
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown
 [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 457FD1F45FDD;
 Fri, 18 Mar 2022 14:41:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647614482;
 bh=aOAvZJ3YpqdRhOb0wcVTFtzo0hw/DL1k4YKv61CzQWg=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=nL2C0nfha3tkRVC9UrK2Io1Es+wUL38zxUmvE2qCswyWIVMp9aDcfqryJB7E+R6BP
 W2O6mv33ofUBPjpwz1la8ntw1Ll11p3AgQuuaQNtQPqd8I/tW29t7HQAPO9uDv5vHV
 Ws5kmo/FdVCIMxAtD+mBfJxDUZ3eO/7KN1CGFWKzGQWg5mnMPNQP6l60CzBv5HdRLG
 4M7isGiW/ALBPEGIz9tESa0dE6N35XF762XrsN1xWVFnKvLeeM8Aei0RQuBAwWHwt2
 nJTL3h27VK3tTNzuZ4eKjSyrMi+f3mJr2eZidsLJ9r/O0OBwKkhjFVg05iuy9z5V2H
 n40aiKPsUHX/A==
Message-ID: <b8d74d79-7d49-658f-5e0b-4a5da4fa2afc@collabora.com>
Date: Fri, 18 Mar 2022 17:41:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 8/8] drm/panfrost: Switch to generic memory shrinker
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Steven Price <steven.price@arm.com>
References: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
 <20220314224253.236359-9-dmitry.osipenko@collabora.com>
 <4e6256d0-a3c6-ba01-c31f-a5757b79a9ce@arm.com>
 <3dda45b8-1f49-eefd-0167-1f3c13b2c73f@collabora.com>
In-Reply-To: <3dda45b8-1f49-eefd-0167-1f3c13b2c73f@collabora.com>
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


On 3/17/22 02:04, Dmitry Osipenko wrote:
> 
> On 3/16/22 18:04, Steven Price wrote:
>> On 14/03/2022 22:42, Dmitry Osipenko wrote:
>>> Replace Panfrost's memory shrinker with a generic DRM memory shrinker.
>>>
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> ---
>> I gave this a spin on my Firefly-RK3288 board and everything seems to
>> work. So feel free to add a:
>>
>> Tested-by: Steven Price <steven.price@arm.com>
>>
>> As Alyssa has already pointed out you need to remove the
>> panfrost_gem_shrinker.c file. But otherwise everything looks fine, and
>> I'm very happy to see the shrinker code gone ;)
> 
> Awesome, thank you.

Steven, could you please tell me how exactly you tested the shrinker?

I realized that today's IGT doesn't have any tests for the Panfrost's
madvise ioctl.

You may invoke "echo 2 > /proc/sys/vm/drop_caches" manually in order to
trigger shrinker while 3d app is running actively (like a game or
benchmark). Nothing crashing will be a good enough indicator that it
works okay.

I may get an RK board next week and then will be able to test it by
myself, so please don't hurry.
