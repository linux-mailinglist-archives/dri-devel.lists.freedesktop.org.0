Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E4D769154
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 11:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB0910E16D;
	Mon, 31 Jul 2023 09:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7E110E16D
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 09:17:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 426DD60FC4;
 Mon, 31 Jul 2023 09:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540D5C433C8;
 Mon, 31 Jul 2023 09:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690795022;
 bh=cOpj9BlruJjymEMzZIyTXkbD/sRQcn1Id0bW7JPEITE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h53iXvduBELhY/IJ2/w4HEx+LWG5S4V0aErXcogPo7TEVBoz6kDh8QR4K0nK0hWDr
 SAbS8zhdISYmdSEAnQak3jSbbxLlaxZix/5qZmuyX92OQJXvsUB5n+/UuJY2Hrz+Ko
 IvVrtdJcPqAEK4dW3F9Qv3FsVYxg3F7chh/bCTFO6JHqbZCk7cOwxYn1Kvpeud0zK9
 ihlH9e0fXPnVKhDOKyxJseeVYaNagrJhLrOpz6PcMbk/9YCzez/X1Eu6JOkyqUkMju
 95JVTvOZ5TEj1uJbcIVzZYCPdStrAlHMb6sipLEqQjydFAUOG05sTuWv9PY1Caa4CT
 FvYJ891DPmQFw==
From: Robert Foss <rfoss@kernel.org>
To: luzmaximilian@gmail.com, Zhu Wang <wangzhu9@huawei.com>,
 dmitry.torokhov@gmail.com, Laurent.pinchart@ideasonboard.com,
 penguin-kernel@I-love.SAKURA.ne.jp, jernej.skrabec@gmail.com,
 airlied@gmail.com, nikhil.nd@ti.com, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, andrzej.hajda@intel.com,
 u.kleine-koenig@pengutronix.de, peda@axentia.se, eballetbo@kernel.org,
 a-bhatia1@ti.com, drinkcat@chromium.org, daniel@ffwll.ch,
 tomi.valkeinen@ti.com, tzimmermann@suse.de, jonas@kwiboo.se,
 dianders@chromium.org, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 treding@nvidia.com, arnd@arndb.de
Subject: Re: [PATCH -next v3] drm/bridge: fix -Wunused-const-variable= warning
Date: Mon, 31 Jul 2023 11:16:46 +0200
Message-ID: <169079499955.1473821.13328071711700830688.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731021345.219588-1-wangzhu9@huawei.com>
References: <20230731021345.219588-1-wangzhu9@huawei.com>
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
Cc: Robert Foss <rfoss@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 Jul 2023 10:13:45 +0800, Zhu Wang wrote:
> When building with W=1, the following warning occurs.
> 
> drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:48:17: warning: ‘anx781x_i2c_addresses’ defined but not used [-Wunused-const-variable=]  static const u8 anx781x_i2c_addresses[] = {
>                  ^~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:40:17: warning: ‘anx7808_i2c_addresses’ defined but not used [-Wunused-const-variable=]  static const u8 anx7808_i2c_addresses[] = {
> 
> When CONFIG_IO is disabled, above two variables are not used,
> since the place where it is used is inclueded in the macro
> CONFIG_OF.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: fix -Wunused-const-variable= warning
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=132b6512e694



Rob

