Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A715A060D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047ABD0B49;
	Thu, 25 Aug 2022 01:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C05D0AA5;
 Thu, 25 Aug 2022 01:36:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D16B61AEC;
 Thu, 25 Aug 2022 01:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2867C433D6;
 Thu, 25 Aug 2022 01:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391415;
 bh=OreuVOelWEiAtnvgz8Q7FE6KLbGx4aafDaOQSjn4xB4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EFSH9JXQJIuZsKpDdfqFaCkinr7cSBi/LQKRmMIjg260LaYeWIQpUC+djKMpbghMx
 /VEq1KQfJI9I3Ph+aF8AUWs7LTb+PW0q8sT/mWaQm0HBvXNH742hEa+QrnWooY4z/O
 JPMO8QxuHxMtlJSQ/0pywCELF1U6PL7DOgiVjTGvm56FubgoKp1QS0sr0jSGIVrT5e
 T7hKRBJ60TAO+TbkUxjuCBICabfD9UkUEGG3HoQRdo3w2G5GWaD6ZvPczQ87eVjoGz
 Jnn0Oz0SIFnhooEPSLG1XkUmny7GsTGsaw9/NbUdjahEs9JCiBIq8sNdsSvREKJJdy
 AxWnYfEC58EAA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 30/38] drm/amdgpu: Fix interrupt handling on
 ih_soft ring
Date: Wed, 24 Aug 2022 21:33:53 -0400
Message-Id: <20220825013401.22096-30-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013401.22096-1-sashal@kernel.org>
References: <20220825013401.22096-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, Mukul Joshi <mukul.joshi@amd.com>,
 dri-devel@lists.freedesktop.org, Philip.Yang@amd.com, airlied@linux.ie,
 Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 chi.minghao@zte.com.cn, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mukul Joshi <mukul.joshi@amd.com>

[ Upstream commit de8341ee3ce7316883e836a2c4e9bf01ab651e0f ]

There are no backing hardware registers for ih_soft ring.
As a result, don't try to access hardware registers for read
and write pointers when processing interrupts on the IH soft
ring.

Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c | 7 ++++++-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c | 7 ++++++-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c | 7 ++++++-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index 4b5396d3e60f..eec13cb5bf75 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -409,9 +409,11 @@ static u32 navi10_ih_get_wptr(struct amdgpu_device *adev,
 	u32 wptr, tmp;
 	struct amdgpu_ih_regs *ih_regs;
 
-	if (ih == &adev->irq.ih) {
+	if (ih == &adev->irq.ih || ih == &adev->irq.ih_soft) {
 		/* Only ring0 supports writeback. On other rings fall back
 		 * to register-based code with overflow checking below.
+		 * ih_soft ring doesn't have any backing hardware registers,
+		 * update wptr and return.
 		 */
 		wptr = le32_to_cpu(*ih->wptr_cpu);
 
@@ -483,6 +485,9 @@ static void navi10_ih_set_rptr(struct amdgpu_device *adev,
 {
 	struct amdgpu_ih_regs *ih_regs;
 
+	if (ih == &adev->irq.ih_soft)
+		return;
+
 	if (ih->use_doorbell) {
 		/* XXX check if swapping is necessary on BE */
 		*ih->rptr_cpu = ih->rptr;
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index cdd599a08125..03b7066471f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -334,9 +334,11 @@ static u32 vega10_ih_get_wptr(struct amdgpu_device *adev,
 	u32 wptr, tmp;
 	struct amdgpu_ih_regs *ih_regs;
 
-	if (ih == &adev->irq.ih) {
+	if (ih == &adev->irq.ih || ih == &adev->irq.ih_soft) {
 		/* Only ring0 supports writeback. On other rings fall back
 		 * to register-based code with overflow checking below.
+		 * ih_soft ring doesn't have any backing hardware registers,
+		 * update wptr and return.
 		 */
 		wptr = le32_to_cpu(*ih->wptr_cpu);
 
@@ -409,6 +411,9 @@ static void vega10_ih_set_rptr(struct amdgpu_device *adev,
 {
 	struct amdgpu_ih_regs *ih_regs;
 
+	if (ih == &adev->irq.ih_soft)
+		return;
+
 	if (ih->use_doorbell) {
 		/* XXX check if swapping is necessary on BE */
 		*ih->rptr_cpu = ih->rptr;
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
index 3b4eb8285943..2022ffbb8dba 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
@@ -385,9 +385,11 @@ static u32 vega20_ih_get_wptr(struct amdgpu_device *adev,
 	u32 wptr, tmp;
 	struct amdgpu_ih_regs *ih_regs;
 
-	if (ih == &adev->irq.ih) {
+	if (ih == &adev->irq.ih || ih == &adev->irq.ih_soft) {
 		/* Only ring0 supports writeback. On other rings fall back
 		 * to register-based code with overflow checking below.
+		 * ih_soft ring doesn't have any backing hardware registers,
+		 * update wptr and return.
 		 */
 		wptr = le32_to_cpu(*ih->wptr_cpu);
 
@@ -461,6 +463,9 @@ static void vega20_ih_set_rptr(struct amdgpu_device *adev,
 {
 	struct amdgpu_ih_regs *ih_regs;
 
+	if (ih == &adev->irq.ih_soft)
+		return;
+
 	if (ih->use_doorbell) {
 		/* XXX check if swapping is necessary on BE */
 		*ih->rptr_cpu = ih->rptr;
-- 
2.35.1

