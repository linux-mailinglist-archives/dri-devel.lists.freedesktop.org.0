Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FC216EC6E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 18:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24DB89F55;
	Tue, 25 Feb 2020 17:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482A089F55
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 17:23:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j7so3187559wrp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 09:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Q0WzriZsFeVLIxkq9afAMphlm+5DTXv3n7yz9mov8+A=;
 b=Hmc6WuL00hZv2jb8Vwl1vSwrvg91tQManOHfCkd47lj3Hf7LWjepSA6LmQVFeJjWMA
 nacoG8L9c4rboXqrEFgbUYFPSyzQbUzBMH7cJlMPwmq7XD7/E+oqLBbIk++jg/UpKYhh
 XJf0dBgQn3ZPUBx6aOohEqq+LubuadGkEk2CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Q0WzriZsFeVLIxkq9afAMphlm+5DTXv3n7yz9mov8+A=;
 b=II1RgtI5MpHYjiHToey9fuIdRxNpSj767i6RCmh3pmk/szkMo5gsOwHfkMEmEM9wvD
 AVznqjdXoH/YTjAWm8bw3/X6DxJvH2+4GkUCQF8MCDUeZhs6uyvUXq0BamwNGKLlP/yA
 AyR8XhlRR6AUlZa0QxpdrS4wamtlW9a8wzjTq8b4DRsTmMGg0lt7NhIJLAuCe7Rja/Cq
 hL+g8YAi+GAQ78yoS7x7MNS/8gQ36FHUwCW5hko31zBfMRdedIwxV24XMfWFgXBWKnfb
 gaxXDYVuFsQN5Y4mz0VxoKkamH0BqPp8XxkB7iqKcf+c/lTI9TuWiVQ+TZcmFxfP0KYE
 iCxQ==
X-Gm-Message-State: APjAAAUlZbZ8NIG0Rg4+TFJHAlAzZT5HQBy8MfOam+hvCr7nROHmRd4P
 xKLTr6P2kOHhNcb3PEF26nWQFg==
X-Google-Smtp-Source: APXvYqyueg8icESGjchlrOzRrpEI++U3QqkMRcs7pu5XOQQNwkG3Qkqb4n0mrz6qn+aH/BHeXNmz5A==
X-Received: by 2002:adf:f6d0:: with SMTP id y16mr221613wrp.140.1582651437912; 
 Tue, 25 Feb 2020 09:23:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z133sm5020423wmb.7.2020.02.25.09.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:23:57 -0800 (PST)
Date: Tue, 25 Feb 2020 18:23:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-buf: Fix missing excl fence waiting
Message-ID: <20200225172355.GO2363188@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
References: <B737F1D5-292E-4FE2-89A5-6EF72CB3EED1@amd.com>
 <7a2eb42a-2dd9-4303-3947-6bbb4de7a888@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a2eb42a-2dd9-4303-3947-6bbb4de7a888@amd.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 23, 2020 at 01:04:15PM +0100, Christian K=F6nig wrote:
> Am 23.02.20 um 12:56 schrieb Pan, Xinhui:
> > If shared fence list is not empty, even we want to test all fences, exc=
l fence is ignored.
> > That is abviously wrong, so fix it.
> =

> Yeah that is a known issue and I completely agree with you, but other
> disagree.
> =

> See the shared fences are meant to depend on the exclusive fence. So all
> shared fences must finish only after the exclusive one has finished as we=
ll.
> =

> The problem now is that for error handling this isn't necessary true. In
> other words when a shared fence completes with an error it is perfectly
> possible that he does this before the exclusive fence is finished.
> =

> I'm trying to convince Daniel that this is a problem for years :)

I thought the consensus is that reasonable gpu schedulers and gpu reset
code should try to make really, really sure it only completes stuff in
sequence? That's at least my take away from the syncobj timeline
discussion, where you convinced me we shouldn't just crash&burn.

I think as long as your scheduler is competent and your gpu reset tries to
limit damage (i.e. kill offending ctx terminally, mark everything else
that didn't complete for re-running) we should end up with everything
completing in sequence. I guess if you do kill a lot more stuff, then
you'd have to push these through your scheduler as dummy jobs, i.e. they
still wait for their dependencies, but then all they do is set the
dma_fence error and complete it. Maybe something the common scheduler
could do.
-Daniel

> =

> Regards,
> Christian.
> =

> > =

> > Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> > ---
> >   drivers/dma-buf/dma-resv.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> > =

> > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > index 4264e64788c4..44dc64c547c6 100644
> > --- a/drivers/dma-buf/dma-resv.c
> > +++ b/drivers/dma-buf/dma-resv.c
> > @@ -632,14 +632,14 @@ static inline int dma_resv_test_signaled_single(s=
truct dma_fence *passed_fence)
> >    */
> >   bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
> >   {
> > -	unsigned seq, shared_count;
> > +	unsigned int seq, shared_count, left;
> >   	int ret;
> >   	rcu_read_lock();
> >   retry:
> >   	ret =3D true;
> >   	shared_count =3D 0;
> > -	seq =3D read_seqcount_begin(&obj->seq);
> > +	left =3D seq =3D read_seqcount_begin(&obj->seq);
> >   	if (test_all) {
> >   		unsigned i;
> > @@ -647,7 +647,7 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *ob=
j, bool test_all)
> >   		struct dma_resv_list *fobj =3D rcu_dereference(obj->fence);
> >   		if (fobj)
> > -			shared_count =3D fobj->shared_count;
> > +			left =3D shared_count =3D fobj->shared_count;
> >   		for (i =3D 0; i < shared_count; ++i) {
> >   			struct dma_fence *fence =3D rcu_dereference(fobj->shared[i]);
> > @@ -657,13 +657,14 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *=
obj, bool test_all)
> >   				goto retry;
> >   			else if (!ret)
> >   				break;
> > +			left--;
> >   		}
> >   		if (read_seqcount_retry(&obj->seq, seq))
> >   			goto retry;
> >   	}
> > -	if (!shared_count) {
> > +	if (!left) {
> >   		struct dma_fence *fence_excl =3D rcu_dereference(obj->fence_excl);
> >   		if (fence_excl) {
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
