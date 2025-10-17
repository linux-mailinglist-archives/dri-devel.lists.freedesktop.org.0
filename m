Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B008BEB36D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 20:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C5F10ECCD;
	Fri, 17 Oct 2025 18:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="Qj+FF1UI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BACC10ECC5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 18:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7917982890D1;
 Fri, 17 Oct 2025 13:17:20 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id FcD0k_DUdE2r; Fri, 17 Oct 2025 13:17:18 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 55845828916C;
 Fri, 17 Oct 2025 13:17:18 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 55845828916C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1760725038; bh=se5pumbE7LfZQm71qX4ZoJSvxothcAr5G9BqzJGj0bw=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=Qj+FF1UIWjj0F0pXJoNmCl4RlMyCGJfPOPJni4ce4PzDG1mCY85B75fAC1uYatXeH
 N1n/CKM/TmTv+7OvffeItUumNJWvQQMYhYjtc+eTy8v9ugreujSVG9z/aR1NY7DIKd
 QWr0sb9/uC0n0Xjk5/OA8Dtwnnziue9AaCGIHfeU=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BQ_nKUrx8PIy; Fri, 17 Oct 2025 13:17:16 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 12A5082890D1;
 Fri, 17 Oct 2025 13:17:16 -0500 (CDT)
Date: Fri, 17 Oct 2025 13:17:15 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <407388289.1798972.1760725035958.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 0/2] Fix AST2500 graphics on ppc64 systems in big-endian mode
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Index: LUG2F4YDIH+Na1U3fGLanAwWnSRh1g==
Thread-Topic: Fix AST2500 graphics on ppc64 systems in big-endian mode
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

On ppc64 systems that use the AST2500 graphics device, such as the Blackbird
POWER9 system, the red and blue channels are inverted when the host is running
in big endian mode.  This is due to a ppc64 hardware quirk, which when combined
with a hardware design fault in the AST2500 VGA controller results in a need
to use software-based red-blue channel swapping.

Tested to fix color graphics on Debian sid/ppc64 on a Blackbird system.

Timothy Pearson (2):
  PCI: Add CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP
  drm/ast: Fix framebuffer color swapping on ppc64 systems

 arch/powerpc/Kconfig           |  1 +
 drivers/gpu/drm/ast/ast_mode.c | 33 +++++++++++++++++++++++++++++++--
 drivers/pci/Kconfig            |  4 ++++
 3 files changed, 36 insertions(+), 2 deletions(-)

-- 
2.51.0
