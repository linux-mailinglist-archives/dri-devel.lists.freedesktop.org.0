Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5D06752EC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 12:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC60710E0EA;
	Fri, 20 Jan 2023 11:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99D110E0EA
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 11:01:42 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 72EB16008831;
 Fri, 20 Jan 2023 11:01:40 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id eLDPNgrUboXv; Fri, 20 Jan 2023 11:01:38 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id C4E06600878D;
 Fri, 20 Jan 2023 11:01:37 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1674212498;
 bh=3kHMJnBnNEz2slwBXbeYeNe7cYi7P2wxrpHtDtGqrjc=;
 h=From:To:Cc:Subject:Date;
 b=hO7SklZG3CjVTA+vN48yDBXH6PDjlcezPeOdYBsx1ur7Vl72gJhukaNsF81cjCC/x
 /7DOfwC9x6tn53Z0ZK3CPPs/m/dyFrOMU5c++DVO6TYC53j7NYicBK+0ZM+MsHKx1D
 V9ovCHHPDyNLU7abNOynqTfV/M2yEoefFbzLBMOE=
Received: from wslaptop.lan (unknown
 [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 103DE36008A;
 Fri, 20 Jan 2023 11:01:37 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: diogo.ivo@tecnico.ulisboa.pt, thierry.reding@gmail.com, airlied@redhat.com,
 daniel@ffwll.ch, jonathanh@nvidia.com
Subject: [PATCH 0/2] drm/tegra: handle implicit scanout modifiers
Date: Fri, 20 Jan 2023 10:58:56 +0000
Message-Id: <20230120105858.214440-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

This patch series adds support for correctly displaying tiled
framebuffers when no modifiers are reported by userspace.

Patch 1 adds the sector_layout parameter to the SET/GET_TILING
IOCTLs so that userspace can set this field appropriately.

Patch 2 adds handling of the case where the buffer object
passed to create a framebuffer is allocated with non-linear
tiling but no modifier is reported.

Diogo Ivo (2):
  drm/tegra: add sector layout to SET/GET_TILING IOCTLs
  drm/tegra: add scanout support for implicit tiling parameters

 drivers/gpu/drm/tegra/drm.c  | 29 ++++++++++++++++++
 drivers/gpu/drm/tegra/fb.c   | 59 ++++++++++++++++++++++++++++++++++--
 include/uapi/drm/tegra_drm.h | 16 ++++++----
 3 files changed, 96 insertions(+), 8 deletions(-)

-- 
2.39.1

