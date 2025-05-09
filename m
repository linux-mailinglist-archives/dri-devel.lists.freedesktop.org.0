Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C001CAB1C4B
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 20:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BA010E07F;
	Fri,  9 May 2025 18:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="Xo9N0Js0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6ED10E07F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 18:28:00 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b200178c011so1847310a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1746815280; x=1747420080;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sGMDR4vrCsmFK5oEVJjhbe9GdCx3AVSX7y/0PLZa9DE=;
 b=Xo9N0Js0MHLzOcIvhDieMOVqHckiDLpMFsE/6FJYLt6HSS230Kp/icmM9Q6JO6MVgL
 TwmNvbgiIB5v4HNqutlOr7rE8KnEyCElG98MMeH/vykURjNbM4LuEXZnWcSVZqT8Xcpc
 0RTRexI6z6z555b0IyuPQte6Iha9KWhjFbitwWT6NEpwIAXUgm34U0SB5Pf1jJUuLya8
 SnEEpXIcQOgoJogV1/ZpHKsx0A0IEpwUoj0gnBF00jWtupW3dJaFFQ1BE/Y3VEBdUwlS
 lUdlK3crQ/F5MWXE+S5FaM0qGqb/yV+6mKIaHoDBB5If9jDB672WIp8+cj0KbRB4izze
 Bx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746815280; x=1747420080;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sGMDR4vrCsmFK5oEVJjhbe9GdCx3AVSX7y/0PLZa9DE=;
 b=pPPMywG8efuRFl++zUgaVEut2aeE+hWTEy28mxLENmsiMM8A68eOjbSBL1n3gNgPFw
 Anjv7qZviIS4lvUpGlHRF+jdS4Sbi520BHXFNHVJMp1K293mxLAIlBqV700BdEJ8mk3I
 GhL/qzeBsMocHto5hCE8Q8y/vxLbO6imIgeLCcIYEBHwlwZzsAMK/CPoR1dDdZNlWYCU
 9k9DKfgl5SiEp2RSjqbwoxUKxENeg17rgLSUlGx0SbX9bQe4PqqD4YZyTmTZHKVe2gH3
 bM6OOdmHEe+CJC/4lGE5DnXcgEoVj2lC616cARQGPKiEjnz2uqmDoSxC/yvwHbimP7on
 j+ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiCKgiZZk4BUEDEIqX2YdSTuPeq85Vt9qsdLb1j9k+wp/s16k0orLArZsZTfcYGYH2ptkiUio6m1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKeh9Y4bVXotEHRX8PWlPZPuap7OEKKlcERT5FLIJPkOzua6gM
 Zlhv1Wn9sinro3umyU8gRgsoZP9nVVE0A+g5GCsr11PLO+ItvVtnj1ZxUQGZaKz7Va3gmbYfsrD
 euMcYsZgL2F5NwVWwTklUQzjNd2U=
X-Gm-Gg: ASbGncvuOxdq+kdaalhdpTUyLBf4AnS25dkpMev8cFuG+HeCh2R6Evy4b1T96ZAKn1A
 1Xacw6bazZibsvC/5H+mvRjMXOOvmD1Re4MFo8HZPCjqtGa3EY7Wy5kVmk3/BKammvRkngB4SQI
 5BJwn70j3dEs4vGtZB9Ke5vqzmFbKM/V3ezoVUkNYEEusiLCPIHjvlvIK+sU7mi1NVZw==
X-Google-Smtp-Source: AGHT+IHXDGWP+YtZpWiwJiGwLYqFvxGO5dbb7SWr+ooxT2b9DImqaiGMOG5CHnVu37yhFV5sw1lsNGEQqFB08eoyEkU=
X-Received: by 2002:a17:902:d48c:b0:220:d909:1734 with SMTP id
 d9443c01a7336-22fc8b32ce8mr71176355ad.14.1746815279648; Fri, 09 May 2025
 11:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250505184338.678540-1-richard120310@gmail.com>
 <6d2f35ee-1b33-40b6-b164-ab4480110e49@linaro.org>
In-Reply-To: <6d2f35ee-1b33-40b6-b164-ab4480110e49@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 9 May 2025 20:27:47 +0200
X-Gm-Features: AX0GCFux03CvY5ldQo8MgJxENVqxGp77YENyE8ZwpmGhXEQFNatCnqiqkcdNym4
Message-ID: <CAFBinCDmHhF7=-dutXT6RE9hVzfN3akLicGkQKw=Arm8bq2NKQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: I Hsin Cheng <richard120310@gmail.com>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com, christophe.jaillet@wanadoo.fr, 
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
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

On Fri, May 9, 2025 at 5:35=E2=80=AFPM <neil.armstrong@linaro.org> wrote:
>
> On 05/05/2025 20:43, I Hsin Cheng wrote:
> > Coverity scan reported the usage of "mode->clock * 1000" may lead to
> > integer overflow. Use "1000ULL" instead of "1000"
> > when utilizing it to avoid potential integer overflow issue.
> >
> > Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?select=
edIssue=3D1646759
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
>
> Could you add a Fixes tag ?
Fixes: 1017560164b6 ("drm/meson: use unsigned long long / Hz for
frequency types")

Neil, can you add this while applying or do we need a v3?


Best regards,
Martin
