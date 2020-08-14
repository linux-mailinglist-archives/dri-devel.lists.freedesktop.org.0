Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58AD2443EB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 05:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEA16E170;
	Fri, 14 Aug 2020 03:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084906E170
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 03:17:25 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id c19so7507471wmd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 20:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=wl/TIaKZ9dTlJ62kvHyiZDfL+ehWiDRfxAJUxUuA1tc=;
 b=eKrHJzIGIPExL14a3DOJy+t3LRjaafp3Qj1gvEc1cQYpZoBDTSPQ/xd9TKIw8kWARH
 M+77qBHIN8Z0KwQGXTld/X9cLPt6CHOuPgg+CeIKB1GySNanFQXW+mgAC1+0KPvhnPzX
 XUWPEzRrm5GBVCkpcreT4mtfMhccXsdhhswSFQaBVNEMYgiGIgDalyedyNBNaTubknug
 r6aTlXnVXan3dio5HLscfxT1ddtu9o0gsZZ9wxAcPxclBEDC3xzvOH8PEtG6tZ9JmOSb
 FCv2M6q0GzjKjalAvON9RYA/3P0BHvs6y834xQ0Z4YcDmkl+p0pd/Nxzal9qEfwz/zRw
 I/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=wl/TIaKZ9dTlJ62kvHyiZDfL+ehWiDRfxAJUxUuA1tc=;
 b=I7HO0HNUDxIj5uwWgpjq1rRhZoXGwhmS4LDCFKYHsdY1lmX/wbbmIzUAKZ9GtgINOU
 z/wNMHW00lAjpYA4l7Nv5QE3iFBJOn9qNi/WkXjtURYL+yUgLcZdKDUT5cutjoosRkrj
 Vk7Y3n9U/sMmwUg3F/j3El9n+3e2vLyFZmHpOh8pR4oLSl+BaOauYc8cAK5SrFTIg8ey
 ZpbYVez9lyAhv3Jx7xjS2Eye+yiNCLc0ZyOceUZcxfEurvzibDmxFBWRgVfPFCbGSG0V
 l8hnVHXbDwFWZymAH0Wj5Blqub1LZl1pKnp3gr8z7c5LRtynXh4kNLMmRGoDfUwELHnu
 QYcg==
X-Gm-Message-State: AOAM533x0ZCASZyco759zWmcYewMuyHK8EZYQzRV9OeMTLXUHErmMCBG
 cvAjHixwnHFtFoDWkMxWa/QLQVzaqGQrB2dfitYvnFvz
X-Google-Smtp-Source: ABdhPJwYT5H2RKQg9KOeCU7fLfP7rtJP2DxEZ3kiM5tHUfxywnKgzrHcqmV+DOBRozxsPIjHiXCVWrpE6BG+CBt1s5A=
X-Received: by 2002:a05:600c:252:: with SMTP id 18mr544219wmj.56.1597375042589; 
 Thu, 13 Aug 2020 20:17:22 -0700 (PDT)
MIME-Version: 1.0
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 13 Aug 2020 23:17:11 -0400
Message-ID: <CADnq5_O2gEAmNE9Y8jB7xYuLv3cw+YejWfy9r1BzhmQ_Uhamtw@mail.gmail.com>
Subject: Warnings with drm: Replace drm_modeset_lock/unlock_all with
 DRM_MODESET_LOCK_ALL_* helpers
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Cc: Michal Orzel <michalorzel.eng@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The non-atomic modesetting code in amdgpu now spews warnings[1] with
this patch applied.  I haven't really paged the legacy locking stuff
into my head in quite a while.  Thoughts on how to proceed?

Thanks,

Alex

commit 9bcaa3fe58ab7559e71df798bcff6e0795158695
Author: Michal Orzel <michalorzel.eng@gmail.com>
Date:   Tue Apr 28 19:10:04 2020 +0200

    drm: Replace drm_modeset_lock/unlock_all with DRM_MODESET_LOCK_ALL_* helpers

    As suggested by the TODO list for the kernel DRM subsystem, replace
    the deprecated functions that take/drop modeset locks with new helpers.

    Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
    Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
    Link: https://patchwork.freedesktop.org/patch/msgid/1588093804-30446-1-git-send-email-michalorzel.eng@gmail.com


[1] https://gitlab.freedesktop.org/drm/amd/-/issues/1224
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
