Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC5F6C558E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 20:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F14D10EA0E;
	Wed, 22 Mar 2023 19:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6823010E9E0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 19:59:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 14A3ACE1D2D;
 Wed, 22 Mar 2023 19:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4F7C433EF;
 Wed, 22 Mar 2023 19:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679515156;
 bh=c9WRQrQ9Zh03YecmPXROf8+OeeoJCsLrKKMhLWr98vM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H+3KF5Djx5JsD28Fwb72Zyj4OXKie+aODpqLsja0qaxFa7IbOK6wx2TU0V5CVoYh+
 yV434mJG1UB7KZtFGxkcWuOel11+olUhleZqaWceaiNAxNHBMlEusQrpT2JUpIB5Be
 7+VNMG4sANPjVbeRbXdhcyjoo8qNl7Er59rZoq58HduNN71I3hSIuAB0RPyB92uc9Y
 AL0Q0oaojyl1qkfTjUxIcTeXXfzG+pHxdmWYdrtBUl11KnnsxKNSWrgS5PtBK1Yv54
 U7ezouhX5oYvSku/sNs66OED33b7xTddjNDIGwXEMFK2LJ+xOa8EtpwQuhFZ0ntERK
 6uwVDto/k4qLA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 39/45] fbdev: nvidia: Fix potential divide by zero
Date: Wed, 22 Mar 2023 15:56:33 -0400
Message-Id: <20230322195639.1995821-39-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195639.1995821-1-sashal@kernel.org>
References: <20230322195639.1995821-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 adaplas@gmail.com, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, Wei Chen <harperchen1110@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wei Chen <harperchen1110@gmail.com>

[ Upstream commit 92e2a00f2987483e1f9253625828622edd442e61 ]

variable var->pixclock can be set by user. In case it
equals to zero, divide by zero would occur in nvidiafb_set_par.

Similar crashes have happened in other fbdev drivers. There
is no check and modification on var->pixclock along the call
chain to nvidia_check_var and nvidiafb_set_par. We believe it
could also be triggered in driver nvidia from user site.

Signed-off-by: Wei Chen <harperchen1110@gmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/nvidia/nvidia.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index e60a276b4855d..ea4ba3dfb96bb 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -764,6 +764,8 @@ static int nvidiafb_check_var(struct fb_var_screeninfo *var,
 	int pitch, err = 0;
 
 	NVTRACE_ENTER();
+	if (!var->pixclock)
+		return -EINVAL;
 
 	var->transp.offset = 0;
 	var->transp.length = 0;
-- 
2.39.2

