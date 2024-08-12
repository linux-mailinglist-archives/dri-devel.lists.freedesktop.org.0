Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D58194E968
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 11:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C299D10E065;
	Mon, 12 Aug 2024 09:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="T0MKQE00";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7111D10E065
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 09:11:26 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5a4d5b2c295so338953a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723453885; x=1724058685; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MnloOZCWwiX5CKGS191fHu+q1IiT4sxOmAn35khOuaI=;
 b=T0MKQE00QDXiEBZTejIa5qcxw6kvVInQPeV4LptVkuXLmwqGSJqx5gtOnYdGPhj+Au
 //Udn8HrLyKJ+BaHmlx6uQv9LeGTlQnd5ByomeAW+N5f6Sup8p5INysD08ZqsHBrawK6
 QNnjuT5B9weq703tT6Yvo0GOU/RHZEss0fL3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723453885; x=1724058685;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MnloOZCWwiX5CKGS191fHu+q1IiT4sxOmAn35khOuaI=;
 b=SEkxQCI+3pVAG1YNLkha/UOGIJAuvgorFW5wmF8YoQcdXo1OwW/RpDht1kj0RIftdj
 8EAHmEK54Q7DDz8md0LudZraLRMS41kXs13KZtaOVM5UTN05ORhg/ZiSeYaf50B2aVB7
 1SOkn/jsI2oqjqZo0BWPehIvoSVGzAH2VaiKsYALihY193atrBpvENGkOb8Msy1ETzOQ
 tsvO4Xbc7tbAMCzcPjTIzq04btsRV3FD66yeWFH9AMpUyxbmRpvc5JCjmXRsyxiHPGcv
 kVdsMF6xkVsbuoCvkiw9Igx7Fk0CjUshIH2hoSkU9iwOoXXrVJQGjHqvY/QiEMBIjt0y
 jbpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRDniL2hXv1XzVIXhIyomVZszFgUBC89DmsApduTYCqLNg1oHIgkb+tU42vBSOyIJNVt2QcV/VxvlEGex5uQMwmLDI2eZ6FT4hStkQ+cxN
X-Gm-Message-State: AOJu0YyK9YhAjd8z80v68favA0EAvzvwbP9eEfCdIVx+U/xz3tS7g0Ro
 N0czr5Y5XxfOC+N2S7tHzHKCNTEbvJr7RJUW1HBx/TKhLBKDC8znQX9+Yb0N0Vk=
X-Google-Smtp-Source: AGHT+IFc3VUcbrn+Vx5ZnoCbVMMN4wexmj2zvCi36dfOuIiNdj9nJGrFXnH+LV74yEyoeyxlFrCsHg==
X-Received: by 2002:a17:907:3e82:b0:a80:a13f:3ef7 with SMTP id
 a640c23a62f3a-a80aa163a48mr363911966b.0.1723453884579; 
 Mon, 12 Aug 2024 02:11:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb08fe5dsm211683766b.3.2024.08.12.02.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 02:11:23 -0700 (PDT)
Date: Mon, 12 Aug 2024 11:11:21 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 0/2] Allow partial memory mapping for cpu memory
Message-ID: <ZrnRuRGjxHe5zxuf@phenom.ffwll.local>
References: <20240807100521.478266-1-andi.shyti@linux.intel.com>
 <ZrXZEpplb6YA9T_d@phenom.ffwll.local>
 <ZrXtiBKyCCh0a_ym@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrXtiBKyCCh0a_ym@ashyti-mobl2.lan>
X-Operating-System: Linux phenom 6.9.10-amd64 
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

On Fri, Aug 09, 2024 at 11:20:56AM +0100, Andi Shyti wrote:
> Hi Sima,
> 
> On Fri, Aug 09, 2024 at 10:53:38AM +0200, Daniel Vetter wrote:
> > On Wed, Aug 07, 2024 at 11:05:19AM +0100, Andi Shyti wrote:
> > > This patch series concludes on the memory mapping fixes and
> > > improvements by allowing partial memory mapping for the cpu
> > > memory as well.
> > > 
> > > The partial memory mapping by adding an object offset was
> > > implicitely included in commit 8bdd9ef7e9b1 ("drm/i915/gem: Fix
> > > Virtual Memory mapping boundaries calculation") for the gtt
> > > memory.
> > 
> > Does userspace actually care? Do we have a flag or something, so that
> > userspace can discover this?
> > 
> > Adding complexity of any kind is absolute no-go, unless there's a
> > userspace need. This also includes the gtt accidental fix.
> 
> Actually this missing functionality was initially filed as a bug
> by mesa folks. So that this patch was requested by them (Lionel
> is Cc'ed).
> 
> The tests cases that have been sent previously and I'm going to
> send again, are directly taken from mesa use cases.

Please add the relevant mesa MR to this patch then, and some relevant
explanations for how userspace detects this all and decides to use it.

Also, does xe also support this? If we only add this to i915-gem but xe
doesn't have it, it doesn't make much sense imo.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
