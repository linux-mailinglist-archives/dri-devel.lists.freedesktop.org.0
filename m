Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 544C17DCFD7
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 16:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3680210E526;
	Tue, 31 Oct 2023 15:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5BD10E518
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 15:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698764510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DXoFKDYmMjs1Yhsyi0bsO2NWVGWU+Gcffefv/dGeE/Q=;
 b=GOrYUmlzzSlpw8/r93y7bL4ulObf6nlI1hhPHsQ4oLxPkUSZCtrXBbC8rW1veWcaSP0kHs
 XmCrffDRC3HS+d67uRp+C7Zp0Lmh4flaeFzgLM/Lk+X23ar5LjL/KLLqn2FR57UsJRVb/B
 Mkulvqy4FF5BJJ00aBbmmaP7T9uyzOw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-OcE_Flm9O1qRKP3SNThh_g-1; Tue, 31 Oct 2023 11:01:48 -0400
X-MC-Unique: OcE_Flm9O1qRKP3SNThh_g-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-53dfe3af1b9so4527553a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 08:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698764506; x=1699369306;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DXoFKDYmMjs1Yhsyi0bsO2NWVGWU+Gcffefv/dGeE/Q=;
 b=mVZf1VAuEGInF2HnCcblmzn1xyWV5FFFUo5nI9ooePA7QAInjndrlKSK6nNwqz5iKG
 BbSchGz+wuLqnrmMlasFVSKItJwWKA+F7GG65G6F6oQQY1S/xBxUxNnRK3rhmqCX6/w/
 Ctyee9H6KA3xrC3h1FTkhNQq7WNZ2yqoSvgcsrN0Q6mqCDf9WgAxOllRZPHt9rt0uRn3
 7sql+30dlFYFLhz4aX9zH4VUExlHtRilne95BSH/5KJF8lsgIG+zbZ+iFuJv3U6Cxfs0
 q3NrOLzVvlxV/cqNhPuQLV2MYVfI+UEwllUBSWPXECgtqqHrVqk09ExuBobPSJc+I1HT
 hgWA==
X-Gm-Message-State: AOJu0YzFDr7zqK9h7K0IKLe9x/bMbIRKFKulFlVnSMrZXf7xWyNjdl0L
 bGX6dNn1I9NOimczZkgZUFHBBSrKErMjM0w33StSJ01xGpLCplE3IkGy+/BNvbExqOg/1sHEQds
 SMVOOuTMt0SY1ciWOVepE+NbX/37H
X-Received: by 2002:aa7:c2cf:0:b0:540:54ef:43fd with SMTP id
 m15-20020aa7c2cf000000b0054054ef43fdmr10503071edp.34.1698764506678; 
 Tue, 31 Oct 2023 08:01:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuqkldToHheow1GniVmtkiLXlIK/EbWhltsj5NgbydGarbsYVpOhHsbgv/mWdG1dO0mzovzw==
X-Received: by 2002:aa7:c2cf:0:b0:540:54ef:43fd with SMTP id
 m15-20020aa7c2cf000000b0054054ef43fdmr10503041edp.34.1698764506255; 
 Tue, 31 Oct 2023 08:01:46 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 d29-20020a50f69d000000b00522828d438csm1305672edn.7.2023.10.31.08.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 08:01:45 -0700 (PDT)
Date: Tue, 31 Oct 2023 16:01:42 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Message-ID: <ZUEW1mxwGO3bxxGM@pollux>
References: <20231027093238.2ff8172e@collabora.com>
 <ff389793-1226-49fd-b599-07dbda0b97be@amd.com>
 <20231027093943.3f0ae992@collabora.com>
 <98988459-25a8-4ee0-89d4-cb816cbc5bef@amd.com>
 <20231027102237.0cdb85af@collabora.com>
 <190e3ab7-6440-4d41-a79f-5dd4b7d3ca52@amd.com>
 <20231027121707.414810d6@collabora.com>
 <ffb8ff87-a555-42d2-aef1-a21069282227@amd.com>
 <ZT/uPhLK7gan61Ns@pollux>
 <e9c6af32-8d2a-4f04-9c12-1170a3aa1236@amd.com>
MIME-Version: 1.0
In-Reply-To: <e9c6af32-8d2a-4f04-9c12-1170a3aa1236@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net,
 Boris Brezillon <boris.brezillon@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 31, 2023 at 02:20:50PM +0100, Christian König wrote:
> Hi Danilo,
> 
> sorry for splitting up the mail thread. I had to fetch this mail from my
> spam folder for some reason.
> 
> Am 30.10.23 um 18:56 schrieb Danilo Krummrich:
> > Hi Christian,
> > 
> > [SNIP]
> > > > And yes, we can live with the overhead of making jobs
> > > > slightly bigger than they actually are, thus potentially delaying their
> > > > execution. It's just that I don't quite understand the rational behind
> > > > this conservatism, as I don't really see what negative impact this extra
> > > > ->update_job_credits() call in the credit checking path has, other than
> > > > the slight overhead of an if-check for drivers that don't need it.
> > >  From experience it showed that we should not make the scheduler more
> > > complicated than necessary. And I still think that the ring buffers only
> > > need to be filled enough to keep the hardware busy.
> > Right, and this callback contributes to exactly that.
> > 
> > I don't really think there is much to worry about in terms of introducing more
> > complexity. The implementation behind this callback is fairly trivial - it's
> > simply called right before we check whether a job fits on the ring, to fetch
> > the job's actual size.
> > 
> > I would agree if the implementation of that would be bulky, tricky and asking
> > for a compromise. But, since it actually is simple and straight forward I really
> > think that if we implement some kind of dynamic job-flow control it should be
> > implemented as acurate as possible rather than doing it half-baked.
> 
> Yeah, I see the intention here and can perfectly relate to it it's just that
> I have prioritize other things.

I don't see any work being required from your side for this.

> 
> Adding this callback allows for the driver to influence the job submission
> and while this might seems useful now I'm just to much of a burned child to
> do stuff like this without having a really good reason for it.

It does influence the job submission in the exact same way as the initial credit
count set through drm_sched_job_init() does. There is absolutely nothing with
this callback a driver couldn't mess up in the exact same way with the initial
credit count set through drm_sched_job_init(). Following this logic we'd need to
abandon the whole patch.

Hence, I don't really understand why you're so focused on this callback.
Especially, since it's an optional one.

> 
> > > If this here has some measurable positive effect then yeah we should
> > > probably do it, but as long as it's only nice to have I have some objections
> > > to that.
> > Can't answer this, since Nouveau doesn't support native fence waits. However, I
> > guess it depends on how many native fences a job carries. So, if we'd have two
> > jobs with each of them carrying a lot of native fences, but not a lot of actual
> > work, I can very well imagine that over-accounting can have a measureable
> > impact.
> 
> What I can imagine as well is things like the hardware or firmware is
> looking at the fullness of the ring buffer to predict how much pending work
> there is.
> 
> > I just wonder if we really want to ask for real measurements given that the
> > optimization is rather trivial and cheap and we already have enough evidence
> > that it makes sense conceptually.
> 
> Well that's the point I disagree on, this callback isn't trivial. If (for
> example) the driver returns a value larger than initially estimated for the
> job we can run into an endless loop.

I agree it doesn't make sense to increase, but it wouldn't break anything,
unless the job size starts exceeding the capacity of the ring. And this case is
handled anyway.

> 
> It's just one more thing which can go boom. At bare minimum we should check
> that the value is always decreasing.

Considering the above I still agree, such a check makes sense - gonna add one.

- Danilo

> 
> Christian.
> 
> > 
> > - Danilo
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > Regards,
> > > > 
> > > > Boris

