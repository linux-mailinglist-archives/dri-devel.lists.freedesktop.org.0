Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9490286FFCE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 12:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9375210E9DB;
	Mon,  4 Mar 2024 11:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZLpVv8BQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA7610E9DB
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 11:08:36 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-33e27940554so1341180f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 03:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709550515; x=1710155315; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J8QRT14PUSYYy03uk34X/ZoBf4XH47r3nKBEcmsMw+Q=;
 b=ZLpVv8BQ7xiG+lQRYKipu1/tVAOSIK2KQ0/OegcAp1yrmhZh2k8URJttLzkDIma3Fy
 fs4mYebj73fV5gTKGBoL9XMHoxtlU4vpjR1sBD2ul5neENCfq906EbZaH6GeGNa8kOW3
 3R2/6aBRmZaGvmMnaU/GeomtPQAEDkaaga9PRldcN5HLduueDp2kMQDGfX9nM2il5hbo
 CjZ9bl9Nfz0aNBFGcOjUnSeHMKfTpQl4unPYMq7ZjL3O55SXjogRlYeUl5vaZZuD2lIs
 tR7kfKcdYby0iaZalZgm0SutbUYaD2W4cFIzUUYavcCvGVofxJSvUaKTNvuVACHnd83m
 cC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709550515; x=1710155315;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J8QRT14PUSYYy03uk34X/ZoBf4XH47r3nKBEcmsMw+Q=;
 b=NEr9H8VmgiHvRaz7hW4VPQtqIrTNkTMVY55QGX4BqmFCsBL3SSPNISf9CTFioK+RoC
 BvglmV8fHs/VYHqcnueN/kcEFpjiNOLnCB10jmOgMvsUb7nex115CBmBz03iCs1TCJNz
 CtEpt2X/siUqeYwnHbWBH6ImZo1KM6hPBPnrOyuN25kZs9luLyMHqJLML6PU1Wr2Fcrv
 Tfr9SRJlaZ+wwGi7JpzDKOcKSzmS1QstvvjSEqyhS+iCKognl/LcpaamK/xkYVUuVRiD
 P5DmPEo1zhVTyiUncUBn03Z8MrAClIrN2tAsR+FnQ+a91oz61ojASYKF5VNe2ynMnaTs
 RUFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/oAQkPKqre3LiIezTSlZ+ayCvsBww7iIyUQ6xUODjFFtUSS31NPbsvR5f1KDVrwH/LXk/qjbRrraPv0byPEvk82qhEd7UdTdUQD8/Qd02
X-Gm-Message-State: AOJu0Yx8iUVfcgWsKrTZ0Jg8p6vsXmBUf7+wxUyemNtaq5J3tsrMMaaY
 qZwsq93JZCX12f8TViRLpK8jqL6Lt8jnsaxT3VruI3MdGLTU/ZnWNK4uq+z6ko0=
X-Google-Smtp-Source: AGHT+IHM96X7a2A8hQD7HFP/kAS8dWVSqvNaJeysD5QyLGeU4kUUmWcLPlRWWkxANifuMKzE4sEu1g==
X-Received: by 2002:a05:6000:124f:b0:33b:5725:e516 with SMTP id
 j15-20020a056000124f00b0033b5725e516mr5363029wrx.51.1709550514754; 
 Mon, 04 Mar 2024 03:08:34 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a5d53d0000000b0033de10c9efcsm11932573wrw.114.2024.03.04.03.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 03:08:34 -0800 (PST)
Date: Mon, 4 Mar 2024 11:08:32 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] backlight: pandora_bl: Drop unneeded ENOMEM error
 message
Message-ID: <20240304110832.GG102563@aspen.lan>
References: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
 <20240304-backlight-probe-v1-7-e5f57d0df6e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304-backlight-probe-v1-7-e5f57d0df6e6@linaro.org>
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

On Mon, Mar 04, 2024 at 11:11:44AM +0100, Krzysztof Kozlowski wrote:
> Core code already prints detailed information about failure of memory
> allocation.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
