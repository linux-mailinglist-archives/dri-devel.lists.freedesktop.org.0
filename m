Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF185298F4
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 07:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2811510EB65;
	Tue, 17 May 2022 05:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2113.outbound.protection.outlook.com [40.107.215.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDE210EB65
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 05:02:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1+cmvwkQJfj3cAhJtmfIDgiZx2RY33pktMmQttZFnpGkTFJD4vNAmZhHEvuwPezDAXQbWZqZET1gk66YyiUfHCpSTSXga3iXSiAlkXkzwg8MjV1/FdTqQw808YmtAGquj4CuvjTnEP3xIF6KoD0va741L66RbB2Mgze41GSl5i0pvYoOlRPr7FpxgKevhTUgPEAok5bEMYoeljBOtExqA3OGhuo45nYA2hI8yqmRzksrONr2qWbgA41NUjRQ/MqBx262sCLvQRNYyNVDKEvwWNOuhpDIRQ8jRjXQy5pwJzwlDf6+acYTbSlaXmZxYx8adcFL884vJBuXvwD6kWtEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FelbmIHjknLKG8fl0j/q1Kw/+XnwOQZ4oV0mhsmi5k=;
 b=PrsDN+qLB7TIVyQJ9sWc5cdOmsZyAd5zYajHXFBQol3c4YugTawsepY9OdI6jhCyn69mhhsEXblWL4hsYsvlWk5izQG97ie1YGtXOECWxK3PP6hiW3jOoJRYcJxA/431gS52Y4Ae6HvysvyR9HQB0LHyVRkZKwITpx4Hg4GDgnJ7TOyobJFcth7HPwkIRHW7bE/Zjxwb3gAiWCJMz+S8pg6LZvyZe8vPdJR7KwCUNURrNtx1bZ5AQCCN2fLf/3yFz6IY3j/2ZB08zZp3MtTS1H+VE2yCrIF1D8yENKthAruwwNW4AlO+CB6lAt9EgGa2pD6M4POTLokSgmNcB8bJjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FelbmIHjknLKG8fl0j/q1Kw/+XnwOQZ4oV0mhsmi5k=;
 b=gtaKB2xQP5RYR1cMphJYt5k2BGqCYrrjDzTsU7Gb4LjhXeg/eusXcf0YuhZvAqziJl9kx57BLabywtpGTLlohEoHgKbK+rq7Ko4WFeaLZ942oP2xeK2ouHoO01B9jOOYmxW/pli7QI/vUOluBxXdo+T4T7tYNcY4tdJLRyvc+iE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by SI2PR06MB4235.apcprd06.prod.outlook.com (2603:1096:4:159::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 05:02:33 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 05:02:33 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <narmstrong@baylibre.com>,
 Benoit Parrot <bparrot@ti.com>, Cai Huoqing <cai.huoqing@linux.dev>,
 Arnd Bergmann <arnd@arndb.de>, Guo Zhengkui <guozhengkui@vivo.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR TI OMAP),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm: omapdrm: dss: replace ternary operator with max()
Date: Tue, 17 May 2022 13:02:06 +0800
Message-Id: <20220517050208.121488-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0098.jpnprd01.prod.outlook.com
 (2603:1096:405:4::14) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c5d489d-e7ca-4b1a-0dfa-08da37c2737e
X-MS-TrafficTypeDiagnostic: SI2PR06MB4235:EE_
X-Microsoft-Antispam-PRVS: <SI2PR06MB423570D2F21D8331E75B2BAFC7CE9@SI2PR06MB4235.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kxWi9zaZNQQpU9409p0PKJX/c/0r/vhptSff/s0Nmzn+/OD7NU8r7lQ22lAd+rwbagLfNuGn5R/TSWfg1c9HBOS6aOflDXo0La9iymkF9ubMUNfLhu/GOv2SrhNLfAXTK27qBo90U4wVUIrD9EBm33uC6RNrTj8USOzNvge7lmou2iJbfvqIiuFXLhxqEp9gY1HKzlLWmxQxQsOMTUrrXFFmD3MDbBD2wjsJvltJ9YKqk3731YUNH3i1VPLdFxb7v2jFd0mzt147xxtFF+fyqh1vIESzot4qKnT0Y0m6ztZqsgq3h8PcV1k9bv5piO0nUvNIkVXnkenhPfX6RUZwKk1Gs19YwkFjz6YV0WHuGha5t00BQ+pADV0G9DZZpxjtPOSGST4vugsPv0LI1QWVdm4lVOyxAyh/Ttkcw3JTrZRNXqrFOGwbbTQPXBXtlg/cSncsbOzGl6Cm7Yysjr0XkRoH5cepwmtXxU0nZpaXVBbSC502M/75old/1+tZWOFO0QJO3tp0azWbZ5USgTNXF64PHAJRo1swkbcI7qXZAg27iri/LZCe/eQGPQPzVnAGpjDEzrkAD156qhqYhPWGKmV7qSl718lU2bv1A6LH4Ky0be7Zy0KmtqkHUstR1J9yOSTgL0Nea6oqnlCxl8SaLkvvfy2o0sVVIZbxcO7tvWO24QlJ4SiGrTJzghTGX6Gu7CJarEIoRGL7fuOu40dqnuFqSfex5WP8JlhpjtbvREHFhuV/+ASaN0OQ4cIVa6XIsvE1LXZ/sslk9ZJ00h2gcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(4326008)(110136005)(508600001)(6506007)(66556008)(66946007)(66476007)(6666004)(6512007)(921005)(8676002)(2906002)(2616005)(1076003)(86362001)(186003)(52116002)(6486002)(8936002)(26005)(4744005)(316002)(83380400001)(7416002)(5660300002)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UFe9WSTgTFZeSVuYvLVADmRYHjKN/9MtMX4QtHvbdRJJSO0+nNdn+6iAhMde?=
 =?us-ascii?Q?FINd2iWsmkFdw6JTau3XsVHevHLfq5fIw1g5g8l7aq0OsLcrl1C25A3t7E3W?=
 =?us-ascii?Q?9WX4xenv7g0vP1V8sI8/McEa/pbASOprS49O7GSQy+3tHHPVvJjIc0Jeg8Dy?=
 =?us-ascii?Q?Da0Jf8aY5HsVUXO9ZFcQz3jKHMTW5cDZVT7TfTk/zcWrpul0/j3r4wg0kALc?=
 =?us-ascii?Q?LKnj9q+wr8UjzIzm7xrOlYIRxXiT2nlJSxZZ/bYjSeUlAickXIp0HEOwOaSJ?=
 =?us-ascii?Q?13v+XMiu4UGdXB/Sj59RFtfyKjr6BSCwFHEz4RlOwgvT1gXPBX1xGCQZ6Jb7?=
 =?us-ascii?Q?KranogsUSpMGzSW2q5f3UjSA5A+Af3Kqu8gIJZytJXaTxD1AgsCkFsHbPRBL?=
 =?us-ascii?Q?Ea+U0gmBu7YJoNVMlctIIfEi8D8gS+ntOttNAEec7d/JUuNbUc8ORUisQLL4?=
 =?us-ascii?Q?wP/f7BHVi1Sqe8OdOV6VbcFWI/0PUBkGWQ9Typok50k93EWILBJFN7an4I2z?=
 =?us-ascii?Q?WoMnBeL5BPjq6oH/hh8xdi58O33NZkvSoDVAQpNSGOdzQ1Dy4cYtqcvlR6oQ?=
 =?us-ascii?Q?+d4M36Lr9kazt8/HfqWi4leZchxydqzVmvNExgGAJ/UpumNitGbsuY93BOhK?=
 =?us-ascii?Q?eFEVcM1z+f6gd8ijobs5hF7lfjdjJIOTwJI2GKrLtqF07rrOEhTRQs+6Yo/L?=
 =?us-ascii?Q?Nhts2h5x9xb0/Y1/hHiD4/YjoxkN7mnKa+J3IRATbRAaNXMlNwOzNYJvr3gZ?=
 =?us-ascii?Q?flgeSZMaV1gDPf+Hzx+iH2ba2YLm4plX59Z7OR+0o8NRnLkVBNyWD3BlJQog?=
 =?us-ascii?Q?1sD9XVHCx23Rd15kZxcSZFLqQqHLf4y0u4/JofL/nt0Bw83wycxg5CyRD6XP?=
 =?us-ascii?Q?p8P09oqk5o/uPvOm4oQCLfR0Dq6+KLpAUtnHbWWt+fa9X7doA0o2hvOoOiDo?=
 =?us-ascii?Q?C6GZjgXYGo14U5zWFpcAX1lJVl+SjKTOnAN+ecUyrVV+c4UeuXAbex8qnYrC?=
 =?us-ascii?Q?a2ybf/7xfCeua8yXU7kVHMPakBYX6iihpRuGg+FS/8smZdDiL5CdFLS2iDIm?=
 =?us-ascii?Q?0d75d90z3JyMMXZLdEPTtettZ3sOPSxrcsVsyqytcTGKM4Fn8oC+khGzmgFb?=
 =?us-ascii?Q?0yUy0U3Ilfm/SQWb8pmEumf/v0nixr1UiCAhxOMjNrelaYJ+IRUhkURgpgVT?=
 =?us-ascii?Q?RPr9BH2Q2Bdf9COMtYwOO/VCnv2Z+ZyPxywXRpELengVz9OD2d5Mxs/UaSrH?=
 =?us-ascii?Q?o/ALRpwv1bahsIB22oyjbF57Nvcc7sHb1I2RA8iAeMhzjoKHx/oPgnSdifoN?=
 =?us-ascii?Q?DFeR1KphL6DUadrMkCO4aBxbDmmnCuIj6dzU2/Kvo06pZHFYKI9cqZz640Dq?=
 =?us-ascii?Q?XhNYg1FNR5ZOueyrJtv5Zdo0Q9fN9l2w9H5ZUAi2PbhaG9wugU39eJbpep+E?=
 =?us-ascii?Q?xloWKb8uMtAbWItSFQ+wXlOispgCLiuWSNSankl8s+nJtzbBFLsRUeCUk5O1?=
 =?us-ascii?Q?ZMmPds8ZZ9IgdMBORNDfqYuRRzbiDAGBp8YGoeMD/hoWzoDFIYULernvoEEx?=
 =?us-ascii?Q?jpo0m7vl1bh4ro3Xo6ikAbu6SwWlSWnVicNSzH4CRlFNSHU/urjAr/EZsXLl?=
 =?us-ascii?Q?nSnDV1OtHR4s8e661KFRArD8o0uw90Cnylvt3yWqeq2oA7scC3Inhh8x+2Vs?=
 =?us-ascii?Q?FS59RbS0iknhTyKloWGLQUmQOndh5JhM7Zna6AAEMSDu8V5s+JUObpJRhHIN?=
 =?us-ascii?Q?IYCbyOx6sg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5d489d-e7ca-4b1a-0dfa-08da37c2737e
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 05:02:33.0295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPIRnp0pQ52ydT20qNfPpjxIGGliNysNPWcmbuFUmiWYqPOrZ9HOdt/ccuZMwqf0OVQrzAulFow7VoFRv+H2sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4235
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
Cc: zhengkui_guo@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:

drivers/gpu/drm/omapdrm/dss/dispc.c:2454:21-22: WARNING opportunity for max()

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index c4de142cc85b..0ee344ebcd1c 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -2451,7 +2451,7 @@ static int dispc_ovl_calc_scaling_44xx(struct dispc_device *dispc,
 
 	*decim_x = DIV_ROUND_UP(width, in_width_max);
 
-	*decim_x = *decim_x > decim_x_min ? *decim_x : decim_x_min;
+	*decim_x = max(*decim_x, decim_x_min);
 	if (*decim_x > *x_predecim)
 		return -EINVAL;
 
-- 
2.20.1

