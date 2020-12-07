Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CB72D0C35
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD6489E50;
	Mon,  7 Dec 2020 08:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70071.outbound.protection.outlook.com [40.107.7.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954F689E8C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 03:29:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOM96QZcgeAEPGicwH6LMRbwkCIwRrkN1HJPT7dSaDp985lrJtfRBN8+Ib8RDpMEKuD46Jxyax6nPVcPbujzjaN3+hlz1hivPWD2vBVVldvD2i8wt2hCM49X4Pdb9TLy/5j2EsPYFqocmupPemsoNpg/80NkGswuVnT4mr9y8tTbVhVZynJjZFIh06HYALsnBSUbBc2z1ZyQ1uCVPw1DYWHSZumhAvQZoevmI+UmamxE5s7LtzhgN6ZiY5B4jlx3yu2eM6V5h2BpJYAgq++cym72gEkw6ouwzvK6r3zWYS7RhpZtjifie+JyA6jou7fe/6ANK9vO0sQY7pNvwPLgbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JL7Nxesg7WWWHg1Vc0Qj2sVK+AtQdmWw6DZRerFjmbk=;
 b=UmNVJ5VOt446GJ5znsGKXseC2wb+da4/BGNPlNv4dLFCmM++ALmiqE37psG7X4TPzRjHVoKnImf7RajcOiFkOBYh9XoaR2YWPIs3evOyNk8Rzr02HAkoQW7+oPewhSYqar7tJwhYmgiifE2AanZSmeG1I2PTHIlukO2QquEDZIUNMA9MnIEBLorucWEWu0CFUPqIU9TY8d3PB754VM8Uhlw+1goIOQpm9qWFg7TPJ07mmPvjB8CeFTk0CItFkW8zUZIxmMm3AHSJbp3NUnJTKgtazplDkrlk5db/QRgxKJ2RKHemlO20N3TlcEDp4w5bfxwmUc7Kihz4Sa2fCvOfHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JL7Nxesg7WWWHg1Vc0Qj2sVK+AtQdmWw6DZRerFjmbk=;
 b=A0IvkBj4R6LLkbmPkeYz/2yyOl/u5gCBL4j6DGZ9j9E/ojzyFDmW8mkXzQ/PwRGn4BZCe8l/pHtsrrh+c+y0x0mDQc1J8ohH71EQNNsyZmsAPpMS0q+3Tv//wMyhrFK7HQdubltvii2NOrWVjOnOC6sgkKW0wVBnRswKnlpo1xU=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6349.eurprd04.prod.outlook.com (2603:10a6:803:126::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Mon, 7 Dec
 2020 03:29:26 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3611.038; Mon, 7 Dec 2020
 03:29:26 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] drm/atomic: Avoid unused-but-set-variable warning on
 for_each_old_plane_in_state
Date: Mon,  7 Dec 2020 11:20:58 +0800
Message-Id: <1607311260-13983-5-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607311260-13983-1-git-send-email-victor.liu@nxp.com>
References: <1607311260-13983-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0085.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::11) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0085.apcprd01.prod.exchangelabs.com (2603:1096:3:15::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3632.18 via Frontend
 Transport; Mon, 7 Dec 2020 03:29:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d73b3829-3fdc-4c22-a93a-08d89a604c79
X-MS-TrafficTypeDiagnostic: VE1PR04MB6349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB634963CD3DD8CEB5B4ED7CE098CE0@VE1PR04MB6349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pfWxtu5NWM4cTN4A1CYm8FUW/WDwuoNygPEjb6/wMYhd3T7eMFk20PIJyC7cPNltgQZF9A3TUuUG6BXmRZoDJfHGgKeS+VhRusuXdMSUPezrG4EuLkjeNldAAvYBmI+VFYp98ceECM5dbhnYdT4pm6gtd/NFR+wsAvzWLQXFfepqyQSnfn7zv84NlEjV/AUKVu9IJaCfsSLWN8sQcjfZcPMvA9lvXkUqxYdfbQbge+Zi8NxSSp/1b3ktbPdPCxo41WBBUCZoDM46Y+d5KYnyzv2YQp87h7i690M3VHgSLhTQ49TRojK+HVOSkIh1QsIWqRxTe0MpdVjI56crYCXZmEzNoBnBCxM6OSFekI0ut4q1N4urKhyGaK2lWaV6/CLM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(8936002)(6506007)(6512007)(2616005)(316002)(52116002)(26005)(478600001)(69590400008)(16526019)(186003)(6486002)(6666004)(4326008)(2906002)(7416002)(956004)(86362001)(36756003)(66946007)(66476007)(83380400001)(8676002)(66556008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tMyO6jk4gAM6VaRuQUzR9cAeph5uyDbW+uXn4SaCXL5XgOVGItisSwW8iUgE?=
 =?us-ascii?Q?CUuwQIK1cFTT4sKVxxmeTbUgpbG9X45wrmMKI/h3wZDSw5lGA5qax6DHS+fF?=
 =?us-ascii?Q?1JGeB0TeAuF0+6hbTofHLda6BCMy69ZcyyhjPNp+n8ZH50lFMEK9vyODtEOB?=
 =?us-ascii?Q?49zUZwJfosxQ9yYvtFtR6eNFxPznQvpU5kSZjor9ao1ejZGZ8t/ZBZC1ClCF?=
 =?us-ascii?Q?zYrXheSPMZOlRGXAtCpfYyqeFTBB8M8Iwkq8v5FTxetuUMkOWNkeYn9c8PRY?=
 =?us-ascii?Q?mvPHVWE/mV0xDpO/m19qkknC4VHnR7gL/Hl1fiZ5sJbmFqBuhWQi0/31fIUL?=
 =?us-ascii?Q?1FmUCdIIiL/VkBSmbUTSIvj5Gjt31GOR4EBOmqJhNpiRZsv79J3QYcvUJNDQ?=
 =?us-ascii?Q?kE1Nxi1I5IZm/6CCj8h8xE8pDW2Y9/jzjXuBH9yYYVr2RRZgsRty8GtGHEeP?=
 =?us-ascii?Q?2g0Dcqzil/txyt8o06mBfbDwQ1G4Vm1s+4QhCZleM0kKxl/4keV7BG2xleA1?=
 =?us-ascii?Q?kP7LtLNbJOYUcB+Se4xM6FFzxuG4YV1zV7L3m6fvNuFaeiO8qp+CIymxYMkh?=
 =?us-ascii?Q?BKj9zcuhtYRfQ+YVqHnbjyKnOcMzdjBabK5jt0Y/0lT9o4HQRCuluvLqMxeH?=
 =?us-ascii?Q?2qV+MyLWuM3EQQ4jt+5gE7EOuBBWB4R37cbYuBxxGwHjL5gZujFDKUT3QiW0?=
 =?us-ascii?Q?Ijold28iODtdCiv0z3JbGMoumPj11c9LiSN4neZ+43tUk6VDgN3GBk73WA8q?=
 =?us-ascii?Q?fJ6LfovKTXLQzpHXqL3uwiQKQv1fMyM9TytJKPdL0Z6fl/2da+WDFFGrdYlQ?=
 =?us-ascii?Q?A1A8zYnZy0UFSKXwcbpiub+bisv1Wew89ERhljE1JWh4tDC3IU2ESvXLXpdR?=
 =?us-ascii?Q?L9MJ5lrlAfexpc+2TpL1b0EMGWNXjRvFhQE08LZmc38F/W+lBhxsNIynmPYD?=
 =?us-ascii?Q?RSk/ZloR4AXj9KIDbXXWWd+lhIOngN//aiJ46/1NSrcwlriOI785m92JFPbm?=
 =?us-ascii?Q?AFep?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d73b3829-3fdc-4c22-a93a-08d89a604c79
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 03:29:26.7152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIJ7ZnIHPE3gvY6HGKEdc8y3E6QTxTfBLy0VEQOdBUN4ggQ2zIqfVXgLsF0VRTgQucBfE/xnMR+d+RGlzGFrew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6349
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
 laurentiu.palcu@oss.nxp.com, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Artifically use 'plane' and 'old_plane_state' to avoid 'not used' warning.
The precedent has already been set by other macros in the same file.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
