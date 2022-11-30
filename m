Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EF663D370
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 11:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072CA10E1EC;
	Wed, 30 Nov 2022 10:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2801F10E1EC
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 10:31:00 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id o30so12865317wms.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 02:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YXQc9XEWwXQO5oC1YosCl7efmTS9cTKVl0+Fl9Ojos8=;
 b=cFwn//sQuJyEF+Xqojf4F3dtCdu6AOypSnbLJkW3w/W2bvEbw3MBgE85Rlo8X/E9Hn
 vwQOJMOLxK031tjfVgULjfK7VQth9G9gdUafF2gebgGPWDePmMoHlZn/U4SxZldtR0Ml
 tNjZx9/SU8X1YZWdqC9XDCSlsM6k1qJVhaoQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YXQc9XEWwXQO5oC1YosCl7efmTS9cTKVl0+Fl9Ojos8=;
 b=bcQi248zzgaCxJcboj6F2ee6geqByqCRkbZ8GETo5fbpsMUzmg6So2j04qunneyDQ3
 /gvAYwIsCjpwFPJ91r+wYw/2QAlxLl/M0Hc5mRZvJhEphoquxczp2LYuQA1MwHsJ2WTw
 ZtMh6yYJTvmDemg+GyKePuu54gr155xOFRgBuM763RFjvSa8RZ2Y9/somzJtOolRQCMG
 v8WnQZ4O9nJl2HuivqKPxMykAL5qHmxEKhErgN8z1ErIkJq3tW8pzv9RtT/X+mDaUSed
 aw0zUkqWyaOUM4///pXL7mG299pUIEraumJZUyiG/6CiDQ4PMFzbw6QmHn8avT+1HSQ7
 wIXg==
X-Gm-Message-State: ANoB5pnbbtbUQtwiHUhQ023NP8V+UZeU3w1eotiyIfM3kUYeS/4f/n7A
 Q9O+O17bmNPuRT5xsi1RpONIHg==
X-Google-Smtp-Source: AA0mqf6SRJsk/MKKc9HQxdUZJsG0RmKyyQXTtpD31OSl0Vlst25pFdkXAN5H9o19tdez0HxXD0c9+A==
X-Received: by 2002:a05:600c:5407:b0:3cf:774b:ce5a with SMTP id
 he7-20020a05600c540700b003cf774bce5amr36233164wmb.0.1669804258491; 
 Wed, 30 Nov 2022 02:30:58 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 u18-20020adfed52000000b00241d2df4960sm1109971wro.17.2022.11.30.02.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 02:30:57 -0800 (PST)
Date: Wed, 30 Nov 2022 11:30:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: Try to address the DMA-buf coherency problem
Message-ID: <Y4cw36MUO+ftP468@phenom.ffwll.local>
References: <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <346d6ad023ef8697aafd93ac1b100890f3637e44.camel@ndufresne.ca>
 <CAF6AEGuqgWi0T=B9cb+Uy7aoWBPGQmZ3JbwFcK_45GbkY2nHPg@mail.gmail.com>
 <Y3zeYnufgXJHQAbN@phenom.ffwll.local>
 <ae9ba9ba-3ad3-af23-be66-1540862bf571@amd.com>
 <20221123103338.238571e1@eldfell>
 <Y35LcspZ385IC4lJ@phenom.ffwll.local>
 <ba6e42f04c436d93bfa71d5dee7fd35ef2245073.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba6e42f04c436d93bfa71d5dee7fd35ef2245073.camel@ndufresne.ca>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 25, 2022 at 11:40:04AM -0500, Nicolas Dufresne wrote:
> Le mercredi 23 novembre 2022 à 17:33 +0100, Daniel Vetter a écrit :
> > On Wed, Nov 23, 2022 at 10:33:38AM +0200, Pekka Paalanen wrote:
> > > On Tue, 22 Nov 2022 18:33:59 +0100
> > > Christian König <christian.koenig@amd.com> wrote:
> > > 
> > > > We should have come up with dma-heaps earlier and make it clear that 
> > > > exporting a DMA-buf from a device gives you something device specific 
> > > > which might or might not work with others.
> > > > 
> > > > Apart from that I agree, DMA-buf should be capable of handling this. 
> > > > Question left is what documentation is missing to make it clear how 
> > > > things are supposed to work?
> > > 
> > > Perhaps somewhat related from Daniel Stone that seems to have been
> > > forgotten:
> > > https://lore.kernel.org/dri-devel/20210905122742.86029-1-daniels@collabora.com/
> > > 
> > > It aimed mostly at userspace, but sounds to me like the coherency stuff
> > > could use a section of its own there?
> > 
> > Hm yeah it would be great to land that and then eventually extend. Daniel?
> 
> There is a lot of things documented in this document that have been said to be
> completely wrong user-space behaviour in this thread. But it seems to pre-date
> the DMA Heaps. The document also assume that DMA Heaps completely solves the CMA
> vs system memory issue. But it also underline a very important aspect, that
> userland is not aware which one to use. What this document suggest though seems
> more realist then what has been said here.
> 
> Its overall a great document, it unfortunate that it only makes it into the DRM
> mailing list.

The doc is more about document the current status quo/best practices,
which is very much not using dma-heaps.

The issue there is that currently userspace has no idea which dma-heap to
use for shared buffers, plus not all allocators are exposed through heaps
to begin with. We had this noted as a todo item (add some device->heap
sysfs links was the idea), until that's done all you can do is hardcode
the right heaps for the right usage in userspace, which is what android
does. Plus android doesn't have dgpu, so doesn't need the missing ttm
heap.

But yeah the long-term aspiration also hasn't changed, because the
dma-heap todo list is also very, very old by now :-/
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
