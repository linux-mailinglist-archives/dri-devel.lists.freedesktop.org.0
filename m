Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 956EE2AD92F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 15:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A120F89932;
	Tue, 10 Nov 2020 14:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4C189AE6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 14:48:43 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s30so17906714lfc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 06:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TRtX8baRaCtbeDJjWA3IRYfdgtIW44Wdj4Sdz3HfZMA=;
 b=An/Ddk0HLR+91xPRpInCFnfZ9o+5szjLSy+NtnyMq7UJRY1S3pi1mcTpeSPq8yWGO7
 +hYo5dzW6PHxmv0YE0x63sDphTthBePQ7rc/OdTTaSn1XaXPVNTS2Qj572/59VtqdnSE
 ADq1kQeLGgCPetyHlz4LQ8E+f4lA+tewwA3JqwJikM3iaVmfqn+lcqYRQW/wE7ooEhJ+
 bUglFTYdPjIL+R6utnbfqDb4IhOZ5rx4bucFlRBZmrj8DrD8Mjij9VzBx0YIKOoIC2Nb
 AA/x0kRUOLLFfqW7r0bkOIMPkR+YoHRBgD+4KlQ2b15e9/I5sO+IMBiDslv4L69nF3h/
 5YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TRtX8baRaCtbeDJjWA3IRYfdgtIW44Wdj4Sdz3HfZMA=;
 b=BLN9ofWXnFgov9n8I3Fp37xqYGD8/zgCQJZFCVIqBRv5wJDxdZ9hVDWJCRdx4jjs7w
 bXseW3b3utnVzY/m3kIgg/sFLNKkhIAQpV4SkO69yWvNnAP2ciTYSe0g6JLdLd4qCxku
 BboY5Ed2St5+QwkQFBG4yZp4DZsTfC1GWWY+FLmErXN1noeBsH+nB01oOdePvXEUWzon
 lq1ZjuemwaC3cnNuA2kkScWc1mijfqWxvEfvyUFZXRLGJ/YrRahSVBF3Cz0bahg8bYeQ
 5HPbCCPt2yRqEOkuz9HX7noJXCbFN16mKpCFOiNY948TE6yotWuLD3EkUmbZbDyjnbrW
 WapQ==
X-Gm-Message-State: AOAM533UUSIeR6a5DMK/sQoaHGMS3KF9m9O67LvEScDjg8IDYEJFyzRQ
 1hbKZIZ2sLXl5tcoLXUj31WWzuSOYGYX6bZbbHDlVA==
X-Google-Smtp-Source: ABdhPJw46ud/uUkcZJ6tSOXJvAqor8Mj5zSR0l7JClGYT9/b+K2wIXlkgMzo8k4v5SokXVFThmMVRoGjQRQOqS4C810=
X-Received: by 2002:ac2:4ac7:: with SMTP id m7mr5517480lfp.572.1605019721579; 
 Tue, 10 Nov 2020 06:48:41 -0800 (PST)
MIME-Version: 1.0
References: <20201109110654.12547-1-brgl@bgdev.pl>
 <20201109110654.12547-6-brgl@bgdev.pl>
In-Reply-To: <20201109110654.12547-6-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Nov 2020 15:48:30 +0100
Message-ID: <CACRpkdZ9tRHFS51pnQg_TgKGed3pD_hRE_rGP_9tiFNcGrb1bQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] pinctrl: use krealloc_array()
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Gustavo Padovan <gustavo@padovan.org>, Jason Wang <jasowang@redhat.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Christoph Lameter <cl@linux.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linaro-mm-sig@lists.linaro.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, netdev <netdev@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, James Morse <james.morse@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 9, 2020 at 12:07 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Use the helper that checks for overflows internally instead of manually
> calculating the size of the new array.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
