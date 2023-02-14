Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85500695CE4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 09:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D4B10E810;
	Tue, 14 Feb 2023 08:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E1D10E817
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 08:26:14 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id w11so22385813lfu.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 00:26:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ucD4CCnfkp8arax0UEhiFRGSp5Q0kVEhqBUCYvVLIRM=;
 b=UtUA3If8VmT8NaLychrEjUeZsReNSkzi4S7yuK6OEU8noFZIAm/KKkL5UUrTt9a0Pl
 ToVKRjn7IwIFdIo4lIAz+VdGin77kuA8rdQw4uMS8UMwKE17Voybe7R2Bdo70Ut/yOKd
 xUj1sn5xUosiPBSf+M3o2nQKO0rys9f96WFP/py/Vbo12Ud3OcjYpWbQuY1NbDon8MpX
 srxWFYk8cNOAPEgol7SRFKDRcaAftAM1GX/HTycrp+RC/4s+eprgHvLeMxhH02v0OE2d
 ofWi60UZWQr3UBrnLL2sZG6ahboIa5Do0/oCt/Jn7cSuYgycu9blL2Z4dao5R3uZmVzt
 eX4A==
X-Gm-Message-State: AO0yUKUaKtgMs7iH+oBN69XMtDbFInPvLw+ObSOGczlQLy5PpgiYoZAU
 VIZ94FMebQyKccNy2l3PQShe3UTQVPglpihO
X-Google-Smtp-Source: AK7set+35bo3awMQfP5LGrRMjegfhhE7X21tG2/DKDWNomnWHWlu4b1xI28JKDQ14x9fJRa2wiNu5A==
X-Received: by 2002:ac2:510f:0:b0:4cb:15d4:33b6 with SMTP id
 q15-20020ac2510f000000b004cb15d433b6mr463261lfb.50.1676363172566; 
 Tue, 14 Feb 2023 00:26:12 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 22-20020ac25f16000000b004d57a760e4dsm1053655lfq.37.2023.02.14.00.26.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 00:26:10 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id bp15so22372812lfb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 00:26:10 -0800 (PST)
X-Received: by 2002:a05:6512:462:b0:4d5:ca32:68a3 with SMTP id
 x2-20020a056512046200b004d5ca3268a3mr166151lfd.8.1676363170539; Tue, 14 Feb
 2023 00:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20230214003736.18871-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230214003736.18871-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20230214003736.18871-3-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Feb 2023 09:25:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSt5uY=kSGrdt4V6311ZmvVEPo0oN6v-_c3uZNQLZ8=w@mail.gmail.com>
Message-ID: <CAMuHMdWSt5uY=kSGrdt4V6311ZmvVEPo0oN6v-_c3uZNQLZ8=w@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm: rcar-du: lvds: Move LVDS enable code to separate
 code section
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 1:45 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> To prepare for a rework of the LVDS disable code, which will need to be
> called from rcar_lvds_pclk_disable(), move the LVDS enable code,
> currently stored in the __rcar_lvds_atomic_enable() function, to a
> separate code section separate from bridge operations. It will be then
> extended with the LVDS disable code.
>
> As part of this rework the __rcar_lvds_atomic_enable() function is
> renamed to rcar_lvds_enable() to more clearly indicate its purpose.
>
> No functional change intended.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
