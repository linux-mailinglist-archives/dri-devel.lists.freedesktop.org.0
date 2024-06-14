Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A777E909006
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 18:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF6F10EDD6;
	Fri, 14 Jun 2024 16:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ff+8QQz6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE2210EDDA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 16:22:04 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a63359aaacaso367675466b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1718382122; x=1718986922;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=307WA05poQdKSmwHQchgPVIxFWT4GF9NFWhPoKqw/Q0=;
 b=ff+8QQz69kMaMgsX7x+VK/YwtjPLQrSaNASEbaxrIOL4LwKss8ZjExHe4KJNE65xrZ
 RD214PwOyFmAgRu31TnA9OFLBFbK1eukINuUVNjNLhA68/S12pdTgtVDx8dphE/+ZY6t
 I8Tm9KV/efuwSmPmLG2FE5z2ebt45PZqLG4Vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718382122; x=1718986922;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=307WA05poQdKSmwHQchgPVIxFWT4GF9NFWhPoKqw/Q0=;
 b=VzKC7VBKXfFcgwqqHmTexN8HqaHcVF60+B9FNWi2Pfb9oIhTlWNXFwSzcF0hH6Sxw2
 sGSdcuOM4d2eW8UXXFnwaeyOjmOVjPeSYUfWIr3LFtpjfXuc21HRmCIoficcc7UhfXuH
 6mmGYpzQSBb6kmkfgGJAToNmTFfl4a/pWlroTGUWds1Bduh7ix2JqfIKooKTAIyH0b2X
 yDXpk39Wuqr4+0T2cENOHBDP1AZFej6LY1JgdrwuFmCOmZb+xydGroqHuD1fT5LCHIU9
 hLCnpv8uhKIPcgSP5twg+tPiWqgWQPnRoUbXsVQW9quBbe2fyHR6ETvOtUd00fJgfGDE
 8usA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAgcG64NnYG9ykDI2B7G3J06Uv3XPKv4nHPlKrbCIJ2qUau/E1b41ROEqtgC/D99L2NwMdcj697oXRqPOVkFySUQa+z9iAmN/ub0m712iD
X-Gm-Message-State: AOJu0YwJtQhkSoZUuLuhzdD2lN/jUZW6qIGlfojleUAqylRfThUNFVEv
 HJlPF24xGu23Kp1OujqBtBKyS+FpsuHKhpT04xE2NiwnllrBY+gYa8eunGDO6Wsd36gPlxCX/ct
 G7Ic8tg==
X-Google-Smtp-Source: AGHT+IHXm8NHU4l36Gh2GLj8Ck6p7/0+nO1ZPPeEsYegtYzjQ6U3PtdA0FNj7YRUj6s1eAW+MwXW9A==
X-Received: by 2002:a17:906:382:b0:a6e:f72f:4aa9 with SMTP id
 a640c23a62f3a-a6f60d297famr203411266b.25.1718382122423; 
 Fri, 14 Jun 2024 09:22:02 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56db681fsm200140466b.72.2024.06.14.09.22.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 09:22:01 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-57cc1c00ba6so1070962a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 09:22:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUGIUfEcMeCAQmrq09iicgD2fr49Yyry3r7Tt5153IOk8TjsNgqbfeXX2wLEvBqAUs/dF7Fh/CF1DEU/cnXCcoYE8FbiLYP2j6WR3fZ8s8v
X-Received: by 2002:a05:6402:520d:b0:57c:c166:ba6 with SMTP id
 4fb4d7f45d1cf-57cc1660fc5mr2095600a12.19.1718382121390; Fri, 14 Jun 2024
 09:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wjQv_CSPzhjOMoOjGO3FmuHe5hzm6Ds69zZSFPa4PeuCA@mail.gmail.com>
 <ZmrTZozoi0t/tuva@duo.ucw.cz>
 <CAHk-=wjqHL7KjOWYBVKFewcKPWL7CJxddWfJnvL3AfOqfR8vMg@mail.gmail.com>
 <ZmwHGviv/6J6FQLf@duo.ucw.cz>
In-Reply-To: <ZmwHGviv/6J6FQLf@duo.ucw.cz>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 14 Jun 2024 09:21:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wigB-wVK+4=NuYJxoKLnoUXB52J5WU2hpKj2de6vGuY7g@mail.gmail.com>
Message-ID: <CAHk-=wigB-wVK+4=NuYJxoKLnoUXB52J5WU2hpKj2de6vGuY7g@mail.gmail.com>
Subject: Re: Linux 6.10-rc1
To: Pavel Machek <pavel@ucw.cz>, Dave Airlie <airlied@gmail.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, 14 Jun 2024 at 02:02, Pavel Machek <pavel@ucw.cz> wrote:
>
> If I can get at least basic metric on the gpu (%idle? which process
> use how much time?), it might be feasible. Is there tool similar for
> top?

Let's bring in the actual gpu people.. Dave/Jani/others - does any of
this sound familiar? Pavel says things have gotten much slower in
6.10: "something was very wrong with the performance, likely to do
with graphics"

To bisect it, he'd need some way to judge it reasonably well and
without too much of a bias.

See

   https://lore.kernel.org/all/ZmrTZozoi0t%2Ftuva@duo.ucw.cz/

for the original report.

Thinkpad X220 - which I assume means old intel integrated GPU - at
least one listing I found for that thing is  i5-2430M, with "Intel=C2=AE HD
Graphics 3000".

                  Linus
