Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AE441804A
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 10:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93AD6E3C4;
	Sat, 25 Sep 2021 08:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7268A6E2BC
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 01:05:49 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id s17so24004704edd.8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 18:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bHrNUxSVHPFay18ykXVu5QYZYlU999IyVEIEXaMIIuk=;
 b=iTkDYHU1Pdjpw/CJx2+QNmwdCbhonPJpUXIUqnXR9yIkvOjnnex0e5mlt0mtDcju8j
 oQP4Ji6Gw1OwxXk2i9wlN7vaZ8T0NWTk2rZUTm5wKp1put7D8ZXHQwdOifFffsRFQ56j
 8VJYvaIhp3XTyzRUBemWf4JSftl1t4MCRYE8wHfpOyJkR3YifdXXmYM4F6mNeJ126DWI
 CnVhjFAKlE4w66VjnKBwDdczmy+KS3pUku7T0l3t+wTa2ebQQX34YSk/VvTtEMC7OWAU
 8nPGPI53thP01tGuUwYZGghvfpWvY5NPiytf0akiS/3hUr8EeZpaTCUZIzI+3YC/vi/L
 TMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bHrNUxSVHPFay18ykXVu5QYZYlU999IyVEIEXaMIIuk=;
 b=qmQlB7modek5Y/HDQeIsKnOox9hQbZruWkxQja3KluplQaHcRgUReXvYKlFgyWu9ma
 jX6d2GkEygR20K83D8EBmf3Mnnm4OlHM0LAk5eERKtl6khc4pWuvACHvK55g7i6ygSXD
 geQtvnUESRW8urGuPvYsqk17M+0ZEz4XAgWjcqD8YGLiLF92S3EqGP/p0FVZzVO+AeYy
 OOQsRwPPtGDWRcugC7SedI46L1t64j56OImFrXPJy5dNnI9DwD0HqfKis2B0v04RDxj9
 nJJrX2SgNrOLt7Tec+JPL0dlfH2HRR/ems9fnd/Mg3pCmSWf1xO1+2BoWjZbvgYnmyBP
 y5+A==
X-Gm-Message-State: AOAM531wB8A5geXV00DPGwJ2xgd7cNSCa7g89UtAwmiyytOLUuRIyroK
 mSyy2dViovjSXMCSR0JgDHDZlYBahqK4ojIPx78=
X-Google-Smtp-Source: ABdhPJxLSJQPETEhpVEg1BU+2BRSL97NdO0tOSj6i2gjP9uqxWyT7cdSbLHXanc2dvA0Ird037wFcY/UjHbhbbLpx7Y=
X-Received: by 2002:aa7:db17:: with SMTP id t23mr8756289eds.387.1632531947552; 
 Fri, 24 Sep 2021 18:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <1632519891-26510-1-git-send-email-justinpopo6@gmail.com>
 <1632519891-26510-4-git-send-email-justinpopo6@gmail.com>
 <20210924170505.6e62e32f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210924170505.6e62e32f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Justin Chen <justinpopo6@gmail.com>
Date: Fri, 24 Sep 2021 18:05:36 -0700
Message-ID: <CAJx26kUsAU+Ux3BFfHJFnZqTwCjvp0T698XcDTQQO9gVZZ5C_A@mail.gmail.com>
Subject: Re: [PATCH net-next 3/5] net: bcmasp: Add support for ASP2.0 Ethernet
 controller
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Rob Herring <robh+dt@kernel.org>, Doug Berger <opendmb@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
 Michael Chan <michael.chan@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 25 Sep 2021 08:25:39 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 24, 2021 at 5:05 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Fri, 24 Sep 2021 14:44:49 -0700 Justin Chen wrote:
> > Add support for the Broadcom ASP 2.0 Ethernet controller which is first
> > introduced with 72165. This controller features two distinct Ethernet
> > ports that can be independently operated.
> >
> > This patch supports:
> >
> > - Wake-on-LAN using magic packets
> > - basic ethtool operations (link, counters, message level)
> > - MAC destination address filtering (promiscuous, ALL_MULTI, etc.)
> >
> > Signed-off-by: Justin Chen <justinpopo6@gmail.com>
> > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>
> Please clean up checkpatch --strict and make W=1 C=1 build
> of the new driver.

Apologies, Will fix checkpatch errors in v2
