Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A68533F11
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 16:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E228710EF3F;
	Wed, 25 May 2022 14:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EFF10EF18
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 14:25:48 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so3459925wmz.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 07:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ITLg2C3yVq6vK1lTGkzxJdHftN9s6BMjvm6n2OeNpGs=;
 b=QEJuhsjWZA25CK46fz6+yGBL3ypaKkpZqUm0sA+Z0uezNEoUb4dG4jRV2Ja/BedoyK
 MgIIZMzxGcSZAIIb3pojEDt7GHlecQr+HcIP2m3hN7OaXR2QKhpL9fAWMPaaqb+awFdV
 cUF8W4CtmOwbbG8LvQeYL6IJz7S32SvmIZYms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ITLg2C3yVq6vK1lTGkzxJdHftN9s6BMjvm6n2OeNpGs=;
 b=4xTHQ5nwKQ7o+9fS+HYE7cN0l33cl0FOPQ6+++oYy8rhnF1Q8Dg3hmRhKv21iuICda
 dxCumpcdMlI44L6rs7Ku16s2mMeCZaFfg5AtksMQ4M6cIzK74Z6RUugz+nZD9Y+w84V2
 AI5eEJVHKj5Vc1IZ8WfDdsSBCwqw+tTGULgtfX4aHL45hif6SXSF+LwjWqbKpjLTDM3g
 YjUGkJyx/qkIoiT0BvVihKZWg3XwtA/UNfPj4TRXvrP8VbChOg05eKAchmZCoIPdT/Ln
 Bmfc+MHF6k/vuCtioD1JzbCuc89KreKlbw7WNmYjYS/6+w05uhNOVHOxGQFvWmrmZ4T4
 7rbw==
X-Gm-Message-State: AOAM530aFa5i9th3Po5tN9p6w7euMZoVMlfsmgaQ8bLcGWYXH1bnlXft
 xNdYkbBlZmWLTBoHX4Y40EgSIg==
X-Google-Smtp-Source: ABdhPJxUv8XekR6DkUa+xFKURg36bsIdiO8o8dwdJdWscqxkKGwHIPk4mU4pbAVvMtsHo0G5kKxuvA==
X-Received: by 2002:a05:600c:3b8f:b0:397:5dc7:6066 with SMTP id
 n15-20020a05600c3b8f00b003975dc76066mr7051162wms.35.1653488746733; 
 Wed, 25 May 2022 07:25:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m12-20020adffa0c000000b0020fe7f7129fsm2175917wrr.100.2022.05.25.07.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 07:25:46 -0700 (PDT)
Date: Wed, 25 May 2022 16:25:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: Tackling the indefinite/user DMA fence problem
Message-ID: <Yo48Z/Rvnm30up41@phenom.ffwll.local>
References: <YnJQs1iusrBvpuMs@phenom.ffwll.local>
 <a01c7703-f7f7-f8ce-f80e-632a6fdcbbbe@gmail.com>
 <Ynkg81p6ADyZBa/L@phenom.ffwll.local>
 <a249c0c4-ee6c-bfb0-737b-eb6afae29602@amd.com>
 <Yo4pin1Js4KXs2HL@phenom.ffwll.local>
 <19808e9e-a5a6-c878-a2f7-5b33444f547d@mailbox.org>
 <Yo40X03axFXXN9/d@phenom.ffwll.local>
 <nR302DiNnOEkhrGg7TsRINiS2R-WuPiI2uJiERdMMaSUV9e_0xlX1eu1CzzhlCXJmJ-ss1BdkTSZ-XiEOnyMUTn6v3A_sb1jTkvAxfuS-f8=@emersion.fr>
 <CAPj87rPW=YW8OnRyByJ_-6k3M9Oo7m7cTg88F8AF4TfudAjAJA@mail.gmail.com>
 <bae1a848-a089-6207-af07-8606c7bb6519@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bae1a848-a089-6207-af07-8606c7bb6519@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: tvrtko.ursulin@linux.intel.com, daniels@collabora.com, tzimmermann@suse.de,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Felix.Kuehling@amd.com, linaro-mm-sig@lists.linaro.org, sergemetral@google.com,
 maad.aldabagh@amd.com, dri-devel@lists.freedesktop.org, gustavo@padovan.org,
 alexander.deucher@amd.com, skhawaja@google.com, sumit.semwal@linaro.org,
 jason@jlekstrand.net, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 25, 2022 at 04:22:48PM +0200, Christian König wrote:
> Am 25.05.22 um 16:15 schrieb Daniel Stone:
> > Hi,
> > 
> > On Wed, 25 May 2022 at 15:07, Simon Ser <contact@emersion.fr> wrote:
> > > On Wednesday, May 25th, 2022 at 15:51, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > You can add that to the list of reasons why compositors need to stop
> > > > > using buffers with unsignaled fences. There's plenty of other reasons
> > > > > there already (the big one being that otherwise slow clients can slow
> > > > > down the compositor, even if the compositor uses a high priority context
> > > > > and the HW supports preemption).
> > > > 
> > > > Yeah that's tbh another reason why I think we shouldn't do umf as a
> > > > transparent thing - compositors need to get better anyway, so we might as
> > > > well take this as a chance to do this right.
> > > As a compositor dev, I agree -- we should definitely be smarter about
> > > this. Note, it would help a lot to have a good way to integrate the
> > > waits into a poll(2) event loop.
> > The same holds for Weston. We're currently working through a bunch of
> > internal infrastructure to be able to handle this. Mutter (aka GNOME)
> > is also really well-placed to be able to do this.
> > 
> > Having pollable waits would be really useful, but I don't think it's
> > essential. In my strawman I'm just waking up at the usual
> > just-before-repaint point and checking; if it doesn't make it for this
> > frame then we'll wait for the next frame. If someone submits buffers
> > which take 4 repaint periods to clear then we'll have 3 'unnecessary'
> > wakeups, but given the GPU is already slammed then it's not an
> > efficiency problem I don't think. (I don't know if all the other
> > compositor people share this view.)
> 
> Oh, well you should already have pollable waits, at least on DMA-buf.
> 
> If you are saying you want to have that for drm_syncobj timelines as well
> then that's certainly something we could do.

The pollable wait isn't enough because the client could keep issuing more
rendering. So what you actually want is
- dma-buf export to get a sync_file (should land any minute now)
- poll on that (it works, as it doesn on dma-buf)
- tell egl to no do implicit sync or (maybe better) just have a vk
  renderer in your compositor

But interim you can poll on the dma-buf and it'll dtrt for at least
cooperative clients already.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
