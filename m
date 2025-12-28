Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A826CE53BE
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 18:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EFE11AEC0;
	Sun, 28 Dec 2025 17:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNjuVKYq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLSG7CVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD0F11AEC0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:42 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSEkYC53483487
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=npwPiqZPrPU3R5s5/Q1G9H
 2LQKQVo5umALTPvs9VpAM=; b=jNjuVKYqLyVHeDRPDfJP4BL7ITLMfohoZXGubK
 njZ2OQY9In69Ksj9v8xbCatD7iglvaXSjQ0zAJxME5igWnxTopRbRXYIdzRIGOuN
 fQ1A11IMpsFQP3ipy8JmTU+nrKrEnJDHQXWyR6H6DhZSHckGHxwFb2gedQZMYfbM
 JhVpLdH4IAd74/fnMHK451q6b5A0ebZP0JEDlUUb1YEBP21zIDbB/Nh3ncHRe5vk
 zzyrxnVF5iyiluh2m7tSNgNDaQQzxaWP8thcad0rIr85a54K1sjBkkjZ29xsXnyr
 oPu5iTz8AXtrKaAfN92inqCwidyplmCmJ7KADnTGRzTbzmJg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6f62ja4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4f1f42515ffso216912461cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 09:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766942501; x=1767547301;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=npwPiqZPrPU3R5s5/Q1G9H2LQKQVo5umALTPvs9VpAM=;
 b=jLSG7CVM66lKqDOqHz/xOKqIEj0N64TgGqcmlTNyrl3JjQL546WWcxVmmB4S7PkKYN
 ZgIv5sr5wvY33ykT7Fhrew2SFFSWE1hAlZkqzYyHyFXovomd9yI8VgqVHEm2xrton1vx
 9rhoU2qD7tPYiJjWQp3sgXvJlmVd2tsaDj8kuIaQVODMTC6cz6VMJE+ueh5Un2nZlgD5
 ML/WG7U0tc/ljnGv3i7FPbB5DUAavsqxwnEh95Lhk1+25OzswoAI+FXQRCAzFS12bZ8B
 rU5E8IOszgfNKLEl6QjIEVffKKMUyntl2ufUL0k0ZQsywuUSKzlFv9+lewpukh0bxCUF
 0ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766942501; x=1767547301;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=npwPiqZPrPU3R5s5/Q1G9H2LQKQVo5umALTPvs9VpAM=;
 b=MYYtbj9vUfesXStWC61QNbyQRsgHL64xPDgN8k4iRQkWrAJhaj7rE58Bj1xsOVahSt
 YJY/arJPdS/1yykI/gbXOxjnT6G6i44E36l3OhNu2/JDTy0LhbV0wNx3G6KDn95+sfhD
 2qvwpXqpZWzOvJmVbyfcR8ADYe6HoAkMPuzx4wg3jktr/btVjEnbA8tZBADG78M84u2a
 jtS3s4svwdZlmltLFTQiawTkLt52MaW68xYwk3G6nM6BQg9RFVspbs0eKQ97AhxRaWaM
 Uv9Rgoa/31t4oy4mCrbOXXN4BTqYnBmhDzgsWJTVMYoeTXwEG5f7F+SawM8Ds6A+8WsM
 ZJkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrECxR12yuP96dx55Hn0uPc023B7OBTV+YN8yVwPFPhq5MVX+z/2m8TrVAMNmOnihrIuPG0OoaJSE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw53eMYBNtZrSayny0IHnXCE6iHJKPUBNDn7k2PvDl7iRBMGo5q
 vraFeb06WEFmrLeU5D672KREx8SyZ/2Py7GNOjMQGhc8CyYzGGyfHGqQezu5U8gmC6plohqtuQ6
 0BZwWK70rvIdYbiJjQBriP2JwmA0BgD2D4KapN4oZRuFiFxAE7LlsUZPfaGkwoUkStnT19Mo=
X-Gm-Gg: AY/fxX713R7d6DH3UVW/IXA8JrprZIwnWy54jEL/76ECIQSag+1Wd4K5oRhXzl7x4Yw
 5qXNPcE+TkCxwNMZi4fZUeWw2jq5MH09kr3iZybD9zW6Pz4ov0uazF8MmqfPc55m4KLNLkKxD/I
 ojNzUmTDQVzI+Rwa2CotHR4q1v9+QoriK4ot1zfrzvF1l3RYjw/numUHfGqNKLizQQsSYYkP7H0
 zgBK5ikNq1dy21oqkHOR05QD6IJt3deK9s7++piWLRxEwphucG7CpLiFUhRHh6BbjCgBfcQE8EU
 EBgTKOkKmJJ6PmPfzejYk8nOYm9TbvViw7uM1JRWDFXfQuaoi9VhV56UiVgGxs6rHlwaZtfuALo
 Jnz8IyZUxfpNec4EIUEamR5eQ+A325ulHYUKJKkC/mFTE3NpSWcmMqcPo+iAa/FwMYM9ZkohRZr
 4eldWC7Ru2gyKN4iRIk8Fvgb4=
X-Received: by 2002:ac8:7fc6:0:b0:4ee:1c81:b1ca with SMTP id
 d75a77b69052e-4f4abd16604mr430244411cf.34.1766942500976; 
 Sun, 28 Dec 2025 09:21:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwPjyBUi1UQCzq/+IC2coGHTnCTbnWaC3MbyIVz6JKpNNu1oBmd8akd4pb25eofkn5Y3rA7w==
X-Received: by 2002:ac8:7fc6:0:b0:4ee:1c81:b1ca with SMTP id
 d75a77b69052e-4f4abd16604mr430244011cf.34.1766942500365; 
 Sun, 28 Dec 2025 09:21:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 09:21:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/8] drm: writeback: clean up writeback connector
 initialization
Date: Sun, 28 Dec 2025 19:21:32 +0200
Message-Id: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABxnUWkC/3XQzW7DIAwH8FeJOM8dEBJCT3uPaQc+zIq0hBbSr
 FPVd5/TalKlrhfkP7J/yJxZxZKwsm1zZgWXVFOeKKiXhvmdnT4RUqDMJJcdH7iAbweh5D3g5HP
 AAkZb7nXnQhc0o6l9wZhOV/H9g/Iu1TmXn+sDi1hvn1uLAA6DVL3quZJRh7dc6+ZwtF8+j+OGD
 raSi7xjRP/ISGKi6URArqKK5gnT3jPmkWmJcWqwvY3a8Nb9w1xuGxc8HOnr5tvazNmKsDaledu
 EMsKYqn/9K2DC00yjl1+UvbV/fQEAAA==
X-Change-ID: 20250801-wb-drop-encoder-97a0c75bd5d7
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2948;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=D3eLDF/ONraT+LuQe8030Tgbd5SBZ0lrgjEs8Csfuoc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWchvMQTty0uidqYbUpbagdcXDCL/HNaNtTjc
 gXyLfXm79qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIQAKCRCLPIo+Aiko
 1dS6B/9v4YpvNb+8kATi0akALEa9MAmZaPvRBfo2I7SBnNWUTZs62wLmxz9qRqqQCfnQxeADXSR
 kwiG1sur1Im1iK1bk4XPHGEYq3DBHehmUGkjdUWCcts+Urt0/3qBWUscnAKUAXd+cKMx1EDpzMl
 HYSEdzZ+HbmSj5nXgs9nSONxq2uqKHmrg9Bds/IFFFR4oNHSYTjTL4xDNfII/WwBUbMmfnbhCwB
 MnsOx0g/aPtdaSn3weUDoE2KCHq9TQyml8iiAJkSEhl41yNBlbGf4+AQl5EAeah7MbDQ3IMrhRe
 RpISU1QfeWdCNaLXMpRQr3fq54fkXsA+iPtecT4mtcbnbZY9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: FcJklejzzjjQtrFS1tu7yAsRE8htPcBe
X-Proofpoint-ORIG-GUID: FcJklejzzjjQtrFS1tu7yAsRE8htPcBe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OCBTYWx0ZWRfXwzbulAXiR7gA
 57D4r3waiEkebIC+DZhDJgl/XOZBudcIENI/E6GDjUmE+U9dUOkZOqec28PJ5+AFVQY7riPaepK
 QzQZd8k/gkFmtMk8vq1avZO+p5gBzDnJcnT53xR0ylqxIpvihcDs9OYZ4jSUvFwWkbfOkJYgLmN
 7vF+yywvg7Xa+t/Sp227b+akAMY5bNZl9eSL2klvZPu3bOtoSt7SC0nRvqCzjmkf51HrQwM5iPq
 AMdQ9CIF2ZhQ5G71ASEf3mfs6Q9Jsx/ufe7Slotgfi5JA/8LVMwwe3W0ZXa987tuIFqWL3THFGG
 /1/Uknz3sX6/KPT9MFulvL6pP868iPDYRsTljhSdWwU4ezZqS53cJwubadhmHpAq8j9+AmPP8Hv
 lXhLseQnVhhSBnPG0039MfXovFwVDVsbVQAufnG6DIfmmtahjJWrIvyGQTjBVD88d14bvr0GOjg
 wb94w530UmN7U/wFwuw==
X-Authority-Analysis: v=2.4 cv=YuEChoYX c=1 sm=1 tr=0 ts=69516725 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cFjmsF-WLDi_aLc5EnEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280158
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

Drivers using drm_writeback_connector_init() / _with_encoder() don't
perform cleanup in a manner similar to drmm_writeback_connector_init()
(see drm_writeback_connector_cleanup()). Migrate all existing drivers
to use drmm_writeback_connector_init(), drop
drm_writeback_connector_init() and drm_writeback_connector::encoder
(it's unused afterwards).

This series leaves former drm_writeback_connector_init_with_encoder()
(renamed to drm_writeback_connector_init as a non-managed counterpart
for drmm_writeback_connector_init()). It is supposed to be used by
drivers which can not use drmm functions (like Intel). However I think
it would be better to drop it completely.

Note: Christophe pointed out that AMDGPU driver leaks connector memory.
As it's not related to this series (and as I don't have enough
proficiency in the driver) I'm not going to fix those in this series.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Rebase on top of drm-misc-next, dropping applied patch.
- Added a note regarding memory leak in the AMDGPU driver.
- Fixed a devm vs drmm issue in the msm/dpu driver.
- Link to v3: https://lore.kernel.org/r/20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com

Changes in v3:
- Fixed subject prefix for the rcar-du patch (Jessica Zhang)
- Link to v2: https://lore.kernel.org/r/20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com

Changes in v2:
- Switched to drm_crtc_mask() where applicable (Louis Chauvet)
- Link to v1: https://lore.kernel.org/r/20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com

---
Dmitry Baryshkov (8):
      drm/msm/dpu: don't mix devm and drmm functions
      drm/amd/display: use drmm_writeback_connector_init()
      drm/komeda: use drmm_writeback_connector_init()
      drm/mali: use drmm_writeback_connector_init()
      drm: renesas: rcar-du: use drmm_writeback_connector_init()
      drm/vc4: use drmm_writeback_connector_init()
      drm: writeback: drop excess connector initialization functions
      drm: writeback: rename drm_writeback_connector_init_with_encoder()

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   | 18 ++++--
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++----
 drivers/gpu/drm/arm/malidp_mw.c                    | 25 ++++----
 drivers/gpu/drm/drm_writeback.c                    | 69 +++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  3 +-
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++---
 drivers/gpu/drm/vc4/vc4_txp.c                      |  9 ++-
 include/drm/drm_writeback.h                        | 22 +------
 9 files changed, 76 insertions(+), 125 deletions(-)
---
base-commit: 130343ee6bca9895c47d314467db7dd3dcc8bc35
change-id: 20250801-wb-drop-encoder-97a0c75bd5d7

Best regards,
-- 
With best wishes
Dmitry

