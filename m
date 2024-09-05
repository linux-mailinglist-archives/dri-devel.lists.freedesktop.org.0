Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8272896CD52
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 05:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FB010E68F;
	Thu,  5 Sep 2024 03:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A/fz974x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0FF10E649
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 03:33:46 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53343bf5eddso222993e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 20:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725507225; x=1726112025; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KyUpvOqb1HnLAQIbraYek0wvreZFpF6ISG16EWHJbNQ=;
 b=A/fz974xwM7afTu1R5RyrAE879bAWcGj+j7zR1sSLHtE3hUJV0GM4ZhG4KR66SN/a9
 rqQpCY2ak4tnLiwj199Ebbbd81H+zM1jWL7QmTc3zp4TYShOTVgS/E+OVRLsKh5xT+qT
 /hYxpxNOhKbKIJ2oKmsy8Zp0qNA/ynzzn3+Ao0DGr/PjAlD9usB16NJqk3SQkHNYIVFN
 TdLi587plAabS+lFFQ6iwuSt53Ks9sky9y2LAyOW4VdcPm5q1+sH9KW8tfVvRgF2Qehw
 BEJd77dfZXqp4Er+HF6ZCDAPV3CJsepWF/ioQ99IA1sgRIDUEIo5vyZNDkHbqgTrhGmK
 4dQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725507225; x=1726112025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KyUpvOqb1HnLAQIbraYek0wvreZFpF6ISG16EWHJbNQ=;
 b=K6Ue6xfsr9AJkVkIg2rBJ8+P9C4dXBGsY5MX4NghIXaTI2rKEwcHpZQeBo1i9PUqj8
 h1BGVx88G/8CgAxhQ6LlQ764uMj3xpPHg+Bu+gygdxu1647NfAV5pRytHJliwehPYRzw
 RKjUKiN/iWr71wkqqO7KssKthJUtUzAfC7g2hJ/V7m3XhkLfnioSFaCuPM1TIzYvM/2N
 WafG71GGTY1uDxrRG03xYxnrZ5fnY1P0bcp69pfnsZ+mezfoS1On6/5IRtX51NYvNsS3
 cZJNS40LlaVXRc8HC4xh8VvdxRcRGqFsjLQTLRoUM8x7uM74RpZ317rD5DGsfkOwO3Rl
 MALg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvGXrwbWlE+zEw4Lns2+eBqg6qG/tgUu7ZHnE78BUotck/q2ZiNaaGkiocqckPVQ4UL+K76pM245s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSCRsBkz2H3vxWywIILhicQ2TpmOmMM/W9kG3Pu2S52XB69Jeo
 gyiU8MhjjWGjlJsLc2nqlJa6Gq8AG5HGkR6rjvKrymo6Stbhrrr96+R8Uf7c5is=
X-Google-Smtp-Source: AGHT+IGL24J8npgJaD6qdH/iBLmRVEB4YeGZTdlYLtr6yfSabcuuW1+0DO4dioT58qUKhW1Yg6Av3g==
X-Received: by 2002:a05:6512:4014:b0:530:daeb:c1d4 with SMTP id
 2adb3069b0e04-53546b1920fmr12600653e87.12.1725507224725; 
 Wed, 04 Sep 2024 20:33:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:33:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 ruanjinjie@huawei.com, Sherry Yang <sherry.yang@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/msm: fix %s null argument error
Date: Thu,  5 Sep 2024 06:33:38 +0300
Message-Id: <172550712137.3299484.13467941827572106122.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827165337.1075904-1-sherry.yang@oracle.com>
References: <20240827165337.1075904-1-sherry.yang@oracle.com>
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


On Tue, 27 Aug 2024 09:53:37 -0700, Sherry Yang wrote:
> The following build error was triggered because of NULL string argument:
> 
> BUILDSTDERR: drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c: In function 'mdp5_smp_dump':
> BUILDSTDERR: drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c:352:51: error: '%s' directive argument is null [-Werror=format-overflow=]
> BUILDSTDERR:   352 |                         drm_printf(p, "%s:%d\t%d\t%s\n",
> BUILDSTDERR:       |                                                   ^~
> BUILDSTDERR: drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c:352:51: error: '%s' directive argument is null [-Werror=format-overflow=]
> 
> [...]

Applied, thanks!

[1/1] drm/msm: fix %s null argument error
      https://gitlab.freedesktop.org/lumag/msm/-/commit/25b85075150f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
