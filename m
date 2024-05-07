Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B3A8BDFEE
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 12:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FFD10EE25;
	Tue,  7 May 2024 10:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="AdgO/p3y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0919810EE25
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 10:41:03 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-34f562474e8so291885f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 03:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715078462; x=1715683262; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0hSlbkkH0RQlXAU1X1dSoZPgHGX61BgsqrXQhyEDSAE=;
 b=AdgO/p3yHtk9rFrnIx15N54SwC+orXzYJujYI41B1/aduxrhk4f71HFVNAJthjfcoE
 fqb6nO1RxsStWipdqBrg2NvGoMykd9Oh5hmvsuDqMwABdWWv8rWqSnWkdMdzdpj56U2r
 MWL0Dz5P55ONWdTox5xqKDrD+yECjGBTsf/8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715078462; x=1715683262;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0hSlbkkH0RQlXAU1X1dSoZPgHGX61BgsqrXQhyEDSAE=;
 b=KnRyF+RQsdkCo957AXrXXdzloTxa/PAZ8bvOzcyuH7jt8+Sj545gqdPmjjwvSG3QX0
 wFr7okjFFFmbZHJXhTkmVdlahoqmYeEl3JhB5QLqEceHw7wvZJo9nbJvXrLl21TLpWzp
 nsvZoNw/y6S9yyfNaEufWwnroz6GVYt9Cr2WtabEx1Dvvy/mHFX7/pzIWbPWUOFAsZKa
 l1Z/BGHBBwLd5R7nuAeA6udLJ3S0h3yYTaNvTUf5RAFm3vTjSVdDtprnt1syFL/nX8KW
 m+4xWV17EtTZt+61QnRYn2x4H0UX2w0394g7MkGfMYlLB+ff7btqd0PGFMrrVCe9GI2x
 1ktQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8m59biLQXPRNjPGUPwKKw+KBChgka91rGH/8539VAiA+WwvtErraFywZg6aMaomFaD6ydUWIRTjkX65iLQ+QfInIZftC4Wgdmuda1wcHr
X-Gm-Message-State: AOJu0YxnPc+MwY5Sz65iPiG9YAb0rWaDxQ0VvDUQIPaLdquCegNK8Ek7
 j7vPSFS0odmAAhvrp4JPNhRzyo8nededoLhyjmGXri9N+VJ/p8wDedFbdRQBVzo=
X-Google-Smtp-Source: AGHT+IG2AAi7gOGQ+Sp+LWwfE0gNhj/CmpgLDACrQuZ6JTyFoqk4XnFfNnBaU/No4joOOaHM6+5IvQ==
X-Received: by 2002:a05:600c:1c2a:b0:419:f68e:118c with SMTP id
 j42-20020a05600c1c2a00b00419f68e118cmr9117779wms.1.1715078462174; 
 Tue, 07 May 2024 03:41:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f4307ded2sm7253905e9.0.2024.05.07.03.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 03:41:01 -0700 (PDT)
Date: Tue, 7 May 2024 12:40:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
 Dmitry Antipov <dmantipov@yandex.ru>, lvc-project@linuxtesting.org,
 dri-devel@lists.freedesktop.org, "T.J. Mercier" <tjmercier@google.com>,
 syzbot+5d4cb6b4409edfd18646@syzkaller.appspotmail.com,
 linux-fsdevel@vger.kernel.org, Zhiguo Jiang <justinjiang@vivo.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Subject: Re: [lvc-project] [PATCH] [RFC] dma-buf: fix race condition between
 poll and close
Message-ID: <ZjoFOwPt2vTP1X-x@phenom.ffwll.local>
References: <20240423191310.19437-1-dmantipov@yandex.ru>
 <85b476cd-3afd-4781-9168-ecc88b6cc837@amd.com>
 <3a7d0f38-13b9-4e98-a5fa-9a0d775bcf81@yandex.ru>
 <72f5f1b8-ca5b-4207-9ac9-95b60c607f3a@amd.com>
 <d5866bd9-299c-45be-93ac-98960de1c91e@yandex.ru>
 <a87d7ef8-2c59-4dc5-ba0a-b821d1effc72@amd.com>
 <5c8345ee-011a-4fa7-8326-84f40daf2f2c@yandex.ru>
 <20240506-6128db77520dbf887927bd4d-pchelkin@ispras.ru>
 <eb46f1e3-14ec-491d-b617-086dae1f576c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb46f1e3-14ec-491d-b617-086dae1f576c@amd.com>
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

On Tue, May 07, 2024 at 11:58:33AM +0200, Christian König wrote:
> Am 06.05.24 um 08:52 schrieb Fedor Pchelkin:
> > On Fri, 03. May 14:08, Dmitry Antipov wrote:
> > > On 5/3/24 11:18 AM, Christian König wrote:
> > > 
> > > > Attached is a compile only tested patch, please verify if it fixes your problem.
> > > LGTM, and this is similar to get_file() in __pollwait() and fput() in
> > > free_poll_entry() used in implementation of poll(). Please resubmit to
> > > linux-fsdevel@ including the following:
> > > 
> > > Reported-by: syzbot+5d4cb6b4409edfd18646@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=5d4cb6b4409edfd18646
> > > Tested-by: Dmitry Antipov <dmantipov@yandex.ru>
> > I guess the problem is addressed by commit 4efaa5acf0a1 ("epoll: be better
> > about file lifetimes") which was pushed upstream just before v6.9-rc7.
> > 
> > Link: https://lore.kernel.org/lkml/0000000000002d631f0615918f1e@google.com/
> 
> Yeah, Linus took care of that after convincing Al that this is really a bug.
> 
> They key missing information was that we have a mutex which makes sure that
> fput() blocks for epoll to stop the polling.
> 
> It also means that you should probably re-consider using epoll together with
> shared DMA-bufs. Background is that when both client and display server try
> to use epoll the kernel will return an error because there can only be one
> user of epoll.

I think for dma-buf implicit sync the best is to use the new fence export
ioctl, which has the added benefit that you get a snapshot and so no funny
livelock issues if someone keeps submitting rendering to a shared buffer.

That aside, why can you not use the same file with multiple epoll files in
different processes? Afaik from a quick look, all the tracking structures
are per epoll file, so both client and compositor using it should work?

I haven't tried, so I just might be extremely blind ...
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
