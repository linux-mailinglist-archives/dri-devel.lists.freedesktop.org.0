Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4E18BCDBE
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 14:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91DF10E162;
	Mon,  6 May 2024 12:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZbprPxxj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DB810E162
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 12:23:53 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-34cba0d9a3eso137325f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 05:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1714998231; x=1715603031; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hJvxbNUxeULloPkLJE9SsjERpdsUIXxRxn2yKsRsSwc=;
 b=ZbprPxxjrjKcXCHab5XYcxGaMbh58R4EhOnmjlB4atZRPT6WIpTDZb0NjQB0YEYOeJ
 ZFhw3iX55TUqvPh3Ulm1/YlU4CRCd7DMD2L2WSOEu17I2c0IMLcxK3hkd+SRrrFw/hDc
 M6QDs490or+B1LikRefHLj/CTI6qp7mDwf2OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714998231; x=1715603031;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hJvxbNUxeULloPkLJE9SsjERpdsUIXxRxn2yKsRsSwc=;
 b=uNoij3+fpMZdlJr3H7b1H30SfaEVTBHHNzYafuwfZK8r5WkrVUOtllJZWanWVc6lH3
 EtBshqj/TcMa0N7fllUQcS9QO9rjcuylW/NeDMu/PYLMUrwdy3PlW/0GztRuEvoBfSto
 HOCJCz/MApA1iLlK/+iYhlfNzLtcG2F827NK89G8tW9dCpyhTk9/g7iOdaA8sD01wprr
 Pf8k1Ek+zcqODvczJ4YwQmGIY9uM27loNVLpA7+v8P7MCkMV6Hj8bopiE4eDnu8l4CVr
 dHcEGMdEp61SVael/HHHdPtjnXhezPTWTa6AGGnmObDRjj8qSp+PUJoMQMxCNEhSFh3W
 e38g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqY72eUHF+iVPaEhSrlCQD9R7azz0W6fGijjHbmuatmk/ya7voQSajp/be302Kp2C5j5Ae4Q0M8U2Z2CuhK6GtFF9pdgh3vLUNy2gPm/io
X-Gm-Message-State: AOJu0YzkHk3DxyMeR+eZRz5pdIZ5JRHKWIO6+1Txpnsf6j/lWvwN0Itz
 VDgoB74KrdmK2epgClLy9lOaZOgVpG00ehF4bDNwZ38iRIPbMDF9to/eg6xmXwo=
X-Google-Smtp-Source: AGHT+IGuUvBtI5rIVLpD2XOZICwCS9IQtrXwLWSsF2oFAMcsXQKy2Upppe1zQ4rIa9wWPmT5P5GIew==
X-Received: by 2002:a05:600c:3b02:b0:41a:c4fe:b0a5 with SMTP id
 m2-20020a05600c3b0200b0041ac4feb0a5mr6970105wms.4.1714998231468; 
 Mon, 06 May 2024 05:23:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b0041668162b45sm19554882wmq.26.2024.05.06.05.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 05:23:50 -0700 (PDT)
Date: Mon, 6 May 2024 14:23:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>, Jens Axboe <axboe@kernel.dk>,
 Bui Quang Minh <minhquangbui99@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 syzbot <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, jack@suse.cz,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Laura Abbott <laura@labbott.name>
Subject: Re: get_file() unsafe under epoll (was Re: [syzbot] [fs?]
 [io-uring?] general protection fault in __ep_remove)
Message-ID: <ZjjL1GjSMMMcxdsc@phenom.ffwll.local>
Mail-Followup-To: Al Viro <viro@zeniv.linux.org.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>, Jens Axboe <axboe@kernel.dk>,
 Bui Quang Minh <minhquangbui99@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 syzbot <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, jack@suse.cz,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Laura Abbott <laura@labbott.name>
References: <202405031110.6F47982593@keescook>
 <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
 <202405031207.9D62DA4973@keescook>
 <d6285f19-01aa-49c8-8fef-4b5842136215@kernel.dk>
 <202405031237.B6B8379@keescook> <202405031325.B8979870B@keescook>
 <20240503211109.GX2118490@ZenIV> <20240503213625.GA2118490@ZenIV>
 <CAHk-=wgRphONC5NBagypZpgriCUtztU7LCC9BzGZDEjWQbSVWQ@mail.gmail.com>
 <20240503215303.GC2118490@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503215303.GC2118490@ZenIV>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Fri, May 03, 2024 at 10:53:03PM +0100, Al Viro wrote:
> On Fri, May 03, 2024 at 02:42:22PM -0700, Linus Torvalds wrote:
> > On Fri, 3 May 2024 at 14:36, Al Viro <viro@zeniv.linux.org.uk> wrote:
> > >
> > > ... the last part is no-go - poll_wait() must be able to grab a reference
> > > (well, the callback in it must)
> > 
> > Yeah. I really think that *poll* itself is doing everything right. It
> > knows that it's called with a file pointer with a reference, and it
> > adds its own references as needed.
> 
> Not really.  Note that select's __pollwait() does *NOT* leave a reference
> at the mercy of driver - it's stuck into poll_table_entry->filp and
> the poll_freewait() knows how to take those out.
> 
> 
> dmabuf does something very different - it grabs the damn thing into
> its private data structures and for all we know it could keep it for
> a few hours, until some even materializes.

dma_fence must complete in reasonable amount of time, where "reasonable"
is roughly in line with other i/o (including the option that there's
timeouts if the hw's gone busted).

So definitely not hours (aside from driver bugs when things go really
wrong ofc), but more like a few seconds in a worst case scenario.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
