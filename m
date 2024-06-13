Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3899B907510
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 16:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E566610EAAD;
	Thu, 13 Jun 2024 14:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZGxoWMmf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD0C10EAA6;
 Thu, 13 Jun 2024 14:20:45 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52c82101407so2144240e87.3; 
 Thu, 13 Jun 2024 07:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718288443; x=1718893243; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I5qtFTp5NNlM+VRWqNDBpma4yFp1X/P/p9e0OXlWS8M=;
 b=ZGxoWMmfHkDLBLXPpNfEvrbds4+ondkiSbnvR9WIHeBSThKa7xzBxGM7z2Rw0QvXTM
 oUAesYffqFAkReJuYnlhzai6WLy4qLwU8zGbpfEKEU1dS2yBEe58L6XuMVjU94d5P7dj
 p3sxm7IuLoZp3udOufmZ/07toXCfd86g86nJ8+CujaDIC2UpUqVmXPf+P1WuS329n6sJ
 sGrwbN6ZE8QjlYY2Twy8fOzEUMU4eciOyBcZdxam7yqcXtX56jEEWFQyfBt5L9M9Jcw6
 dw7bPMebwYlYDU9NxRgov04WTtWYkd6byIk+WOnj6Hc8bKBlkKGe9DgIUDlj3aql2jgX
 aMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718288443; x=1718893243;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I5qtFTp5NNlM+VRWqNDBpma4yFp1X/P/p9e0OXlWS8M=;
 b=SDyy5SwvLb+SCHJtx/4zmR6H5zoOQWL2HG55T0EEK8Dqa7Wz8zUIoEDq8IEpaQ8nQ+
 1WKJjSu9ZQY8nSxTeo7nTi/HeswlqU2aOFnz6Lz4mzNioXvwAfQ/e2EyhON5xjVJL25b
 dCocf3VqNEKZt7FRvykYb1YnfVlWAO55RpzEieJKG6cpNSiLuv3mM7WqWdxOd5lu0hq+
 j2UA2bcrGbLXygPvZGSRwcouJhoUSrI8lrLWQCmhpHz5siXmU9cn9gLXCFIBySmTGoHH
 /rq1qnJzTkgSuzJHCscdUaourpMy6eZKU24vPE9mZRcOxt5OEt8zuemSt8mOvwZvEWrL
 XhVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGTedBdkFck93lmgUslc4fispWp9LAIkJ7i9YsMQmHYVoo0JzCyivY5YY26sMy8kMAUZqFUfdvMP8TNpz5+Gjup4wn3rirSG3Cr3U5cZh05Rmn1qcwTviSGrspTBxAVqnw+58U5sHv6BTFhw1l2w==
X-Gm-Message-State: AOJu0Yye8ltg6itxEPyHmY7gmssQZ6fFFwnU4C9ISPuwNjEt63cWWuCt
 9s6qZShv5hF8n5375vxa1WCbRxRCzerPIjg94EpbiPYYKDDtzYWVXZP2leq1rP59T1sHbIemqzY
 93eyYqmwxAfBMTiAZ9DCvR7i4Gko=
X-Google-Smtp-Source: AGHT+IHn5Ky8f55HmAJX4R4yL07qx0NV2fNugfJKiyOzEuG0R970OHR2e0E3KurWnE4GqClZPxk9fYJnYGSfu5JHjFQ=
X-Received: by 2002:ac2:4886:0:b0:52c:8596:5978 with SMTP id
 2adb3069b0e04-52c9a40364amr3610576e87.43.1718288443142; Thu, 13 Jun 2024
 07:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A7qK1-b5g1RR-GJ+QTLEr_OxEr9vcZGEOkZY9yLOFLb5w@mail.gmail.com>
 <CAAxE2A6971oJ3r-8UWhL0BUZBiYxq4K0-Q39MJnb7ZozX3da-A@mail.gmail.com>
 <eb8223e2-9bea-416d-a412-0a291523a0ff@suse.de>
In-Reply-To: <eb8223e2-9bea-416d-a412-0a291523a0ff@suse.de>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Thu, 13 Jun 2024 10:20:05 -0400
Message-ID: <CAAxE2A5vFuN1R0dALT60Uf-Bt3QVMTE0W35TGEq2k7ep2FhxQw@mail.gmail.com>
Subject: Re: "firmware/sysfb: Set firmware-framebuffer parent device" breaks
 lightdm on Ubuntu 22.04 using amdgpu
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, pjones@redhat.com, deller@gmx.de, ardb@kernel.org, 
 dri-devel <dri-devel@lists.freedesktop.org>, linux-fbdev@vger.kernel.org, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
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

On Thu, Jun 13, 2024 at 3:23=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 13.06.24 um 08:00 schrieb Marek Ol=C5=A1=C3=A1k:
> > +amd-gfx
> >
> > On Thu, Jun 13, 2024 at 1:59=E2=80=AFAM Marek Ol=C5=A1=C3=A1k <maraeo@g=
mail.com> wrote:
> >> Hi Thomas,
> >>
> >> Commit 9eac534db0013aff9b9124985dab114600df9081 as per the title
> >> breaks (crashes?) lightdm (login screen) such that all I get is the
> >> terminal. It's also reproducible with tag v6.9 where the commit is
> >> present.
> >>
> >> Reverting the commit fixes lightdm. A workaround is to bypass lightdm
> >> by triggering auto-login. This is a bug report.
>
> I see. Do you know why it crashes? Or have any logs.

How to debug this? I only know it's run through systemctl somehow.

Marek
