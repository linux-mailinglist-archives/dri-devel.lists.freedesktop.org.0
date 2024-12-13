Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE979F126A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 17:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3B610F099;
	Fri, 13 Dec 2024 16:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u7vlm8vl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73BC10F096
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 16:42:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqWXnI97ewFZCk0cuBrCBWJqtX1fjmGDEv22k5l0TbZ8ze9WAIOPRDlhfqmXyRazOwvpAx9+YLRg4S6VibWRxYx/LKPl3MEABnsJ43zxuqW17x/7yuUZyKTOcoXMYzCVda1x4IVXQx/3e7ZilKbvmRLYPraA/D8/sx0CzBjnipiInBZXDjM6v47vrRAkQQ0724Zz7PMN+mYHbRvkpPH9ksyt/rig3YGQS2+mfBIoM1ehtMqy2w72A9e0EciW5E0QUTP3OPBbpcraqw0UG3HcsOVPP7OeScbq3ZIHABkAkr1kwzyIsnIFo7ocm0CpzVyPiuG8r8ZRNrOvrmIS9RJMeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93xzTlTInOqkOPp7r4vXZv+sLdFGtLXEUlPgGcvrBAA=;
 b=jbBYwPsZTDdoizQrqAO4Rro7KSaF3ik+mIQraUlA3CLxFSI3vusVOnQ7b5AkbVBxaHgXezTqw/k1SeCYH/K6rMNro4UZd77cn3iKw8uaW5+54+TcrKE0gJKl4H/pFzZ8mFOTdWZJg1Il2oiyKHn12rngBAQ46uq1I2nKRO05qTw6UdPwcMSl38X4BeipPhYRJSzZnCGfd2uuux1nN7wI1iERQgPNsFP0R+kWQSQIG2EEsysJfHD72XoDr++Q3BPAgH7XAMAPJK9eay0kfoK6DHipVitPGwU4s1ldIBhWQPJY82YErfaIsLK7c/ZmiM+dFoi4Y4yWoi8TI4Fnp6XnmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93xzTlTInOqkOPp7r4vXZv+sLdFGtLXEUlPgGcvrBAA=;
 b=u7vlm8vlDntjJTSFHyR7EubH1cn06kFNeH0HzMvRmni3pNoaN4PF2cacj5jXpWuJjKRmXFxiN67MURrf/Dly7oVOa+K+urMmncK0yzgZBbP2qynb8x59+EHIzzUw8iCuKcPnoYQSxUcsfu9IKq9eXxLc6ar2BGt2bfuLvs8F9r0=
Received: from BN9PR03CA0223.namprd03.prod.outlook.com (2603:10b6:408:f8::18)
 by IA1PR12MB7711.namprd12.prod.outlook.com (2603:10b6:208:421::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Fri, 13 Dec
 2024 16:42:37 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:f8:cafe::aa) by BN9PR03CA0223.outlook.office365.com
 (2603:10b6:408:f8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Fri,
 13 Dec 2024 16:42:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Fri, 13 Dec 2024 16:42:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 10:42:36 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 10:42:36 -0600
Message-ID: <4b59099a-ca9b-576c-9583-fb54c8c594e6@amd.com>
Date: Fri, 13 Dec 2024 08:42:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 8/8] accel/amdxdna: Add include interrupt.h to
 amdxdna_mailbox.c
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>, <mario.limonciello@amd.com>,
 "Mike Lothian" <mike@fireburn.co.uk>
References: <20241206220001.164049-1-lizhi.hou@amd.com>
 <20241206220001.164049-9-lizhi.hou@amd.com>
 <a7add90f-3d78-9ced-655f-a1918fb04af3@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <a7add90f-3d78-9ced-655f-a1918fb04af3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|IA1PR12MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9eb729-8f49-4486-a709-08dd1b9526ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXJ6dXAvQ0k4eTdDMUgwUWJkZ0txLzV4elhNSEoxS3diRWFrRW5GQ0RoVGZr?=
 =?utf-8?B?ejRQRS8wNnFncWZiandNM3NRUy9WWUd1M0xhQnVuSFZPM2hWVzB6MWluZ3Vp?=
 =?utf-8?B?K0RsazlVbERTdDNmNFQ1aitRUEV0TjAyRm9rNHVtbnNCT2lGSGU4bmt4b2hC?=
 =?utf-8?B?YlZtbGorbzM0NnpsUzVmQVAxMHRLVVZGVzQ2V1VVMS8veDFmSWN2eGViV1A3?=
 =?utf-8?B?U1cveVZ3MzMwS3Yxc3BQMlB1V01FMWZnVStFSzZ3VkJTSG5YWld0WFBPS1dW?=
 =?utf-8?B?SG1YNG5NRUlhM2JDVUdRY1R1WDIxMG9salNpQ1RzeE1hcDNCeW5QazdiTWpX?=
 =?utf-8?B?czAyVW9xQ0JMOEt0VkxYdWVwOGFSZXZnTDh0OU52LzZrTlRRUW5MV2p6UHl2?=
 =?utf-8?B?ZUZBQkNoeWljaHpvNm52VmRFNGpDZ1JkS3FhcGwxU0VGNFp4dHpKV0V2VmxK?=
 =?utf-8?B?ZThnZi8wdk5EVVB0NlFoc0xHSGdnVmNPWEdpdld1VXVGSGxmZVRLVHdRYnNm?=
 =?utf-8?B?TlpOYUZHd0x0bDBScDBEcGR2Rzk2SUhLQWNicmlmTHlpVFpTWUwxUUNqUzV3?=
 =?utf-8?B?WUpqTUl5UXVTTEh3WHdwdHFqM2NNcXJMckkyUFJHQ2w4Zkdxdy9jUE1sbFM4?=
 =?utf-8?B?NkJjb3FuT09Ja3piVVpWbXArVTZhRTJpN3JwdWpjMit4MDFMRnNOcXVpTGIr?=
 =?utf-8?B?djhGVkZzdEtHWkZrK0RuV1BaMkVLWDlsU0Z6Vlp1MWJwc3lyaVJhaWU4Nnhy?=
 =?utf-8?B?QlRRbEZWSk92Rk5oMC9SZWtKMW0yMUtERkdYbTlpRldNbnlsSitla2xzcmY0?=
 =?utf-8?B?Zmk2bFJROW9TTGhrMDJjeTZhNTlxZzZZQUs0b3FpK1BKUkZaWkE1U3BGT1FZ?=
 =?utf-8?B?UDdzWjArYTU1OHg1VW9DOTZiUy83R3poUHRycllnU3VuNXJVc1VRRllzZWlh?=
 =?utf-8?B?QnlIL1MveEdjWGlxZE4rSzZ5NkJwTUxpd1pnWUJpNVV6aDVpRVorb25aRFY5?=
 =?utf-8?B?SDNyVmlOeVd1YUlTU3lnMmt3bVlKU203L3BkeHdCU3hFdmhSNXhaZG9SeU5n?=
 =?utf-8?B?NmhEZ05vM3R0aGxDcWJ0U3FNa043bnV1VFJhWUkwOWM1SFYwRTlnWERaWlJq?=
 =?utf-8?B?TmZJSzB3RENkZmNCek4vT1hKSUh0dTVKb0VjRDg5UnpXanJiT0RxNVBtQnh6?=
 =?utf-8?B?ckVqTFB6S3M1Y2FRUUZaaEpLazZ3eGpMeUxrd2xvZFhMZ04wM1hOSStoanRH?=
 =?utf-8?B?UUNNNnJCOG5DNEhMbWFTbDZocmFFOGZ1Um9yMUwxUHNhUFhYRmxmKzkyR1Js?=
 =?utf-8?B?SC8zUXhvaHQ5SkNoeG1tN2taS3hvdGs2VmVKZjJrZERzdVlFUlgzcGNQUmls?=
 =?utf-8?B?dHF4ek01SzJsTFFYWkRqemk2VXBxRFJjaXRJV2xuQ1QzSVVwb3U2RXJIU05q?=
 =?utf-8?B?VFloblVmczg5T2R6c0U0cEZNRVZZTFZVVElWSkR2TEY2SGY3UDkxK3duN09T?=
 =?utf-8?B?TDJMZmdsNm9xVlhoejdmSmkzNlIvN0Y5YTVYRC9xQmg2NU1JeXl6WDB0bW0v?=
 =?utf-8?B?QWlIWlhpM2NJQnNUYjFhOUVWQVRjSjd4Qm9VQnNqVHdGSC9uSThoVGd2Y1RW?=
 =?utf-8?B?V3lBU2VsUlVYdER1OG9xWFdtMjdBUytpRG9ZRFZ6VERqaU1DWTdYZEk4KzVU?=
 =?utf-8?B?OWNZcEVTNVdaS0pBbG16T2RRei9RcUFrT1NVcXV2K2g4RGxKaW1lRnJBNm1h?=
 =?utf-8?B?MVRUeitjcWZNendwOUwyRmlhRXZxK3NSMTJTTDh6OXVPd0FtY0R4SmN2RU1O?=
 =?utf-8?B?ZjF0bFEzWjUrdXNQRVRNeVJPQUZDU1E2d0E0cFF5VElSemxXUUNON3BtTXBI?=
 =?utf-8?B?RGEwelhtNFVPUWRnNHBCckppVTVIM0dkZjJrZVhVNVo2YnoxV1pnL09ORjlK?=
 =?utf-8?B?QWhJUmhHb0Fpd0tXbnFkZ3pMTndERTI4QlB1QmQxa3p5YjVxL1RXckVwNUM2?=
 =?utf-8?B?MXM0YVdOYTZ3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 16:42:37.2817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9eb729-8f49-4486-a709-08dd1b9526ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7711
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


On 12/13/24 08:20, Jeffrey Hugo wrote:
> On 12/6/2024 3:00 PM, Lizhi Hou wrote:
>> For amdxdna_mailbox.c, linux/interrupt.h is indirectly included by
>> trace/events/amdxdna.h. So if TRACING is disabled, driver compiling will
>> fail.
>>
>> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
>> Reported-by: Mike Lothian <mike@fireburn.co.uk>
>> Closes: 
>> https://lore.kernel.org/dri-devel/CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com/
>> Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>
> Slight problem with the SOB chain which prevents me from applying this.
>
> Mike comes first, which indicates he authored this patch.  Then you, 
> which says you took Mike's patch and are moving it forward. However, 
> since you sent it and it doesn't have "From: Mike", you get listed as 
> author.
>
> Either Mike needs to be the listed author, or a Co-developed-by tag 
> for Mike needs to be listed immediately before his SOB.
>
> With either of those:
>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Got it. I added "From: Mike" and created a standalone patch for this 
fix. 
https://lore.kernel.org/dri-devel/20241213163856.1472207-1-lizhi.hou@amd.com/


Thanks,

Lizhi

