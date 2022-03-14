Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A90C84D9061
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 00:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8476A10E137;
	Mon, 14 Mar 2022 23:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8416710E137
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 23:32:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id EB1A21F433BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647300734;
 bh=9clAFUpmyfjDVmXRc8GUa3ADKwVw6CLuu2WzpsLgnrQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cusMh++HSY9Mu8xH2QJtv7+yNcgFTInEIC9S1TQ37r87YqQK0Cbr+l8E5kvCU2AHU
 IPrSmZbOYKir/Zm3aQubN11Jfer0fCrYEkW0TZcvzt7lcTuzdjL3lFvD0FDAsieTyX
 tiaHBcIQn7fxWcA43hBPz2VSoJOCe3vsDpQhF7/eUsui8EsKp289qqBwduO4KnTU+M
 UhbX4uBTGvUJ9vEiU+gbnygEKmla/oeTSxevMvoEOpirWNUC1XU13yYBzUha5hiT8z
 9Kge3LtkPCnnTfa5b7fETcmqq5F3OMtEVkpTx6/7qdf+63JzqhwtXM89NytBlOQGl5
 YjMDA3m8lTv2A==
Message-ID: <4c107b1a-ad6b-8d20-9336-8e08adffe09c@collabora.com>
Date: Tue, 15 Mar 2022 02:32:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 8/8] drm/panfrost: Switch to generic memory shrinker
Content-Language: en-US
To: Alyssa Rosenzweig <alyssa@collabora.com>
References: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
 <20220314224253.236359-9-dmitry.osipenko@collabora.com>
 <Yi/PCCQqvxA6aHzA@maud>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <Yi/PCCQqvxA6aHzA@maud>
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
Cc: Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 Steven Price <steven.price@arm.com>, virtualization@lists.linux-foundation.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/15/22 02:26, Alyssa Rosenzweig wrote:
> On Tue, Mar 15, 2022 at 01:42:53AM +0300, Dmitry Osipenko wrote:
>> Replace Panfrost's memory shrinker with a generic DRM memory shrinker.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  drivers/gpu/drm/panfrost/Makefile          |  1 -
>>  drivers/gpu/drm/panfrost/panfrost_device.h |  4 ----
>>  drivers/gpu/drm/panfrost/panfrost_drv.c    | 19 ++-------------
>>  drivers/gpu/drm/panfrost/panfrost_gem.c    | 27 ++++++++++++++--------
>>  drivers/gpu/drm/panfrost/panfrost_gem.h    |  9 --------
>>  drivers/gpu/drm/panfrost/panfrost_job.c    | 22 +++++++++++++++++-
>>  6 files changed, 40 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
>> index b71935862417..ecf0864cb515 100644
>> --- a/drivers/gpu/drm/panfrost/Makefile
>> +++ b/drivers/gpu/drm/panfrost/Makefile
>> @@ -5,7 +5,6 @@ panfrost-y := \
>>  	panfrost_device.o \
>>  	panfrost_devfreq.o \
>>  	panfrost_gem.o \
>> -	panfrost_gem_shrinker.o \
>>  	panfrost_gpu.o \
>>  	panfrost_job.o \
>>  	panfrost_mmu.o \
> 
> I'm not sure you actually deleted gem_shrinker anywhere in this patch?
> Diff stat is too small.

Indeed, I was also confused by the diffstat once noticed it after the
patches were sent out. And yes, I missed to git-add the
panfrost_gem_shrinker.c by accident. Good catch, thank you! I'll correct
it in in the v3.

Meanwhile, will be great if you or somebody else could test this
Panfrost patch. I don't have any h/w with Mali on hands yet and only
compile-tested it.
