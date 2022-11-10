Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9427C623FA2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 11:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305ED10E136;
	Thu, 10 Nov 2022 10:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE7410E6BD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 10:20:25 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id v27so2378106eda.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 02:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WT1sp5IPFlqAEGyaQKXIUIsFWQxK+jocZJELwyh5E0w=;
 b=pBqPySRnHpyjJKe+ZBXagkUziKZPW/TImdx+vl4OfGoT9HVFMB3g5FYzMChNCzMIQO
 xdtitKR4yHXxwO653Swmltzv5EnaKy70V4153yGyy89JVmGY/7fXk8JhBdG+8sdWUy3U
 UW7mZHQLmSi+AENdVeIF5Qj/sqd8q9pqtl2b4cDGbMoy1ykuNhiOi5eKUcviKfOTzmO/
 5l0wn//FrUB0W1AV5VaVDRGug+fm+A74IYCk3CK37EFs8BEXwTiNmZQR9slMlwbUiixx
 h3h3G6nhzerbiu9HruFtykqs2Mu8VJ1/xFoTYVrX/i/FukGpJFRReo24grB1RwGLoZa2
 SBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WT1sp5IPFlqAEGyaQKXIUIsFWQxK+jocZJELwyh5E0w=;
 b=SPa9nlZX1y/wIxQu3mm5tQhKLwB4omwAKkRflW0Yp8b1F9736VBsu+WIHgs7yhtYhg
 WfyMO3Pyi3gxVPhlqJSyIIXbPEs3aCkjpX7EIjaG4+TPZeRrg0nO59RkuOHPmqAqnxsz
 kwhfK/Epod3Qg7tUXxtKHP25aCB6DtMY1hbcKut/Xk0mfGyBz72+uUS6Pz2o8paT6Htv
 pyyFOtNwATX1JEb5E1DEy+0fiD+ZaHjERaRFXmZ/peoRsr6xBq3wPHUzwCg3PnUD+X3f
 /82nb5+4BpvIq1MpGj367uWqpqtbHRh9gL0NFXZgvjD3rFf2Nt/KG4/qLMMUPi2zChT+
 tfig==
X-Gm-Message-State: ACrzQf0KjJEiHBs3Ndu0UqhyYwnukjKup9wcKFYLUQi6f3L6xWQVBLdI
 qKri+ulfijT1Kj318XPP0Gs=
X-Google-Smtp-Source: AMsMyM7AM8HzOXBUhXvmNiVy48+7gon51CuVPmNToIk8pMMTZ49w9wO6yapdghVw78ZOaSpXDkqWUg==
X-Received: by 2002:a05:6402:3512:b0:461:bcf0:86dc with SMTP id
 b18-20020a056402351200b00461bcf086dcmr2073597edd.368.1668075623499; 
 Thu, 10 Nov 2022 02:20:23 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170906601100b0073d83f80b05sm7047991ejj.94.2022.11.10.02.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 02:20:22 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>,
	thierry.reding@gmail.com
Subject: Re: [PATCH v2] gpu: host1x: Avoid trying to use GART on Tegra20
Date: Thu, 10 Nov 2022 11:20:18 +0100
Message-Id: <166807557587.2565903.17395326570545995355.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <39c44dce203112a8dfe279e8e2c4ad164e3cf5e5.1666275461.git.robin.murphy@arm.com>
References: <39c44dce203112a8dfe279e8e2c4ad164e3cf5e5.1666275461.git.robin.murphy@arm.com>
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

On Thu, 20 Oct 2022 15:23:40 +0100, Robin Murphy wrote:
> Since commit c7e3ca515e78 ("iommu/tegra: gart: Do not register with
> bus") quite some time ago, the GART driver has effectively disabled
> itself to avoid issues with the GPU driver expecting it to work in ways
> that it doesn't. As of commit 57365a04c921 ("iommu: Move bus setup to
> IOMMU device registration") that bodge no longer works, but really the
> GPU driver should be responsible for its own behaviour anyway. Make the
> workaround explicit.
> 
> [...]

Applied, thanks!

[1/1] gpu: host1x: Avoid trying to use GART on Tegra20
      commit: c8899b7129927d96d2a948a0d969ab13b9f1dad1

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
