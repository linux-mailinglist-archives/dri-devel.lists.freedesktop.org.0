Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 665983A30FA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 18:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EDD6ED93;
	Thu, 10 Jun 2021 16:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267E56ED93
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 16:41:41 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e11so3081046wrg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 09:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QAAam4bwcqLotcjXvDkBnQcPnn9xc8kq8xxEHDU2s6w=;
 b=ERibTiLVz6wC7RnFajHP+K7GjocVUpTDLOFD2bJzyU9wp2/YgyjU74JU9AVf0C/aW5
 S4rej6Wc4JvkjPSXK4V9J/QcJI1wYiIjgIGycXTOzXLgW896ByGUCG6AvI7YqbZp7Ix5
 ruM7xP/ZUltZWHlDhzXoujQF4OYtdoWyKJsO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QAAam4bwcqLotcjXvDkBnQcPnn9xc8kq8xxEHDU2s6w=;
 b=ZBYBfBGapHp02VqubyRvrrDbA1olqhcqE34xAkF5TksdJssq/AS8A/QHby+ZVwdlZh
 CH/r2oalgVYEgM3VKhlowUiBBrWTas5QJq2guxpcNIh4mfIsVoCbxlI9gdpwlem6ixB4
 EdOrqVx5bqoFPwjipqq43KQG9Ua2rF9Dwqyz65I2YACoWkhyLJ+JkWXYYY2LaR5Hx5qt
 AVqK79LKGkWxl4Bq5G0vlhUlacsqYVhrJFwtZSa0+UYYsn5auk9sekpU/IW45q1TLV7I
 rLSuGXSnnGE+vtYhKbKvsr+nmnMu6nc3wrO9fTBoxEaZEC5MYcJpEbaRL5UTZadjMTnj
 +aPA==
X-Gm-Message-State: AOAM531DOE55uazhe34N8ILTJoRjm9g8u0NuC2mGdeBdwlFAkqFMBKLJ
 dJbkn8KosuxcNRSDMKhLsfT/Uok1b3E+Pg==
X-Google-Smtp-Source: ABdhPJygGbsDmO6u7TCDnOCUFUcZIYbGYA2tckXLSi82NVGz1n2FPm/seB4PaCknya9ytanmSG1EGg==
X-Received: by 2002:a5d:5902:: with SMTP id v2mr6389649wrd.272.1623343299743; 
 Thu, 10 Jun 2021 09:41:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l20sm3274858wmq.3.2021.06.10.09.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 09:41:38 -0700 (PDT)
Date: Thu, 10 Jun 2021 18:41:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: handle exclusive fence similar to shared ones
Message-ID: <YMJAwSAP50ZpNxbB@phenom.ffwll.local>
References: <20210606100312.119176-1-christian.koenig@amd.com>
 <CAKMK7uGX7z2KdymWus2fk9VR57wU+Rj4jcS0j=j_sYwaH8zrLg@mail.gmail.com>
 <3fdb2dbe-748b-5297-277f-6a8394100725@gmail.com>
 <YL42scoTq8RUuEkD@phenom.ffwll.local>
 <78ab1102-0b59-36ba-b5ef-526356ffe630@gmail.com>
 <YMDFNyqzCfgsJnn2@phenom.ffwll.local>
 <c164ea49-2ce2-8b40-1cdf-cd4cf93612e7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c164ea49-2ce2-8b40-1cdf-cd4cf93612e7@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 09, 2021 at 04:07:24PM +0200, Christian König wrote:
> Am 09.06.21 um 15:42 schrieb Daniel Vetter:
> > [SNIP]
> > > That won't work. The problem is that you have only one exclusive slot, but
> > > multiple submissions which execute out of order and compose the buffer
> > > object together.
> > > 
> > > That's why I suggested to use the dma_fence_chain to circumvent this.
> > > 
> > > But if you are ok that amdgpu sets the exclusive fence without changing the
> > > shared ones than the solution I've outlined should already work as well.
> > Uh that's indeed nasty. Can you give me the details of the exact use-case
> > so I can read the userspace code and come up with an idea? I was assuming
> > that even with parallel processing there's at least one step at the end
> > that unifies it for the next process.
> 
> Unfortunately not, with Vulkan that is really in the hand of the
> application.

Vulkan explicitly says implicit sync isn't a thing, and you need to
import/export syncobj if you e.g. want to share a buffer with GL.

Ofc because amdgpu always syncs there's a good chance that userspace
running on amdgpu vk doesn't get this right and is breaking the vk spec
here :-/

> But the example we have in the test cases is using 3D+DMA to compose a
> buffer IIRC.

Yeah that's the more interesting one I think. I've heard of some
post-processing steps, but that always needs to wait for 3D to finish. 3D
+ copy engine a separate thing.

> > If we can't detect this somehow then it means we do indeed have to create
> > a fence_chain for the exclusive slot for everything, which would be nasty.
> 
> I've already created a prototype of that and it is not that bad. It does
> have some noticeable overhead, but I think that's ok.

Yup seen that, I'll go and review that tomorrow hopefully. It's not great,
but it's definitely a lot better than the force always sync.

> > Or a large-scale redo across all drivers, which is probaly even more
> > nasty.
> 
> Yeah, that is indeed harder to get right.

Yeah, and there's also a bunch of other confusions in that area.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
