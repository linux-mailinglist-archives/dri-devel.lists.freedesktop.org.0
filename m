Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D2150DF4A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 13:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E29710E5BC;
	Mon, 25 Apr 2022 11:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2095.outbound.protection.outlook.com [40.107.255.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4966B10E5BC;
 Mon, 25 Apr 2022 11:47:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+oOjNPqshV9oVkxM7aq9fB4irrlTPw19URxbDFT+SynuSVS5IP+b8kM0AYUaMJeqJ8HleUnk75tq9phBMT++YnzKcbbi7n7kAGJW/lLunNnqifgnsph1A4JJ85uScP0n/2Xh7CURmJhiiIis9aCqTFQVMW41mO99Xjok2Y7pvGmBuKZpCst6yz4puhx5ceT27fEqUzjQM62DkmFHCveI2cXiU9te/GnM/83x+wcu3uDV73KtJrz6gUKwVRXaSynAEz7g/cPi7qsPKzscbRYF+FHjcSIDS3pembWUZwqHtkR3mM51pgBnLqgtvtFR/tnyQmZ4e5iMT/G0F7cdCwGew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RNMZvti6cF9BF0twlYEMXrEGkQGfoSnG7++LAnMN94=;
 b=d5O/0+sXoZ4k7qmJANgswY/TJz/GiQ218BPBNqddrNWGigUfESHxfsq6mr/ZjqZzvfMx8AxBaqyqqK+MnXCG89N84lAPniftpkwY3i6uqZHMPrASuxyOvSFH7TFZy6DQsrTuiFcaXCUg8SLcV5/kyEt4XL6Li8Ags64WDV3XTIwxjfZVDnuXcPa94r+v/Kihnzec3caoNSgmSvyTPgUNs40b5gc0CNX/WtsgKsnPnT+hUQM0KowKV7BDFgRfsaG3W5/sKIgy2a/y84DKsYEZo62TTzc/4h3KV+Z2HPtswGVIdGKOq64Kkv8d/lmV2/qeFJpC4BmDQXNOhrdiEgVq1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RNMZvti6cF9BF0twlYEMXrEGkQGfoSnG7++LAnMN94=;
 b=fJ7Xma+qUxXfoxk6ThJfFSE/wcgUWAMP/IZauyeIqP3CAPItX/06Nbzx6iN+ZG/Ci6GcRR6No8/Vg/8YIpgPOfCCZ+jxx57CVuBFEybrgLW5Yx/kAM/E2n/QIrioEAybR8MuDtLjYv2NRbAU2QfVs4J+9F+Aux6IyxYwM16X4P8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by SG2PR06MB5155.apcprd06.prod.outlook.com (2603:1096:4:1ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Mon, 25 Apr
 2022 11:47:28 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 11:47:27 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Guo Zhengkui <guozhengkui@vivo.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS), 
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/nouveau: fix returnvar.cocci warning
Date: Mon, 25 Apr 2022 19:47:00 +0800
Message-Id: <20220425114701.7182-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0005.apcprd03.prod.outlook.com
 (2603:1096:202::15) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5aab1f2c-7b6b-4b87-6c05-08da26b15f3d
X-MS-TrafficTypeDiagnostic: SG2PR06MB5155:EE_
X-Microsoft-Antispam-PRVS: <SG2PR06MB5155D3C57EA9EFA6F28099F0C7F89@SG2PR06MB5155.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ySKUDP62RLL6m/W6i0C/O9JP5fMDLFsmJxgEfgxcmTWvY29xrL1CzGZZdCQxZI5VgWNzqkOgLLIhtcH6beEDyoLpgzNvaVr0wbSEbfG34Cu/i9+po2y54Bg6mGzMmil8v1wdf4VG53owQP5OrjCLIoNJiJlr5Zk41cQwbcFyWtTMG3Zg3YZ1v+p0dWvNX5Nkeq8NTby+yNNcL+h10F2jlRMsWyW2ugjXh5stKAmVj47u4L/9SXFOesID1CO6Hyzi3ARXNp3pQW9+B4Djf0Vu2Cj+PlXz2YvZ8BG/A9wR+pvWNopPeuV20387yq66oG89SIQAAM6X/1zOXls7E+waXRMmVXJmdYPfE6wP+N2iyu5YUShQ3G7xgJwFF4ahJwYu+YZtr+Zq6nBOael6g+h0sNBgUtas1VgLRyLw6A1As53WllLx6z/H96BCSsTrP5F256s+SVOAdHe8UhpSoq9kmQFmy6M/4jIj0En9yMbiwAvBsprxM2DGXfkusblrX3V012mbFy1b5aJZOlVBemmLpQJtKyz1ZYG1CcyVCwlho7D+NF94f6MyMBe75W7ydO6T5M4CkG8t9MCninoby7J4D533nzLJ8phePL+U5GXArf1IA44bqB1Qrv1K2ctjks65n2t1LX4X7voBEQ0aKnw5Y1D+bvK6uD/9xVAGD2o4q+WroDBKO+8J/X167caMPOdcQ73lRuccWEa4w8BiRiQKTdjtY6Slmn444oVrpWSEUqEinPIM0hiSfU2PFKq/ztzh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(86362001)(316002)(4326008)(8676002)(66946007)(5660300002)(8936002)(36756003)(66476007)(66556008)(110136005)(6506007)(52116002)(6486002)(1076003)(6666004)(6512007)(26005)(2616005)(38350700002)(38100700002)(83380400001)(186003)(508600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cfIrVGigaq7GebUFvWelIhFcoVEBszu+EuFgMve87Hvag+eUOujL9kbPX5BP?=
 =?us-ascii?Q?B6XbKbnLjiv/ejN1aCNk3tVVWi5ILiTXeQJEl+wuhWIKDr4Q3787GVRyMlMh?=
 =?us-ascii?Q?PUi9vxKgWUqo3t3vrEKLnsFqYS++1KXH9ew27UpZuOgJqFpLJ6dKAl6dUVZK?=
 =?us-ascii?Q?O21P0SM/b8rNETy80LAKuaXBheDOe4NQgcrj/lUU2Ut4zuvxbVX1Qj+VcIG0?=
 =?us-ascii?Q?tOhTgMz8swFKcGNp1LXgammwZJMRFLZOPY+w9Tpi/VoUCndMbaKbeH12RIfh?=
 =?us-ascii?Q?XrUNlOaA5uoBOxKFXlr3c4r40QmcQGGpHllY5Bj7icn9dExzrpz9J/pyw1D3?=
 =?us-ascii?Q?5jPjQLRUTgeZZIGMdoo9O1GnGq+5PCshrZ5CBTn9REfCqV4Yp24HQ1n8Qh+d?=
 =?us-ascii?Q?Sp6qu5WI2MCyjYYrpFt5ZOQWmTH1NuOPv4hNFhy7b8dbKmxlwG0rbhku2XAV?=
 =?us-ascii?Q?ljWHUUU+/rXwh0XjRkPYNFqhNy+Qyt0TOjuG+mr7ps+fEPbhyugthOsazhxg?=
 =?us-ascii?Q?dsefec+Ui3gaBsbmOeodbQvva2JwMM4uZOx5XSIbIZf4X/ei+O5ECm4iwLwi?=
 =?us-ascii?Q?GGD5rfKAv51XEhlhKuo8KhN8l3plCA7aYbFO7y5lbqsNX5Vu3AWRr8g1BhBX?=
 =?us-ascii?Q?bJHmk601fCVkmk23Vk1skfTcy4QBEOzkKVC4W27X3an3Kyhg+uLJt7FAePNE?=
 =?us-ascii?Q?dlMG5E9WdOxat27bhOeaN5Ij+43F7OXiWA5kcpF/1at6ANFKv+XAcKvLJf32?=
 =?us-ascii?Q?NpAyThMWryvGePHfsaUJBbENRhlJd8ub+WR47TLR8eAzho83XCmZ2F2z3n9i?=
 =?us-ascii?Q?tuFcBIJknSJuRLbeNoL7bvjsCWtD/d4jyhXsAQdSRT5U3V7h+ShAPlj5Xh6m?=
 =?us-ascii?Q?PHraFId79J+juWegp+g2WI2unq7FPg0spApHb1OLspuLxGtkvUk57fov9Prk?=
 =?us-ascii?Q?c6ZkeZ5p8BoYtQJ5CJnFrqFLyIamnUVa3lPD2F1DuBmLXpA/tYODwtEMHwWH?=
 =?us-ascii?Q?HNnec1JlHEc6X/o3qpI/kXOjH6HBGL3wfzfmD8M9HhJDMientDoLOSXcykF+?=
 =?us-ascii?Q?ubeKNzLbfZqVljtXvwLYKP6SMPTqAn8yQ0t/o7A3+H2VCcigLwUXtsAzefEi?=
 =?us-ascii?Q?8UaNQA2+c4d9N7TEKItYjU9co8oaAB45ryTToAWBjyC1TZhZQFRHTJKMndWm?=
 =?us-ascii?Q?oRepntc557Y5lZJ+k+8y2a1WLwxu8AniUoN0X+4TH7HVuShvlbTljmrKXXRu?=
 =?us-ascii?Q?UTQPVvG/LFZHnqqeTh/jB05hj19sVyOVUkGqaPjz9/X4jDZKA+A9YHco2BFK?=
 =?us-ascii?Q?lNwqn5YtRVeM7aHJdKDEy3AQN55wHCj2pzJ2AiyD7EWIf/2lh4a5YNBp+pS3?=
 =?us-ascii?Q?dz6ntFZbCcYOZXxBp37qDxC4hjlpUm/PT7ZYOctnNZteCko8/3Cp69m64GtP?=
 =?us-ascii?Q?Qmx13sDsJMrdqvVejYe5fzCObbBnO3jiUJmz/0io6Lf96FREwRXAQcM/y02l?=
 =?us-ascii?Q?iJurqS9BJmgPkP/m9V7mkgpI1lg/3+OQGUWoa3l7Rij3neaLVlyWaqb6x/dy?=
 =?us-ascii?Q?VDevL5y3sqxiDHOfo/JzudLtDEA6vXxKanMC7hDR5XapY3uO3pV6t7wyd2yB?=
 =?us-ascii?Q?y560Bqqd/+DkuuZRHUtai/B475VIIpji0bG6BP7GRjW0GmC+5LM31X0fEArI?=
 =?us-ascii?Q?bWcA9FlXe290nO7rFdx4Y0jP1YO6p43rybdLlphqMgLBIWYkH/iJqrn288pK?=
 =?us-ascii?Q?mjLDOLJi5A=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aab1f2c-7b6b-4b87-6c05-08da26b15f3d
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 11:47:27.7305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2b5iMpYHldlwWUrz5n3dQR7AsH2o9w5hJKZ18LYXQbD9067kMH9hyUHzVxCnLO4JAIP9dtbXsHTZss1s8L/KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5155
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
drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c:71:5-12:
Unneeded variable: "disable". Return "0ULL" on line 85.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c
index dc026ac1b595..3d0ab86c3115 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c
@@ -68,7 +68,6 @@ gt215_devinit_disable(struct nvkm_devinit *init)
 	struct nvkm_device *device = init->subdev.device;
 	u32 r001540 = nvkm_rd32(device, 0x001540);
 	u32 r00154c = nvkm_rd32(device, 0x00154c);
-	u64 disable = 0ULL;
 
 	if (!(r001540 & 0x40000000)) {
 		nvkm_subdev_disable(device, NVKM_ENGINE_MSPDEC, 0);
@@ -82,7 +81,7 @@ gt215_devinit_disable(struct nvkm_devinit *init)
 	if (!(r00154c & 0x00000200))
 		nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
 
-	return disable;
+	return 0ULL;
 }
 
 static u32
-- 
2.20.1

