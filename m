Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8A6913894
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 09:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594D610E131;
	Sun, 23 Jun 2024 07:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mV6zIIu7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F69610E10D
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 07:14:19 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ebec2f11b7so35655041fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 00:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719126857; x=1719731657; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ioH4meZfE3J0aKheUaFtsWw5CxwMG+4ACECKaInyeus=;
 b=mV6zIIu7cvzfc3fOXk60KQOqnai3MtXPfDVK4w4/FC8B7zzzvH49M0pzU20cbzsBPy
 cvq7CXtlfCSYaEWAZIAiy2KsVYDhDhR7A5ta7OcA3tabsOsM6HA+2gSI8YdOu3KWUwrV
 W1b9XeW2DJIKO6RAQeMgoh89+dX72zUhE4jmmJnCjFDmjzvrDdrBaDqg/Kkw5QnMrTQP
 BBu/BCiscaITeF5ypWHMRFnwYA4Y2m9DawjIiNM4YSRS0oHTvYXpNDOcQXJNvexV0L+x
 IPLwtzeEgq4GHg7L0MinNq4tsPOQCJ1mFHK/+70KRtr/xiusrNZOiUqS94G7m2LCLS/9
 L5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719126857; x=1719731657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ioH4meZfE3J0aKheUaFtsWw5CxwMG+4ACECKaInyeus=;
 b=TM76IG2nHpkyjyu+vut/EwLhUTWTEpad8QS0f7zm90Z4Kbx0S9lqwAkKsYZmt/o7Mf
 yKja+RCsTRTG6i324RVEv0GaDIFBM59qsQRqEyADclLB9z0K6eo16w5fZEosx12+hwI7
 CI1jIRnJXyKXuymEU3Ma7xduvu/zmVZxo2ERhcKgwdqloxjVmeosEUhamd60TnvgjvU1
 OmnKpk+9FO11iar8gxm9KagluLybK97wZkL9/Aoje25ALpHwYl4b7uTcxv5HzfDlQCYW
 UfRoq4nevcFrAdXd3dkae/96NeIzraNe4LVLkWULmXzwdfvTUZoEkeWRwODbbSCgs2yb
 AWrg==
X-Gm-Message-State: AOJu0Yzk8CyaSh6NZkmYxw+xTG1KWQPSKqPhKC6MewNbKWXQnMilBNxn
 dzWI86iX1zK0satrVd48RRfOOyo2beAxHWa2laQGW4MlY6dl0ztTZud18BlCtxg=
X-Google-Smtp-Source: AGHT+IGMCFummccQ65js7i8Tyhq7c7d4P8AFkM0I/x+JPP2dWKhThzCfyL7cKG7s1TsbWGSSuOl3uA==
X-Received: by 2002:a2e:9c90:0:b0:2ec:5518:9541 with SMTP id
 38308e7fff4ca-2ec5b318018mr8720431fa.4.1719126857567; 
 Sun, 23 Jun 2024 00:14:17 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 00:14:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
 dan.carpenter@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dpu: drop validity checks for
 clear_pending_flush() ctl op
Date: Sun, 23 Jun 2024 10:14:10 +0300
Message-Id: <171912674296.840248.10530875454580478310.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240620201731.3694593-1-quic_abhinavk@quicinc.com>
References: <20240620201731.3694593-1-quic_abhinavk@quicinc.com>
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


On Thu, 20 Jun 2024 13:17:30 -0700, Abhinav Kumar wrote:
> clear_pending_flush() ctl op is always assigned irrespective of the DPU
> hardware revision. Hence there is no needed to check whether the op has
> been assigned before calling it.
> 
> Drop the checks across the driver for clear_pending_flush() and also
> update its documentation that it is always expected to be assigned.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: drop validity checks for clear_pending_flush() ctl op
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3d68e3dedd4b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
