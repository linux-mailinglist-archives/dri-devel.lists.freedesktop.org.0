Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPVmHi3/imnJPAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:49:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0785F119192
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EA710E0EE;
	Tue, 10 Feb 2026 09:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NyPDXIXL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E3810E0EE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:49:28 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id
 2adb3069b0e04-59e499a40easo678787e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 01:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770716967; x=1771321767; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5XThuayVTw6ykMsIyLNH4e1i5wnYl+TBF/gMfeuCJW0=;
 b=NyPDXIXLWhyBH9/eYNS8SLH6AF8aEvXdJ4MVppz63VacIhTNGSxLH0isL74vE5IHth
 UzLAbHiTpBAKqxJ8FsDoaiXWsyOjGmy5mM4hnYVxRlrXnfxNKWYfNABEoS+IfMBwBb3l
 aLpkaUqlT6QEebVBHn+eJlqoNNHU+aaKxtl+JOtJRZMix1vIVc2xQ/wpSORkCDdG3TkH
 01/Pufu/PUDfPXK3NJzPAzx4LkOH6BLngv80YrYyOTr3bmU/5ks+4tv/ezA+lHNOKtTb
 R0whnKLLS/+hpWCKNI4dYZ3Z3glndFuk1mSHXK5YoBLBbsn2/klIKIJBUO7coW+RQmk3
 bfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770716967; x=1771321767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5XThuayVTw6ykMsIyLNH4e1i5wnYl+TBF/gMfeuCJW0=;
 b=feZBVAUn9+Lhm1tMRDHNOkcMgStkHoqJsfthr9Ut/mjm4cHcOFvJk4Y8mSZPKlyQEc
 pQ3Z4leFWQTphLI5UJbllOhKDZwFBMNwyn2LbcX0sX2F5oFgA9uxX1ObignMUH/EyasT
 PbpuqxhFgflEAH8wLY1LbL1St+nu/1I9IOvQuOBppEhN+qdVbc9C4+TYsT2mjGhmiHYz
 5/J1l/CFhy/jcExrdtjttJcaL5eB5ckHM4qv533ooAvl/DCzaG+637UqW4gKdxDM++TJ
 YnhRGQsWy20WqYmO96OS5vPdkDgEz2VJOnWOvpcov5QhmOBU1yVh549UgJY71khfx4UR
 4p1g==
X-Gm-Message-State: AOJu0Yz19X075blWPaXIcDydWLQAC4q9Z+D1BlnkIu8Zxev96XMQSEGC
 VLouAEEOFIXRWHvwEbKvVtB04IY+z1lCXbPMK+/f4GlZC0D+B/kin+Fh
X-Gm-Gg: AZuq6aKcfyqxgWm0HXmxPK25j8817yWfIaB3DfAAxARvR16CgE0LzXrpsSZGCvVi7Qs
 ZviWgYm7/GmM+XYXfPUBIev+LFIZdSZZEC/M3ffwr6mW0CA176WZ61kz4yGbxc1Uxy67FWEDSvo
 /6F2IVY4kLjh3zgljp9Q8ZYTnXnO7Y7zykE56G1MCRZsjiah59+Q3sdnjUVGer/CedFtUJX+sd+
 /P0UOi0GXVwMf/G76u9/AU0/ZnqvsRWoK0nEnChDTiZDrbaXtpwS6eUINFpz6xW8WZOvaEYk2vG
 lzAimBA7yXBMircGR1vxe+EFT0EEtPy+Z4WfFOcCNpJL0JUt7AbXgboB+7WmZ26LTifsBBAFv06
 Z8SHc/ydPqjYKrs46CawhzwHKtXYJVKJkUiaqJ1vE3ikm3yLHQV0dpJQci7TGrT3YgDxMVv11b2
 gt2QZXiYxEQikI
X-Received: by 2002:a05:6512:3da7:b0:59e:92e:7d07 with SMTP id
 2adb3069b0e04-59e4515a360mr4728661e87.24.1770716966455; 
 Tue, 10 Feb 2026 01:49:26 -0800 (PST)
Received: from xeon ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e44e231d5sm3191691e87.81.2026.02.10.01.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 01:49:26 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ARM: tegra: document Tegra20 HDMI port
Date: Tue, 10 Feb 2026 11:49:06 +0200
Message-ID: <20260210094908.14276-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,nvidia.com];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0785F119192
X-Rspamd-Action: no action

Document port which can be used in the HDMI to model it using OF
graph.

Svyatoslav Ryhel (2):
  dt-bindings: display: tegra: document Tegra20 HDMI port
  ARM: tegra: transformers: add connector node

 .../display/tegra/nvidia,tegra20-hdmi.yaml    | 13 +++++++++--
 .../tegra20-asus-transformer-common.dtsi      | 22 ++++++++++++++++---
 .../boot/dts/nvidia/tegra30-asus-tf600t.dts   | 21 ++++++++++++++++--
 .../tegra30-asus-transformer-common.dtsi      | 21 ++++++++++++++++--
 4 files changed, 68 insertions(+), 9 deletions(-)

-- 
2.51.0

