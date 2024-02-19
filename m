Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1049585A352
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1483110E3C6;
	Mon, 19 Feb 2024 12:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yK1nVkni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2334910E3A7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:55 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d0cdbd67f0so60694211fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345853; x=1708950653; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QyFhtEBfZ6PVssITkZfWZ/QQ+58yPncpMkJouF082c0=;
 b=yK1nVkniNAJOt9HdRs0mP0RZZ2qXtA835eC/9R5yQo6fl7Jd8C165mFIbcmUtxV0xG
 LJqi0uyFCybhvisS2RhOvPo9ghVIRRoqr0pEtRJc6NVPYQgUlXkMQYFGa2uGEzTnJINN
 YiK+uh8OuFDzBLzgSll2emCKLLSIfI0IlT250K1EnK89vCbwImBh4V7chK2aldUXcWbU
 mabtaHHY8dHnP/ilYMSXIaqbc/5rPxW6ZB0Xf7smaRrekpdXHZCf6VWSksrH/Q4b3h6U
 zzGaUJZS1nFQAeG5Qn1HA/GdRWGz16F3TX/nGlNKjtgY3LxFDEsFdz/GL/VlMC06kr/j
 HBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345853; x=1708950653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QyFhtEBfZ6PVssITkZfWZ/QQ+58yPncpMkJouF082c0=;
 b=oEBI7XaXNdNd30oh+URYtdcJtJenoGeiwDzS+8m1pR0B+y+8M5cTjAxfNABZm0n8G7
 7jpb17+RuZHdHVINBGL0UAdxm9GvRvuwg/Y1At2+V9/4fVnTgHV4Cr4zF8Bf6x0Dpo0k
 8u/IO9BcaDmLI7n66YY/WfBtCjiIqj607QR9buTTcTfB2Lp5eFHEp7kHHkdPyULh1qeB
 C8iPPKR3ySy3sRnErJgK0pDFmzfMrhhNyY4p2GaAT9wXRPS/7k6z06UEi33v2XEQmU/r
 D7Qd+8PEdl1k597WwvMZLdVBWV5GMxkluQONHJYxLa8ZzyuWDQeLFBDhv49PrFiERvll
 h96Q==
X-Gm-Message-State: AOJu0Yz3usxEPTa8gLUcOGfWWfeJ5X4K2NNoUsR8A32Uxyqh8OMpZMhZ
 e0SOlMt9Nw1iKSA2NM7bQRHJDkuYDrpbn9Cb9szfUdg/A1KQBMpq03iZDignK/gEF0gVuTaMGiq
 M
X-Google-Smtp-Source: AGHT+IGorwPUbuwsMCHZHKYAUD0Xx6Q7OPT+kxAR+Mxz5tB71Zi9WymYQWz8IWVBfXZGUHC3mVLj7A==
X-Received: by 2002:a05:6512:239e:b0:511:697c:4130 with SMTP id
 c30-20020a056512239e00b00511697c4130mr11235415lfv.43.1708345853005; 
 Mon, 19 Feb 2024 04:30:53 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
 andersson@kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/msm/dp: remove mdss_dp_test_bit_depth_to_bpc()
Date: Mon, 19 Feb 2024 14:30:41 +0200
Message-Id: <170834569499.2610898.16035500222497589380.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1704993255-12753-1-git-send-email-quic_khsieh@quicinc.com>
References: <1704993255-12753-1-git-send-email-quic_khsieh@quicinc.com>
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


On Thu, 11 Jan 2024 09:14:15 -0800, Kuogee Hsieh wrote:
> mdss_dp_test_bit_depth_to_bpc() can be replace by
> mdss_dp_test_bit_depth_to_bpp() / 3. Hence remove it.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: remove mdss_dp_test_bit_depth_to_bpc()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/72b557c15956

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
