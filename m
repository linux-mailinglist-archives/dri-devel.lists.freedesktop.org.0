Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3421751A6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 02:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B006E040;
	Mon,  2 Mar 2020 01:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8646E040
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 01:57:05 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e10so9054479wrr.10
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2020 17:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=koYzLLduUmba6eMG7bH+rQzfjIuwoi5r0ur4pym6TH0=;
 b=iMwLsgFj3K0eb1Lcry5D5853IFFEeaZzlN+Gm8eR6NfIjL9JBT0l09mkm3axL++kTN
 wwdHvxIlXCyYwTq/b/ceTWHc4NllMm193PTu4wtNnaFZtE1USN6TGxm+HAR07ForsBUF
 Yf3gUOfMmmJF7F1UFgqVMVFqaot0VI7oBvcWbcTobFRWxLW7OC/sSYMpEHVQwldGcxnA
 3+dhVbLF/zJi/Ndzy/YhAsb6daygAHLKHN0sMqwj8CI4q20YHMqn2g4n2K8uCfI36LTl
 XQ1ak8cKnCeK6hBNJAwIycTbAVKJUr1UOpFM5oUlDMLuk3dwciglUu+EeGYvB1ISIs6y
 bPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=koYzLLduUmba6eMG7bH+rQzfjIuwoi5r0ur4pym6TH0=;
 b=VDA4b8c1QVz7tL6af9ygRb3MuX60cHr1E8zkc+WeraqzASlnkG4TBhzh4m84YSVVK8
 +j0opaX9aFPIkQNo0VRDTyCpOtr5cIiEzEdlZwpVdOS65JLqfxy9phd+QWeqlvlxEyU1
 M2q1EC7nWVE6CyvSCYKEPpqbYgxsHW51C4MPKnJAtY+1Biw5PYSE1WCpMHfhGg+Ihb+J
 J1etaalo9hQnIHOrkP5Vl0snl259yDv18XRZgXbuDhgEtDMJeRD8FkyHy55vAuqhQzke
 p5tPVgDoD3OvyLQIGTN7OVzQeGRLUw9MYuSPnmTQ3vz8rNuyH6OKkeUz39JNsNglzsRd
 eknQ==
X-Gm-Message-State: APjAAAWS0mWLCzq15CeKGrghp7+YRAS2qmurtoGm+P7wartcU6Zb9kmL
 9AXMxp/BxXDsT9T9CQlwFtwEW9QCx6lYWbCJDI4=
X-Google-Smtp-Source: APXvYqxJzEwpgt1LXARvHWp3jh60dA/3V791RFq3GRpzRGZeLV7uNd3+Sak8ahmhpHu1tX1DrAWAfPoA/BGfuvBwP+4=
X-Received: by 2002:a05:6000:2:: with SMTP id
 h2mr13851705wrx.182.1583114223320; 
 Sun, 01 Mar 2020 17:57:03 -0800 (PST)
MIME-Version: 1.0
References: <20200226154752.24328-1-kraxel@redhat.com>
 <20200226154752.24328-2-kraxel@redhat.com>
 <f1afba4b-9c06-48a3-42c7-046695947e91@shipmail.org>
 <20200227075321.ki74hfjpnsqv2yx2@sirius.home.kraxel.org>
 <41ca197c-136a-75d8-b269-801db44d4cba@shipmail.org>
 <20200227105643.h4klc3ybhpwv2l3x@sirius.home.kraxel.org>
 <68a05ace-40bc-76d6-5464-2c96328874b9@shipmail.org>
 <20200227132137.irruicvlkxpdo3so@sirius.home.kraxel.org>
In-Reply-To: <20200227132137.irruicvlkxpdo3so@sirius.home.kraxel.org>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 2 Mar 2020 09:56:52 +0800
Message-ID: <CAKGbVbspOgJmKpuuNYTew-3LoT_Pr0rRNJVjzkd83c=UXTki1Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] drm/shmem: add support for per object caching
 flags.
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: Guillaume.Gardet@arm.com, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, gurchetansingh@chromium.org,
 tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 9:21 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > So I'd like to push patches 1+2 to -fixes and sort everything else later
> > > in -next.  OK?
> >
> > OK with me.
>
> Done.
>
> >> [ context: why shmem helpers use pgprot_writecombine + pgprot_decrypted?
> >>            we get conflicting mappings because of that, linear kernel
> >>            map vs. gem object vmap/mmap ]
>
> > Do we have any idea what drivers are actually using
> > write-combine and decrypted?
>
> drivers/gpu/drm# find -name Kconfig* -print | xargs grep -l DRM_GEM_SHMEM_HELPER
> ./lima/Kconfig
> ./tiny/Kconfig
> ./cirrus/Kconfig
> ./Kconfig
> ./panfrost/Kconfig
> ./udl/Kconfig
> ./v3d/Kconfig
> ./virtio/Kconfig
>
> virtio needs cached.
> cirrus+udl should be ok with cached too.
>
> Not clue about the others (lima, tiny, panfrost, v3d).  Maybe they use
> write-combine just because this is what they got by default from
> drm_gem_mmap_obj().  Maybe they actually need that.  Trying to Cc:
> maintainters (and drop stable@).
>
lima driver needs writecombine mapped buffer for GPU hardware
working properly due to CPU-GPU not cache coherent. Although we
haven't meet problems caused by kernel/user map conflict, but I
do admit it's a problem as I met with amdgpu+arm before.

With TTM we can control page allocated and create a pool for
writecombine pages, but seems shmem is not friendly with
writecombine pages.

Thanks,
Qiang
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
