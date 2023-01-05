Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1665C65EA22
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 12:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D3810E064;
	Thu,  5 Jan 2023 11:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA5810E064
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 11:46:37 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id s9so3830704wru.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 03:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pOH8zi6RR/eYdWs9hLvLYkO27payH15xQ5o2JpEneN0=;
 b=GgmdHZf5pmfo56symx+obJQB4jM3Rgz0vzH8laXYFoP4a2USJe8vM+l6iSETZFrl2Q
 KcnnF8V+BUV4WySvRf1baceB71BkjA3SuwLuAYzP8bO3kLKD/mjHYN//hHIj4p39LmIW
 /TlpUph5nVBMquBDEH2D0zm3HCtyPOyvqFVa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pOH8zi6RR/eYdWs9hLvLYkO27payH15xQ5o2JpEneN0=;
 b=XPhke/aSOtHVsmxSLoqkzdKAdryJseQz8GXbCU80zXqKycpEbactWvVo29a/lRlkq2
 EWf99CQULikWxpEWx3t20WZTqmz7w9T63vseQBiqsM3sZVf+MSWLHgvvE6sdbva7j+ns
 mtgGsk+3i30f0OCR/oSv2BfTrrh6w7P55Wkcx1dq8+zaKMCDbqBdD1Buo0vw+6lLGyjP
 9jLewX5q6HujnVuMVrozPkAhENh9j9vOaronyiYrQvEZgidxg97SfZ9trbuCywu9RD/U
 PXlZTnpKcrbB7T3sqW/2+jklZhil7d53+9azfz9l/2+Hh7/JniheQiRtwA50+4WqaJGU
 o3WQ==
X-Gm-Message-State: AFqh2koP+IiRaCBlDgl8ZYbEZ9lyASwsSbJoM7oqW+dTwzh0IL+Xh7Qd
 CGaEwSil5c8dEhS0PuF/dDv71w==
X-Google-Smtp-Source: AMrXdXuT1Ef/DURzQUPyUJiBfHJ9nC/lNGhv8tRkVkHajAgK8zACdpVtvcC+U0CawWYRbxYeWy9v4Q==
X-Received: by 2002:adf:ed47:0:b0:28f:6fe6:f963 with SMTP id
 u7-20020adfed47000000b0028f6fe6f963mr15613610wro.22.1672919196343; 
 Thu, 05 Jan 2023 03:46:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a5d6510000000b002755e301eeasm34321842wru.100.2023.01.05.03.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 03:46:35 -0800 (PST)
Date: Thu, 5 Jan 2023 12:46:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: Try to address the DMA-buf coherency problem
Message-ID: <Y7a4mWBE1j/B46JP@phenom.ffwll.local>
References: <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <346d6ad023ef8697aafd93ac1b100890f3637e44.camel@ndufresne.ca>
 <CAF6AEGuqgWi0T=B9cb+Uy7aoWBPGQmZ3JbwFcK_45GbkY2nHPg@mail.gmail.com>
 <Y3zeYnufgXJHQAbN@phenom.ffwll.local>
 <ae9ba9ba-3ad3-af23-be66-1540862bf571@amd.com>
 <20221123103338.238571e1@eldfell>
 <Y35LcspZ385IC4lJ@phenom.ffwll.local>
 <ba6e42f04c436d93bfa71d5dee7fd35ef2245073.camel@ndufresne.ca>
 <Y4cw36MUO+ftP468@phenom.ffwll.local>
 <24b660e2-ea38-7038-c182-156e1371fdcb@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24b660e2-ea38-7038-c182-156e1371fdcb@amd.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 linaro-mm-sig@lists.linaro.org, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 02, 2022 at 04:27:08PM +0100, Christian König wrote:
> Am 30.11.22 um 11:30 schrieb Daniel Vetter:
> > On Fri, Nov 25, 2022 at 11:40:04AM -0500, Nicolas Dufresne wrote:
> > > Le mercredi 23 novembre 2022 à 17:33 +0100, Daniel Vetter a écrit :
> > > > On Wed, Nov 23, 2022 at 10:33:38AM +0200, Pekka Paalanen wrote:
> > > > > On Tue, 22 Nov 2022 18:33:59 +0100
> > > > > Christian König <christian.koenig@amd.com> wrote:
> > > > > 
> > > > > > We should have come up with dma-heaps earlier and make it clear that
> > > > > > exporting a DMA-buf from a device gives you something device specific
> > > > > > which might or might not work with others.
> > > > > > 
> > > > > > Apart from that I agree, DMA-buf should be capable of handling this.
> > > > > > Question left is what documentation is missing to make it clear how
> > > > > > things are supposed to work?
> > > > > Perhaps somewhat related from Daniel Stone that seems to have been
> > > > > forgotten:
> > > > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210905122742.86029-1-daniels%40collabora.com%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C45786a08e6dc4af2816508dad2bdf957%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638054011293521624%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=GjsoJGNoPozTS2SWeeirURzQatI5vfl9%2B%2BfzoavgTbw%3D&amp;reserved=0
> > > > > 
> > > > > It aimed mostly at userspace, but sounds to me like the coherency stuff
> > > > > could use a section of its own there?
> > > > Hm yeah it would be great to land that and then eventually extend. Daniel?
> > > There is a lot of things documented in this document that have been said to be
> > > completely wrong user-space behaviour in this thread. But it seems to pre-date
> > > the DMA Heaps. The document also assume that DMA Heaps completely solves the CMA
> > > vs system memory issue. But it also underline a very important aspect, that
> > > userland is not aware which one to use. What this document suggest though seems
> > > more realist then what has been said here.
> > > 
> > > Its overall a great document, it unfortunate that it only makes it into the DRM
> > > mailing list.
> > The doc is more about document the current status quo/best practices,
> > which is very much not using dma-heaps.
> > 
> > The issue there is that currently userspace has no idea which dma-heap to
> > use for shared buffers, plus not all allocators are exposed through heaps
> > to begin with. We had this noted as a todo item (add some device->heap
> > sysfs links was the idea), until that's done all you can do is hardcode
> > the right heaps for the right usage in userspace, which is what android
> > does. Plus android doesn't have dgpu, so doesn't need the missing ttm
> > heap.
> 
> Hui? Why do you think we should have a TTM heap in the first place?

[sorry for the really late reply]

Extremely late reply, but p2p buffer sharing when you want it in vram is
only something ttm can provide you. And if the goal is to have all buffer
sharing needs served by dma-heaps, then eventually that'll be needed too.

But probably totally fine to just not have it for another few years
(decades?).

> As far as I can see we need three different ways of allocation:
> 1. Normal system memory.
> 2. CMA based.
> 3. Device specific.
> 
> When any of the participating devices needs CMA then user space must use the
> CMA heap, when any of the participating devices needs device specific memory
> then user space must use device specific memory (from that device).
> 
> It still can be that two devices can't talk with each other because both
> needs the buffer to be allocated from device specific memory for a
> particular use case, but at least all the cases for both none CPU cache
> coherent ARM devices as well as device specific memory for scanout should be
> handled with this.

Yeah on ARM this should be enough.
-Daniel

> 
> Regards,
> Christian.
> 
> > 
> > But yeah the long-term aspiration also hasn't changed, because the
> > dma-heap todo list is also very, very old by now :-/
> > -Daniel
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
