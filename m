Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD388BB827
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 01:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0591B10EFA9;
	Fri,  3 May 2024 23:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QGeoyIZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B699910EFA9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 23:23:34 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1e5715a9ebdso1573075ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 16:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714778614; x=1715383414;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VUA37CihXVg7mm5FxSpz/CzjnHfbPR2trIEY0fDnh+Q=;
 b=QGeoyIZJY7VsVlpUtnLgOfW3bhZY+ve1cSmjlYoqA/hpTjXD5+uKxVjarsL+i3lk+n
 n3G0maowB4afz/Ef5z/YKGLUz3KAPZMsD2DyknisemZhK4vK0qVH30kzlliESKxIMfGv
 BrcnkdVoDRBFZZp3+GspsXl1KM29mvxJklYZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714778614; x=1715383414;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VUA37CihXVg7mm5FxSpz/CzjnHfbPR2trIEY0fDnh+Q=;
 b=JM9fRe1kbWeUBbCGpu589xA4JT5jlBWL5C2KXj8XLvv1N5Wc+fFJVCM4GM3awM4sNd
 qhmx2EEHwveOHCzAOEozSTYimJ4liUS8NCUufNOJI/DN7envbCLdC3JDuRbuyhXOyHxE
 ct4c4mlsXRVZgmuZh8YJhijD7YMVd4QN3DfvSeBxWmONRlXnpll7DC03JU+uBQiW4AsQ
 suKW/jb0OEo+fnBhUHCr72bDzd96viPSMeyQznAtRcP0Swyvs+ow3IxZHiy/PH/DcG37
 EDNi7xapPlCoLhd7awCzd3txSIGqiPxtthJqFYOMNZWoTDKBQTyF5HRvXkWidR8VVf4Q
 OQwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYpayL4bEMB0V40USOY2Ntg6lsFEAel3g3BAMRua/GBoUYPoKvMfD2ZCdlozwutgTV4PVO6lRn4Pcmvp64kSK9uoIuYYQM9NECkAqzU9jm
X-Gm-Message-State: AOJu0YzCeuSeBgeVQSw1FFe2moVXZGzh1KJ+FTc65ee2xVTBAPxbcOaI
 uuPKCyMFOTK6TydgA4qWiMtoRzF5TxKoG3lA1HayS5ed9TGV0SAMid2h+b+cKQ==
X-Google-Smtp-Source: AGHT+IGYEU76uRUVHu3t+p2cOz6G2yu0aNydyl6VPEopXdNsv2Uoe1Hs5RLUXZ183qrKjCrJ/IlslQ==
X-Received: by 2002:a17:903:1c2:b0:1e4:6243:8543 with SMTP id
 e2-20020a17090301c200b001e462438543mr4608970plh.5.1714778614174; 
 Fri, 03 May 2024 16:23:34 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a170902d50b00b001eb2f4648d3sm3793511plg.228.2024.05.03.16.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 16:23:33 -0700 (PDT)
Date: Fri, 3 May 2024 16:23:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, axboe@kernel.dk,
 brauner@kernel.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org,
 jack@suse.cz, laura@labbott.name, linaro-mm-sig@lists.linaro.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, minhquangbui99@gmail.com,
 sumit.semwal@linaro.org,
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
Message-ID: <202405031616.793DF7EEE@keescook>
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240503214531.GB2118490@ZenIV>
 <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
 <202405031529.2CD1BFED37@keescook> <20240503230318.GF2118490@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503230318.GF2118490@ZenIV>
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

On Sat, May 04, 2024 at 12:03:18AM +0100, Al Viro wrote:
> On Fri, May 03, 2024 at 03:46:25PM -0700, Kees Cook wrote:
> > On Fri, May 03, 2024 at 02:52:38PM -0700, Linus Torvalds wrote:
> > > That means that the file will be released - and it means that you have
> > > violated all the refcounting rules for poll().
> > 
> > I feel like I've been looking at this too long. I think I see another
> > problem here, but with dmabuf even when epoll is fixed:
> > 
> > dma_buf_poll()
> > 	get_file(dmabuf->file)		/* f_count + 1 */
> > 	dma_buf_poll_add_cb()
> > 		dma_resv_for_each_fence ...
> > 			dma_fence_add_callback(fence, ..., dma_buf_poll_cb)
> > 
> > dma_buf_poll_cb()
> > 	...
> >         fput(dmabuf->file);		/* f_count - 1 ... for each fence */
> > 
> > Isn't it possible to call dma_buf_poll_cb() (and therefore fput())
> > multiple times if there is more than 1 fence? Perhaps I've missed a
> > place where a single struct dma_resv will only ever signal 1 fence? But
> > looking through dma_fence_signal_timestamp_locked(), I don't see
> > anything about resv nor somehow looking into other fence cb_list
> > contents...
> 
> At a guess,
>                 r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
> 		if (!r)
> 			return true;
> 
> prevents that - it returns 0 on success and -E... on error;
> insertion into the list happens only when it's returning 0,
> so...

Yes; thank you. I *have* been looking at it all too long. :)


The last related thing is the drivers/gpu/drm/vmwgfx/ttm_object.c case:

/**
 * get_dma_buf_unless_doomed - get a dma_buf reference if possible.
 *
 * @dmabuf: Non-refcounted pointer to a struct dma-buf.
 *
 * Obtain a file reference from a lookup structure that doesn't refcount
 * the file, but synchronizes with its release method to make sure it
 * has
 * not been freed yet. See for example kref_get_unless_zero
 * documentation.
 * Returns true if refcounting succeeds, false otherwise.
 *
 * Nobody really wants this as a public API yet, so let it mature here
 * for some time...
 */
static bool __must_check get_dma_buf_unless_doomed(struct dma_buf *dmabuf)
{
        return atomic_long_inc_not_zero(&dmabuf->file->f_count) != 0L;
}

If we end up adding epi_fget(), we'll have 2 cases of using
"atomic_long_inc_not_zero" for f_count. Do we need some kind of blessed
helper to live in file.h or something, with appropriate comments?

-- 
Kees Cook
