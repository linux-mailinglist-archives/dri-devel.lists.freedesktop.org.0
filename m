Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C02B471E0F
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 22:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2062B10F67D;
	Sun, 12 Dec 2021 21:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AA310F67D
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 21:29:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0EEDCB80D90
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 21:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B57EC341D2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 21:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639344562;
 bh=LlxB3rcX8pfg5j2Qcjxycor4wz60/36vh1CIxrmwBig=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SHctnyFq//XhEggeIz01MLzbKQba/Y/5FNzsSzwycf30W5kFWprkUPxK9p7cPEl8L
 mYaHvJ+kSgxiUiJh42jc9dWGcQtzLnu6p3DFot2nEaD+56YCo3oAkL8GmEMPQ/AwTf
 P1xBbjIjYGtWBnkCzVFZMfdIkY+kGTfJj9e9mVRx8G/J5mf+HuhGkyVgpDfVsChAHK
 uMqVBVgCHGYH3ZYgvzLISYeYOin3oTYBYqjmcAKyKg/mjJGo90Z3hwQlWOSzZshfwi
 AMpjLWCbBcxthL2iKKq+tEW2ipgy/v1ZPUeHZPDJN7m2SpluIitdB0wh0MSShbP3Zr
 McZr1keqJLImA==
Received: by mail-ed1-f49.google.com with SMTP id w1so46042561edc.6
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 13:29:22 -0800 (PST)
X-Gm-Message-State: AOAM531U3fJ7F9Ez6JHI0kYyHx5ekGQaX1UgNvfY2uKd/al5ywVkZNGG
 h9UST0Hq6aFrE8kz2FjCuT+L2BETk7LpzTvDpg==
X-Google-Smtp-Source: ABdhPJzLtlkhCMoGmQBUywxk2+JoY0BZKDxU6ibta6QGByc19kVnbgbJRKPRHI6qdooKbzeyxkIU+oB+jTkG1tKCVaE=
X-Received: by 2002:a17:907:3f24:: with SMTP id
 hq36mr39247926ejc.390.1639344560281; 
 Sun, 12 Dec 2021 13:29:20 -0800 (PST)
MIME-Version: 1.0
References: <20211212062407.138309-1-marcan@marcan.st>
 <20211212062407.138309-2-marcan@marcan.st>
In-Reply-To: <20211212062407.138309-2-marcan@marcan.st>
From: Rob Herring <robh+dt@kernel.org>
Date: Sun, 12 Dec 2021 15:29:08 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+0=3V7noGbK2-h+yXeCPZ4QMXVroWvTTL5u7i22ibc6w@mail.gmail.com>
Message-ID: <CAL_Jsq+0=3V7noGbK2-h+yXeCPZ4QMXVroWvTTL5u7i22ibc6w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] of: Move simple-framebuffer device handling from
 simplefb to of
To: Hector Martin <marcan@marcan.st>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 12, 2021 at 12:24 AM Hector Martin <marcan@marcan.st> wrote:
>
> This code is required for both simplefb and simpledrm, so let's move it
> into the OF core instead of having it as an ad-hoc initcall in the
> drivers.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  drivers/of/platform.c          |  4 ++++
>  drivers/video/fbdev/simplefb.c | 21 +--------------------
>  2 files changed, 5 insertions(+), 20 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
