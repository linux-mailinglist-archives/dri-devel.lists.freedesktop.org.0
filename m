Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ABC46BD98
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 15:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0315F73C4C;
	Tue,  7 Dec 2021 14:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C457EAA4C9;
 Tue,  7 Dec 2021 14:26:27 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id t34so14377660qtc.7;
 Tue, 07 Dec 2021 06:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e7rj1CsKDKzIJm7+JHPdHBzLjFXKBEnM/tALIHYhPN0=;
 b=M3i+JcynXtKk4qlW3axnXK++Rdg/cH/8CB04Y4onAV51ww7mqjyjzW3ZZvUI86ndte
 1f+BCv0ND1WPllqq40WPKdutQajSjOzeH68IoGvnzbX+xl70jyJ6Y1CGCqTrvUnf5aCq
 Ppx+H3HIRLdzB806qJx6fYie9mnWfMU0myLS7TN5t9rOyxLZob3ZPybStDQU396XFJyM
 E5S/J7Q+3yOz+3KdsJkYi+/62X3C3BrA7EZjZsKnzsP2cH8tNmRcs24DPocLzy+YAQQE
 YZftURmiZn7GgykwvI1O5fpRT9j+7wpyn7+mmkeks119ZwvMefp2r2zBuLY2eAwmibVr
 ZS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e7rj1CsKDKzIJm7+JHPdHBzLjFXKBEnM/tALIHYhPN0=;
 b=eQ8db+TN7QUhgoRevaimBgtpG576bRtQpcgHQ2xctRVZUwUE5PD7niKg6ai+G4o6fl
 XuP5tGazwPUN3F6/AGprLWHePK1EjgdwaH+ZNqRBMETvCKLdF//LWExbFHGVeST0vp3T
 ql5NCotKu9XB/DRve0OXaKDk4OcekBOhblspxXAiRE+KbJXA6V3vCzUXGmNxKg0ycztI
 i/yIxrNc6jxKglnENwyx24TDl5fvGcuU9lEnJYW5GwGJ4fesix0i3HXuOaLuVud6wptF
 x4bOxE+vXvTNzgRkgbycPyOsS+29xCeJwn2wKmeg6cOJCv7xzia6pYNTdzmKIjENhGUp
 5jSQ==
X-Gm-Message-State: AOAM532bRtKbY9HoUcDi24zcxlIOOETt5XJbiUcqtxRelnb66oXZ8tfi
 D/dFbVtvswCxltEyZ5qgqIibsh12Zji+AOYyJ3COm/5M4Kk=
X-Google-Smtp-Source: ABdhPJwLdoJPWKmsAVqGgMmZlGCmN93uaS8qriHkBgRHDAy2h6iP+xT/KDV69ctWgxIDVuzLwbmhGk/0cxdMVTbhpGA=
X-Received: by 2002:a05:622a:1055:: with SMTP id
 f21mr48473555qte.421.1638887186880; 
 Tue, 07 Dec 2021 06:26:26 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-9-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211129134735.628712-9-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 7 Dec 2021 14:26:00 +0000
Message-ID: <CAM0jSHOiNUnPzzAwFB6d4z54MTtcyXBNWV02pgnkA_jD7sz5ZA@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] drm/i915: Pass trylock context to callers
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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

On Mon, 29 Nov 2021 at 13:58, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> We are moving away from short term pinning, and need a way to evict
> objects locked by the current context. Pass the ww context to all
> eviction functions, so that they can evict objects that are already
> locked by the current ww context.
>
> On top of that, this slightly improves ww handling because the locked
> objects are marked as locked by the correct ww.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
