Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26598CB1FF
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 18:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9532810E16D;
	Tue, 21 May 2024 16:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="agqS5B0w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74EB610E16D;
 Tue, 21 May 2024 16:14:23 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a59c0a6415fso926261066b.1; 
 Tue, 21 May 2024 09:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716308062; x=1716912862; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+jEvCUCDoXYBbE4FQ3RJq8YjtPQCnUNkD4QkhJYzsSQ=;
 b=agqS5B0wtITEo5cUOVtVAgDKVvnfRI/Ito20TYeAWRAK3hl9J4J6tSYUTErba+CHdu
 TUxIhiY/AUHBnd3DikhaP7gzd160VzbEZPNw3mCt49ayXoG9ryvNFkZyHbCFjAu2m/On
 UTH4kqiVD95DAAAg22AU+bzhkTaesHHruDilT5EqK0RyxHJa+wDsxswLI2vFtzg1YDMR
 D0s9WLH2DbFtgV2GhaylVCjWQPZmRFy8ckB8i8egu5YnAbybGHGOmIkVArpD2iRWWzPI
 N9dsd6gIer/SzLWQhrOsfDaB/btui8jQ2VfOWkbNJBgwSCSIueeVg+NehWE19PZaX8n8
 is2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716308062; x=1716912862;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+jEvCUCDoXYBbE4FQ3RJq8YjtPQCnUNkD4QkhJYzsSQ=;
 b=Gs90P93cYf/mUxfwMzsY/BKJhya3p2kfniTq0ApUV9JOqbqz9adsJlBGY5FOrh35rY
 rFbWnvszGEz6zdxnPFa7QuIH9VApDaNh7oDWWQFSnMexS95k6XZyDUrSlFJGtHbMpd3z
 nBzh+tS61QvnBp6zrbiYnAj07QvaEpl5y02JzNhpX8rJtYW3OqIEGcYEQZRTBYAZBhD8
 cKtaXdW1ZYV2GNGqK5OALmzKtozXyiocKbdMHGsfDOc/hJbqAon6wawTjfazVCmVQ3H6
 P4ultHAxStP0YnZ/nUf/UC8r6iLumusTIWTqGVf5XqAijoPgf4Fb+9wc0NB4dEs9iJEL
 s1Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHJcKrY5AxFEkWafYx80CvpDHK/pPndJsz1xIhp7+Moj6b/FH7T+Yw/lpyoxARsUEg7VdSIHEUot+8br3n+GQ0ncjHwMYx3tcRT+XRisqLQKjbkpHcPzEeRVszXoLLmAdyCRkmwozlVRCYTj31cQ==
X-Gm-Message-State: AOJu0YzuIwalnmYlzaVM3SMf0Gdmkzqf/65Q6Tz3kJsuZtfsFYKcpca5
 la+Rl1qi5KBgE187hQbeQ08q2sG4oKEhNB05iMVlIkzeqJLJigqGJK9qLqX1aPsPkG0xtZLzoSe
 pXWw8/EEMc6zGot2oMqu7HPIwWG0=
X-Google-Smtp-Source: AGHT+IGPRoAXk5U2yAfKtV0N3oif9F4OVIW98u5OknoEe47c+70asB6Vsquc+Kc+Z5MoNSiJc9ijasGI4a5zTiewc9c=
X-Received: by 2002:a17:906:a8f:b0:a55:acd8:996c with SMTP id
 a640c23a62f3a-a5a2d55af14mr2108031766b.29.1716308061560; Tue, 21 May 2024
 09:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240519130610.7773-1-mario.limonciello@amd.com>
 <-KAO9zJq5vTiesgtw-PMO0lDkSH1tuV271WNqlVuh3ZSkMzKWB9JQJce68-X-GwhD57QilHIBnLxN9k03I3-CMeYQm30NJMLizfyUUxTqHA=@emersion.fr>
 <e3a4331a-307e-4377-a349-8699024f8459@amd.com>
In-Reply-To: <e3a4331a-307e-4377-a349-8699024f8459@amd.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Tue, 21 May 2024 18:14:10 +0200
Message-ID: <CAFZQkGyupsydjSEfv6OgMqPmHm9kMy4HQs7aNvzn77omSN+ZhQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for Panel Power Savings property
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Simon Ser <contact@emersion.fr>, amd-gfx@lists.freedesktop.org, 
 Harry.Wentland@amd.com, dri-devel@lists.freedesktop.org
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

Am Di., 21. Mai 2024 um 16:00 Uhr schrieb Mario Limonciello
<mario.limonciello@amd.com>:
>
> On 5/21/2024 08:43, Simon Ser wrote:
> > This makes sense to me in general. I like the fact that it's simple and
> > vendor-neutral.
> >
> > Do we want to hardcode "panel" in the name? Are we sure that this will
> > ever only apply to panels?
> >
> > Do we want to use a name which reflects the intent, rather than the
> > mechanism? In other words, something like "color fidelity" = "preferred"
> > maybe? (I don't know, just throwing ideas around.)
>
> In that vein, how about:
>
> "power saving policy"
> --> "power saving"
> --> "color fidelity"

It's not just about colors though, is it? The compositor might want to
disable it to increase the backlight brightness in bright
environments, so "color fidelity" doesn't really sound right

> >
> > Would be nice to add documentation for the property in the "standard
> > connector properties" section.
>
> Ack.
>
