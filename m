Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0F1B07A08
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 17:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F52F10E745;
	Wed, 16 Jul 2025 15:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BLwgbfXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4282310E7D2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 15:37:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 12678A52163;
 Wed, 16 Jul 2025 15:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A91C4CEF7;
 Wed, 16 Jul 2025 15:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752680266;
 bh=kREwtPjCgKfqsTgv5NM0Mvvtgu8NBDUf/T41rzVZ/eM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BLwgbfXuexHaW+TPNa+a6iWrfr4C93SXyFNP1m6zjdbchQIQjSDQN2bPIFxq8BOpe
 3Y4LzFtdIUdhJXmJbTn203g5qdg44tOZHIiKBjGVH/5wnPgme7Tctz2W+/IpaDnKLe
 8BH6cepPRo11/392JBcaABYWXwIdAxzxeBnssoB5sZ9TDXipnQosvkIEHom5c/u7FR
 D5nq5bg/vTcOff2xiwUMeSzoEHZJ+oD85tH7KUakcBcdGy7jLA6BdqiTOB742SS7aD
 cPI1ykzdDf1e9s8V5rHlN8rkVCKkwk/zgI6tMkbncjd8p53Y7Ww2OULF2uyhky8RTf
 UqoBVX+/4gwsg==
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/14] drm/panel: Use refcounted allocation in place of
 devm_kzalloc() - Part5
Date: Wed, 16 Jul 2025 17:37:42 +0200
Message-ID: <175268024705.1893267.8357084891720845996.b4-ty@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250710-b4-driver-convert-last-part-july-v1-0-de73ba81b2f5@redhat.com>
References: <20250710-b4-driver-convert-last-part-july-v1-0-de73ba81b2f5@redhat.com>
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

On Thu, 10 Jul 2025 23:31:11 -0500, Anusha Srivatsa wrote:
> Use the new API devm_drm_panel_alloc() for panel allocations.
> A major chunk of driver conversion was sent in a 3 part series
> which is already merged. The coccinelle patch that was used to
> identify unsafe panel allocations didnt flag about 20 drivers.
> 
> Not using any semantic patch for the remaining drivers.
> This series does the conversion by not passing explicit type
> to the helper and maintaining type safety suggested by Geert.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
