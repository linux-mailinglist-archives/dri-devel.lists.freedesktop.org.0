Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388E48022DE
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEED610E282;
	Sun,  3 Dec 2023 11:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC71B10E27C
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:46 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50bbb4de875so4775792e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602805; x=1702207605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RUAZdkQfSAqXRz9x79MrIU9qVt7c+xHhhtTJPbP5odQ=;
 b=ATjea1t63hNkdHGEdM/iQx+9S0hKCzWNYGuPARCBw1lKkyOFDSJvZ7EdOpl4NNfBJI
 Jpb2PmWOQSzvORMlkCIRUntNCj2NNXjRw2nTQrAKGN8ZG/YzYLWHSF3qIdMU3AjeKren
 sYbeDQUivjkg9I6mjsRYTx2i75eRusczHxajzX0nDoVYTpVNN5qSAmcXYRnDqcFPSWyT
 8nktrzqcWeCCpv2WOMUSuBwEHTKzTmz/FKn/I82jIr6cUb/6Od5Hqn9c06rZGyeSQ9jr
 710piFMifZtzY8PYHO7ylR9S6r26g9AcZUGYNo+hWiF5JkZEK/TAuHGDqTvuiljvxZQJ
 qBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602805; x=1702207605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RUAZdkQfSAqXRz9x79MrIU9qVt7c+xHhhtTJPbP5odQ=;
 b=Jslg8AZYf8f02GjfthKhp6fysbCplEfgtZrEkVJ8ccsPUJKQRxBJy4tRe6a4umfJBD
 TnkTA2TnKhDK9jiukcCq5gb9+BKn8Li1mobeQMwKmxUj7PNHKgLZ5sQN4KbtvUrgKx3o
 yhDsMISHK6LwibjWHwPmPm3NDMLvaGqCDua4+6vGKz9Mu87AunPWOkJ/cYT6hKGBJ+d0
 QWcLjUZ0ZMemvod0GdWclrOClF0hfBNm/68k2UUE3A/hTRP/JmBKPnbQGYR8i/raLNVQ
 KR07a7n0GlY4j0RnKJCrdjezN4z6Xl4Xr9a1QmhGw0SzvNHZM42o+SoIohM90XTDw1Oc
 5HVQ==
X-Gm-Message-State: AOJu0YyJvJSBNgQahsmRAEkFPDQcFxaBEv4VD8KLTlpGZ5oY3Fr4tJ6x
 SzSmiOertIynlbwBJiRxW3Sp2Q==
X-Google-Smtp-Source: AGHT+IHpk/z4/x3A1ROGUbkKTKcCtG2yf3p8Kv9XcKn7Zchlb9ULC0uBiXCrO5CVwkjyr6QNXtGPDw==
X-Received: by 2002:a05:6512:2352:b0:50a:778b:590 with SMTP id
 p18-20020a056512235200b0050a778b0590mr2401244lfu.68.1701602805313; 
 Sun, 03 Dec 2023 03:26:45 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org,
 Paloma Arellano <quic_parellan@quicinc.com>
Subject: Re: [PATCH v3] drm/msm/dpu: Capture dpu snapshot when
 frame_done_timer timeouts
Date: Sun,  3 Dec 2023 14:26:30 +0300
Message-Id: <170160265539.1305159.16684138495833882761.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231130224740.24383-1-quic_parellan@quicinc.com>
References: <20231130224740.24383-1-quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 30 Nov 2023 14:47:37 -0800, Paloma Arellano wrote:
> Trigger a devcoredump to dump dpu registers and capture the drm atomic
> state when the frame_done_timer timeouts.
> 
> v2: Optimize the format in which frame_done_timeout_cnt is incremented
> v3: Describe parameter frame_done_timeout_cnt in dpu_encoder_virt
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Capture dpu snapshot when frame_done_timer timeouts
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9cad81143ef0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
