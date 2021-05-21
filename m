Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BFF38C993
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 16:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA1B6EDAE;
	Fri, 21 May 2021 14:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF046F890;
 Fri, 21 May 2021 14:55:15 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id u133so11291176wmg.1;
 Fri, 21 May 2021 07:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RYm2q8UlxbFEyevcAFjmNarmhsddkGFIu0T8r1FdCck=;
 b=SymXLzgp4IQCswr8nsXU0X0/7HB/CMRTojNo+8E/X3EzCFEgqKvnvI4j0vxSMpDMoH
 0ykFKfqAWM8KhxpFKLAoDeKUugvn+8Q/i1myjddSpyLEi+81vid4JrQvF9QfT2H3lAMT
 XQaNj9Y2jcOkvNfywqUMuQY1rxsIYpbEGMnkmKbWw98VHMwxWJvUk/wfvhve3AZVAX0r
 chqT7z9GyNWR1lMw59ptfC2KKojDBEnL4f3wYWppSXwrVqwYvl/RckSwLoQbHFoQTvpK
 as5yPdvPZYCBuBojQqK2IzMS09xmglmVXSJYuw5NMuyn5JUcRpeozxRlN1uu5k518Gak
 JKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RYm2q8UlxbFEyevcAFjmNarmhsddkGFIu0T8r1FdCck=;
 b=fAHn90v7kLt+C5eZsZt9pPIDNfKkYfMUBSD2kpU+Y/z68t6WsjMbYs0ayiiMxs+Hpq
 aolDrp/Bmp8KJ0DYFBxfaHYJKo7wpPFg/NoBFBYyA4WRte1jDmWfqI+wHschXFoa3Xhs
 oAAg+Dxmmk94bnscuWjkvP2ltFXrg8EkMQGDGQrESWc/ofEgITH2NCD/u1j9o+echYmi
 RacKjDVAZJEvBa6C+U9HQX6tXIt+m4lvAjg9GsZ20/YB8kT9Ap8WUQOSKLIFzq9KiIRt
 twVURLPDX+WzY57RCF4bwYFFfLqcXYr4MIIP3G1d9QW5CLSa3K2YFp6Xyufm4MPPQUxo
 IwpA==
X-Gm-Message-State: AOAM530ZylwPkNMygXupcAqiy10jlgqDuhhHnqhmVRn8298nJgBTMDTQ
 SpGTIS3iwLVs1KpYHqfeAZLqRqbEwL7jk7/zrG8=
X-Google-Smtp-Source: ABdhPJytIJvOZWC7oQH8/K1lNQPn/h96jaDr9y5XKzz81AIZ6s8SfY9QtqLtNWTqGIG3qOGTyk/E/jCqV6kODPPAwfk=
X-Received: by 2002:a7b:ce95:: with SMTP id q21mr9838413wmj.49.1621608914380; 
 Fri, 21 May 2021 07:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 21 May 2021 07:58:57 -0700
Message-ID: <CAF6AEGvr_CWDGgKFTNGQTiApbg=kyOn=uBrRM_H3DO8UBq-W5g@mail.gmail.com>
Subject: Re: [Mesa-dev] [PATCH 01/11] drm/amdgpu: Comply with implicit fencing
 rules
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 2:10 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> - msm is mildly entertaining. It also supports MSM_SUBMIT_NO_IMPLICIT,
>   but because it doesn't use the drm/scheduler it handles fences from
>   the wrong context with a synchronous dma_fence_wait. See
>   submit_fence_sync() leading to msm_gem_sync_object(). Investing into
>   a scheduler might be a good idea.

Yeah, drm/scheduler is (along with a lot of other things) on the TODO
list.  But this isn't quite as bad as it sounds because userspace uses
a u_queue thread to call the submit ioctl rather than blocking the
driver.  (It also offloads some other work from the driver thread,
like submit merging to reduce # of ioctls.  Coincidentally that
arrangement was a step towards preparing userspace for some
hypothetical non-ioctl uapi ;-))

OTOH it would be good to move blocking until the system can free
enough pages to repin bo's out of the ioctl path to better handle some
memory pressure corner cases without having to be interruptable over a
lot more of the submit path..  Running chrome+android on devices
without a lot of memory is fun..

BR,
-R
