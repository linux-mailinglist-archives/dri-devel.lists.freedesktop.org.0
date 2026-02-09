Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MHUCMLdiWmBCwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 14:14:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5D910F7DB
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 14:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B12210E3EA;
	Mon,  9 Feb 2026 13:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YXAloL0e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22DF10E3E8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 13:14:35 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id
 38308e7fff4ca-382f0732612so16409911fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 05:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770642874; x=1771247674; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RoPSheucwNdJ0J9aHupvUSWIaFIaKnYUl6Un356KuXI=;
 b=YXAloL0e55NU2DhaxWXcqZgjhgZb4uuNMuB5PG6Cv+ZPKdA+BU7T3QcylwSizEPugV
 2yI5HqsfAJzqB4z9POBkG5Wf/pSkZ3czPfAeb7+nUHpVXhGr99GsVhFsuni66xvPZp1X
 7/uGTmz810CcB9Fnw28Gl7/WGTKbpvKC+j2Q4sU5nuJCdVc7WJOIssglo45UwiY2FO01
 oAZwGuxRKwVo3SDeZXzbRM7iVjJNFFhJr9NxkK+rO7ajRvQF4WRUHbGG7z1ncEJ4eHFi
 TEW9Sdi5WwH6ContFZqJF7w7h42r0KSABtoJpM4eX/NPdg2/GYA606/PRf3UffQ1cFbL
 HVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770642874; x=1771247674;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RoPSheucwNdJ0J9aHupvUSWIaFIaKnYUl6Un356KuXI=;
 b=DvvZrNdByoBNywe4AIkLdFAwLFrAg5ZxaYYKk+JkH/uC7ySFAW7usb2NVWNI/r88ik
 Dun5Ivk2XTcMumH/yosknDkOHXl8wGmAUanGfW1vgP6kOHPwmeIfjvKmfF1ZZwp4xRAE
 7y8SsptAzJqPKc1ursmdBW7cMwdxFz9yX54Zd52qVoH9Nr7hCMT4vO4GOF2YqrwCi9pF
 y8EmXRzCFlDrzCe+ga8MnPX8lVeHWPAMVjUrebinMTmVoY+bcJOOKqSUrXScBYsQV8pv
 vG8s2WlwEsdrttHe1FC6RgxyA9c/sLL2g+CBsRxunbarM9aha9DHcc0Jo1rg1MUu1ltz
 uDjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp3CdYtQ3qgnara1LztwoZZCYAKDfhBC8u1JQ2ti+iTVuEGZwkmaJOqayXcRsV75hBo7lZCtjgW+Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUfG7QChBvn5fYm8d3DS/hhgDKCD9hk1iQIBy1OouaTNiFhs5W
 dM2jlkitstlMKb3A9VmzdSFGhluiGSDezWCpE2+GgJJ/s6Gt6ACWqFR9
X-Gm-Gg: AZuq6aIKTNLZMwKuQ+I83KmxH+Gy4jhE11WZolewTQdeyRyuhY4VFqsUwQukUYZ4Spp
 EvWfCyu+iBHqsZ5Inqh0YCoNPX+kSDOolaBRSJ+koyDqd4JBnX8WslO4GrvSisjZUOa6Zik7Mvz
 +UeRQG1BypQOd9W4XdDojEWQE+VWh948l8wp8qcYjBWxhGVA9q2lgK4cwWvsKcIC5tGb+9m1OMy
 NTaIGQaHH/oA72iUgK2s/t4hRQj42t23m3VCmqzn3ifZ6Tx51ddwBv0XkJQ0ag8xisVd8JkhJMx
 tpPbUhNi3FNj4ku7bgHvQLgw6FnD7ecgh8dRJizfGCdKAwexmd3pjEv5xr0D8wuxZBl+8N/MYrH
 0xepb/skbIJkBGAVkmoniF4yvGAtMVtjysABfK/Iweu5ZS6zGXN6YTrAFGKB8iPK2zw6rxFP3HB
 38wfnCihVfqSOkkybzelujDdFhT4VeUwT1Oug/tt7SHc99sImAAyLIHDFboKxAxuUBGAe21tQIA
 IE+LpKfqw8+81s=
X-Received: by 2002:a05:651c:b22:b0:386:1ce2:1198 with SMTP id
 38308e7fff4ca-386b5110ee8mr29967281fa.31.1770642873785; 
 Mon, 09 Feb 2026 05:14:33 -0800 (PST)
Received: from localhost.localdomain ([176.33.64.73])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-386b63e8483sm27212191fa.34.2026.02.09.05.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 05:14:33 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Alper Ak <alperyasinak1@gmail.com>
Subject: [PATCH] gpu: host1x: Fix passing zero to ERR_PTR in
 host1x_iommu_attach()
Date: Mon,  9 Feb 2026 16:14:26 +0300
Message-ID: <20260209131426.37611-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:alperyasinak1@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alperyasinak1@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alperyasinak1@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6E5D910F7DB
X-Rspamd-Action: no action

When iommu_attach_group() returns -ENODEV, the code sets err to 0 but
still falls through to the error path, returning ERR_PTR(0).

Returning ERR_PTR(0) evaluates to NULL and breaks the ERR_PTR/IS_ERR
contract, causing the error to be silently ignored and potentially
leading to NULL pointer dereferences by callers.

Fix this by returning NULL when err is zero, and ERR_PTR(err) only
for actual error codes.

This issue was reported by the Smatch static analyzer.

Fixes: 06867a362de0 ("gpu: host1x: Set DMA mask based on IOMMU setup")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/gpu/host1x/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 3f475f0e6545..46a570b861ac 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -450,7 +450,7 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 	iommu_group_put(host->group);
 	host->group = NULL;
 
-	return ERR_PTR(err);
+	return err ? ERR_PTR(err) : NULL;
 }
 
 static int host1x_iommu_init(struct host1x *host)
-- 
2.43.0

