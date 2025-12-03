Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60977C9E65B
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 10:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392C310E0F3;
	Wed,  3 Dec 2025 09:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ldaT57Rc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4785E10E025
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 09:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vs5lt6mdnpNHHugizVfBqfWtqo6gOtmBDJ0kNaBstCQ=; b=ldaT57RcjgMogfekPj2VPTkYen
 ei0yzwsg83UPWA72hk/nByOXIxF88SUApT5CoP6GqUpt8JfMeUIRH/UIG0XndFmI7OY0BVwhsLGl6
 3j+04jQxa6a55JUniNiMP884Xr+/2DOXrM1Xq0bjoHvDWV4+hHszzebXHEUaq37C/+TGctYcp/+pt
 BpJ2X/be4NUsO6aXHXoWVht95gaPmPWlyUPwKwbCLlcdA8gBXDGtuf2adaHNX05KYAOndhioeqvHs
 odqz87H0sVMdLYO+Bxxbbcp6qlpfsIOf5mOnndox4Oa0Fq2B+BPrsV1mD3ygynDX0aoUTLu2dG+ON
 qZsxAs5g==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vQipJ-008BpL-41; Wed, 03 Dec 2025 10:07:09 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
 Melissa Wen <mwen@igalia.com>, linux-efi@vger.kernel.org
Subject: [PATCH v2 0/4] EFI fbcon fixes
Date: Wed,  3 Dec 2025 09:07:02 +0000
Message-ID: <20251203090706.53778-1-tvrtko.ursulin@igalia.com>
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

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Melissa Wen <mwen@igalia.com>
Cc: linux-efi@vger.kernel.org

Tvrtko Ursulin (4):
  efi: sysfb_efi: Replace open coded swap with the macro
  efi: sysfb_efi: Fix lfb_linelength calculation when applying quirks
  efi: sysfb_efi: Convert swap width and height quirk to a callback
  efi: sysfb_efi: Fix efidrmfb and simpledrmfb on Valve Steam Deck

 drivers/firmware/efi/sysfb_efi.c | 71 ++++++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 8 deletions(-)

-- 
2.51.1

