Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAD+MnynfWk0TAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 07:55:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CC1C103C
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 07:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9B310E050;
	Sat, 31 Jan 2026 06:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kh7HETtL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58BE10E050
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 06:55:50 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id
 d9443c01a7336-2a12ebe4b74so31309765ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 22:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769842550; x=1770447350; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KDLJXl3kO9WYLHYaAYOE8EZpw5zllMbrwjKTsjUtSuU=;
 b=kh7HETtL65bvyYeFIYONLtbza3YObWVsVPij+IOtvtbaSXvUfaL+P5nUKl1xvSCi8i
 tPPslirpYR+tB7HjmnT46gbgps7rMgoryJEDsJiAvjpSVoc+URDjn5DKzV/r3sphC0DH
 as9NSOhXt0HSry1NR2OPrnh2r2pXM2/dNvA8wveuldFG52OjnW7Wiku9sDLTIn7HGf9q
 4nFERktsfGh8u9YLh2nYMJ91MR5UsXjdVgZYh9aIdWo3uV1Ew1eGEHVGEub9nJTH3qgC
 b74HKeFiLfY6PNZezsezAp0OXhPmN29i3+YytnysjmJhaZa2R3MmRGwGq2dGP+jx0ojt
 kpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769842550; x=1770447350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KDLJXl3kO9WYLHYaAYOE8EZpw5zllMbrwjKTsjUtSuU=;
 b=SradhxxGrqGt/Je3zuBBbMSlwX890YsXcArXpQseZp8k9Igsh2jPmuTDIwWDrz/yu5
 WEqy74hGOFYNj2tIHgDVCg77LQghgP1VCJeW0U3Si/E6rkcUPnsn2452C/KtmVOmnwfI
 +7yk9/zgeE190aK6FVev4P5BOQwK+Au6NO1Nq2Tc/zS41iyKoGc5AdVqnnZmHhZeQOwn
 DjUGjzbbs2GnO2wE3C6+kDrwndqo5Z3g6tdxcboGJilOfuOX6kyEqOPmmhlOJhJ4OYhZ
 0kRcrADXLMDGc7bcV4A+h4SYKLXOEMBlK0Xj8DjtFkk3rNsMk1lqjFdxIx3760BfFtOO
 3S5g==
X-Gm-Message-State: AOJu0Yxo3IgoZKMgdMW0+SFM+k23ZzgHWdXB4OxQHk8jXEhKY7VPxZ02
 /mTnNICpO/3SXpsAbvGNsgTCdanp8xSmM3Wxd5sgrEnhQ+Q83VpmYPSJ
X-Gm-Gg: AZuq6aJ5BAiSWS48o2kT16/yCuPlbJHgEF0BzKkGY6xU6nNH80C2tViUYA5K9QUwNNq
 6S/Zke/nBc2b+9+QPaiM+mm+JR1RUfehLXqEc7nMXi19/XehNlSMlxvs0//qLWFNN+9p1vOMBqD
 cliQt6X3t81zJEyN9UrNA/QH0gyEQ/ER4uA9Wmz6jbWCEhDrOM69xQmkW/Pr8LjViO5B7yXPBkA
 MNEaNwsoCK7+iMQkfF9objy1C/50hbfOHfWBzGLh1nM/f2sb3YtZ8q9bOcXuwl0q/0/M8Nmm5jj
 e0qvf4uWHW94VTPlPJ6GDtIxxqt6T5ARi+yt2XoBbk0EgOigdhhma+vTI8yeK5ekQq46hHh28y3
 2jsDUvKJQV572OpXJoly+Eh/ljG11wyshkU1BKuzSE+VrBZKe8vAR65ZZaoTwEm33ILs649AQDI
 5aO+ZmoYRoFnTN7U6NUs4DNXxhatmSyI4v6w==
X-Received: by 2002:a17:902:ea11:b0:2a8:3707:d79f with SMTP id
 d9443c01a7336-2a8d96e3bfamr54830685ad.26.1769842550031; 
 Fri, 30 Jan 2026 22:55:50 -0800 (PST)
Received: from localhost.localdomain ([111.202.170.108])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b5d9a7bsm92571725ad.79.2026.01.30.22.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 22:55:49 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
Subject: [PATCH v8] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Date: Sat, 31 Jan 2026 14:55:39 +0800
Message-Id: <20260131065539.2124047-1-xjdeng@buaa.edu.cn>
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
X-Rspamd-Queue-Id: 24CC1C103C
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
v8:
- Remove the redundant brace.
- Link to v7: https://lore.kernel.org/linux-arm-msm/20260129233703.407404-1-xjdeng@buaa.edu.cn/

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
 drivers/misc/fastrpc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..a669e4b2bb35 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2337,8 +2337,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		if (!err) {
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
+			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
 				    data->vmperms, data->vmcount);
+			if (err)
+				goto err_free_data;
 		}
 
 	}
-- 
2.25.1

