Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C6590044E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 15:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8697610E3B9;
	Fri,  7 Jun 2024 13:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KcnciFwA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9BD10E194
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 13:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717765546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ijh5gOQE/Y+mRRmFMhr0PS9aA4OZEs8muMm2wB2PIjI=;
 b=KcnciFwAubTK8dII/jtU0ykeBRUNve1S3wIhwhpw+ZV9smu1UO160fX+J+MEjyjOzX0HqF
 6WmEpV8l8cJfUSQCZ99xmZLcn7EII8S8CqS0Og8FhofpwPQB8wG6OXf6Q3ymIHxMxStw2m
 QgPm7dQss3vESXsmn/wLoCZqQ4LyYNY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-UN7YLL9oOrOOdm0yHszSeQ-1; Fri, 07 Jun 2024 09:05:41 -0400
X-MC-Unique: UN7YLL9oOrOOdm0yHszSeQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-35f0ec7778bso5831f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 06:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717765540; x=1718370340;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ijh5gOQE/Y+mRRmFMhr0PS9aA4OZEs8muMm2wB2PIjI=;
 b=KfSsx+a3yFncNp9Ngo9MeurwO7dB8QBfxkMsOz4R+OC4NB+2gW+UXvqLc9lfV/8sDm
 7tiVnjLOb4So9yb4wy6Hn+9iG44I3CPp71ppcM7ycHd5UMWUWpOFsXNLsGJxJ0pGZyFb
 r77rx+28PWD2GSLqGCd3UHvkrciz+g5mNaN1e7jdJAHOnhyMbDoX3yDClsCmgtuTqIzg
 9SWQG5UMseduFsKIBYmlo0AnIQ69uRa9XT33yGBNuemj3wQippCeUmOIFbFv1Deek6Um
 63uoaTCV9WkHNmt5aFt1XvcXRTtNegQbVzWK5+X4NauFI5fZPspakKitADO/ERgQ/Xpp
 VVeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1AtFYsm0UmSKWzZmVYjugzEEPQP5Z5Nsl2F0PKYz7kva1wLY2UyF1nZinORe++GB6Pl37yW5+E0af4mjFNZwhDS/k37EQQmLM0MTg2V0l
X-Gm-Message-State: AOJu0Yx387XKUGW7ZTuvNzq9gU6C4/6UvaW5A8CNjzzCVjUaShkKukEa
 PfNoe5759fGT0Ph3gDX2cCn6jv5ZUEVIoal3z2pyeEnvw/6PpZvztaJccNZNzzfD148F6dzGkM1
 UH+gP1J61XwuxfqDIScn8VK9qR2xI01UyiAUhMqfR7RKz9F0S1Ypmq6kMq0GjMPkZQQ==
X-Received: by 2002:adf:e451:0:b0:35f:cd6:7538 with SMTP id
 ffacd0b85a97d-35f0cd675b6mr608033f8f.7.1717765540442; 
 Fri, 07 Jun 2024 06:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhE9vaemAHFaA5yCK2dCQn83HAZMLlxklLRbU4vCgE337Y15ysZQMtmWhB9+FiRiVoN001pA==
X-Received: by 2002:adf:e451:0:b0:35f:cd6:7538 with SMTP id
 ffacd0b85a97d-35f0cd675b6mr608011f8f.7.1717765540032; 
 Fri, 07 Jun 2024 06:05:40 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d49e43sm4000079f8f.31.2024.06.07.06.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 06:05:39 -0700 (PDT)
Date: Fri, 7 Jun 2024 15:05:36 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, wedsonaf@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZmMFoHYR8INkhMru@cassiopeiae>
References: <Zlgg_Q5y3Q99Ts1s@pollux>
 <20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
 <Zlmfkws-QjNmFxfr@pollux>
 <20240607.211132.1411950625632247437.fujita.tomonori@gmail.com>
 <2024060708-residue-hardy-af36@gregkh>
MIME-Version: 1.0
In-Reply-To: <2024060708-residue-hardy-af36@gregkh>
X-Mimecast-Spam-Score: 0
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

On Fri, Jun 07, 2024 at 02:36:50PM +0200, Greg KH wrote:
> On Fri, Jun 07, 2024 at 09:11:32PM +0900, FUJITA Tomonori wrote:
> > Hi,
> > 
> > On Fri, 31 May 2024 11:59:47 +0200
> > Danilo Krummrich <dakr@redhat.com> wrote:
> > 
> > > Once we get to a conclusion I can send a series with only the device and firmare
> > > abstractions such that we can get them in outside of the scope of the reset of
> > > both series to get your driver going.
> > 
> > Since your discussion with Greg seems to continue for a while, let me
> > include the following patch that Greg approved with the next version
> > of the PHY driver patchset.
> 
> Yes, please take this one now.  We can build on it from there.

This patch still contains the points *you* are discussing on the original one.
Why do I spend my time on this discussion if those points don't seem to matter
for you now?

Also, why would we want to have this patch (and the firmware one) in two
separate submissions? If we urgently want to land the firmware abstractions I
can send a separate series with just the device and firmware abstraction
patches.

> 
> I had a meeting yesterday with a lot of rust kernel and userspace people
> at Microsoft and talked a bunch about this and how to move forward.  I
> think we need to take much smaller "steps" and even encourage most
> drivers to start out as a mix of c and rust as there is no real
> "requirement" that a driver be "pure" rust at all.  This should both
> make the interface logic simpler to start with, AND provide a base so
> that people can just write the majority of their driver logic in rust,
> which is where the language "safety" issues are most needed, not in the
> lifecycle rules involving the internal driver model infrastructure.

What do you mean by "drivers to start out as mix of C and Rust".

I don' think this is desireable. Writing abstractions for C core infrastructure
already is a lot of effort and sometimes rather difficult in certain aspects,
(e.g. align lifetimes).

An immediate concern I have is that this is an invitation for drivers to write
their own abstractions, as in interfacing with C core infrastructure in C and
and do a driver specific abstraction.

> 
> Anyway, that's all hand-wavy right now, sorry, to get back to the point
> here, again, let's take this, which will allow the firmware bindings to
> be resubmitted and hopefully accepted, and we can move forward from
> there to "real" things like a USB or PCI or even platform device and
> driver binding stuff.

The abstractions for that are on the list and in the sense of what you say above
for "smaller steps, they are quite minimal. I don't see how we could break this
down even further.

> 
> thanks,
> 
> greg k-h
> 

