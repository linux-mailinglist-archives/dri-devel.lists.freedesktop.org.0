Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7117C8CC5D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 04:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F33610E6A4;
	Thu, 27 Nov 2025 03:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="hH6BkMUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FD510E6A4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 03:50:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764215431; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CA3CYlIgnnaml4ri0fF5D48gstpQjWPHnTzl7mgPh3p917sX7aR670evd9AUawT/HoMU0/Fc8CTKAaNSjJSER3t6TBf+JROrknvqZc9ZIDGKEgPAHKP8kNBX9AIZimK397GsCJ63nok2WfjKaEqAuZIfroix++Q6v9eaC0Ck+zI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764215431;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=KE8ziJ8pQkKZVscnMcmu0P6EtgRGkMUzwrL1Yq56MTc=; 
 b=Eq/6SHhDOkTMw6BEhB1f72iA+dkmIGEzIRv/Pu6/TtX11Vnwp13VpjhchfWUkfEoaU8rvAky7rgNW0uMn4jP0VyyQeHRPxbBIUllLdTyNZYpAR6nS6s2+jrqHLuuF0eoSeu1I7pjNm6sPtqdRY3gnMYxzU/K90y9BxBvRUsuBCE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764215431; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=KE8ziJ8pQkKZVscnMcmu0P6EtgRGkMUzwrL1Yq56MTc=;
 b=hH6BkMUS1YaWk+iympSCer6ksoYF6X0nAkxMmMuvzGxPpByB4v7NsIJWwVXEpeYD
 ay5ttgHUs3JCluuhSjgp9nYnf8wVnVv7hFKVCZ0W33Dvyd3HQqicNTIk6tvTiN0qma3
 klZ56XGZRJFY+UfrT3UIAbcpF+lXf/dA3eyFEAPE=
Received: by mx.zohomail.com with SMTPS id 1764215430644656.620929946732;
 Wed, 26 Nov 2025 19:50:30 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v2 0/1] Workaround for partial huge page unmaps in Panthor
Date: Thu, 27 Nov 2025 03:50:12 +0000
Message-ID: <20251127035021.624045-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This is v2 of [1]. This patch is a workaround for performing partial unmaps of a VM region backed
by huge pages. Since these are now disallowed, the patch makes sure unmaps are done on a backing
page-granularity, and then regions untouched by the VM_BIND unmap operation are restored.

A patch series with IGT tests to validate this functionality is found at [2].

Changelog:

v2:
 - Fixed bug caused by confusion between semantics of gpu_va prev and next ops boundaries
   and those of the original vma object.
 - Coalesce all unmap operations into a single one.
 - Refactored and simplified code.

[1] https://lore.kernel.org/dri-devel/20251019032108.3498086-1-adrian.larumbe@collabora.com/
[2] https://lore.kernel.org/igt-dev/20251127030145.585641-1-adrian.larumbe@collabora.com/T/#t

Adrián Larumbe (1):
  drm/panthor: Support partial unmaps of huge pages

 drivers/gpu/drm/panthor/panthor_mmu.c | 76 +++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

--
2.51.2
