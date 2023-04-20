Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F6D6E9436
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 14:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E28910E283;
	Thu, 20 Apr 2023 12:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4033E10E283
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 12:25:30 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-552ae3e2cbeso37110707b3.13
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 05:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681993529; x=1684585529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gXInmwaqBbfh6VGdRfeo5HdvJy20M73WF7/BcwOEW+c=;
 b=G2CDHYseSMbPTSkCqxOX2Cgo08+Aa2IYlWdR67pWsTDhf91IqVua5g/Fu5+uUFIbNc
 bnunt7jwaE5ufmz14F+EtvgTJXmk0i5aDoZTlJ6PLpSLP9y07MB17EMH3U2GNhTVXkN5
 iNtbKfh+oXD/L2Jak0ESCLsdxuktlm52YL9is2cCIv8JwQdpJUyLP0ClKr/btk9KcXlW
 tQq6AvFpA3lXz8xbTo/dc6GL8jZytko2Eajt6b9NxnYFEWgVrvxIbXETKwidRs7EikQI
 XZaf6f+BO9Y0hbdpVDwYNSrvGK94U7Bm1cnawjc+oUCDcFSGh66NUneKKWN4qjZLU8sQ
 BFUQ==
X-Gm-Message-State: AAQBX9dYcbHYfLrYt4A4+ZwDB4M7J7X2f8Gi5K5cjRnVMbOjANcFSuQ4
 b5YnakZBGlJVY0DsANJ24/biLsTPyoyGW0qh
X-Google-Smtp-Source: AKy350ZE8Y9MwIlBnU0vqGmeES9e+ZKNdQ6zGYT7P9dDrfjXbTr7LqNQVLSsrFOwPEtFBHBQHjj5Qw==
X-Received: by 2002:a0d:d7d7:0:b0:54e:ed46:6b39 with SMTP id
 z206-20020a0dd7d7000000b0054eed466b39mr655335ywd.31.1681993529015; 
 Thu, 20 Apr 2023 05:25:29 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 k187-20020a816fc4000000b00545a08184b9sm308137ywc.73.2023.04.20.05.25.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 05:25:28 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-54c12009c30so37800277b3.9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 05:25:27 -0700 (PDT)
X-Received: by 2002:a0d:eb41:0:b0:555:d531:fdf3 with SMTP id
 u62-20020a0deb41000000b00555d531fdf3mr634121ywe.32.1681993527822; Thu, 20 Apr
 2023 05:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230420030500.1578756-1-suijingfeng@loongson.cn>
 <8ec3734b-4bc2-ad8f-fc17-3002f22d1fc9@suse.de>
 <12c8efaa-7266-5436-dc53-009a0d23b53f@suse.de>
 <4a0fdbe0-cd4f-9c87-f73a-6d27f5c497bb@189.cn>
 <f541018f-bb7f-ac58-bbb8-797069e49c3f@suse.de>
In-Reply-To: <f541018f-bb7f-ac58-bbb8-797069e49c3f@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Apr 2023 14:25:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVGtvgcQuTR9bfMh1cM86TYXSByxJzW5eJtF9A0ZLRF3w@mail.gmail.com>
Message-ID: <CAMuHMdVGtvgcQuTR9bfMh1cM86TYXSByxJzW5eJtF9A0ZLRF3w@mail.gmail.com>
Subject: Re: [PATCH v5] drm/fbdev-generic: prohibit potential out-of-bounds
 access
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-fbdev@vger.kernel.org,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, Sui Jingfeng <15330273260@189.cn>,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Apr 20, 2023 at 1:10=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Am 20.04.23 um 12:04 schrieb Sui Jingfeng:
> > What will happen if the 'screen_size' is not page_size aligned and mmap
> > will mapping in the granularity of pages ?
>
> You need to map at page granularity. If screen_size is not page-size
> aligned, there's this trailing buffer that is accessible, but cannot be
> displayed. But userspace has no direct way of knowing that, so let's
> ignore that problem for now.

Userspace can know, if fb_fix_screeninfo.smem_{start,len} match
the actual offset and size.

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
