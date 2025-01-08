Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A62A062BF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 17:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4432B10E0CB;
	Wed,  8 Jan 2025 16:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RmNN5Mml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1D110E0CB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 16:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736355453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U+dseHz9of1tah3XVTWeJrQLPKF7gIMhc+ynWcdAcAw=;
 b=RmNN5MmlC/LsNFsgJ947FP2nAKh8v5Hnbv2KXbGORZw0/Nw0635JimYSX7KrYqZvj3Q0BB
 d1BSoSHEa+O5G1Ok6oAi+8Jr8FGO963Y/NKlSOw/Tn56B2OqpG1ePMSmcLfuSXW9BikuGY
 rbwoK3RjUFzNownIYh3LziyDrrwrVZ8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-YWDGtxBzNOefQ5JMzJqO0Q-1; Wed, 08 Jan 2025 11:57:29 -0500
X-MC-Unique: YWDGtxBzNOefQ5JMzJqO0Q-1
X-Mimecast-MFC-AGG-ID: YWDGtxBzNOefQ5JMzJqO0Q
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43623bf2a83so480355e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 08:57:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736355448; x=1736960248;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U+dseHz9of1tah3XVTWeJrQLPKF7gIMhc+ynWcdAcAw=;
 b=CVj3KcIguOCBybdajribtUkAt4Ths37lq53lcnEJAd0tK1HfTqVYq/U7hB4uD1y9kX
 PIYr37cQkVzrbDIRKf/kpvp+9z6+tVz9jvvCgw3Iajm5ZBNNzas1LZNKl6912mQs+ZIC
 WCIkhPgUIhjbfO289LBD2DiXHuXqcAfePHXfD8l4iU85PhsjfDhhvQ3FsjRp5MKxbZeT
 Qpers4vhBMdTIsTgPJIU9SPGVKqFBgz5J4TKFohqscu9NIPNF/uBt+4/Rm5EXCAxyucA
 Ex7sY6CNcw4GJ5WH9qszYUzYj1uyuTWf4mbbsxP1YXmSAtjhcsKV9CXQdWnLqlyjMrM2
 Hu+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvdMdgdoDSwaxWjj6vbLNh2qLRGj2MlEGQsFqlgnU6F3G2RFaqgCyLBY+6eY8iOpzKwAIa3JTUru4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiBdC9Xd0JJadZstmlCw318XAWzibRL5SVSwCtM/zoJT7tKZGu
 94jM0Mz1eSMqX2EXJ/9YMWE9MLbaxRzOO6EgKvoGPLph8q7xx3X2JZs3WVKqoeLC+o3UCM8dnB4
 pYWkA7O3aZB12BaqRybexdbYrw0ySAkE5lPLiLg7Ez7l78vLZTP3oxHFJhJO8RdK4Vw==
X-Gm-Gg: ASbGncvQ1LTntGmBF/ufV7UiN1oPjm0cA87x6g+1wtjkPfuH/hx+4rPY3VSj23r4v2T
 bU1QdmkXMXMN9i/Fgl2zGyH6u10R4Ec5POwxRaO69ObQqPnquShlUlcjZAF/cr8w4VbRf05+DRn
 Q9ipkBIvKbuycXi53/tsdjVAc/H1LI6pDxd1vfmwa7EVeKUwWMA9FTue6Jejil5Cw2B9BVb+Q+o
 ocvhH1NWdgamZvhXpgwuRIlLrjT9Ype1PbE/g67ecCBDA==
X-Received: by 2002:a05:600c:3c94:b0:434:fd15:3ac9 with SMTP id
 5b1f17b1804b1-436e26e2563mr27734255e9.22.1736355448626; 
 Wed, 08 Jan 2025 08:57:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfz92Ru5aTwjl92Y07MRjBcug0FgAxJWvbz8Us+rCTRzZbqhCAXiAJeTiE3IdGonRywsgRfQ==
X-Received: by 2002:a05:600c:3c94:b0:434:fd15:3ac9 with SMTP id
 5b1f17b1804b1-436e26e2563mr27733975e9.22.1736355448209; 
 Wed, 08 Jan 2025 08:57:28 -0800 (PST)
Received: from pollux ([2a00:79c0:618:8300:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e21c61sm27137845e9.37.2025.01.08.08.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 08:57:27 -0800 (PST)
Date: Wed, 8 Jan 2025 17:57:25 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: Re: [RFC 00/14] Deadline scheduler and other ideas
Message-ID: <Z36udQs86Mn1-T5p@pollux>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <Z3433G3-_aIMqJbt@pollux>
 <f7c333dd-6c6e-43ad-8879-8e9ccc374f5c@igalia.com>
MIME-Version: 1.0
In-Reply-To: <f7c333dd-6c6e-43ad-8879-8e9ccc374f5c@igalia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: euqyRc0APb9YRl_XHZGXWGPbck7Bnn7nLtTl1gBwXg0_1736355449
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Wed, Jan 08, 2025 at 03:13:39PM +0000, Tvrtko Ursulin wrote:
> 
> On 08/01/2025 08:31, Danilo Krummrich wrote:
> > On Mon, Dec 30, 2024 at 04:52:45PM +0000, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > 
> > "Deadline scheduler and other ideas"
> > 
> > There's a few patches that could be sent outside the scope of this series, e.g.
> > the first one.
> > 
> > I think it would make sense to do so.
> 
> For now I'll keep them at the head of this RFC and as they get acked or
> r-b-ed I can easily send them standalone or re-ordered. Until then having
> the series separate would make the RFC not standalone.
> 
> > > <tldr>
> > > Replacing FIFO with a flavour of deadline driven scheduling and removing round-
> > > robin. Connecting the scheduler with dma-fence deadlines. First draft and
> > > testing by different drivers and feedback would be nice. I was only able to test
> > > it with amdgpu. Other drivers may not even compile.
> > 
> > What are the results from your tests with amdgpu? Do you have some measurements?
> 
> We already covered this in the thread with Philipp to a degree. Tl;dr; the
> main idea is whether we simplify the code and at least not regress.
> 
> I don't expect improvements on the amdgpu side with the workloads like games
> and benchmarks. I did not measure anything significant apart that priorities
> seem to work with the run queues removed.

I appreaciate the effort, and generally I like the idea, but I also must admit
that this isn't the most convincing motiviation for such an integral change
(especially the "at least not regress" part).

I'd still like to encourage you to send the small cleanups separately, get them
in soon and leave the deadline scheduler as a separate RFC.

Meanwhile, Philipp is working on getting documentation straight and digging into
all the FIXMEs of the scheduler getting to a cleaner baseline. And with your
cleanups you're already helping with that.

For now, I'd prefer to leave the deadline scheduler stuff for when things are a
bit more settled and / or drivers declare the need.

> 
> Where something could show is if someone is aware of a workload where normal
> prio starves low. Since one part of the idea is that with the "deadline"
> scheme those should work a little bit more balanced.
> 
> Also again, feedback (including testing feedback from other drivers) would
> be great, and ideas of which workloads to test.

Unfortunately, there's not much I can tell from the Nouveau side of things,
since we're using the firmware scheduler scheme (one entity per scheduler) and
hence the scheduling strategy isn't that relevant.

> 
> Btw I will send a respin in a day or so which will clean up some things and
> adds some more tiny bits.
> 
> Regards,
> 
> Tvrtko

