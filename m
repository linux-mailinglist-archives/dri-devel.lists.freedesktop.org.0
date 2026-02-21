Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHLNGxoqmWk6RQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 04:44:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABE116C0E2
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 04:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA9510E109;
	Sat, 21 Feb 2026 03:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YpZey613";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A0F10E109
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 03:44:21 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-8249cb73792so2442817b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 19:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771645461; x=1772250261; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G2lZPUnhsjUnXBJgHs4dvnaHovSRN+TSfVBm8NcKAvE=;
 b=YpZey613+tKGknWMfwboGBkYD3gQ/HBsBd5aaJYDH+KkCak6jEvUUNBuOM87nSodqW
 VR7nEUBkfytF8oisFoSsacEPQYMKrJUYtrrIkE8WcpTXXRGzo1Iy9DKlzHQPoWV1w5n1
 mnatEfyThK31VKXy4HApRVCfhYVV23nN+ZLbMh8DDHoiU1JvhoPIWKc/nWSdQ0CuhyZu
 GqcpOVaS4b+C2EKzKhn30Zt80+230S0BVzyM9NflzC0N2c91bDUecu14j/++h9NUdgjX
 yHeMb52T2jR1SoJnHFcYvavd05ls2k/AF3FsnlSsz6H0eXVSxW07qObgCddYRaTHxQIl
 3jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771645461; x=1772250261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G2lZPUnhsjUnXBJgHs4dvnaHovSRN+TSfVBm8NcKAvE=;
 b=bI/VBI03g8xGKswtNPz4+LHBA32Uf3WSbVVO8PNXzp5Krdx/BUS1dEf/9qz7mddJAa
 DCI0nAjUWdjKBxvPgpvZiVcNMa7Ma2CcBKOGcJO/fGP+modTRtDXzG6gdJBxmHCryKDl
 3Ondc1GtakmnA20npbJbFEqHPNWXfIO/yaZ12EOTcmNKG+8IUcoq9OpzPsPCf8J2gFM9
 GX4o7lcBnFl2cotXGZkjFwmOMUFqw/40kkrDh0hyYhxCFosaozZbvYywogPDedqB5Qh3
 6qDaK0/5BJgIFJoWPUxZvWYszTYee5fpVxEMysVt4oMZhrcVSTi5QWmK9cuk+LqB6gKh
 XIjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0gcrqQeMOHohZBuQ5ni8b5fFoCvpxkoXUFUuvtLeZl7B5yOlaZrNLmT0rramGVQdoMu5NK+dByJQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL4dMHsYNnwGUa67UQJ7BI6uP2kZPcVrlXUx76K+xF7w8SOjxi
 eRylzomcxkDEM7EXAL1BW5jsxCDDWqPMung0ctyUUx7kAQhbhjtVF51w
X-Gm-Gg: AZuq6aKbePcXKJrbaX04ByF+XHW9dMoNKsFciVeuNInuatMPUm2tDmbA7KV3O3efG28
 L0uvjMgI+DaeN4EZMOWsDls7q3DdMPrPcEQy+15zl0+o6KCp0r5EdmNBQd6NDGgYTj/3J9R71QW
 /sS7ibYvqOR/KJMlvfW9uWzeId6ODl2FA9g3tMkzJZEmHZzmJksPCLDLVRjqsH2pz0+o0UfTQOl
 EnCwPXZDO0lsingxPogAaOc+PyGbkbfRsfa6TXqtn1g71EQ/fQV/uV5WHvCLpgvy4tOMbk57Jso
 3CjDkq+ZPS+G/MxIMLEcBWAm9SbvwIgl7X7zs1ByIg+ThxXqGpeT4761893+6K1lnTxbTF77V/U
 3Y7DhypGsZ29QSEKFOBWKty1DJHQE5r2utL4y+2yf0s4l42Y4Ux4g/iCkClkTlq0SWiEC
X-Received: by 2002:a05:6a00:4c19:b0:824:374a:13f6 with SMTP id
 d2e1a72fcca58-826daa0424amr1768522b3a.31.1771645460652; 
 Fri, 20 Feb 2026 19:44:20 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-826dd8ba11bsm714951b3a.50.2026.02.20.19.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 19:44:20 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: stable@vger.kernel.org
Cc: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:AMD POWERPLAY AND SWSMU),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/2] 6.12 and below: amdgpu: fix panic with SI and DC
Date: Fri, 20 Feb 2026 19:44:00 -0800
Message-ID: <20260221034402.69537-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:kenneth.feng@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: CABE116C0E2
X-Rspamd-Action: no action

The first commit is needed for the second one to be reverted cleanly.

The second breaks DC support on my AMD 7750. Kernel panics and I get a
black screen on boot. With these two reverted, 6.12 is usable again.

Tried to git cherry-pick the fixes but that proved to be difficult to
do cleanly.

I see 6.6 also has these two commits.

Not sure what the proper procedure is to request reverts on stable
kernels.

Rosen Penev (2):
  Revert "drm/amd/pm: Disable MCLK switching on SI at high pixel clocks"
  Revert "drm/amd/pm: Disable SCLK switching on Oland with high pixel
    clocks (v3)"

 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 36 ----------------------
 1 file changed, 36 deletions(-)

--
2.53.0

