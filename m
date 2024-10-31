Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C7D9B86E9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 00:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7056D10E94B;
	Thu, 31 Oct 2024 23:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w7KuAx28";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B151110E94B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 23:17:48 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2fb58980711so14068511fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 16:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730416667; x=1731021467; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=frsp46Okfb5QiVmFNAXVWYtRI09WjPuac7vIqiSQUO4=;
 b=w7KuAx28uLdWO47wDKvDNVr3XjkKX5mVHlvzqACWtalo8KNkxnA+YshkVi+QdCWIMI
 Fblms4H+ZoF7qZp8J4/XuREoLTSsFxnYzPdq1nz1fnaglDgomSdgITsCiyxmRDXE3YRq
 wJqmggdgZs3hYk4a4ZXzQ9h+IYz/g4DtjwL3nQpMiG7tH+wAqYuVxob93ZJSbk4IZWYo
 tyDAT/zIj9RH31EFoWDvENRsDAaYOjht+dxgNXhDZvCRAB4/m3b7RYQq4sDRAcfmECQF
 THeeizzTGK9a/ygtMCH2QcSN9YPLOldl78KPd4CQbPuUf2OJEDYgB3u4SUZbpJ3cN8pm
 hFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730416667; x=1731021467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=frsp46Okfb5QiVmFNAXVWYtRI09WjPuac7vIqiSQUO4=;
 b=C2r4yjXzDGYLfJ4rQ1V/DI+KTddW1m02eMvotIoN4OUKhMSwLMooRI5TDPzookY5yy
 40NlyYHkFH0LbvjYa8oPW4AXKISY3aP2S58l1b9ybgpk3PES6PTAXO9vofUatgehs2KI
 yq5qLwol8D2HI7bWG7GbVwWbDh7QSM+xFl4wQ5tIH++FEwHeP5aXyrAn+qLy+RJsJAs8
 weDB6XyumJ8UMCpXBWOd/q3byTPmOi5lTs3sSVVTK8WUU9e6sVyV/+nBxFKK0obmMx4g
 i/PiT0Od56ouZRXlABhDDIGkvofGgU7X7iZZpR0bzje2UOO/by3PpfRlJnd2YEHBGxvp
 ayJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy8P1AbfyFerRIdKhKuJv3tRdnjPWwXHxxiH6ykJMU3QbsrsKCRn8bFAqO411qUz/srfHwDvKurtM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJSXCcFki4ef5/ggeYsk2GW6FGami+kgMplfwDDFk+/r0zd8ZX
 M9xyg92rFnIDIE5kJiLqpCVBhYJEFtRT1DdddciVZMIi4xUpPqwUbYqcovij9R4=
X-Google-Smtp-Source: AGHT+IErIn+8tk3gc2319GvFqnOquZWc1mPt8zpg0mrwwWOluM01t+jVj4/jowjH3KFQAqp0pQvtuw==
X-Received: by 2002:a2e:5109:0:b0:2fb:4428:e0fa with SMTP id
 38308e7fff4ca-2fcbe04f435mr79462881fa.36.1730416666587; 
 Thu, 31 Oct 2024 16:17:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef617ad0sm3536041fa.67.2024.10.31.16.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 16:17:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] drm/msm: minor msm_drv.h cleanup
Date: Fri,  1 Nov 2024 01:17:41 +0200
Message-Id: <173041664077.3797608.17754324846652823290.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
References: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
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


On Thu, 31 Oct 2024 23:44:05 +0200, Dmitry Baryshkov wrote:
> As I stumbled upon msm_display_topology define, perform minor cleanup of
> msm_drv.h incldue file.
> 
> 

Applied, thanks!

[1/3] drm/msm: move msm_display_topology to the DPU driver
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f8706bff68cb
[2/3] drm/msm: move MAX_H_TILES_PER_DISPLAY to the DPU driver
      https://gitlab.freedesktop.org/lumag/msm/-/commit/858b64e21217
[3/3] drm/msm: drop MAX_BRIDGES define
      https://gitlab.freedesktop.org/lumag/msm/-/commit/26d841fd1c15

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
