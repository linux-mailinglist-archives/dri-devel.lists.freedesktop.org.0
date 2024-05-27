Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5FD8D0529
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870D910E2D0;
	Mon, 27 May 2024 15:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="b3UkZcLJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80CB10E838
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 15:02:36 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716822151; bh=ZcfMiJyaPvcvjXhfFV/nyPzUmJd+dTs0K+agxcaJbBY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b3UkZcLJW39/vkf1VZmonAUe6ysAQe8LFeZXSyI409Iv/rfGPy4xxazxDo3Bj7lCh
 9qCJrvA+vLI3JqZ6jK5pUU8IPwfTy/Z5OoVq6iyBV8OoctwMrhT8jsBIPid4sWWdpc
 eDHClNSyqwuvcLi5RwH1Nqm9YTBUVFayc+6drxR74Ro+luToqO6e/6RWuLSQIJfMgt
 0Djm2tVmxa6SLtPJpDua3W1tGhoYoOBdM4AzWmteb/TxZl6Uq5JPhadyaQiHw5ZaIq
 qlWgZ46xfvYMpGir+aDJ+7FsmqtStezwIW5pLc4qQ/M+BXKNCToSe8Hx9GFolwHzNJ
 wQc1YKlz1uyhA==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RF2PiT1954007; Mon, 27 May 2024 18:02:25 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH 2/8] accel/habanalabs: use device-name directory in
 debugfs-driver-habanalabs
Date: Mon, 27 May 2024 18:02:18 +0300
Message-Id: <20240527150224.1953969-2-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527150224.1953969-1-obitton@habana.ai>
References: <20240527150224.1953969-1-obitton@habana.ai>
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

From: Tomer Tayar <ttayar@habana.ai>

The device debugfs directory was modified to be named as the parent
device name.
Update the description of 'mmu' and 'mmu_error' to use the new path.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 Documentation/ABI/testing/debugfs-driver-habanalabs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/debugfs-driver-habanalabs b/Documentation/ABI/testing/debugfs-driver-habanalabs
index efbb78bedb8b..3318a14f35b9 100644
--- a/Documentation/ABI/testing/debugfs-driver-habanalabs
+++ b/Documentation/ABI/testing/debugfs-driver-habanalabs
@@ -217,7 +217,7 @@ Description:    Displays the hop values and physical address for a given ASID
                 and virtual address. The user should write the ASID and VA into
                 the file and then read the file to get the result.
                 e.g. to display info about VA 0x1000 for ASID 1 you need to do:
-                echo "1 0x1000" > /sys/kernel/debug/accel/0/mmu
+                echo "1 0x1000" > /sys/kernel/debug/accel/<parent_device>/mmu
 
 What:           /sys/kernel/debug/accel/<parent_device>/mmu_error
 Date:           Mar 2021
@@ -226,8 +226,8 @@ Contact:        fkassabri@habana.ai
 Description:    Check and display page fault or access violation mmu errors for
                 all MMUs specified in mmu_cap_mask.
                 e.g. to display error info for MMU hw cap bit 9, you need to do:
-                echo "0x200" > /sys/kernel/debug/accel/0/mmu_error
-                cat /sys/kernel/debug/accel/0/mmu_error
+                echo "0x200" > /sys/kernel/debug/accel/<parent_device>/mmu_error
+                cat /sys/kernel/debug/accel/<parent_device>/mmu_error
 
 What:           /sys/kernel/debug/accel/<parent_device>/monitor_dump
 Date:           Mar 2022
-- 
2.34.1

