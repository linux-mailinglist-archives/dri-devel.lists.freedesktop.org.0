Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B787A62F19D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 10:42:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5882A10E217;
	Fri, 18 Nov 2022 09:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A0910E216
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 09:42:47 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id y24so1356730edi.10
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 01:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RWwTJqBdRkGxMpUsXkj7kS4LoBFLsxAyq8V52F2ktYA=;
 b=ozV32jxunKudpT0TF9+m0W4jAgSzBwZzSOICFLkkKE+F+y7iFgFOXwHYqx97pFp6yD
 kl1JvtDkvY4HV9Ty5PsuN4BZYIXP/KQ8FdrTc2eD+HyjOCRISkvaJ1Q7hi/XowrxcumP
 RxmovPRETWrFf+XTgN+kismameBs4PGRyu91z7GDURMC6N5oi8OTy9+Sx9v6IVNvzAs2
 ACoBX5jqLfvi3SN7MADZ8ooN1yUgwahn9Lnv6aZYC+6cNkJPtw9am+CfrTiMZ6Whf113
 tFLK82SlhDxr3m5FWYwI8D4G8Pi/ee+lFXAcC7401V/gkhjlcswixL4kTMYySHVjrXlp
 iLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RWwTJqBdRkGxMpUsXkj7kS4LoBFLsxAyq8V52F2ktYA=;
 b=zD9pyDxdcBGQb5W6BVNjpEcQ0DmSQuUTrJsgFYv6aghMCvBlCtUvGjqGBeUtx3N/Af
 XwIuN9O2BSy5XR0ERO2RPYhaVbZdFSlvPwBFUFP/j/8C9+gOTJRCweJlRuVGHsYIOMf5
 5rgpI+Tw1EKYawt1InDbbWrcTSF1N1bkXHUQ8FQgxHaxcVfZ9uewqHgVb0tTbCLhxvKE
 IQB6Qjj40ArgRknlPhm4riQb2XZrnoWLXIfk1p+KSskwmu0lDWLm0OQ99DPz+YuvPms/
 oZJE9nN0L3qxXwdVvhCj0otDBUeUBIszsuarV+EO6jQ53uMLBUGYJi8LDgV9a7yQAo08
 Ke8w==
X-Gm-Message-State: ANoB5pkDXHqa6zhJqvYsmGp2cMZKEL3zkohetjiRorq/X5nH6AZ0oN3C
 KAggycxQMaf+z8u5yLtZBCw=
X-Google-Smtp-Source: AA0mqf7lt9bhkwouPKDyaPPGRqg+cJhOC2I/phTI9ASYuSDfCXzmI05hDjjgWqpX7tCK872W/b86Tg==
X-Received: by 2002:a05:6402:2217:b0:468:fd95:eb4 with SMTP id
 cq23-20020a056402221700b00468fd950eb4mr3319804edb.230.1668764566276; 
 Fri, 18 Nov 2022 01:42:46 -0800 (PST)
Received: from thinkpad-p72 (user-5-173-65-115.play-internet.pl.
 [5.173.65.115]) by smtp.gmail.com with ESMTPSA id
 o6-20020a056402444600b0046383354bf9sm1569307edb.40.2022.11.18.01.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:42:45 -0800 (PST)
From: Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>
X-Google-Original-From: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>
Date: Fri, 18 Nov 2022 10:42:42 +0100
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v4] udmabuf: add vmap and vunmap methods to udmabuf_ops
Message-ID: <20221118094242.GA89173@thinkpad-p72>
References: <20221117045842.27161-1-lukasz.wiecaszek@gmail.com>
 <970e798d-ea26-5e1e-ace8-7915a866f7c7@collabora.com>
 <20221117170838.GA74987@thinkpad-p72>
 <cd382f43-1995-12a6-840b-32450e62f9f4@collabora.com>
 <6ecae1e3-16cb-f5fb-05ce-a98fcf145069@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ecae1e3-16cb-f5fb-05ce-a98fcf145069@amd.com>
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
Cc: Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 07:01:05PM +0100, Christian König wrote:
> Am 17.11.22 um 18:32 schrieb Dmitry Osipenko:
> > On 11/17/22 20:08, Lukasz Wiecaszek wrote:
> > > On Thu, Nov 17, 2022 at 12:04:35PM +0300, Dmitry Osipenko wrote:
> > > > Hi,
> > > > 
> > > > On 11/17/22 07:58, Lukasz Wiecaszek wrote:
> > > > > The reason behind that patch is associated with videobuf2 subsystem
> > > > > (or more genrally with v4l2 framework) and user created
> > > > > dma buffers (udmabuf). In some circumstances
> > > > > when dealing with V4L2_MEMORY_DMABUF buffers videobuf2 subsystem
> > > > > wants to use dma_buf_vmap() method on the attached dma buffer.
> > > > > As udmabuf does not have .vmap operation implemented,
> > > > > such dma_buf_vmap() natually fails.
> > > > > 
> > > > > videobuf2_common: __vb2_queue_alloc: allocated 3 buffers, 1 plane(s) each
> > > > > videobuf2_common: __prepare_dmabuf: buffer for plane 0 changed
> > > > > videobuf2_common: __prepare_dmabuf: failed to map dmabuf for plane 0
> > > > > videobuf2_common: __buf_prepare: buffer preparation failed: -14
> > > > > 
> > > > > The patch itself seems to be strighforward.
> > > > > It adds implementation of .vmap and .vunmap methods
> > > > > to 'struct dma_buf_ops udmabuf_ops'.
> > > > > .vmap method itself uses vm_map_ram() to map pages linearly
> > > > > into the kernel virtual address space.
> > > > > .vunmap removes mapping created earlier by .vmap.
> > > > > All locking and 'vmapping counting' is done in dma_buf.c
> > > > > so it seems to be redundant/unnecessary in .vmap/.vunmap.
> > > > > 
> > > > > Signed-off-by: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>
> > > > If new patch version doesn't contain significant changes and you got
> > > > acks/reviews for the previous version, then you should add the given
> > > > acked-by and reviewed-by tags to the commit message by yourself.
> > > > 
> > > > -- 
> > > > Best regards,
> > > > Dmitry
> > > > 
> > > I would like to thank you all for your patience and on the same time say
> > > sorry that I still cannot follow the process (although I have read
> > > 'submitting patches' chapter).
> > If you'll continue to contribute actively, you'll find things that
> > aren't documented at all. Don't worry about it, usually somebody will
> > tell you about what's missing. Just apply the new knowledge next time ;)
> 
> Yeah, it's more learning by doing. Especially I suspect you don't have
> commit rights to drm-misc-next (or do you want to upstream it through some
> other branch?), so as soon as nobody has any more objections ping Dmitry or
> me to push this.
> 
> Cheers,
> Christian
> 
> PS: The Signed-of-by, Reviewed-by, Acked-by etc... lines are usually added
> in chronological order, e.g. your Signed-of-by line should always come
> first.
> 
>
Thanks one more time. Funny thing, but at the very beginning I had
Signed-of-by as the first line. Then I looked at 'git log' and spoted
different order, so I change mine as well. Ahhh. But this chronological
order of course make sense. So if you feel ok with this 'out of order'
issue, please push/merge this commit. If not, please let me know. I
already submitted version 5 of that work. So if change is required, I
will prepare version 6.
