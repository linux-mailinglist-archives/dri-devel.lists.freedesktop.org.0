Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604CFACB0AC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A78110E2CB;
	Mon,  2 Jun 2025 14:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="AN325GQ6";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AN325GQ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012030.outbound.protection.outlook.com [52.101.66.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980B110E2C7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:09:11 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aYj8J/G/mqeRYyiI2ca7eeAz2fJcgoFza8aUBnaunk2D7BaDtTWtW3LoyM4+88wzDUU28YMdEuLCMskEiYx1HR68Pyiz8tqiNCMXQEI8Im63HHulvsKSimLUOWH8dqY2BfX6yp/Nfb+Ht89XfKtvELnD6WWAcq+x/EjIMUbcaQgjGBn+SG3qX33fi53Mi5NF1AJartrXRuBydCXW1F/vPbmF1CUyREoyZQujT/YmFAqKwYmgRJSIEVwMgI9w+rajSwl9iFUWBIJ83rF5xGDzwuTOstqABOBMPF4o9x+GtaeTD+sM7mH5y2vRnpDweBeKiJmw1No3rJcOTOdwbcbKcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVVLrqVeaW6kxWoPxTsHJPkp4beyND9FA1VU9K1vj6A=;
 b=PJ/urn10mQiBF5CZGnf7yvIwqzNWBLCqhnr8OsXcoL4dhgk4RyzCaqL4QoAmCsnrwqqyT4BO5wflLmUa5fLav4K0KJLMaOvhmO5zJJy92MBrpOujJW2Z8omAHNssAz6ZZUU8fBHuNTkbLoQszL3lwJgiWZe2OpPBV6TXAVJWJzBnFE7JxdWEzUD1019zzCZigmb5WHdptqUifRa3M8UNu+E9IGjlUJSzzDNxTTmzcY6Qiq4LElP6CbeERtB6HJlPtqarNkmOELieI1VjhsjAfjRl+fnYLrhzw7CbKWbuq+9X9SWKKTtiyPJJSuaqz08wx02QrdBR1QTiSuedz4PunQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVVLrqVeaW6kxWoPxTsHJPkp4beyND9FA1VU9K1vj6A=;
 b=AN325GQ6HY0m95sMQ9GPnwhUxWow3X5SwaHBmg+ur1lgJPYbbT2yN34XZ2ZVzmST1/pMW+vjn/IlmfuwmhAwvDnlIDfx6ODI8Wvv7h8DU3sfxxVOe59jkKGPjPJDmFMcY7C3NluWGIgcw0mg+FXmWZWLXemJKnM/VbcyC7rO88c=
Received: from DU7P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::23)
 by DBAPR08MB5814.eurprd08.prod.outlook.com (2603:10a6:10:1b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:09:08 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::6b) by DU7P195CA0016.outlook.office365.com
 (2603:10a6:10:54d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.32 via Frontend Transport; Mon,
 2 Jun 2025 14:09:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:09:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGTiU8m6ZzGbQUj4Akip0GaSPVLTq1jj/C6+vzRlTzt86WJlb97tv5rkY2HseQX2SESvEmj4yHRsXYQUP/4W1tBYs28bwaov+qyG7H9qcM56l68y2WBUjnDdbbjuMcF2KdLsoCcS1nHnumj8J/Mwnrgbpb9nKBOSLJjhmKJ25XJN+onUGH+a6mGR7aVfhC5hwf1KEhsrItFgsMpJDoXLTCmPT6RO5796JQUsx+/Rjzsq8TsSEscdL+e20M1ctHFSk/5u+JJ543xFt7Sscr0xD8Mk8H56m1UMbhfqF1etsrStDBADlvAOs3HIS2d3xyF5laa+ep16w7IUiAYFUJZPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVVLrqVeaW6kxWoPxTsHJPkp4beyND9FA1VU9K1vj6A=;
 b=Dkk+AnLzbK0fDEXUFJ2iFxXuBfbAPfbzqtrXA3k2KQl712N6I4Hjus8a9h2CYfwpE2iwcMX25pf3yG05qIvhm35HyNthHUlSfGOyauLx8SHEILEUknrgTvGJ9RNq9kCxuQXiFOR1vdXpt1H5pwTnshsoLC4IJAUleZWWu3wGlwtWVpRYJWagqYE9/WYv6YlVHfSNahrsM5UQB6llibGvjsJhdqMYsFYO2AWa8jO2Vxa8E6WwZCkj0z/Gw474KSc9/jLzloIxAPOlVVXJx3HhLcdRGlLTMQif8uTG0hDcunvr6Wou8HqHxsaMqWKUrYEa2JS0IMmAnK466CHin+2ZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVVLrqVeaW6kxWoPxTsHJPkp4beyND9FA1VU9K1vj6A=;
 b=AN325GQ6HY0m95sMQ9GPnwhUxWow3X5SwaHBmg+ur1lgJPYbbT2yN34XZ2ZVzmST1/pMW+vjn/IlmfuwmhAwvDnlIDfx6ODI8Wvv7h8DU3sfxxVOe59jkKGPjPJDmFMcY7C3NluWGIgcw0mg+FXmWZWLXemJKnM/VbcyC7rO88c=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GV1PR08MB8033.eurprd08.prod.outlook.com
 (2603:10a6:150:9a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Mon, 2 Jun
 2025 14:08:33 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:08:33 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] drm/panthor: Support GPU_CONTROL cache flush based on
 feature bit
Date: Mon,  2 Jun 2025 15:08:12 +0100
Message-ID: <20250602140814.2559538-9-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602140814.2559538-1-karunika.choo@arm.com>
References: <20250602140814.2559538-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0301CA0010.eurprd03.prod.outlook.com
 (2603:10a6:206:14::23) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GV1PR08MB8033:EE_|DU2PEPF00028CFE:EE_|DBAPR08MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a454e62-8cf1-4878-d091-08dda1df095a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?D2rSaZFra9t9F0Fgfr2hlr+QGGEBaxSwR2NdAT8u51VzLmyP14rYaBQT/TOo?=
 =?us-ascii?Q?Gx8lSFPf4xd53mF7sBdWqOGlw2qdxPIYkZ052vr9jMVDml8fn2yM1eFT1K5l?=
 =?us-ascii?Q?jrFFUib8l1b+wboba5VEMltbdLxAdlUai7wpv9Ps5wKBGzrSK5hTQqY2EtS0?=
 =?us-ascii?Q?Y4Bbiin9B/HYm5Ns2BGBNJ2ewU7PLtKqUWTTDWw/jKbxPSof3HnnELVAJFwH?=
 =?us-ascii?Q?UPTkhAdxBMTKt+a3OrcEViXQxP0GhEZshMwFJFg5PkIZ8Pp9qmYv1xz51HkW?=
 =?us-ascii?Q?M/LWw/F1t2QOVYSOqYXyaqi+GjkQ9nFl/M0D3YlFU3gkrdQ5dKBKsQPzLuYb?=
 =?us-ascii?Q?CmzHdwdG3rXvhariJmM1MPq3yRd0V1Wmxy6rWKZjBFv43dpDikzb0x8mtWnG?=
 =?us-ascii?Q?ASANvz63+ZBCHab7ff6CG+VkrpmyP+bGKOuY80nmXJeEZf0Kvl0BT8dA30Ym?=
 =?us-ascii?Q?4olt1kxZ2sSJi77zKAjQmtQMTfoHtYvVvWvqFtVfz0WnI1qZqqY0+czbnQXf?=
 =?us-ascii?Q?Af7mFAnPBVjKQBx0szexi3UBRZo7FxImTTua8JwGjRfmaH2e+Vpe5t2Z4Obr?=
 =?us-ascii?Q?xqayErYpu4RdXAGkD28B2OxiMt5D6RwDowjPti6WiurxeCHuumbKt2TFzYU5?=
 =?us-ascii?Q?Iw9MoTV/ziAOS3hwAU55z6XJz8CIcbaMSG6n1XPklLToeb57OsQDwfa4zZpQ?=
 =?us-ascii?Q?41HCQvy8sMMpIA7M5jrqsbGpS4kc4Js7YTO7tH7UBROpNQsKXgsiB5VRiwz6?=
 =?us-ascii?Q?Cch1VQasbNGRRC9eIDpG/WnZZ7bqqVbbRRj2IEYrMC9cmQ+iJJO6848nQdf9?=
 =?us-ascii?Q?/eGgRL4X9fApx1JRhsUKgyjYp6blHYJSqhdGTDGmIHO4P1WetDANMc4Daprp?=
 =?us-ascii?Q?nhsD+2BKvj/5gNGgVV3l/3HHFb3y5v9eRcATFZCyjHCpU8lJdt2lQUPKU3fP?=
 =?us-ascii?Q?RFNQifjU5vqg0eHx7/BEu0sjhzsne7SNsi9vrH6sf/7QCRqJh2UOERXDX/pG?=
 =?us-ascii?Q?dk8J4EO7QysB0WEjSpMCSj5z+v+LSbJvtFNMZ8HPBXt6BBHgeSJx+DnRqOUy?=
 =?us-ascii?Q?HfSeXNQ5L3kB33lwWqBCwDDqc2mC4iwgsRr4AcwI0gzq71r0tHdgpmSOllqL?=
 =?us-ascii?Q?/96f97zuZz2q5h2S6TXMnEzwF2E2RZme57Q4HMfPi7VICzMT/vrDDl2Np1TK?=
 =?us-ascii?Q?GPownHCUc5zno2YIPhYOE1kPu64bN8rWcUg6NDeZfLoos5CG3RaSEBpIRzet?=
 =?us-ascii?Q?6hyiwkR1fxP+guAOrNNn2NVbMhraJ3HTwzxKb8SGoqGEORxZv8IJnw1EDf8u?=
 =?us-ascii?Q?Ac5g2ppzJhyeDKfLbekbvtUIeu3tgDla1n6dBvOPNJfNohnrtdRpAhVmddO6?=
 =?us-ascii?Q?wUy7h+tHvoID8xWR82mFIaa0JUh/a6E6Io4wHCZXjDjogHqHxVSbxJFWdP6D?=
 =?us-ascii?Q?s3WYc9AFeSw=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8033
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7ae972f6-a296-4586-a758-08dda1def5d6
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|36860700013|376014|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gkO+j/PJPdN0Y6no6ymtOvexKZlnPEdwSmhcTlIdnWNddSXsUy/SoUa7Y/bF?=
 =?us-ascii?Q?rJaEFtg8UFjV56BbRRK+ae5Y147G3+IUEmekPc+WGvUiy+ZomrYrK6i8rvAd?=
 =?us-ascii?Q?ahInEJHMdxqZTDwLfQhSK8+7ZpjdQSd3hguy9NfIyFa1jnQyZQOHqBIxGrsg?=
 =?us-ascii?Q?auk4AOTuCwmk9AkP12E0AG6p6FgkFrcMX3VLZOJB/8Ds7Nt5O2fAYhKdZrGw?=
 =?us-ascii?Q?fxpIglSE9hGc4f7dTki1gHzUXIYA5i+OYXK6v6J0lJ0QfGmaHzkqYfHHMbs1?=
 =?us-ascii?Q?XJwgSZQGul6r5lRpH2qWOkDVN/k0Zu4IKlRU9UduTpdZQLQO7FjYw0SQNRYV?=
 =?us-ascii?Q?50zgoLOfHHgW7VL2uLijihnAxytB6swQ3AGdrySeL3o5KLayILN4h2UCwooP?=
 =?us-ascii?Q?KLJOkcybRMGDl11yGMWUvyXt3glM6Lg1fI5B+yREY4CJFV8hDj1KLzxIvIXJ?=
 =?us-ascii?Q?t/2p4/C/AhonCnZ2z4xBse/YX1FNhxkPBmVyCHyzOou12AG0kj7Q/ogA1ayr?=
 =?us-ascii?Q?RIljtGIqGDg61xVERKyk2r2jz+4fsCBqgGkFFhjLd2u/KQLt3N7N/eaYpSC9?=
 =?us-ascii?Q?ucvK8Ec+ByvOZQIq8KaR4VlayflyIVwflC0S+Nj43LRwSseToYpfNJe8rL8F?=
 =?us-ascii?Q?mSmvpWg4AhmX33JN9Se+jMEMe56kEHs2uSEjC4Ojl2J3Wt8s7AbAGacfcs7L?=
 =?us-ascii?Q?P8mjTGSLRcs0hZEGOWvAHEyd6BxivoFNVPs4NS335Zv/uuJM3+9K2zpb1VB+?=
 =?us-ascii?Q?bI+RY+gdC7x53JEuRlViFmsZjpXo4cSHP5iemeqQKydKRZJgjUavDUPfTm+9?=
 =?us-ascii?Q?hfxea9ci7yjVmtKVMq/k9CnMrOcWeFl1PhRSCEy1gvsXVYhceVINP/YMMrs+?=
 =?us-ascii?Q?4Ufv0ns/+sUr4CJbyyEy+1x6xMuTQgIhzDeBO/QFSAAKBnfE3gwrVlsT90Cq?=
 =?us-ascii?Q?+siqxq/M+AueYbU7lxy2yOj2K6Ae0spAlIpz9ulD5DczuQM9IrJ/VKOix7BZ?=
 =?us-ascii?Q?kLOcM3pvu5kLcYW470bNUXj5AI42T7ROrGsYKz3RPUe8uPt/bfhJo9zoQspI?=
 =?us-ascii?Q?cOiueN7ozsEhsEr3CPgItzpw1sLLcPmzFqTqRzn51RasfX/U3Rmac+KZ3DuI?=
 =?us-ascii?Q?qcHt5GUNNhOF5Tp6aeKSB5Kl18rWP7jFq5TdYaD9aWKqHJgJB3qLM7A7HlY2?=
 =?us-ascii?Q?SldD/FD4tBnlUUDyW0aNMkYgQ13hYzV/QwNjeKgVotrujxzOjN20Vfeu9dgO?=
 =?us-ascii?Q?pKK5FXQv+rdawxkkhpHFpJ26J+D5tApRXiA5Z61I/zXLZViF/pxfUJQIH3nL?=
 =?us-ascii?Q?b4ylOJZeNQCAXSk4G7YojxqjclEeUufMiXAXx3Effzy8SPkRzeOPifYyFDH+?=
 =?us-ascii?Q?l/jH53oojkCcKMW9AIB6tGwE4ED7VnTsef5zAY6v+0H+HCPRwEF5xu3XynKD?=
 =?us-ascii?Q?+G/nrxqx4plDfcsEiCFdco1mb1tWwj0w8dP84lVcHOc70apbrXwGy9bBMRYB?=
 =?us-ascii?Q?jznPIIKhrsKyLxEadb/7zAjhii2lorVPfpTk?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(36860700013)(376014)(1800799024)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:09:06.2157 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a454e62-8cf1-4878-d091-08dda1df095a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5814
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

As the FLUSH_MEM and FLUSH_PT commands are deprecated in GPUs from
Mali-Gx20 onwards, this patch adds support for performing cache
maintenance via the FLUSH_CACHES command in GPU_CONTROL, in place of
FLUSH_MEM and FLUSH_PT based on PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH
feature bit.

This patch also enables cache maintenance via GPU_CONTROL for Mali-Gx10
and Mali-Gx15 GPUs for consistency.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_hw.c  |  6 +++++
 drivers/gpu/drm/panthor/panthor_hw.h  |  6 +++++
 drivers/gpu/drm/panthor/panthor_mmu.c | 35 +++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index f5127a4b02dc..5ec9d7f28368 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -99,9 +99,15 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
 static struct panthor_hw panthor_hw_devices[] = {
 	{
 		.arch_major = 10,
+		.features = {
+			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
+		},
 	},
 	{
 		.arch_major = 11,
+		.features = {
+			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
+		},
 	},
 };
 
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 1a3cbc5589fd..2bb372fe9d4d 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -16,6 +16,12 @@ struct panthor_device;
  * New feature flags will be added with support for newer GPU architectures.
  */
 enum panthor_hw_feature {
+	/**
+	 * @PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH: Perform cache maintenance
+	 * via GPU_CONTROL.
+	 */
+	PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH,
+
 	/** @PANTHOR_HW_FEATURES_END: Must be last. */
 	PANTHOR_HW_FEATURES_END
 };
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index b39ea6acc6a9..f9ccc8627032 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -29,7 +29,9 @@
 
 #include "panthor_device.h"
 #include "panthor_gem.h"
+#include "panthor_gpu.h"
 #include "panthor_heap.h"
+#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
@@ -568,6 +570,35 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
+static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
+				       u32 op)
+{
+	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
+	u32 lsc_flush_op = 0;
+	int ret;
+
+	if (op == AS_COMMAND_FLUSH_MEM)
+		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
+
+	ret = wait_ready(ptdev, as_nr);
+	if (ret)
+		return ret;
+
+	ret = panthor_gpu_flush_caches(ptdev, l2_flush_op, lsc_flush_op, 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * Explicitly unlock the region as the AS is not unlocked automatically
+	 * at the end of the GPU_CONTROL cache flush command, unlike
+	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
+	 */
+	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
+
+	/* Wait for the unlock command to complete */
+	return wait_ready(ptdev, as_nr);
+}
+
 static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 				      u64 iova, u64 size, u32 op)
 {
@@ -585,6 +616,10 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	if (op != AS_COMMAND_UNLOCK)
 		lock_region(ptdev, as_nr, iova, size);
 
+	if (panthor_hw_supports(ptdev,PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH))
+		if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
+			return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
+
 	/* Run the MMU operation */
 	write_cmd(ptdev, as_nr, op);
 
-- 
2.49.0

