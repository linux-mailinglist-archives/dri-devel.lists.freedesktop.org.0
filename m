Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A174243E520
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 17:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F10B6E995;
	Thu, 28 Oct 2021 15:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3366E995
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 15:30:13 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 131-20020a1c0489000000b0032cca9883b5so8471035wme.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 08:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=WRSGeIT8RFy0N8rav4fjh71T7nm35XkgF3E7gPLp/xA=;
 b=XriBFYemP/sj1fPrf6T0rtazEbAZlQi0or0mwF6XsS5558IMWt0X0eN2zLm1RhVl7W
 AAO5ZEH6vn4T1zqmMXsWtJkd/96ZgKWi+zChmXB+pbZw/NzERI2nt71Q2yB2EITArUq8
 5KCB+WhFmrs9orbvTTMytx0ZSbpK2i700vgb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WRSGeIT8RFy0N8rav4fjh71T7nm35XkgF3E7gPLp/xA=;
 b=CXit3hmNNHZ3F/gSnSJrcsuHXWWlimdICISyWUjSIi0TCymD2jKP1p+dkzyfxXoRTt
 1dI0HAjTgd7Q6q1i+WGSpbiwmDAjq/KwnYYvttveKBmtsp3c3NL39pzTGh2/ugUAI2HK
 /Cx0rhxmTs0ZeTYy+2O1zQZaV/tLE2OUaqfNuIf/vphyct9l2Ui4NmFb5TqTSAlWG1Dz
 EzpmmafVF4c3GiNd70sEc+1yuOIddMZSrmW8pLfI2hJe35biZwPNBa2zwexh9Ej2WI96
 9Ru6InpWSgQ9PgLe7t/cArPd+qJUMy8vLUyq4K0YopoRPvaUUABMwKOZuxhv4y2QBDL/
 qMqQ==
X-Gm-Message-State: AOAM532oRgpH+dPun/ZsfKW9D7R73UhT51Na2XfF5SeunAOi/Yz9lmzN
 Mb0yjknxffhPkQjLIALu/4/mxw==
X-Google-Smtp-Source: ABdhPJyzbYtht486G9NvSCd+7tgya6KSCFeca6KwrieZl2tPJXi4w3huwJLdvq7+0oiyPBJu7QGuhQ==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr13100927wmb.155.1635435011608; 
 Thu, 28 Oct 2021 08:30:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p1sm6663142wmq.23.2021.10.28.08.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:30:11 -0700 (PDT)
Date: Thu, 28 Oct 2021 17:30:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 02/28] drm/i915: use new iterator in
 i915_gem_object_wait_reservation
Message-ID: <YXrCAaGhLVtduUfa@phenom.ffwll.local>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-2-maarten.lankhorst@linux.intel.com>
 <022f8ecb-37c0-3d67-563f-012f0a3651df@amd.com>
 <c7c82fa5-6fe5-33e2-e224-c5433020100c@linux.intel.com>
 <007050d3-0207-5226-0cbe-7a3d8679811c@linux.intel.com>
 <810de535-0902-04ef-be13-35c978fd80bc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <810de535-0902-04ef-be13-35c978fd80bc@amd.com>
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

On Thu, Oct 28, 2021 at 10:41:38AM +0200, Christian König wrote:
> Am 21.10.21 um 13:13 schrieb Tvrtko Ursulin:
> > 
> > On 21/10/2021 12:06, Maarten Lankhorst wrote:
> > > Op 21-10-2021 om 12:38 schreef Christian König:
> > > > Am 21.10.21 um 12:35 schrieb Maarten Lankhorst:
> > > > > From: Christian König <christian.koenig@amd.com>
> > > > > 
> > > > > Simplifying the code a bit.
> > > > > 
> > > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > > [mlankhorst: Handle timeout = 0 correctly, use new
> > > > > i915_request_wait_timeout.]
> > > > > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > 
> > > > LGTM, do you want to push it or should I pick it up into drm-misc-next?
> > > 
> > > I think it can be applied to drm-intel-gt-next, after a backmerge.
> > > It needs patch 1 too, which fixes
> > > 
> > > i915_request_wait semantics when used in dma-fence. It exports a
> > > dma-fence compatible i915_request_wait_timeout function, used in
> > > this patch.
> 
> What about the other i915 patches? I guess you then want to merge them
> through drm-intel-gt-next as well.
> 
> > I don't think my open has been resolved, at least I haven't seen a reply
> > from Daniel on the topic of potential for infinite waits with untrusted
> > clients after this change. +Daniel
> 
> Please resolve that internally and let me know the result. I'm fine to use
> any of the possible approaches, I just need to know which one.

I thought I explained this in the patch set from Maarten. This isn't an
issue, since the exact same thing can happen if you get interrupts and
stuff.

The only proper fix for bounding the waits is a) compositor grabs a stable
set of dma_fence from the dma-buf through the proposed fence export ioctl
b) compositor waits on that fence (or drm_syncobj).

Everything else is cargo-culted nonsense, and very much includes that igt
patch that's floating around internally.

I can also whack this into drm-next if this is stuck in this silly
bikeshed.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
