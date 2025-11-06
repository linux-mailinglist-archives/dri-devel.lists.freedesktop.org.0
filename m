Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA80C3DE47
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF9B10E9F9;
	Thu,  6 Nov 2025 23:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="1MbXFYcf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE7010E9F9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 23:50:08 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-640a0812658so321149a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 15:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762473007; x=1763077807;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HwtE5bl1Bmk4nXkRg8wSfz+vYSCTX9OIyE6Hqv70rK4=;
 b=1MbXFYcfTcP5npy+q/CiZSpbp9/4R1MsmAvwuaLG4SrNVPb60KOfd9KSptYHq2SnRs
 owaoHj4NYzzoNXBfMvm3Pm1mxQHtY/6TAEo3j60lM8bE1p8GbN5Nt1IBErV9NMKBM65X
 zShMqeoEFkVZMISfamnLiPw/ee4wvQi2WeEGdnAPuCf3CRGjJ/aQxRYrA/SrHlKf0RTK
 +2qoGFcMl52hxisDFajvHHHf7kbPkoie060YjhS6MW/FuuvgLrXSMQfeyF/w1ghQib3d
 7Ixra3lwy/sSzD9Qp1OTicBwFSJYNNcbLdqWxQ0T87JbyHZ9lZiT+omRrFIYSZ8wwmJu
 Wr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762473007; x=1763077807;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HwtE5bl1Bmk4nXkRg8wSfz+vYSCTX9OIyE6Hqv70rK4=;
 b=ocpdk9qJoDhjSzS1p69h9lufRD+JpYypZGNSi3CJ61i4sCWqlqkcUb0l7wgQPQ2bUA
 9X1b5O7tItpRPNbk1lSmPz92GN1n6jGXF8wpOIBJBE+JWycChSWjEXuPthfWcNnXWHUZ
 9PnshRF5tpWbhN5ZEN5pcGFEa/2+Lb2+lv7bX183JkpKaJhyQGvjz25kTQE5BzVVGsux
 0kMAVnnyH6JtS7Ke9XVUe/1KzIDsIR1bZGikPkL4oNohhwFULI1Q7oH97vV4/xDB3C+T
 BlSUiSI1Ya6kRpQWBlaZOrF/DD4QyKg7Rfmb6qgdlAt0g+jK2GOSlh71YGN1ONWjciVY
 VeMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRMQvTxu+h0GZVcf4gcFmkgPER0Th15LiYX+dgHLjyU0+rp2mHndy+PZBIplZDebd3yBA9kx7lU0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfvL2aYH+JhgzVM5fqJNCgnxc0dY9czmidklkD9H7Kq6s8k7+R
 i0b6DwW9aS8RNLTjM+hR+fyRoRODzGZ2AYT97DRHVMxief07aOU3o4igwoQgGDyYoQygXeormPz
 sQ9NDv7dGmsMTjVO94//ORi9u2CTLQRfYSM1mv9Y=
X-Gm-Gg: ASbGncsUFga8yAn1Nounu1RZZx7MocZ5zGlKYjFSo3dHHrBF0nNR8ijYjCeesqkKOem
 Z0H1kpWG+yBZntng5qE4Pjvs0dcUpwc4M26JsWw0JvggNpi/qTcRcJRNvrNQIVI5T+iVxd3RPkq
 ZYg87W9JvjhFwCi2pKxLmpuY54A5o4S0LD2sbuwq8Gmzi7Mex9fOLpORFZSb3EIB9H5oNtkjDD1
 JiooW+1Tw3LMyEmC1JoF1QfbPDwQCKbBsKT2bBzp+Nju4+bF65f3lsj6jlr17Fc2/e+
X-Google-Smtp-Source: AGHT+IH9HqOyiD7UJnMvTInH2MmpK2CQ5kPmEOkMBi/k8MfOZTcnKKXlnRL5aSY3yGTQu9tiyes0hAnndXUSZGrFDvE=
X-Received: by 2002:a17:907:6d0b:b0:b6d:9576:3890 with SMTP id
 a640c23a62f3a-b72c0d02de6mr125701366b.45.1762473006957; Thu, 06 Nov 2025
 15:50:06 -0800 (PST)
MIME-Version: 1.0
References: <1043551.1761844832@turing-police>
 <32ed124e9d603cad950c4836c7a14a3ba8bc2068.camel@gmail.com>
 <1296761.1762045181@turing-police>
 <CAFF-SiU3XL5pZAzsB=eXi7e1LKzx5XwiNOyfGpPXOnnc6uo2cw@mail.gmail.com>
 <CAO=gReF+sWpKZFa+wbtGxa3+wSjAQG1UMG3iJaDt2EOPmH-7mQ@mail.gmail.com>
 <105884.1762399131@turing-police>
 <A9C2FED1-EFBF-48AD-A3C8-41DDD16F8AA1@kernel.org>
In-Reply-To: <A9C2FED1-EFBF-48AD-A3C8-41DDD16F8AA1@kernel.org>
From: Bill Wendling <morbo@google.com>
Date: Thu, 6 Nov 2025 15:49:50 -0800
X-Gm-Features: AWmQ_blrX7AQyucKNOFi707U4b2pBK67Zkgg47ONWQ-TMh6t8cCk3T6JIKN_QX0
Message-ID: <CAGG=3QUF4OZwjjMTz8jidDWNiHrOhhZhKNRwM54gz8YLHeRGBw@mail.gmail.com>
Subject: Re: linux-next-20251029 - build error in amdgpu
To: Kees Cook <kees@kernel.org>
Cc: =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, 
 Amit Dhingra <mechanicalamit@gmail.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 David Airlie <airlied@gmail.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
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

On Thu, Nov 6, 2025 at 6:13=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
> On November 5, 2025 7:18:51 PM PST, "Valdis Kl=C4=93tnieks" <valdis.kletn=
ieks@vt.edu> wrote:
> >On Wed, 05 Nov 2025 18:34:05 -0800, Amit Dhingra said:
> >
> >> I have the same problem.
> >>  ...
> >
> >> Setting RANDSTRUCT_NONE=3Dy seems to stop the error.
> >>
> >> [1] https://lore.kernel.org/all/2025062439-tamer-diner-68e9@gregkh/
> >
> >Wow.  I wouldn't have guessed that RANDSTRUCT would be the cause...
> >However, RANDSTRUCT_NONE=3Dy does make dce_stream_encoder.c compile clea=
nly.
> >
> ><insert Twilight Zone theme music here>
> >
> >Adding Kees Cook and the linux-hardening list to the cc:, hope somebody =
has an
> >idea what's going on.
>
> I'm surprised the stable team didn't find the associated fix in your link=
ed thread. It had the right Fixes tag:
> https://lore.kernel.org/all/20250502224156.work.617-kees@kernel.org/
>
FYI, their Fixes tag points to something that doesn't exist. I found
it at SHA1 e136a4062174a9a8d1c1447ca040ea81accfa6a8 though.

> Regardless, just remove the "0" from the dce110_an_str_enc_funcs initiali=
zer; that's an older code pattern that isn't needed any more.
>
> Randstruct requires designated initializers, though I thought the macro t=
urned that on universally, so the fact that the error is only present with =
randstruct seems like a separate bug.
>
> -Kees
>
> --
> Kees Cook
>
