Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A59E1831F12
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 19:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9FE10E102;
	Thu, 18 Jan 2024 18:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B4210E8A6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 18:26:21 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dc2308fe275so2744756276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 10:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1705602320; x=1706207120;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ciQlRyiAkwqUBAWhuyMkkl5NJaSf0eo0BrRQqNkIs98=;
 b=aDTy8vYuJBOiWT3S3rQUaBaEx1hWp9mJHG6nLaUP7eaNZZ8RuGXvp2sXNgvO3sTP1z
 O/RfHmn+c2D/eXCILipHcqn7MMCJuwVw2wkOd+rtbIv5Idu6HfKCCVFldaMoEB5O+EHN
 shxfh0yXwZYq3PdoRkkytjQ8D+SpUQWbA9LJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705602320; x=1706207120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ciQlRyiAkwqUBAWhuyMkkl5NJaSf0eo0BrRQqNkIs98=;
 b=KybciwcCty86Z5LTlyVX0nkClj26JsjMKiP2SP3aqSpMlmahQsebxG7tf2IrxY5xnQ
 V5dcFEPJ7pYqMlvxSeO6GoeMF0o0JxIyBmSXGpyuomTlSfBldXUck6zbHinQGtJpaCJH
 amm3YkrcgUjMDYYz7TOirZFrWvrRhUcRdDoyJBE1HmMh8YzyiHBrWJniZLJEz6JoDsH5
 7hXLeXSiuopt39SI4D9R1yMXfmtaVs8vlC7LMyC46cNZhKsSQ+5+0Ik7lIvcHW3T/f18
 xDsmv3abu8yT4JiM/n3OCVP3QpDBvK1JDDrb/u1Fk3MsEEOQGHlGsNWCgD31PMhMj10j
 BzlQ==
X-Gm-Message-State: AOJu0Yx0dFO5+4oCnTcCaK4HCWNPyPCEsHZrCLnBicRu97HfUvCS4XmG
 Km1QoRnbA4SBAGputGYoKVYr9ui7AzNBXpxM7w3CtjID+l1YlWsFlPiUa33Ll0H5FzRIsEbE0De
 ayD28X2Bkw1HYpPlK9hUCrFLBY1Gak3pR3apAOBeruy95iBQkSA==
X-Google-Smtp-Source: AGHT+IEBTjdTlkXRIYC5ejjgKG3HJySSIWlPojifMMwGBH1MZR/CChCA/KWOmu1A9qoq6FJZG+iOjZCDioRUfpH9alY=
X-Received: by 2002:a25:abc7:0:b0:dbe:edbe:a052 with SMTP id
 v65-20020a25abc7000000b00dbeedbea052mr978206ybi.27.1705602320587; Thu, 18 Jan
 2024 10:25:20 -0800 (PST)
MIME-Version: 1.0
References: <20240112203803.6421-1-ian.forbes@broadcom.com>
 <3d7f835a-eed8-4d98-9539-68061779f285@suse.de>
In-Reply-To: <3d7f835a-eed8-4d98-9539-68061779f285@suse.de>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 18 Jan 2024 13:25:09 -0500
Message-ID: <CABQX2QMUfZMNRN-RfVhvZzkGhn4zRY-B51Ph_KYzXWmZ_8tfAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Filter modes which exceed 3/4 of graphics
 memory.
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
Cc: Ian Forbes <ian.forbes@broadcom.com>, maaz.mombasawala@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 martin.krastev@broadcom.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 15, 2024 at 3:21=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 12.01.24 um 21:38 schrieb Ian Forbes:
> > SVGA requires surfaces to fit within graphics memory (max_mob_pages) wh=
ich
> > means that modes with a final buffer size that would exceed graphics me=
mory
> > must be pruned otherwise creation will fail.
> >
> > Additionally, device commands which use multiple graphics resources mus=
t
> > have all their resources fit within graphics memory for the duration of=
 the
> > command. Thus we need a small carve out of 1/4 of graphics memory to en=
sure
> > commands likes surface copies to the primary framebuffer for cursor
> > composition or damage clips can fit within graphics memory.
> >
> > This fixes an issue where VMs with low graphics memory (< 64MiB) config=
ured
> > with high resolution mode boot to a black screen because surface creati=
on
> > fails.
>
> That is a long-standing problem, which we have observed with other
> drivers as well. On low-memory devices, TTM doesn't play well. The real
> fix would be to export all modes that possibly fit and sort out the
> invalid configurations in atomic_check. It's just a lot more work.
>
> Did you consider simply ignoring vmwgfx devices with less than 64 MiB of
> VRAM?

Unfortunately we can't do that because on new esx servers without
gpu's the default is 16MB. A lot of people are still running their esx
boxes with 4MB, which is in general the most common problem because
with 4MB people still tend to like to set 1280x800 which with 32bpp fb
takes 4096000 bytes and with 4MB available that leaves only 96KB
available and we need more to also allocate things like the cursor.
Even if ttm did everything right technically 1280x800 @ 32bpp
resolution will fit in a 4MB graphics memory, but then the system will
not be able to have a hardware (well, virtualized) cursor. It's
extremely unlikely people would even be aware of this tradeoff when
making the decision to increase resolution.

So the driver either needs to preallocate all the memory it possibly
might need for all the basic functionality before modesetting or the
available modes need to be validated with some constraints.

z
