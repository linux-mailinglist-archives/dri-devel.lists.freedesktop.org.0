Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81C83199FA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 07:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710B16E14C;
	Fri, 12 Feb 2021 06:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760059.outbound.protection.outlook.com [40.107.76.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA73889E63;
 Fri, 12 Feb 2021 06:40:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsgiqMmqadRaDoHp5DMb0Ohxhbztqb6qYWrZaMtII7uV4EDj2plvPQ3klgMf1Zh+3QgusBK/mt/jn76g73yb3bc5C/OFct4ZxW+d5aMNHLcOyBZ1WJMCpuyArWwhWYfxrbhIVz5JeqCvXkKMr7SFk4/voehFMdr2k+2MGSpHXEut67uiVh56S/1BL2I1OpB5cBoLjEZkWpQzlM7pWIZ1fFXrp25xaUn5WC75+5MPyf5gLa9dHkAPXxjvday6r6VTXIVgbxBvvOJeGa4f2Tq/pgUjCjdtkhVMrPuGYaqC8Bd1jh9xHWstaZ3IQFpMW4l3a21GFhkq+guV/RuXVUEb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXJZnGfATmdA7350kv8gpaN2gzBNlvMrIzbw5mWsA6I=;
 b=UB5UJ9M1Y7XTuRC5i8YOGNQwMBXxiFm+f8h7/XrYfsVjA1GdTZVtxj9+yzkIhyYQN7V2hoE3BljRTt78o/TkK1hZ0WHnaBcPASVuX5tCcSkNcXJmmQ00V06W8eewFDBN5hRKlwitqyFIvoJXT+NjkJgDT9Xbcp/DDTnf65Z/ym6Mg9Z+iV085Ri6N2w1B0FDbo4RUDJ6GlSjw+YSaEQ21HokiBRFbOGgGyT0kZl9QZgLnzH8Lqi9g0lrXInevOWa5E5fkPnBZF23Ro0k1PF3BbHEXbHSQqfGfLfD+1xVAyhkk6TPPm0BG4NYhooorQdXA+CkQ5G8lDbV4AuWFOHOEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXJZnGfATmdA7350kv8gpaN2gzBNlvMrIzbw5mWsA6I=;
 b=HJf/C8Pt/jrH+dkx0kz1qHjl1jigvnsXcFTTWFHpDM+B2ojHV1H61aoj6pNuQCOFkP9pa+N5coVQ1fu1EkKX4IZdLFfTc9qoVZu+IGaqoOMrBKwOVilzXt3vE/cIn2JhFpydcrhL+nGipHme3etZg2Vx1uboJLnchfIGSZ5rXos=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4961.namprd12.prod.outlook.com (2603:10b6:208:1c9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Fri, 12 Feb
 2021 06:40:53 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%8]) with mapi id 15.20.3784.028; Fri, 12 Feb 2021
 06:40:53 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdkfd: Cleanup kfd_process if init_cwsr_apu fails
Date: Fri, 12 Feb 2021 01:40:34 -0500
Message-Id: <20210212064034.29912-2-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210212064034.29912-1-Felix.Kuehling@amd.com>
References: <20210212064034.29912-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.211]
X-ClientProxiedBy: YT1PR01CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.55.211) by
 YT1PR01CA0082.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Fri, 12 Feb 2021 06:40:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: da5a3646-06c1-40cd-f9e2-08d8cf2124e4
X-MS-TrafficTypeDiagnostic: BL0PR12MB4961:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4961F300B6759AF2EC5476FA928B9@BL0PR12MB4961.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:194;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rEv2ly817hGYMyHAEy/Usv/oeOP5nqCyf8bQ+Zk0Nm+KsiTTT9Jyo33L24YQvhpaxEWSp3hCgazMqWXhQFW4x2SFT7tmGZRe84EyGrMsl8UdiVfJKSYDMT5uUQoS++W6ORgP3iR3tw3aDIwYeW/Ew3bdaNfWSu7WKAWSX3Wltcqd40cbknbrtQAjBzsAA7PdtnDqwAErhCky7ndoVtg2xOAJ0NH+KQwzq9hmJP79VcK1EN+0EtKpX1KWjfElVI6i/Embmqli+jDhpCY7hDmtl8H0k2Vwn+mUKZVAYF7bwiTvT1pjXy8vNpgwYnD3WvhJ7VNutoNCrv9dVU468svP1lvXcYCHCvokR15gu65Ff6wpoSlA6Yg/0bjRwRlU5gEuoUDyYGavq1Un1tDiNI6C+nPA79+F6Ke/NRl+3o1n6mcltFFvsZBp6edf5zg94HjMPJuRvmknqiTUgMwq9+8T9PerxTdHX7j+VTDjbged7LJcitMAXsIST8JX6g9kbfxuHHNQqYUoNJFnWojKigmERf4rDJ/fUOSdUrgL59O+7ePvkm52088ebhiXUP4OA/f1IOYfCVflucsJPc6oleir4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(6512007)(8676002)(1076003)(2906002)(26005)(186003)(316002)(16526019)(450100002)(8936002)(2616005)(6486002)(6666004)(956004)(5660300002)(6506007)(66946007)(52116002)(66476007)(66556008)(86362001)(69590400011)(36756003)(83380400001)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oc0ICPI+m6K3B56UGqU4l7TsPzuuXLSy6C9oCfVAGHgPnvZT8NEG6TCRTEje?=
 =?us-ascii?Q?wWnn/cgldLs8/zdo2guA2Rx6AHL/PfnF+ToRZawyAWfBOh+42J2kwJoNH1Se?=
 =?us-ascii?Q?cXEeXfRK/2Vgz2+Lab8/Q4Swlnbm5VyMaQ7K+m5pLxyblUiY+rFRSR6ec9Wp?=
 =?us-ascii?Q?0JMD/z6Q0v8bGCcFtC/uPcdRyMxtkttyARycglDjdIZGS2PjXeE3TCsnvO/h?=
 =?us-ascii?Q?hJVwJHtxBowpu2CokH2W+2CeoUWRgas9xroOoXxoZkGKgGGaiW52G8MLg17+?=
 =?us-ascii?Q?eVJzbfROUKMZ5VqxS4bzggbJNW+MMjQut3T3rzJTGVhgJm49U5oZapam/+bF?=
 =?us-ascii?Q?9iynPePRBAz8yps+C0A1f7UTm3dPj6193XQL5UEYlfkjBQDX+5yWhjOltHg+?=
 =?us-ascii?Q?RU2O9dfACL05LYN8sA1sKzi3ekg3P5h+e2KkHZbtW3PHfuF48Lptfsb+UZJY?=
 =?us-ascii?Q?Z4CMflE0x16Ak1/j7YpMRNN+lO4fjxugYobi+GIYNVjPFpjPrAIPHlijkXWW?=
 =?us-ascii?Q?FObeeZb2OSrNq+KiEycbRdpDfQ07ssImN1mgrnj2UK9rpyyPhq8s70SU9Gl2?=
 =?us-ascii?Q?DTpusDRR8OQGyu60DTf+i82PXcTAsOT9kQe06zTZW4abevon+E02ndacyf6F?=
 =?us-ascii?Q?aA8sWRGg4a0e9e6NlWMpoQhD2LfOzp69qMm/P8FL/wwfJKrn5zATKCpVjLAe?=
 =?us-ascii?Q?aFXYz9yIm+f4dPACN8H0tyYmcU/e+2NJjKwUrrnA/GtI2A7RUvh+FdBHMC/m?=
 =?us-ascii?Q?DPN4gPninUkOoxICLa8iZoLvXFmNufEOXysYnKQK/POKk3WSavFGHrC9OtyS?=
 =?us-ascii?Q?L575HtA+caHPW5ouYzJC6gt7WnsUhfukl0lMjyMSsPwM9AqbIwXrHaXLoGeG?=
 =?us-ascii?Q?re4IObguWIPnUWUUVXvuCMn3iQm5+4KOkYKJas+ruS+1Dz+qovj2EB+dWHC9?=
 =?us-ascii?Q?Z51ZWXu1VgpgY6Q/NFSqq+kza3d5CXifjEAbWLz6D/cru2f2F4fQirJBrdkU?=
 =?us-ascii?Q?4zn374RSqCSw+kzNWjv5fIIHR/gttiWvJXj9cDov/ZLvoeYc1fzVRmHr1L0i?=
 =?us-ascii?Q?r1nTI3glj9Lv2UKb3BokbOTAB/r+dB0T63gVCsFVUvXxEq2YG5lRmx1Mm3vA?=
 =?us-ascii?Q?J/2aPeAMnECWG/w0r+Akovo7VLsR627k/SwTOYpjzWFMwSTvZ/Bz1F45SevI?=
 =?us-ascii?Q?+nNAgqOy5bG4b6WR6RH7NBZNGTs62DurIJZSIe9FXv33pmOuL5g+KoFOGlk7?=
 =?us-ascii?Q?2qnoto3v0eHIMXkN4psJfL52FgdL0TbxPInWMk3jNeVbClR2DZQRa5vtrNGv?=
 =?us-ascii?Q?/SCTvRtMYBa1OPRvfi2tiP9M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5a3646-06c1-40cd-f9e2-08d8cf2124e4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 06:40:53.4613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEZluHSxm9bvHp0ShqbDnWzTMjNTtlPRy8CJv72E2JWteguYXm07w30mk39/XIJf3frqiHn4idxNW8EG6duJ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4961
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If init_cwsr_apu fails, we currently leave the kfd_process structure in
place anyway. The next kfd_open will then succeed, using the existing
kfd_process structure. Fix that by cleaning up the kfd_process after a
failure in init_cwsr_apu.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 145cd0a17d50..a4d7682289bb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -775,10 +775,8 @@ struct kfd_process *kfd_create_process(struct file *filep)
 			goto out;
 
 		ret = kfd_process_init_cwsr_apu(process, filep);
-		if (ret) {
-			process = ERR_PTR(ret);
-			goto out;
-		}
+		if (ret)
+			goto out_destroy;
 
 		if (!procfs.kobj)
 			goto out;
@@ -826,6 +824,14 @@ struct kfd_process *kfd_create_process(struct file *filep)
 	mutex_unlock(&kfd_processes_mutex);
 
 	return process;
+
+out_destroy:
+	hash_del_rcu(&process->kfd_processes);
+	mutex_unlock(&kfd_processes_mutex);
+	synchronize_srcu(&kfd_processes_srcu);
+	/* kfd_process_free_notifier will trigger the cleanup */
+	mmu_notifier_put(&process->mmu_notifier);
+	return ERR_PTR(ret);
 }
 
 struct kfd_process *kfd_get_process(const struct task_struct *thread)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
