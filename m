Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5228B78F308
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 21:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B617E10E6B4;
	Thu, 31 Aug 2023 19:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BE210E6B4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 19:04:02 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b962535808so22033791fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 12:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1693508640; x=1694113440;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MxGEoM6NvMI83xhY8G/ImCWZyFVY8xF2ffN+doaTRi0=;
 b=aW9cW2X9Zrk8VXigWvrFV5vYG0ftRUaBn5LXTiO7jUbsGsiUUQmTXLdWTJBIZGx0wM
 TjQqRzUE5oJ9OTiWPzaoi+qIjyqXRLQLQ9RTmJjNt8vabZIclEgwJd62I06pjtY7//lW
 ltuv92PgUH0HXaT1AO+5T30py+Qujy9Plv6Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693508640; x=1694113440;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MxGEoM6NvMI83xhY8G/ImCWZyFVY8xF2ffN+doaTRi0=;
 b=fYMsx1ahNMs4vLij8m5KHA9qGXHhzLidx3W2kVPAbnbX77a8iXl0WHkF2DZQYwlIDU
 imK1XQ/zqyMqc33t9+upiToSV7oGeVD2jPAknNJ+6Y/FNPLZC6PgM3hqAbRRXeFYuxF4
 iOXA2FMavqsXrbjtTcebMNRx0AgyK3MPtzOKGUWPwxVbGTUp9kLqbO2IdE4cKb2Iwyfd
 +NC/sq+LgBEA8wbs8QeESo+jq195fmM33TzsraXlV5i667fMrWf0wgpeOfc60zgQUYMy
 bYX1ijZ4A1vdKnkAV0wlqhl5fWlQfsR0myakGYh0AoDFI3irMe4m00OwbTBnb/QbGbDq
 BAMg==
X-Gm-Message-State: AOJu0Yx8I6mOIwsj2WsY29Vmm0k5S8z6phM8Iy0wDxQt4kvIx0pPxsoE
 ndTy3BBXCZMDjE0hvZl2y73rF50QxVrrBeymag/qmrEO
X-Google-Smtp-Source: AGHT+IFW0tXwxq64DT6+2+MTrjC5ApLic+PXvu5saBD24eHbLnEIilP1CMJfmrw4Izy7TMYWFJKttw==
X-Received: by 2002:a2e:9691:0:b0:2b5:80c9:1266 with SMTP id
 q17-20020a2e9691000000b002b580c91266mr79856lji.43.1693508640090; 
 Thu, 31 Aug 2023 12:04:00 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 lg11-20020a170906f88b00b00997d7aa59fasm1074252ejb.14.2023.08.31.12.03.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 12:03:59 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-31977ace1c8so1009786f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 12:03:58 -0700 (PDT)
X-Received: by 2002:a5d:5242:0:b0:315:8a13:ef17 with SMTP id
 k2-20020a5d5242000000b003158a13ef17mr269497wrc.65.1693508638437; Thu, 31 Aug
 2023 12:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <ZPDgdGBbxrTl+m2s@debian>
In-Reply-To: <ZPDgdGBbxrTl+m2s@debian>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 31 Aug 2023 12:03:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg4vpuourbbUPn19yFx2cNj93O6t0PhiARLLL6z22yV4Q@mail.gmail.com>
Message-ID: <CAHk-=wg4vpuourbbUPn19yFx2cNj93O6t0PhiARLLL6z22yV4Q@mail.gmail.com>
Subject: Re: mainline build failure due to 501126083855 ("fbdev/g364fb: Use
 fbdev I/O helpers")
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, regressions@lists.linux.dev,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 11:48, Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
> The latest mainline kernel branch fails to build mips jazz_defconfig with
> the error:
>
> drivers/video/fbdev/g364fb.c:115:9: error: 'FB_DEFAULT_IOMEM_HELPERS' undeclared here (not in a function); did you mean 'FB_DEFAULT_IOMEM_OPS'?
>   115 |         FB_DEFAULT_IOMEM_HELPERS,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
>       |         FB_DEFAULT_IOMEM_OPS
>
>
> git bisect pointed to 501126083855 ("fbdev/g364fb: Use fbdev I/O helpers").
>
> Reverting the commit has fixed the build failure.
>
> I will be happy to test any patch or provide any extra log if needed.

Would you mind testing the exact thing that the compiler suggested?

So instead of the revert, just replace FB_DEFAULT_IOMEM_HELPERS with
FB_DEFAULT_IOMEM_OPS.

I think it's just a typo / confusion with the config variable (which
is called FB_IOMEM_HELPERS).

               Linus
