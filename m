Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614FB9D647E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 20:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BD210E1DE;
	Fri, 22 Nov 2024 19:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P4rrs/KK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A31F10E1DE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 19:13:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igz7Z84Xqv0HJ1qi0IQ7cjHFoLx+DV/Fs2xTmD8ArSrRU8k9IQD08ojb0oMpkfp61cvRnJiGWFCGiteehYvg19UtAcreIAIrLB/rrldA5nmf8t+uW4CkoB383pLq/Z9ROa+HFVAyvcAW6upoQcbeSCdCCgZ1IENqFWR7nilBaep1hzZNE1Kqg38MRvbtc3PM85wwCn4o5JpqajjUmTaQcrFN2r3tgJcNN6NxkVl1/5+86mAYr+NCbwn6d4qxjSAxSP2jSGmiK45xxtPfEtA9+aN0kjtCzOrOQ4tPESQWAe+nBJG2KuLIdCi4O/gFgVo6TJgFluKoEhpJ8iUOeZklcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPazKCNs5PLub1xTsqloGQz9vEoDmcFt5U782DESdqg=;
 b=RNWhziNhzAZH/62Dy8FsPrOOC7YrfhnaSgzT397Kc2onSpe0ennIrcJyZSz9ZHTUtwCJ3o7CqruzcyoUN7Ess1ZRvGnnyRGtQoMQKK6jikbnS5JEUvkadlMP8skIH5KgejkOVaYq7ZPN5mPltRXMYvShxp/Z68Ff4vXoSzk7yA6eAGrZBCPSLRnwIUK5xcimiphO9DLaFuaq2aIa+JZ8UtjuWy14nyRcELeS1R/tSXRgGpK71iAp/FAWKr8+/KW17GH+qDgy9Vg7gi6ROm4Nqq7TXOSe6+iNsZQp2DKPG3G1qVTzOsvo8LF3lsgukZOql4GlANYIJW5ND2t7Pbz7ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPazKCNs5PLub1xTsqloGQz9vEoDmcFt5U782DESdqg=;
 b=P4rrs/KKvBoIikRw9LpuvQe1As3w0k0H1kHGv27lD+Jkf1HUpzr7/CgbXEZk9/4z5E1oA+jAa2uzL8rr+rDQydPeMSP353Sd3XRyK0CRzQnJBdwRlRBBzqmvlaGNxtobmGmpd8sNEx6oa8NrShLgmSOGM9WskUuQLB+vRYtR8jc=
Received: from BYAPR04CA0029.namprd04.prod.outlook.com (2603:10b6:a03:40::42)
 by SA1PR12MB8945.namprd12.prod.outlook.com (2603:10b6:806:375::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 19:13:38 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:40:cafe::8b) by BYAPR04CA0029.outlook.office365.com
 (2603:10b6:a03:40::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.16 via Frontend Transport; Fri,
 22 Nov 2024 19:13:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.0 via Frontend Transport; Fri, 22 Nov 2024 19:13:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Nov
 2024 13:13:37 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Nov
 2024 13:13:37 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 22 Nov 2024 13:13:36 -0600
Message-ID: <896ffe9f-bddb-39e1-6ac9-b784abcc0b7b@amd.com>
Date: Fri, 22 Nov 2024 11:13:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V11 00/10] AMD XDNA driver
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20241118172942.2014541-1-lizhi.hou@amd.com>
 <778990df-cfdf-bdab-9f11-83a9bfc25ba0@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <778990df-cfdf-bdab-9f11-83a9bfc25ba0@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|SA1PR12MB8945:EE_
X-MS-Office365-Filtering-Correlation-Id: e92f6119-390f-405a-8db3-08dd0b29c50e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGl4R3hXcFJJdjV2b0F1czFwREd4MmMvYld0Y29uVDJjSDRWZ1FKZWh2djlm?=
 =?utf-8?B?QWlNeVltendsZlJGWG0yL0VHMHZGUmVhYThEQVQyZHA2WTFmRGNqaGN4azNT?=
 =?utf-8?B?Vmk0V0RoYzFtMVZuWXlUYjBWdVdoVWJJakNhUjVySGNJeWdsdUlUOW4xSFhy?=
 =?utf-8?B?V1JUQnNsMHFOSXpzaDIwWTlFakwvbmpGN2tueExtR1A3cGNKRTJrMmgrMnA3?=
 =?utf-8?B?cWp0eUtybTNLYWFKK2lseERNUDBQTVFYQjB4amlxdXdUTHhxZDVma3RwOWZC?=
 =?utf-8?B?TURsUEZUT0pFRUZOTjRxMG1xaGt5dW84c09rYnBZOXBuT1RIanFVeEJ5dU1X?=
 =?utf-8?B?UE1xWVRZRzRPUnpLWUlQem5UU28wQTRxV2VxR3RwVlNOYlV3NkIrbTdsZzNU?=
 =?utf-8?B?cnRISWtrZEx5NzJWTEQwUno5cVp5bnRrK2dZcGVHeS9xZ256UlB2ZDJTWkRN?=
 =?utf-8?B?YTJMdG5WTk1pd3IvckoyNkpOREZVQi9wMm9jcCtJMkZqMlJBZld0TjZGaS9H?=
 =?utf-8?B?K01ESHBYbDMyMVhHZDhwbnBkSlduaHBqTWR6a3c5NlROTzN6YjEyVEQyYXN6?=
 =?utf-8?B?NlZuUDQxWFlVTk55YVFqbk05MG5BeDRuS1ZiSDRYaEtleHEyZ09JVmF2ZGM4?=
 =?utf-8?B?TEl2Nkt6YUF4UUNQSVlZc29lOUVJWnVUNFVSanUzWjFwd01OcDEzVjM0VkJD?=
 =?utf-8?B?VFZ4Y0RYcExQRHdxRzJRN1lsMXVBMmxROFpTeThCRktnUko3TWFnYVBMK2lr?=
 =?utf-8?B?NFB5cUVpdTR1M3VPd0tQYTBXT1pxZWRRc2FZQnp5ODJlNExsVFZLc0c4RFZy?=
 =?utf-8?B?ZDJIRHowdEUzTG45OWN1YlFoRzlpVWlhV0Y2d3g3dFZWQzAxdE4rRUZIZHdj?=
 =?utf-8?B?MU5rcTlqbXVUQngzYzZkTUFFd2RPSkpvMFYwbmVaS2x3RG9KMzhWVzR4dzFq?=
 =?utf-8?B?R0prZ2VtRGt4em00M0ZPaHVqTk9xMDNMVVR4b3M2OHpxT1hUUG5PeE45MlJR?=
 =?utf-8?B?WVQ1TUY4RzladVZoMGVYSSt0d3pBejNhcE8vUk9XOWc3K2s3RUJydG51dVhB?=
 =?utf-8?B?MzI4aDhONFRmUURKQ3hwRUtFaTJXcmt0TlFjSDc5SksyR09pUXA1YnBnbXhR?=
 =?utf-8?B?bkg1ejc3Mm5DQlJuZjVTdHhHOGJoamdtOVMwbUh4ZWxTMmt5SDM4UncvOXNT?=
 =?utf-8?B?cGplRllMYW1rZTFPVkpYYllSc1h1R1ZlWnRIbi93SzZicjB0MnkyTURzT21Y?=
 =?utf-8?B?YkhUc2gzc3RodzFNMGovVlJxaDMrTnBmdlQwckp1S1NMT3hraUtSZkUwSDZR?=
 =?utf-8?B?ZzI2OW5mZ1VDeFlYTGloY0drZk0raXY1S2FtU1o5WW1MbkMzMUpCR3k2WHpU?=
 =?utf-8?B?M2liVnE5TG1KSDR4VDRtbkdoc2hML2R3WVpzTHlvbHU3UnNzN2hiczZBYVcy?=
 =?utf-8?B?c0w0bnVCR2pqZUd2dzhlZE5kcmtvcUVZSG11WDNqWlNlSVJZdFg1dXJaRVU5?=
 =?utf-8?B?K2RJbkR0dyt4RmQ4TGdYNlU2NjZxME9ZWHdzeWRVdUthOGlsTmJ3dnYzRmtZ?=
 =?utf-8?B?NFk1SEwvS1NaSnZWWTJtU1RpZXZCb01UNEVsaEY4c1hNU0hGK2Z6dkFDSGVj?=
 =?utf-8?B?YnA4WFc5c1Mwbng3S3V5TDhqa1Q5WCtNSlcvOWpOVkdoR1J2eTlYOCsyU0Jj?=
 =?utf-8?B?TVhzMCtvbFhJYWc0bm9QdkxoOXZFM1loSVdTVFQwWmx5WUIyV3ZFMzFUZnNM?=
 =?utf-8?B?WVhPUnVERWMzZzMvNmVJMS9pckRFdEt1TlM5VHVrNDQrV2duTHBtekJhT1dH?=
 =?utf-8?B?UXV1b00zemRtNTVOc1I1b3FlQlBzV1RCWnJTOG8yVHgya0FOelhFOGllZDI5?=
 =?utf-8?B?ZWRpYnhGeHlyZHZEcDIzdDNIcE95UVFIcWJQMGVBVW9wS2g0R0JtWm1HUVVt?=
 =?utf-8?Q?+oyrdMCE0Kg1cn57BqugR7FwjKbdEm3z?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 19:13:38.2389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e92f6119-390f-405a-8db3-08dd0b29c50e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8945
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

Cool! You made my day. :) Appreciate all your help.


Lizhi

On 11/22/24 10:52, Jeffrey Hugo wrote:
> On 11/18/2024 10:29 AM, Lizhi Hou wrote:
>> This patchset introduces a new Linux Kernel Driver, amdxdna for AMD 
>> NPUs.
>> The driver is based on Linux accel subsystem.
>
> Merged to drm-misc-next
>
> -Jeff
