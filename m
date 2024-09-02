Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771659685E1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 13:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06E610E299;
	Mon,  2 Sep 2024 11:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="eWahMrwF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA7F10E298
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 11:13:38 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42bb81e795bso33321075e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 04:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725275616; x=1725880416; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LnfCLTwwtLyGWRdEuSUyuc6s9oHiX9QCst9I+RtLHqk=;
 b=eWahMrwF5Y1RY/Y+6rCSVo1IY3jCc3dVQrhdNkSOYwIuyMZPnNGUs88z1TzD+tyx2o
 1HM9r/+SIC/C2I+/H1IMM/Aa13XAjreyRy3y44am90qBIahFcdCpXu8IWN27Z36FkMsY
 Fj1uVXgdv4EsljT9rn/luTV+rY24tYTmx6KUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725275616; x=1725880416;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LnfCLTwwtLyGWRdEuSUyuc6s9oHiX9QCst9I+RtLHqk=;
 b=pUX61Oc5w115xwR6iVA0GWlyS3FmenbijVrVs7koXJk1gzUebwrwWim1Euqt9e6aC7
 mf/joyN+qmLkI+GRRBPD50fg58ZVmBglte1hvq8epWte837QA7N8HRIVThq8gd4rqSHq
 0mP7n/oyM9VGU1RIjnRJI1nkMJEr/TteGTd3GI1LLS0JtnFcJrVCaQpRJVrSqPyEBde7
 5EpnWEZ71+DptcrDV3iMNTE5Y8uQbZaQ3SFDG4FrZPb2aPN2SQHy3MIqv/RgQPUOCt8L
 VMsc+0qHE/tOLRoqw0/s/zhvhbGN0C/aqkxdirLUU3DGnMOAiVw+Sd2Qg028vIUImHdn
 B4HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAtzdTs8iLTtHqbB0dBMUMg/AK4r+Ingc1n0UHtsrbYm0xkEEMYlCjFgho1jfi8s8+fXo2svW7TDk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRer/iNQP7aB0iQDm1PxIYQ4Ajsw7xCQ6A5PBJ8w7NNM8Orqjh
 wScyw8JTAYXsgHdJU9/PuoSGc2OQOaK4m+AgeKV/ZhBvVuSkxCpH5ethhqlRPvPn4jxeWlT6KAN
 O
X-Google-Smtp-Source: AGHT+IG40T4YNpa0Ar0Qn9waQeKXCWKcFV47Fgap1uRCEkvH0JzpWsZkM6SyPt8TueXKpy0p93VOsA==
X-Received: by 2002:a05:600c:3b93:b0:426:5e0b:5823 with SMTP id
 5b1f17b1804b1-42bbb44114emr78512405e9.34.1725275616047; 
 Mon, 02 Sep 2024 04:13:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6deb3efsm135381745e9.6.2024.09.02.04.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 04:13:35 -0700 (PDT)
Date: Mon, 2 Sep 2024 13:13:33 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v3 00/15] CCS static load balance
Message-ID: <ZtWd3QwBwzmOZCDr@phenom.ffwll.local>
References: <20240823130855.72436-1-andi.shyti@linux.intel.com>
 <Zs4NaUgcDhcBb4Ok@phenom.ffwll.local>
 <Zs7dv57piSIj3Og4@ashyti-mobl2.lan>
 <Zs8qaZftGbq7Ls00@phenom.ffwll.local>
 <Zs9D0WpVLpZviBNg@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zs9D0WpVLpZviBNg@ashyti-mobl2.lan>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Wed, Aug 28, 2024 at 05:35:45PM +0200, Andi Shyti wrote:
> Hi Sima,
> 
> On Wed, Aug 28, 2024 at 03:47:21PM +0200, Daniel Vetter wrote:
> > On Wed, Aug 28, 2024 at 10:20:15AM +0200, Andi Shyti wrote:
> > > Hi Sima,
> > > 
> > > first of all, thanks for looking into this series.
> > > 
> > > On Tue, Aug 27, 2024 at 07:31:21PM +0200, Daniel Vetter wrote:
> > > > On Fri, Aug 23, 2024 at 03:08:40PM +0200, Andi Shyti wrote:
> > > > > Hi,
> > > > > 
> > > > > This patch series introduces static load balancing for GPUs with
> > > > > multiple compute engines. It's a lengthy series, and some
> > > > > challenging aspects still need to be resolved.
> > > > 
> > > > Do we have an actual user for this, where just reloading the entire driver
> > > > (or well-rebinding, if you only want to change the value for a specific
> > > > device) with a new module option isn't enough?
> > > 
> > > Yes, we have users for this and this has been already agreed with
> > > architects and maintainers.
> > 
> > So my understanding is that for upstream, this only applies to dg2,
> > because the other platforms don't have enough CCS engines to make this a
> > real issue.
> > 
> > Do we really have upstream demand for this feature on dg2 only?
> 
> That's my understanding.
> 
> > Also how hard would it be to make these users happy with xe-on-dg2 in
> > upstream instead?
> 
> I don't know this, I think the user is already on i915.
> 
> > > Why are you saying that we are reloading/rebinding the driver?
> > 
> > That's the other alternate solution.
> 
> But that's not how XE does it, though.
> 
> The use case is that userspace has an environment variable that
> they change ondemand for choosing the CCS mode. They want to
> change the value of that variable on the fly and, as we are only
> adding or removing a few engines, this is done without reprobing
> the whole driver.
> 
> In a previous implementation (from where both I and Niranjana for
> XE took inspiration) the CCS mode was passed during compute
> execbuf.
> 
> > > I'm only removing the exposure of user engines, which is
> > > basically a flag in the engines data structure.
> > > 
> > > > There's some really gnarly locking and lifetime fun in there, and it needs
> > > > a corresponding justification.
> > > 
> > > What locking are you referring about?
> > > 
> > > I only added one single mutex that has a comment and a
> > > justification. If you think that's not enough, I can of course
> > > improve it (please note that the changes have a good amount of
> > > comments and I tried to be aso more descriptive as I could).
> > > 
> > > When I change the engines configurations only for the compute
> > > engines and only for DG2 platforms, I need to make sure that no
> > > other user is affected by the change. Thus I need to make sure
> > > that access to some of the strucures are properly serialized.
> > > 
> > > > Which needs to be enormous for this case,
> > > > meaning actual customers willing to shout on dri-devel that they really,
> > > > absolutely need this, or their machines will go up in flames.
> > > > Otherwise this is a nack from me.
> > > 
> > > Would you please tell me why are you nacking the patch? So that I
> > > address your comments for v4?
> > 
> > So for one, this is substantially more flexible than the solution merged
> > into xe. And the patch set doesn't explain why (the commit messages
> > actualy describe the design xe has).
> 
> I think in XE we might have missed a few things and my plan is to
> check the XE implementation once I'm done with i915 (I was one of
> the XE reviewers). And, many of the things in XE are so different
> that the solution can't be taken as it is.

Please fix XE first. XE is supposed to lead here with all new platform
support and uapi additions, i915-gem is supposed to be completely in
feature freeze. And exceptions need really good reasons.

> > That does not inspire confidence at all.
> 
> Consider that most of the patches are refactoring, only the last
> patch is doing the real job. That's because the first workaround
> was already merged a while ago. While XE didn't need the
> refactorings I made.
> 
> > Second, I don't think anyone understands the entire engine/ctx locking
> > design in i915-gem. And the fix for that was to make as much as absolutely
> > possible immutable. Yes the implementation looks correct, but when I
> > looked at the much, much simpler xe implementation I'm pretty sure I've
> > found an issue there too. Here I can't even tell.
> 
> The locking is fairly simple, when the user wants to set a
> specific CCS mode, I take the wakrefe lock and I check no one is
> holding it. This way I am sure that I am the only user of the GPU
> (otherwise the GPU would be off).
> 
> I added one single lock to be used for the for_each_uabi_engine.
> It's not really required but I really want to be sure that I am
> not changing the CCS mode while someone else is using the uabi
> engines.
> 
> I'm also adding Joonas in Cc with whom I discussed many details
> of the implementation. I would really appreaciate to know what
> exactly is wrong here and what are the necessary changes needed
> to get the series merged.

This is i915-gem. Locking is never simple here, and I think that entire
journey on the mmap confusion shows how little people understand how much
complexity and confusion and i915-gem being special there really is.

You're really not making a good case that you understand this stuff here,
which really doesn't make me enthusiastic about considering an uapi
extension for i915-gem.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
