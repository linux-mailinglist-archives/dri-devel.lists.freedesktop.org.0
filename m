Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3997A916B36
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AED10E69F;
	Tue, 25 Jun 2024 14:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fAjyyQPt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A8710E69D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:56:42 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52cdfb69724so3404783e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719327400; x=1719932200; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJLpd9x26v7wF/fApEc7Qe5167IuLVph4X9sxGmlGGA=;
 b=fAjyyQPtNKpEvDNBEZrWiaj9Az6Rqn+YyFwrqg4T5YcCOPcpeXQ9YLAO1QkSVDNT6k
 8H2HJd0ZtgQeTOzAgkPJnD4g60FDuLRpS6bg1dQlhnLKc4Oc7Rcxy/LqSpdtt1voLer5
 ssoZ5R6wrkirksCnRmZW+LBgToobzA4tLxk4FnV25chl1npTvKGfRjAA0Ew2qrrSLgSL
 1DYWLwY2N1WqJGeIuG5xvsy6zEGilYOO3VnsOF8UKGEEU3o2moswIy6cKgiotisH/hMr
 WvVT70aiBr4L5+wjWss4xhTqQ8o5L7ymHj3cIUu6Wzu4gjGX2Et0Cg7iHr0WtzyYEbqc
 iVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719327400; x=1719932200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RJLpd9x26v7wF/fApEc7Qe5167IuLVph4X9sxGmlGGA=;
 b=O9tv0acsYsfbVkB2nBk3jUEg1M43Y3irSCoNOAzFeMrPLr9NhD0Kl0/ZxT+tDw5y0Y
 blz3zRgAAEsSDrNaouBTqzP+7EwN+kgwbF5l7bWed1UL3AS4Scrr153yKXKS9C3li1mS
 M6+MmcM3lcQ4mhY5ynPlR/BSjqnNd17qNadmzf/S8jMdRryCJU1Lee72nwZjhSGU3lcR
 I9nNN0FAVTrAqwB3dBGJsjOldY8BUZDssuI1WT8m13CiRtziRZGnW50Ue8J9GFitv6TL
 mipPX8mZrB48UpIu7rGeKXR7zQlGWjmol7sppcbUXQdzAgm1G2c+Zf7vQTUjP2WzBTdZ
 KTKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYqSWqVmqhNvAJT3a3zR/e4vriH01dsPq1XK7wzHGh6YuhbNNSV9lr9cbh1lSa4/5h5NhCgM3CBzUIA9aquAE2/eZZaHVopXs+Y3BFH5CD
X-Gm-Message-State: AOJu0YyJHssrGMl0XzkrWn3Z+7qkpRPGu3/MIjcKMBZuY9Tb3VFvPBrr
 ngyrafxLUAL4e8Mdq61cNCMoD+nCIkB3u9JZ55zsC6+BstoJEvyoK9Zf3QL5d3c=
X-Google-Smtp-Source: AGHT+IHmVvpHX9CK7J8+9e6YEWwkWkypw8ccedGQLbNwsWmOitv3YpuJqwgIOFdVLVSEwdlgCNL28w==
X-Received: by 2002:ac2:58cb:0:b0:52c:8596:5976 with SMTP id
 2adb3069b0e04-52ce185e9c2mr3983923e87.55.1719327400338; 
 Tue, 25 Jun 2024 07:56:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd641f655sm1257321e87.162.2024.06.25.07.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:56:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dpu: remove CRTC frame event callback
 registration
Date: Tue, 25 Jun 2024 17:56:37 +0300
Message-Id: <171932736810.1437673.14531545327158209638.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625-dpu-no-crtc-register-v3-1-1b161df13776@linaro.org>
References: <20240625-dpu-no-crtc-register-v3-1-1b161df13776@linaro.org>
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


On Tue, 25 Jun 2024 01:38:25 +0300, Dmitry Baryshkov wrote:
> The frame event callback is always set to dpu_crtc_frame_event_cb() (or
> to NULL) and the data is always either the CRTC itself or NULL
> (correpondingly). Thus drop the event callback registration, call the
> dpu_crtc_frame_event_cb() directly and gate on the dpu_enc->crtc
> assigned using dpu_encoder_assign_crtc().
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: remove CRTC frame event callback registration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5b90752f9619

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
