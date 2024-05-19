Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6868C974F
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 00:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632AC10E2DC;
	Sun, 19 May 2024 22:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QsayhWZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0324610E2DC
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 22:30:52 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-51f45104ef0so2861892e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 15:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716157851; x=1716762651; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vHblj1WkR9Gxv/WTlCLTyj7EGHA1VwykM/BT4nbq05c=;
 b=QsayhWZWLDggq2chOYTjGhtiW56xcJ7aCw1BknZi1V7rtArwwpEkjo1uhtpjitLjnt
 LVkE9B4RbKWXVgqHzS8HKA2R5vdLK5Xxw+b2Zw1yE0SpuLV8Piu5UfCUosecVkXJbqnj
 FrrSAAFZifsAKdEYygNyPDS1ddw9EwOrq08htdtbMj6xSXzfXRxYWNLjJxstJAc91/aM
 cgSs/iuNJAkemt6pMsWM4GPofAiXwQ+QKrS8oCvRbCkJ7nAE0yzOJX/c0z/l6r109jZW
 KcqYp3hb18in6U0n4fBmnZbPObqjQWhgmzkWB91I/Km96yu3+fTp6YXg9J41smqxi3zu
 ww0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716157851; x=1716762651;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vHblj1WkR9Gxv/WTlCLTyj7EGHA1VwykM/BT4nbq05c=;
 b=DU/m3dteIPM4qCD3PBxHPY3PcvRQidcRuXRnQq9+E2b9bsSrB4+vIB7nrCuih2uBbe
 lk7naWbBqAwnflg3DuTCpfbLG4RHiZw0gSdZXcFZWdxKq6l0k9ZCTJVq4mNyZAwoQObw
 fxmVVd7JgrKHajKBUrkvdIk4LdeMQBTdBZACj4OSAIG/fkhpoMN1j123AYZacg7S/ojR
 rZDMSvlL+QRvHH8aXqxHpG/1yeEcVuRdoHe3NejWTokFCm8BSUbbebo2bovJDXK2EDHT
 XeDWRaFa3YAOfolj0+wupgXPPE89wffLkqhuLuDhEa5SgmrprU/BKSkYkF/NbyXH1b2K
 HMGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNeva48pyH8afDMecGPQX6yeXFc0aWAMB7fwDB9E0toxhISP5BY+VsOoAK/Xnk3uqTqRB6SakGUfdPzJgepuztA/ZbFsd8Xc8AI7UZbEcb
X-Gm-Message-State: AOJu0YzuuZpRaIYLi22d/c/xHdcfawvpC0EJwi3y/ArgPKrt4yYpFxdR
 L5B5OKfLSdIHs1HpRMYBMi6cOtf29SqIA6c2B/+wYYei7mXRE5054PJ4DNYt404=
X-Google-Smtp-Source: AGHT+IH6ISab2GoZ62ixCmb9U8+Aj2V3McEjnnP8f8Av1TMQLFPgjxIoJBilpiTiA1xgXYvwktvjGQ==
X-Received: by 2002:ac2:4284:0:b0:521:e065:c6c5 with SMTP id
 2adb3069b0e04-5220fa71b3bmr16664375e87.11.1716157851130; 
 Sun, 19 May 2024 15:30:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d8811sm4061253e87.216.2024.05.19.15.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 15:30:50 -0700 (PDT)
Date: Mon, 20 May 2024 01:30:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux@treblig.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] drm/bridge: analogix: remove unused struct
 'bridge_init'
Message-ID: <6tfxkc3foarpfuo6viwmsm4e2ujxjmhpqsku37d4ov6ppufpjr@byrbjs7srqri>
References: <20240517232427.230709-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517232427.230709-1-linux@treblig.org>
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

On Sat, May 18, 2024 at 12:24:27AM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'bridge_init' is unused, I think following:
> commit 6a1688ae8794 ("drm/bridge: ptn3460: Convert to I2C driver model")
> (which is where a git --follow finds it)
> Remove it.

Please rephrase the commit message following guidelines in
Documentation/process. Use Fixes tags if suitable.

> 
> Build tested.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index df9370e0ff23..1e03f3525a92 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -36,11 +36,6 @@
>  
>  static const bool verify_fast_training;
>  
> -struct bridge_init {
> -	struct i2c_client *client;
> -	struct device_node *node;
> -};
> -
>  static int analogix_dp_init_dp(struct analogix_dp_device *dp)
>  {
>  	int ret;
> -- 
> 2.45.1
> 

-- 
With best wishes
Dmitry
