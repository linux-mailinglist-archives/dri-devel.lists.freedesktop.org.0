Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D4148EE35
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 17:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF1E10E891;
	Fri, 14 Jan 2022 16:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD9210E891
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 16:35:04 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so6729155wme.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 08:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=zGlBq5g8ptXdKqtDPcUnhTEEW/MEdyIn3q+yGm9ho3g=;
 b=ckXWl+PtxcOsT0oSIvB6y5mLpkZddQA/u3ayFbKYoRbW1fj6yKJ6DCV9Y3nGdmuuYw
 lUwY6qhx2wx/nUfw61/7J3Q1EebwAmtRIa92UFg2MxoZZjMlswrP8NwJN+g1Le4ca09B
 LWcsVXQzyXmD5eHETwtBpuXNQ2fadfoX0HTMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zGlBq5g8ptXdKqtDPcUnhTEEW/MEdyIn3q+yGm9ho3g=;
 b=VPosiFLoACbzwZ1mbbku4t3tnTzR9lwWghgW06JdEqF7cNL6bJknIYdoxiCY/ntohc
 1mv2OpzlIfuDAsuuPHM+Rly6J+zy08oAeKQbNAX9YvVIyuwuzGZCivYYkmR4h7VdvE9+
 SaeZ6Sbn61Cd61iaqFR8CCskgGErE+QNwGGf1tdKk8mlCFVBy4ialLRAhC2Vd7eTQLGo
 2XmmixRFwKwboE3/0a1xDjy223ZIPeJ3oo1ad1dAKJ5FnrcK0B3OIdFrMo3LU30B8vTI
 S0iJlXboX2WZeNzfj38+nbxwwikxcZLpUG5+lffv05jwfd3HOaIleMaFRrrWNVZdLWJK
 ngoA==
X-Gm-Message-State: AOAM533C3NfGxKutL9uWz4JuQf5mLj+HQ6OCrVHAyRDFUF0I7YWe7iVU
 GSMGkLHuHjhSbtML0sx8IH/qWw==
X-Google-Smtp-Source: ABdhPJyJ3GXKxktqyZcpdYltCojGpZn7yTTN1XfRK3SbwOwOd76JQriZwRXbLy+Jcv1d26j6z74Nnw==
X-Received: by 2002:a05:600c:3b0e:: with SMTP id
 m14mr16041188wms.130.1642178102656; 
 Fri, 14 Jan 2022 08:35:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o38sm6350798wms.11.2022.01.14.08.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 08:35:02 -0800 (PST)
Date: Fri, 14 Jan 2022 17:35:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: completely rework the dma_resv semantic
Message-ID: <YeGmNGuKtNDYNmsj@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <e8c7284f-e18e-0dcc-f0a2-3a1ad6222fd4@gmail.com>
 <YcOkB0Jlc5KsHnEN@phenom.ffwll.local>
 <c63e62cc-e48e-2e81-571c-498e4d16fd21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c63e62cc-e48e-2e81-571c-498e4d16fd21@gmail.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 23, 2021 at 10:11:20AM +0100, Christian König wrote:
> Am 22.12.21 um 23:17 schrieb Daniel Vetter:
> > On Fri, Dec 17, 2021 at 03:39:52PM +0100, Christian König wrote:
> > > Hi Daniel,
> > > 
> > > looks like this is going nowhere and you don't seem to have time to review.
> > > 
> > > What can we do?
> > cc more people, you didn't cc any of the driver folks :-)
> 
> Well I've CCed more people and lists and the first round of the patches.
> Just wanted to get some more comments from you first before widening the
> audience.

Ime it's good to just always spam driver authors on big stuff like this,
increases the odds more folks get involved. And in the end we need the
entire subsystem to understand this (or at least not accidentally break
the rules you roll out now like we've done in the past).

Plus you'll get the driver acks faster that way :-)
-Daniel


> > Also I did find some review before I disappeared, back on 10th Jan.
> 
> Good, then I have at least something todo for the first week on January.
> 
> Happy holidays,
> Christian.
> 
> > 
> > Cheers, Daniel
> > 
> > > Thanks,
> > > Christian.
> > > 
> > > Am 07.12.21 um 13:33 schrieb Christian König:
> > > > Hi Daniel,
> > > > 
> > > > just a gentle ping that you wanted to take a look at this.
> > > > 
> > > > Not much changed compared to the last version, only a minor bugfix in
> > > > the dma_resv_get_singleton error handling.
> > > > 
> > > > Regards,
> > > > Christian.
> > > > 
> > > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
