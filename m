Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F21FB9A6F2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 17:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0316D10E733;
	Wed, 24 Sep 2025 15:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bZdLtKrB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012050.outbound.protection.outlook.com [40.107.209.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDF810E733
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 15:02:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZtgvUB1KpSxAuyGX6nng0xCbbZJM6qeoJD5M79UnqyVMm/DLZqTlw/P08Y9sRNsnZU5d5EGlLHjAhbRO2GEtnVSJyXWTc8M54qxWQoNLYeYDa8wqoBeLpgvgitJvY/Tc9xdhM9yqa+Gr3XKWA8dz6Q0etB1s2NRauWc1x+7Soo4iCtNR67I8nBpp/dpdDOsmqXmEt3jcRpi1/46WqTd8+ZaqKw+qL//qev7H5wUpkvAsdZP+xb/KtkOzam5lKK//F1xq5ziFYvFYTfV5hyjn/W0h5ZjHS2FLupkdxEc5HEjb4okj99ZHZ9dJHcsT4XpfHOtk4d/fkkD8xZOGzr36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHDCmrOUfEGTo0Mft19+4E0kL6HZd3HUgZl98CWz+AE=;
 b=lfIcr0Dosir1aQ8k8Knpd1c7AVM3HGn7/TNaR3FdMDwwVTa/P6Pek/PkRs2HsygcX+7zLlKz+/F7iMSHWYK1hLT6YrHsRY27No1W/t31CqgjeCbh/MbU5A72b0cE8rfDNti5oFv6SspMHXGIDgSkTV45rNPxcygHf3LFqfTI+oNqZdfbhIKQkmxPvGsWLXXyJ2ZI9p1HE7zFQPZqrn77nQVKk6RaHJ1blqpZsyu7YpcEqGkR+R3rn0VmfuDinbcNEgdXksDt1e4muXLZYiCS+srm6ThMfxVFrsT0xIKuF+v6TZtEfSy9pbZGVSzcGyDWZc+QKMMXz+oTprm/ak75gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=mailbox.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHDCmrOUfEGTo0Mft19+4E0kL6HZd3HUgZl98CWz+AE=;
 b=bZdLtKrBZBxiuSjX737R9/896Ea9tXn8L9GVv5WGe1jaK5eqGGXZW2IEeisN+JZxCgMMlZ9SkYGi935jz2IdCAvVHDC5eltRBM3vKxou+tBOSv76qxXvGMNA2hrWVzyebIwRHlIxsL8iuI/cDFycunXlhYnGn/nipdj/e7m5v2o=
Received: from SJ0PR13CA0172.namprd13.prod.outlook.com (2603:10b6:a03:2c7::27)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Wed, 24 Sep
 2025 15:01:59 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::eb) by SJ0PR13CA0172.outlook.office365.com
 (2603:10b6:a03:2c7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9 via Frontend Transport; Wed,
 24 Sep 2025 15:01:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Wed, 24 Sep 2025 15:01:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 24 Sep
 2025 08:01:51 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 24 Sep
 2025 10:01:49 -0500
Received: from [10.254.37.133] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 24 Sep 2025 08:01:48 -0700
Message-ID: <1b09ec41-0f82-49c2-9adf-66f4fd537b9f@amd.com>
Date: Wed, 24 Sep 2025 11:01:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, Derek Foreman
 <derek.foreman@collabora.com>, Chuanyu Tseng <Chuanyu.Tseng@amd.com>
CC: <harry.wentland@amd.com>, <Mario.Limonciello@amd.com>,
 <xaver.hugl@gmail.com>, <victoria@system76.com>, <seanpaul@google.com>,
 <dri-devel@lists.freedesktop.org>
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
 <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
 <58a6e042-1890-4d1c-88cc-29f500b0a407@mailbox.org>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <58a6e042-1890-4d1c-88cc-29f500b0a407@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: 20253957-713b-439f-4d8a-08ddfb7b4fa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|42112799006|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDQyWlhmR2V1bkxGclRBQVI5dlZlUzlEYU9WcEc0VXJ5bTZmbCtKQ2Z0eG53?=
 =?utf-8?B?N0ljcG9XOWlZNGtaR3IvTFptangwN0dKQjBQUlo2TTF1bDNsR01CMGpPdTZH?=
 =?utf-8?B?WTQwRkI0VVpqL3VPK0tVOG5HeStWcEdINlNic0pnTlFYVm8vSVA5cHdoa1R3?=
 =?utf-8?B?a0xVMStoM2xvUlU3Rkl6NWFzS2NWQXhGN3VyeDJGZ2NpMW9zTVJOaTNHYlYy?=
 =?utf-8?B?b2tROStvL1BnSmllaUhjNHk0eXNyZW1veUhZa3k1blcxUlYrcENaZVlYSGlk?=
 =?utf-8?B?eGlML3NXVWdOaDg5M3pIeFB6Y01tN0c0OExPZ2tHL3ZSVFVsSWhDSWZqTUJt?=
 =?utf-8?B?cnJ0c3hFMnhjQVNZVEU5NkxwRjMxV1Q3MHpTRG1CQTIvbm9EaUVwMnJHTWpv?=
 =?utf-8?B?WkpwZnUrVkJJVUlWWVB3QlczUHNONVZZWDlEazdiVnduN2Zad1pJL1dlWWdM?=
 =?utf-8?B?amlvN2tWUDZNNHFKRzcxdW5hd2ZGZUY0QjlQWGx2RzdDbUFpc1cwVGlCK2M4?=
 =?utf-8?B?TTA4RHB1ZUJWQXJlYWNIL0EyYlFEQng2clMwYVZmSUZvVTZhSmQ3Q3pKVUFz?=
 =?utf-8?B?QUJnUFRvQlQ2c0hlYk5EMGVxNmV4L2V1ZVVPWnJTQWhhbzlXU3V2K1lyVHc1?=
 =?utf-8?B?RjhaRVBpd2xhOUJXU0RYYktXSHBueC9yUTBQbWVxTllNbmZNOVVPanQyczIr?=
 =?utf-8?B?emJKL3I3bjVabFVHNEhBS0xmNWtjNngydGJCQWZwcXNCN1N1RU9FSk9BWGF6?=
 =?utf-8?B?SFBBMU5HM0dWb1dQbDhRRDR0YzFRYS9Hdzd2RUM3dythRGdZY1kzbWhIUmpQ?=
 =?utf-8?B?MFlGKzlrM1ppdTk5a05xOUdqSmNyMnVKU1hGWHZKRGdoVWFWZEVXK0R2VlJp?=
 =?utf-8?B?blZuTVhya3pxVGZyRjBFNzAyTGhrcGNmSDNqMHRnSFZlRG9qZHlFOElPeVNp?=
 =?utf-8?B?QlpSNHRGZnhtd3NlK2pOeVZ1UFU3R2FPOGNYVXhua215dlM5eEZrcThvekFZ?=
 =?utf-8?B?ZHBkU3BoNGQzeDF6OFd5a2pSMTBoby91Y1JybERscWg4YmU1eklyY2lRYlU5?=
 =?utf-8?B?ZG9Ha1RXVzZOK09YdVFaVVpGZGQyTFFiMTVoNGdRR213aFIrSjkyODZDRU10?=
 =?utf-8?B?ZmpCb2IzSk11M1p1UEFHUllvS3ZOUmZaaUNTWWtZaUFIdkxla2FqN0hpU2JT?=
 =?utf-8?B?enNJVVdUUFo3ZkQvaENpTDZxMnZzWDlOcE93OTl5SGVISHNFTFJpOHFueURD?=
 =?utf-8?B?Vy9ZZUNDbWpFbTYxTXg0dlZVdGx5eGZGeXUyU004SE9kSzRGenloTXJHWWsw?=
 =?utf-8?B?aUNTMUFuUnBGT3lGZEwrZXAxc2FkYml2YVRhMy9GRUx0eDByM3E2eHhPRWFN?=
 =?utf-8?B?RUY1ZkRMcGNDbVM3TVVTWjdMSmowVTk1WkFDYzk3alpueVlrSWpYUTA1bURx?=
 =?utf-8?B?cUxrMVVRNDdWRHVyUGVEV01VQUNkcytPWG4zVzBqZWg5ZzArK0lqdmJ5eDE1?=
 =?utf-8?B?NzZpUUMvbXI2bk5aNUZja2RZMW1lUTZJSHRkUWVvRXBUeXhDK1FlaTBHeVhq?=
 =?utf-8?B?Nm5XeFprb0tDWG5RdnJPYS9YSWV1VXA5QVIzckcyRjZrTE5xTGVIOFkzcWNW?=
 =?utf-8?B?bnN3NFYxOXh2eHArdTJDUmg2TjdaWFg1S0VtYjViRGVzT3pIMWlwbUdhY3pK?=
 =?utf-8?B?S2ZycHVCRVZHZEtqbzNEazhtb3VnTXI2WEZSVmpBMVkzZEVtTHFjTzJQTWc4?=
 =?utf-8?B?Y0Jrd0EvN0hDREtLcHRWUmdUa1htREpReWs1ZjZCdHNRT0l1UUkvLzdWVlpC?=
 =?utf-8?B?SXJMMmVIY1cxOW1ndGNFTlRkcWMzRWRrQ0tucy9kN01OaGM0SFQ2MVdWdlNS?=
 =?utf-8?B?VEh4SDNCOFRjVGM1MndCVVhyUVluNUFkWUVnTm1ycE9OeVNPMnN2S2JZOTVa?=
 =?utf-8?B?MkJTaDlQUEVyU2I3N3FzemRIYVd4ODVncTUzbnJ2bFhUeWtsUjl5WHFXWkx3?=
 =?utf-8?B?dUJZdG5mYXNnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(42112799006)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 15:01:59.1102 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20253957-713b-439f-4d8a-08ddfb7b4fa8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091
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



On 2025-09-24 03:50, Michel Dänzer wrote:
> On 15.09.25 12:01, Michel Dänzer wrote:
>> On 12.09.25 15:45, Derek Foreman wrote:
>>> On 9/12/25 2:33 AM, Chuanyu Tseng wrote:
>>>>
>>>> This is done through 2 new CRTC properties, along with a client
>>>> cap. See the docstrings in patch for details.
>>
>> Not sure why a client cap would be needed for this.
> 
> According to https://hwentland.github.io/work/2025hackfest-notes.html#vrr-for-desktop-use-cases the client cap was intended for disabling LFC & ramping in the kernel driver. It's not really needed for that though:
> 
> If the min/max property values differ, the kernel driver can vary the effective refresh range between the limits and perform ramping, otherwise it can't.
> 
> If the effective maximum value is at least twice the effective minimum value, the kernel driver can perform LFC, otherwise it can't.

In this case, would the kernel be handling LFC and ramping still? Or would it be a team effort between compositor and kernel?

For example, say the compositor wishes to adjust (min, max) from (48, 48) to (60, 120), and we're using FPS as the unit. I could imagine the following scenarios:

1) Compositor does LFC/ramping
------------------------------

The compositor can make a sequence of atomic commits where (min, max) is set to (50, 60), (60, 75), ..., (100, 120). The difference between (min_1, max_1) itself and subsequent (min_2, max_2) will have to be small enough to avoid panel flicker. IOW, setting (60, 120) is bad because the range is too wide and may cause flicker, and going from (48, 48) to (120, 120) is also bad for the same reason. The compositor has to be fully aware of ramping here.

For LFC, compositor has to be fully aware too, and ramp to the calculated LFC fps. IOW if going from 24fps to 30fps and the panel supports a min of 48hz, the compositor has to ramp from (48, 48) to (60, 60). Setting a (min, max) outside of the panel supported range would be rejected.

2) Kernel does LFC/ramping
--------------------------

The compositor can request a change from (48, 48) to (60, 120) directly. There will be a period of a few frames where FPS would ramp up to the requested range. IOW, the requested (min, max) is not guaranteed to be applied immediately. Since the kernel handles ramping, we would have the same challenges as prior to this API if the (min, max) range is large. Though that might be ok, as long as the compositor is aware.

If the requested min happens to be below the panel supported rate, then kernel can enable LFC, but only if the calculated LFC fps is within the requested (min, max) range. I guess if it happens that the requested min is not possible, i.e.:
* min or max is < min_panel_supported, and
* max is < an int multiple of min,
Then the kernel would have to reject that commit?

3) Team effort
--------------

The compositor can make a sequence of atomic commits where (min, max) is set to (50, 60), (55, 75), ... (60, 120). The kernel will apply the new range immediately, but still apply ramping within the requested (min, max) values. Also, the same challenge mentioned in 2) applies here.

For LFC, I guess it would be the same as 2). The compositor has to know when the min < min_panel_supported, and make sure max is set to be at least double that, and within the panel supported range. The compositor would have to ramp to that target though.

--------

I suppose either 2) or 3) aligns with your thought Michel, but I'm undecided on which is best. Or maybe there's another method of operation that I haven't thought of.

Thanks,
Leo

> 
> 

