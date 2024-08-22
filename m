Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E75695AE49
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C028C10E790;
	Thu, 22 Aug 2024 06:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="hKpzAvpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2082.outbound.protection.outlook.com [40.107.117.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93D410E78F;
 Thu, 22 Aug 2024 06:58:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhtEj54PWCDu6gCNoSmC/r29nSYQLJR+1f10Ox36pRtAI09pm5y5/ZWt9PHH5tZuocCzMIwC5Pm/hITilZ1IYC4kpB5nMXJSLtd4u/bSzKoLdQfpE+KOvDj9RFkLsx38owQqoLP13E7OcPNLZAWSg0pmoLL8UeboBjoupWyrwTd7ZYjJQKTANWliFSXOZGwOC114KsbuTPd1N+Levql7REICYuj9i9vyXpq7li+JL1o7ZYgD1lVWaNovykkAhRUN6Beto6wMNn8D+JG5UC/rBwp//x7JE9oNj/KN+YrMlfkdG0TXnaPrOzW+sAMUTAQ/W9UEJ40udKbVF4JOcn4rUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Nf4qHOg4Wy94B4bQcsuL4rSf5VRXrwo3ygBKI6+/bM=;
 b=uyoKHc6rXD8Mlt0tXkjVD6D5u2hCIy42dTesIONjPs2swb7jt4jpkQSGzNh4mxQQo04APYtDLdVx+K3ZhxrZzEjeQ9HU0By8QH9XTiW7f43TOt1LBGzud4IbHBWQkHGBauw2UEML701yqPPWOe7ZwvJPbfkfSZWCTD5HcxYHqA5lWEHZqNdRmaUDsHlehFzLg3Zet3kHkODmpONfD8kgYSQG6UrIqZaE4IsqpXm9T6yL8lIG94mMJwUGRg7IcL/RcvH64UATjPXPf8bGOb16JZdW1EJ35U53l3gazYH368R3adVFqqeNWw6BGLgusU6AyapqJ426RRbxQGWgJ4vuNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Nf4qHOg4Wy94B4bQcsuL4rSf5VRXrwo3ygBKI6+/bM=;
 b=hKpzAvpKUklnX6KkayFKPQ1cKrWOUdiAXXyQfMZ07zXYPdNWOvDjNGpVtXQyj3VqFmv6e0yGtfSZ+HXrGdtNPjx1MLd8Sho05CB6m1Y6VZaqzAfp/1fNzCyWD1rpQTWD+Wy0q1Vy+yiTi4GHhbnvhvNgbHiuJ0kdUef4ooEF9NM8WjPRyqIcZDkuF1GC3NESDuyNAL7ptf+0NxZNNPBqtEkC14e+Q2jbf3f5o3tisHT87H76worQ6Y4C0C0Z9vSmUgozHl3/bGQj7Olm95kztA8y/oviuzTRmIimRxRPTQw3coHi02+eotD7XmprXTG5lUxmRA2KXyKdy/WJLZDgjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by TYZPR06MB5417.apcprd06.prod.outlook.com (2603:1096:400:203::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 06:58:16 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:58:16 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 6/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:57:23 +0800
Message-Id: <20240822065723.1336181-7-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822065723.1336181-1-yujiaoliang@vivo.com>
References: <20240822065723.1336181-1-yujiaoliang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|TYZPR06MB5417:EE_
X-MS-Office365-Filtering-Correlation-Id: f96967af-50e7-48d2-baeb-08dcc277cc5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ias8CSdYvciCapqx5JG5o1vQiaqTcF/sX4wIlJqNwW5sMCVqzjK6eX6jRrMe?=
 =?us-ascii?Q?6x0nWX6/ClSKDfd85u/iH48gw1ZYF0KYG9wnfwjyJn+gIb8cgpZlJwagWzdi?=
 =?us-ascii?Q?E1UnZshVsIUpt9jkjT8bJGO9ElZEMh1BooE1LvHp8AnpfpeZ3o0PDXK9/caB?=
 =?us-ascii?Q?b7rfBbtGwRZANxsJIuzzJS6UudMVsuMASquSSoP2GNgBOjvduNRIlepmJFMI?=
 =?us-ascii?Q?ep7DIC+8d8UeffsJSMdk6tT47P8c0rV8bofwST4YaESnXrsFWzCYSvypALFx?=
 =?us-ascii?Q?q7j78x72x9hHiE8j2WTOH6o8vNBsiRkSqP/78azXv9g871GxcgW0Mr+5IKuM?=
 =?us-ascii?Q?aeAW/M8/9hb2JZf+X60CrMew7/Re68uSZSQpGwd0bKjUn1MQxSpFU2BGG/OA?=
 =?us-ascii?Q?63egKnpiAv83Lb7Qb9ZIost9UYKoBo2jYAFazfiv6lSbgTtJshcTSA+/6/c5?=
 =?us-ascii?Q?W7z+YmKT3k4EFae+y+oevgN7cXBucPvEYYQWk3nf4uu9JUA9CS6/rfzR9RMV?=
 =?us-ascii?Q?23d1yXbnsengdiho83tSdYOsTAdjiDiF3gliNSk9Rxhp35pzc/MQb3rc5obx?=
 =?us-ascii?Q?3rVVKaoK7BDdwyzykI0wH2LcDD/2uRUaqAQON53ZYsODtQW6fZQniPLpRDKe?=
 =?us-ascii?Q?f+LmXwTvJJM53RioQ4jNqiE5cWNO5a+c9zKsLvm+VOUpTX9YynjG+IF/8wr/?=
 =?us-ascii?Q?sUUXe+qLrxgCr6ZFR9+kwFsl8BuJ3MTdMarg1/eDA4zKhD9BM64Dgmlsoijn?=
 =?us-ascii?Q?OM+kJqUkjZedYZMWkYejWl82XFsQl5TxJeleqFg605/i0tuJNtUKcl59mK7c?=
 =?us-ascii?Q?wDuq+nQTn/Nw/kojdhWvPv5+nW0AG4A0MWpvzF0M2sGtgkftID3EHxkmJnhg?=
 =?us-ascii?Q?l/DkUN+LDjniSxpOn8rRG32gRHWCzXpaebK6lL1sNjxjc88bYJELHLiwWbwZ?=
 =?us-ascii?Q?1Z/ZTkQUoDdxBV9vdDXMLRxpgFHgI5DFKpr9Y8sBttFVEVVemqPje/ujaP4l?=
 =?us-ascii?Q?YMrLQxLoa3V2bMcChpZC6pMo7WVRZnSL3zY/bHHNE7ALqvDgNPnaevRnQika?=
 =?us-ascii?Q?drr2UgFTdGsWXV4rRSnAuNDRmgbN/ysoyQ3KPY2ZgnLNn9/pLLNf9gX+5an9?=
 =?us-ascii?Q?2YdoB/ILlj5hf57lIPksOPnxqJ4qY/YXFlfBHo/7odbrVZBhdtS+W2f/HeN0?=
 =?us-ascii?Q?xtzy9nXszeANULU5466d/EIaK0rwfMIjMqXxJlmfPzwec0/okoH/t/g6bKGu?=
 =?us-ascii?Q?1J0ZA8fjML21xQcDCF3WE24F42qePUyQcJvk776KaGU9XjbyBSqv4gY3Ewot?=
 =?us-ascii?Q?B0sYFB+o9OKFhhgDihcKyJgEJSeByxnlhxdu1wvaNfiEBj2txE00Yw0SOKXT?=
 =?us-ascii?Q?zmRzcQdhzlCTBY7Y0oMq4Ww4pqH/hH2DAdwRxPNkp5kT3/QETooA/NQ4Ya+M?=
 =?us-ascii?Q?26vD6M0NBRk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AH/8KZqTxOxczXXNwTM5rONDkYSkCUgupLr+cWHXt4LgtBIvlF2b5tyh8k/W?=
 =?us-ascii?Q?j4rrDpGlrOmm9hOmJIseuG6L9P1QG3iPRm42bZ4wli2A0BDe4Gui3R3Geryl?=
 =?us-ascii?Q?IisqDyfbcL67+ohwk9H8mrQ325aDzm5vEgyuGmi0x/sUvz4fjR/3VMefUcqp?=
 =?us-ascii?Q?Z2loA1HMocnJ2bzKXQbmnqWsgsqjCOXQ/ytapjdI+bdJV0Uo7UMf4In3zflm?=
 =?us-ascii?Q?OLwDnj6JyRVBXgwzOrxeY0a0lnUOISwIuIScLSsQEojETbHSBW1cN7+do9JQ?=
 =?us-ascii?Q?9gljFchByj1N1FAT45uGM7K50X5sOKd8ojdOBU8JSTHVroPQvQmaOmrkRa2P?=
 =?us-ascii?Q?NEHeUH9XUfyU7aWZOWYpc0KavSuj731nvQ4Hqa7VtXlD5CkYvCIh+jPXGTF9?=
 =?us-ascii?Q?vw7vyf2G/XayP08ih3Tk61L2UkT1hgCJUAQ3cXH8DrhBpcAa8XILRf+6k0gA?=
 =?us-ascii?Q?BM7sN1t6BuLQbuXCDCbENR+nD2RTeqnAvgS3XCWN2EgQ3yEv7nVpK1qZtn1w?=
 =?us-ascii?Q?lPYaQMBbBrSMgq+SMniVZgS3ViD1tbx3deU7iDtr3g5FEcr+l80PBYVr7Xs7?=
 =?us-ascii?Q?d3cXuSKvPx4Ol71u5KzV+eM4NUuUZ5JXV9I2oHc7D44Pvdmli3i62RjdbY5X?=
 =?us-ascii?Q?Uu5IDJGZlmYozObauFV05uERnbA/8ApFZSi8iElZjsy6Xm8F+PnEUli8ymb3?=
 =?us-ascii?Q?iL076KQvPitychy8ss/WELQhwwFfFH5KhBISM9/3y6uyFrbmszez5nY1rD2i?=
 =?us-ascii?Q?cLOTjnM0mNxLo9WmLO1vy07Fi/Qq8OdGhXdwLpOc4XVb+EFh8iQm93G0tr4A?=
 =?us-ascii?Q?qLzqqSvOeAhqqLWQnzaqfk4RhdRi70kppS7FT/8gfV0c5Yo4r7Md+GiyQGs+?=
 =?us-ascii?Q?5NfCigL9fDzBhiInAWiygpxrHeTFmOsJMzPRXzOAzXeYX4q04CyHfzYvWeU7?=
 =?us-ascii?Q?zo0EraabFD0BcHaHpGoJQp5xbG72gB83oZXWWVe5h40tnFLaBeXlrtkoVE8o?=
 =?us-ascii?Q?CJRg2+nW6J6yom6maItPnPp/X7ULXA0XntUUCS+qf2DQjktJc3ois++UUVk1?=
 =?us-ascii?Q?PutDYWKP5DGz6YiGTFIGrvd+m5xLmcHqt1Y4EKXmAnBrxONHFzc4TwSXiXPb?=
 =?us-ascii?Q?ww1H39sLFqoPb2Nd3N2NyThGzGkv/O5BtV38WzZ1uhchtJD6akTuMZerXjHf?=
 =?us-ascii?Q?cus5X3bLwJW2NZTXMlZqjYYObDDztjqaAYadguH8sHrdthgh6upfwFSwZja7?=
 =?us-ascii?Q?xIMveEmjtZj+L3rEywhlqFdlYdjUAZ1TVXUeAWk/2EjjL9xBQuCUDtYjVb+5?=
 =?us-ascii?Q?D7D9Hy6kKmU7/LL8EJPAyaswaphio9tBYY27S398bNVYlHjOkIto7EJG0gcZ?=
 =?us-ascii?Q?ztOV9Mir8vRS3B7cn8DOlj5FVhP+ozHUr6vcwaDXKJ3Kqi6Fh4iWhCrAil66?=
 =?us-ascii?Q?WOYifwJ8FzH0v++OYO2zQRoJPSLZGSsoddZyV3Up6BzvdJDQJ/nR2fZGEOsq?=
 =?us-ascii?Q?bi08VgiOxCgUHpXjXQPkyX97bHtvzqIInc4QQ6uCEpg3gMkfvW0xeluLVxqW?=
 =?us-ascii?Q?ZxjHTnyPCaUzV4Br5+gqJNWVsnSlJ9oIdi9Jml2N?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f96967af-50e7-48d2-baeb-08dcc277cc5d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:58:16.7156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CXnLD0X50YKqGHmQ87KmKfu4jFqJMQr1VwxwSV5BzTkqrtpzBJYQuVLKn2QOu4GYRemt56CnZZKu8aAPTt3DHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5417
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

Use the macro instead of ternary operator.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/gpu/drm/amd/display/modules/freesync/freesync.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index a40e6590215a..33b9b87d8d3a 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -1005,8 +1005,8 @@ void mod_freesync_build_vrr_params(struct mod_freesync *mod_freesync,
 			(stream->timing.h_total * (long long)stream->ctx->dc->caps.max_v_total));
 	}
 	/* Limit minimum refresh rate to what can be supported by hardware */
-	min_refresh_in_uhz = min_hardware_refresh_in_uhz > in_config->min_refresh_in_uhz ?
-		min_hardware_refresh_in_uhz : in_config->min_refresh_in_uhz;
+	min_refresh_in_uhz =
+		max(min_hardware_refresh_in_uhz, in_config->min_refresh_in_uhz);
 	max_refresh_in_uhz = in_config->max_refresh_in_uhz;
 
 	/* Full range may be larger than current video timing, so cap at nominal */
-- 
2.34.1

