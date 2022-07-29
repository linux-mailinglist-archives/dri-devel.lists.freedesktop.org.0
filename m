Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72025852F1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 17:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F1410E1D4;
	Fri, 29 Jul 2022 15:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F183310E0F6;
 Fri, 29 Jul 2022 15:40:38 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bf9so7834230lfb.13;
 Fri, 29 Jul 2022 08:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=HWtZgfqryZS10gAM5+N9gAYNVLECjP2Z56KMURvmOKI=;
 b=euHZ1fQ1C+8MXJDNliazU66pJCoH1NCOGCtqLTKpdeASnGQkf+sY7yxLBk76yeVYay
 /EThO69XrLUTKSWN5LObbt4loU99UlWOf3oTDCNgKHDilPUDQoXejUL4JiJrJm6V6yJp
 QzjADGUrd2TOU0iyaCcbid3iRoNcNt+x4ZCX6hH1WxI2IbXnQQQnC4vpzjwftLaXzoCO
 Iy078jY1RFkL1j0OMVSzwbE1kjl89SWXdJ0MbXnRXay4hXDi/26q8fM/rUsXws4CXA8k
 HOjiZlnv1LArYZ+NpPcBvrU18gToZT/7AZJVw+dZikNiusCqqcNTqZPCl1johueID5eT
 VUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=HWtZgfqryZS10gAM5+N9gAYNVLECjP2Z56KMURvmOKI=;
 b=qUsYqsEA/ot44sNhvf+TdiIu1cTi5D4bTepoewfhbZ/yJo2jk/zTLi/bHGnUSEJ0B8
 ifE+YwEslYr+1jrG8fGkfONm+yi3Kt9oGWC3fsvy2M0AakQXczmhJ0Lcs4vutOhpEEqz
 u/raoKsQW5yDaWnDgf+Wyri69jSqBqiHY75wDC+LMIsdzY0ycXZrvOXcSf9PaN2vWL9p
 cb/C7kztm0Jcb1Y7TVZVuFaCwvrgB/ioz7UjhP2++uiKEvWUPBVxwCVjlHfvRl6/msgk
 YdpFww3TChEKXjI+7Lj1SM6GgOWu0Bkd72zo/lfHZNi9ci6YzoxlXcgOhaVBUDdyWsq3
 V3QA==
X-Gm-Message-State: AJIora/YNw1pkoIXFZPIzU9eevvto+DKRXbgR8rWFSEhwUWKVQJnroUs
 FX/1DkUM/zZxZPMO8vIebdzogN8nW9/6hdvmgJ4=
X-Google-Smtp-Source: AGRyM1sHvHUXlo1QU7/mh3/lb8kgSzVpxtss/27lKNBMvVfaHatlshZGnYxbG102EiWdDya/FmBDZL9xI/xdNeXM9Gk=
X-Received: by 2002:ac2:4f03:0:b0:481:50f7:ac07 with SMTP id
 k3-20020ac24f03000000b0048150f7ac07mr1348088lfr.422.1659109236965; Fri, 29
 Jul 2022 08:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220726175043.1027731-1-robdclark@gmail.com>
 <20220726175043.1027731-10-robdclark@gmail.com>
 <49fe9ecf-b1bd-a21b-8d8c-e4a33e3fa821@collabora.com>
In-Reply-To: <49fe9ecf-b1bd-a21b-8d8c-e4a33e3fa821@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 29 Jul 2022 08:40:24 -0700
Message-ID: <CAF6AEGuKU839m6TiARN3EwjPToo-qpdZR5cGD+BdJeiObjeY4A@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] drm/gem: Add LRU/shrinker helper
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 29, 2022 at 8:27 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 7/26/22 20:50, Rob Clark wrote:
> > +/**
> > + * drm_gem_lru_move_tail_locked - move the object to the tail of the LRU
> > + *
> > + * If the object is already in this LRU it will be moved to the
> > + * tail.  Otherwise it will be removed from whichever other LRU
> > + * it is in (if any) and moved into this LRU.
> > + *
> > + * Call with LRU lock held.
> > + *
> > + * @lru: The LRU to move the object into.
> > + * @obj: The GEM object to move into this LRU
> > + */
> > +void
> > +drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj)
> > +{
> > +     lockdep_assert_held_once(lru->lock);
> > +
> > +     if (obj->lru)
> > +             lru_remove(obj);
>
> The obj->lru also needs to be locked if lru != obj->lru, isn't it? And
> then we should add lockdep_assert_held_once(obj->lru->lock).
>

It is expected (mentioned in comment on drm_gem_lru::lock) that all
lru's are sharing the same lock.  Possibly that could be made more
obvious?  Having per-lru locks wouldn't really work for accessing the
single drm_gem_object::lru_node.

BR,
-R
