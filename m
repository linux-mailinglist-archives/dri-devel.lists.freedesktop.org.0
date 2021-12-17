Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E797478BCF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 13:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E0310E69A;
	Fri, 17 Dec 2021 12:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049B910E69A;
 Fri, 17 Dec 2021 12:53:28 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id m6so2191868qvh.10;
 Fri, 17 Dec 2021 04:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yvPYlJrGmlK6MaQU5Z8KZreyX7GnLF+EIBuo1c8xWHY=;
 b=lLjwureh0okvqtDKUwnnhZHEy0CwLeydIQSTpfz3NI9aiftp180kyA0J1Y8ZnXcoTo
 eNDdL8iCZel/GCvKDJVjYTTDM4RrxKSGRGfkzp1JYy7VpZ1Baiy8GeC5v7JX0JzeTzw1
 NjyoBcY+DMr4fvEfvD8K96W+zlIEcMcwMXjXER2+RZ1Yf8SrTeDZfS7eypug8sMW+aet
 Hc0lL+z617TR56S5+mRY9XkhiHiyeUoxCtES0ersvWpoe1qigS0a8+2NmWDgM5sFy52P
 aYscn74rREVTXEG0YnNoQhQjV/vUFuouoMTxOdN/B9/9HuhZHCEz8bAfz/e3k4bnD6Ew
 mdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yvPYlJrGmlK6MaQU5Z8KZreyX7GnLF+EIBuo1c8xWHY=;
 b=4InKICnStE8Fahfm76orIA8aacgym7MMV9uDm5B3f3ip+cXKiQpmL9Z7UJOVNN/na7
 wjZEhnezMPDPbXramvlzneV2oumVK8973zhtZuldSr+z5ObpivN8Gu0NDiMAeA+B1Fu8
 RZfsiyiUe8RuYY9h1QmSQ0yKNsaH9Jh91zztBtg0TBblrecAalCIOfhFHx2xCepIAUub
 mso8UckFI1Gt1IJSOay6zkBwKTlnsJxFwOCRLTNwYIei8GxiCJRbM0mPtO5xAfq+Y7/U
 SsCCJo+/1cqTeom21iP9S6efU6ieUim19u15xJHxnH19tKK/4mMFXvII/Tt6hwi8IMas
 /LEg==
X-Gm-Message-State: AOAM5302vaSDBGQiEETCi7/tlooNVBuI/g/Lcr8vdivZ3bQpxnfH41DL
 LuQCvLoUMGkuOpVJrbESpj1OrMMOr6T2h+gn7hHxAgidF8Q=
X-Google-Smtp-Source: ABdhPJwa1jOeBpoaluddcxc4toM45UN3gj3kxj2n+ajOIkf4O6PwbiKP9WcMk2EqSHir9AzVWjSzOE6uCXog4cbLJEY=
X-Received: by 2002:ad4:5ce8:: with SMTP id iv8mr2109774qvb.21.1639745607069; 
 Fri, 17 Dec 2021 04:53:27 -0800 (PST)
MIME-Version: 1.0
References: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
 <20211216142749.1966107-10-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211216142749.1966107-10-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 17 Dec 2021 12:53:00 +0000
Message-ID: <CAM0jSHNBA-sEeV42rnWP=NQFBa6Ft-X0jcXa0mLTcXMfAq0_cA@mail.gmail.com>
Subject: Re: [PATCH v3 09/17] drm/i915: Trylock the object when shrinking
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

On Thu, 16 Dec 2021 at 14:28, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> We're working on requiring the obj->resv lock during unbind, fix
> the shrinker to take the objectl ock.

lock

>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
