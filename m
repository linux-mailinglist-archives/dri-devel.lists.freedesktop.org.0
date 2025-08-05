Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DECB0B1B8EF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 19:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DC610E6D8;
	Tue,  5 Aug 2025 17:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="es8kjz9u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013066.outbound.protection.outlook.com
 [40.107.44.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD5F10E253
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 07:47:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRX88L4XX/yHcFYEumSSMThLxZmOrzLIAJg+GN3jfY65UCNDvNLh+p0xEPFYdAflmt79/uJQyRrBID3D4Tgd5QLJQFHJ0yHAJDsMyCFu2tITKgnU4bPx866BMWXenO5RAhz2k9jzecFN0Rxag3IjsPitxf2Bh+JBY96oQ8gSD1Fzp5pBT65/Zk3W0bN7CGoCqM6D7MtH9EIYoUqWvkXXw/zqFepYN0pvV1IBbdznPKp8xCsQJKspKm4oqmxNYLwkJiRJ4omOYGSOGR5vo13GQjDrRyakjWk63ZU/7diVW1VkyCixaDgarpXUMEMt/t0UQX85gi3egbnryzWX5+5aJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcZqAzlqgrzi3B/v9qwDniuUNoyXhfWi2Tp19P4ZKaU=;
 b=fWWF4BBP0M3TnvHjA6m1m4qCAADTxEQCNvd5Z1GCA1buQQYaRaO7DtC4sTjSpVttuj55yQsypRQtE7cVVomp2pjP/0ooiynAvLnPyqQLQqi8iDTA8r33mV7D3MiunGF3hd893gOqSa/eBLSw0G9npOvrpI2LZ3klUHHb8D/XTHAdHTjB5xjf1qpnv5mWzGQ3LoWnUNX9yopqO0nzfxsGxnWP6iMreLa5pTQubWKHCWmZlIHFiboLLg28R5/QfDSSNOreZ9CWp3FRxjknKX3cnX9frDse6FifTcq+uwXZ7/2vqReeZUGlSWYtIAbgaZgzhLuAn2fvzgYG7K4Iv9DlLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcZqAzlqgrzi3B/v9qwDniuUNoyXhfWi2Tp19P4ZKaU=;
 b=es8kjz9ucp1rrBI7TaoKmMXcfYC8G4zUupwMmKgSitZ7Mp3KzhGZDib50EhZrjP9AiEo/Vx732+feEt4WmRD5hLFFRB3cJyc1OeItnMGVdZugsAN2QVW4s5lYC0aDwQpl7EvQGlJESP9uHzZLpkjTcGpzPt8aRy9UUEEHrAIuxVMzpxzxnChybmRm0tkm6O/bX+APFWjcJBHo2JeuYXQ0d5c7TDJzDidrZI85gfn+766eHWtCd3H/4AYJ4/WVx1BeTA7yWZNnNT9pfY+8f+vXFN90EcVh6IJdvKfBdfHyfHfzgwRkNOM2gJjrdnv67aX8rWL9iiSm1WuJk0jOFkRsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KU2PPF022ABE738.apcprd06.prod.outlook.com (2603:1096:d18::484)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 07:47:18 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 07:47:17 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 2/4] drm/imagination: Remove goto label that are only used once
Date: Tue,  5 Aug 2025 15:46:17 +0800
Message-Id: <20250805074645.625911-3-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805074645.625911-1-liaoyuanhong@vivo.com>
References: <20250805074645.625911-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KU2PPF022ABE738:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f7541d-064e-4b7f-7aff-08ddd3f44d35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ni8rKELe4pR6lpb/wAphZzDqve7Q45uLirwfcLFGWv8qk27B5NfAp3vMO9UC?=
 =?us-ascii?Q?YZOujMmoo3JFjOEgpKeSI62qJs6fisn3vqpMSD1N/CTbY9sJOH0U9A2EULG5?=
 =?us-ascii?Q?wBDWP/U1MtiRKPSGvANB7wEL+LQusdyf90MkOGdS5mu5zgpesFi+UmueGmeI?=
 =?us-ascii?Q?CH4DbQDktrBiGd8Izv4MrQ8JCAJWdgrNK1wM+OrRwRupVEJuwcXpuk9kB3L0?=
 =?us-ascii?Q?EnT3TJDX+VqbLpOoK9b4CUVummytlwXKtTkypK66F/QH3p/hDTnuJyoxMRZN?=
 =?us-ascii?Q?CZezjNfcPfxXzS+q6r/dqFSEt2ZJhhIC636xqz3Azjhh9/5Zr8PRW3Un2cAL?=
 =?us-ascii?Q?UGe+4GjE8CD8TbYPM7Va0Sti9qrhdU9ZkateRtml4CzuXJLek+GjYZbyrP6Z?=
 =?us-ascii?Q?GzOmfZwUzBBvoYQ18AXKN9vpE4e9PuKADGeTM64jqAQdLtSCaAl15wPMkdBB?=
 =?us-ascii?Q?VGDKmvfoeiuCFasQBPkwqBrIn6x3swdEEPt73pdzxotoD0WpGa5g6jow5Y3m?=
 =?us-ascii?Q?xer/uPupgnsd5T1XJOttdtX3a/LGvVL6uewJaJvrx8/As1LNXnKPFXNxICEW?=
 =?us-ascii?Q?DS5cJNhwF8e+k0ObdzKoTyWbg8IUXWjXmXIUE41ldC7gJfFlNB6EXh4wH6xk?=
 =?us-ascii?Q?7QPyfXwaGXYfFO+5KjhB1GuN+LOL7ZqTTCwwipFM830BeMBSrPU5lJEGoYAJ?=
 =?us-ascii?Q?I5CJnBF7bWs6z97OewWnnlS+7W/rHat/Wi7t30jDa4tPYAAQWikl3D4kduT2?=
 =?us-ascii?Q?9BsVo62MCsSH180UZ0dbTQHiPllKAOPiJhyw+uRpyLPpJ0kSb88BpMhYgrQF?=
 =?us-ascii?Q?IAUmpaZUz3EFBdSMx+c1IUCUsrkEcpjLQ+7J2F3eM+WCO/dbdgmZT/Yx8co/?=
 =?us-ascii?Q?9RzEed183PKV7QGtHYx+ryrAnFbosCAtEWJd9EPQFNVZAhyOGhfB+uIGVx1+?=
 =?us-ascii?Q?QmwMbOPQm9P2j+bc/CHBj76EboDPat+flKzjderd/GgSyAMRxQddrpcIcuU8?=
 =?us-ascii?Q?j9CJOe6d77jRrOeFXX/kFfhu4CG0Pr2RE2L7A5crgKnrcDAWbwTBFbF2Aq9u?=
 =?us-ascii?Q?ZJTrTxtzkijI3zcXogvVSYb4CofQDcZZ+6B++4Tk8vyVNFAEub69DE6ipCUX?=
 =?us-ascii?Q?yZHDpRw8uv+zxbLXsTOlacm+r9Ojn02qLrwcDcIGItn56iIai/m0R8vTDOgn?=
 =?us-ascii?Q?ZTyCCM858YhIqo+p2YtTiadnC4b9kGtKEKAtp7A0vRPrgXYj2R8coZZzf2SW?=
 =?us-ascii?Q?O6JegJEWuyhpSEGVidBIpHPTc381KP6gPPzLSjx1ImkrxoqMuD1kcCrMZCMJ?=
 =?us-ascii?Q?cQdlJ+TgwE+aBWJjstoBj75VAP0N49ijVhhheFgM5mYunlrlDMkLEqXtVWIo?=
 =?us-ascii?Q?t6OSFl9de0fWQjLmUcdil7ZuZHwkxM6LAzUTJP6mpJRm1KR+mM9iVgJt+OhL?=
 =?us-ascii?Q?CZv5+pKWwnHjC7o9d0LYUnBsCt7KKLaE9gPocOE7QlGmwYP3TJ0iYQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XHMpiabMfwIkSIOw6deGSc50LBZ1eNQ/lXxGteLgSiIdD+a4WrjVj3fU03X6?=
 =?us-ascii?Q?x4OTi5dM+5JAQeqiXqwvMwuLt+adnj8NmGa/4xtzaY0VhJ6wghflzPY2FV+a?=
 =?us-ascii?Q?0OvjTC2rKBfGKe4HwORQeaeeCmTe7oMBTAqM/4CqckV9gGpaXO5zgqzI+r5b?=
 =?us-ascii?Q?QwEpe4iU+XRlybTUyDtrIxjaRqno7ZUgZAVanqdJhwSsLtiEu6vImzwj6R3s?=
 =?us-ascii?Q?4gIl6gBqJ4XBWSsBvp+ZgyHtqH83q4D8GmzzGhYekqAPXTwKVoUd9bNn/y9K?=
 =?us-ascii?Q?SSTsl0xdevjtY+adIF9c8JNvj/06/3MX+8JMvRKxFI32Aq8zkR7pKC6zkis2?=
 =?us-ascii?Q?nXuXTsyc5pOX8cZ13XiwCQhNgzn+jgdO8b1kQua6HtIwDRhdU0i+8JCwuNRS?=
 =?us-ascii?Q?aOlaodr3jTsokeA2qRVnfGLJ/geJHU8EBif1ocpVYUJWAQEkBfFzar7J7kXH?=
 =?us-ascii?Q?zQ2liIAFFf5xdHNx+b66YbYSnx1c+8HiDZvVKpY6UJKwW/lNn4f8cZjFp8+Q?=
 =?us-ascii?Q?4XVAhXKkANpdhD+cxPTmRPEJQNsEkfqGN7qtx5LojvXXdIacnEjPn6XSxHVr?=
 =?us-ascii?Q?C2uxfhbwaCojfLgy6AzN2OQFD6Nlftsq/D2KvMDoLmapLgtKj13gBhjUbQUv?=
 =?us-ascii?Q?Ni0cU7gR4ajpB3L+i2WZmhiJVIq/sg4R6HeUzKhSobD4EdKHgUZKAwSQK6fl?=
 =?us-ascii?Q?3teWOhMML5t4//cyNArZbzuKxygL2EwLPK5UCj0oPxNJsyagt4vS+xbttFB5?=
 =?us-ascii?Q?LVTdZSlYE/QMNdKghjV2gJZvqMnlVdEoikUnEidtGuBahq/oPMsq49cge3FG?=
 =?us-ascii?Q?2lKFjexVAQGt45jjxkFI+69umAb6jPH38fCItu7nqmmoxOJ3fSwA0hT4FF+R?=
 =?us-ascii?Q?YK0eaI60nQPwgz9k4/XMdhp1Hzure3qTTtQ0/9EJwB2+8panf8iyGGgLU1Di?=
 =?us-ascii?Q?O6OdfqdU0nJvAmPQacO9N11L1SV55RLMq4+/cVYzAYQ8gRncYWyIztfTO2+w?=
 =?us-ascii?Q?NjcegSRZ/AeTvaUe8huRb8XqP0jIMyE/AWKPef9sK9Df9YFEaKXNJ0/g+aZV?=
 =?us-ascii?Q?gygg5Xc0QOASa9jcM5n46dlR75JSRN3lEDQrwQZJLgaZrYyVs4saS7JoYIdT?=
 =?us-ascii?Q?f5Q0S0jsz608ReOBhMmXLfD/Q9ke5hHYPPzjbgStca8YgbuR0lJtk61ZDDL9?=
 =?us-ascii?Q?Va4+OU+T9Xmc+6XF/xj2FOwUsDIBwHkuzBBsPxTU1me3z04FWl8b4F5BwqjE?=
 =?us-ascii?Q?vNqX3Se1Zcl6qCAwEpeSj6dFmiEvQSy8SsA1qM2rOl67LD7upzw/2oum8h6v?=
 =?us-ascii?Q?1FYRXOm7GsPWmUBqAynP4xgru0qKPL2B+IWZdj1qwIzuHuqCHda2lxPkYIUl?=
 =?us-ascii?Q?iXm7mFI8pj4gVsftfAfyHIzQL1riwD5a9Z3mQBDP18r/E5zQxIIUllwKVih2?=
 =?us-ascii?Q?zhUrHMZzQCj5dYuxu1IvcJEnODsNA/S75ybz+er1j5fhxQlLlURpqnlZ+FFC?=
 =?us-ascii?Q?jD5/pKTRwe0yZhosCsiK3DSFm2GkdOGyOImpKjqQlW6LdoGaSjibXvYqyiv/?=
 =?us-ascii?Q?34EWAKSJTd21LmPKCjxwGNjFD2dmloX8S1ySDTTV?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f7541d-064e-4b7f-7aff-08ddd3f44d35
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 07:47:17.9085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: effjlxQsvSkmmsFd2Rfgl3fIyWqmY3GADkPmcSEO6FAsciSXjdJkgk6woRg1/I751PLJSW69lj6ARefdLbM3RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF022ABE738
X-Mailman-Approved-At: Tue, 05 Aug 2025 17:05:36 +0000
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

Remove unnecessary goto labels to improve code readability. 

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/imagination/pvr_cccb.c         |  8 ++------
 drivers/gpu/drm/imagination/pvr_fw_startstop.c | 13 +++++--------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_cccb.c b/drivers/gpu/drm/imagination/pvr_cccb.c
index 4fabab41bea7..ed7e1c8fb71b 100644
--- a/drivers/gpu/drm/imagination/pvr_cccb.c
+++ b/drivers/gpu/drm/imagination/pvr_cccb.c
@@ -69,18 +69,14 @@ pvr_cccb_init(struct pvr_device *pvr_dev, struct pvr_cccb *pvr_cccb,
 						      NULL, NULL, &pvr_cccb->cccb_obj);
 	if (IS_ERR(pvr_cccb->cccb)) {
 		err = PTR_ERR(pvr_cccb->cccb);
-		goto err_free_ctrl;
+		pvr_fw_object_unmap_and_destroy(pvr_cccb->ctrl_obj);
+		return err;
 	}
 
 	pvr_fw_object_get_fw_addr(pvr_cccb->ctrl_obj, &pvr_cccb->ctrl_fw_addr);
 	pvr_fw_object_get_fw_addr(pvr_cccb->cccb_obj, &pvr_cccb->cccb_fw_addr);
 
 	return 0;
-
-err_free_ctrl:
-	pvr_fw_object_unmap_and_destroy(pvr_cccb->ctrl_obj);
-
-	return err;
 }
 
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_fw_startstop.c b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
index dcbb9903e791..4921acd4e757 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_startstop.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
@@ -155,8 +155,11 @@ pvr_fw_start(struct pvr_device *pvr_dev)
 		(void)pvr_cr_read64(pvr_dev, ROGUE_CR_SOFT_RESET2);
 
 	err = rogue_slc_init(pvr_dev);
-	if (err)
-		goto err_reset;
+	if (err) {
+		/* Put everything back into soft-reset. */
+		pvr_cr_write64(pvr_dev, ROGUE_CR_SOFT_RESET, soft_reset_mask);
+		return err;
+	}
 
 	/* Initialise Firmware wrapper. */
 	pvr_dev->fw_dev.defs->wrapper_init(pvr_dev);
@@ -185,12 +188,6 @@ pvr_fw_start(struct pvr_device *pvr_dev)
 	}
 
 	return 0;
-
-err_reset:
-	/* Put everything back into soft-reset. */
-	pvr_cr_write64(pvr_dev, ROGUE_CR_SOFT_RESET, soft_reset_mask);
-
-	return err;
 }
 
 /**
-- 
2.34.1

