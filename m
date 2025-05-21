Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBD7ABED0E
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 09:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7653010E118;
	Wed, 21 May 2025 07:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TqtXNqi3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A694910E118
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 07:30:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E3514A4D938;
 Wed, 21 May 2025 07:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129F6C4CEE4;
 Wed, 21 May 2025 07:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747812613;
 bh=kHoF45hUCogyr1b9AyVQsB5qBGzunVeolUQxgQ54lzg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TqtXNqi3Vltcn7eXM2pjk8DV8x/Cp+dDz507Gul9YXLQ2p3DvcJnJ+nMdUBia53F6
 FOiZLki3BNQK8XkwXbxSX9sf+RewnU2jDCtAHvCeh5ZBZT3dkxdtUgvOcysqD1ExhX
 RhPuJCV3bb6en2HvCBSWiwoiMLdQQ8ck058/8UO/M8SrwlioXFOmBMnHeGaiCx3NMX
 JYBOyCSwOG+89ofFfbgm5yuNbhBcVrCAmZo3Zc/90xjUPOWaBDsOlNNnoYq3W3F5ZF
 WZd29o9gFzDO/QUc2oHfGuh2Ezh7P3oDa3LBi1/j/SlRxfIlE6HxyNHpbfFkoiMTmT
 vozD39dnSmcWg==
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Icenowy Zheng <icenowy@aosc.io>,
 Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jianhua Lu <lujianhua000@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/30] drm/panel: Use refcounted allocation in place of
 devm_kzalloc() - Part2
Date: Wed, 21 May 2025 09:30:07 +0200
Message-ID: <174781258973.998238.825385797307727839.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
References: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
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

On Tue, 20 May 2025 22:03:31 -0500, Anusha Srivatsa wrote:
> Convert drivers to use the API - devm_drm_panel_alloc().
> There are a lot of occurences of the panel allocation across the
> subsystem. Much thanks to Maxime for the semanic patch which actually
> gives a list of panels allocated unsafely.
> 
> virtual report
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
