Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314D18421A8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B374112F4E;
	Tue, 30 Jan 2024 10:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348CA112F4E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:41:45 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-55f35ad4d36so192828a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 02:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706611241; x=1707216041; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bpht1JVVU83PUsSOfehDgTwxwvmRcn3OoCMGwiYoquM=;
 b=MqUIvr2g4k+b2kJXhgRqR+YZO98Mk4duzc0hHqsXW2hTLmgQL6O1BuHfKlq+OB5Mi2
 SlXpYBIjzSl6EP6dQA1SajmLOEIZ8foqie64PbYLgdh3AsA1cjLrsl2fYe3zhukoSY1F
 8vgHFeRvDvDBxFCLADYXm4pfEl/r7DEgq3ju4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706611241; x=1707216041;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bpht1JVVU83PUsSOfehDgTwxwvmRcn3OoCMGwiYoquM=;
 b=gNaO0gW4iNCxC98DpXYMT4OsyktzDtik1EkPFnZm9iW9oPxlUVfKaYhAHuaJfpmS3O
 TUyC5tRNVJAd7vgqdCh4f+/XvWzb0Y1WkSlBp4uWaU2dxb6wsWPvo6A0yCyR1xocOlUl
 nXQVNpYkMuwaPYrkkucnZd17YHc0u1p67GdwYvg2QbQxd+l5G/mjbLWHyyftfrwSleR0
 JTXhwayJBs+U3xxD6ImJP9XmGFst5BeUKNSC4l3CHg8hwtQ2jQgCsJgUgi4lYunFryjC
 XuWLrmG3/luJbz+NmD33V/VdC8ZQ2GSOo/kIQqBtAu/o4f/nuejcZPNrnIPsWr+VGcC6
 oWDg==
X-Gm-Message-State: AOJu0YxOi2VtbPy6LBUbfNiuOSHaQGLu1xqU/I5N3BXt9FdFU+DlHWtr
 NkqlQKdbS4L9U4y5pp7XcxjVILnTgt46EIO8MOsgTtW4jkfT3lPohk5Eje64THs=
X-Google-Smtp-Source: AGHT+IHZ1+k7/jhfw/iaNOKyePTFN9as60sY4ufogxiCp9dTJV9WWo6nCqSg8dJHFMfPftGHyW34Rg==
X-Received: by 2002:aa7:d04f:0:b0:55f:99:fb30 with SMTP id
 n15-20020aa7d04f000000b0055f0099fb30mr3223522edo.4.1706611241253; 
 Tue, 30 Jan 2024 02:40:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 es19-20020a056402381300b0055cffd3fd32sm4749393edb.68.2024.01.30.02.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 02:40:40 -0800 (PST)
Date: Tue, 30 Jan 2024 11:40:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
Message-ID: <ZbjSJi07gQhZ4WMC@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Christoph Hellwig <hch@lst.de>
References: <85a89505-edeb-4619-86c1-157f7abdd190@amd.com>
 <0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net>
 <577501f9-9d1c-4f8d-9882-7c71090e5ef3@amd.com>
 <7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net>
 <2ac7562c-d221-409a-bfee-1b3cfcc0f1c6@amd.com>
 <ZbKiCPhRvWaz4Icn@phenom.ffwll.local>
 <c97e38ee-b860-4990-87f1-3e59d7d9c999@amd.com>
 <Zbi6zQYtnfOZu5Wh@phenom.ffwll.local>
 <a2346244-e22b-4ff6-b6cd-1da7138725ae@amd.com>
 <7eec45a95808afe94ac65a8518df853356ecf117.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7eec45a95808afe94ac65a8518df853356ecf117.camel@crapouillou.net>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christoph Hellwig <hch@lst.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 10:48:23AM +0100, Paul Cercueil wrote:
> Le mardi 30 janvier 2024 à 10:23 +0100, Christian König a écrit :
> >  I would say we start with the DMA-API by getting away from sg_tables
> > to something cleaner and state oriented. 
> 
> FYI I am already adding a 'dma_vec' object in my IIO DMABUF patchset,
> which is just a dead simple
> 
> struct dma_vec {
>   dma_addr_t addr;
>   size_t len;
> };
> 
> (The rationale for introducing it in the IIO DMABUF patchset was that
> the "scatterlist" wouldn't allow me to change the transfer size.)
> 
> So I believe a new "sg_table"-like could just be an array of struct
> dma_vec + flags.

Yeah that's pretty much the proposal I've seen, split the sg table into
input data (struct page + len) and output data (which is the dma_addr_t +
len you have above).

The part I don't expect to ever happen, because it hasn't the past 20 or
so years, is that the dma-api will give us information about what is
needed to keep the buffers coherency between various devices and the cpu.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
