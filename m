Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6BF6DDD0D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 15:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6347610E29C;
	Tue, 11 Apr 2023 13:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4238F10E267;
 Tue, 11 Apr 2023 13:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681221530; x=1712757530;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yexL/N1m4BbU3jFepRVc09D3Ftt41ycmTKQzelkjxfo=;
 b=FHmMaScZpTkfTSNvycUOCXipRdJvhP/uAB1DpwOl0hCwY1yw71VS3Wkd
 vV/rJD9gjTT5jX24cVURPRob6aXkMg75JM/qYFA0iWe30pLmx6esOxzUm
 22Z8xJ8cOlVAK7rp0Ciu3FIRutEeOa8LLFXWeQoekDHTsqXOvuCY8MwQf
 3QlqxcrrXIsAmo6XA1C/4L+ow19q+/YpP5PyMoHEzbERd2HVTH8VZ8/eU
 G8TyNHFw78huykQO+9iLYplRNyN9u/40Cnpq65MS6bJctVu1x2fwE4umt
 Ryen8eOnAPT/jC4++4TG32RpDALd5YWAKIuQiZT6dG6mwwOM26zBgb8nU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="323982912"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="323982912"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 06:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="777919862"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="777919862"
Received: from aburgsta-mobl.ger.corp.intel.com (HELO [10.252.45.152])
 ([10.252.45.152])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 06:58:43 -0700
Message-ID: <8cef35ad-881e-3db3-5c7a-e27ff9968b77@linux.intel.com>
Date: Tue, 11 Apr 2023 15:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Subject: Re: [PATCH] fbmem: Reject FB_ACTIVATE_KD_TEXT from userspace
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20230404193934.472457-1-daniel.vetter@ffwll.ch>
 <ZDVkSaskEvwix8Bz@phenom.ffwll.local>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZDVkSaskEvwix8Bz@phenom.ffwll.local>
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
Cc: linux-fbdev@vger.kernel.org, Shigeru Yoshida <syoshida@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>, shlomo@fastmail.com,
 Nathan Chancellor <natechancellor@gmail.com>, stable@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Peter Rosin <peda@axentia.se>,
 Qiujun Huang <hqjagain@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-04-11 15:44, Daniel Vetter wrote:
> On Tue, Apr 04, 2023 at 09:39:34PM +0200, Daniel Vetter wrote:
>> This is an oversight from dc5bdb68b5b3 ("drm/fb-helper: Fix vt
>> restore") - I failed to realize that nasty userspace could set this.
>>
>> It's not pretty to mix up kernel-internal and userspace uapi flags
>> like this, but since the entire fb_var_screeninfo structure is uapi
>> we'd need to either add a new parameter to the ->fb_set_par callback
>> and fb_set_par() function, which has a _lot_ of users. Or some other
>> fairly ugly side-channel int fb_info. Neither is a pretty prospect.
>>
>> Instead just correct the issue at hand by filtering out this
>> kernel-internal flag in the ioctl handling code.
>>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Fixes: dc5bdb68b5b3 ("drm/fb-helper: Fix vt restore")
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: shlomo@fastmail.com
>> Cc: Michel Dänzer <michel@daenzer.net>
>> Cc: Noralf Trønnes <noralf@tronnes.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: <stable@vger.kernel.org> # v5.7+
>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> Cc: Nathan Chancellor <natechancellor@gmail.com>
>> Cc: Qiujun Huang <hqjagain@gmail.com>
>> Cc: Peter Rosin <peda@axentia.se>
>> Cc: linux-fbdev@vger.kernel.org
>> Cc: Helge Deller <deller@gmx.de>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
>> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>> Cc: Shigeru Yoshida <syoshida@redhat.com>
> An Ack on this (or a better idea) would be great, so I can stuff it into
> -fixes.
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
