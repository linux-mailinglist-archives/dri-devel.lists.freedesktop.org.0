Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D493851190
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A7C10EC74;
	Mon, 12 Feb 2024 10:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cEnF3nlB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E61F10EC74
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:54:41 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-410e8412b54so3594555e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 02:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707735279; x=1708340079; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AN73LICug5VW++U499t0Wayh8Nvzz5HHvSHgzNyjW2E=;
 b=cEnF3nlB8j+nijSa21eUmjkaurd3SqcWbjAiyL+A2pRQeaSHQSMahClmLM9mEH6ZYK
 ipVf34i2jXEk43r7LLESUUX/69HPcsjgyMldgpEOGiQOqwPJi8VwGP5yue5kdRSi7XGT
 gtRJdoaAQWxhRDLSkpOPJGx5umdiFS7By40GKYOiTLtt3gkwIwqVYpubtBlgRvXPV/cs
 NfVJaeGNzk+YiNLjvFmu9yEt6HBf6ZhTroA5v19MpOFgh8Njsc8oWbhnqlcGvH+7CjLJ
 pC+tK4DsMWPaXKm9ECZ6NrZE1e4Lkc9WljEtDa1ANL7c8XhHRXifQ0oOiEAqGqlw7j/f
 6KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707735279; x=1708340079;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AN73LICug5VW++U499t0Wayh8Nvzz5HHvSHgzNyjW2E=;
 b=dJuwTFuS3PIAy1qYrh1EBcSFznDTjAmBCWPXLdKjtoRUJfK2rpi1HwAUXqmcKytvNg
 xCh9oMvHfFBzuTXYdtKwSsoFgKBv20kjRDEGA14TnT30p8Uq6hI/Y8QAYtpPq6EQxqIf
 Q/9BgcDUWUiPC9GvKjR7shxez3ISpQHsgUE1sFyhTrK0d4CVTYyDDDWUdaVWjBbC7RID
 HQqDfbMKY/Kl+aqCdMhckP+yTzp1/Tvbalqzbey1NNNeXnfauFy75EjJ7CmuV3dhAhc8
 V5ZzuVuLgnEAoHDtdQFcDuvPS0tbUz5OM91IYC8Tuf0HEDbynwERXuivx1qYYfvcK5IX
 0X6w==
X-Gm-Message-State: AOJu0Yw9PPF80Hn/vNYFfwbGETIPGecdP16ImFZqEmIaMWvRh+g/LLAs
 0nyir3bGnNVTNtaBSSrKu1xm/OV4CoBYAnQF2+q5apBSZaO15rlbD/u5Y4OkfroQQRdTMbi/Gbc
 ekOY=
X-Google-Smtp-Source: AGHT+IHSe4H9vS5lPNXIEa7nwJk3bFBhiBabiLH5VYY4Y79eetaSZxnzvF+amgrzd0Ufd1oi5wt6wA==
X-Received: by 2002:adf:e441:0:b0:33b:60ba:d990 with SMTP id
 t1-20020adfe441000000b0033b60bad990mr4371624wrm.19.1707735279570; 
 Mon, 12 Feb 2024 02:54:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUCe2LrvntnsOtdZ25erDPdrpNU0Pkuuo26fivdkvy0LpaVzwmyVxiMipi/TjvBVoLO9tSja2KfIgxo39/LF8ZZKy971lfFj0uGuYDx+hXduyixJ7m2zvDCJR/CL1bBaj8wgx/MRAFx2GIMdmJUngscf1naw/2ab1L4SA3TlW4AYI50IWqiD8Dwevo2r9ZpxFwEK06jBUUgvpUYco1fjh4E8XHGQw0wG4Uc5htxi5gHOiMbfn97Vf7CFenQPkqsbhnXGzl94bt/1nOrN79/8R9pKwF0ylax7jpvsveEFSqBUnP3QQTI606SpqMNvOxY5A409mHcK3fPyNqjMz6y/+ZqbgkbGOZyhfP8ZRnp0APrGaqE/Af8ocgj6OdGI0ucQJxZYdVYAt4rA4EpzdRxug==
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ce9-20020a5d5e09000000b0033b8808355fsm592374wrb.28.2024.02.12.02.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 02:54:38 -0800 (PST)
Date: Mon, 12 Feb 2024 10:54:37 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Karel Balej <balejk@matfyz.cz>,
 Linus Walleij <linus.walleij@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] backlight: ktd2801: make timing struct static
Message-ID: <20240212105437.GA4593@aspen.lan>
References: <20240210-ktd2801-static-v1-1-90ad2e2e8483@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240210-ktd2801-static-v1-1-90ad2e2e8483@skole.hr>
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

On Sat, Feb 10, 2024 at 05:16:17PM +0100, Duje Mihanović wrote:
> The struct containing the KTD2801 timing can be made static as it's not
> referenced outside the KTD2801 driver. Do this to prevent sparse
> complaints.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202402100625.M0RkJhMh-lkp@intel.com/
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
