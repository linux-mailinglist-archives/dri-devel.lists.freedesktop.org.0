Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E6E95833B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F60210E649;
	Tue, 20 Aug 2024 09:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="cp4lU8e3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2087.outbound.protection.outlook.com [40.107.215.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC3410E649;
 Tue, 20 Aug 2024 09:53:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXn4PGQqkAR5JyYZOJDPgLRmsxdqeIlPnUOfyoVSmqQ6YNHYX7Q/G05EzGNPou3N8e5ZkbhGwj+s6FiZRNlPOXfQ0ujjk7e8LgSs+w2IPgACw8pSxI5uxNVYhjo8iGv+BumzPq9rx3vWen4koiN70boTWmBdJG4B3EP5TfFvt5m47SiO9W3z+f5wmPUjA/5sI8HcIYctH0VbIFEH4qjg5rDp8R8SEOIR6vKopgDwUFZrc+mS594+hZX3lt3m9RBd7yvJ6Wrj1SHIbDsU6UqCP1gAH3WnQ1blqnmAK/zEfUXIgobIodPJyGiXaAueohXxs4SVRPD61/1wcd8ASTxRew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2LtEjlrjt3vnNZ92KXhjbDeqJ/eWDlPdGluGDFKb9I=;
 b=vaQhP8mek8L+8xTEaguMeJ3yX2+baaa5jQRmEPUDPzkSF6dIeITaZesrocjehdpSW8vY4zOkZkl+Ex+PuoPsLJewg65Alt2QxPAuSw701iBNmZtlUj4wKgV82iYt+w7M8UcSqtiE+WoZbIOwkYw47wYiLgEw0/IeMuWiYixnxBdLbekpawWSEeYXaw/+a9ap6dl0vcqBWGre5rbQztsP2w+ddpkBk+lEEcSxl0oTTlneA/vHPStRNv2tookBXL8R4DUh248xEi5gnwwGcRg9hq6mTxjH7ZKP01c4W5vydVpIqpsHKfUj3v3/gtsOk5RMzgoFWrYwhtjV99BWHfevKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2LtEjlrjt3vnNZ92KXhjbDeqJ/eWDlPdGluGDFKb9I=;
 b=cp4lU8e3o8DxWBShaiEWE8rp39FikdR9c6WOIhClZsD6eW6KSaUuFFU6qh7tBnAtY1yZJaV+6obhKX+Q5Lv2Rg/r1ZticL5SgAecXDTtVwZzGDpS61vqpPA5mJwxtxLF6fJ1DROye4Ltu/yJYR2rbEWG54B4OTHFGVDY/0iufCDUgd+zwrhV36iyCB4WpHwB2ZKKO1eGzIEbV13Y3+sM6gfHFK0FHUGFgZ3RdjqmeS+7p397lyukuFBEBuRt/VThaUI76lT7y3c5Qox2zNy1PYis5q9MP18TniWiddshOmqZYu33F974Z4fr3cE7hGo7uDSEZHbiG7Fo9sVwFexjWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by TY0PR06MB5529.apcprd06.prod.outlook.com (2603:1096:400:27b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 09:53:13 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%6]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 09:53:13 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com, Yu Jiaoliang <yujiaoliang@vivo.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2] drm/i915/gt: Use kmemdup_array instead of kmemdup for
 multiple allocation
Date: Tue, 20 Aug 2024 17:53:02 +0800
Message-Id: <20240820095304.2746102-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0170.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::11) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|TY0PR06MB5529:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c45e2c-a0f7-4d0d-70db-08dcc0fde818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fNx3Dd5XWpFHeJ7fszkaa84wt+B9PiaDPHqH9xSVV8M2rUPdF9FwZsmjTfbu?=
 =?us-ascii?Q?zgFx8jzNPnKKI5eJ+h1P9J7l3LlPM2HE9ASY1MJL18iPu/ajUiFNUhCyaRwY?=
 =?us-ascii?Q?PLoIp2aOZgcLWNQlTfzrfApsQDvGasHkT8HTdrLKd7DFSUSzb9xcFPccIJMZ?=
 =?us-ascii?Q?pcYfjCKg2dVLoQwq7MkH4syyZ8Jh90TGleX2QrvauOIVuYNTMIGgp9+v5RjN?=
 =?us-ascii?Q?XOajP15yyxyqkEkvilxa9cnSYg7xFuZyCDQLmyS3JCqldXcWlxIMpq32D+J1?=
 =?us-ascii?Q?wBKlfJBqy+ovDyTVpPboYbhORHUtpdDgGV41sRJW40ozqfaO7YkSOodl1sWb?=
 =?us-ascii?Q?uXB7hAz/nOpSH0hvDH+w7pejEYwgswRgPCMWr1bUw81ckfx/NMLbrKtQy+Fo?=
 =?us-ascii?Q?zYm0qgZeUDTKKCfGj0lJ18mBIuSjtqfXzmghBG/xSBgWjAQC9GAstfF0vvlL?=
 =?us-ascii?Q?xznD/7Tcli3UDHDJwq9iFaAv64FcHophp5GzNLO5depfPDrCxXDl7lZR6Rjp?=
 =?us-ascii?Q?PuDJQqfPvMg6lhLFk8yNzdzL3gNOSafmaphdAeGTcjYd0WUjnkFx0yZv99Qg?=
 =?us-ascii?Q?3dU8L/JQRP1COVaH8GTtcF65bcYQ8zpl0HPdjrPeCSgebDOYvyjxIyieI2jQ?=
 =?us-ascii?Q?kWSMMctd9TyQlZMJN9sAcgl4lCGbmH332FTnVRIKVTSap7PRoJOJb5RBZQKU?=
 =?us-ascii?Q?mmNG3z6P0KRXqm5mCBut4CK4df/so3q8Kw3+yXukdvhUajbqu/Ol0CwmpCHj?=
 =?us-ascii?Q?zYM4zS6YT8XJrAiAUrkzxJu4nKtDQldLEsKifdvaQ0db1A+s7tMpWChfg1+j?=
 =?us-ascii?Q?vr3ZNewde0LNwKry0JjwVeapwU/srFHbaClkMbGKzHPpjrRaLb1Jp0yPwl8M?=
 =?us-ascii?Q?nHk1Mx3eRwQ3UrBy8ZMjjaA9rG9w0q/mrl8NvAKliz1dNNauTCXUkRWblWNL?=
 =?us-ascii?Q?xsPawllVfe7octTKWJwyK0OWaFuFyxpVTZiNw1pg+X8OegFoO2Sq5w99lp9s?=
 =?us-ascii?Q?Rdd22fWlactaaQ3zkDeCOecxQpcw5ecj05Dko2bPGRXAqn6EBnXRMJAdqW4a?=
 =?us-ascii?Q?PeSeC/eiawV++OTO46osDWnrRU57eDItVgyVsTJuKS38sAhBcf8RRiOItWyv?=
 =?us-ascii?Q?xwpqmvwI0CYPgZQtVZmEn8rxTbiiqPk99FHWsqt+v4gBk8K8ajOhchWwyIcR?=
 =?us-ascii?Q?8W0MwY0J+3KlibVE6xBmFJ9KqWGlPhz9StKkmIoa5008BEYcgOPHBR3Vhw9v?=
 =?us-ascii?Q?HkYVu3e3dh7+GatPtBOyb3wI29kZ6KIXu8G+0qI0PM/xulJTesZqc2563+OS?=
 =?us-ascii?Q?wemI8Q9/OhVWEVPTsE5X+wiahHzG7BfDImcDmnoMzha1agAmzLBbpa4B2+S3?=
 =?us-ascii?Q?A0e8J9iHFB+2xLaK8gKUF+QMVU9XobCkXTDK35cDGBw4LURqtbnfW6ygDjAW?=
 =?us-ascii?Q?tuC6sJnzCjo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?510fLeETimIYYrECdUoOKa8pjibxdikum2chK6ow1mJa/eCi8Z/Ufj8s+guG?=
 =?us-ascii?Q?IwqcBRjkxBDQ8XP9vm6GWb1hxecFijTrmcswGBhekqaLd2jzmpmW4n1rgD1X?=
 =?us-ascii?Q?Eijyamqv9h1L1UlB2mFE4mybISTCtjtJx1QwvcMmGLB+snz1GlCSHlPKFlA5?=
 =?us-ascii?Q?4eWg73BftED3xppjYoWf91pACE/o+kcp91ldS4pJlCbrxYqcUQcncEwIl5Me?=
 =?us-ascii?Q?4zK7iGzsc17cxofNBbQwjpOt/JW6Fcge3EZzRvTh7BOhw0IbLjqszsdwtlWO?=
 =?us-ascii?Q?IxF+vIpFBEbLgjVjNibB6b96Q5soyK7VqRMWgc3bDm+Q+q8oLqAXOtoVb5sz?=
 =?us-ascii?Q?X4G2ldL1+z4dbTDZw/zrnw+Qy+n5Ci2tKZ4TOlRmhRBSofP7zZC2cO6N0WEX?=
 =?us-ascii?Q?6HlImSmU9vBpaQNGOpCAfaNfl2KH0/83hzlE8GAhj/A21rJX3dUEyGFelERL?=
 =?us-ascii?Q?IY41Iz4+L7MLwEFqnYdCyNZxV8Dd6th1dZBHzt6jm0A9YJ+skGhmhueD3uEx?=
 =?us-ascii?Q?Tfl7kDsId7xkUrQlB2aCnjbi5hSiOlioVGbEI+TtN3c0NOFHxfHM+K8MPUhB?=
 =?us-ascii?Q?snhQKOKFp4ugXMFVZbnf60vdTAG8SzSqXt8YRmBDd24f+fkry9GWDlO7+Eu2?=
 =?us-ascii?Q?V6icwmFeiA3jlWW2wB+kg2IHxqh8TQFgEYqucVfJmrcGwZkPYjq99vfdhn4M?=
 =?us-ascii?Q?Y2vxKI923fE8ZkVA4mC0l6LzgOlVic5cbmpW7qT6eiVovHM72nJBvBysBg8G?=
 =?us-ascii?Q?kKyaPOGhoxpiYyL83+v/MBIwW1ciFQRhUCMagBv9yK8H3WLX4OnXq2KboVj3?=
 =?us-ascii?Q?LhX9+CGHm/+XpAlXa9zPIGeEf2z1foeE8wAoPXMc1RDYxyaoGtGMy8TcXf7H?=
 =?us-ascii?Q?U7eVT9YqAhKgDvs3BtoJY2iLUZ2uyNEKiZQlRqxnyg/NxOO9MmmTCkNO2EGG?=
 =?us-ascii?Q?SAFJ4DC1hvjgUvLqhPBSg31GxynODZhdbGQyMXuWByimxm2JLKfc6uOdf0PX?=
 =?us-ascii?Q?egK5KdyIgldneecaWRKOrq8X2mrUPY8dSd+xtydMT6Y6YcuHgexq1V2ysSrp?=
 =?us-ascii?Q?59KGoXjEuHlAwx+7OJkoCq0kUkdj+GMAvcEdhnQt/nvwtnNZo0LjHOGn4Gmb?=
 =?us-ascii?Q?7Dj0DiCni/FVYf8/SSC1Lm+SB4M0e9aFJAMQYD+Z6x9bBqLE2LvojZvkW3aC?=
 =?us-ascii?Q?BbvNc7WLf3fQpmMSqP0CNklIQ/+uREgza5A4AYGQM07EJ34LxXAAXS3po8Hv?=
 =?us-ascii?Q?7/FaCUNdpoUzKOSlajcybwGrd2ynFpCm0AfiBj+NyIJvZ9bLLBdkuKNSbHV5?=
 =?us-ascii?Q?XjpKyQMyD0cUNgKOneLDyZ3scV3QZP+I3sMDjyxifSuIN/dz/KwPytJEnqIn?=
 =?us-ascii?Q?6o50MdPOyGjkwhz9TytdjoYXa0AmgUondl5arQdH2t/4SXxRnBqZLsCp9RaO?=
 =?us-ascii?Q?K36bXLeFmwiA83UfdEMSshEzeC1eTz7pgluaje1+biLB7i+efMqcU8l2YIXf?=
 =?us-ascii?Q?KjZysufWjTyZ0oISc7H+EgrVdTN5PDLskukiyfq8GtJc1qPcPtfo9isf3g+w?=
 =?us-ascii?Q?g3+ChKO5NeJxGJW9ag3sien3qkRVfWwen7ylpU13?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c45e2c-a0f7-4d0d-70db-08dcc0fde818
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 09:53:13.4743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJ9cxu/o0/cKZASl8Dra7nSF91zhTEJGpKlPHjXU5KZPcZDmtnQkIwMPhbo6rOnn6Fd1e1lpC27S1NMySUD0gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5529
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

Let the kememdup_array() take care about multiplication and possible
overflows.

v2:
- Change subject
- Leave one blank line between the commit log and the tag section
- Fix code alignment issue

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index d90348c56765..0fcfd55c62b4 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -111,9 +111,8 @@ static void wa_init_finish(struct i915_wa_list *wal)
 {
 	/* Trim unused entries. */
 	if (!IS_ALIGNED(wal->count, WA_LIST_CHUNK)) {
-		struct i915_wa *list = kmemdup_array(wal->list,
-					       wal->count, sizeof(*list),
-					       GFP_KERNEL);
+		struct i915_wa *list = kmemdup_array(wal->list, wal->count,
+											 sizeof(*list), GFP_KERNEL);
 
 		if (list) {
 			kfree(wal->list);
-- 
2.34.1

