Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 487DA4FCAAB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B3010FB33;
	Tue, 12 Apr 2022 00:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF9810FB33;
 Tue, 12 Apr 2022 00:52:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD16F60C25;
 Tue, 12 Apr 2022 00:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE82C385A9;
 Tue, 12 Apr 2022 00:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724771;
 bh=btq5PtiLLaSG5Z1o+XKlEstXkapvQO9CjumUPjapG5k=;
 h=From:To:Cc:Subject:Date:From;
 b=LHUVZdbyFo9Gh4r2JXYA6w/eaOrSq7wGDl21+h2hy8cLNK/4Z9ni/FQiXgXIFLtT7
 1DdERbV6zc+33nxHPBSrsS5KltyKmnSlD27+Vig03SX4DPMYQQXb3oW0SqhqX2gJCf
 C7mfD0bhu+ZyPAWuCv3FOgBOXI5CcmnsoRKRy5cJ75UhB4XTsNXxIym8aLZZmOPXRS
 qX2GSYlStk7K5P4axUKSFZbru+CEBjstDYlyBpurYd30yt85YeJeVI9wdYvcnlsJ/0
 c5LDiKj+5F0cH3TonbGrC6RUW/Wbta5E3snZ0vIdSWe583QBamRd2ah6FSSDF+e7ty
 UJ9jbkFhRiBow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 1/7] drm/amdkfd: Check for potential null return
 of kmalloc_array()
Date: Mon, 11 Apr 2022 20:52:42 -0400
Message-Id: <20220412005248.351701-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie, Felix.Kuehling@amd.com,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 QintaoShen <unSimple1993@163.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: QintaoShen <unSimple1993@163.com>

[ Upstream commit ebbb7bb9e80305820dc2328a371c1b35679f2667 ]

As the kmalloc_array() may return null, the 'event_waiters[i].wait' would lead to null-pointer dereference.
Therefore, it is better to check the return value of kmalloc_array() to avoid this confusion.

Signed-off-by: QintaoShen <unSimple1993@163.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_events.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index 6a3470f84998..732713ff3190 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -607,6 +607,8 @@ static struct kfd_event_waiter *alloc_event_waiters(uint32_t num_events)
 	event_waiters = kmalloc_array(num_events,
 					sizeof(struct kfd_event_waiter),
 					GFP_KERNEL);
+	if (!event_waiters)
+		return NULL;
 
 	for (i = 0; (event_waiters) && (i < num_events) ; i++) {
 		INIT_LIST_HEAD(&event_waiters[i].waiters);
-- 
2.35.1

