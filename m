Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6895809FF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 05:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F3111201E;
	Tue, 26 Jul 2022 03:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BB514A7C6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 03:31:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIZeOPQnCGws7Ecdji9EboYrXacpbUnB3/2RMMoodYRt3zXGL4z+rR7EcVkFWckkJL0mbKq14SLPTnVrsNWbOvHyOqPAtAtoISS0g8OUTrpyGkXjlpeD2x+07lyppOm4cBZ+HX6vub6CbT+d9JYAJ5uYPsJ2Rglex11FXMYmNiwsg2bVZYvQkiEC9JazXEbHCq4arFjrzt3dOg96oFckwdqfwJZkU+M4mvZzWKLJdN0llVW/MqVoq0Dmx85Nv6BuB8HsnY3IOvg9ncU9lb5GlWzTXp12YmgXwsWeWpJxb8qaEM8ig2jE74vC5Jcr5vQhI7M/EEFWvme/yNsibswNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dCS7LQ46t7nqdVSXJNWZfU5yXoPNyxVT3hjArbg/y4=;
 b=G8Huk6DYoYAYP5DasoycK4KaQicPyikn8byoDrd8HxjS71leLttbPazE3+HvqhrtJkTIkJWjoZpXsVGFFSzF2Ra8fG4inLnsrrne8eAqzNaDKRQmBSqwVjZ23HfznjqwMThhQdlxVlTc1kBfJ5ubuJLUiOUVKUwCav2X0CNg9kAIzh9nxofrPT/MulUQtKx/UCIJ06Qk3VbInfiyLgTmMN2s1eEq5I9asiX7fNu471atJZvkjgxCg0PcTjvr+ZdWWdt2w2hd2xfxoWG1kfx6mPaNrnJBD+DysJRxP9JT1mRig6ogzbJ07/QYbe97Ju2RpyMwE3S/FGB29Xf+uR37cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dCS7LQ46t7nqdVSXJNWZfU5yXoPNyxVT3hjArbg/y4=;
 b=FJ3r0xt2g9yzmHGNmk3AiAIn41pvNKYIjuYrMlWvF/e3701yjt9dATaWnrvRpRaQ+DdSmAUetx2g6Lk8Xipojiuw6R3YR0OVq5/gT/V1FDUa3oKxH5AS/U/k8xasJh36UjuCzgw92C3FtCia0vRIbhAdfND5Mk6Xixb7esa27vE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by CO6PR04MB8316.namprd04.prod.outlook.com (2603:10b6:303:137::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 03:31:28 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::f02d:f2e:cba9:223b]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::f02d:f2e:cba9:223b%6]) with mapi id 15.20.5458.024; Tue, 26 Jul 2022
 03:31:22 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: anx7625: Support HDMI_I2S audio format
Date: Tue, 26 Jul 2022 11:30:58 +0800
Message-Id: <20220726033058.403715-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::8) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 634590c1-d796-4248-ac9e-08da6eb74fb8
X-MS-TrafficTypeDiagnostic: CO6PR04MB8316:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: syoaGwYjXyx8VASXUHodftaXfgxLILWl51QUnEJIkPeQcsl2kiu+ZLqQrpujpzkZkKl6P36wYh5+v0DoZwEZ4Q96iDhxWfILlyLSgDCj47jrjE6hXxtAbGBZgzw5Qe/oDtxxFge7fTKjMJATltY6x4rfV2y6M5KUJi4ikgeWpZi8EbSEYMcenZbfH3LPTQIwnioFew4ZdCXAJ9mGZnjjRYbCHBQYUG8GbIq69wh53kSPQQzE47RLDNEQKwFwrwoBdtwba52CUVGDlryiw3AQ9P7OaZt5CFCqXk1CzDDVecYzrNo7StkyzXGDWK+yjKaR2weNZUlUk1hu66dwgtGFbrdLu9o7kS7z+oVCtHKPKi3TElWwgaEOotQhyBshej+NxiAjK9Sra72R7oCoySrYTMiLsIctiOJgZqNhga7K+vo985LdwdOLogdxP8CFf7aCrGF4mGhRK6ifXW+2ID3wUb3xHH/dWn4B6ym+Kxw96ux6TZR3ZNUU3rgd7VsP82aJCVlDCXtSHBZAW5OgAGA+QaLNtdQxqd8fQieEUrOfFGgikSe6V/6ghNG4Ii+6gUXYeYyMselg9KX0hVAxex/QEkNgLmaqclqtyLk2AptrloWgpBf0eA/gxDlBVmXsLemjMitMTfgwAt/qKwoBnQUPO7Vi8O+8eTuIA66zuVrQzzj7uV1s3oMu4MDuaJMR75aBuqmAiALfoudRZKW/YMSw2RuBP+uorOaVZkBZ9VWE0GTQJl8qBcJKDKpcoPFtoni/5Y+qjvyBVQHfGLIT5kyTWX6SOAKokXXnOINuzSDsiEo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(39840400004)(366004)(376002)(136003)(186003)(1076003)(8676002)(4326008)(66946007)(66556008)(83380400001)(66476007)(2616005)(110136005)(52116002)(6512007)(41300700001)(36756003)(6506007)(26005)(2906002)(38350700002)(38100700002)(86362001)(7416002)(6666004)(5660300002)(316002)(478600001)(8936002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V0N/K6BPvC7Q6c5TOeg72ZyKWYgRWYWGUOcMLRABEyVNH9MJ1p2hczoMWZ7p?=
 =?us-ascii?Q?C9mGAljPcTRWh3o6jjttUKr8+OTtTiV95rgTL0xTPHlT14EVLBuqSaXRXTNq?=
 =?us-ascii?Q?GsazqAIMsIuFH4mdnnbnOCyOliOsZaovcflcq0BcXLgGanw4CO3qQMomwffi?=
 =?us-ascii?Q?J/NgAqAJsxCqbj33kqOzmGW9Z4+8Sr5Cy+9aPu1BJF/2S15c2Um7nHpuTsf8?=
 =?us-ascii?Q?B/1DJKITHhu0X8Wfv1ygDf1Kh76biDZkDCstnHA5dD7wZJF+bnh1xZ/HFL38?=
 =?us-ascii?Q?5XIuZldCz6jnbgTKxDSApeu3uP+b/3Q2ZXZ1JmR6BZbqkWRQ3pC60ACn22u1?=
 =?us-ascii?Q?u3qpEnakEx5FJRII5ApxCJLV584MTzRS/TDAIuBqcdeJgNeBdgrRoSjxlmMw?=
 =?us-ascii?Q?IsoU1YaKcBZt2fzr4MT6H1hrHAzxGTrguHAJ21FcY8aeaFNd5hqEbKw2dqn2?=
 =?us-ascii?Q?C4qfNrK6nWKGYzF8n7fgOvsfwDGQzyrKBKQ108fSZmCifn/CEJrlSeMnJJ67?=
 =?us-ascii?Q?1t2v1zl2V1SnEJ4P7bUhLpQ0irEPB4BZWvw7viw1TgOJi3wvUq4vylJgc+xx?=
 =?us-ascii?Q?KJuNfFURNKwvMakPIfLBqnhZDTCfjx61ndaI+9g8CrUxTvqc3ijEOlLYPmrJ?=
 =?us-ascii?Q?6vkGG36tWQKudm9/2eZbU1mBJLc7RVPMjzde2NvLrDnp9KySg0LfBIVN3D2w?=
 =?us-ascii?Q?rLbRUP8ZnIMI+3196+c3YQKzY3cGp+v4dIAAZgH3VdRKQzYdcanr5rPaMzrN?=
 =?us-ascii?Q?N6HYiI0H0Zt//6B7Bzbio/wXE/+t0sljhTQerZjK66ve2DN+NOBjxKSQerjW?=
 =?us-ascii?Q?UMlxFefSGPFb75v2HxkhEerfswksMxtOtWg+4Dk1881RttoxpyvMyYUcKRDC?=
 =?us-ascii?Q?Pafo3H8bibcJC48S5Y72wMIJbgXsGqt3aeouGII0GNcVjNl58zSN30NItspN?=
 =?us-ascii?Q?tMzYFwuzK4oGVjaF0qwWXvqCHsLOLBrm1Mi5i8hE0ZelB+CyRtH88syCGz/u?=
 =?us-ascii?Q?8NeD2Lp931bBzBI8UBLBnRhs5KNQ5IYHSfgoConbt3w6qhbVVmk0u789AdS0?=
 =?us-ascii?Q?gBCPWS9Fyo6H26xIsR2f4OaU2VckLl5Tqw3cD8ReNhiKaKM4/EG2hxChlj/3?=
 =?us-ascii?Q?B1Wak255SJ350kfIQIChhVTpQEHQ68IJFyrt6WkHUCGmU1PJCwMUYVROtXTj?=
 =?us-ascii?Q?paCsm6rKgAkwClBG8z2L2PtlzTyVQ9K2Pxhu7NV8t6ws2CjDel1yMzF3MPn+?=
 =?us-ascii?Q?DzIwgEi4rRMhdwQ35/rE0jAvR0diH88nM8nLIPn1VVkJJ78L4OT+X5Pnllhr?=
 =?us-ascii?Q?rKc636TRUebu+p3CWJCVWPUQtNdesR2ili1RAylT2/GLKVBPfXNhPA4TnwCM?=
 =?us-ascii?Q?lplcmNYmh480xG8/UdnH5P4G1ZCgM/a8dsW+NTj+6ZH5sFjAux3g2N2OISrV?=
 =?us-ascii?Q?00exAy5BvM33QU+NktBfaFr12dVTiN0KEFeo5B9wnhrqDLu3vBScLVNc+7BA?=
 =?us-ascii?Q?o+hMLljTR7kE+fp3bpSLqd665hXdxFQKccTIV9X+kIiQ8/lTW2zP799j90nn?=
 =?us-ascii?Q?5mYvfQ7cpQ6reUteppJYGb6FpVSMDKkrqVRTKmfK?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 634590c1-d796-4248-ac9e-08da6eb74fb8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 03:31:22.3639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08VpMRB9UG5FfzCzRY9sH09aSOIn+vlZnklkAJMBqxwRzsXJtLVFeqE4P/qzgONQnuJxpbghM2/HngroDfRWKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8316
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
Cc: qwen@analogixsemi.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hsinyi@chromium.org, bliang@analogixsemi.com,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. Support HDMI_I2S audio format.
2. Return 0 if there is no sink connection in .hw_param callback.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 79fc7a50b497..c74b5df4cade 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1797,8 +1797,13 @@ static int anx7625_audio_hw_params(struct device *dev, void *data,
 	int wl, ch, rate;
 	int ret = 0;
 
-	if (fmt->fmt != HDMI_DSP_A) {
-		DRM_DEV_ERROR(dev, "only supports DSP_A\n");
+	if (anx7625_sink_detect(ctx) == connector_status_disconnected) {
+		DRM_DEV_DEBUG_DRIVER(dev, "DP not connected\n");
+		return 0;
+	}
+
+	if (fmt->fmt != HDMI_DSP_A && fmt->fmt != HDMI_I2S) {
+		DRM_DEV_ERROR(dev, "only supports DSP_A & I2S\n");
 		return -EINVAL;
 	}
 
@@ -1806,10 +1811,16 @@ static int anx7625_audio_hw_params(struct device *dev, void *data,
 			     params->sample_rate, params->sample_width,
 			     params->cea.channels);
 
-	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
-				    AUDIO_CHANNEL_STATUS_6,
-				    ~I2S_SLAVE_MODE,
-				    TDM_SLAVE_MODE);
+	if (fmt->fmt == HDMI_DSP_A)
+		ret = anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
+					   AUDIO_CHANNEL_STATUS_6,
+					   ~I2S_SLAVE_MODE,
+					   TDM_SLAVE_MODE);
+	else
+		ret = anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
+					   AUDIO_CHANNEL_STATUS_6,
+					   ~TDM_SLAVE_MODE,
+					   I2S_SLAVE_MODE);
 
 	/* Word length */
 	switch (params->sample_width) {
-- 
2.25.1

