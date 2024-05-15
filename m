Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB028C6D5D
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 22:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3CB10E02C;
	Wed, 15 May 2024 20:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TsXVZCeA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C2010E02C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 20:43:31 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a59cdd185b9so311805966b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1715805810; x=1716410610;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dVdeZxY54sSH0v8wTKekTlioXCSfmbN/I2OTCQ/d+0o=;
 b=TsXVZCeASh6ne+MOA/Z3d+9OfXHdmbTEHVjRdxCSp/mmNyaXEzn8dXZGyxRuqRJ4mk
 L8m99+g1+20uHN0KfrESfVmY72HN17pUBfi/dkNVbxTm8FipEXsRiayQ+f4LlW4i1D1q
 2EBgkJQoo4qVcx9uJPgzyL7JCKmUdvfB1nX/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715805810; x=1716410610;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dVdeZxY54sSH0v8wTKekTlioXCSfmbN/I2OTCQ/d+0o=;
 b=AcN7kMyAr7PyB1s/4U/1XYK8urP84hBzNAKhVD+KU6TbJ6fpCmdDI0PE4r2nm7CIm6
 avBJbV/X5B9Crwb4wbUdiYq92Pf9VRlJEp52VMfeuqyVPZ1KJRzMgRdtx5SDbFQn5WlG
 QTme41eoq68ckVxCfYZUWtPcUIps0Ko4QDvirKAz06P+6rZgNLzEpaOzDVUxe38spzVm
 BLSiP9aHwU0kS4DS6pkYcXAaDOoiZKoABjnMZ097m2zJ2wZVHlGGHTsZOEHBkdc3iVmY
 oj+YEUk8rxG4Aokrfy3BzXqxZMlU84LqS99GLnXx3w07oFSxaDts+D9fktDCs3jdp1+B
 OJnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTR7RxnQTxQbOqRdJlxxLgs3u6ES1vNoP7aiHQeFkhD0B19vZVhLFEOD0sYyoAq6CdRPsp6VkyqnY4VFwvGOnLrm6CfSCNTWBb0xdaM4UX
X-Gm-Message-State: AOJu0YyMzB2IAM8zQs+yOxdlMb8Vfus/jj2ZzmAFLTV9ppfGNd3Lu6JO
 s4RyYWHq72Uuso6R8X07iu++iE02Dy+uDL89HUydaWbWfGID/HH9Hj9YSlooEZnHPsCb1kQBmPn
 u8BUhLw==
X-Google-Smtp-Source: AGHT+IHE0KSo9Rq86l0pEIIs6VuC3G1PBR1F0IG22znaTMDSI9F1ejGSZs5mUSd9Qlti03w4eydARA==
X-Received: by 2002:a17:906:6a10:b0:a59:9636:f3e with SMTP id
 a640c23a62f3a-a5a118c520bmr1965325966b.33.1715805810137; 
 Wed, 15 May 2024 13:43:30 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a3c8724edsm732706666b.34.2024.05.15.13.43.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 13:43:29 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a59a609dd3fso305587966b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:43:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWrtgG6lT/4rvIWshdetjxrW4iHjakAq4Ii8i04jxC5g1M94MYtJpaYuy4+W31zPJtyALqUOwPF3AduXzJ50V3i2nH5XsOhES/FJXmGgaoH
X-Received: by 2002:a17:906:5411:b0:a5c:dad0:c464 with SMTP id
 a640c23a62f3a-a5cdad0c554mr155400166b.6.1715805809232; Wed, 15 May 2024
 13:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
In-Reply-To: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 May 2024 13:43:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=whxT8D_0j=bjtrvj-O=VEOjn6GW8GK4j2V+BiDUntZKAQ@mail.gmail.com>
Message-ID: <CAHk-=whxT8D_0j=bjtrvj-O=VEOjn6GW8GK4j2V+BiDUntZKAQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.10-rc1
To: Dave Airlie <airlied@gmail.com>, Jani Nikula <jani.nikula@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 May 2024 at 23:21, Dave Airlie <airlied@gmail.com> wrote:
>
> This is the main pull request for the drm subsystems for 6.10.

.. and now that I look more at this pull request, I find other things wrong.

Why is the DRM code asking if I want to enable -Werror? I have Werror
enabled *already*.

I hate stupid config questions. They only confuse users.

If the global WERROR config is enabled, then the DRM config certainly
shouldn't ask whether you want even more -Werror. It does nothing but
annoy people.

And no, we are not going to have subsystems that can *weaken* the
existing CONFIG_WERROR. Happily, that doesn't seem to be what the DRM
code wants to do, it just wants to add -Werror, but as mentioned, its'
crazy to do that when we already have it globally enabled.

Now, it might make more sense to ask if you want -Wextra. A lot of
those warnings are bogus.

               Linus
