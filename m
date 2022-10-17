Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65E8600A72
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 11:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248D410ED07;
	Mon, 17 Oct 2022 09:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60055.outbound.protection.outlook.com [40.107.6.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21AF10ED09
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 09:22:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZB4Tae0U61zLcKcj1y84ZWo3zxIT97YTW3KrvDFImlTrx1G30ULAfuArp5z7SQMj1TKKlcLseqlh5AD5xcHebnuiMGFbSBpLDW04Q76ooJ8mwl1OS3Kh5Xz013v6n4g4+YjeHOxYT5C5fwcdKoCgPOtIsoeyYTVYvKPzxmEW4k8B9jch40if49+Jt5Nn0SEcUj0KbLnvcy2/oVOcrSXA52+LO7BZrsOiRIH1JOQhfcT8qtyaputNTR6JkNymTJ59fNx+c5o6FBCksf8Ku3wwnIxVHqDFybvEoCPf/m1STPsoSO2WgCVGf3K1xsgBGPJN6pTBZCIUn+ahXCbAUDxEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37HLJsLIfcnsT7QWqQsCzE45ndZOh5JvUcXgWNXWskI=;
 b=j1Xz91VTt+ibynUtqKoTJCuDSYGVJKolvrEMaLnGyYs/FKYkf1IKCH9IYXYnTbAsAJzLEIA7HImmsIPCDZC0F6UG1XKqeeqYmoXDW6Xi8nzM+dMUZxuIaWR3WSX4+XsaJEBYLFjvCI7vvS6lJYqpn0shxgYnu1NZObJcSCDH3hcRrIVfkKpP/QCJCmRFHvDqf954APjZ4pkXqNaS1b+oXNCSeIdlFjQjTiL5XlNXK5JsWsR7d/oIogDUSSgm3tsFRDMIBEaIP7urE8ja2J4LjzX3+R5kVGCus52RVQecqYHqkBT7oEB4njcCuD7zMyD/ntE9UslAkd4cHgzO8/4zZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37HLJsLIfcnsT7QWqQsCzE45ndZOh5JvUcXgWNXWskI=;
 b=D6mZ9cxy9JHQIYQuJidgG+VBELvPCrmPgAxrg5keGEIhf6VOyoFf+xykqKjNyDbP8efCrw/zzkckvXEGoeb1W2OzmZnyQVMxIgoG9NzwG+Piq2z2l6qTiEWm4Bo8JFQwxogmP1R/VPpBtra2Vj0e5t84V3HJfZ+3iNQJdvTWPyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB7188.eurprd04.prod.outlook.com (2603:10a6:208:192::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 09:22:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 09:22:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v12 4/6] drm/atomic: Avoid unused-but-set-variable warning on
 for_each_old_plane_in_state
Date: Mon, 17 Oct 2022 17:23:06 +0800
Message-Id: <20221017092308.249665-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221017092308.249665-1-victor.liu@nxp.com>
References: <20221017092308.249665-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a14b09a-180f-4c47-2c56-08dab02112e9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D4fWrRQsyRE2fsh4vMfMjlCLT0sCLkRDv67NCA+h9DVZW0LJv9TDml8kXyNnHt2iBjYYt8DgE+11AAAyC5oLHnsxxbsTuguIo953XSj6EPCnr0GrQggzBbVQisDymslzPTZ0osmQk+5ibRNdaQ7s7VdhcntxZqMXQROUXAZkz/oF5SxfDZJ4W02NnocSR5gg4PbUz5Dx1Tz1ZRxawcemWvl98JvsEOmlf5rMCfnBE+9yJKpPTHMrawxYxi1LrcIg8c14PPnnyQfQgev7VXfiYPQTVukGbAMuMDBPqsna8aNuPPV2G60x9ioDwCW1OIrIRYzzrlvga4EZ1tN7/bCBD9EYBsn2qraZKtQJEC8V+8ZoTF0M8KSjhdEVDPWv5nkN8Qlnq8tT7zztMSXO0FDQI+I1cK/cGIQGIa0Hphk52FyPZFc5wUIbvLzRkSlXsj9OZGKvM0hg1QqNZ7OqRtC3D9P5p+5Pw28yPZbUZoqPtivQ97qtBp8f08sqcKpID4V7kd3OGIJ/puqeAh5z4/avBRbZXgqyRS+Enxew7n9Dkynq3x5V+3r5gOkalAKJUx6q07LNRG9Bs7LcmQuEehBNCwgfaHOYCK1Qu3OaUnFM2mttoxtbM93t0S1A/zsWrXWLBbqtxgZyvOKI2yGPKDty143YMHyQjvEt5dceLgBJAF94yrT/E38pmWnxirZ0bpZTL+kvaBZviFuTT1DcZIh9irPEkN4GUf0ap0bSt7EdidylnSzlZhntL6XikZ4IUJaARsr2EB7Ay9Xa7bxKhw1OwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199015)(36756003)(38100700002)(38350700002)(8936002)(5660300002)(83380400001)(86362001)(26005)(6512007)(6666004)(186003)(1076003)(2616005)(66946007)(7416002)(478600001)(6486002)(316002)(66556008)(66476007)(41300700001)(8676002)(4326008)(52116002)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C2gV9yX7hbJqWbAxhv3aJwy0om7NUekdI7zNCSHMyCJUtUc3QOKXVNdp0Thw?=
 =?us-ascii?Q?ar95LEU03XW51UL4CyPbSOWGx3Vez9mCuqz8gjpGDxDvQgpqatxpr0FYU78M?=
 =?us-ascii?Q?ibmx5Wq9YuIQQvc2qb3oSqc9jPBI1WCtUX1ia6d7wtz1yK+f91NAPKuA5v3J?=
 =?us-ascii?Q?bBR/QI2bnbucRZLrjiIhe2X1mevB2FdPL/xnxsgNIImpyWQF3PcopN11qeeC?=
 =?us-ascii?Q?2MRjy9+ksY4jGgoNqTN42upuRv7FxEr9/JQd2HvuwDKixeQdCdqoBqF3NAeA?=
 =?us-ascii?Q?fS6Td6X5M+ql1WRggwlrujZ4D/Qsaked7xzFE775tzemU9gXXOMjhwwb4n0T?=
 =?us-ascii?Q?QGx3DZrlk9pnqVGll83dm1vKeobr2TesWwLzSa0yjWyzq0eDy1O2FHzmb4om?=
 =?us-ascii?Q?glENI6+Pdh5thJwN6zwuVlySK4XE9HjZc8fSe5gFAaQasIMq1VzgN+c5uJIM?=
 =?us-ascii?Q?SagL4GtVUnf3+EZgPA6IvWuQGsP/n49sg24VC7XCGiNZ3Rz96xxA7tzwcuNu?=
 =?us-ascii?Q?GDaxDCSZ/vUw9KsfmJCQfxvHRzOdV3K1L2tL5iaMEOX50wO2QxJuB3uQZo5y?=
 =?us-ascii?Q?v5jnrtQiXQfhL/S34g1RWxSmRRAQ8ABt7XLECwNZJOPXYwxEUVnhjHp1VbBe?=
 =?us-ascii?Q?dBFyIOlico4LmiY0m5pbX/MQ2gCIu7W74ojx49nDRcfnIFgDv0BuwksT8tfN?=
 =?us-ascii?Q?3FIgwyyAizUWCaiHi7ohuUOxLBhRjWIOHXfqi/SsGKgvgCLrLcNQ+wjb/A4k?=
 =?us-ascii?Q?wbfcd7azr943niM6m9w/26GaEsWovFXPMF9t3VtCldQZf4nTbEmNIPF8pP0r?=
 =?us-ascii?Q?vEJSXI17eMFcKECFfzUWgPUHMQego8jAfAtfZEoS9F7GhHKomQs/IPzKUPLP?=
 =?us-ascii?Q?kSafX7mkKmfGhn57dubYRh85Hyh1mQ+9F6xpkGC4Skr2Qza3E3JLrVV7bVzf?=
 =?us-ascii?Q?ADMLemiwjLoEWrotccRRLMcRWTKqs4b0SYR3HJnIZ3X6/XxeK9Ya4unkuIIE?=
 =?us-ascii?Q?7E5DKQlcAHgTpXu7t/XbXNQc9bmxxfHZuqgwlAJ/+ryTMK6pLgQ6AU7wjX2s?=
 =?us-ascii?Q?QSgSrdJpBdDAcdzMyYuWchgyF7ShOlsMUN+4L0xxoGrhsPBAeD9WM5IsnsoO?=
 =?us-ascii?Q?mpcqZ8GCPbc/fpluBDNpd8WhzXlbsSAWJd32ipPnBk2BoOAJgZIMxXVO5SDx?=
 =?us-ascii?Q?6I21S4sFLumDi386cVGa+SfU53U9ggYLe1YMI1gsqorRdB11kLe8c/PAdvE/?=
 =?us-ascii?Q?0zmFZcCoYmKP/Oo/9rk3jzYU3CMmD/Nj2TXe5r5Y64RH6k28Q4Yzsx1qKC4n?=
 =?us-ascii?Q?YscDuf1CDTQ18BJCNI1lHDq4E3ufc15WZGpn64sseptEVhPtQjBFLY35l7e/?=
 =?us-ascii?Q?Ev3BmYRMXtPMkvmMUJUTIAS20jcEGVzV6GRck9bEr4unD4Kb0K9Pd/fEBWwb?=
 =?us-ascii?Q?m4bLA3LOfn0u8xTkVyuciAKvmZwD0BbTOlTKIyHfkt6V8D578cLhomu5tTYL?=
 =?us-ascii?Q?NGa4u5uBPWASJChe6zn0MJrDot4Gh/r4L1QZQ8lEGg93ULdOBtHLz9NxoySu?=
 =?us-ascii?Q?GIs3gyKmt8vpBI90paXBT7dNJW5J8ZvOtCzpn3sn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a14b09a-180f-4c47-2c56-08dab02112e9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 09:22:12.5901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RmLkOZUH7BCgxM5FnFF2aWQYSRIzAOMB5wizWre8QRhMBFpHrp4F1lUnCrDIfQWLImmPkgZHSyeag9s8XtXeQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7188
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
Cc: tzimmermann@suse.de, marcel.ziswiler@toradex.com, s.hauer@pengutronix.de,
 Daniel Vetter <daniel.vetter@ffwll.ch>, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, laurentiu.palcu@oss.nxp.com,
 guido.gunther@puri.sm, shawnguo@kernel.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Artificially use 'plane' and 'old_plane_state' to avoid 'not used' warning.
The precedent has already been set by other macros in the same file.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v6->v12:
* No change.

v5->v6:
* Fix commit message typo - s/Artifically/Artificially/

v4->v5:
* No change.

v3->v4:
* Add Daniel's A-b tag.

v2->v3:
* Add a missing blank line.

v1->v2:
* No change.

 include/drm/drm_atomic.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 10b1990bc1f6..bcd6ff9d18e1 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -947,7 +947,10 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 	     (__i)++)							\
 		for_each_if ((__state)->planes[__i].ptr &&		\
 			     ((plane) = (__state)->planes[__i].ptr,	\
-			      (old_plane_state) = (__state)->planes[__i].old_state, 1))
+			      (void)(plane) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_plane_state) = (__state)->planes[__i].old_state, \
+			      (void)(old_plane_state) /* Only to avoid unused-but-set-variable warning */, 1))
+
 /**
  * for_each_new_plane_in_state - iterate over all planes in an atomic update
  * @__state: &struct drm_atomic_state pointer
-- 
2.37.1

