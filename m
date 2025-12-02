Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28297C9BB7C
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 15:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFB610E644;
	Tue,  2 Dec 2025 14:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nfA4nme2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF4510E644
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 14:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tnLHwBWjpRMBHIofHo3RsFi15CzKFM3Q+NNqO1OSwRg=; b=nfA4nme2ME32QcdyckoivE9DiZ
 oPArQhhwAQOqZEqoC4PjR6Y6NOp/GOT5p8S5oX1SUwOjAyoUOWLpcTZFkZjqDBJGR+kdxu33by8xd
 pFAYIPylvKhzNjInmSTcRi0qvJegxUbw4of1Br0dkC7LE3i9TGrMgvDzfXrMeVneaBFF0KF27nsoU
 Cr1SyfL3rymq0JihmwU64CiI1ji96KfD9Z55qVc09aX8kRqxCca82q6V2GdWPVQ0ya9Pinarw7M2t
 EAIEuExwJArPbIom1l3g6tkAsetQr1ZFptl5ObfVRTqEcw1ngxFDN24Cl/DNoom/zF20U7D7FwJO/
 YOml2psQ==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vQR5H-007pdD-2d; Tue, 02 Dec 2025 15:10:27 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
 Melissa Wen <mwen@igalia.com>, linux-efi@vger.kernel.org
Subject: [PATCH 0/3] EFI fbcon fixes
Date: Tue,  2 Dec 2025 14:10:22 +0000
Message-ID: <20251202141025.723-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two generic fixes split out for easy review and then the last patch is the
panel/mode quirk to allow for corruption free fbcon with simpledrmfb and
efidrmfb on the Valve Steam Deck.

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Melissa Wen <mwen@igalia.com>
Cc: linux-efi@vger.kernel.org

Tvrtko Ursulin (3):
  efi: sysfb_efi: Replace open coded swap with the macro
  efi: sysfb_efi: Fix lfb_linelength calculation when applying quirks
  efi: sysfb_efi: Fix efidrmfb and simpledrmfb on Valve Steam Deck

 drivers/firmware/efi/sysfb_efi.c | 68 +++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 6 deletions(-)

-- 
2.51.1

