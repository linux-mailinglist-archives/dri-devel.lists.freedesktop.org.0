Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50E29C3AD2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 10:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2658A10E1C8;
	Mon, 11 Nov 2024 09:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="UGLPMTDx";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UGLPMTDx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2047.outbound.protection.outlook.com [40.107.247.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0BB10E1C8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 09:26:44 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=M41ihlTbHVZ6f8vFPURiowcDzIYLDtWrO92sYnYbCutMMbOHdSzSstcUJuzhsyXwi8gmRx13FUZrNStSCztCIE7uqukGRhfptPhl8V88T9MSzBbXmVB8MED/QQoT8iF1KkzubLCFbTXFL58cLTq95R/cUMnVNpEHDoNbBVzekcUIICwS3Mr8j9PIf73ikMts4tPcz48LYm/lkTz2HjxuX3lcIEb448T+uqkTbavoGfmfx3u0qTHwrm0IT7JrjiU0HjABVg/y/fQA81L9+dENI8sCwcLFOhZdbSqo1WxgszL7eRQZPRBhFsx58zF4EqzExYJxNdPIwUHqj/y3jljdBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HC7JwEPuOWZ+5EThts81jzoz8W+Pe7bbBDAfdENg1ZI=;
 b=sXb1v/hC9F+w1buO0kUCGUOsJP12xxxYdeIphBIavRjwdUXmOtBSsUPIBSUJXIebaVtOm6B4zjEeoWk7BP3ifug92G0Bsp9vDA8Dhjd0FoE7V1BC4j/Vzjf8QpkMRd91wnp3MZISpicW3KRTITZa7RBkMwr9iUagy8qssZs5+F16DzQrPDEgXXBXRZ/3ped3jXURVN9vUSOhjOSLGMdLIIB1kIcIpuUqk1KMBP4fi1kSC33sNAqTkYX3flB35vXoc5Bu+CKPBWyYTsaizrwptUd4pIJuuvTFUg6JEusIYrUQr5u8HT779o+oifgbkByoa7hWPlTyBfewLgTNZAfrkw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HC7JwEPuOWZ+5EThts81jzoz8W+Pe7bbBDAfdENg1ZI=;
 b=UGLPMTDxevS3VuoIYI+FfrjVH5u4zTUGHIa78AD8Mmid2lh4T1XZYloEyaxrbiN9z9q5gB/eZCWZy5E04AO8G/+mqs8uqVv/oDmxhNwJ6+dvPE0vuMeJUqZb0PnOiOXp5h+CqMeaPIqN8RApnwl5gDFDDsiRescR0sWWQ9vB2j4=
Received: from DU2PR04CA0181.eurprd04.prod.outlook.com (2603:10a6:10:28d::6)
 by PAXPR08MB6558.eurprd08.prod.outlook.com (2603:10a6:102:151::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 09:26:40 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::e0) by DU2PR04CA0181.outlook.office365.com
 (2603:10a6:10:28d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 09:26:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14 via
 Frontend Transport; Mon, 11 Nov 2024 09:26:39 +0000
Received: ("Tessian outbound c4cd8408e1a6:v490");
 Mon, 11 Nov 2024 09:26:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9bd48ae7aad30752
X-TessianGatewayMetadata: 2yKQP+zeo09Mb2GcXR20IfCyAnddQyS8L96EtdrhUwM7fU9a0EOh0sqX9I5oq2f90GQ9xGUvyY1YjQKRQfjlafr/QrrC4RWWsRPVO8vsPy4xBp/YxDuOa2WMMXhWDwm5RB15gSOGtFaH+gcRAepT5wiqurs+20k5jokYeyTC1ZA=
X-CR-MTA-TID: 64aa7808
Received: from L58d0780e3519.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7737FE14-5FDA-4F34-A08E-AFB04AEA32FD.1; 
 Mon, 11 Nov 2024 09:26:28 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L58d0780e3519.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 Nov 2024 09:26:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rL1dpjB9UkgTMAUeoHqiRbaax0RwJpmE4GSnHp37yci88emWWQJAqqsYDIm8/CQTEN0R2at6FckFwxUVRONc5ekvHR2OnaCqC+EF/2mn+5rZ8JctXPrmP7bOQkkJ0WsLSii5gf/qzD624jNDNKQA9VRsDDFXZH5z4T/LROhxcP6Dx0/nqo3VM46SPjN5b6qBLldAQSgesDlXcWN29/Hsy7adyzGrRpZxKm3Y+hOzMboMLYXdqipaxr4lqm5BwGbVExYKZiPNAFPYn4TNd5yCYCvcteANzYUPr5Rub3t2DrP7mGHZZtMu9W4/q3Pp2ouNYOz1HD20OMcVa9zKdUcPJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HC7JwEPuOWZ+5EThts81jzoz8W+Pe7bbBDAfdENg1ZI=;
 b=e/uDmgdhkM3ZAbvR9rtcWQ0oaIjWl48CIKIlGQUuRmNMphuucNH9BNuWo8qC6SZynmBFJGMkNtod3O1gVkDjItYsEYnr8NtfFngmmn/p8Z4JFvRvmm4UJKQ7bEOmVQe5c9+VMEOH8epO1bZK9rFMWOXXi+vQPDcTw5RNx0Jj3G7+zEoQTZTgfW0es5LzO2pWv6uSU3gv0gm7Zn2Yf/iIq0RclsMGqLFNLRytzqrpFFZDjeSxgDCpzhKufrcgrOtM5oiMQIW4xVbNN6FbZomuXTdQTUP6npBpJk5BBkem27jgC3yZB/ouCL1f9aPkyfmwg5ET8fEwmytPTpXmZGu35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HC7JwEPuOWZ+5EThts81jzoz8W+Pe7bbBDAfdENg1ZI=;
 b=UGLPMTDxevS3VuoIYI+FfrjVH5u4zTUGHIa78AD8Mmid2lh4T1XZYloEyaxrbiN9z9q5gB/eZCWZy5E04AO8G/+mqs8uqVv/oDmxhNwJ6+dvPE0vuMeJUqZb0PnOiOXp5h+CqMeaPIqN8RApnwl5gDFDDsiRescR0sWWQ9vB2j4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by PAVPR08MB9281.eurprd08.prod.outlook.com (2603:10a6:102:306::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Mon, 11 Nov
 2024 09:26:22 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%3]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 09:26:22 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH] drm/panthor: Fix handling of partial GPU mapping of BOs
Date: Mon, 11 Nov 2024 09:26:21 +0000
Message-Id: <20241111092621.763285-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::18) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|PAVPR08MB9281:EE_|DU6PEPF0000A7E4:EE_|PAXPR08MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d5bdf1e-4d6f-4c34-0569-08dd0232f2b2
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?5Jk04+MSpVT8cxXiVtkiWzohSqvJPi4AEZpyWrbkE8g5e6JHa7va9YhSDZ7i?=
 =?us-ascii?Q?MyRvzeXSDuURZ8mt6oXwbef1OfDMgtkHmDbHrQOL5eW7leI7/Y+97cl0D9P7?=
 =?us-ascii?Q?OxRWTKx21g6PsuPgl928z30DGDowz6BUfJAcE/kpknI0s8+lUSka/aY27qSP?=
 =?us-ascii?Q?4G3blVbLTIJ+McD5O4WQyFuN1sztpsEQkiC00JDU0dHXoweUQ570fYovsHQR?=
 =?us-ascii?Q?nx0yBVHKlhiCvOJ22TmNXrAoDU+f3omEPZUVF8jwh5mR/LB/5x4MekpOKcvN?=
 =?us-ascii?Q?nHsOMbbnffyqHQAXyv+WfnacIJurLFCDx+rI632n0tprX1nqYCPFw6xfbgoL?=
 =?us-ascii?Q?s/AhE4oVQavOfZmwIYCUYGEe2poKeNd6FMcJy6MmFzsxZNhnGXYFicxh3J1A?=
 =?us-ascii?Q?H7mYlhLPyLHUYyKjVt34zKrjxPQt9i/is1IsZPNv05LlIndzkUNhVxNmYKqV?=
 =?us-ascii?Q?0E204cqF9tld09zmfc6PHLxXAu9MElwaqTaUNxIp3Boxd/aAi37r8XPSnsxA?=
 =?us-ascii?Q?Uu+iMGGE7Lj249Um4CWnDtzmkmKPcCj7X/VEmm1AF8LpB2Z5DGWJwxuFMoAa?=
 =?us-ascii?Q?vitUgJpwrD37rJFW3vTEuWJyp42DK26ENEvaACxlzaau99kr2/JIqonANgQZ?=
 =?us-ascii?Q?APOacpkABhLvp1TRVDBtGKHKuSsLr8KReer17tL37e9BLnrE3bmWia1tnvQV?=
 =?us-ascii?Q?JCGpuUeaRkFo4uWPNQzfoc6WflV1SLGVzpIMmzEWM6pXVVfC3QhEIVCtzgOy?=
 =?us-ascii?Q?c4Fx73eTdW5uVGw5KWJu4DQ8+8dr83UjuD9VFvpHUtzIRoEYvjVkFliVFHAU?=
 =?us-ascii?Q?ugZ/TKMyzsmljbcX2k/PTQ+D793vRcnjLn18m8BML32Ud2Sc7miEJKp4DvY1?=
 =?us-ascii?Q?ZhXCTsXBMm2h1HioC3OA28jB9MsOyE0ysYXzbdBXX+vc8QozQ4ZqDasivxCJ?=
 =?us-ascii?Q?cybSRL1t4w8/5iwNGw+f0mb1y8d23dWsipgGVCBWI9aQEh1dCurBduVymW17?=
 =?us-ascii?Q?JlXPey0iYGeePxZYifNoCAmyNHJ3YXfAoXwtg5nvduPV7sbDD3CZwJV6H6sV?=
 =?us-ascii?Q?wYlMkCoAyh6XJz2w4kpKV37SAShgJ+3BXH7DgMP+qx4RHT2HTbKMJtgGVt1d?=
 =?us-ascii?Q?f4+4a5Qa9piyJVUo0HFzBpL3k4sCMw0jAP56UP7pRTy1A85dkM8VjP11JScE?=
 =?us-ascii?Q?+g0nmus75UY8zBa+k+eXKu+W11GRxmydozLX0LPP/592+zx072D0Q/TbnX9W?=
 =?us-ascii?Q?iQJ+EAYqL7sgsgLy2Oj6XdOK37Imz6/NAIAJu8dRiUGAQ/bBrTLexqhlgvqS?=
 =?us-ascii?Q?IbQAdis3YPJZb6xNqEdQtAHM?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9281
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:415::16];
 domain=AM9PR08MB6982.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 47894c3a-e272-49f4-15ab-08dd0232e83c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|14060799003|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+KnJyKL9uSCDQfmJ7R7MdVz7G13ugAHCZrRph/YaQjqzgcFv+zRsxNLzFgLW?=
 =?us-ascii?Q?WxpQN+Jh1gSypTTC/189QpGu2O6jlZM+YmvNGyINftV8oKW7Qe5fAD9HLNp3?=
 =?us-ascii?Q?ipVvMqTMXRVvSteiX13owQbBomDQ1GabZ9vpL1aZxvh79Ja4GW3be/MpgQl5?=
 =?us-ascii?Q?T1afnXor1ESQzSvhM12EctXy21xdzyFn77Yf8G8yuJZQhbvR/6KBrDuYQstB?=
 =?us-ascii?Q?7gMCEyUBSdKiYBRl1Av/IzNnE/Xe6uCkIq57Opy+aGspYosLpWEL+os0UGt8?=
 =?us-ascii?Q?Rfk+D6UYO1gRs1MGGuJn4m/wr16liqDYtfwPMkj8AAZ1esCeHSVc89u3QUSv?=
 =?us-ascii?Q?LB5IDiMh4V07TCyLO/z622ZPl4dBXSc7UxlPj8/ycoSVlj5yXlPRD1+QQy/E?=
 =?us-ascii?Q?nZDZsA2toOpBes3hFYpJFfRrThGq7XJ/34+Jja487d2PkFUCBUoYCNRhFccg?=
 =?us-ascii?Q?kx8eDYTAup6K7bjXEQSHm2bDj4vTnAOvHV5XxX8IRAs/TM1foIMOVuXhxsgm?=
 =?us-ascii?Q?e7jfbPOgpoPG8GqTRce49T1OcPfObQlTIgYyUULs7PzYj+iW8EVtYe0c2oHr?=
 =?us-ascii?Q?V0Y18YBlacJeV7jpQXr1UOlHqr5rUjIC0zAQyhIU8jwlDJngTKS4bNg63vmN?=
 =?us-ascii?Q?Opw4sszndbQC505oraDYEyr60Y9HNMnXjxzsfYx9Avr8kiaI2sJfxER72/7r?=
 =?us-ascii?Q?1/KTdHQKaycxo7nxsxng2HHTQxqdMcefRP9w0tIlBwPDyofGfPTqSfWj8oOB?=
 =?us-ascii?Q?BZqi0ZLhvJsWSt9hpTgASGACgGUwlqCWu19FQckakYrAJGCj/2HHwoC5mtJP?=
 =?us-ascii?Q?iNEhhte2t/SdkmYk7R+gnFPOf9M+azIPLRsGE7VMDr/fETmKD6h/jRVNwVsY?=
 =?us-ascii?Q?/ECnxz3wrbgRdKcSEC9TAMSBEYIpaydmHXpVVGXOJ0GoEfpv1mNThZohi5K6?=
 =?us-ascii?Q?nr16ARJoI94GZnG1/V9R0BLMJBwd6bwYaqas4aAc2OFF6DMUmrWeKVyG/w7v?=
 =?us-ascii?Q?/7MREpRXNUS4HJ3UvXlx010tSzE3MUHHBYXrxnuDSQ/AJInRXdBkK7dTgTe1?=
 =?us-ascii?Q?96/MJdPze6c6eaC4NKt9Q4WGCWf6H8gYK2w/cetwRxMT5S1kthmHkmgjW+ps?=
 =?us-ascii?Q?5bL7lB3fzpc7gIHDDoG/Ez+Qd0fdx2WiB4G+L6xTCj2eL4m1DsVuz/iqiwWj?=
 =?us-ascii?Q?siG/MLjv4hSVz9JmEAhYZkEGDnt73SSJuOezE7CZ/ZeyJky/7jbQe1/3/3j6?=
 =?us-ascii?Q?IklK//0tPz0Nhruldxz9CqcnfQMO1HyCV80hxkMXlD0MLPiDvoSp/j7EOXts?=
 =?us-ascii?Q?zbqfd/rIY/+gqUjXGU2v77CAbFTcKTricAML1WxlUeLlCsMa9mLCwVbDHj0F?=
 =?us-ascii?Q?osMHKHKWslNPF0iXtvNAjmFIc3bm29DvMzmD+Gvg9Q52ZWmpLA=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(14060799003)(35042699022)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 09:26:39.9539 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5bdf1e-4d6f-4c34-0569-08dd0232f2b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6558
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

This commit fixes the handling of partial GPU mapping of buffer objects
in Panthor.
VM_BIND ioctl allows Userspace to partially map the BOs to GPU.
To map a BO, Panthor walks through the sg_table to retrieve the physical
address of pages. If the mapping is created at an offset into the BO,
then the scatterlist(s) at the beginning have to be skipped to reach the
one corresponding to the offset. But the case where the offset didn't
point to the first page of desired scatterlist wasn't handled correctly.
The bug caused the partial GPU mapping of BO to go wrong for the said
case, as the pages didn't get map at the expected virtual address and
consequently there were kernel warnings on unmap.

Signed-off-by: Akash Goel <akash.goel@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index d8cc9e7d064e..6bc188d9a9ad 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -957,6 +957,7 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
 
 		paddr += offset;
 		len -= offset;
+		offset = 0;
 		len = min_t(size_t, len, size);
 		size -= len;
 
-- 
2.25.1

