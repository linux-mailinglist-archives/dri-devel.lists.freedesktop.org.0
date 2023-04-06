Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8526D96B1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 14:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C00410EB95;
	Thu,  6 Apr 2023 12:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9A910E2E4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 12:03:31 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id g18so780568ejx.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 05:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680782609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Go1w/1aC0WMyrU2tHEVEfl1C38hl149Gmuqes9rB4CU=;
 b=PkCc3NvlQhuP1+R3SS09h9Z8RCY8z69FZW6IcytblCWpVTiDmhz5jwclTiasCwT9Oy
 Hjkz00NzbleMgor2QtzlfPHNCDMhONlMs0aOZIDhu9s+kY5w8k2rSwW6NqNznGZwGxXB
 Uok5lWzVAlkfLSSbgqG2SUbsCVWvJkUs2JAtdrty5sa7n70JJtRFeXF2g1iL6zCEMMf9
 To8Bh5tuYLOk0sd5a19fiSigun21Dddl1DqdBc/DF43LcU9rCHgf42qwKcxYk4MciX0q
 60668KYX8/wAdiqETfOP1OIfyeoQsUtcxT3ykCWPoJgrz3u7lASbKFI7B2jC5OM1/YFd
 L2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680782609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Go1w/1aC0WMyrU2tHEVEfl1C38hl149Gmuqes9rB4CU=;
 b=B2e9WWJemcOoXhE+Zdiy5Iijxm0xB3nYidssJAuxeIeT5i8Wpw0arFnFRVSdL/EBFd
 DLOY8mySNuHvCdQbCBPsAybCVChPm7GRiNCL3Dro8j9A63gOortD3s4yTQDP23g7oCZ1
 7CHMX86mx2FvNKCQbT8Qb3b13oZLhXgqCMPZjkfW1YJB48oPlGyicYrwG4Up4MGQHnvK
 8nkyDp3M+SYiIXNidWDf8y9ytsRb876vFFI8mne/mbz1CFicTwKLp49Nf4bOHrfVrcgm
 dK0IFQ9abHrBlP7j2BSULyfAC8ZRXzrUVPj6XdFI5kylIcFDWQJr85LOtChxFeEF+kWW
 yIcg==
X-Gm-Message-State: AAQBX9f52h7CKuAvBnKS1m2S/an8PIpmTvJ2leSLE9upvC9yw7mmri1d
 JkC4kUPRuqgKTpQmV8f4rMQ+XteRTVc=
X-Google-Smtp-Source: AKy350YtecHxljjAvQASvWuOoFJYdUQt++BoqDoynDN0CWd+SUGMxylECCAzwF6q1YbVCNQU+UQCKQ==
X-Received: by 2002:a17:906:7150:b0:922:446b:105a with SMTP id
 z16-20020a170906715000b00922446b105amr5169539ejj.19.1680782609139; 
 Thu, 06 Apr 2023 05:03:29 -0700 (PDT)
Received: from localhost
 (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a1709067cc300b00947f4e2b2b5sm721007ejp.127.2023.04.06.05.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 05:03:28 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, mperttunen@nvidia.com,
 Nur Hussein <hussein@unixcat.org>, thierry.reding@gmail.com
Subject: Re: [PATCH] drm/tegra : Avoid potential integer overflow of 32 bit int
Date: Thu,  6 Apr 2023 14:03:28 +0200
Message-Id: <168078260130.966805.9780166486659802079.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405202559.2232430-1-hussein@unixcat.org>
References: <20230405202559.2232430-1-hussein@unixcat.org>
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

From: Thierry Reding <treding@nvidia.com>

On Thu, 6 Apr 2023 04:25:59 +0800, Nur Hussein wrote:
> In tegra_sor_compute_config(), the 32-bit value mode->clock
> is multiplied by 1000, and assigned to the u64 variable pclk.
> We can avoid a potential 32-bit integer overflow by casting
> mode->clock to u64 before we do the arithmetic and assignment.
> 
> 

Applied, thanks!

[1/1] drm/tegra : Avoid potential integer overflow of 32 bit int
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
