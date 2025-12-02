Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DCAC9CEC4
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 21:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA32A10E2B7;
	Tue,  2 Dec 2025 20:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I0nzap1B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87F610E2B7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 20:32:45 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso1846795e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 12:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764707564; x=1765312364; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PUBtZ8cLKM5d5hZ3mQmHNgCoY0mmWdEWs/wmEJwMqZY=;
 b=I0nzap1BTnxxjBaH9nmgMFTOsWQ4K6OlM9sjwOnS1vm/xDPyD9C5auXRbQzISx08Pn
 y0dFtvUqgrCZIshZWnfHQUBy1l124CgTnAWOCRRevif0U8eHBkWZk3mjd9eprnXG53LP
 ROAp1qalunTqK2saubjwoNWPMeoJqggdZXmCG940ExZFzrHkWud85gANCSBT/FOYCTFW
 4SzuNpTjdIfD/6uRNHjq4LN/My4XpgZaDzM9Iaw+tAyawgIc942fCW221PR0EIpIEl8g
 SM+9wtRMpS8+PvxaDgxNSfvH5fM8G1AcXFWkZ66g/kemkiNugyb5mo7OTRmBz8yN/PHI
 zC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764707564; x=1765312364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PUBtZ8cLKM5d5hZ3mQmHNgCoY0mmWdEWs/wmEJwMqZY=;
 b=CP28ep19FR6fRjeULvArcvw5o29bCbGy4zsQfT9UwcS1nfigozb7YzNZWe30J4pvlh
 9Wk2w/lKk258o6bPaO3iW2jnV6cRa1AXOsAA7SaROqYCs7wT7CZkINDed+aBYGACJfts
 fyxvKXhCSnRyxEZJr5HdlLIEcJogUdAyzwc6SEpB8Sfhf/MfBjISfwH2ZrzDlurYb8xp
 wBiL1jnSsnBXYFmn/AMccPad9OXmQytYYJyOe5xecSJ9a7NkCjM/ijFjb7z9QlC9DXQ7
 xepxJqUYP6yLS7SdLUNwHH59Puj8ZvEraYjlTVfNfkdVPBMFyqVUtFWfKXZvWla1AmUV
 87Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0FF/ufM4XB0MkYphfJdEMXorpxahnYsJSi5MfLZ51EynPls94TtE5W7Wi4Il4qoEjvgQnQrUBefE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym2+LQ8Bww/G9ghcUym808Vcxn2d2CxaMNxWG4Oxlc1PQnBrZ1
 wQ1PQ/zqO7Jb4ldT6bnkM3QezZppSdeyD8hwFoSs0UDZvBkvHa0tbQ3+
X-Gm-Gg: ASbGncsWtJ6NR8sUpw0X4qUM4Pcs9UaLXYSHicRlGxsZYplH4w7EyveLzMQ/9BaP94T
 Ur9/TmvNL6QAWE7ShoBT7xLQJnH5RXiTw+BGOL3soOSrBKA20/qCgLYzbuYHbjEjJ0nfI04z7mu
 lbXbsK6sozk/lOvN0BaXITi+h8z44tvRJpFyaj4G8WvazmXrvluH9OOzwHMYTNQMq79qd/aGjAX
 TwIV++vZ1aLua1ZBuLZ68beafdpahb82PNn/6UwTXJv4VETQ8AxRGQkGtHKC3OoY2pwfjagOnVZ
 X0gzRItUjIPkIPAvkd+8qZETT6iGOvD3LkOiE3H7jDCcX81wHlR2uHFmrm7bD5MNZi3xJGqUZ2j
 69CRj5A6i9Mb9Qt21KixVyDlm+frN5xWVwciM1qBKApVrmqjmZ/G69K3SWrCgscXZA6vcgSWdyP
 WMB859mNXo0fe7VP2SPrrg6zS6U6tOmK+bzBELtYJHVvxqQ8Rgi3EU
X-Google-Smtp-Source: AGHT+IFivlozvH6bBlGbstrebUkwLUxZxo6lElB4cxa3RUVfhbge2mArpvbfT4BqVBOBwBydEMFZ6w==
X-Received: by 2002:a05:600c:c8f:b0:475:ddad:c3a9 with SMTP id
 5b1f17b1804b1-47926fa069cmr46582875e9.13.1764707564292; 
 Tue, 02 Dec 2025 12:32:44 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792a8ccbfesm6461965e9.13.2025.12.02.12.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 12:32:44 -0800 (PST)
Date: Tue, 2 Dec 2025 20:32:39 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Helge Deller <deller@gmx.de>, Chelsy Ratnawat
 <chelsyratnawat2001@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Raag Jadav
 <raag.jadav@intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev/pxafb: Fix multiple clamped values in
 pxafb_adjust_timing
Message-ID: <20251202203239.63084e0f@pumpkin>
In-Reply-To: <C3FDBCE7-14D9-4999-B463-C2E3E384E7DB@linux.dev>
References: <20251202181600.511166-2-thorsten.blum@linux.dev>
 <a7213b69-f6ae-4975-8c8b-2783dbe9f9b3@gmx.de>
 <C3FDBCE7-14D9-4999-B463-C2E3E384E7DB@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 2 Dec 2025 19:36:17 +0100
Thorsten Blum <thorsten.blum@linux.dev> wrote:

> On 2. Dec 2025, at 19:28, Helge Deller wrote:
> > On 12/2/25 19:15, Thorsten Blum wrote:  
> >> The variables were never clamped because the return value of clamp_val()
> >> was not used. Fix this by assigning the clamped values, and use clamp()
> >> instead of clamp_val().
> >> Cc: stable@vger.kernel.org
> >> Fixes: 3f16ff608a75 ("[ARM] pxafb: cleanup of the timing checking code")
> >> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> >> ---
> >>  drivers/video/fbdev/pxafb.c | 12 ++++++------
> >>  1 file changed, 6 insertions(+), 6 deletions(-)  
> > 
> > Thanks for the patch!
> > It looks good, so I'll include it in the fbdev tree.
> > Out of curiosity:
> > How did you notice? Do you actually have the hardware and tested it?  
> 
> I only compile-tested it.
> 
> I stumbled upon another driver with the same bug and then used grep to
> search for other instances and found about 6 or 7, including this one.

I've just hacked minmax.h so clamp() and clamp_t() (and thus clamp_val())
are 'static inline u64 __must_check clamp(...)'.

Didn't find any in any other files.
But I think you missed some double error in the same file (nearby).

	David

> 
> Thanks,
> Thorsten
> 
> 

