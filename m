Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E032D583EE1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 14:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7135B99D89;
	Thu, 28 Jul 2022 12:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA5799D75;
 Thu, 28 Jul 2022 12:30:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E529CB82445;
 Thu, 28 Jul 2022 12:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3E6C4347C;
 Thu, 28 Jul 2022 12:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659011406;
 bh=SsLKQKAJDVdmsjFvuEvNTnovowDQ9E5EcEd8pA4PGds=;
 h=From:To:Cc:Subject:Date:From;
 b=mloeqN3p2gVVuWZfpt5whWnuCmI19/IGx+lB3YAP9QC2uQ9mKtcWA5MmRci4SBSnN
 A3242ZO939pfOZe9CPGwbXZCHdqcNCuV/SZ1+S+qsuX/jaSRFn6EsOUSfpb+LmQ+qX
 2l5TZNOMRRqcvej1lT+UsIv1SRxCIDExrXx4+Q768jnUGg8aWA3zeCDxS2vagMcKUn
 Xywkd6UGWYKC3d2ACZqwNF5QAGE+jskhS3rzxHFhk/RCOqVqWR0GBXLrOxzM68XUnw
 F9qmxPYJm02Eg34hB/Suee44VQfh9aowrLaeoUPi4AKcE+dW9406ggSPzTA0NG+dRk
 +Nm/Yx0iVAleg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oH2eS-005W6T-95;
 Thu, 28 Jul 2022 14:30:04 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 0/2] Move TLB invalidation code for its own file and document
 it
Date: Thu, 28 Jul 2022 14:30:01 +0200
Message-Id: <cover.1659011328.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are more things to be added to TLB invalidation. Before doing that,
move the code to its own file, and add the relevant documentation.

Chris Wilson (1):
  drm/i915/gt: Move TLB invalidation to its own file

Mauro Carvalho Chehab (1):
  drm/i915/gt: document TLB cache invalidation functions

 drivers/gpu/drm/i915/Makefile             |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c        | 168 +----------------
 drivers/gpu/drm/i915/gt/intel_gt.h        |  12 --
 drivers/gpu/drm/i915/gt/intel_tlb.c       | 208 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_tlb.h       | 112 ++++++++++++
 drivers/gpu/drm/i915/i915_vma.c           |   1 +
 7 files changed, 327 insertions(+), 179 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.h

-- 
2.36.1


