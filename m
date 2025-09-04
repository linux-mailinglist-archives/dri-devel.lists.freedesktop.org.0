Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2113CB43A0A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B8F10E9BD;
	Thu,  4 Sep 2025 11:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="SgN3yfhV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11013010.outbound.protection.outlook.com [52.101.127.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6038F10E9BD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 11:27:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwhrM6fMmX9o2bwm81lbefwUp215C1FukfFNYh7md2HHHOlHTv5H0Kg5vR6xciA5TOB2UXfGcoURnZCoNWNIWsEdipf1yPc/8K7qbId+B3LQjC6+OatlcKKV+dhHt6jlNTyxI/19A7QirP+o84+K1BwV6LNEJXhjTmyn49Sb+d6QDXBFwhnXBtCkaV11SmmK1Y0IiD1j/Wu/kR0E80WJrNAsAom+i9jFYLe/MERM9sk4v+QCp9KiZRvSWYQaHIgirhxicq5ImeOMDgxjUAWcBkr3XlzaxBJl2EZILGf9KfSNACD3MNuwGLnyqkIJ/26XgboTt6CetTZEQumZVjvCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iye3zsAfvK8RkMz9QDdDmrigsbbx3eclSPK38+Wt0i8=;
 b=azI40+/WV4olYsd4wRG3BlvBafR3ZQjMBfSsIN+iepAyU9DZd9ZkfIqX6B5kh5u+MXJzStWTl4NaUQ5lFThD0TISKnk9fZbJ3vReWIzVKP6hdVtjnOrZ457JpnbB3xr50BpovdqKED8QLlXdoOk/TDPtXNZ5L/KG3Zu2HdRurrxBMQNSKxj8BAM1C2D9P+LX2/BYbLmXOqFZYRymYLGnsx3dcUhAtE6miYK/0jbzG2gffAzwKtNayF3DfFczpmsjcEnhz2tpP3ekweOcNPTYIHw86BOo30dpBbwaDQXTJmWGoMHUxwOx+Ui7zfOPmygizB8FH0c0gc28U+dQVYOFKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iye3zsAfvK8RkMz9QDdDmrigsbbx3eclSPK38+Wt0i8=;
 b=SgN3yfhVBpWDneNSvKOv41/5iyCGLH+sx5yDiw0cw5A1HKVVojpveVjoRZSSZBRANU86KDIBD4cWpQnEoxWu3eZ0yVzG7YazSHbIxFI41u64jozyhQOTB3YCnD4kz+XQ6udUOScWpDAel0x2EYWzxTI+HSiW2BP+cbQVdFstBtb8Zr3DhtPNsuM76zc56mUgaYdBQIwJkJEbaQELlVb+m4CJHSVXssrlnmk/5M6S8BhPGIh3pHvcNOT44UvLq9r5Rth+0xOFyJU10rjfOlpccT6pyshxhfrpC1SjW+Dqy9gvyoCx+iiCYREwDFA/Hl/fncj4aIu0OrIrTteifPQVaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB7063.apcprd06.prod.outlook.com (2603:1096:405:40::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 11:27:49 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 11:27:49 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR STI),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] drm/sti: Remove redundant ternary operators
Date: Thu,  4 Sep 2025 19:27:38 +0800
Message-Id: <20250904112738.350652-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0007.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::12) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: 8209b2f8-c6eb-426d-1300-08ddeba61400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2bd9LKbbQcxpFLG9XUo4KmWK460qqgHJVzEDKE3maQQT+Dn4gHq4kX+b+ehg?=
 =?us-ascii?Q?aq78tTDrwYrPpnHuSuAQ4Ih4EcRvuL96B8SsGe8omRirEbCo+nEaW+eT9yFx?=
 =?us-ascii?Q?wmjUxEv/OZrPwNBq96Lnlv23rUKvW6nacBJVLlQunuIpBIepYpasI6TuZFBX?=
 =?us-ascii?Q?Ahq0Rrw6ArhAgwIeGFDeopUpQkfYRWbmnr0CGzMdNxHmHK790hqKYw5Pd/lV?=
 =?us-ascii?Q?dkIj+h3ZLj4oLHZfth066ked5LyC5HfRP4pj8HD8fw7nWMtEdtJVn7KQrYQ9?=
 =?us-ascii?Q?exMcQsGZKR/W85JSzVrS+E4tOsjjtk1BsSiqlRznXhZOwTkb+DxJOWgvPF1k?=
 =?us-ascii?Q?qwvy9X+iVmIU1qO6WBROFL8QZrPJavZgWxEvDTj2/G4WB2u6bj8OZfTCwUgb?=
 =?us-ascii?Q?TQieahdG2tj0lxTwOu9FRYnJDvdkasqw93foit0E4aH+eAYkeYrO717hj1Co?=
 =?us-ascii?Q?I9HzMsY0kX159bAmUtK95rlyrBSoxmFT8jfsnvnLP5Qawd04tbtcx+qVeYuE?=
 =?us-ascii?Q?//cd5QUtBXz/mzo2/9yv8T6WpgWq2VKFLnE1YWtncY0swQHp8ya8xX6RH5zB?=
 =?us-ascii?Q?YQoaOmIj0UAQSopkQXE31OlbJjItPELYLVFhARdhqHpXKRSuPkNqweRC9ebz?=
 =?us-ascii?Q?4lJTo5+2Fhid3XHSivs/2sAUwap95o63i34N4BXIZ9xH4g5ltsbhu9IggIqr?=
 =?us-ascii?Q?x36tAuLKdI4SR9fDOE1Lvzjtw6N+p9krsXypnujDaqlX9aErEJWGmMvzRQSI?=
 =?us-ascii?Q?/1MWhPROTBiiVKa0mh3t2jebwhHEM5P1WRqxArtRsQQ6O84JLrPZ+icg18V4?=
 =?us-ascii?Q?9zMsNqHPsOQnGIU1AdCfe9LYuaYzWRZkaAw8055OiKHmftGdYl8Csy7kS+Fs?=
 =?us-ascii?Q?vPpsj8/gfHWIsBwIF5CxXQ98b60p/tpMNtajqJVX/PbGrW3RLz9G70WVQEyV?=
 =?us-ascii?Q?6BVGCN7eMXsBFmhmw1YiB3K5nfTXPauhdzAlCqZsSoh9LVAjOyl33R/dC0bC?=
 =?us-ascii?Q?NB4NNf2C3+pr4Dh4fk0kJj3mBCnn97CceLCzLwfFdVcKgESHcURiWVrRE3ed?=
 =?us-ascii?Q?gHDXlxdghYxEvbRI9oh/aD98fDdCd9hQebHpsT8Uwrs2dIYrDHCXDpCpR605?=
 =?us-ascii?Q?Z3EWEDEaPx8yuBCSXIDVWCOFTxSAA0CqunS53Myo5r9u+1gtFA/ywM8woK4j?=
 =?us-ascii?Q?ncoq7YZtFu5ih5k9JlmdFFFlH1K7+RvE+0B7BXQNDsK4svvRXLh5Uxwaxf6y?=
 =?us-ascii?Q?Vt5kKo1+oFJWF4mF9vBBoCSUBgudKBetjFuH7dpDR8tTIIWfKY9DuX0tbGpy?=
 =?us-ascii?Q?TpR0zdOWzevB2iWCn6rqasucTzokIdZWwsfaJQx/8xZleh1I5tppsBro8JEq?=
 =?us-ascii?Q?U2+wAEv38C5/UNWYOlnLSYK8B6g8IxJygC6+VoeMtJG5KEKVDVlNgp7m20sL?=
 =?us-ascii?Q?4qsjN29Jy1c63aEsvA4hkpViyk1fFCrfkZl7fTC6n4cngRKIssJp8g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A7eCsqihOKM2em5U4gpr9dsY7d/1y9gxyZHuyhxpE9/N/6tW0aHJ5uuRC4jA?=
 =?us-ascii?Q?dRsA1t+iS5hO5cV7q5Bn5DI4NC1MO4PM35rh/D5LGP5CxFPPZSEHvFaB0YeG?=
 =?us-ascii?Q?CYdJ6+M7esN3Yp5QbMKywnBH540IP87appshsp4epqF9/dr9+cQGjjAKZIxi?=
 =?us-ascii?Q?2eYzTgXN00h7fU9YbJfS04CXPnZ41KBIs9+znknnxof2hDkiuyC0yF0PH0ML?=
 =?us-ascii?Q?VRgHIzmfx6dcKEFJTw8FvLDpljw0GbDaFdGAZPaFNHp8uq7jXzjXxtaloH8L?=
 =?us-ascii?Q?mSsu7Jqcz2mAJTu7HL4tbP1lgFAKNwFBvxzmDPcz+jzNtUR1j7D8OdFJBMam?=
 =?us-ascii?Q?iriRzOdhG1WZVAAar5l122XBrOPyjRszAwNFbgRIdOmXRR+8fyEzZtkpshD/?=
 =?us-ascii?Q?eDgwW0yf7HbYXpJW/rBRVtwOy4ZhuMQJoiSBczU7ejBDUdT7ir7RhukZEH3f?=
 =?us-ascii?Q?FZkSvBTCwcI0PiT20xl0AGbTuxw7d5TmJ7NHJEqD3Pf96UN+OOPrBnYGk+gO?=
 =?us-ascii?Q?J8AkB64b42IgTtOgtbrN+wqJKIhgLokxijXbY22MZtZRBz1AXOqRjzcsm5Ac?=
 =?us-ascii?Q?153ETqCKYFCsNbNdhTCWFjuaJtyrWPp1sx3DUqaZLgtlWUl1bfIGcTn8g5rh?=
 =?us-ascii?Q?LO6L//Q1YcTfz2Hj0GYHPMBAG47kiXyJEuUPxLkp/XMvIZFP7Bt6guKF9jw2?=
 =?us-ascii?Q?kArLhF/tD1ak0P226O3XE7rwdAzQ6AfnwhrivwGsKsR5FOad1CWZek0a2jkH?=
 =?us-ascii?Q?GP2vaI7UkPFmPnRkYLwUWqlhANUgWDctpLrZths2VOKrCt+jSOYJaecGDwi2?=
 =?us-ascii?Q?gmloQieWJKyW1IkFE/Fcrki9WNGGoLd7Srm8JGqh9G4RHFGxroLSutG7eL4T?=
 =?us-ascii?Q?DoQ+ULGr9O4tV1wiSxv5dFbI0On33SqVnUqgGTfIvTSAnHz7EnI9NG9qx/9k?=
 =?us-ascii?Q?igsavs4qCSmJPd2VXXGJLzltZ62OrD7zE84LJPqKtzkY3xF2lEjbkD8PHrFr?=
 =?us-ascii?Q?WNbhappuZUiiET/Cj9PR7l+rOg9MY29/OUPkm5/s4YofhKIF+igA+ra48aUq?=
 =?us-ascii?Q?btz9jcqg5LDBZMf2Cxbebv+hNVjmrzOJVDmgai8etwu3FmjXdWc+w7nUELGy?=
 =?us-ascii?Q?L5/QMIXyETQ+uyVJ734i0EE/YN+o1DFlbmdxnh/mpVfmEGfS4PCRqk69R3oG?=
 =?us-ascii?Q?e1P2QWAUziT6SzQvPj0ktj49pOUUBJwy/xa50lH797/Cf90cddkgNmMR8sSp?=
 =?us-ascii?Q?+Q1ChE72EgVy6SvFwS2XcKPcDoaOJO9sWh5dIFSQsfLrvjxUoyQqQmK95hOA?=
 =?us-ascii?Q?+deAo08XyF5m6jo+HKQOfY4tREa3y66Kq8/Umn/kly1cKt2YJTQ3vce3qnWl?=
 =?us-ascii?Q?Sc3vPDex3yNujDGRYkNdWE4KuMEkCg/Njrfu23EfPzcIhFExbsWI9zQFAhkY?=
 =?us-ascii?Q?LiHqmdOwYgn0PyByjKwu1ROG/HB7IUNAsfF34iDjvTM4jNJdVaa2om6mt2yg?=
 =?us-ascii?Q?RsHNsdjhoyeiK1cJIN5BDpI/S0Aift7KbKq/L/qMW2BOmkt9CyiM4q9hE5Fw?=
 =?us-ascii?Q?swhthJa4OD25+xxknWZkAMe3X6DvUlE7VYdPNi4/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8209b2f8-c6eb-426d-1300-08ddeba61400
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 11:27:49.2088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8PBd9nI6OVoDu4qbtGK6V9G7IvgCrlor8a774llqeXzr6IHzwpUTHY9rRqfMD62CrN0Rsr2wEpLfLj2ikZLkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7063
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

For ternary operators in the form of "a ? true : false", if 'a' itself
returns a boolean result, the ternary operator can be omitted. Remove
redundant ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/sti/sti_hqvdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 03684062309b..b76606e9a82d 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -744,7 +744,7 @@ static bool sti_hqvdp_check_hw_scaling(struct sti_hqvdp *hqvdp,
 
 	inv_zy = DIV_ROUND_UP(src_h, dst_h);
 
-	return (inv_zy <= lfw) ? true : false;
+	return inv_zy <= lfw;
 }
 
 /**
-- 
2.34.1

