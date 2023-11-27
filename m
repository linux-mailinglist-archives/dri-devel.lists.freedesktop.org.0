Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0457F988B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 06:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4AA310E181;
	Mon, 27 Nov 2023 05:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CF810E181
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 05:10:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwZeynRGSOIcXvwHRIx0RBcFqe1FucaqFM5wytaXDPyv+UbYvCcN7uC7on4KyHRClx+M5c1MpsndOItZ0pcAS3s5HP8+qPue1vlFd4HWaQo1ffME+8bg/HiEbbX2+nhqTWfgeSJWXACk6ioA/ENMWvOXnya0owF/lDPIYwaBTNlmRc+iMjpALsY/AtnxDQ5OQeBu+ts9O4V2fdIEaj9dqngT38x9gvSOdbOIgO71667vc7c8d3buAe0ekgeNAdnaPU7ssFfMQLLHwu4S38ICGGsy/QXDwS+i9x4WNYJrWrW+LgVVXKDVgQRK3D0Objqla6u/mWdgq39zColOACGXTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4H8CoeRgMRXKQ1atlM4es6H/VQXCXNsOCyDVttO8y40=;
 b=FT8B9pkNI3nuH/EjIOZnw/L6snFMAqmEoqUIm2+mKOYjOF99gvvgsxEjxyk0xqq/uGU+wmYHPwn89X8ba5T3Dm2tw8c5X54NDnVe4pzhkkR0hcVZmAEVRc0ZFK6ODJ9VVvJYz4FQoHZv/gqYU0UDP/GhwO/fRVx5Sv8cZ3HTvli/hRtTC74mSgI07HEs6nXY2l0WKds5OnR+06zI9eZOyuMM1mPLFJf0PZjVYmcGpV/oFfYnfx8QdVIh0QSN2QEdTG7Yyw2zzhv7aYof6oVIKxdqe+SkxMelhMECLQyx4vNaRdoMRRmdHxnvflPernLIyjrRchGYVBm1kSODmGUU1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4H8CoeRgMRXKQ1atlM4es6H/VQXCXNsOCyDVttO8y40=;
 b=MpzsM7BD2smJACHL3z589zGYFx/L902i2lEtZxZh0g5u8hlxWrCHBDIlMzz0YJoo4qAmB8p3f0efyiNQjzMKfP8VI7yBaF01dkAsXA+YoABp1V0fTuECC8/97+LZwKlHHomjxPZDkyGNBqH02AyYkdaWC3dMCZUCLxONpLmL9mw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB6961.eurprd04.prod.outlook.com (2603:10a6:208:180::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Mon, 27 Nov
 2023 05:10:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d99:f43f:65a3:9bf]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d99:f43f:65a3:9bf%7]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 05:10:07 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] driver core: Export device_is_dependent() to modules
Date: Mon, 27 Nov 2023 13:14:13 +0800
Message-Id: <20231127051414.3783108-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20231127051414.3783108-1-victor.liu@nxp.com>
References: <20231127051414.3783108-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 05668dcf-cf8a-4525-b087-08dbef071f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ghIeuuMjoVMyO6nJC1YOydTyD9tCcKeaNUaJN7lZP1Nb47nsjzl3P74I/dLLeRpdifTIBIi5h8l7uMYKnkYWiHOZk7tLYSR4XCxY05G6At/SdCr5KZsRWSd3SRP0a0ojqS1Yk7Z3x7nSD8punuikQnmyQLWyuIR9Mcf4uHYCZslJBk3Rq7rwWWywVXxWku2CwHJMOxlQVL2MgRZsay7r4J/83KDsOH7Z8UvplmL7HKVpRvGrc2jiujU1Hzdgb7tTy2hyP0nxpQFeWzHU8+g0yqixEKBUyOA6/pfHl3D8VS9bvWqoldpo9Sic4MBSbcQsww/NI5ikA3DlXtP2JXnhHyH90UD30NyklkbbCw7FJITrPiN96JudM72OhPwL6L8lFHb9nJmywzMUnnHz7rYolP1yGoOdtf4PbauOPXRQNoKx3UDdnO+l1x7216lJ/K0N4IO33lkGu5JqXma0n0lNzWzsvj5v7DdR2eL43b5tMUPBJ83ONkIlaMVxdyo2AMLhZ/N7qA8PEXzCVNF/Bl5yVJmT0pO+VmUoyiQvUai/Kn5rdT5BMs8Z4l6cIZrvIVB554egHpAtV7cOSStrya6ksNDN5f3RAltlCEsV52GQe8pno0zSsige+TFj1Cn+ZBb5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(6512007)(6506007)(1076003)(2616005)(6486002)(478600001)(52116002)(6666004)(4744005)(7416002)(2906002)(5660300002)(41300700001)(66946007)(66556008)(66476007)(316002)(4326008)(8936002)(8676002)(38100700002)(38350700005)(86362001)(36756003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FhwI5jK8lk5xtvcwbm2wORVAu1+1ihHUlYvOrsjvz+sVTyLzxh46Q4/gB/yK?=
 =?us-ascii?Q?YDl8zQwZKINWABarzxRYq+FJ3/1SOqCysnaKTbLC/quLNLw73yOYUJYCMhNk?=
 =?us-ascii?Q?TEYco9GfE0F/cdq9cEOHJJLUxs+NQHFDZ9IE7O2FaKryJysi/Cccwg4B30fh?=
 =?us-ascii?Q?L4xqy+rXWksjc+zA/ucq3SlJrSn1igO0S8IvqH+TLylgkj6dMWDEJ0JB0XwC?=
 =?us-ascii?Q?xGQ65GyedRvZfSxkyCylHOBAU+8MbgvScGQLJiQluuNSqLh8Jkx+XZjKR2wp?=
 =?us-ascii?Q?qUiklFOukl0zX3kn8njuC5HZnoOBqWSRkPGXiIO4VqXmEFIMtcGsQ2MfXW02?=
 =?us-ascii?Q?5dDM+Ho2H6m8WKJVfcui/BSIuViTAayLs5fbG1cgn7sHnO6befeMvOX0ND6V?=
 =?us-ascii?Q?ol8ecClZC012uPJ1KreNA/OQVCfsnjfIOoAyezLpbEV3Hz3gcAjWLxALoRgB?=
 =?us-ascii?Q?28k3cI60SZNxzzp4wIoL3v1L+uH4X3H+822BsZm5OPTzht5LRZOCmfYLHP56?=
 =?us-ascii?Q?3fmZAU1uyPDZ6taIOhu3gin4ml+pDIIcVBF6ogwODNVBKVt44WfcmRxW4uDN?=
 =?us-ascii?Q?UhDn4wYoEMubXGnhs3BRAau9c5aTPWiF3MXNXqoFwHDsY7oEi3D39qxoL2q4?=
 =?us-ascii?Q?iFGIuoN/ZumQhRa6FU5Ai7HKy22mx6wO4hW2PoZIvvIQ4nGaDEaxStCnw253?=
 =?us-ascii?Q?MJDi1cm5FgINJbLX2STSh/vk5G8qKHgILYY/K1uoX7z4O6UUKp+BDB4sirgc?=
 =?us-ascii?Q?lCyIXzz1gOPTgjigwXaD+LPHgqKC4Pti0XESlyp3kCSJJ5TcxpzJE9aYCSF+?=
 =?us-ascii?Q?HIaFZwdPItBb4MCqMlEEegJZzgHIzD6FIWF/qPgjgVKI/3j20Vb/UbL1lpY1?=
 =?us-ascii?Q?PjPoE2HULqOYf3RFEdm85u0j8X39MBMJgzhKzqNMwT6vuOtpLy3GxY/+1lZt?=
 =?us-ascii?Q?2iKKS6qNEh0PMfQIZbM33BtzRqiUIi0HAZxW6UoGFud0kjQq3vhMJDAIfFBx?=
 =?us-ascii?Q?cEwOkSIypig9VSQ46LxXVphsERBFzFfoH2ey+OSSFYUn883v+Mgt8f4726v0?=
 =?us-ascii?Q?GkfqtbD0TlN2ztxqcEmjGYVWxqwVH+qhpMPUGU3j7jLuuX47aZ9WwOGLv9ZJ?=
 =?us-ascii?Q?ydPcsOg6ZAkiFa9C88OGKL7AGqa176YZVgvPeZIbyFanLm7YVo9rTXFGnE9W?=
 =?us-ascii?Q?vvhKxExzsZkTY9c2GggfTsZw7SSFP2LcJUZ+fJCw6YE8vakh4Uj3/c16ZJJv?=
 =?us-ascii?Q?h/JqdG0HozpXHLvSD9HlVhfMmnp5KNpo2bGIGxJGLMKtNtMROmkeT15XFbov?=
 =?us-ascii?Q?CWCpqGD7gYfgwiUMGaLs9kcq+aoQslhH6ymhmGye52w/nWnDZBM4a1RVb4uj?=
 =?us-ascii?Q?Gbu4UOD7O+zjipLFJxi2iY+gABWhtJkBAkyAdftzaOgRT2P61GYMrFdnDdU7?=
 =?us-ascii?Q?3c0H3PQ45sXqO3vRiiVN0N++BuULwfnqo349TJb1N9j8M9vtu81Gj6Kk6kFj?=
 =?us-ascii?Q?jZDKBjyeH51m3jhgB3qawaqTRWSOuV8dMBIGttwtelcCecQ7Ei8eYUBJu/d4?=
 =?us-ascii?Q?7IAn7aZ83DB+M6p/9bKcYlpuyArzreo7MzAtKLFi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05668dcf-cf8a-4525-b087-08dbef071f21
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 05:10:07.2510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAz6MsCAZfx5tfOCjkg/mSKjan0upAJLZP1WWtwa+yM21R6i8syeXpQJegXzBbFIhQeX7Du+WGcPVeN7cMlM1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6961
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
Cc: mripard@kernel.org, sfr@canb.auug.org.au, ulf.hansson@linaro.org,
 rfoss@kernel.org, tzimmermann@suse.de, rafael@kernel.org,
 gregkh@linuxfoundation.org, neil.armstrong@linaro.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-next@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export device_is_dependent() since the drm_kms_helper module is starting
to use it.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* Newly introduced as needed by patch 2.

 drivers/base/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 67ba592afc77..bfd2bf0364b7 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -328,6 +328,7 @@ int device_is_dependent(struct device *dev, void *target)
 	}
 	return ret;
 }
+EXPORT_SYMBOL_GPL(device_is_dependent);
 
 static void device_link_init_status(struct device_link *link,
 				    struct device *consumer,
-- 
2.37.1

