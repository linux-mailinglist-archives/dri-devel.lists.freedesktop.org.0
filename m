Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602CC6EF6BD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 16:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F5410E9CC;
	Wed, 26 Apr 2023 14:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3EA10E9CC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 14:50:08 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-54fae5e9ec7so82201847b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 07:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682520607; x=1685112607;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWcjXDUPKLzWemqJDhq5l62EqMdBCWgt6RFaH5quzXc=;
 b=iRc8P6DEu3I63yU0IJleyXR21tH9QzB3rAIBiXw9hV5s0k/i95btQeTGnxvAoBxWfz
 oKIKk8m/i4TuXNeQt9EscMmclE7xXrZqA1urnvyqZym7ONZEv8L3fGoDMN92oBCBh1+O
 ujQv4V/8vgEnbG1lYN3fdZ9gNYlk5B3O7K9CyDdy8XERHOTJyHzm5X9c+L+7RcGFMjqN
 oSR2wSsB2PfTxvm8MozBRSVFO7NdBo6reCN6T4+7i91tp0mme8J1dljW26jlM6DkwcER
 cBTdCMuv5LozdpoPcDC4/5myXeCYmZvaCLmwoQB8FAn9iHw5ekKGzyMwmyszS6huTUo6
 Ic5g==
X-Gm-Message-State: AAQBX9ecTaCSQKWQ6UC2awldTFzddxzwWsvuxsnj5GLQUr1hPTVnVSqO
 ykmCQKHckjrkgbRiHx5b3F82ztNBmlFwlg==
X-Google-Smtp-Source: AKy350ZbJAZi+yVU4lhKzXTHYyzqgitlXraxBi2jNyD80tIm41M82ApUaeAdgjl3xJczgAFnDW5a5A==
X-Received: by 2002:a81:6604:0:b0:54f:5419:2fa4 with SMTP id
 a4-20020a816604000000b0054f54192fa4mr13062126ywc.50.1682520607467; 
 Wed, 26 Apr 2023 07:50:07 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 g195-20020a0dddcc000000b00545a081849esm4196781ywe.46.2023.04.26.07.50.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 07:50:07 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-b9963a72fbfso6965055276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 07:50:06 -0700 (PDT)
X-Received: by 2002:a81:6c0d:0:b0:556:1070:7c60 with SMTP id
 h13-20020a816c0d000000b0055610707c60mr13905263ywc.18.1682520606754; Wed, 26
 Apr 2023 07:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-4-tzimmermann@suse.de>
In-Reply-To: <20230425142846.730-4-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Apr 2023 16:49:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWmPHge3jXxx4_OMAjfvnk70C=TZzxOUGceFOimj7fG=A@mail.gmail.com>
Message-ID: <CAMuHMdWmPHge3jXxx4_OMAjfvnk70C=TZzxOUGceFOimj7fG=A@mail.gmail.com>
Subject: Re: [PATCH 3/6] fbdev: Don't re-validate info->state in fb_ops
 implementations
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, teddy.wang@siliconmotion.com, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Apr 25, 2023 at 4:28=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> The file-op entry points fb_read() and fb_write() verify that
> info->state has been set to FBINFO_STATE_RUNNING. Remove the same
> test from the implementations of struct fb_ops.{fb_read,fb_write}.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

>  drivers/video/fbdev/core/fb_sys_fops.c | 6 ------
>  drivers/video/fbdev/sm712fb.c          | 6 ------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

But there are several other fbdev drivers to fix:
drivers/media/pci/ivtv/ivtvfb.c
drivers/video/fbdev/broadsheetfb.c
drivers/video/fbdev/hecubafb.c
drivers/video/fbdev/metronomefb.c

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
