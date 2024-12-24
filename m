Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A76A9FC25E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 21:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9459F10E4AF;
	Tue, 24 Dec 2024 20:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Sn2EKCFD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2522710E4AF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 20:42:22 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3035046d4bfso48284231fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 12:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735072880; x=1735677680; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eSmx/3z/9KsMFggKELsYft98BetV5zNV0d+x+8R4lkg=;
 b=Sn2EKCFDFWT7D3uOLNN2HJKlWBqn+HOWtgpr9vj+eao3t6onRiyFXatYDg8at4GsGX
 epoitk8vQ6VEgsz6zSzWjVlCdpCLZ9Gj5K95g/+0ANLoa5ab2c1Ar2zGMjXDOPbcoabt
 T3H0qWtaPQ2F6GoDeLyU3SFb/xJHcjjKV/zC3T38p7EujLv8fLH1f8PZGHVeUdvUBWv2
 pDqIOboeWyVhK4yTuyWKx+n2n5N1tiP1nWIVTT8oG/HZ4qcqSgJuMrmyvV/ySRVZqnea
 IBrSSv9ejscsOKbE5dqe47PeY+Lu2phBa4syYF01RCOTnNa5iq8/CWw+D4YKB8laFt/z
 e0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735072880; x=1735677680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eSmx/3z/9KsMFggKELsYft98BetV5zNV0d+x+8R4lkg=;
 b=CAw+v7KrYDImhffE9jHsW1p4GgMnNikIrNmXfl0pnPmticREDUpQFKLmG2J6R851kH
 ag63m3GCYv07MDUDjO2bKFpOGdkDTVHamjmigdkrKe09P678FSLH+xCL1Ia1Nf7V5jZF
 i3PXvRfXiX4MwC3IpyJXH2ciPd2dE2q63yns4HD31U0XjqP3c8Q/bgViIroJ3G3MY0GJ
 8YvPkk4Vg8TV0H7/vtk5NvunN+PHOBL2A8/OVQwOx4JXMhH1hA2KkxyvaAHoXYFZfQMb
 ADb0FV1IoXiH6a3w2MFoaFx2OYWeMVbbR2Uye3ncAhTaLWFl7JVm1Bz5nq+GtV2Gopjm
 ulkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE2/bSAp5lPb3kSfXFe3de/8wofDhHIUpav6p9MBy2Tk2qZz7YjfLHv4YByaWwPDdzfvDKFYJmNSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0SgP/6d2JwKGweX14k/tI/xwAMrHL6inBadsGYqfW5SWBEddO
 yCx1rKbM+so2lgyjwris0JzZvEpMc5U2rHMdDLRRUM6kK6SgnbXZJg0/vbd21pI=
X-Gm-Gg: ASbGncv93zwzeopGNLtBiJUA5x/gpchQJ0dLhqnbs9tG/9V7B2+zYOoBJVEu0YecNrH
 1IX5Ih/l8yfj6YmOrIbzd0SQvHyERIejVBcYkU81aTF4j+EPdt/mKzLl2rOQfwBKi7PYnijkdwR
 nYOPscZa73yHISX0LjpTvd7hZBzHk1GSK7uJyD2Q8SbyYBQDkUCiWzKhJZZU6UU8VACFpWiJsQx
 OtAjfRbNyTqg70bQDHbfIQNxNjdVzAaN4aXJ7bobNaM5SCg67sIHzakJkg42aevz45+eTi4
X-Google-Smtp-Source: AGHT+IGnBXUn8XrDRSk7MSHo/mbak7ZljAWLgb4oZ/IVbfIPiilmBmfXljpSRu+9hSl/CaBSMljYuQ==
X-Received: by 2002:a2e:a6a1:0:b0:300:1e0e:48db with SMTP id
 38308e7fff4ca-304685722b5mr45998001fa.24.1735072880580; 
 Tue, 24 Dec 2024 12:41:20 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad9bbdesm17808361fa.44.2024.12.24.12.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 12:41:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Check return value of of_dma_configure()
Date: Tue, 24 Dec 2024 22:41:04 +0200
Message-Id: <173507275849.561903.11265213822765879155.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241104090738.529848-1-sui.jingfeng@linux.dev>
References: <20241104090738.529848-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Mon, 04 Nov 2024 17:07:38 +0800, Sui Jingfeng wrote:
> Because the of_dma_configure() will returns '-EPROBE_DEFER' if the probe
> procedure of the specific platform IOMMU driver is not finished yet. It
> can also return other error code for various reasons.
> 
> Stop pretending that it will always suceess, quit if it fail.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Check return value of of_dma_configure()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b34a7401ffae

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
