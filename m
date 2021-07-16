Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFB53CBC47
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 21:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40136E9BE;
	Fri, 16 Jul 2021 19:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA3C6E9BE;
 Fri, 16 Jul 2021 19:18:38 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id v14so7885269qtc.8;
 Fri, 16 Jul 2021 12:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IbD9NFzkkCF1/bj94r1nf8Mo3X1PW1Y7tz7ygBwims8=;
 b=odNqbexKPZ0+/vsUh5i3uF8dHji54FHtOYo16OWPRVOp5nJlkf7J3m7OsAQISVjYDB
 MYpBFubo+1pB4YlYnl4LxBFPHL+9V5rJSmF5sYGg1wh8tsNyYt5sZATXSVrDOsteWz8U
 8zg1LbEDQ49UKMao2QrBldEPF0LT2I7BBPBnzTt82amS0eEWHrkxXn60NICQgcHlzeZ6
 obuMowXrjDJu3ji4l+7ENuNDBDn7Ix2mLaMzNJJPz6igxyN8N1GjfBVr0BVLZjRV6WRy
 8copos4iZ26yN2AYs0APOBCRCzs2XJgxVZk8HHcxsVW9ZPP/wiiyEHCSBBnIpSmd8EK+
 Fmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IbD9NFzkkCF1/bj94r1nf8Mo3X1PW1Y7tz7ygBwims8=;
 b=EZmzArP16lEeJb5/hJYODQ3Wd/IaSsXzz6RRE2euc4fWlbMHdJx9gzmRhBDXILkFQ5
 QgUOHrunNr24jmuSb+PuYjZTmbhkR47V4ojSol0vcMUA3kDfygYAXcBdhUOhBFkPmUcJ
 95UgTUQxSR9ZfOmE2AE0YpaSYm3FEav/xHwDUz3tKw0/ZIm+cO5S4EyKjdUOTUIcst2t
 K3GvXlPDE/rIX+/HDNboyI25P1gXx/YYptBjH6oYoGddi+WHx/Me4d8lxxvybsfEphqq
 fVa9a1XSig7hOtJ0w3vCk/iYJwOkTko0MTs+LLgPDsr3JrUZXWcwgNC9OQscu4J+56+o
 ydsw==
X-Gm-Message-State: AOAM533DMQB7fqpicKyMvRprWQJGUNJAR2WRWFKCfArIOoseWnRViLSL
 Qtff/TNn7xuvxjSKg2hN53VVXMrjogmB05B4ifA=
X-Google-Smtp-Source: ABdhPJyUeHPFAZswfwODpR6+iBdGRh0u/8dDsA/p7B76LOdG5h0uC7U/QW1+3Df6W7QuJ25hYJzXjtxH+osL243N9G0=
X-Received: by 2002:a05:622a:448:: with SMTP id
 o8mr10631538qtx.341.1626463117720; 
 Fri, 16 Jul 2021 12:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210716141426.1904528-1-jason@jlekstrand.net>
 <20210716141426.1904528-3-jason@jlekstrand.net>
In-Reply-To: <20210716141426.1904528-3-jason@jlekstrand.net>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 16 Jul 2021 20:18:11 +0100
Message-ID: <CAM0jSHPzc5rO4AL2oG1vBEt9Ku8++noaOqZ89aMBLDkC=ShBHw@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/i915/gem: Refactor placement setup for
 i915_gem_object_create* (v2)
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Jul 2021 at 15:14, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> Since we don't allow changing the set of regions after creation, we can
> make ext_set_placements() build up the region set directly in the
> create_ext and assign it to the object later.  This is similar to what
> we did for contexts with the proto-context only simpler because there's
> no funny object shuffling.  This will be used in the next patch to allow
> us to de-duplicate a bunch of code.  Also, since we know the maximum
> number of regions up-front, we can use a fixed-size temporary array for
> the regions.  This simplifies memory management a bit for this new
> delayed approach.
>
> v2 (Matthew Auld):
>  - Get rid of MAX_N_PLACEMENTS
>  - Drop kfree(placements) from set_placements()
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Matthew Auld <matthew.auld@intel.com>

If CI is happy,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
