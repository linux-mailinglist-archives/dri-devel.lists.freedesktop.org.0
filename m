Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ACB912C59
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 19:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C0310EDA5;
	Fri, 21 Jun 2024 17:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Sxm7qTrk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F01E10ED9D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 17:18:38 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42111cf2706so2887785e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 10:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718990316; x=1719595116; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/iOhH9ELu+12xGcXQS8TuIp1J4dzvXSVjG6icQwhcNY=;
 b=Sxm7qTrkhx5l+Ff154yykG1goTvwEpKWPtwgeXScp+Xqs7OVG38eaFg8fX6vrBvDNN
 Y6l0OmtjTxWYZPqLgA4wLEW9t3c1rgGlAb5SE1wYhhTCsx9pA/v3IF/TIw13qPBKff2y
 3/bvgh8GSTlztyn+/kRNu2ZGW0dn8a3m6sEZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718990316; x=1719595116;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/iOhH9ELu+12xGcXQS8TuIp1J4dzvXSVjG6icQwhcNY=;
 b=oy4ENy1HpELgkjoeflhsHjIJapV5nIvKlwQWgCQwK2ym2DTdekQxscmtSixYGQXxgG
 6G4kyfUBzbzF2ezA1M6ZkvX4WWsAo8XLOhlwJUV2/+xZKjFsK+tX09dzGHXZVfvRmwfU
 HqD+4gw7FRRYnhxNgjarC8kH0GjvjzDttPe0SEBJq6/aA5qtiVw4Z6FT19Y01bmtSptv
 tCEqwt0MFBTS4OMnXilPhNU+qbLPuwiSPT8P+AP3pF4YQJkOkFFse2DPrTQKBbOEcatX
 IFB/Fjt+VxJB6Avrip9SX9Nepd2bjWGbjFi4U+EwgzcEdJjeR/AN9zSxhGsbKtWLDiJi
 lnJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBI2jWO7Nn0zAx1tjxbHVpQmEXWuLS2gIV7CM76Mh5wZhdHwyWqAuQy/5yQmlgNXAv6dcvXBobInedvm+Zw8QYNAtn+9euZDzUX6riFIMN
X-Gm-Message-State: AOJu0YwxbxJGLT7m0B3WHpZUi2sMW7dj4YRYTW6B1Gh7dIKifHQqv3+b
 3NDrNnV0lOBV03F8dp7QPMHD9Re5UY9+MOhWPVOOINulca6uPQBvSrtWrfdGAPA=
X-Google-Smtp-Source: AGHT+IFx3aU2BEmg+ab52WInhyB+dvVFevNYrrhElnTCPaO7QlzXIfUWlXaH/TRsnea0P5pmZeKaEg==
X-Received: by 2002:a05:600c:511d:b0:423:445:4aad with SMTP id
 5b1f17b1804b1-42475016e88mr66473175e9.0.1718990316471; 
 Fri, 21 Jun 2024 10:18:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424819227a8sm38852435e9.48.2024.06.21.10.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 10:18:36 -0700 (PDT)
Date: Fri, 21 Jun 2024 19:18:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Brian Starkey <brian.starkey@arm.com>,
 "Hoosier, Matt" <Matt.Hoosier@garmin.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, nd@arm.com,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: Correct sequencing of usage of DRM writeback connector
Message-ID: <ZnW16o_d7m6p0m8J@phenom.ffwll.local>
References: <DM6PR04MB5178398F885B5AD82430B8ECECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
 <ZnBTVCHneR6DQPxX@phenom.ffwll.local>
 <cph4jfd7dy5mxfmnp5iaacxen7zszeiudvpyq4tebgp7fukzzc@xx5m65uwwp6n>
 <5e17dea9-e430-51f5-83f9-ce02241438f8@quicinc.com>
 <cnbiivlsrutjbxw7jeetuyrnm3luvepstlwqxxrzsfhyzlgukk@3jx64owwkv2h>
 <ZnFUg91URIHn_SbR@phenom.ffwll.local>
 <CAA8EJppWq-At2nLTzqg7T5tr-ZR6Sq6dRd9XX0r4MOM2diT30w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppWq-At2nLTzqg7T5tr-ZR6Sq6dRd9XX0r4MOM2diT30w@mail.gmail.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Tue, Jun 18, 2024 at 12:48:13PM +0300, Dmitry Baryshkov wrote:
> On Tue, 18 Jun 2024 at 12:33, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Jun 17, 2024 at 10:52:27PM +0300, Dmitry Baryshkov wrote:
> > > On Mon, Jun 17, 2024 at 11:28:35AM GMT, Abhinav Kumar wrote:
> > > > Hi
> > > >
> > > > On 6/17/2024 9:54 AM, Brian Starkey wrote:
> > > > > Hi,
> > > > >
> > > > > On Mon, Jun 17, 2024 at 05:16:36PM +0200, Daniel Vetter wrote:
> > > > > > On Mon, Jun 17, 2024 at 01:41:59PM +0000, Hoosier, Matt wrote:
> 
> > > > > > If/when we have hardware and driver support where you can use the
> > > > > > writeback connector as a real-time streamout kind of thing, then we need
> > > > > > to change all this, because with the current implementation, there's
> > > > > > indeed the possibility that funny things can happen if you ignore the
> > > > > > notice (funny as in data corruption, not funny as the kernel crashes of
> > > > > > course).
> > > > >
> > > > > Indeed, the wording was added (from what I remember from so long
> > > > > ago...) because it sounded like different HW made very different
> > > > > guarantees/non-guarantees about what data would be written when, so
> > > > > perhaps you'd end up with some pixels from the next frame in your
> > > > > buffer or something.
> > > > >
> > > > > Taking Mali-DP/Komeda again, the writeback configuration is latched
> > > > > along with everything else, and writeback throughput permitting, it
> > > > > should "just work" if you submit a new writeback every frame. It
> > > > > drains out the last of the data during vblank, before starting on the
> > > > > next frame. That doesn't help the "general case" though.
> > > > >
> > > >
> > > > Would it be fair to summarize it like below:
> > > >
> > > > 1) If the same CRTC is shared with the real time display, then the hardware
> > > > is expected to fire this every frame so userspace should wait till this is
> > > > signaled.
> > >
> > > As I wrote in response to another email in this thread, IMO existing
> > > uAPI doesn't fully allow this. There is no way to enforce 'vblank'
> > > handling onto the userspace. So userspace should be able to supply at
> > > least two buffers and then after the vblank it should be able to enqueue
> > > the next buffer, while the filled buffer is automatically dequeued by
> > > the driver and is not used for further image output.
> >
> > Yeah if you want streaming writeback we need a queue depth of at least 2
> > in the kms api. Will help a lot on all hardware, but on some it's required
> > because the time when the writeback buffer is fully flushed is after the
> > point of no return for the next frame (which is when the vblank event is
> > supposed to go out).
> >
> > I think over the years we've slowly inched forward to make at least the
> > drm code safe for a queue depth of 2 in the atomic machinery, but the
> > writeback and driver code probably needs a bunch of work.
> 
> Do you mean handling the queue by allowing userspace to commit 'next' FB_ID?
> 
> I was leaning towards extending the uAPI with something like explicit
> WRITEBACK_FB_ID_QUEUED and WRITEBACK_OUT_FENCE_PTR_QUEUED properties.
> This way once the fence has been reached, the drm_writeback might
> automatically put the old framebuffer, move _QUEUED to normal props
> and then signal the userspace. This way the single-frame writeback
> drivers can support the old API, while allowing cloned-writeback
> drivers to implement the streaming approach. Also, this allows drivers
> to do clever tricks, like forbidding the _QUEUED operation if the
> refresh rate for the writeback connector is too high.

Eh I think we should just allow atomic commits with a queue depth > 1. I
think that's both the cleanest uapi, and also the cleanest on the driver
side, since I just don't want to think about what happens when we have
multiple commits going on at the same time on the same crtc.

On the core/helper side we've tried to get there slowly by explicitly
accessing old/new state and never accessing plane/crtc->state directly.
That's really all that should be needed.

I guess to make things easier for drivers we could do an intermediate uapi
where we allow queue depth, but only for commits that don't require a
modeset, since those tend to be much simpler. Or maybe even allow the
driver to fully control where it can handle a queue depth > 1.

Essentially roughly this, minus all the safety checks we'll probably need
to add in various places. Note: extremely incomplete :-)


diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 63ee81e478b9..31c4e124eb5a 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2136,7 +2136,7 @@ static int stall_checks(struct drm_crtc *crtc, bool nonblock)
 	spin_lock(&crtc->commit_lock);
 	i = 0;
 	list_for_each_entry(commit, &crtc->commit_list, commit_entry) {
-		if (i == 0) {
+		if (i == 1) {
 			completed = try_wait_for_completion(&commit->flip_done);
 			/*
 			 * Userspace is not allowed to get ahead of the previous
@@ -2150,7 +2150,7 @@ static int stall_checks(struct drm_crtc *crtc, bool nonblock)
 
 				return -EBUSY;
 			}
-		} else if (i == 1) {
+		} else if (i == 2) {
 			stall_commit = drm_crtc_commit_get(commit);
 			break;
 		}
@@ -3015,7 +3015,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
 	struct drm_private_obj *obj;
 	struct drm_private_state *old_obj_state, *new_obj_state;
 
-	if (stall) {
+	if (stall && 0) {
 		/*
 		 * We have to stall for hw_done here before
 		 * drm_atomic_helper_wait_for_dependencies() because flip

But I hope it sketches the idea at least.

Cheers, Sima

> 
> 
> > -Sima
> >
> > >
> > > >
> > > > 2) If a different CRTC is used for the writeback, then the composition loop
> > > > for the real time display should not block on this unless its a mirroring
> > > > use-case, then we will be throttled by the lowest refresh rate anyway.
> > >
> > > what is mirroring in this case? You have specified that a different CRTC
> > > is being used.
> > >
> > > >
> > > > > >
> > > > > > If we already have devices where you can use writeback together with real
> > > > > > outputs, then I guess that counts as an oopsie :-/
> > > > >
> > > > > Well "works fine" fits into the "undefined behaviour" bucket, just as
> > > > > well as "corrupts your fb" does :-)
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
