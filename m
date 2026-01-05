Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79A1CF565A
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 20:35:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2916C10E1E3;
	Mon,  5 Jan 2026 19:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JjsqGOUW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0215010E1E3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 19:35:44 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b734fcbf1e3so62128866b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 11:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1767641740; x=1768246540;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cCvkvL2C/5gj+RhnXidCQE8qJ7m+kanbEcL9OclNPb4=;
 b=JjsqGOUWaum2Ek2kdGip+iJILcv96UFFSs5tS2IvC3V+DkjWVTxuQADKU0DCJA9G0d
 sWIHn/kzrs4QZ8anRvvKXigd7kAKkhSF3FAoeOVfJ3iEZNcfv2SnmtNu/KIt9RdoT2Y/
 b5wTB/5snRBq0OmpDA36pcxSf9qxO8iQjWxBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767641740; x=1768246540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cCvkvL2C/5gj+RhnXidCQE8qJ7m+kanbEcL9OclNPb4=;
 b=XwcuM+IBEHTIeOhtxsT0M8j6jlqNStrpUrNzDHyfg1vvOE0N+1TDkJHJfzvUVV4WJr
 OEuL1HsjFNxHimnI2t0fmrDWUkupgWX775JZY/uMSWvwYxQ9ZWTvxKp8O5OjtpGKHc1U
 R2G7sFeY/E1b+45esko9/HstbsSqnpQX8JuptMjwOCEVc2OptT304WZrUozfsrvGB9kS
 +9AQUXq4F0boo6WfaHFjNTBT/LXp0CuSfEgovM34YcOLo7c8adAZfC70Wh9Fa/WiCIEm
 PLUjvhVNjOGyQoQuNF+AU8Q6lz+YBkjmz8RVlaQyLLvuUpkwtA2yuIclW5e3w1f4hIg/
 ZbYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFrz8CDwKJO++IRubwe5TMxmNCpEmpBdrKTv6Q6oFlU/2TSDGnRJuUji+lShYx/WDPEkPUCPelco8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAFwc20DNjpJX55L07zft+6dap6Bs1RSJ2klDuhtoOv+JYR2ed
 6j6PP9plkHLQiWcO6rEUPDrF5aOTDf3FdmdxTfzMhNphlX+fi+y1YLZhJRAlCTseqtcY79/VcW5
 t8Mvjew==
X-Gm-Gg: AY/fxX4YHYjzNdMf/n/NeiLd4kIGXxyaAYMrLXwCwOw3k9wVeFAxMjcYFFy/Qwr+naL
 N3m2mgS2gWD7eren1+eA9fcMcx069WDUUkBii4fTh4NVLQaz9atNM1qQvrTOgX+amb6q2PWCP6C
 xRCSZai61q6esMGfgH4x3royFw/d82uYPpYfehJNdW1rqAPbNFOjnIXmLHRWVueTipyicFjIf/W
 ICQF1oEqI6F2ggJXav3oosug9s4lw3cYR9KMeOYu5pIUeMqI1kva/89uewKIlULT5mosXVahHTC
 QmctuKvlfk+7vJJm2JMO1HxrHpIMf9MCnAlc6rxRoqN5mTtezmL0UFPNS4FrynB15TimNtUkeen
 kOz9bLFeb+uPcDjLZFTR1beyv7yI5htvzz15rOQ8WXycASzP0gkE5O9+XNrOVs8N+iEZjCTblNu
 zaZZKBsc9QGk3tjNw2DfwgJn4cSOIfU+ABtGJPt95kfpWRKJa+Ig==
X-Google-Smtp-Source: AGHT+IERYSklsBmDOKluTMrVf064upbIvyVmBV0t2v15d1d/tin8URU+q14DrLqOmyjF7w8ohK0nLQ==
X-Received: by 2002:a17:906:4fc8:b0:b7c:e758:a79d with SMTP id
 a640c23a62f3a-b8426bedb1cmr91961166b.37.1767641740022; 
 Mon, 05 Jan 2026 11:35:40 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a4d311esm9184366b.38.2026.01.05.11.35.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 11:35:39 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so116641f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 11:35:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWE6UDfCew59Z5g9AUtzW8MoL1WqSglGBxeb+wOajgEbx/2JUyaH3MJZ7Gj7VaoCrR18WoMxxOPi80=@lists.freedesktop.org
X-Received: by 2002:a05:6000:2089:b0:431:53:1f49 with SMTP id
 ffacd0b85a97d-432bca5166emr1151221f8f.41.1767641738057; Mon, 05 Jan 2026
 11:35:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1767111804.git.robin.murphy@arm.com>
In-Reply-To: <cover.1767111804.git.robin.murphy@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Jan 2026 11:35:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UkCYRPbs3u3jGRZaqs4EW4-zA75iAaqM+=Weom1uojmw@mail.gmail.com>
X-Gm-Features: AQt7F2qVclSy_2QUaj476pwucQuko2WJOWlBn7va8S3tPYkC358gB4ruqkJGhvQ
Message-ID: <CAD=FV=UkCYRPbs3u3jGRZaqs4EW4-zA75iAaqM+=Weom1uojmw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Properly support FriendlyElec HD702E
To: Robin Murphy <robin.murphy@arm.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, thierry.reding@gmail.com, 
 sam@ravnborg.org, jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

Hi,

On Tue, Dec 30, 2025 at 9:20=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> Hi all,
>
> I've been using the HD702E LCD/touchscreen on my NanoPC-T4 for a few
> years using my own DT with the "simple-panel" binding, but now we have
> upstream overlays I figured it's about time to try doing it properly.
> The screen itself doesn't seem to want to work as a generic "edp-panel",
> as it appears the EDID isn't readable until after the whole lot is
> enabled - I'm guessing this might be to do with the Analogix driver's
> force-hpd behaviour - but since we do already have the legacy data, it
> doesn't seem unreasonable to keep using it.

Oh, I guess I should have read the cover letter before the patches. Sorry! =
:(

I'm hoping that with the "hpd-absent-delay-ms" you'll be able to read
the EDID. I'd be surprised if something else is required, but let me
know if that doesn't work.

-Doug
