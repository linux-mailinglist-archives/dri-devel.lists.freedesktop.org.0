Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A66365E6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 17:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E323810E5A9;
	Wed, 23 Nov 2022 16:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5950010E5A9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:33:58 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z63so6568008ede.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 08:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vQ8nm6+WyKeJ4NSkaQqYp2teKXcJsmSR2OlnL5nJCng=;
 b=LTaFlYw0Pm8utr+zS/UXk0FrQTM6S4ZrXc7dE2wTm7nTS9rZ8ucryQq8shd4RhG9kc
 r71lmcHkASsmyfN1/CaYdQBfvLaqjDdGshMjTLB6NY6FGg2bX5UtJmqsuDDXnT6Fjk47
 ERYCfdANhr7rbF2w+N6ES5m3u7CEOUYzqV9sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vQ8nm6+WyKeJ4NSkaQqYp2teKXcJsmSR2OlnL5nJCng=;
 b=MMLAJZdjMBsATbYixz64A4kfU4ymEf9HyB85Ac89Yfd6L9qP4qrDzqmzt5qVrCkTv8
 0I4nAKZyJl4u3mUyw/0lvC214iUFseK6e0fFeo6IVPzUqfHyZ40fW9MqRTPnvFvD3q7q
 r9t/x0l+BP057cKJUn929pApAOCph8CaKz736uuW1UFgS7t3u2VbhPXomPBPrLuQT2eM
 Xm4FVkHR266ksn23obk0L0P8EvggS2F4TZlhoQHIA1FtKjEFuFahIGVl4KeKBZkc9H+6
 AGbWcgCYFRwuS89+dHX6cNX5GOZnMPlikfZLK+jXfH72Q/eGaWGVcVWNYeaUyETmzPP1
 DDuw==
X-Gm-Message-State: ANoB5pn6mnH+wU6DlKJ6PICUJps02t6MFKOGf2TJWWL7VeBaIzl3L13M
 xuS7FzgbfELbXfM9WMw1ungxkA==
X-Google-Smtp-Source: AA0mqf4Enr1qM6eoPL9aF0axGh9DxgF+M99FiwcrAbYtdUzrx2lqXegdh98KtI4edE32ukwrcdXh6Q==
X-Received: by 2002:a05:6402:3719:b0:461:4f34:d8f4 with SMTP id
 ek25-20020a056402371900b004614f34d8f4mr26937012edb.144.1669221236923; 
 Wed, 23 Nov 2022 08:33:56 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 ez6-20020a056402450600b004643f1524f3sm7770969edb.44.2022.11.23.08.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 08:33:56 -0800 (PST)
Date: Wed, 23 Nov 2022 17:33:54 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: Try to address the DMA-buf coherency problem
Message-ID: <Y35LcspZ385IC4lJ@phenom.ffwll.local>
References: <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <346d6ad023ef8697aafd93ac1b100890f3637e44.camel@ndufresne.ca>
 <CAF6AEGuqgWi0T=B9cb+Uy7aoWBPGQmZ3JbwFcK_45GbkY2nHPg@mail.gmail.com>
 <Y3zeYnufgXJHQAbN@phenom.ffwll.local>
 <ae9ba9ba-3ad3-af23-be66-1540862bf571@amd.com>
 <20221123103338.238571e1@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221123103338.238571e1@eldfell>
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
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Nicolas Dufresne <nicolas@ndufresne.ca>, sumit.semwal@linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 10:33:38AM +0200, Pekka Paalanen wrote:
> On Tue, 22 Nov 2022 18:33:59 +0100
> Christian König <christian.koenig@amd.com> wrote:
> 
> > We should have come up with dma-heaps earlier and make it clear that 
> > exporting a DMA-buf from a device gives you something device specific 
> > which might or might not work with others.
> > 
> > Apart from that I agree, DMA-buf should be capable of handling this. 
> > Question left is what documentation is missing to make it clear how 
> > things are supposed to work?
> 
> Perhaps somewhat related from Daniel Stone that seems to have been
> forgotten:
> https://lore.kernel.org/dri-devel/20210905122742.86029-1-daniels@collabora.com/
> 
> It aimed mostly at userspace, but sounds to me like the coherency stuff
> could use a section of its own there?

Hm yeah it would be great to land that and then eventually extend. Daniel?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
