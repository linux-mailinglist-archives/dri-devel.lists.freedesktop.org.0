Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAD2A3CE06
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 01:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3319B10E0DE;
	Thu, 20 Feb 2025 00:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lsiiiqbD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2063510E098;
 Thu, 20 Feb 2025 00:14:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVU8f8HPvYnx7GHlMgtzd/kx1LBqi2JsxRlIfrhKKUuEhUkghJ4P1usPV+LCC27uAhw1mfEZbwua4xNKTW2HPShb+GskV+o6VYtxA0+ZG5WDTe0gd38NXhj46sd4rE7/q0gvwJ6iDH7ETcsnonym94L4U8IU7MxZMhhSDL10caz87WHsuSalNKts6YvlhWjZQzIHD3QH1v4KzFEhvOiqa3pFLou98zIBuZ4nEqtGJ4/DNLa+snzVS8QOxfbH6oFnRT8yUA0MsHMrfIK2EdLrd0KySDGpwikFvqhVHzM++nz0ISzxDY9iV1bIOq7X0v4EhIJXyFuJwNP2l3xRWnr5Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFsqL1NktK/fHA0DJigkpSCvKuijjprl4aeQbDBCKHc=;
 b=IChIbbqeld8cIz/q+TZ4tPGos3wYG94yqz2X0x9vPXbFoGJjVIYb5T/ZbBcCA5PFHnxHc3DSwmbQc1erJ7JXZ7aDuEYiiYJ7Mjf1TftI1t0IDO4UCNbT6V65QPgJ47dhvVO1y+px85I2iPyXMNyP9C2LanBl1mZUb7KHJmPjSx2ClhZqfB9onIM57Lkmf4ilsN907vneMsNkV2fbV7VINjp8hHu57SD3eYdDFZrbBDaaDIJPvJMomdL9Hw16uUszKIovFdxxXvNxt6jsO9Q1ozgzaXmDgQdhThVSOroB68w/CGFwbDqh9dhCqf3v82n1hlc1/ZpdabePPWeeHfuZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=collabora.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFsqL1NktK/fHA0DJigkpSCvKuijjprl4aeQbDBCKHc=;
 b=lsiiiqbDaokl8bOCnL5bFVRhQCsz/y5QWiod8wQ6pjHGkKfwiVSO/c3B/B01b/R/59M+b86XAkZyJUuPBTldTroPj5M6byRgDe1feG28GD5VQgg/ozeeAb8QLhorQwmdYHtMuJwDam7hPtXVBJS4p719EIO2fpwCGxH/hpaa9QD4i6OOCWUsMoYfIEmJPCSD0v3jL3T614GUNzKrIqViToMpE4dMhXGqKs5ALT0Buxi1U2sQqWuHecq9JAqWmBpMF3ai4TVaM6aYO9UaZSOL2/f3KBJcFFolx1maJ2pQxRTb+5P+LjeexZo7/OdONGbT1QnhQP9wu2T8L8W882Z5xA==
Received: from SJ0PR05CA0179.namprd05.prod.outlook.com (2603:10b6:a03:339::34)
 by IA1PR12MB7757.namprd12.prod.outlook.com (2603:10b6:208:422::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 00:14:47 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::3c) by SJ0PR05CA0179.outlook.office365.com
 (2603:10b6:a03:339::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.14 via Frontend Transport; Thu,
 20 Feb 2025 00:14:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 00:14:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 19 Feb
 2025 16:14:32 -0800
Received: from [10.110.48.28] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 19 Feb
 2025 16:14:32 -0800
Message-ID: <41cf1c79-f61c-47e7-a0ed-afb8e82d50e6@nvidia.com>
Date: Wed, 19 Feb 2025 16:14:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] rust: add useful ops for u64
To: Daniel Almeida <daniel.almeida@collabora.com>, Dave Airlie
 <airlied@gmail.com>
CC: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Ben Skeggs <bskeggs@nvidia.com>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
 <C1FF4314-C013-4AE1-A94E-444AFACDB4AC@collabora.com>
 <D7VLMD31YB0V.OKHDSVUPAZTE@nvidia.com>
 <1b8921d46f7d70c7467ea0940d60220f05cccc5d.camel@nvidia.com>
 <D7W119MHCCWH.IS600FTIOV8O@nvidia.com>
 <e6322f90-08bd-4e86-8dad-2ddbd7e5cece@nvidia.com>
 <D7WFP99SMV3H.26AJWK17S0UPX@nvidia.com>
 <fd920faf-a707-4c6d-8c0b-3d59c010da1d@nvidia.com>
 <CAPM=9txmQWO+SHnZhr8zXHCZ=S8CNY=PryRVkWWuHyor-ajU6A@mail.gmail.com>
 <1597EDB7-D91B-4660-ADDC-D2252B26CB22@collabora.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <1597EDB7-D91B-4660-ADDC-D2252B26CB22@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|IA1PR12MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: 204f521a-83c0-4893-5e30-08dd5143957a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MllyUk8yLzRoNi9VdXFpeTZhNG1RaUNxRXFadzBTSUtMaEFVUUh3ZC9BeG4r?=
 =?utf-8?B?MTZITk9iV1E2bVFWU2J6TGNWdXF1UjRld2Y2UktZUzZ3cWs1d3pRRzBNZWl6?=
 =?utf-8?B?eUhGaE80US9VVFUzSHJVYVppVExjOWw2QXBTNjNpTDlwNnhzVVlEbkdDRk8x?=
 =?utf-8?B?OS9RSWtINXFTZkttdUk1anJvcVhhUDZ6STRmNXFXaGVmVnozK2dTTHh1UHVP?=
 =?utf-8?B?dnlPb2hqVFZ0WnA3M3Nsd3JpYm1VK3ZoWFdKMUVXd1ZXOUloQ0ZVM2kvazhR?=
 =?utf-8?B?emZmVE95SkVIREhOOTg3bjFZZjUyd2RuNHVTOWtqSFdHSEVjQ2xyc3RwNTlR?=
 =?utf-8?B?UEplbDJYODljbUZ1OWlVSGJqejJtSWQ0d0NpSWRqRkk3NlcraWJWL3NKNHIz?=
 =?utf-8?B?ZkxmOVBiNVV3TGhGcWpTYVlhZjhWUW9SNkZhcTRWdUYxWjlLa05RQ0QxeFUw?=
 =?utf-8?B?dnFyNW1aR0YwREV3a011UTR3bmJMYWtCSWlKZWpwWG5aY3VhcVJDVnFNV3NQ?=
 =?utf-8?B?eGJ1cEhYNTBDYkowa3ZZQytzbmwrYVZlQnR3VStyS0FUMDhuNERhNEt2MGpM?=
 =?utf-8?B?SWNPR1NHTVh1eDVtaUdPUEtKS0krdk9QdVJuR1E4dHh5NVNmazVwZWpoWUp6?=
 =?utf-8?B?ZjRJdEFkZ29EUmExeFRYY3FJdkhHRGRRSjZZS3NyNUxzelJQM1ZJYm05Q2Nw?=
 =?utf-8?B?Q3cwdVNlVjRRMDVleEs5S3lWbEVVbjhaR3hiSDQ3eEdSUXowcE1SbWoyaVJL?=
 =?utf-8?B?UWZLZ2RCaTZKYUVjTEM1OXF5Tkw4U1hNSW9mRXp0VXMzTXJUQ2d2MStXaDcy?=
 =?utf-8?B?SUJYTzlOS0plalIrSUIrRjhTWGVJY0IvOVh0Z1c0Ym1HN21KTDdUamhjOTNW?=
 =?utf-8?B?bzlPM3AwTWNEMXhYTTBrNGczdUZkMndTQVdqb3p3K2krS3drNnFxT3c0b3dC?=
 =?utf-8?B?L2JsR0JRbWVwU0dwcmZ3b1dsUGdQdVp1N0gzcnZESnNpOUt5VU1UamFvcmxq?=
 =?utf-8?B?NFZGb0JubjhRMzdlT1VzbjBxZjgyR0V3Vk5JUE5vd0pZUkJ2eEhQQ3gyMHZY?=
 =?utf-8?B?M3I1R3c0VGphNVJwc2Jrb0ZhbmdKNUtGY0hIVnZvMnhzSGFSU04vWnFpay9m?=
 =?utf-8?B?eWpFTFJJZDl5Q3NvNzlteXR6U0hHTkhiRVo0QmVjL3k0VzNSLzE0WW13Mk5Y?=
 =?utf-8?B?QithSWZsUnpIdkdtRmVxeHlzWm9wd1V1U0hidEVkcDBzZ3RGYlhqK3dVT1Uy?=
 =?utf-8?B?eklESTVRajEvSmwyd3VBczNQcEI0NHNqMWlkeVJJeEJ3Sk55RWNFa21ybi81?=
 =?utf-8?B?MnpHMytDaE01ckdFSFE5ZnEzM1dLVmNDWmlidkpka3NzNkxsSmRtaXZHTXRY?=
 =?utf-8?B?L2pabGw0MUlOdVo5K014Qzg2WVRpRXNWOWRsMUx2VE9ialhrMVo5bmFrYm13?=
 =?utf-8?B?REZtcnFDU3BVbnVOSDkzT2Ezd2tyekVteUhWRFNpUjlNKzhVSkhLcjhKdFNp?=
 =?utf-8?B?KzcvS0NQWjhHWDNidlArWisxOVpNNkRmMkszZHpQU2JMTFRWcjlqd0VFYUFE?=
 =?utf-8?B?eWJURlY5Z1NZaFZOOEZxTkJBNjR6OCtFd2VxY0N3Y2FkcWJTL0F0cFAzODFi?=
 =?utf-8?B?K0pIT0sxQXh1eENnaDR0aDg5cHFOZzNnODJLRlQyOExhUlVlT1Q1VWpsV04v?=
 =?utf-8?B?TzEvOWhyY1pKUFVlakYxSm1kMzYvYlhRampZcXpjdGFMNVl5Z2w4aWFaUmd4?=
 =?utf-8?B?WEtDbXZBeUZ2WVZ3RXFPd0N4QmtqemI2Wk8vcUVIcmE3ci8zUnQwREZxREd5?=
 =?utf-8?B?WDFBSVkyd0FEb2JCUURLK3Y3d0EvOEg2V04yT2IyZHFkSVovcWVRUEg4c2ds?=
 =?utf-8?B?cFVDMW9GZTQ4OUw0VEUvNENVRTZPMUZ2dFJWNStyWkZwbjl2Z1U0Wkx1aTJE?=
 =?utf-8?B?TVZsbWdUeGJpS3JoelJRMytTaURpc01uamxIT2d6RkFpcFBHUVdSUGhwaTNz?=
 =?utf-8?Q?1cLfXDUp48M9Xalfg9+wkf/oonbt/Y=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 00:14:46.6930 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 204f521a-83c0-4893-5e30-08dd5143957a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7757
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

On 2/19/25 3:13 PM, Daniel Almeida wrote:
>> On 19 Feb 2025, at 17:23, Dave Airlie <airlied@gmail.com> wrote:
>> On Thu, 20 Feb 2025 at 06:22, John Hubbard <jhubbard@nvidia.com> wrote:
>>> On 2/19/25 4:51 AM, Alexandre Courbot wrote:
>>>> Yes, that looks like the optimal way to do this actually. It also
>>>> doesn't introduce any overhead as the destructuring was doing both
>>>> high_half() and low_half() in sequence, so in some cases it might
>>>> even be more efficient.
>>>>
>>>> I'd just like to find a better naming. high() and low() might be enough?
>>>> Or are there other suggestions?
>>>>
>>>
>>> Maybe use "32" instead of "half":
>>>
>>>      .high_32()  / .low_32()
>>>      .upper_32() / .lower_32()
>>>
>>
>> The C code currently does upper_32_bits and lower_32_bits, do we want
>> to align or diverge here?

This sounds like a trick question, so I'm going to go with..."align". haha :)

>>
>> Dave.
> 
> 
> My humble suggestion here is to use the same nomenclature. `upper_32_bits` and
> `lower_32_bits` immediately and succinctly informs the reader of what is going on.
> 

Yes. I missed the pre-existing naming in C, but since we have it and it's
well-named as well, definitely this is the way to go.

thanks,
-- 
John Hubbard

