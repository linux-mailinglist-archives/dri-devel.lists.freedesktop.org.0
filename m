Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DAC4BA591
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 17:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DBC10EF2B;
	Thu, 17 Feb 2022 16:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C933B10EF2B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 16:18:43 +0000 (UTC)
Date: Thu, 17 Feb 2022 16:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1645114721;
 bh=xig78IbVhEkp/h3Vt76vo9JttYCE5O3eydjvdxHGgXU=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=lqOBZMqEfCVq3VumfrDJrT7drykDVqUPX2D3vk364ddWATgj8xPNQrXL7fqBbtGpg
 c1b43UdLgmNm4g96P5YVN6Jq3Dd1PDCb9Qgl+/q81JHD42yDx5qm1Vl3QnE/P7ysLB
 wioiqgNVq2+cqYjnFIbcuRcouR9qQl9K6b5z45VxxxpTAuLEiBp+qHvIt5oWyt7NXG
 dWMUKvOU0bq5rH3P1yjDM2q9ISEdnvS7SOfpt1paw375giCIWg8IbBkyqgx4w8PM+I
 gV1/rSgl37Z383id/4R+onPCEUP9nj9N34qp2QwhppVkwSk77Ji3jo2VfsUBJ0nPuC
 rH48B50eaQYXQ==
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/8] drm/fb-helper: Add support for DRM_FORMAT_C[124]
Message-ID: <z7NQYyKnuywG0bUt7Wr9e53SGgSZgbMVNKpLAOIP0mH3GljFQI3hd_aQFc8qaqwTbBq8yF3QvR9ugLxlivX-ogj508Vc60XHQPAN3IL5Uik=@emersion.fr>
In-Reply-To: <CAMuHMdVK7eWfod73JQAntO=7BAMEcS-ktH4NJmDjna3zUn7giw@mail.gmail.com>
References: <20220215165226.2738568-1-geert@linux-m68k.org>
 <20220215165226.2738568-3-geert@linux-m68k.org>
 <4fff0c08-adab-c1d5-4a7e-1513cb2bf7ca@suse.de>
 <CAMuHMdVK7eWfod73JQAntO=7BAMEcS-ktH4NJmDjna3zUn7giw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, February 17th, 2022 at 17:12, Geert Uytterhoeven <geert@linux-=
m68k.org> wrote:

> > What is C0?
>
> A non-existing color-indexed mode with zero colors ;-)
> Introduced purely to make a check like in the comment below work.
> What we really want to check here is if the mode is color-indexed
> or not...

Maybe it would be worth introducing a drm_format_info_is_color_indexed
function? Would be self-describing when used, and would avoid to miss
some places to update when adding new color-indexed formats.
