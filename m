Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4230DCA836F
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 16:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F5310E067;
	Fri,  5 Dec 2025 15:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="sLFLqbxY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2754910E067
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 15:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=22l+Dg8j6XiKyT5suXswaF1GbfAE3ZV72sOuJQFEWPM=; b=sLFLqbxYJCUqdiju8ivV2bAqNM
 ESH/OhVXJ/HDg2BJsW38/08ku9Hq9N3ZiwcNTr82oCBSVpseBvSA9rDeQRNFLcVmQqhCkS205mKCl
 kv9Qv+IVvPvASDhTITmYzK1YwX4bQsWSdDH+eC4I7bbZud++HsCl52v9ehkgRF5lLwmcNK9kVTqcd
 GI33Ww/q/g5f6biQ2IqlI7F5yt8yKmYXS8ksfbcj6pInFOEDT0cyee9DQe55pinMNVOmaqKDcCp2J
 SBTRi0Rp2YD69BOM40QZxxZcUoPouDX3NVtH9ppZVcZr9jkjxzQxU8zZtqOLzWD8mo32mnD+BuY+O
 35uQrz7A==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vRXqy-009808-29; Fri, 05 Dec 2025 16:36:16 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
 Melissa Wen <mwen@igalia.com>, linux-efi@vger.kernel.org
Subject: [PATCH v4 0/4] EFI fbcon fixes etc
Date: Fri,  5 Dec 2025 15:36:07 +0000
Message-ID: <20251205153611.93297-1-tvrtko.ursulin@igalia.com>
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

Two generic fixes split out for easy review, one refactoring as requested, and
then the last patch is the panel/mode quirk to allow for corruption free fbcon
with simpledrmfb and efidrmfb on the Valve Steam Deck.

v2:
 * s/unsigned/unsigned int/
 * s/pitch/linelength/
 * Removed comment explaining the Steam Deck quirk.
 * Added patch to refactor quirk application via callbacks.

v3:
 * Added forgotten __initconst.
 * Use separate callback for the fixup quirk.

v4:
 * Use __screen_info_lfb_bits_per_pixel() instead of accessing lfb_depth directly.

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Melissa Wen <mwen@igalia.com>
Cc: linux-efi@vger.kernel.org

Tvrtko Ursulin (4):
  efi: sysfb_efi: Replace open coded swap with the macro
  efi: sysfb_efi: Fix lfb_linelength calculation when applying quirks
  efi: sysfb_efi: Convert swap width and height quirk to a callback
  efi: sysfb_efi: Fix efidrmfb and simpledrmfb on Valve Steam Deck

 drivers/firmware/efi/sysfb_efi.c | 73 ++++++++++++++++++++++++++++----
 1 file changed, 65 insertions(+), 8 deletions(-)

-- 
2.51.1

