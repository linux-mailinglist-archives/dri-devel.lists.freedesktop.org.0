Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1160F3CBC5D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 21:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EC26E9CC;
	Fri, 16 Jul 2021 19:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A476E9CC;
 Fri, 16 Jul 2021 19:22:02 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id c13so5263283qtc.10;
 Fri, 16 Jul 2021 12:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LYbgDMubYjaOILeRYFVTGYoETdYeGIpoH+k6mQhBBf8=;
 b=bDYyf1zW6NCivkz29qgaU27ZGOXfTZ0gjTU888kkE/miCdnGUibSBlnJYov8EMrvt/
 1kpozBNdDDmZlzNYpjOEZXOfGAVeh+SvK9lBgqpFZqZ0xeb8nla6vrQXlIOl7UmR05ZU
 QeJQlPS/H1nHwrCZ337l02C9j3MZhEA+cy6nmSPlR4atuEtlBZxasi6a9OeGY2vZHFu1
 mq38Ea/o6fxn3e3jg2pp6R8VMq2De7iyfDeOW57r+PiopbI2JWv+MhUGAXaKJbXi7hBg
 6Cer1h6e7suMo+jXfC3g7kYgfcPKpa7xlblW/E76TMBAAw8jngfBpRwo0R8FDgkTlxus
 EMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LYbgDMubYjaOILeRYFVTGYoETdYeGIpoH+k6mQhBBf8=;
 b=rJwX8ucqvLKC+oPpEZbYCzT4qnyiii8DwZx3cKNcjdkPprtSW/9947Vyuy+kg/arX6
 vbMATn2ofliaUQp8E4dmxHHCqpW5ppeoVBrFLyEf/ipl/MS8CCFyJbxZeTGvwKr04r0L
 iQ+PBhArrWNuaXEvmv+G3jihQRh6gI5SDfEz8GVWs4lY7+u2TbghjZwE3S/DcUHnoDgE
 htMDZLLzwHOi9SBaj7yJA/dXUw1JxFUGMbHWY5QFMINNM42EFLutSJg/xF7mwnRRc8rc
 8Mg/8lOKjy/foOFgNTMQFsTJzuATm49i8OTX/QcvVPfUvh68Na2lyWUsrqAoARVK8yeN
 bv5A==
X-Gm-Message-State: AOAM533ZHhUflVp2/bdQ88UxRIgF55KX0719bdC3+c0PgwlRFI9gIT/s
 Djp4OAtvMiU8SLjn2+0mLG4mviP4jqgJ+q4JOLU=
X-Google-Smtp-Source: ABdhPJwGXhHkzSpZuAdMEOCEIxPwQOltOSLhrzYft29ADAbdwldzTCLMDyN5jcTC48j9ZB/1rTu2+Otat6cDLW+yoys=
X-Received: by 2002:ac8:5c8c:: with SMTP id r12mr10542253qta.265.1626463321991; 
 Fri, 16 Jul 2021 12:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210716141426.1904528-1-jason@jlekstrand.net>
 <20210716141426.1904528-5-jason@jlekstrand.net>
In-Reply-To: <20210716141426.1904528-5-jason@jlekstrand.net>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 16 Jul 2021 20:21:36 +0100
Message-ID: <CAM0jSHNjG9ozYM1w3-G2LQgajrGCMnFXTjOPhAeDbLRhO4ejZw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 4/7] drm/i915/gem: Unify user object creation
 (v2)
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
> Instead of hand-rolling the same three calls in each function, pull them
> into an i915_gem_object_create_user helper.  Apart from re-ordering of
> the placements array ENOMEM check, there should be no functional change.
>
> v2 (Matthew Auld):
>  - Add the call to i915_gem_flush_free_objects() from
>    i915_gem_dumb_create() in a separate patch
>  - Move i915_gem_object_alloc() below the simple error checks
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Matthew Auld <matthew.auld@intel.com>

If CI is happy,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
