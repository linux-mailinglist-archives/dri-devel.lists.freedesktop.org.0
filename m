Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7CC90C531
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 11:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C46C10E5BB;
	Tue, 18 Jun 2024 09:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="g73Z1fN7";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="g73Z1fN7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2072.outbound.protection.outlook.com [40.107.241.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE7D10E5BB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:11:01 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=K1MO0Cm9vsZ08GzYVdejFcZ7TZYpZI3AwcUUvgPHePaCa1zyCl+USKg5Exv9+8yejM7BJ+SV8fBARxXYFgjBMetwpP2GWUaxqVE2Er0COEgj6DBArA9r3QRRhf7D6Syy1ByOGi+U7vs9rYSewt8GyFu2lU7A0nQaYp0SFazoyKmJlC1brrw3A5sGJFJHhlmhJFgA5sZRUJf7IndSb7Gg2YDH/2iSb6g/21u9YRMm7IbR6C5rcKAB/CSj5ATIa9iaswnhgrubMshQl2f2Ise+AAJ4+GqrqxKQjvtABmqA+0m9XYuID3+6y2/BDACDVZI37Br00MGx04Jab0Bigueslg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKLFZ6QSQWoite6c7y39WoF1K/jp0wYxdrv0uTeT1uM=;
 b=O/twvPZz/CCjMg1dPO/nYnt5FXeIu+Lf2CQfiuOvM/thiAcpauwyFN6aEr5t7ZZqk4OhrhnPj1VSYJLqYo/LdJkdAiouSLLcfwxZkx1Q7x3m0bTHSTeRchKhoAeFGT3h+q7gIOB4s0sEapoSbxS50NwnIoLzH0Mk/KYNsANuK/JQIO97ejlHONEPN1L4JQRI9RPsN5ygyB1s8qkWiixWN3PDk16HwGpCyrrIgcm8UJvpC0YlcbuD5y2FkVpUdT3Q/3YwshINivb0ylfHqdl26v4aFTjprpOz1k9AqQ+jnUZ71M+4ZV/N4tTvSQeYFl1EypoCH0rVTDViDj8p5I3J5g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKLFZ6QSQWoite6c7y39WoF1K/jp0wYxdrv0uTeT1uM=;
 b=g73Z1fN79fLJr71WT2kABhb9Y5l+Y8tdMfPdEHEwLBCqR8VxAu5Z5ymwtCiT9ToXNp6SMpqyZZ3XyBqTVpcfpRYO3ecI3X4HjrKSNeIRW1TKyYK7T9bZv/KK1gs9aCj8QdB2LlRdgwaj30yF/vqKuEx6y69lEcrxVqnlbldqrwU=
Received: from DU2PR04CA0196.eurprd04.prod.outlook.com (2603:10a6:10:28d::21)
 by DU2PR08MB7309.eurprd08.prod.outlook.com (2603:10a6:10:2e4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 09:10:55 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::70) by DU2PR04CA0196.outlook.office365.com
 (2603:10a6:10:28d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Tue, 18 Jun 2024 09:10:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Tue, 18 Jun 2024 09:10:54 +0000
Received: ("Tessian outbound edc8664ba7c2:v339");
 Tue, 18 Jun 2024 09:10:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba328fa6e46dba62
X-CR-MTA-TID: 64aa7808
Received: from 0e55a3ba4b11.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 59C3E886-4B41-4CFC-9A8D-8F3151215C1D.1; 
 Tue, 18 Jun 2024 09:10:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e55a3ba4b11.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jun 2024 09:10:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oY7CU6E4bEXpMbJlaSC9Y7qvKCpbRIwMpaEd2TVaKhbHmcouv4OSMtKajxbR3tgqe+S0l3AdgvCm55SAAR06nn3ztR128EqBcFKO5MuVZa8YHNy2dN+WsbXAZti5ClX/4PyxI4LkoVI4VbrcGXaiqlswbpkNiGJPUT5YFJ0nFPN32sr2fybuEhXeCzz1yqeRjQ2gcankGg8v8bbjQbtOiDeYAfSt4LjSxJti3rr7zj+fQOOdS8PkYk7iaacx4bT2+BMlNbCF9A3lKLb78yELg9KUvgBMzrYM8rO1iynKBD2TaGVBprCVnTvm5gObNYG+LQJ/O0rzdAtUNLHQlCg4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKLFZ6QSQWoite6c7y39WoF1K/jp0wYxdrv0uTeT1uM=;
 b=H61gNRIxXkYngMme2phUtFMn412LPCgkVpxm/VS5bmt+GF+Zd+1+xV51yph9ppfpM9QN7bYiNqEqHV/Z1Hla5X/NOimg7xq49njlbb1i1ie6u3BK0S4R52tqPHA1wX/dKbB89uix0bISTVF5vbCjX51XYOvXJce1w3d+5thLxCw0WnyK+xLBuWWsJWUOqqLNxwiwZ+Vf6cqNa4ziUvpv0A0tEqsR/r5oaxldz/4tw8V2bb8sosr16BEZrP3dBjWn7zfWDAk6prFByNrFAnkmSgKb6iplQC/LAx2PdvvNP1KNl4dKdmNJ5D1FNHVIwiLS1sr/gLixbGV1eBiwOjyuuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKLFZ6QSQWoite6c7y39WoF1K/jp0wYxdrv0uTeT1uM=;
 b=g73Z1fN79fLJr71WT2kABhb9Y5l+Y8tdMfPdEHEwLBCqR8VxAu5Z5ymwtCiT9ToXNp6SMpqyZZ3XyBqTVpcfpRYO3ecI3X4HjrKSNeIRW1TKyYK7T9bZv/KK1gs9aCj8QdB2LlRdgwaj30yF/vqKuEx6y69lEcrxVqnlbldqrwU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB8563.eurprd08.prod.outlook.com (2603:10a6:10:404::17)
 by DB9PR08MB6523.eurprd08.prod.outlook.com (2603:10a6:10:256::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 09:10:42 +0000
Received: from DU0PR08MB8563.eurprd08.prod.outlook.com
 ([fe80::3f5f:95b1:c5ed:1895]) by DU0PR08MB8563.eurprd08.prod.outlook.com
 ([fe80::3f5f:95b1:c5ed:1895%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 09:10:42 +0000
Date: Tue, 18 Jun 2024 10:10:40 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "Hoosier, Matt" <Matt.Hoosier@garmin.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, "nd@arm.com" <nd@arm.com>
Subject: Re: Correct sequencing of usage of DRM writeback connector
Message-ID: <e2nygwnkbb3vlx72ehe64tguoj2qgw7yoxtzbbkvcfnl5dnsij@ra7fupluqkpw>
References: <DM6PR04MB5178398F885B5AD82430B8ECECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
 <ZnBTVCHneR6DQPxX@phenom.ffwll.local>
 <cph4jfd7dy5mxfmnp5iaacxen7zszeiudvpyq4tebgp7fukzzc@xx5m65uwwp6n>
 <DM6PR04MB517866DC4DDCD418DF3CE0F3ECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
 <yjyxdt4k2hna7iaoji5gngyf5p2u56m7fis6hv2v6csookh7kj@a7q7k7smu33d>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yjyxdt4k2hna7iaoji5gngyf5p2u56m7fis6hv2v6csookh7kj@a7q7k7smu33d>
X-ClientProxiedBy: LO2P265CA0226.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::22) To DU0PR08MB8563.eurprd08.prod.outlook.com
 (2603:10a6:10:404::17)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU0PR08MB8563:EE_|DB9PR08MB6523:EE_|DU6PEPF0000B61F:EE_|DU2PR08MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: be583c0f-8fa3-4d39-aedc-08dc8f768ea1
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?aJltruXsCo/bDU3+FUSjpn5WlHfxtWn2ptj+LJCcyeECZVwWauL2x/ZBSvU2?=
 =?us-ascii?Q?nVUbiBO0bzurlrdQiwTyX57+YdmKzofPtAVF7SD1akD5YPZaRB7Bq8Zu2ZCv?=
 =?us-ascii?Q?09vgT27KH2Y6SrOibCYFUmyXBk+hT7uE0K01VVNnUjWDO7wVA777L5Ztt6F3?=
 =?us-ascii?Q?08yWRO83+748+71QlOsdstcVekGQKURxXzIQWwkX1swEc6HGITasrk5MYd3Y?=
 =?us-ascii?Q?8Xfn6Wh2Wb/ez1CBj2sDP8/8UBvaCIqLRB69QwfQ7ulXR5LXjDvLbwXVPcBp?=
 =?us-ascii?Q?t7L1WXeDvgMGmq7Ta7/Qj6pgpBoGu0HiRaRZJffG02N9hlyvn8Q3wNhZNrVY?=
 =?us-ascii?Q?oCga5zmHwd/y8cubrMEpFbye/CoatN5oTl4rFPwwHaQcr30LXYzyVz+bv5Yq?=
 =?us-ascii?Q?wranq2OWdkIO8auNOe/UejzzBhhSFRMmBemD6MlSthtpKfCwbJcV6VRMEKfm?=
 =?us-ascii?Q?QhsZx+9GiajeuhctcxwFZY+dgj2Tb1+9gVwgHPEdAuHKitOiSQkesWePmmJl?=
 =?us-ascii?Q?+yEnTyFxtjS+0QkxURkyLmKHwvuVfBXYUyz/7A6siMDIrkQzmJruAKQyyCMz?=
 =?us-ascii?Q?MFxeZG5QaZwWtaZdzIBKP0iVLsqp+5IBzt9W9UZyDFlKRRIotMq7SIYOHsmZ?=
 =?us-ascii?Q?4XqYVSaXldawb1Aje0krP5G9WJE2OxmxAZVmLh5mb6I4tgcwEf3VS3EYt5Zh?=
 =?us-ascii?Q?p48e3UeGAfVUdSlc52I6k6CUkWYebxIBnWMTPAb7fC+gc6Qepq2L0ej+pIl0?=
 =?us-ascii?Q?9Hs+dlTR9jJADtrVTb/iCyal1xBSj62B4m0yeFDt9AypYqCHOGaLcncEWDqr?=
 =?us-ascii?Q?8wG7AErEN6DFGCipTpftTouFFJKsyQj/mZheQufKAshF+J5taa5SSTxRr9yG?=
 =?us-ascii?Q?yFi2Q/u+gSPXpKu4kc+kCVmpVCIPgSj7vIlw4MH+DMwl8Ewo5p+rgMmuSi3t?=
 =?us-ascii?Q?TiSrTzyvg/yM015u58VpSWL3zn4HKK9Rh1Ts2xId1jx/BYNn9VdConywBAqF?=
 =?us-ascii?Q?gJMDWNE4QFl8/tAor4ozgf7DO3wWeQqcGbaRgvHTkQPoCXro4Buatv9l79va?=
 =?us-ascii?Q?PsmzUxsFsM40QC+lDkFWI6ltEMD+LCLMd/Ip5K9PDV2SXH/c0Cwshax+3bEf?=
 =?us-ascii?Q?E4pxWEBYvt+hMHOv/QLfx0kErZbc1+IzfAAazwSoYCMppmnIZkwRs1IPreeY?=
 =?us-ascii?Q?Chi3E/jtCb3Lp1fBQseL4kWX1tVwT8ivVDpYsP2YORacif2Zs5eKgBQF1Y5p?=
 =?us-ascii?Q?Jmn8S/ns3F8l6afW5FUhgEE+aomSGAh6MYgRFvAnz7qth2h/jsXdBNFq3J6E?=
 =?us-ascii?Q?bpRM0LP9Gva1/tGvAX4wmCax?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DU0PR08MB8563.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6523
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6ee7def8-7ad2-41f2-30af-08dc8f7687b1
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|34020700013|35042699019|36860700010|376011|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m7HxFpnfqegVbPECHqbdjfa5uMcD3FbzX1l2Z1BcI9e19MBr4qYkwRsR3SWy?=
 =?us-ascii?Q?itZ/815kUYALVft/OvI4QSZ1pGgOVH/iLx8uVXum+hRbq3/c8RUAnD3L6b0W?=
 =?us-ascii?Q?55y+z5i/neWmwSOzQgeJ2KaMaDkks4lv6m86WbjjGb5KHLIHftk4GnXA2IZs?=
 =?us-ascii?Q?A4ms6F4s8PS05nOadSzOAffkLoPMzS7uw7iWpTxaeQxGrmJat54TvvPipwS9?=
 =?us-ascii?Q?KA19Jph4K4Iw6hdYZQvgcSu39kVIy7fT5xZW+cgCyQtgVJa54lXk2QXsOXbh?=
 =?us-ascii?Q?GaPPn7/mtK8PQkhZ2QZz+CS+/5FZzO+uYzGVUZtcx86TnYidl7qSygdV4/Sv?=
 =?us-ascii?Q?2sABkWqtBmZ8ILkLPBDi2W6anWkYE7XSQ/hGTFtPgLarCC0pJisre++SoDbc?=
 =?us-ascii?Q?vi78t3GqkDbHL4tPlSOr11nweJM+tOUGl0JT9CiwHzniaGHNXqCsGeb4gtPp?=
 =?us-ascii?Q?ffrNQVsQkwkNULd43TfHYy5yfPo/ci/FKf0KMaJgPaQASR/5Jp0KvgcUbjO0?=
 =?us-ascii?Q?Rug2CfJDWArKAiJULDL/PsamjXhk4tBWy+V/BL5zV8EBI+oKDGii+ssNdcJu?=
 =?us-ascii?Q?aVU2/7qMasbMwqzXdWY2hNAJO9I333qPSwesxkKEFRhVeu7ve1i4I77AkXaa?=
 =?us-ascii?Q?CufMjQJ+82/YR2E0BnRCFKYgQLqu94xp57jmgyW/BgBFn0/kMKpLc/yeMuZc?=
 =?us-ascii?Q?EgEn0CPlv0pYZ4+ItuCBVY3FWJgCXmp94y2DYClgRetSdPh5q+GgaBqYy4h8?=
 =?us-ascii?Q?DyMagYoscWRad+VJ5Vo1ptjBxpstR4xl7Ku+CElwjJ0I4Q0N20rswaY2foR2?=
 =?us-ascii?Q?PYSvFOcrRQSrhYrBhl0G/ayJNHQ4WEqOkKWTZdp85fqarrQaGuFFhrvFuY+n?=
 =?us-ascii?Q?72xuv6v2lxDFL2nyPGemhIZjZy82UMqT3Dm4/W+sxXI342OEUFYCus3FD2AD?=
 =?us-ascii?Q?JGqRxI5uzJSLIvpnEJScAsSTBTs9AOHOsRM4cSL87W46/6GZ4tGTPLbmSrY3?=
 =?us-ascii?Q?jylacnqQJgm95dRxvkHE9yQGurbAllqjLG2I7aAr756SQi40yL3YZ2DNQcGh?=
 =?us-ascii?Q?Z3GIIBuhkEOvxuzqYOTc2Q3eHpxDgtpohXkslQvBl4qkJOrCNeMLKOhUmEe8?=
 =?us-ascii?Q?g9S7ipIbu8AzTIvMdEdOIvHGLu8wCCnE1VRs/HajaK9cBOI9BYJH2ayKSVSL?=
 =?us-ascii?Q?hw+fSl48P4JCSz1UlM1lCEfiDrPLIbROkpJyC8dh5wKgvR/rmFeLgYB4sYWc?=
 =?us-ascii?Q?8fWgpfvOpm9Ua1Ttt/Bu2YX/w4csP2rGmtuoxc/EgY4MEEfSMd1a/IcidkPv?=
 =?us-ascii?Q?K69goTioehOydxCwS5f+ljbCQ8IVLuXy37UX/KD8FCeUR+CLG+YntJgG17JZ?=
 =?us-ascii?Q?DwjkMnaY9J5vPW8PARjDNKbpxAsjcnwtpBr2qJum1TSoqJ/0zQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230037)(34020700013)(35042699019)(36860700010)(376011)(1800799021)(82310400023);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 09:10:54.1641 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be583c0f-8fa3-4d39-aedc-08dc8f768ea1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7309
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

Hi,

On Mon, Jun 17, 2024 at 10:48:47PM UTC, Dmitry Baryshkov wrote:
> On Mon, Jun 17, 2024 at 05:36:34PM GMT, Hoosier, Matt wrote:
> > >> >> >> There is a discussion ongoing over in the compositor world about the implication 
> > >> Hi,
> > >>
> > >> On Mon, Jun 17, 2024 at 05:16:36PM +0200, Daniel Vetter wrote:
> > >> >On Mon, Jun 17, 2024 at 01:41:59PM +0000, Hoosier, Matt wrote:
> > >> >> Hi,
> > >> >>
> > >> >> There is a discussion ongoing over in the compositor world about the implication of this cautionary wording found in the documentation for the DRM_MODE_CONNECTOR_WRITEBACK connectors:
> > >> >>
> > >> >> >  *  "WRITEBACK_OUT_FENCE_PTR":
> > >> >> >  *	Userspace can use this property to provide a pointer for the kernel to
> > >> >> >  *	fill with a sync_file file descriptor, which will signal once the
> > >> >> >  *	writeback is finished. The value should be the address of a 32-bit
> > >> >> >  *	signed integer, cast to a u64.
> > >> >> >  *	Userspace should wait for this fence to signal before making another
> > >> >> >  *	commit affecting any of the same CRTCs, Planes or Connectors.
> > >> >> >  *	**Failure to do so will result in undefined behaviour.**
> > >> >> >  *	For this reason it is strongly recommended that all userspace
> > >> >> >  *	applications making use of writeback connectors *always* retrieve an
> > >> >> >  *	out-fence for the commit and use it appropriately.
> > >> >> >  *	From userspace, this property will always read as zero.
> > >> >>
> > >> >> The question is whether it's realistic to hope that a DRM writeback
> > >> >> connector can produce results on every frame, and do so without dragging
> > >> >> down the frame-rate for the connector.
> > >> >>
> > >> >> The wording in the documentation above suggests that it is very likely
> > >> >> the fence fd won't signal userspace until after the vblank following the
> > >> >> scanout during which the writeback was applied (call that frame N). This
> > >> >> would mean that the compositor driving the connector would typically be
> > >> >> unable to legally queue a page flip for frame N+1.
> > >> >>
> > >> >> Is this the right interpretation? Is the writeback hardware typically
> > >> >> even designed with a streaming use-case in mind? Maybe it's just
> > >> >> intended for occasional static screenshots.
> > >> >
> > >> >So typically writeback hardware needs its separate crtc (at least the
> > >> >examples I know of) and doesn't make a lot of guarantees that it's fast
> > >> >enough for real time use. Since it's a separate crtc it shouldn't hold up
> > >> >the main composition loop, and so this should be all fine.
> > 
> > Hmm, I don't think this matches the implementation. What I see -- sometimes people call this "concurrent writeback" -- is that the writeback connector is wired directly to the CRTC that's feeding the regular connector whose picture is getting captured.
> > 
> > Something like (for frame N):
> > 
> > * DP-1
> >   * CRTC_ID = crtc-0
> > * plane-0
> >   * CRTC_ID = crtc-0
> >   * FB_ID = fb-0
> > 
> > * Writeback-1
> >   * CRTC_ID = crtc-0
> >   * WRITEBACK_FB_ID = fb-1
> >   * WRITEBACK_OUT_FENCE_PTR = <whatever>
> > 
> > 
> > Are you saying that that for frame N+1, we should switch DP-1 to use a different CRTC while the writeback is still busy being retired into fb-1 through crtc-0?

The "letter" of the API is that you need to wait for the Writeback-1
fence before making another commit to any of the resources - which
effectively means halving your update rate for crtc-0.

The fence might fire before vsync, so you might have a very small
window for getting a new commit in on the very next frame, but
realistically it's unlikely.

Logically, if the writeback is working line-by-line alongside scanout
then it won't have the last pixels until the end of the last line, so
it can't signal completion until at least the start of vblank.

> > 
> > >>
> > >> On Mali-DP and Komeda at least, you can use writeback on the same CRTC
> > >> that is driving a "real" display, and it should generally work. If the
> > >> writeback doesn't keep up then the HW will signal an error, but it was
> > >> designed to work in-sync with real scanout, on the same pipe.
> > >>
> > >> >
> > >> >If/when we have hardware and driver support where you can use the
> > >> >writeback connector as a real-time streamout kind of thing, then we need
> > >> >to change all this, because with the current implementation, there's
> > >> >indeed the possibility that funny things can happen if you ignore the
> > >> >notice (funny as in data corruption, not funny as the kernel crashes of
> > >> >course).
> > >>
> > >> Indeed, the wording was added (from what I remember from so long
> > >> ago...) because it sounded like different HW made very different
> > >> guarantees/non-guarantees about what data would be written when, so
> > >> perhaps you'd end up with some pixels from the next frame in your
> > >> buffer or something.
> > >>
> > >> Taking Mali-DP/Komeda again, the writeback configuration is latched
> > >> along with everything else, and writeback throughput permitting, it
> > >> should "just work" if you submit a new writeback every frame. It
> > >> drains out the last of the data during vblank, before starting on the
> > >> next frame. That doesn't help the "general case" though.
> > 
> > Are you saying that on hardware whose writeback implementation is
> > amenable, the drivers will generally fire the fence FD in time for
> > userspace to post a next frame to the real connector's CRTC for the
> > immediately following frame? Or are you just saying that some hardware
> > could support it, but that the DRM framework's insistence that
> > userspace waits until the fence fires might still make it artificially
> > too slow to drive the hardware to its full capacity?
> 

I'm saying that on Mali-DP and Komeda, you can submit another frame
*before* the Writeback-1 fence fires. On that HW, you should be able
to submit a frame including a new writeback FB, at full refresh rate,
and it should "just work."

The writeback code was written to permit this, but it's not
"discoverable" via the API whether it's OK on a particular device; and
the reason for the defensive wording is that some people said it
*wasn't* OK on theirs - I seem to remember VC4 writeback makes very
few timing guarantees.

Maybe it should be discoverable. I don't know how hard it would be to
describe everyone's constraints.

> Current DRM uAPI for writeback supports single-frame jobs. Userspace
> submits an FB, it waits for the fence, then submits next FB, etc. This
> is not well-suitable (nor it is defined in a way suitable) for the
> streamed operations, where you want to generate a stream of N frames per
> second. Even though userspace sets a mode which includes a particular
> frame rate, the WB API has no guarantee that the FPS will be or can be
> met.
> 
> In my opinion a proper uAPI for the streamed Writeback should be closer
> to v4l2, where you submit several buffers in advance together with the
> corresponding fences and then they are filled one by one and the
> corresponding fence is signalled to userspace. 
> 

At the time of introducing writeback connectors, we also discussed
having a more "streaming" API, or even having an actual V4L2 device
representing the frame stream. At the time we were most interested in
single frames for static-screen and testing purposes, and there wasn't
a consensus on how to make a streaming API, so we didn't do it.

> Note, in my humble opinion, it should be perfectly possible to setup
> writeback as a clone to the existing connector (if a clone mode is
> suppored by the hardware) and then to supply the jobs (FB+fence)
> occasionally rather than for each frame. Such userspace operation should
> not cause any degradation on the main connector.

This is fine and supported by the API. If the HW supports it, you can
have a CRTC scanning out to a real display, and then every Nth frame
add a writeback framebuffer to capture that frame.

IIRC you can attach a Writeback connector without a framebuffer to a
CRTC, to support exactly this use case.

So on Frame 0:

* DP-1
  * CRTC_ID = crtc-0
* plane-0
  * CRTC_ID = crtc-0
  * FB_ID = fb-0

* Writeback-1
  * CRTC_ID = crtc-0
  * WRITEBACK_FB_ID = 0 (no framebuffer)
  * WRITEBACK_OUT_FENCE_PTR = NULL

Then on Frame 'N' where you want a writeback, and a non-modeset
commit, simply add a framebuffer:

* DP-1
  * CRTC_ID = crtc-0
* plane-0
  * CRTC_ID = crtc-0
  * FB_ID = fb-1

* Writeback-1
  * CRTC_ID = crtc-0
  * WRITEBACK_FB_ID = fb-9
  * WRITEBACK_OUT_FENCE_PTR = <whatever>

Frame 'N+1' with no writeback, don't add a framebuffer:

* DP-1
  * CRTC_ID = crtc-0
* plane-0
  * CRTC_ID = crtc-0
  * FB_ID = fb-2

* Writeback-1
  * CRTC_ID = crtc-0
  * WRITEBACK_FB_ID = 0
  * WRITEBACK_OUT_FENCE_PTR = NULL

> 
> > 
> > I want to be a good citizen and do stuff by the book here. :-P
> > 

Yeah... so as you pointed out initially, if you've got a writeback
connector attached to your scanout CRTC, "by the book" means basically
reducing update rate. Obviously if you use an entirely separate CRTC
for writeback, they operate independently.

Thanks,
-Brian

> > >>
> > >> >
> > >> >If we already have devices where you can use writeback together with real
> > >> >outputs, then I guess that counts as an oopsie :-/
> > >>
> > >> Well "works fine" fits into the "undefined behaviour" bucket, just as
> > >> well as "corrupts your fb" does :-)
> > >>
> > >> -Brian
> > 
> 
> -- 
> With best wishes
> Dmitry
