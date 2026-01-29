Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKKgAyvve2keJgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 00:37:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691BCB5B83
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 00:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AE010E0F0;
	Thu, 29 Jan 2026 23:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SBHrXKGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F2910E0F0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 23:37:10 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id
 d2e1a72fcca58-81f39438187so807116b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 15:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769729830; x=1770334630; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HFIOgnH6m/Tp8biSOxBgIzwBRfAedBPa4QLS4k9B36A=;
 b=SBHrXKGknwwTbzgxmw5QGZH83jaMd7NQSWBTUQivoxGI0Ma7CygvGevOOKViUNaZ4+
 o8AwGeZbb8j3DFeyxUSaRW8l36KVeiVefAw2Y7G3a+FtKpzPhzrVa429RBbarjE7Ev04
 ChyJZEio2fH57vFTDAQvY+fdJIugd84wJE1Ja2SN1lrxZtVkahaQInAyM02Y3cEXore4
 +LQZjicS3uxOHixk5oZfnraoMWxQ61Q7vx5FWY1PN+cRdvvXtSKiFJ4TOX9EBIyEFfIs
 9uoEBOB+qkvxMj3YR09yQy3JTsYG+dLpff6pyeUO17cqG2UEfSmtw9SwFihH6jS9z6je
 oEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769729830; x=1770334630;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HFIOgnH6m/Tp8biSOxBgIzwBRfAedBPa4QLS4k9B36A=;
 b=eWaOBco71Ti4wzGbqqGKA25YDwAmpiGhKumKJXcDD5JKWoSGbKywG32QJQ+yE1NotT
 ZjEX/AR6kulxNeSoa19LIH4Y+U7aYH41xCPosB91+Hzgr754XWHNPDWWWDCRKikZIGMI
 v+m0PyxUps6MhZ+pcA1lrQL8tAmUo4mbdr1hM8AIZapHDCQbhA2u5/c3oOHONhaifyyp
 bJLT56UgGWv9/90lyIAGtDB3uHU8unIGawSsZzI0vEBk3WZzv/jzyaaQktudP1jXfXhJ
 gYGA3PGr3FjSySf7YBXVF996E0XpqU7VFoSaHdrVXt0xb6ZB9HYDmKeyqaxDq712KHQ3
 yw6g==
X-Gm-Message-State: AOJu0YwnIJoOgRAqb84cX6hxEmZRcS9pRb63N9RGW2iWmmKxXYrg3gQH
 xPKtuOVYCuVwKeHHn/G3ZNG5Sukk4AjpHlwvFzv8ZyKcNXQhQwaSLX58
X-Gm-Gg: AZuq6aInqJg78YRUq2VR1lhCKYSiIiYMErThhfGcg9S8OkiJmToPQX9Kjviuj7+cbli
 ETZlKI05QX3Rn02tj2uHlicD8wma3on7dVnz9HroZ8b2LjuYrV3z+kMXbJlhmjCfDg5yK4MDJ/G
 snhea+lUmtIw5c0kVky0OAKumlPL67e6vSPQWRlBKqaMrjyBS+KlkdpQHr78rHDfQIqGUHdWwhl
 EpFeaCV8wpOu2Y9eEz2ugvKnPCbx7NWNWt9HsAZvEhXpT2fcbnHltAsTJzAjE3Wp+4z573DS7Il
 qSjM52/EfcJeSFJwcZ8m7kl+J5xjcgq5rX+ijaSnjDWlDBt4HDyEBtr6uW78wZtRgu+UzMG3BFm
 u9UaB70QD1v/ew+xx1y4/ZbQ9ACtoQQbPEY0DJ7z//y7Yni60iWtwbLdFNS9sFJmGlgeP6g0MmH
 E4QcIHFNSHp3HwLgr2wcPF
X-Received: by 2002:a05:6a00:8d87:b0:81f:4346:6870 with SMTP id
 d2e1a72fcca58-823ab695dd1mr915423b3a.28.1769729830385; 
 Thu, 29 Jan 2026 15:37:10 -0800 (PST)
Received: from localhost.localdomain ([1.203.169.108])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379c5293dsm6256794b3a.61.2026.01.29.15.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 15:37:09 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
Subject: [PATCH v7] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Date: Fri, 30 Jan 2026 07:37:03 +0800
Message-Id: <20260129233703.407404-1-xjdeng@buaa.edu.cn>
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
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 691BCB5B83
X-Rspamd-Action: no action

In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
reserved memory to the configured VMIDs, but its return value was not checked.

Fail the probe if the SCM call fails to avoid continuing with an
unexpected/incorrect memory permission configuration.

This issue was found by an in-house analysis workflow that extracts AST-based
information and runs static checks, with LLM assistance for triage, and was
confirmed by manual code review.
No hardware testing was performed.

Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
Cc: stable@vger.kernel.org # 6.11-rc1
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
---
v7:
- Add the detail description of how the tool detect.
- Link to v6: https://lore.kernel.org/linux-arm-msm/20260128033454.2614886-1-xjdeng@buaa.edu.cn/

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

