Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B82F942BF3A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 13:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D906EA19;
	Wed, 13 Oct 2021 11:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9343A6EA19
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 11:49:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id i12so7370348wrb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 04:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=08boCW0HMnhIyPqnEKd0z29O62VYOxVjXLOydU9mnwg=;
 b=Mv/468bUnclsUIFGoP1g7bLuh4vkC6eaYEg295OJ1ryC94cBpZK2gTxWKIKv6W3YAp
 sQuBcxhYE8QoKCeWn/QcY2UiuCUJbHirj7+rg+iB5MwrYjQNATU4afEnxXGmVLiG45CI
 c5nhagTn7gGG6qPSgy1ykMpVB3/9xapmjCL+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=08boCW0HMnhIyPqnEKd0z29O62VYOxVjXLOydU9mnwg=;
 b=sZZRV2AmLfjIZAD3jHyadzesbgyD+OmxS2CpFAKJXsA18u3O8eXocCBEquNLpVw0Ki
 lHMIo3wIIxvbah5zkan24zFbTTuzJBaptS5LbqeEKJRWIJE8bZkrnFgLMbf0xuLmDqIq
 KVFsnYKiZlnuu38wYI3Nd2Os+qVQECgOZDbLhHx7irt9UxexrAUe4NfaJ+kCdCLQqdQe
 A77kNHAec9tA+u0QunwL7FwJKcOhnsBdWA1Rf1lLXAwjOfPsAeVVzEMU6vN5RHQ4IR2s
 WMnQNT4xCJEl0WhKS0+5NFVEq43TWjl5BzQa7c2SPVFece+xhJeXsu0VUXuGzuFulL3i
 JWNw==
X-Gm-Message-State: AOAM531HTWsbvtsJxvhmbawEsSZXNBNsQVyIYXqkXy0Zvy2iD17Vn+y5
 x2Leb/mgYcCxpfPuJL/VSNQORZxxByRXBA==
X-Google-Smtp-Source: ABdhPJzlyusb1L1DUhksjSbFBTzACx5P3X60yFumfR+T/i6n5Qb5b27JgPXZFF30V5iZnOLusBD+Gw==
X-Received: by 2002:a5d:59a7:: with SMTP id p7mr19540566wrr.141.1634125795115; 
 Wed, 13 Oct 2021 04:49:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x7sm5706814wrq.69.2021.10.13.04.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 04:49:54 -0700 (PDT)
Date: Wed, 13 Oct 2021 13:49:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: Sean Paul <sean@poorly.run>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH 15/16] Revert "drm/i915: cleanup:
 drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()"
Message-ID: <YWbH4FqWq6myqChC@phenom.ffwll.local>
References: <20211002154542.15800-1-sean@poorly.run>
 <20211002154542.15800-15-sean@poorly.run>
 <YVrMLNa/oaP2+ZWx@intel.com> <20211004155637.GC2515@art_vandelay>
 <YVtkiP//rXCmTy59@zacax395.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVtkiP//rXCmTy59@zacax395.localdomain>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Mon, Oct 04, 2021 at 10:31:04PM +0200, Fernando Ramos wrote:
> On 21/10/04 11:56AM, Sean Paul wrote:
> > @Fernando, hopefully you can revise and post again. Thank you for your patches
> > and your effort!
> 
> No problem :)
> 
> Just to be sure I do the right thing this time (and to better understand the
> process), please confirm that this is the correct sequence of events:
> 
>   1. I fix the lock issue and test on my local machine.
> 
>   2. I then post this new patch set (v3) rebased on top of drm-tip (instead of
>      drm-next). This will automatically trigger tests on intel hardware (and
>      maybe in other hardwares?)
> 
>         NOTE: I originally chose drm-next because that's what is mentioned here:
>         https://01.org/linuxgraphics/gfx-docs/drm/gpu/introduction.html#contribution-process
>         Maybe this doc should be updated?
> 
>   3. Once reviewed and approved, someone (Sean?) merges them into "somewhere"
>      (drm-next? drm-misc-next? drm-intel-next? How is this decided?).
> 
>   4. Eventually, that other branch from the previous point is merged into
>      drm-tip.
> 
>   5. ??
> 
>   6. The branch is merged into linux-next.

This part should happen automatically, plus/minus right around the merge
window. At least not your problem.

Otherwise don't worry, and don't sweat it too much. We know that our CI
situation just isn't great yet for drm contributors :-/ There's plans to
improve it though, but it all takes time.

> There must be something wrong in my description above, as it doesn't make sense
> to post the patch series based on "drm-tip" only to later have one of the
> mainteiners merge them into a different branch that will eventually be merged
> back into "drm-tip".
> 
> Sorry for being completely lost! Is there a document explaining how all of this
> works so that I can learn for the next time?

drm-tip is just linux-next for drm area, it's the same principle. If there
are conflicts while merging, maintainers will sort these out. And yeah
that's a bit a speciality of linux with the multi-branch model for
development.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
