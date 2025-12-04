Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74641CA55CA
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 21:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA8E10E9CD;
	Thu,  4 Dec 2025 20:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q09GJ1kU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225F410E9C1
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 20:41:41 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b770f4accc0so182343966b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 12:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1764880900; x=1765485700;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vRT4yUYSE3WGP0484rye1MMCnwhxSgmVhOyhfsSMpY=;
 b=Q09GJ1kUwJPpjsIVZqT3xPMBg4VUGZvV35N4vqVUuLPk00Gl5AkT4+OkgyWmNcVVqO
 HhTI/9XDJnL8Zo/bDoHbLqDyI1XN6s0Vh1k3AJb5oe1ptHpCLC3Aa25xsshl9rf/0CQ+
 w6w6bLH5dfFGEHQR0CBsMfqZOc1eF3yM/qtB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764880900; x=1765485700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8vRT4yUYSE3WGP0484rye1MMCnwhxSgmVhOyhfsSMpY=;
 b=vGd0NV47kcx6Dq9rU+srj9VJoLXyndl+kpmoDFHzim7Klepf4ao0FMwULnAQFYmJIK
 wB/blPwmCblh1xIuQZWKm8NyThdbWJPG6TrWH0ufvNbjEMnh4IAAtmnkfIraACwkHlzY
 9VBSL5sd0mBLXDQCg9323PA/RkOOJO5bK4uNriu0MVigkOAKndwkzcYVzz1jYrQy2UIa
 n6siaTciQ7JGDXsyoIH3UQwoZCojzcu9e6gfaE4OlcgtzZurj51tVtLopScLWpVEKQZZ
 rP1vSeYu3NoLi0kJ3CCBjR/2Wk0KHo1UDGEltkqUUh3/w8O6VFh3l3U2oBpcE8KfM5dY
 LrEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUAqQVx4clbDxnc1y3tLtEAWUA7625/VTG7UhKzrXN5x95Pd7rbyeHNMI9cmXCrl1syo6LKVfGlfU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxl3YpwTNZrADhLa5Pgg0HafBUg6VuwQE/VZ8qjGgD4NJ8xkzDD
 tSCwNDexB30kUmFdj8ASVPU+TjDoICWT79Is9dwBvTeYBx1IFFd2Oy93SLPeXCJKoxhBqyIjXkG
 eprK6kss=
X-Gm-Gg: ASbGncv8ses8mOBmpvRoDJQ+YCUKapNdHF7tFSq8MYB3FDMzMG+dNFbLdOuZol65h3n
 7eV8KFkzPyXHji6Wi4rIvViHQoouAI8hytuDBtTf3naD/n5uSD9ZtaqCE3qEdZNaVy8CEzCcUaj
 FKUYKreL0r1uBwwsC6V5PyjmwxAJJ/SydOq7lRtOBPYkPloodnkavTHLAluI+LoWqhwQKpusi0h
 j2Wr4TJmyTnCYO2xoZc/XRnLVbmVGwyR+M443iwKld+Ggd6oLmvPGd0WN+7+JIds8VLozLpb4dU
 h0KU/qxE1x2hHj6pQDCQyEZ+knHpGtLaMs0W+SPO8zQBtiqFyfkxuwGoexsnjuulGrEvYWxrXYj
 4VJEccrLzekzHlUE0m9oIgT54vAfRCN/RZvQIRt+mv9Zx/KzVqZLSFiiJOfSw3+rv4+0fKAPi1t
 LvFRKKnqBViVe6U9s88M41RAY0lB6a5vwbjgHoTt6qJRhrexOdyDjTCKYvE8g/
X-Google-Smtp-Source: AGHT+IGtZ3Mk1HaYOobXRVUikunvtG7cyjVyT3eq9DjGJjn2z10w7Wrz6hl2aBIXOWtXUMxpk498VQ==
X-Received: by 2002:a17:907:78d:b0:b72:d001:7653 with SMTP id
 a640c23a62f3a-b79ec456248mr476081766b.19.1764880899983; 
 Thu, 04 Dec 2025 12:41:39 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f49765f3sm200748766b.37.2025.12.04.12.41.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 12:41:39 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-644f90587e5so2162510a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 12:41:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW3KLjlvA19ZdU5MfHVtUBK/w2qJ7QXNpBnQ+PkLUM9d9B26e2eH3S//7H/JwmN+C+QjC2GYovp3r0=@lists.freedesktop.org
X-Received: by 2002:a05:6402:4403:b0:647:7a35:a7d5 with SMTP id
 4fb4d7f45d1cf-647abddda6fmr3395006a12.25.1764880898829; Thu, 04 Dec 2025
 12:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20251204202059.326605-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251204202059.326605-1-thomas.hellstrom@linux.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Dec 2025 12:41:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wja02iemw40Sn4Vio6b1-rr3idFBcUrOV+=vodhOmZZ=Q@mail.gmail.com>
X-Gm-Features: AWmQ_bmsz5TwQKSOV0Tls4iAlodXezQEqhtGPAxjbhq22DkUz4OOpxtAMlQ8eLg
Message-ID: <CAHk-=wja02iemw40Sn4Vio6b1-rr3idFBcUrOV+=vodhOmZZ=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: Fix duplicated put due to merge resolution
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Dave Airlie <airlied@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Dec 2025 at 12:21, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> An incorrect backmerge resolution resulted in an
> incorrect duplicate put. Fix.

Ack. I can confirm that this seems to fix the issue for me. Thanks for
the quick response.

Should I just apply it directly?

           Linus
