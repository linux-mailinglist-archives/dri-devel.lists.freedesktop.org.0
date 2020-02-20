Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB7A165ECF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 14:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079546ED82;
	Thu, 20 Feb 2020 13:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154616ED82
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 13:30:20 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id i4so1176916vkc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 05:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TvGvEaKUY5OAPmEKr66mKxrQdN9rSuIrkimiK1/BRZY=;
 b=iVTti6eRBqRs2PbLbxop7G6mJ0hPCqQEbZDPHde3oDJRJCZMkVOGyyywrTcmax/Qvu
 jhliBAuxcnDr1yaEHydNX5n1qE0RYhWtKMAprlR0IW0IFxNHCH7aLW4GF4u3dPHHK6vA
 a+QJYJTx8T8yUqXbwcTeUP3HJPdxxX8LEzWJbzesH/Q6zYMBsqyjFjS1LMpcFhATWiy5
 MSpGss7jNI22HoZm19YVaG10iElhAoyeVuJA+mZmH6+nfhTgvpcWXWpj3mqwVG2edsZB
 bYIf3c/4lX58IRhZnYDSlJF7FBMOeZq5cWIsbI2Vs0JcHJcZZKD97S7oyy63BkEO44e6
 jmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TvGvEaKUY5OAPmEKr66mKxrQdN9rSuIrkimiK1/BRZY=;
 b=O9tiK0E4fD+WYy96vfo4CRHWtZaeaOCyXHI0urbjvhXm7+pG5gcqxPW09PGO7Hco0K
 H65Rjj5QQVOYTUs0O3Oh3UC5kUdyyoaxbchqqR/qQbN2dewr/8pDi6aR3QcAJd6VSM6H
 mZXynVJ2L+rpIuKQyim7CYxI7/nm31oyU5my9henyI93+FMrrZ7NoJLVs70UCaQ4x1ec
 Zzt4k0qSYLfJVk47V8yIEZUcm8dDetDKe0XQTAVKKqA937UUxAjhsLNj2rYYyPDr7OoK
 gDc9JlUCY+G3BjXtNqQUwrcFrCnDbrXzMKSuMsrH57w/WJmZePdHAYfUmf83N0slsDiJ
 66GA==
X-Gm-Message-State: APjAAAXvpewPKSTH3BdrXzG9hJEjGkcB/gm9Nni3Mn1BTuvdUuXAB+xY
 F7uR5HWLbe4byRuj6QC55bKwUJR0No4AujaTIAGZbqX3
X-Google-Smtp-Source: APXvYqyJwdIL0uwCo6xu40i+gTCRDxPro0Xgek8AZdsypmy/HVIfoqp9CqrUU127zg055vlW7g4gNcPvUN4FALZx3RA=
X-Received: by 2002:a05:6122:1185:: with SMTP id
 x5mr14223653vkn.38.1582205419240; 
 Thu, 20 Feb 2020 05:30:19 -0800 (PST)
MIME-Version: 1.0
References: <20200219204002.220744-1-jbates@chromium.org>
In-Reply-To: <20200219204002.220744-1-jbates@chromium.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 20 Feb 2020 13:30:07 +0000
Message-ID: <CACvgo52oabauyoz81Q1rpp46kf4F_mYZeBb5oSOvW3tsfQT7nQ@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: fix virtio-gpu resource id creation race
To: John Bates <jbates@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On Thu, 20 Feb 2020 at 08:45, John Bates <jbates@chromium.org> wrote:
>
> The previous code was not thread safe and caused
> undefined behavior from spurious duplicate resource IDs.
> In this patch, an atomic_t is used instead. We no longer
> see any duplicate IDs in tests with this change.
>
> Signed-off-by: John Bates <jbates@chromium.org>
Adding a fixes tag like below makes it easier to track. Especially for
Greg and team who are working on stable kernels.

Fixes: 3e93bc2a58aa ("drm/virtio: make resource id workaround runtime
switchable.")

HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
