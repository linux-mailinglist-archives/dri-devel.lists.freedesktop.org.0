Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D586E824860
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 19:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D59510E519;
	Thu,  4 Jan 2024 18:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF4B10E519
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 18:50:47 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55569b59f81so1016869a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 10:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1704394246; x=1704999046;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XxCIeQ9j4EehMbMWWRhFVXo20FPclvu+h4tS5qZG5ug=;
 b=fe6qSeJIXmGuBCwXANHy7/UeJmkZeYrQjVw0EU3+zk1SzRIBTMapD7xV9OJ7MEUoVT
 SnSiJBvc/zXGZwu0NVNIWg4Y8MvA6/vXOZZgBNQwrI0U1EE0W0658PWp/A9ZGPcbmRUs
 wIiYP0UlmFSIQoIhty+HJI3j8lyem8uOd7JHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704394246; x=1704999046;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XxCIeQ9j4EehMbMWWRhFVXo20FPclvu+h4tS5qZG5ug=;
 b=wj9PKg12cfJHmhiJ881HByYQGjnd1nsKk9PdJGa258M3J2JTTSmG67k+WiFyg7M5U0
 Ju6Eb180dyuEGW4Dt4eK2NEzWFXUY+TF34njNRmRzYiNd/C8WygQH1PBXXkrKJkhxgLb
 9OE0tlOEmMbiQkD6bZJt9ZGN0zMHPQzqKhQo/IQ7merUKcDEZyKb89ba32Hp19q8wQ16
 5GMcRtK2E7X9wd5TM28Uhy+ZOt9Vz+kYk658y7iUrj2aKteAwyd6ztkZqudsO53PaXBb
 GMvZ3m4X2ppjeTugo+D4fxy72gB13iLTmnBPSV/uQ/Fnx20J7392Zbq28lGUut+l8Gf4
 DPxQ==
X-Gm-Message-State: AOJu0YzjRWV5lMOVosE984Pc3VU5/CkUaOviuDAowho7/Ov2o+wNvqo2
 swrI2FRPGGGdAFZNoT3E15PFgqfEDlDblGSiKrkLPRoqdDjQ8wy7
X-Google-Smtp-Source: AGHT+IF+2hfs65fkoWiUs/HSCOIbHLEKhpzbzho4iZxl7g/p01uqljGejyAtgqq27Lzz6upYkCwZDQ==
X-Received: by 2002:aa7:c9d0:0:b0:555:3b98:7540 with SMTP id
 i16-20020aa7c9d0000000b005553b987540mr690951edt.33.1704394246053; 
 Thu, 04 Jan 2024 10:50:46 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 j7-20020aa7c347000000b00552d45bd8e7sm12953edr.77.2024.01.04.10.50.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 10:50:45 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a26f5e937b5so95687966b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 10:50:45 -0800 (PST)
X-Received: by 2002:a17:906:897:b0:a28:b7e2:15b4 with SMTP id
 n23-20020a170906089700b00a28b7e215b4mr427985eje.88.1704394245242; Thu, 04 Jan
 2024 10:50:45 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txBXQR8YsaU2fO1frcGBP6HKTF473Rqae_hwT_yY-dRrg@mail.gmail.com>
In-Reply-To: <CAPM=9txBXQR8YsaU2fO1frcGBP6HKTF473Rqae_hwT_yY-dRrg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Jan 2024 10:50:28 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg26tNyaOE5jAcEg1t_zK37mHXqJN9nzmYDA3dN_WO5kw@mail.gmail.com>
Message-ID: <CAHk-=wg26tNyaOE5jAcEg1t_zK37mHXqJN9nzmYDA3dN_WO5kw@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.8
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 3 Jan 2024 at 18:30, Dave Airlie <airlied@gmail.com> wrote:
>
> These were from over the holiday period, mainly i915, a couple of
> qaic, bridge and an mgag200.
>
> I have a set of nouveau fixes that I'll send after this, that might be
> too rich for you at this point.
>
> I expect there might also be some more regular fixes before 6.8, but
> they should be minor.

I'm assuming you're just confused about the numbering, and meant 6.7
here and in the subject line.

This seems to be too small of a pull to be an early pull request for
the 6.8 merge window.

               Linus
