Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617384D094D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 22:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EA310E162;
	Mon,  7 Mar 2022 21:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BC910E162
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 21:23:11 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id b14so2169337ilf.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 13:23:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WUUTWH0Y8FRKgg5DGFLfkbT4wJlTKEvIvDj9xcGw8P8=;
 b=VtagYBskDmpi0NNT3laMcSqKX4FX3cV0kFNQvQSE55rT8f17yGYfwZogL0zE4KnHoL
 3YOIqy3JFOq18XUNPARmLjvwmmVzfDXUaASYMuFl+BhR7a2r6JTmiauAC4QHvdgzti/j
 Ws8LgG1xOF0idhZrrKSplLoo5gRq8G5bgrsM6RMmGY4qy5SQTarRlnEkEHo2M1ukoPjN
 /ibBBW6Q/Daf9i8x+ZRGkucNGpOML4UtwndNjBXL/FDgzQQn4SxbqcWZFWOgNho8ZgsT
 kzJ1rXLIEzLxGstXI7TASCHGnEir9h1qzUG9nMHIV8FqHzJBYhCUFTBqMW9ykX7z4Teu
 YH6g==
X-Gm-Message-State: AOAM530o0SgmNux4o2zpJb2qQpJuw6DyOQObpPr4Ok3DvPhgAjUMfVz7
 HFOBueCBx5Dq+iIMdPzESh05mTVxwrxAnjsHSySU9lOg
X-Google-Smtp-Source: ABdhPJzviyS69Obp5y9/6fHx9zzuXgMfWgC9eQHmMRSfmqQkLtmUeoyFNRiy8e11hf3yukYB8CjdfLjygFOwDRYKbZ4=
X-Received: by 2002:a05:6e02:1748:b0:2c4:20c6:5c57 with SMTP id
 y8-20020a056e02174800b002c420c65c57mr12109320ill.70.1646688191272; Mon, 07
 Mar 2022 13:23:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646683737.git.geert@linux-m68k.org>
 <cc84f1fcd0901ba58a2e4fd34c43846c622fd157.1646683737.git.geert@linux-m68k.org>
In-Reply-To: <cc84f1fcd0901ba58a2e4fd34c43846c622fd157.1646683737.git.geert@linux-m68k.org>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 7 Mar 2022 16:23:00 -0500
Message-ID: <CAKb7UvgEdm9U=+RyRwL0TGRfA_Qc7NbhCWoZOft2DKdXggtKYw@mail.gmail.com>
Subject: Re: [PATCH libdrm 3/3] util: Add SMPTE pattern support for C4 format
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 7, 2022 at 3:53 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> diff --git a/tests/util/pattern.c b/tests/util/pattern.c
> index 953bf95492ee150c..42d75d700700dc3d 100644
> --- a/tests/util/pattern.c
> +++ b/tests/util/pattern.c
> @@ -608,6 +608,46 @@ static void fill_smpte_rgb16fp(const struct util_rgb_info *rgb, void *mem,
>  static unsigned int smpte_middle[7] = { 6, 7, 4, 7, 2, 7, 0 };
>  static unsigned int smpte_bottom[8] = { 8, 9, 10, 7, 11, 7, 12, 7 };
>
> +static void write_pixel_4(uint8_t *mem, unsigned int x, unsigned int pixel)
> +{
> +       if (x & 1)
> +               mem[x / 2] = (mem[x / 2] & 0xf0) | (pixel & 0x0f);
> +       else
> +               mem[x / 2] = (mem[x / 2] & 0x0f) | (pixel << 4);
> +}

The standard layout is MSB? i.e. first pixel goes in the upper bits of
the first byte? It's been ages since I've dealt with C4 (or perhaps I
never even touched it), but this seems a bit surprising.
