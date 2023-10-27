Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D287D9A53
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 15:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B3810E97F;
	Fri, 27 Oct 2023 13:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9996D10E97F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 13:46:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32d9d8284abso1351732f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 06:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698414396; x=1699019196; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LIWJWQ8dDmpv0tmsr2VRsMuM56NxlMoPiDiQVDvIk3Q=;
 b=Khx6HxRGKzvcq0gJ1ILFtBPGnkzb1f8TmDmE28uYRjJtPxeCPiUvwiXIiu4y2Oii98
 nzML0/R7M/uHeoE55cyxWsYCJlu7TEz58SepBep//0BavkSvevXvm1s89+a8Jml5CDJI
 or1DAR2mmgFD3R6IjEQ9hB72yC4YL5yu8uC3HvHYxddm0gY1M2+LTO7VYwAYnwabyh0W
 zuV9JtP7YAHgrESsb91fmjv8tykIkaKfQDfj+P2gB29dL9z3dpM0RyGelgFSNAwXZYvs
 orKe3O+lH1w7RzkfVWG3xXczk5h/oRA4rV0gxovvVHO6qft0FHxgdhwrgLuPM8rPr0Uw
 2o9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698414396; x=1699019196;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LIWJWQ8dDmpv0tmsr2VRsMuM56NxlMoPiDiQVDvIk3Q=;
 b=blfksPQ2C0E5knw4moKPbQDZGBYXkc/TPWEkpIkSbiIP1PyGnw6nDoqEpRJewkGe+4
 0fq+MyjQZnHYasg0pAySGQXxKSFdLz4qjwM7xaMB6NKvwOUMI9Sq/8IANXBPPbs9ySM9
 gkjV30JQbJQR6+n4ibl6cQZjzZpDsCEMVuffNMQ3AhTdFoiKrhcaN2dkwgqmKGn4Fj1i
 XF1o19ktV1tspa/ZvQvYNCrUQxuBUeccQ8nvRFQYkXZ+CoeXVhTbvjp3KHIqpthcFAL6
 o5fGJr3WidpLax2jb+akUKIopshpwbwmlZPL/dJjetGm1wAA9BTPHjbP3OgTo241ThKh
 RmoA==
X-Gm-Message-State: AOJu0YwEeVvJEE9It+66+uc/a5zd7OlR8klHxFcjNvm/e3zHhES4FjLZ
 TB9WAfJzsuFWzUjChEDbka/uLQ==
X-Google-Smtp-Source: AGHT+IEp0oa4HEMtzel7hqCYC50VHYcvdaqnV5n/jeQ4f6VWajLYqbnFydCsjgfXSi7C0Jty3wRm9A==
X-Received: by 2002:adf:f948:0:b0:32d:a243:a30e with SMTP id
 q8-20020adff948000000b0032da243a30emr1871619wrr.1.1698414395958; 
 Fri, 27 Oct 2023 06:46:35 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 p1-20020a5d68c1000000b0032db8f7f378sm1783430wrw.71.2023.10.27.06.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 06:46:35 -0700 (PDT)
Date: Fri, 27 Oct 2023 16:46:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 kunit-dev@googlegroups.com
Subject: Re: [bug report] drm: Warn about negative sizes when calculating
 scale factor
Message-ID: <53c4a031-74d1-4b1f-a4d8-948a9ccbbbba@kadam.mountain>
References: <c7f0fd2f-a48d-4120-9291-a0cc58faadce@moroto.mountain>
 <2ad54714-b1b2-4454-95d4-c46fae4c9404@kadam.mountain>
 <ZTJquc5Gtu2fg4GV@intel.com>
 <0c9bcb53-e8b5-4b40-9010-51cc145ec4ab@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c9bcb53-e8b5-4b40-9010-51cc145ec4ab@kadam.mountain>
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
Cc: kv-team <kv-team@linaro.org>,
 Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>,
 Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org,
 Naresh Kamboju <naresh.kamboju@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 20, 2023 at 05:11:24PM +0300, Dan Carpenter wrote:
> On Fri, Oct 20, 2023 at 02:55:37PM +0300, Ville Syrjälä wrote:
> > On Fri, Oct 20, 2023 at 02:39:04PM +0300, Dan Carpenter wrote:
> > > On Wed, Oct 18, 2023 at 05:17:42PM +0300, Dan Carpenter wrote:
> > > > drivers/gpu/drm/drm_rect.c
> > > >    134  static int drm_calc_scale(int src, int dst)
> > > >    135  {
> > > >    136          int scale = 0;
> > > >    137  
> > > >    138          if (WARN_ON(src < 0 || dst < 0))
> > > >                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > These days, with automated fuzz testing, this WARN_ON() is problematic.
> > > > WARN() is considered a kernel bug, and pr_warn() is the hip new way to
> > > > alert the user about issues.
> > > 
> > > Btw, a lot of people (Greg claims it's the majority of Linux users)
> > > these days have run kernels with panic on warn enabled so that's another
> > > reason to avoid using WARN_ON() for stuff that it known to be possible.
> > 
> > This is not possible, unless there is a serious bug somewhere else.
> 
> Ah.  That's fine then.  This is kunit which is deliberately triggering
> the WARN_ON().  The KASAN testing also deliberately triggers WARN_ON()s
> so it's a necessary thing.
> 
> I just wonder if there is some way to mark these kinds of warnings as
> expected.  Perhaps we could add a comment in the kunit test?

Is there some kind of tool which looks at a dmesg and can separate out
the intentional stack traces from the others?

regards,
dan carpenter

