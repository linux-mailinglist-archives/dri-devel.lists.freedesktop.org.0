Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357A729E730
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 10:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34116E8BD;
	Thu, 29 Oct 2020 09:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06EB6E8BD
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 09:25:28 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id k3so1703736otp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 02:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RXd5L3340dzHPl4D7TSnIVGFAYIoQ/W+pLHz6LYz95I=;
 b=RAZGAbKdB4XcnSD0wp1Kz5dBTHMEAkPA/y5Q5zBFcm5ek6TOqOD+2MjSuNA7CsSuFv
 QdasXZzvzm82On3eSCMCjzvEPeFEdeSGCKm4fjXr/Z2Mh9xwUtFmVb6ioAaMFNhmVvnm
 LvNYGo6oa8r1Gs3CbA9euLgw6UBFM7BcU9IdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RXd5L3340dzHPl4D7TSnIVGFAYIoQ/W+pLHz6LYz95I=;
 b=D81lrg4nMsBMyLbtEjCc8Vezf+LYhvwNhSNwwR0Ke3fdcRKTbmxpEsc7lNauEQzL9Y
 baHMlMLCuEvl+LfvPqOZtrnS1YINqUrt68TYZ3WtvUpOXtXnPmmpvwHcbjv539TQ5cEf
 oCTb/m0TX5NbMCRdyfQzoHJDwbxdOAlU9ESfMbBSk38RCunDGafQnMaXx/8+/Vy6AyYN
 G8blRcBmfZWKAwxazBBDEnzGJXOlDorWFnFi1wsCSdbhymvch1n2FJP7MEnGRjEgqx7z
 RAsypofGPTAj1onXqHOI4juD7wip2erM/hyidZrOYlxIIqsAsjyEyc7+HY5Vy0IVkVwH
 dhzg==
X-Gm-Message-State: AOAM531ISLG06SBOMccCSKJsDKeNFCO9+RWZQ0kHFQ6/UcebRJF7L0qx
 pikxc78BgV67nNI0auvliErnTK0/fsxwiY7OcB2GVw==
X-Google-Smtp-Source: ABdhPJz3d3GbocYLOWK17PC84OSTKCpC1P9Cp1Gqiuhg8zJB6kTRUJIIoeLruWIEtxgmiFM3IrJbR1M7sDMXTefUSTI=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id
 f28mr2685703ote.188.1603963527533; 
 Thu, 29 Oct 2020 02:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
 <20201029085749.GB25658@infradead.org>
In-Reply-To: <20201029085749.GB25658@infradead.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 29 Oct 2020 10:25:16 +0100
Message-ID: <CAKMK7uEV7sQ48w1Dd=WCY1r6LrY+aEq3ASnouOebQoo=Zr=CTQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] follow_pfn and other iomap races
To: Christoph Hellwig <hch@infradead.org>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 9:57 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> Maybe I'm missing something, but shouldn't follow_pfn be unexported
> at the end of the series?

kvm is a legit user and modular afaict. But since you can't use this
without an mmu_notifier anyway (or digging around in pagetable
locking), maybe it should be EXPORT_SYMBOL_GPL now at least?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
