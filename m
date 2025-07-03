Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91814AF837B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 00:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB4410E90F;
	Thu,  3 Jul 2025 22:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UaUmtaID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDB210E90F;
 Thu,  3 Jul 2025 22:34:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tsVg90/9Dh5Ki5gMXH+r9WYXDP54Qf/3sh6H5qLMU511f59aVC78CckqK2Yub1b0dESySBrcUnI/amnZpPBYYJPOxzSNgXiDxNMQauggJ5ZZQIRNN/l7nXL7T/3iyRbBNVm9eGdk7JE+8e5OCXhhlYFQVzOUhMBxrKIPYHJHgnxdsVxrl+g2FG7ErzggogTpfRMlweFFHGiz62l4kB3hLdkvGVvb+fhZTeikLe9sSL7q2HShWk77hfn+R9zaXkTt9LTftkAFp4TSXmmwrNwM+gb0Pn8dvZ4SSXfyMhE/f1fcOzrTlMCQYrsHBTNxCoH3KJU6ByMdHyQuaN1FL8QXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsU5c1B2SxrqrZ/wT6eddDua07cvQCp1kcMg7OImxC4=;
 b=XpO3aK7gyuBz+6maEUg8R/mbOg1NGPClO970qwtJrS0mYjFr1HMgTElDGpEdprUo+9uJ0Gmv9x4J1ypUNNuQyRqpbLC5kCytouiGBhO5ta9eL7gYSpTLiNBmVSauT+xO9Z8z1r2AWSN16GGt8NijxoqiHUmV64T3xJ3+ZwHCkxnSXw/NgryG7Dw05NXhxhLzD0gSPUN4kW/fsKUm/VOH6Lgw3X1y5/3R9k8/z5pJd64A4LDpiX0JxyKtkGaWkbTuUhMBehs3UYBZhqGuU4pgmBNnx9VH7JQN6OEPpZhHDbzpkmB7H8cMo7k70zEXZcalX4kcOB0JZ4DR/41UTWdF/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsU5c1B2SxrqrZ/wT6eddDua07cvQCp1kcMg7OImxC4=;
 b=UaUmtaIDoc4jt4Ou85KjqWjsiMaawXN4Lj1blV5L3vJNnpXol5NdGvxoEh4Mj72TsfuKuWvWeT6uRxqwQgmoPbGpgdMHguqJ1bISGxydW1NNHgFcYiGkZgbbPIev3hRFjbFlXsNVvusskLyR5SzfVcm2aEv6x/32hF4IwqXhtqlsXxpo/82WQwZ0udgVN0oaf0p8/ksNg6KZAIaD7VRxg7vd3QLNd3DLq/TRlrPSMzpKK7XHBBos0LgIKlsVTCYh3K6HbRprI76B0vZXPlGuxnQ8r4y9uZey6PRy65eCKDaSF/PalUio0JwogI7CLCvQd+Hekq+t2DyOjHQWD1xBcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 by CH3PR12MB9079.namprd12.prod.outlook.com (2603:10b6:610:1a1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Thu, 3 Jul
 2025 22:34:47 +0000
Received: from SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a]) by SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 22:34:47 +0000
From: James Jones <jajones@nvidia.com>
To: David Airlie <airlied@gmail.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 James Jones <jajones@nvidia.com>
Subject: [RFC  3/4] drm/nouveau: use format modifier helper funcs
Date: Thu,  3 Jul 2025 15:36:57 -0700
Message-ID: <20250703223658.1457-4-jajones@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703223658.1457-1-jajones@nvidia.com>
References: <20250703223658.1457-1-jajones@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH2PEPF0000384B.namprd17.prod.outlook.com
 (2603:10b6:518:1::68) To SA1PR12MB6701.namprd12.prod.outlook.com
 (2603:10b6:806:251::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6701:EE_|CH3PR12MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: e20b8534-88b3-4ce3-ddf6-08ddba81d0f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KkNf0dLoDhkJuZG6jpVR8et6kBfRoElkvFhbW1Z0MGB3JH+5U710P+lXPVXX?=
 =?us-ascii?Q?OmAlt2iAnPK1/v/cBZR9Ksyi8vWxCWoJtwcJ7YtepFIYvQlkxTW3ywVFSPIK?=
 =?us-ascii?Q?xrgce5G5hXOLx75vMstMPIfji6QSk4yLqjaoTWf8QYMtneiBXTYY+ZSFzV7T?=
 =?us-ascii?Q?Ql4a7S9dSIbq7SAbIxSg0jSBB6Dp6qFfbWYrOnFjrGJhyCJB0b6JZ1AntMEZ?=
 =?us-ascii?Q?tjVor6628nVYTRs00jee8uZrzKReUQHHJNxrJ+gsZQvHCfjwWztDNGb3epnS?=
 =?us-ascii?Q?d9K38LpNOga34CB63TEdbfjE3L1hKCmJcPsrR/A2a2K8MsZnHW8JurlW3OjD?=
 =?us-ascii?Q?//oaEOSBS0XExE+VY/cwTqFnvM2jTgAjUMETEgBpZ5XslLTNBuNCQBl7nTd6?=
 =?us-ascii?Q?7N3R/n9kgpXsurep4gjj7W+TztU5zwDAYlrlWTWE9vuB1NniPAeCZz1vvncj?=
 =?us-ascii?Q?vKNjLx0cezjPC2mQ2Z+hyvqnimUDCmQ6AK4lgvcdSLpchtR6loJGskWOZoXG?=
 =?us-ascii?Q?kEB2N+cmTt/80SMPUUp9Pxsrfe6DJFcf3PEZM2NqySdsO1LqgJ+rpYd2Neub?=
 =?us-ascii?Q?00KEq4E3ntywekkCK/gbIHEmlJom8uIGQO3mex5s+h/rBQxPGXY2qz9L+t/l?=
 =?us-ascii?Q?s1yDO7k1rcsAfw5c1m//5fKqqZQnPcfkWS8wtzg/5UZZw4vKY5dxJ9PGWoGy?=
 =?us-ascii?Q?WKL2rx83Z22BEP0CwvikUwFZIjShgsTh5NTcxnUpJqh3Iuvjrj5/WJ5o0YWm?=
 =?us-ascii?Q?vcGLGfzliCm4HijgyBpZCs30SWcUf1ncfcqGjlyYwLWQughuNfmS9PIUpSQ3?=
 =?us-ascii?Q?k4NdZFpyT3HVyKp9rrQ3wbpMprrb6THJupXSVKMazoW6wjeKxbQ/JS2kR7gr?=
 =?us-ascii?Q?Nic7JTpvYnzO5nPkd0rd2vGETpt/C1ilNR5hGq32jNd9mXPJUxdhbCmEL9hT?=
 =?us-ascii?Q?GiQk57DMlzytOiWallFHAl0O5j7HYfHs/MA/Gnqmcl3eSgNk1/+BTEA9E8bW?=
 =?us-ascii?Q?/qXBuC/Iw/Zlt4Z+qpNRqljBq9H3B9MM1a2Whbd5Dtx4oQlVnJeMEpaiI2wP?=
 =?us-ascii?Q?8xNKqlnjIWycYOv3reDXkiwDvwXvgv5t9MCY1Qk3woAbvJy1cykk36aFOdOv?=
 =?us-ascii?Q?+8qlp5SjmottRCpPkHjBWFHDp3kBCIm88EhAwEjdr7s51W9m8KPbzS5lA57N?=
 =?us-ascii?Q?DhkHDRopvg4oYH+wrVSpGkxSd/8DLYakG0ijrm8bM2erwcGN+Z2qPPErN2EI?=
 =?us-ascii?Q?jK9x23ZSNq78j1rnTv7s8cy9EkJSw6e119UcI0yV/KuhG24O0FvaifdBJLpg?=
 =?us-ascii?Q?w+BigAfXDk3rPTNIgPIQMISrZTiQggDcduA3EBtMSgp+ON7VdasfgsnNUt9d?=
 =?us-ascii?Q?VgYHC30yEF/sgg1dc+JfGzgjoCkyB6JWQG+d6xQioVlATXy4shMzmXq+KY9n?=
 =?us-ascii?Q?4PTjr1sJc+s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9sZfiInlziOrCjbusJpp54BK/H39kEcYuLPXufGP78m9ZAFqY96qAZFcT/BU?=
 =?us-ascii?Q?6Ca979T3pfDvONW0gyx9q3lqiXWzenLLkluseLo0rxVldS79q72RlNZUcu+e?=
 =?us-ascii?Q?ht5Ixdtm373hVQoESF3yaE9okjb0jNLtvHdN1XCdj403aWoeqFtHROVL4DrN?=
 =?us-ascii?Q?aWPhjO0DxISMQVE5DIvxcbAnSJc3TS6mapb2R1344hGUpo+eE2W39+C2tYfp?=
 =?us-ascii?Q?oIu8QamEqQlJ8RP/s/BTWYkC35YK+jtW8VUkOJWetcrgRMqQ8RjTVDUxIQiU?=
 =?us-ascii?Q?PDxRerbJG+2bTdFXhGnBxjCqqUaVWKMdnmhrzyr/NYp2vK5SQBaP1VnUJO6c?=
 =?us-ascii?Q?FJLQIDQhAcfEWf/cmRU8CILxbyq4MqXY4FjLhYEQMDT3CrusvBQugviYgfnI?=
 =?us-ascii?Q?BsHJaPL+U0upMUZXWmS7x2qhJJrV/J/jPPWEujVV0Gwf64fB7TolB+WFFsMu?=
 =?us-ascii?Q?A14kTVmztZwwBKlF+kXSF4ShXZPTPN7Ejz7lm+Scg87QWf4qQ5/qcbcOXhBA?=
 =?us-ascii?Q?E92biPkSS6RVfuxG7rsgV5e13fssC7/ISQnVYaF/NoYTuHTpYAOkJoTXKEvJ?=
 =?us-ascii?Q?LRq/1tpGo89I3ZyKvxVLBm+Zyw7UbgoHEg1YNDQcD64nTuhhd+x3G0wK2v+O?=
 =?us-ascii?Q?nsGHxzQUqSj6wri/06GIQKC1oVjoITy8xqiEqB/2GG80pAGi+IL0HqbKFsTE?=
 =?us-ascii?Q?6HLI4cOCQoohr43JvRVyX3pAK8NmICXikm1fK92ObCt5zjogvtJO86P1moEU?=
 =?us-ascii?Q?uXremK9s4iMhRpowXLmPYzTbrF86LqaiLtO6l5+LVr+muNfVrE9PfgRZrvQH?=
 =?us-ascii?Q?YFuhEfxuoVNahd4u+JDqEd4N1/DpRlDVh/3TVIdf8W30dVkM8/Ei+HFTCOk+?=
 =?us-ascii?Q?gF/lG8kzn9fTx/J+9TkJehKQc3pYBCsQFsJjWJHmvy4YjtG0qKbpFtK7XjQ1?=
 =?us-ascii?Q?KCqbXvtGDFuPWGJ4wmxUgq/zFZn6YkKevzsv9KM3+rfdYdBm24xLfP0U4sIz?=
 =?us-ascii?Q?qeGlFhA22qRTTgjrU15BsYpDTEnM99BivaArDTacI5+dGdZ3VPhaMqOVS9DI?=
 =?us-ascii?Q?jTBnM4lLkEgGS/PJk2Gb0xZz06HbJUGkZovGFSBHzFs/ZTG5W5isb+bzcIXo?=
 =?us-ascii?Q?2by5m2rzFSFixJElYh2DmP7h+uzRVgfOOod4FB8k5xTGNEqaTux+4q8KbmGG?=
 =?us-ascii?Q?VI3s05hjkP57Zwu3DpUWn4NXFEt+PsiA8rzYU2igv01mHtUE+agDlwpeb5qj?=
 =?us-ascii?Q?COTTxO8vZGtzr5SlNHzHRKjDteE+iyltmk8BGZHbQspSg4MWTbMfUMXMnELk?=
 =?us-ascii?Q?BS9m8eocetgvrQ22EbAdOZgAN79ve1ExSrbGLjRWaVWBbNViswIWq5DUACKH?=
 =?us-ascii?Q?dfbzYATKkrWG3jeSYbZ9kJkykV0/eeBUm0lK8SxtHSpVqTf45rEC2u/EID3j?=
 =?us-ascii?Q?sh5zVpNk6XupeKJAQ2CcGMLbNU5uUDigVCyDPkAIbBsEpaLvoN0A9eqR+WVm?=
 =?us-ascii?Q?thrsIGYii7gVCJXpse/epeO5+L5QWfRcaXX8UcoNuC76UsxUk2Kz2o7+Qxrw?=
 =?us-ascii?Q?1uYNJ/geJVQlYS2gPNtBml/elXDlyNzFvGiv0lJ4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e20b8534-88b3-4ce3-ddf6-08ddba81d0f2
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:34:47.7244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUZ7O8BxxU/Sthj2sCMa9a5Qo/w9AsQs427AbF7gUsG/AyAFILNbm9V/ErSKaxyQUWsFTPWs3eiSLqLlyg22Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9079
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

When parsing the parameteric NVIDIA block-linear
format modifiers to determine surface tiling
attributes, use the new helper functions to
extract values from various fields. This avoids
using magic values to extract the bitfields from
the modifier, which makes the code more readable.

Signed-off-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index add006fc8d81..1bec664a2b67 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -146,14 +146,18 @@ nouveau_decode_mod(struct nouveau_drm *drm,
 		 * Extract the block height and kind from the corresponding
 		 * modifier fields.  See drm_fourcc.h for details.
 		 */
+		uint64_t pkind = drm_fourcc_nvidia_format_mod_pkind(modifier);
 
-		if ((modifier & (0xffull << 12)) == 0ull) {
+		if (pkind == 0ull) {
 			/* Legacy modifier.  Translate to this dev's 'kind.' */
-			modifier |= disp->format_modifiers[0] & (0xffull << 12);
+			const uint64_t any_dev_mod = disp->format_modifiers[0];
+
+			pkind = drm_fourcc_nvidia_format_mod_pkind(any_dev_mod);
 		}
 
-		*tile_mode = (uint32_t)(modifier & 0xF);
-		*kind = (uint8_t)((modifier >> 12) & 0xFF);
+		*tile_mode =
+			(uint32_t)drm_fourcc_nvidia_format_mod_l2gpbh(modifier);
+		*kind = (uint8_t)pkind;
 
 		if (drm->client.device.info.chipset >= 0xc0)
 			*tile_mode <<= 4;
-- 
2.49.0

