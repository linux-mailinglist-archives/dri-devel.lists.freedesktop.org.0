Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNc3FJyEiWl8+QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:54:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0448510C445
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EB510E2DA;
	Mon,  9 Feb 2026 06:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="KWmwNECQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A994C10E2C5
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 23:26:03 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-8ca01dc7d40so351974385a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Feb 2026 15:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770506762;
 x=1771111562; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AkFXjU38A5sw4srZ4rRr/u08i5+VyD7JO4xylQ4ub84=;
 b=KWmwNECQ2pWj+PQngTeMWFvJUqfxkRbtuBM272yjJE1CoNbzcCLh2GFKZfkoIzvnUd
 71dAF5hj038dUOjbynJxskbGcrMm7oQSGHrnhza2GQndN0MUKrJuZq85gXSNpYXauaRi
 z3o/BfunxSQoTdGR3EgBP4LCXRaWzYWHWK8RVwVTM5Sesdt9yiYtuwEkzdQACXngX/si
 lgBAA9cCDoIU4kVofoSsVDCdY/oY86cza9exaTCmrvfxjsyyCZA1SrsfJkJ74Tjssrgm
 nb6JszC8K4hYq+ZPdVOYhFAh1ynUaV8N//G/eVo5Dm4545/KMX8BAtnJYEAH6AuDsqUz
 NInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770506762; x=1771111562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AkFXjU38A5sw4srZ4rRr/u08i5+VyD7JO4xylQ4ub84=;
 b=Cm4rqw6zwoA+URTARBukSLbLiM93tMatPdHEw3ZkwwkrOZLQQumhuresw6V0Q+E6Qf
 yFMZeSOAgsf45VC8oadAAO2a34l+q0ezpZHOKFBHfVNkzgrgKryWDt0bFBqZep4lLjPi
 4lW1sKsrWhYZbMxkCeaytMZja0uj/p/nkeFpjQKLglk8Ty/euS6R9zc0fP2JwMFigDgo
 IOzD0c6jzhD5fGS08EtR7HbBTtHkFDeGp/aSE32lpL8eR8KqdlS9V4XVGKzt3Z7+K9Yi
 NRhAV/at0YDtyQausLOPnwo1gNBzb5Yw4L0THg/T/vfE2dtuj2dA89nblgaRoSnvvrUA
 1moA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYnaqKO84p/cAyq0+F4SgF4oFAoq02TkXEDCw5xSFaVGS91KqK0eo4SyOoSld+yVAi7vjw3I8Do6c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyg6CYrNP/ZLsgX7VUoNO1YgyWwZKUE0CpIpp1nH1dVHo4EoGjx
 2ATlNaNuOEA85fchMUmO/x6F7eKXCRo/pg8PkXcFSJNYtgG+u2rXWkc6GPWBz2JqP/g=
X-Gm-Gg: AZuq6aKhZdKHNsQ77I/dtMmvlcXgXp8suxMM/RJ8v2zsBFRhsaU0Od9sQnux8pMpXiC
 uIT2YxLtthVkQ5kLDLsg7IZZ5i48gTIb++tWW/GUc8IMdAPf1ZdHBkbo+Nf+0Hx0VA/qOc8/0O7
 KYVVXBoaLBJWCBxqSS3q0cQzz8SSa0f8XZGQO+DZ7W+0Er0X5FtiEthiAtqLuDG0FZl6skhmpVz
 jBVyg6VPuLLAQ/pL+4CmecR9PQ6kg9sGXko0/dSkfaYN0JlTcQJKaeBnPwXDFpog1ojH81EtDEV
 92hsfE+UsCwa7p778xvUqKLN9abixtK/dapOR410ELNjZ18wqbZ6RRS2ghTY/lc2/7PS84ddfer
 YHNNtwSi4kWK9TYRZjlC5s/hwxH7pq4uW9mLH3uRlFFe52IwnYtXh92PCKNkxmIuOqu/3W86kn5
 AW2MOVnMgfIyXpao2NCDM4220fMJH/SX6yKmupSuBTQpmwOnTwsrryvDvoOecgbqKbS9YViR8cr
 chjh5bh6OqdXtmhX6CX9+dxt/y4nNI=
X-Received: by 2002:a05:620a:1990:b0:8c6:de6f:89a2 with SMTP id
 af79cd13be357-8caf2789759mr914848785a.85.1770506762357; 
 Sat, 07 Feb 2026 15:26:02 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu.
 [165.124.184.136]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8953bf3b6b2sm47190196d6.6.2026.02.07.15.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 15:26:02 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] drm/xe/sriov: add size validation in packet init
Date: Sat,  7 Feb 2026 23:25:59 +0000
Message-Id: <20260207232559.4037731-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Feb 2026 06:54:11 +0000
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
X-Spamd-Result: default: False [1.79 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[31];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,u.northwestern.edu];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:intel-xe@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:n7l8m4@u.northwestern.edu,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[n7l8m4@u.northwestern.edu,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,u.northwestern.edu:mid]
X-Rspamd-Queue-Id: 0448510C445
X-Rspamd-Action: no action

pkt_init() passes data->hdr.size directly to kvzalloc() without any
upper bound check. The size field is a u64 sourced from userspace via
copy_from_user() in pkt_hdr_write(), and the only validation performed
by xe_sriov_packet_init_from_hdr() is a version check.

When a VFIO migration manager or debugfs writer supplies a packet header
with size > INT_MAX, kvzalloc() reaches the size WARNING
in __kvmalloc_node_noprof() which triggers:

  WARN_ON_ONCE(!(flags & __GFP_NOWARN))

This fires a kernel WARNING, taints the kernel with TAINT_WARN, and
causes a panic on CONFIG_PANIC_ON_WARN=y systems.

Add a size bounds check in pkt_init() before the kvzalloc() call to
reject oversized packets early with -EINVAL.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/gpu/drm/xe/xe_sriov_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
index bab994696896..04483eeba11b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.c
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -127,6 +127,9 @@ static int pkt_init(struct xe_sriov_packet *data)
 	if (data->hdr.size == 0)
 		return 0;
 
+	if (data->hdr.size > INT_MAX)
+		return -EINVAL;
+
 	if (pkt_needs_bo(data)) {
 		struct xe_bo *bo;
 
-- 
2.34.1

