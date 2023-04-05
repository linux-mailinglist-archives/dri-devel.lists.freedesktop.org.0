Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C66416D7CC3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 14:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2841110E93C;
	Wed,  5 Apr 2023 12:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EF310E93C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 12:36:48 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5005c57f95cso44128a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 05:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680698206; x=1683290206;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E6iWx9EB6J3L8iIop1bmZ+pNlziIEisMA1uL8RnykGc=;
 b=Mhpu4CDBYYy7UnbecnwaJGBwUWEJJZkdvrEefXyX2r+r4FENpB1qkR+tX4rIEcLLNc
 HUVfqZlrktiiC1UivQlXrKHRQSwPD9fmbGSjOmWfxRDbCoEgopYVA0XuQ3TzQrDsGHl8
 V/sMzxOY9dAQhT6ShYmtLicdzfCt+/18NkPTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680698206; x=1683290206;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E6iWx9EB6J3L8iIop1bmZ+pNlziIEisMA1uL8RnykGc=;
 b=rCnB7gqmU22oWWQ9IdmG3rblN4OqrBvK4j0wbZFAN7t1infLDnxwD7BW2euUI2gK0y
 +4Pzeoato9Exy8g0sivZcoHIQTSM6hnnPlnsCF7Rb3sUKOHDB1bpD/qKqIA6AZeOmy2j
 2WHA1XhJ3HdGg8ryURbPSzKieMdb7/61AMy1HwaRfblIfOy0mw51Z8mtkGEAeNQcaEhr
 1fmfgjsVSgDAsKfzqzrlGptfJ33jOVOeDXbUMdGdRAehZFdjY5TQeW/kQnzI1NsjCgE8
 JBvhE7fXzI8PRT0MjT2Lx5Hn0/J6nwq5Op1DLgvxTBPzriYJHs8pugz+W20tI/pp7Xsz
 J4YQ==
X-Gm-Message-State: AAQBX9f/hHJCw33ojGR6F+zk/RoFf9vkNjDT8J3BAfdGoLyJQIfctmK5
 tNtmFWi3+t/Z6shGb1dmZzJ8tA==
X-Google-Smtp-Source: AKy350YIBJGEKIbnfG5Qb41ZqY8oW3SBwxFUxtFvD5haG8Sd7EjZxbYnmEZUvlkuPcFwlyaw2lVQPg==
X-Received: by 2002:a05:6402:d0e:b0:502:e50:3358 with SMTP id
 eb14-20020a0564020d0e00b005020e503358mr1779099edb.3.1680698206345; 
 Wed, 05 Apr 2023 05:36:46 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 q16-20020a50aa90000000b004af6c5f1805sm7265301edc.52.2023.04.05.05.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 05:36:45 -0700 (PDT)
Date: Wed, 5 Apr 2023 14:36:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH RFC 04/18] rust: drm: gem: Add GEM object abstraction
Message-ID: <ZC1rW+ZktoC9fBaX@phenom.ffwll.local>
Mail-Followup-To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Karol Herbst <kherbst@redhat.com>,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-sgx@vger.kernel.org, asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-4-917ff5bc80a8@asahilina.net>
 <ZC1WwJDr1iqSQnYs@phenom.ffwll.local>
 <CANiq72=h9qKrpkY2K962__rs-JLsmWxPXocx040ZeDSKGf_Brw@mail.gmail.com>
 <ZC1aEZpgZLkq8xTv@phenom.ffwll.local>
 <CANiq72=hoVw566orbDYcJyw2+SFfxpR1rdJVbbR3kkrjJUASww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=hoVw566orbDYcJyw2+SFfxpR1rdJVbbR3kkrjJUASww@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Karol Herbst <kherbst@redhat.com>, Asahi Lina <lina@asahilina.net>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Gary Guo <gary@garyguo.net>,
 Ella Stanforth <ella@iglunix.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-media@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 02:32:12PM +0200, Miguel Ojeda wrote:
> On Wed, Apr 5, 2023 at 1:23 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > Ok if this is just interim I think it's fine. Would still be good to have
> > the MAINTAINERS entry though even just to cover the interim state. Least
> > because I'm assuming that when things are split up you'd still want to
> > keep the rust list on cc for the rust parts, even when they move into
> > subsystems?
> 
> Sorry, I missed to reply the second part of your email -- replying here.
> 
> Currently, the subsystem's code is under `rust/` (though modules can
> go already into other folders). One of the reasons was technical
> simplicity, and a nice side effect is that we could bootstrap things
> while getting C maintainers involved over time.
> 
> To accomplish that, the guidelines for contributing Rust code are that
> the respective maintainers need to be at least Cc'd, even if the files
> do not hit the `F:` fields for the time being -- see [1]. But, for us,
> ideally, the maintainers will take the changes through their tree,
> instead of going through the Rust one, since that is the end goal.
> 
> And, of course, if you already want to have `F:` fields for the Rust
> code, that is even better! (Whether those should be in the same entry
> or in a new one, it is up to you, of course, and whether it is a
> different set of people / level of support / etc.)
> 
> Then, when the `kernel` crate split happens, we can move the code
> directly under whatever folders it should be naturally, when their
> maintainers are ready. For some subsystems, that may mean they do not
> need any `F:` fields since they are already covered (e.g. if they did
> not create a new entry for Rust code only). And for cases like yours,
> where you already had `F:` fields, it means the move of the files can
> be done right away as soon as the split happens.
> 
> In short, we would definitely welcome if you add `F:` fields already
> (whether in existing or new entries) -- it would mean you are ahead of
> the curve! :)
> 
> As for the mailing list, yes, for the time being, I ask that all
> changes to please be sent to the Rust list, so that everybody that
> wants to follow the Rust progress has everything in a single place, so
> that we try to remain consistent in the beginning on e.g. coding
> guidelines, so that Rust reviewers can help spot mistakes, and so on
> and so forth.
> 
> But, as Rust grows in the kernel, as systems become non-experimental,
> and as maintainers take ownership of the code, that should eventually
> go away and let things be as usual with C code. Then the Rust
> subsystem (and its list) will become smaller, and it will be the
> subsystem (and the discussion place) for anything not covered by other
> subsystems, such as core Rust abstractions and types, Rust
> infrastructure and so on.
> 
> How does that sound?

Yeah sounds all great!

I think interim at least a separate rust drm entry
would be good, to make sure we always cc both rust and dri-devel. Once
it's too much for you and you generally trust the dri-devel folks to not
design stupid interfaces, we can then drop that and only ping rust folks
when needed. I do expect that's some years out though.
-Daniel

> 
> [1] https://rust-for-linux.com/contributing#the-rust-subsystem (I may
> reorganize this to be Rust's `P:` field, by the way)
> 
> Cheers,
> Miguel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
