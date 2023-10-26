Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA677D817D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 13:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFA010E7A9;
	Thu, 26 Oct 2023 11:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D4810E7B5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 11:05:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C121E633A4;
 Thu, 26 Oct 2023 11:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18376C433C8;
 Thu, 26 Oct 2023 11:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698318304;
 bh=1AD9agjYpd8OvUohYh/6X8SL6ZZpBCz9uB6xuzCjIds=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jodjXgF43KLgPXQmvc1mDGUFqL1zJErlwmbTyalJEZ9UzHfTQ7iL+LdwVp9KShRMH
 M4rzM0xNMvW02MoFG4Dr2uqmMKbITrOR20xKtOjN0vFksr4j69l4ZBXtaYMA3IM9fi
 gcxBCoTXCDvc3cYSk21cmBLGuvrJ4bxeqtCF/Ph6Kt89VXaY1R6olaLyxU5g0p5OyZ
 D/0iVzecBdVX1dZNRSAlilLGHFr+RMQJxPxsD0B9NW5XJqnvcDwbXtVd4g8BIKUkfU
 9dKtWsjHnVz2G9Ak7eoXPRjOJolVxsP/cAa4VjNTXEOT1FlNr9Zki3PbxySb2bp/em
 TgdaRMvrSl1mQ==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20231024105640.352752-1-mripard@kernel.org>
References: <20231024105640.352752-1-mripard@kernel.org>
Subject: Re: (subset) [PATCH] drm/vc4: tests: Fix UAF in the mock helpers
Message-Id: <169831830190.916675.6817840646975316165.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 13:05:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 dri-devel@lists.freedesktop.org, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Oct 2023 12:56:40 +0200, Maxime Ripard wrote:
> The VC4 mock helpers allocate the CRTC, encoders and connectors using a
> call to kunit_kzalloc(), but the DRM device they are attache to survives
> for longer than the test itself which leads to use-after-frees reported
> by KASAN.
> 
> Switch to drmm_kzalloc to tie the lifetime of these objects to the main
> DRM device.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime

