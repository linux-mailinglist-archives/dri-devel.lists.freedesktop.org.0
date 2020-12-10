Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C528D2D5555
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D483A6EA37;
	Thu, 10 Dec 2020 08:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70079.outbound.protection.outlook.com [40.107.7.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3126E3DF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 05:36:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0xwFGXLL/gsq6bXAAa1RcnLdOYqM8yij5gVPCxMlLdUCfGhtcMQSJABTrcOj8pq9Yynzs9QGOWOxXHnOrvYXNbSOmj43ElxnBC9SuxOLs7/Ve6E3EccajaRB3M7WlXWMQ9qtS01YEJr4N3N5Tpxphi8uEr7Irv/3lMK32rPckIMb8IwBBzrmjSiP+I+1QC53F16PF/DBSMTT9CY3qV1RMh0AJXIZCRwgJu05IdkRDNiCF951BG2TAM+dNwaJxu615jtvint16fn/jR7gLD27NXUiHCTVCMoHxUb8u951m+UjDr/qUq1UpHJ6gtNMxRu1hbmrj4QUx7FVdq+qL7i1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1T293Eoy+x+D3fPoUonzHQ7d+S3MMeVK+ryLn5B98AU=;
 b=kW8hpy3wR4XxkFnAFZb9ocGvdLl2T+6dpt1k3hgR2ezrPY7D5jvvCGLEgjK4Z45bG7BltCdEwSYynrRtJ6CkXGPw69qGm5B8JZevdDQqHETirSLPCJ+Kva8uGxMApdypQw+e8BDJCYWanOMnoEgCUB3dB76iLIPjRJt85R2gij/1qGvpaUMBVNcQMJzUq7cCltRBEp26l5eDTLQBZY2Sk5/2o+gCPNimizDAibnn3CewUTQZeZIrCxq4xGevGMrAuRdwI5gT79qVY7BVWtz/U1Hf58VtFXRfsfa4Su+z0BEZMv4tbnGKpYNLeVAOm92CMX7/rM1nQIkX3J+akgJcIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1T293Eoy+x+D3fPoUonzHQ7d+S3MMeVK+ryLn5B98AU=;
 b=sSd/EX6+EsC3CM/JVHnrEBA1gGhwfJ1vCrPxyjDyECrE/4BY5R0tDiaa45OTvIfpSFmedSTKEYjk+Eu2IlJmqLXycH2VDFqG6nn7fgjxWNsBVvFWffBH0x5ptmCiJPwIgAlFHN/S7snVUtBwS2Q8kmC/I0WDB8zcuxkubAX4uuA=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5454.eurprd04.prod.outlook.com (2603:10a6:803:d1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Thu, 10 Dec
 2020 05:36:23 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 05:36:23 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] drm/atomic: Avoid unused-but-set-variable warning on
 for_each_old_plane_in_state
Date: Thu, 10 Dec 2020 13:27:29 +0800
Message-Id: <1607578052-4316-5-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607578052-4316-1-git-send-email-victor.liu@nxp.com>
References: <1607578052-4316-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 05:36:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 90907550-7fc3-46bc-4051-08d89ccd87c9
X-MS-TrafficTypeDiagnostic: VI1PR04MB5454:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB54545531D6CCA8625AB9A49E98CB0@VI1PR04MB5454.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O+Ec9uRyJ6xaUGTvITewPuxUfecVfbxN1cx6CD/HztMDMVLN/g5U1M500W0DTsiqoZK/rclXfbv+8/40acykeA01fLD1wGziJFTLS4zspDk0iHCUsqSyvYSEXiDqT6aG0nfsO1CfPQf+2afMr6plSIeEtfCRUcEe3+OQY3ehekncsQux2GxD9Jm+/yLAFDs+Ktzkhbicb3HHCw3Bh5rVrWFMnT3ksNDDlwa/aAVw4fXUiCNQJeeHmpEEyQESi9/slv6kVAJwBjO5zdO4eEL+5dqc41OcfCfi6FSUs2oylfhgq2En7HOvdVeO6OOJ33cj8NpJOOarWvQgCQM+bi8enAz2MPdAxgUSs2pLWWKkw9SwOa9JGA7C7DGoKc5qqJidLJCTdzDErkx2lLK5aXCVuYojvADuY5lk9PRg0wiCqh8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(7416002)(6512007)(34490700003)(52116002)(83380400001)(8936002)(8676002)(6666004)(66476007)(66946007)(66556008)(6486002)(508600001)(2906002)(2616005)(69590400008)(956004)(86362001)(4326008)(186003)(5660300002)(6506007)(26005)(36756003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?139H6pVh1rzDGz9/5sw03Dhdt+tt94ltcAFIl5dYOMCmFu8E+GBP4UrFRZmy?=
 =?us-ascii?Q?5urT0b5zfrqxYOmbi/dnFLby7lb1AxLiU1sPl8CojLkUwgo5gIkGpcTT9Mxw?=
 =?us-ascii?Q?dPRkBjvipRahpXhhxXsdJm23DlNyzrwTfsN2dTIB50Qp618YbtvFRrKCesHE?=
 =?us-ascii?Q?xKYhYAuZa28mFmBUgpzKnRtAqBOOvg+m3oMUfL0D3CayJt2dvXrq+6ctKIBz?=
 =?us-ascii?Q?0xZ7BTySaykFRnPJLnQ4i8ttOBog2+dXkTuFoAECKLEcLA+8ChcbQ3+MKPZG?=
 =?us-ascii?Q?retglcR1X9yPFQ+YxZEyVv1tUdYtU1PZgb6MQMdLkIDszD/MyGwhcsy8sx4Q?=
 =?us-ascii?Q?ptPxXFkOWj5YTTfGA5KjUMzko2FNv0XkKd+BIuiSyrvY0yvp4CD3aYsyQQrB?=
 =?us-ascii?Q?8R+DpX7pBcvVM4XHqd24zURBK3hIhoqBjYBWRp5XZjw+I6RBCQ4pC687t+Il?=
 =?us-ascii?Q?iRC7UOBPWhnPgoKSmWlk58Z0MOZW6A4xd8r2Md74567d3s6iiIzlTz9LVS3A?=
 =?us-ascii?Q?hIk/moI5ngsNNvFX/gz6bqk0MZp5u8q15b3DNWI0kCkYvvz7OKEt8cnODYwr?=
 =?us-ascii?Q?NgOCoUsvh8r3P18r2I7Z78Fv/if8LAZYYEMJwvloyoZuscCGFwnAzYAzOVrP?=
 =?us-ascii?Q?Cxl0C4GGAQ6EavobKgNNX2BlkEh1aKik4opNR1C2Hp1Qm9GSW4GzDETN3Tmq?=
 =?us-ascii?Q?WEu4YtMDXU62T8ZwazgYJ92wMAxkmC9gGxPc/4X07mQUV1whcedda30xf0fP?=
 =?us-ascii?Q?1STa7WbPgRwIMV0WTMfLPfFWhSW5/1H0fnunG/oViMzaKniwNCUti4VUqn5N?=
 =?us-ascii?Q?FWAkWV9kG8vTsoexQjS/9Leb1qE5+4CYbjfqBHAmvFm/xke8i1w0l4tQuTk4?=
 =?us-ascii?Q?vrgBhyR31TK3Mu4n+cOiG0gapaA8208Eeg7PkAlCggJWexLdrZm8UwSQGgjw?=
 =?us-ascii?Q?drs30VpIWq2vW6Pyb26PFvCT+kMjsR8JVO6+WOsteP5JlFM6iBzH8wtZSTx9?=
 =?us-ascii?Q?+DMZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 05:36:23.2367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 90907550-7fc3-46bc-4051-08d89ccd87c9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DoWKkcVpCU5vaOvarNk40jo7edjsq1xADV5l1vrlyeiNh623OBUITbqmtjJTQKrN6aCNE3GXnPNyauXYRqs/IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5454
X-Mailman-Approved-At: Thu, 10 Dec 2020 08:25:40 +0000
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Artifically use 'plane' and 'old_plane_state' to avoid 'not used' warning.
The precedent has already been set by other macros in the same file.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3->v4:
* Add Daniel's A-b tag.

v2->v3:
* Add a missing blank line.

v1->v2:
* No change.

 include/drm/drm_atomic.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 54e051a..2e087d7 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -888,7 +888,10 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
