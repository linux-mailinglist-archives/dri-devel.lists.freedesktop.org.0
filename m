Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 524301BC16E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 16:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BB389BAF;
	Tue, 28 Apr 2020 14:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79FC89BAF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 14:36:32 +0000 (UTC)
Received: by mail-oo1-f67.google.com with SMTP id x17so4719412ooa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 07:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xxIKi5iDI55wdhi1KIGfVexmNRIE3bS131i3YZ1d/2M=;
 b=MxgwGsC4gBapDuHZWb1rJTYsavcW4wJ9VZM5tJ/PknU8vdMciw3eXs6P90bH0FDe7P
 JdHhJn/wmSQeG4TifZKYXNOTV4RRbPg9qjl53ScRvh0NPuXC110eY5TxPoMbPuDu6/ev
 iwKGDyWOfZiGFRh+UBadJuT5byS4oQ0TVGXXcqMr6ZQx36yP0X5fZ8Qth7jkLiT0vHPX
 JmJQrAMjvnIu0Lzm44R24lUWuH2085swny69qrukqKP4hkUWgMLBMitfrQeRluEYFAAa
 YB5YrL9szVfPJJcU7egi1zzdPBXfUNhYg/9561QrrRoc6PPQc03G6OVkO6lJNWA43Bf9
 eIsA==
X-Gm-Message-State: AGi0PuYjHd+SoqphAY6LN1f/QQEnVrB9tdvgZO4WNo9v+oZk2nO6iIVU
 qi8PTG406WzinyxAItDNYrN0KOqu+mBoxLb33q8=
X-Google-Smtp-Source: APiQypJJHE4iw9q62VxVYdpxPzCPkCktSHmeW9ThpyTpTlpnife/ElAKMojM9kIW5+D41AjYKimV3ZBswLAT6J+OPlU=
X-Received: by 2002:a4a:eb08:: with SMTP id f8mr23328962ooj.1.1588084591983;
 Tue, 28 Apr 2020 07:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200428141716.87958-1-weiyongjun1@huawei.com>
In-Reply-To: <20200428141716.87958-1-weiyongjun1@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2020 16:36:19 +0200
Message-ID: <CAMuHMdU0Chy6vmHBc6xqKZ3uQ=3NxZeZ7gt7FvCOLWh--Gcxdg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/rcar-du: Fix return value check in
 rcar_du_cmm_init()
To: Wei Yongjun <weiyongjun1@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 28, 2020 at 4:16 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
> In case of error, the function of_parse_phandle()/of_find_device_by_node()
> returns NULL pointer not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test
>
> Fixes: 8de707aeb452 ("drm: rcar-du: kms: Initialize CMM instances")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
