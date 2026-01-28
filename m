Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id v0wqG+2DeWnGxQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 04:35:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C2D9CBB8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 04:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1613210E1DA;
	Wed, 28 Jan 2026 03:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M2ARrs5V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A996A10E1DA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 03:35:03 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id
 d2e1a72fcca58-82311f4070cso257545b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 19:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769571303; x=1770176103; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vHsef8Eavky6gF12HHQo8VAwR8PkAm6f6g30n7mS7sU=;
 b=M2ARrs5Vso/uIq/PxKdeaiE/x8ltk1TmI0tg8whrmzB+iv0kTfanJsTO/AYkUFBhmq
 rG52LXu5xfd1wqDehgVqFKbgqQMj66EHvDtIRvFKQhFh2TTDxdWjUJ+VFIXAsi742TQW
 U4+fQWZ0Cvg3rsYougBF+NtWZzbmJR8a3j+c23ongaF47t7Q04KVA9FcZ04UZgtsI388
 Wlh/brNbrlHxH09QZW+MC8wlyF8BsaLGArrmorDk7txXu1wSyZNrIqSp974h5YSgZXFJ
 z8r5UEJNSHD4xmnCLbkjdNFTJhYwUc9jZBiDgYuhjOViVxLr42uJNebKaSZDytXdzPVy
 CT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769571303; x=1770176103;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vHsef8Eavky6gF12HHQo8VAwR8PkAm6f6g30n7mS7sU=;
 b=tlR5J8z2IcGb0EiqvrWLURrxDf85ScCy6qOf0WM+pCJqUotc3lgYgXm0e3nQKkaRRT
 vlLTo5mVkgkLhJJRvyVUaNr3u/ZontyTj5ADsZIcWrlY+OJpeNDgLEHizJNtDHqi+1ev
 qQfNRmnchCMRex6kpuJofecYuRCgDB0Qw6Dme5p38kcOSIgcohFEbznJKYl9qM37XBKu
 jGYiOdYzQGmcqJ+SLpxGTopfNGeIBviqwB8WblzD6Bpu6NOjFF3rIRCEluWROj4D0V6o
 Zg6wceNzqorna2zR3MbYkauYE5et2DseIMdQ8K+1SzyuLb7FPC8jBJ1r1ucdDHK0QTHE
 yFTg==
X-Gm-Message-State: AOJu0YyC2A647jO/1gJeJu/oBhP8fa7Rw1mJ0qxQQylSKXdROzRAZJ73
 r5mY8I6gnWaY/RInAEbGCeOXq0TgrOFqgB6GwhpmiNLepKbP7mPXy5IV
X-Gm-Gg: AZuq6aKrFUuGwop8Mkm1BK1b6kiuSGEA28jOrLUeWCWoiiv4QB1sJ96mJ9XltcxCy7L
 ulK+cLN97DjzN2ogPSuu5WM6p+aq37T2S5yar6V5cJa7kBAmfjh8X775Ffx+ezxfQLgmGDshYwI
 yvkfX105Ww6APIfiPUJg8gvy0Cy9qPUjYxxdwlpZo57ec1O2eL3s8B9VW/hlGy0l0EkTLeK5XTD
 bNa4fY+CI3lXN9lU/Mwkw2/CRSp4UfRzrRVtbg74kS6RSlMWduE5rM/e1t4/uOAYLpuWsE6rYDw
 ctkOUx2bXaobb/rqxjtE67YjAdte6gEe5XC657lmc3kfhYvEdBSjNbKQZJeD6eUMtnrdkjLwMHi
 SueKbGBB+PZV69r1EmZictaVWe2O4VMizAa8iIrA6lH7D7o4860fnJliO898UDZKARe6wkIm6Ln
 QUdNz40UZCsPyWS1s5RMiPbhs5QPLKhBg=
X-Received: by 2002:a05:6a00:886:b0:81f:535f:b48a with SMTP id
 d2e1a72fcca58-8236a14b4a7mr3625497b3a.7.1769571302990; 
 Tue, 27 Jan 2026 19:35:02 -0800 (PST)
Received: from localhost.localdomain ([1.203.169.108])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379c226afsm948671b3a.49.2026.01.27.19.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 19:35:02 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
Subject: [PATCH v6] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Date: Wed, 28 Jan 2026 11:34:54 +0800
Message-Id: <20260128033454.2614886-1-xjdeng@buaa.edu.cn>
X-Mailer: git-send-email 2.25.1
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xjdeng@buaa.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[micro6947@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,buaa.edu.cn:mid,buaa.edu.cn:email]
X-Rspamd-Queue-Id: A5C2D9CBB8
X-Rspamd-Action: no action

In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
reserved memory to the configured VMIDs, but its return value was not checked.

Fail the probe if the SCM call fails to avoid continuing with an
unexpected/incorrect memory permission configuration.

This issue was detected by a private static analysis tool.
No actual hardware testing was performed as the issue is purely
code-level and verified via static analysis.

Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
Cc: stable@vger.kernel.org # 6.11-rc1
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
---
v6:
- Add description of the detection tool.
- Link to v5: https://lore.kernel.org/linux-arm-msm/20260117140351.875511-1-xjdeng@buaa.edu.cn/T/#u

v5:
- Squash the functional change and indentation fix into a single patch.
- Link to v4: https://lore.kernel.org/linux-arm-msm/2026011637-statute-showy-2c3f@gregkh/T/#t

v4:
- Format the indentation
- Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t

v3:
- Add missing linux-kernel@vger.kernel.org to cc list.
- Standarlize changelog placement/format.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t

v2:
- Add Fixes: and Cc: stable tags.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xjdeng@buaa.edu.cn/T/#u
---
 drivers/misc/fastrpc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..8bac2216cb20 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2337,8 +2337,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		if (!err) {
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
+			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
 				    data->vmperms, data->vmcount);
+			if (err) {
+				goto err_free_data;
+			}
 		}
 
 	}
-- 
2.25.1

