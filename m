Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522FFA3B005
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 04:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B1110E118;
	Wed, 19 Feb 2025 03:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jg2r1ftG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D0B10E118;
 Wed, 19 Feb 2025 03:25:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBvu86BIvh4tj0Iu1BXRWNzOk48IdxREPgo1QPqPyFcBVE0Us6yu+PDFdOhM3aDfX8f3hgr4i76/cs3Dx7XtwsjMZzl9IlebH9KJNPbYbOZa/vCAYaUXYDhJ3IxYN88vyXgDVQsoIEsbWIIqlYio9lNgYMFxyLVZ9+rH+ZJtMgod4BUcia1Y1Z0s/RZPyS0KG/IMHuwlNEw2cgNh1/Xc8eGKp/LpPc4UxbjahMMogNJu4cuer5EI27P2iNh7Vg2h9ou5HXrgAHG85v+ep0cW9IVxOvX8lX72fogXytU/eM2Z6iM/65eYS846svwGPwEZLX9rMjaUlWJo3TJdYrGjTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c33txVUUg2gtuZogOul79AdBP1UxIP1EWq/aITDWj9w=;
 b=a8HSXNAwyPBaOUd5g6kcrMXG5N3eqFfPaZwQWvnkkVZxeT/5bXiWS4MN+jydlMppVGFYVxnv0J46sJa2ajcPQe+q4bLZE9fH8v0PjavSxSBMPb11udnssg+AqR++cwp1Y56b9Bu+h2/OonRBdaa3TWHbgrOmU8381RiYhvzLPHGo/8JaHI8u60aZcPiKPbxtvCu2SdchGc7ZITRBM0rKTB1aLAorHfOMpiWzi9U1/spSbaMvjFyfm+03rkBbOJk6d16lF6BNS2DzLGpEgHqV42FviRgWdiiEzwM1cmgm2UhVbM03Ns8fyw+TUSs+9vtzfWb0dRyxX6xaEGBFe1IQyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=collabora.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c33txVUUg2gtuZogOul79AdBP1UxIP1EWq/aITDWj9w=;
 b=jg2r1ftGpUOzmCWnGVE9VZM1zuHbTyrgkbLCuAyEy746vo/RaQfrFRMcDi5b7tt8dEQ4NYo4DLogWzq8BnZVT/z9DMY0BBNic5ZF+d7waWMHevvSHBXhcjyeVjpiIjFhyxfj2IH2jGS0UwJtX8BhA03dS/JocDg1aRV1i7XihnvQdgOBrIvbNh9pwGZ+Dx69jVORaoH/xL/WA/E3phH2+SpgbSInaJpzrRxRmcaverqZdjUwitev/hvf4dGIzAgylezgF0KUo6cI93zPLeCecaNWor9+PWQSJYk82Os93jJW84FM+ly7XmdpXb0Gf1q6+kL7PSH1F6Vpy79R4jvskw==
Received: from SA0PR11CA0145.namprd11.prod.outlook.com (2603:10b6:806:131::30)
 by DM6PR12MB4153.namprd12.prod.outlook.com (2603:10b6:5:212::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 03:25:04 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:806:131:cafe::2c) by SA0PR11CA0145.outlook.office365.com
 (2603:10b6:806:131::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Wed,
 19 Feb 2025 03:25:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Wed, 19 Feb 2025 03:25:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 18 Feb
 2025 19:24:54 -0800
Received: from [10.110.48.28] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 18 Feb
 2025 19:24:54 -0800
Message-ID: <e6322f90-08bd-4e86-8dad-2ddbd7e5cece@nvidia.com>
Date: Tue, 18 Feb 2025 19:24:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] rust: add useful ops for u64
To: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>, 
 Ben Skeggs <bskeggs@nvidia.com>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
 <C1FF4314-C013-4AE1-A94E-444AFACDB4AC@collabora.com>
 <D7VLMD31YB0V.OKHDSVUPAZTE@nvidia.com>
 <1b8921d46f7d70c7467ea0940d60220f05cccc5d.camel@nvidia.com>
 <D7W119MHCCWH.IS600FTIOV8O@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <D7W119MHCCWH.IS600FTIOV8O@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|DM6PR12MB4153:EE_
X-MS-Office365-Filtering-Correlation-Id: 87bdf88a-8523-4053-4081-08dd509500b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmFkcy95d3gyV0RXYk1JMEIzT1NUY0NVSFBhMnpNaGNRenNBL0h5elBVcVFt?=
 =?utf-8?B?RWdvelVXWFlrWWRkdHQ0dFBUekhWZVorN1RBRVBrbEcyM3NZZGdoTGxYZG8y?=
 =?utf-8?B?c2g0d2ZkQXdRRTJvV2hPeXV2YkZLWm5qa0k5WkdXMmdrR0xtUXRkbGI0d2xW?=
 =?utf-8?B?YmxVRFdpb05rUzdLQU9iczNaT3EwaElia2lSUU8zWmEySnBHa0xUT0xQVWhv?=
 =?utf-8?B?ckowUFZpSUsyWXZNWmpUNjA1NVdGWTZjZHdhcGVWM2Y4L1dpVFovc1FSUUgr?=
 =?utf-8?B?MS81MEwyalhHbEtSaGxyNWhaYUZ4cjhsZFFVWXQ3bEgzYW9KUFQ4R2JBV3hx?=
 =?utf-8?B?NGljK2dDVUkyVWFwckt5a1VMaFdiNzhoMng3UG9JR0hRZVBTdnVrdWZlNjZu?=
 =?utf-8?B?Qm1EMFZHQWlUOFFyeDlTdFVkLzRDemRpUnVCNWJudnZvSmhiMnBYcjIrRW9q?=
 =?utf-8?B?aTZPdDRIcjR1ZU9pZXNMYXhzbnZEZHFlOWV5VFBabmMzckRaMk4zMFZ6d2Ev?=
 =?utf-8?B?TEFFa3QwUytobldHSFhvcWZ3NGxqdUxqM2h6U1hQK0FEQmxNM2lDWUJkY0F4?=
 =?utf-8?B?Ryt3ZXdHVXhlTmJaSklzaW4ycElzeHRQbi9qRHdYMnlibWlkNHpWcUFTOUVL?=
 =?utf-8?B?aDQxdnBPNHRUR3UreFJiYkdMN29jeS9oL2NHQ0dOUDZjdUo3djdGbS9hUzUw?=
 =?utf-8?B?Y1JaUHN3cVhGVkUyc0lvODIxbEFTYjhOZ1FSeVl3VjlMaFhsb2g2Y0tudlVH?=
 =?utf-8?B?bDBocjQ0QXEzYmlhTGxsSU1VUlcwUEdOSEcycGQ4UEtpY250RE5DbDlIOXA3?=
 =?utf-8?B?NFFyaVlOcytXdUExRFJ4WkdzTkFlUHFLRkU5a3dVLytwQTFkY2NpMFJ0YVhy?=
 =?utf-8?B?OWNoZ1NSVGtDdlZTTWJvaWEzdThVaWNvbVJVOUx4VCswWHRsUHozRGpHTEVs?=
 =?utf-8?B?eTJHOHExU1ZsMjV6eEJFcTV4dEJDcmdXb1dOQWN6UTNVVXQ3QVJEaURuYzhU?=
 =?utf-8?B?USt2aXZoSzNSc3FGNHZ1R0UvL1hxQ3dqVU05SWdPNWplWEY5VTg4dlNXMFN2?=
 =?utf-8?B?KzJudndJTWtkMFgzTGUwYlBSbVFMbUpMMG5DdlZScVV2ZmxHd0ZvQTZTdVQv?=
 =?utf-8?B?VUY3d2Y0b3gxa2N6MHFQWVZjU3d2bnBldGlDL3BkTjZLSUtDWDhtRklnY2Y3?=
 =?utf-8?B?Ly9sNkVaMk5HMStnMlk3eURWZXpEdk9BWHN1M1hnMjhSTVg1d0x3MWVhM1FC?=
 =?utf-8?B?dnRDWVkwb2FvRGtpWDh5VDdXR0hUdlErR2w2QXRpcTBKb2pEaWtJRGR4V1lG?=
 =?utf-8?B?MmJ2RDRTR0JONVRYNC9nVHcvRU1mUy8yVTV3MExhb3ExSXlJNWhGREJrSWlh?=
 =?utf-8?B?UmRxNVVlYnRNTStwY2ZEMUtyUHh3elcvNTQzQ3kxd05vTktseXlUM24vVWFt?=
 =?utf-8?B?RUdETGI2eE1XNS9iNGlzYW91eEFKcHJLb2xBZFlLS2NIYThsUnBPL3FkaXJk?=
 =?utf-8?B?Mm9wL2dkT1hnWWZBUCtXYmhpTXFYYksyRnQ3T2N1OVRzOElMY2ZzRXNLUERG?=
 =?utf-8?B?cUt5QUxaY0RvTW1RY2swTzc3NFpnY2I4QzVCN3Q3Z0d5bklZL3d6VFF1US9H?=
 =?utf-8?B?VDdUdk5PRmcySS9hQmUvUlcwdWV3Qm5jY3h0NjZhalJMSUR1NWUzOGUvbXhC?=
 =?utf-8?B?YUxCMUtkQ1VQcXJ3SG40RkpmdEpDTjdGd0s3SnEvdHM2OUNUVFpmNHRKS2Rk?=
 =?utf-8?B?NXo0NDExbEQvOE91NEtXUjZqWFZyWnpjRDh1SFNpVDg3SlUzQTZEb1ZvOXlo?=
 =?utf-8?B?UmVVb2xpQzhMTWZ4RkNDaEFaRlJ0VkR3UmVkNCtRaWtMVTMwVkhCUEVkd1gr?=
 =?utf-8?B?WjQrTFVqK1o2L3BBK2ZleUIyNExZRVpNRm81OS9RcHpWMzdENStXTmxlME96?=
 =?utf-8?B?ZUdUNjBvVko2V3M3anNXYmZYeGY1SUpBNXYvUmFONERqM1ZoUzdUWmhNQU5X?=
 =?utf-8?Q?ot3TCIVhQyk6qN0X5rnuEJibbO7814=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 03:25:04.7415 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87bdf88a-8523-4053-4081-08dd509500b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4153
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

On 2/18/25 5:21 PM, Alexandre Courbot wrote:
> On Wed Feb 19, 2025 at 5:51 AM JST, Timur Tabi wrote:
>> On Tue, 2025-02-18 at 22:16 +0900, Alexandre Courbot wrote:
...
> More likely this would be something like:
> 
>    let SplitU64 { high: some_u32, .. } = some_u64;
> 
> Which is still a bit verbose, but a single-liner.
> 
> Actually. How about adding methods to this trait that return either
> component?
> 
>    let some_u32 = some_u64.high_half();
>    let another_u32 = some_u64.low_half();
> 
> These should be used most of the times, and using destructuring/tuple
> would only be useful for a few select cases.

I think I like this approach best so far, because that is actually how
drivers tend to use these values: one or the other 32 bits at a time.
Registers are often grouped into 32-bit named registers, and driver code
wants to refer to them one at a time (before breaking some of them down
into smaller named fields)>

The .high_half() and .low_half() approach matches that very closely.
And it's simpler to read than the SplitU64 API, without losing anything
we need, right?

  
thanks,
-- 
John Hubbard

