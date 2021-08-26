Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1183F851B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 12:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF346E5BF;
	Thu, 26 Aug 2021 10:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9AE6E5BE
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 10:11:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v10so4166647wrd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 03:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ac3fMmTYZ5U0/5f7hGMlFdFgIVyhNW4ilfMgHg73YrI=;
 b=oSUd8hrnKCvEPsmH38lZSg26RQxehyNtk+NoqwDUhCqLbS28XhKezF0H1ibxJr42T7
 VE3VpcucNktNDaAfP2uBWlhOgrs10LO/IBxqarO8XXxWPSkw/DGpQkEorhqIWVlEmZB1
 9pUwq0ppTH/cQKetRvwoTH/Z+XjuqY07uJc6UdYZUzvYgGdo0euqWWf6am+b5B3SYOyy
 6MnNNURS5Eq20yV1pK5TDXHiR18Vhsuv8nJW9nxxkhJPx+FodDe3AcQ3L51tLJarW/U/
 M2QRXu3Hk8VSHWz5fdarzUiGEEOAIueoVDGbTUKvY9x/vvFDzGw+A89+eYeNg3+d+int
 r5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ac3fMmTYZ5U0/5f7hGMlFdFgIVyhNW4ilfMgHg73YrI=;
 b=r4lEdFKVzfGyjTbPQYvIL9HTYnadpdjlCnJOtMjRt21ZyOluaQNz9W8xVMY5DwaRYF
 7aAh8Qq7qvoZ1dws7kndrjD+BPVZLSQCXqxd33XoXw55HCfNbs5GyQsILCFh71weeLch
 +h4hObL1x9jnd60B1NQ1W7ayFQE1p6y1cyu/F0d3P8AdsHrf6tU8EeAR14lFHdfWgg1R
 X0btaJHmPQp+Y8KQZotEBaxyBFQFkBO4soCIRPFUysyeIm07WHgHE9d1Iy57lEewcM4Z
 mAYI74v13SaNUNfm0WTGEPIDdeRTDL6qVxwy2mb4W3RCapkPxIfQSDmiH1GzcnPgojkY
 g21A==
X-Gm-Message-State: AOAM532HvP0DQTi7AFLIXKF8cXKnjxG+oX5j9jSercUKAYyEaBm7aQyq
 MDbWz/jqTTF5RyChTCoeQhuj4WTkJAw=
X-Google-Smtp-Source: ABdhPJzt4d0RPWqUvCAa6ZVUTHtrVtd/R85RhoSwTBVZQi4D1KvqxRhrIdpeM1DRFyaNqeaReTP97w==
X-Received: by 2002:adf:c381:: with SMTP id p1mr2920160wrf.163.1629972666332; 
 Thu, 26 Aug 2021 03:11:06 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:f034:47d2:6ee4:c70f?
 ([2a02:908:1252:fb60:f034:47d2:6ee4:c70f])
 by smtp.gmail.com with ESMTPSA id h12sm2246768wmm.29.2021.08.26.03.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 03:11:05 -0700 (PDT)
Subject: Re: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Cc: daniel.vetter@ffwll.ch, airlied@gmail.com, dri-devel@lists.freedesktop.org
References: <20210728130552.2074-1-christian.koenig@amd.com>
 <eebf6fc4-c299-6aa7-f91c-16029c5c3444@gmail.com>
 <3ad5188659ce362087db1980880ac47af60e639f.camel@linux.intel.com>
 <YSdVkNcKLG8j7uP/@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8800c47f-7029-1804-774c-457ce850066c@gmail.com>
Date: Thu, 26 Aug 2021 12:11:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSdVkNcKLG8j7uP/@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 26.08.21 um 10:49 schrieb Daniel Vetter:
> On Mon, Aug 23, 2021 at 01:15:20PM +0200, Thomas Hellström wrote:
>> On Mon, 2021-08-23 at 13:05 +0200, Christian König wrote:
>>> Adding Thomas on CC as well.
>>>
>>> Just a gentle ping. I think the patch set makes sense now.
>>>
>>> Regards,
>>> Christian.
>>>
>>> Am 28.07.21 um 15:05 schrieb Christian König:
>>>> Doing this in vmw_ttm_destroy() is to late.
>>>>
>>>> It turned out that this is not a good idea at all because it leaves
>>>> pointers
>>>> to freed up system memory pages in the GART tables of the drivers.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 9 +++------
>>>>    1 file changed, 3 insertions(+), 6 deletions(-)
>>>>
>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> For next time around I think recording a bit more of the discussions and
> git history in these would be really good. At least I'd like to get more
> people ramped up on ttm work, and for that to work out things need to be a
> bit more accessible ... The above commit message is pretty much useless if
> you ever hit it in a git blame, if you haven't been involved in any of
> these discussions.

I've pushed it with a link tag back to the patches in patchwork, but I 
should probably include a link tag to the older versions as well for 
completeness.

Christian.

> -Daniel

