Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8506C3D54E8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 10:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EA26E83B;
	Mon, 26 Jul 2021 08:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAA06E82E;
 Mon, 26 Jul 2021 08:09:00 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id g11so6409895qts.11;
 Mon, 26 Jul 2021 01:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4aGx/FBXoLt5udIXpTvietw36g/kMHAamBIfxDLEhiE=;
 b=Ko0e4K1xKhD72cWpHgH6ez8YKdGN0d7uAGasJRZURgIQyEGtRd3MX5401DbwNqNZbW
 81AEWxMcYlFFKb0P9Edax4impLKU1xM2iYHL+Hbvgp+SA8k3uw9bNJYn9arsuodB29hr
 3laNXtKuwC97MJV50cu7JOTixPMR0l7TbmnBzMZ+BhM5eeeZHjQR9JUYIXZZgHtl7n5v
 tlMNvIYqmAiwlnrtr2+OWjLkd5JShWiINMAPyU/cKhxqxt/chbs9NWXq/jhpo8ypEgxZ
 OyeEXGnzdCIlyv3KZROc6pUZOoCWbpZJq/y7egSLnhP+ZNJDpKTlokhbxHFy7HUw0x4u
 7dgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4aGx/FBXoLt5udIXpTvietw36g/kMHAamBIfxDLEhiE=;
 b=BTGLspdc7+NFddBllghQqhaQlj8itnjjvsdm1udGXKQmBzRc+6es2yWtc7JyX6cEX1
 bNy97bEpbVKIwQtyKTMXMA5irTyYv6iX4l5aS6D5s4K/LqgcRZeqCMZlbrYPy1cptLSd
 mLJ6pEf0TfpBigHbLgjfVMhvweHBuIX7JFp8xrqlGFcdJNUomMBE8zNcs2YQSDtVZ8HH
 CCYpIzyXHhKCWQa5Ex+8dToKAXdAuRkRLKf8/iwLfx4MDdxUzxM7ZQf34wKJ6VJ4oZKc
 QeWErS1608nw2inx5L3g2l98jKNnswfutaYP//2m/xiB2K+FjozMfdS1+148ZxBxH508
 +K0A==
X-Gm-Message-State: AOAM53313KFXMq7RstDSXRrttmu1Il/xOxfqPmHAU+keh313CYcZK1HB
 qyVkCq2aBKRObXJ+8YSMV5k9OnoVEr80l3J8Dig=
X-Google-Smtp-Source: ABdhPJxplPUPqebp25YqAG0qXCQM/pRFl0TnX9eBDaRVEzBuAr1hMXGckwVGIMPUGEbFD5RL2YGRsKsE7EvjlEPT1mo=
X-Received: by 2002:ac8:584c:: with SMTP id h12mr14299679qth.95.1627286939935; 
 Mon, 26 Jul 2021 01:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210723172142.3273510-1-jason@jlekstrand.net>
 <20210723172142.3273510-6-jason@jlekstrand.net>
In-Reply-To: <20210723172142.3273510-6-jason@jlekstrand.net>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 26 Jul 2021 09:08:34 +0100
Message-ID: <CAM0jSHOk7hiWiprdg3z_BcogpeyyaSQDqp=a8P9uJVnwLBGFHw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 5/8] drm/i915/gem/ttm: Only call
 __i915_gem_object_set_pages if needed
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
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Jul 2021 at 18:22, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> __i915_ttm_get_pages does two things.  First, it calls ttm_bo_validate()
> to check the given placement and migrate the BO if needed.  Then, it
> updates the GEM object to match, in case the object was migrated.  If
> no migration occured, however, we might still have pages on the GEM
> object in which case we don't need to fetch them from TTM and call
> __i915_gem_object_set_pages.  This hasn't been a problem before because
> the primary user of __i915_ttm_get_pages is __i915_gem_object_get_pages
> which only calls it if the GEM object doesn't have pages.
>
> However, i915_ttm_migrate also uses __i915_ttm_get_pages to do the
> migration so this meant it was unsafe to call on an already populated
> object.  This patch checks i915_gem_object_has_pages() before trying to
> __i915_gem_object_set_pages so i915_ttm_migrate is safe to call, even on
> populated objects.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
