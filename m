Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D705C80363B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 15:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA14D10E266;
	Mon,  4 Dec 2023 14:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB4E10E26B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 14:16:40 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c9fe0ef02aso11414301fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 06:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701699398; x=1702304198; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZaBZHQpZqDG2XfMQ4dp5yLxoXxp+aROTaKcGQwWYDB8=;
 b=jS4gI69AfeqfgHVfkOWRm1i9tN4A7D75ycom2qktiLc8ljXd2K7Ww7VrPqvtVJWhDG
 2cRa4uZo89s2vtb0VMOiOj4I03Ra1n/zqIG7VFe5VFpvzb63SoRTjxqM1fLUw22ZQ4Yb
 5MAc5d2BvTn7sLxkdnkTkqMRia10sB2xfXhzIqUwhdCUKtc/+c8AZsMnG8UZsgmHSSMj
 S0taay2xPyqvj99tfrNDtaTboSMYekDie6FrJxslPOs1hjnf2O64l/CupfXAgLnx0Zct
 dCEbNDfazsXrMbYfiDg4w9mnnRCURp+YMnAw/I1zNJ3vk4Ak+1Rbk1AhHflsus53DQBe
 nZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701699398; x=1702304198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZaBZHQpZqDG2XfMQ4dp5yLxoXxp+aROTaKcGQwWYDB8=;
 b=EPnM/nLtRAQ/BhIoC3rvhc5rLJWz9bu1xbKp0+fWWcu0ergYZKT9t2IFCSy/dC1dcg
 oXnWxwYvqj1qyyVHWEKTh8vBfwqcHq1GeBrPMWpux6H+DjqiSC9O8HbQHIbCkJmnBxqH
 MFk+NdifXrUjlIxY8YHo7QYf9bXS8p1Nkr7THLRoXdeXOewqD2tjwVpdIc2GiOkMLhDb
 NN96eSzQljNW0eRDpmR6/EtRGj25WxS9EKYrZvUYZDjVqpktK6mLjhbuRXthlca6dvv1
 wunB1MTSHpeKUHUCKvCumhEHT6pP7+KT3dxnMLN46hMMGGqdoPgCEAxsU6FOQTyteccK
 7EtQ==
X-Gm-Message-State: AOJu0YyWGrctGZ6FRGcM0/BDljwGc0+REadbiTns/q8SyZxG81E96iyc
 eoUdpU5vD+bjFvMHlggtWYHywlcxSHOhIkxa5ZJuKZls
X-Google-Smtp-Source: AGHT+IFhbnCuBV0JCw7uGD7qCiHyX7TJPwxSzrjLdzNKuV7GNJId7BTvK6QFl+pUyF8nsnegDyQuUQ==
X-Received: by 2002:a2e:7a14:0:b0:2ca:135:2204 with SMTP id
 v20-20020a2e7a14000000b002ca01352204mr1307465ljc.16.1701699398333; 
 Mon, 04 Dec 2023 06:16:38 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 v3-20020a2e9243000000b002c9fda71acesm487033ljg.127.2023.12.04.06.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 06:16:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH] drm: remove drm_bridge_hpd_disable() from
 drm_bridge_connector_destroy()
Date: Mon,  4 Dec 2023 16:16:33 +0200
Message-ID: <170169936702.76859.2850036545937110756.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919174813.26958-1-quic_abhinavk@quicinc.com>
References: <20230919174813.26958-1-quic_abhinavk@quicinc.com>
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
Cc: andersson@kernel.org, linux-kernel@vger.kernel.org,
 quic_parellan@quicinc.com, laurent.pinchart@ideasonboard.com,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Sep 2023 10:48:12 -0700, Abhinav Kumar wrote:
> drm_bridge_hpd_enable()/drm_bridge_hpd_disable() callbacks call into
> the respective driver's hpd_enable()/hpd_disable() ops. These ops control
> the HPD enable/disable logic which in some cases like MSM can be a
> dedicate hardware block to control the HPD.
> 
> During probe_defer cases, a connector can be initialized and then later
> destroyed till the probe is retried. During connector destroy in these
> cases, the hpd_disable() callback gets called without a corresponding
> hpd_enable() leading to an unbalanced state potentially causing even
> a crash.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm: remove drm_bridge_hpd_disable() from drm_bridge_connector_destroy()
      commit: f730e7adfd69d7ac859d8fe4d67e980cbad1e445

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
