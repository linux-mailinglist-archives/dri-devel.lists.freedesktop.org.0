Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB24D21305
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 21:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13ECA10E688;
	Wed, 14 Jan 2026 20:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="hmrZVOIY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A5310E688
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 20:33:14 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-5014b5d8551so78161cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 12:33:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768422793; cv=none;
 d=google.com; s=arc-20240605;
 b=WLsublEAI8t7zVWQv25ZfcCyGp0HDhSPbqG77s7PgDGZmuK7mnZzJpVS5t/QHVva+N
 qPopi7/MQB5bgj79gVlS+DszeYzczE4OE4WpnlaDnR1af3tvGTpoOCH2t5GkbbKlkc/A
 RXEPahZsGrgCbtTHiguNf9caC/Zmb4IIW5F87l9yXOyOdJeAkF89DFSop1YeZ7snMZqT
 sCbgdFasHftaYAut3CUtD5vHKTCTOfJ73fJz01S6uSJBiUvZB7XyPrLJqYrcRjrEHiHW
 usGPOjNJwPq0Bn1nrSosdrpZ50arfdPB28r+hJVnsNO4m7tdFpbVaMFPdqm1UZJ0B2cl
 7gQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=L2qUhi5GqLcT68OEJKLecI02kmIzgIz9YY1G1+QA60A=;
 fh=lYUK2QzEGQ3WDVSj2lryPGYS94THcnwu2ROxNj3dcRs=;
 b=YKx8Nw0xXeMtNnnGWWCwRsNQuDnPFtvG4vqgFd7FZOyLlo7qphWnjWxQ3ol2Rmfw2H
 DD3gmcenS/6ix0kozQ+9RPGbpsUbd8g9MwL6cJoxmWy/4XmktRNTvw3QtzBf27Em9+Ot
 p92C1uOZxIKqK0ggNvlqyThY5Q9eD+dx5mv3pRC46QGw3geOPVksk4vCGzBJM4ceEylT
 1dKUP3FZMSADJPtd4ZvPiglXao0I+Qd/WbLR0vqWy2/XRE/dARzKosD6bdxLoq6WMals
 NbQTDn13zMk0kxaijklQSqQpQVKGyFDsjjFOzaeIsrczridfW+G+9BGA8UHKxcIy1KmB
 3DXw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1768422793; x=1769027593;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L2qUhi5GqLcT68OEJKLecI02kmIzgIz9YY1G1+QA60A=;
 b=hmrZVOIYF+muvhTj9OcIuzBKCXEg6pbrV2x88ITvDSn7eljYFspJQ7e/FwcK4F4OB9
 /xeDOtVsFNrI4B+ShfWxQNk/Lhz7uYW9TxyLyxMEJf0CpHcKtI/T8paGbTUsBuxNrbnh
 OWPYdsX8yCvk6o4F+Tyx6ZPN3v+qVWUt5tplw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768422793; x=1769027593;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L2qUhi5GqLcT68OEJKLecI02kmIzgIz9YY1G1+QA60A=;
 b=YvvAr8M//A7iI2aX7pUSnrIWD2GG+l0GvIVxMppSaQC4lgRqQqGU89HeLtvqOj2Zh6
 RmRnDKI/kE633kz+wcM/mIdr20g1vJnoucdqt2Jn8/c+hwLCqNm/Gd6uY38pTrhXGokX
 BVnLz4i2fr+lljQarrVcvhRcWZlCsSLHFdmH4TDCEHWtJrz+oEGmix45BkBYKEoo3TDg
 9wMwnKsGoMBh8So096N9zP+eGmyezAVwU0WpQ2ihUT/AeuJ+8qsnDeDewvJMz7GniUM4
 BY71M5cBdCHtQG0nJ9r+5SbyfrrGzNsV32vMPE31FqL8UCGoBkNDNGBsapadBT/Jg1aL
 2B0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6UK6HoNjL5ODi7XSCD6H/KvtMR4/3YfyylWbp2g6hWvQvtWqptABDHBYdIX4Z5qzCayoK2OtxHjY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn6nnmxRLskWwofBsVI2rApparOtxwiQ9VoLEQeI76cUw93eJR
 6faB99H1FuTVPWEWCqP3HbfI8W40nF6CRgNA6aOX3tZC/d7q8ZTlB/46dtklu54lQxpPc0CJOlb
 +p4C9g1iZ3uIYrkGE0Ynk1Dc2onXI9LiLPregZtIr
X-Gm-Gg: AY/fxX7pMm1ihjb7wlaNQ9Igj7HKYKVBWt53N504MgxSrmEzEJIBNSkRHRcAsbMBjdX
 8I1+ANgHS/qF50wUgHfWX0YVclaqOfCg2L8oszcFlw1eEktKjbSzFx7s+O1gOYdAsAL2qTaM+gs
 sPUOJPjlghNX4dqwSJ0qSdBNvKH6SFXwc1tMFYP84NV0uOa3GvA0LdF+0dDKluTCbyJfu2lASUW
 xIvB5RvEnuPwbxyZYfLowUi6TBD/BkLTmBiNsnFnU6UK4tQ91nd0+G/aoErV9qzS3WcZD7Ew7MP
 SADq8pvjz3GkOH6rt/xe5v2U
X-Received: by 2002:a05:622a:4b0f:b0:501:5180:3c90 with SMTP id
 d75a77b69052e-502009984cfmr1248501cf.15.1768422792691; Wed, 14 Jan 2026
 12:33:12 -0800 (PST)
MIME-Version: 1.0
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-2-tzimmermann@suse.de>
 <CAODwPW9_ym3E4za3yoUAs0+1sQfaKTDOau4Oh9Zm8+2uvYVgFQ@mail.gmail.com>
 <9d9015fa-aba4-4dd7-a024-563f58b7f43a@suse.de>
 <87tswvf5n3.fsf@ocarina.mail-host-address-is-not-set>
 <CAODwPW-JdJh1QmyMWxoZdaXKTE-y0n5BRSZPaj8Ntszyu10OuA@mail.gmail.com>
 <85fbdbe9-28bb-43c1-a5cc-6ad8861b96a5@suse.de>
In-Reply-To: <85fbdbe9-28bb-43c1-a5cc-6ad8861b96a5@suse.de>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 14 Jan 2026 12:32:59 -0800
X-Gm-Features: AZwV_QjVwzBhyPz60Pd4NCPrZZoJImvApT5iRWKTNbJvb1nRjPpq98n5BJnB29I
Message-ID: <CAODwPW9vkYdqtHbVbwrrJ5P7Hp=6N7HwrSGiog1DwzuNSruSOA@mail.gmail.com>
Subject: Re: [PATCH 1/8] firmware: google: Do sysfb test before creating
 coreboot framebuffer
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Julius Werner <jwerner@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, tzungbi@kernel.org,
 briannorris@chromium.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, chrome-platform@lists.linux.dev, 
 dri-devel@lists.freedesktop.org
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

> IDK. My take would have been to provide the coreboot table under
> /sys/firmware; similar to DT. And then walk over it and create devices
> for the known entries.

We have established userspace infrastructure relying on the current
sysfs layout (at least the `cbmem-XXXXXXXX` nodes), so while you may
be right that there may have been better approaches to do this to
begin with, I would much prefer if we can stick with what's there now.

> I have a new iteration of the series that creates a coreboot-framebuffer
> platform device for at the same place that currently creates the
> simple-framebuffer device (in framebuffer_probe()). So we can leave most
> of the code it as. There are also a number of bugs that this is going to
> fix. I'll post it soon.

Sounds good, thanks!
