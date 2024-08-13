Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B43950CCB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 21:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3620310E3D8;
	Tue, 13 Aug 2024 19:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b4vlnwux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEC310E3D8;
 Tue, 13 Aug 2024 19:05:15 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-710d0995e21so3815510b3a.1; 
 Tue, 13 Aug 2024 12:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723575914; x=1724180714; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=WgNiWB9SZDb9nWcMjvgw49W8/t0BTluPKcPvC1tsy5g=;
 b=b4vlnwuxcksEHE/g0qJ921WiCbFrPA3v4jSkh+wju2YEjo5oAqT33NGXCIEkN5e1gn
 0axi9CBVInxEGGyyrnhqU5KZ89AH/VSKvqunMDuxFIOqieiosl2MOPVQPC6QJQSLz2XF
 /VEq8AlOeGPJISamUhKpx8i9XztECNOtml6KXJevXuULd12UJKiApU33Y151dfZdce3a
 bL8+ft0XCPu1VZFjJkffPN32lFlkBTnYyZue5QHCjanBeXkgRPZNuqan0m6P7whlpOej
 HZHnyLmUEEmS+fDjqVhgZs5HSgh5TnRHmbkHoFeaq6xBV2TcWJGiOxf/5oZCQ5llM68o
 uwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723575914; x=1724180714;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WgNiWB9SZDb9nWcMjvgw49W8/t0BTluPKcPvC1tsy5g=;
 b=gEtVMS2L0JpHRR/YOoOH6d3zfmSj3YsfSJyYjPFhjxKvCVJTgNHFEXzUbNVpVB4TRn
 4jJik2T0CfUzTi3L3/cXjwzSfxzYvdEc3pUyVKDfD4FkkfIjZLh4INviOyePI1vz1Mt6
 S33SkcVKND/9B3Twng8G7T/fDUvHFVQ6S/vbOx71g0Ah6zYg1wtJJafQB7+J9/4zVoBH
 mCDvBooTKywQOloEB5AjyXs3aVCQCjcfEcYlaGBfMa0iL1gJygcMqfy+M0kb6zlXijiQ
 4+5iLr4/a2io7XAy8wjUztGDP78nQBCnkSHunnBbOj29nQul2xm5mLzlSos1H5ZwderC
 Etng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSCHg8DAu/Yvm1KL3cJmeeCVGAZtRJF/i88ECWUdJWCO3KuUf7EVPCAWoVk7fe3fzSE8RHxjHnycw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn/K3LODKmlaERmEk1wkDdfFYM3Wqj1wXCCIUgPsDZYjBLOh/g
 wQhPodrNbjJ0uEe+4vJDKoeVua7g7ddqMFEZL83hF4P8EXRXBtxm
X-Google-Smtp-Source: AGHT+IHVJmQ4POGxLOqlgPh7wXbwBSSLemXNHHkVwCeCjKZ4H2kOeZMOjyNqYU/16Nc2hKNUdxKUMg==
X-Received: by 2002:a05:6a00:b42:b0:70d:3438:9689 with SMTP id
 d2e1a72fcca58-712670f6bb5mr737937b3a.5.1723575914261; 
 Tue, 13 Aug 2024 12:05:14 -0700 (PDT)
Received: from localhost (dhcp-72-235-129-167.hawaiiantel.net.
 [72.235.129.167]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e5a89e2esm6261217b3a.173.2024.08.13.12.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 12:05:13 -0700 (PDT)
Date: Tue, 13 Aug 2024 09:05:12 -1000
From: Tejun Heo <tj@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangshanlai@gmail.com,
 christian.koenig@amd.com, ltuikov89@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH v3 3/5] workqueue: Add interface for user-defined
 workqueue lockdep map
Message-ID: <ZruuaIPsEH83luku@slm.duckdns.org>
References: <20240809222827.3211998-1-matthew.brost@intel.com>
 <20240809222827.3211998-4-matthew.brost@intel.com>
 <ZruraicqNAvPWGJ1@slm.duckdns.org>
 <ZrusGBG7/EkNlbsk@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrusGBG7/EkNlbsk@DUT025-TGLU.fm.intel.com>
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

On Tue, Aug 13, 2024 at 06:55:20PM +0000, Matthew Brost wrote:
> On Tue, Aug 13, 2024 at 08:52:26AM -1000, Tejun Heo wrote:
> > On Fri, Aug 09, 2024 at 03:28:25PM -0700, Matthew Brost wrote:
> > > Add an interface for a user-defined workqueue lockdep map, which is
> > > helpful when multiple workqueues are created for the same purpose. This
> > > also helps avoid leaking lockdep maps on each workqueue creation.
> > > 
> > > v2:
> > >  - Add alloc_workqueue_lockdep_map (Tejun)
> > > v3:
> > >  - Drop __WQ_USER_OWNED_LOCKDEP (Tejun)
> > >  - static inline alloc_ordered_workqueue_lockdep_map (Tejun)
> > > 
> > > Cc: Tejun Heo <tj@kernel.org>
> > > Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > 1-3 look fine to me. Would applying them to wq/for-6.12 and pulling them
> > from the dri tree work?
> > 
> 
> Yes, I wanted to get this into 6.12 as I believe we are removing
> forceprobe for our driver and it would be good to have this in for that.
> 
> Any idea what this is about though [1]?

It looks like misattribution to me. I'll apply 1-3 to wq/for-6.12.

Thanks.

-- 
tejun
