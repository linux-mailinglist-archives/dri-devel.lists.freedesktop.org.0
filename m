Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E8D41D5E3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 11:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE8B6EB49;
	Thu, 30 Sep 2021 09:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AE06EB49
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 09:00:37 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id z2so4025984wmc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 02:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=flCxXByak08cijWbzBN9WhvdxXlXzEfFLzl6AqGDJZs=;
 b=fM5il/NxzkKdCRHHGHghVDEbtogx7+HgSgQaQB4aHv6iMVDwTH6JhuyiMmPAGjchV2
 N31K4RnF80MR5loogiUux/hg1Ez7zEFzeoNcNEBpje1VUII+0FP94UXW/bqdePI6RGQt
 tZpR09Tvh8RjiKXP/h4el322uw8XEcWPTdY/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=flCxXByak08cijWbzBN9WhvdxXlXzEfFLzl6AqGDJZs=;
 b=8Rjuzz3+gLzASXFlY+TMicom2FpO/UtbWiUzSV64hhAunoPx8UCm46A0HsuhKknJxa
 vukQnw0gg497x8ap9pxZRhngr95jYBiVOPKNlpCKF1Acosdz5BrEeSPUqOWvCBrNLe3Z
 ouancW9FCo+oGif94Pn6mVwhbG2vieWMeWNXUsSgZ3jTSi5wy/5c45JWl65q/tmnO4+w
 ZK0MT5UCAWCRngMyQcjGC2Nz4QWY0Zvugq6bfHj555GZ3SFLMWcd9BihHKFPXpAYwpEG
 QbPzb1PTT1Ov3inI7UawrX7LPOkFKKwOuZDQydfT1DCp57kZpKd1I1oAG8QKmNBe1sIS
 K+9A==
X-Gm-Message-State: AOAM531bNJ83zPpWyRtBqbkOsgWM6+gBvmSvQSkuBbZSQSB43yfmI2Mx
 CiPNvejBEB3FbOeZ9PlyuzQIGwo7q49Y8g==
X-Google-Smtp-Source: ABdhPJyCl1pcmpodwQHBOcGp0r+nr8ivNXQ6NfHsvC49NexpRv9w5czxqEUsGVH7MlsZz8HYeLwH8A==
X-Received: by 2002:a05:600c:1911:: with SMTP id
 j17mr1928209wmq.149.1632992436378; 
 Thu, 30 Sep 2021 02:00:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u1sm3951315wmc.29.2021.09.30.02.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 02:00:35 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:00:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v7
Message-ID: <YVV8sVphD5BGeNtA@phenom.ffwll.local>
References: <20210720131110.88512-1-christian.koenig@amd.com>
 <97ea61fb-aa20-5220-8304-e71145cc7587@daenzer.net>
 <9eca7ec8-4a33-4ddb-e4cb-295c1033aa60@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9eca7ec8-4a33-4ddb-e4cb-295c1033aa60@gmail.com>
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

On Wed, Sep 22, 2021 at 01:08:44PM +0200, Christian König wrote:
> Totally forgotten to ping once more about that.
> 
> Michel has tested this now and I think we should push it ASAP. So can I get
> an rb?

		spin_lock_irq(&dmabuf->poll.lock);
		if (dcb->active)
			events &= ~EPOLLIN;
		else
			dcb->active = EPOLLIN;
		spin_unlock_irq(&dmabuf->poll.lock);


This pattern (and same for EPOLLOUT) makes no sense to me. I guess the
intent is that this filters out events for which we're already listening,
but:

- it checks for any active event, not the specific one
- if we're waiting already and new fences have been added, wont we miss
  them?

Or does this all work because the poll machinery restarts everything
again?

I'm totally confused here for sure. The other changes in the patch look
good though.
-Daniel

> 
> Thanks,
> Christian.
> 
> Am 23.07.21 um 10:04 schrieb Michel Dänzer:
> > On 2021-07-20 3:11 p.m., Christian König wrote:
> > > Daniel pointed me towards this function and there are multiple obvious problems
> > > in the implementation.
> > > 
> > > First of all the retry loop is not working as intended. In general the retry
> > > makes only sense if you grab the reference first and then check the sequence
> > > values.
> > > 
> > > Then we should always also wait for the exclusive fence.
> > > 
> > > It's also good practice to keep the reference around when installing callbacks
> > > to fences you don't own.
> > > 
> > > And last the whole implementation was unnecessary complex and rather hard to
> > > understand which could lead to probably unexpected behavior of the IOCTL.
> > > 
> > > Fix all this by reworking the implementation from scratch. Dropping the
> > > whole RCU approach and taking the lock instead.
> > > 
> > > Only mildly tested and needs a thoughtful review of the code.
> > > 
> > > v2: fix the reference counting as well
> > > v3: keep the excl fence handling as is for stable
> > > v4: back to testing all fences, drop RCU
> > > v5: handle in and out separately
> > > v6: add missing clear of events
> > > v7: change coding style as suggested by Michel, drop unused variables
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > CC: stable@vger.kernel.org
> > Working fine with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880
> > 
> > Tested-by: Michel Dänzer <mdaenzer@redhat.com>
> > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
