Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214CA9EC0C5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 01:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B11710EA28;
	Wed, 11 Dec 2024 00:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SocTyDww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8858B10E3CA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:31:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPPpIRBMIs0N9m/TSt0re3Yea7vtM+XeTWsGbW1OOahThG5lYKfo68l8swQ5mRyp2dhKP0k5GxzB13im1kBG81JN8azU8gxKFtwqMtK2+PzCKvb6WDrlR1BWnW4CH6KQvYFBTW4fRLvk+fCLUROsD3UypJLgZFRp/Kp6FTjw12N8V04J9VPeGYX9ugzZae5ivs0TFHtQLVwP8e2hO6CR0r2AtG+eXObLyNZaGwsibOgQrjavo+WXG1H3FRjD5tPGLXFjLuty+DP+2fC7U0sDxm3d10bSmf5/HigcOlVG9Zjtq9Zvvx103xzVm6Sjn/CB1+cbXezgQ3RjwoLGZu6TvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ops7cOaUFB6F33x+TLANIDgmoCEPS/cmz80A2Ez9bM4=;
 b=xYU2hYVvViBVoQ/T/o5AIUjEMrqbABAEHFeoUCNk1Y5JlpKfOnNozhicO6exOz4m7Q++XMZzFC2MLvMNb9sdN4+9MvohT/g4fp5M2rkVX/gGLpj7gP1DWoZBeNlwjMNqqPmzrLnv6zSv22A3lmSgII/Frx7HoSm7xsQzmL4bIj9+1amYOjkBbUVQIkqUDEM6M/CX99rmKIf2vRf64L00opGdefsd8M1vd//GOPc1vsxTOH8SM7XuBGq8Pqd17BJntS5R7RLvWsCqFYlgM/eozWxe9q9Mpm1Ta2nMxsgFCi5UvlqzsMsPgR4aFQxC9LEeeznD/kGMx5yR9I2flPVmYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ops7cOaUFB6F33x+TLANIDgmoCEPS/cmz80A2Ez9bM4=;
 b=SocTyDwwQRGLcT+K/kqt+R6+f01Dt1RkhvVxpPcKYUP7bJve/1sl57jie52V2FQzDSIAl1i57cyyVL/1jhd5jcnLJc16b2cX7IPNBp8F6IQJ9sqIj/CyIkI566crUwT9GkO07JEgSaIp9mAgmW1XS1YnqlFH0CkaEwJpF1136HU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB6772.namprd12.prod.outlook.com (2603:10b6:510:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 00:31:04 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 00:31:04 +0000
Message-ID: <38e80ca5-51b6-4ae3-93b5-5795fd108c2e@amd.com>
Date: Tue, 10 Dec 2024 18:31:01 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/8] accel/amdxdna: Add device status for aie2 devices
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20241206220001.164049-1-lizhi.hou@amd.com>
 <20241206220001.164049-2-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241206220001.164049-2-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::7) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH8PR12MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: a8792813-6dd3-4b71-f6c5-08dd197b1878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2c4UElSOFRRMXM1RElqbGVVMldrNnh4UzJxbFE4M0FRZUcwZTdzKzlZay9p?=
 =?utf-8?B?S1VnL25uWFhiZTBDSXFHTlpxby9HY3FON1VSV2EzVjNkWUdsWFYvY2Q4YTFX?=
 =?utf-8?B?MmxDWHNTOUhRZldnZHMvV25pTG1NaGtTZERYc1E3cXJJQnFvd0YyYzFwQ2py?=
 =?utf-8?B?cVRzL2pRZjZMZDRGSUtaWU5mMWZpNDRFaUEvbG9oWkh0azFFMTgrdjJjYktT?=
 =?utf-8?B?U0ZGbVNwbTJ5M3g1RWtRT3o0dnZuQjQ0YXF3T29jazVWYUVHc3FVWDZnSk1H?=
 =?utf-8?B?cWRWbVdtVWhXSWtqZGtCVzY3dzREQmMwOS9sMlFrNVJJYVZZcnF6dUVDU21G?=
 =?utf-8?B?UGowelorOFUwekNCUlFCQTFIM0tiTjBTcHQ4bUU5WVZOcGpJTGlLN0g0akxa?=
 =?utf-8?B?dmpsNEFlWGJxRnRvNU5HNlB4Wm5jM2FtMTh2c2g5NHdJVFJUeUt6SGMvcnVX?=
 =?utf-8?B?SENUMzR0K29BYnE1aGV1ekZxVWRlSVhobmFRb0JML2tZTWVsNmV1bjNlTlBp?=
 =?utf-8?B?NnV5TERqczZJMExhVDJROXNrK0JNbkJ3dGhVZUhQbE54WVdCNEZHQkxXclpo?=
 =?utf-8?B?U3hzSzdib3N3R0IvTkp1N3VUSFdkdXZDcGozQmUvV0hnTGJSdzAzV1JFSmZN?=
 =?utf-8?B?N0pRaVl6UWl2NGU4dnZXMTFNVEhaTlk3NFNjL21DcDdDZ0VrNnBSdHcwdWlD?=
 =?utf-8?B?OXlOQ0d0ZzZkeFFrdG5xYmltRkVvTHBpeFJBeUdJdlhWWEVLSUsrMnhjcWR2?=
 =?utf-8?B?Ym5iaUo4bFdGN2ZROHloNXhqRUdYdmZXWDZhK2FlbFY2M0JOa1pYdzFnOUR1?=
 =?utf-8?B?QnBnWS9KOTRtZ3FlWjI0T0hOWERyL3NXT1REQk9uVEhIQkE2QjREQ2xCMTRH?=
 =?utf-8?B?OVpjQTFEU2xpMU5ZVTJFeldDS01ETDZIcWdINENrdmwrSjI0enpyWDJnVTlJ?=
 =?utf-8?B?UzVmZ0hFVWd0TWR4VW9pb21Wc0xUU09zK2VGc3AxQ3h6NFV6ZDRMd01HWVlX?=
 =?utf-8?B?SDAwNnNKWlpQNHFSNUE1eHduNHN1MlhMNTZPVTNzNW1mMGlwMzg3QU1nWFNp?=
 =?utf-8?B?Zkd4VjNIdWVydCtiS3pvL2hockZkVUh2MHQrZTN6ZmRZRVlXS3VxTzVPWDFX?=
 =?utf-8?B?RnV0RERvZzhiL3dLMGw5VlBRWk10ME1jVWxDWXhVZnU4elVJa1VOK0pwdk1t?=
 =?utf-8?B?ZGt5d05YdS9HU1FXMTk0SVNsUkNuOTd4eUJkc2ZPcnJnOFU2aGRMNSs5eSs4?=
 =?utf-8?B?T3RlNzdwQTRtTVlFcXZmL0UzS3JqclJ4Vk04YkZXbDgxUHNWWFZ5K1F2S1NM?=
 =?utf-8?B?c2RXR1A0aVh3WnVNWkpIbHBZWDA5V2NBR1FVK3h2N0tZd3pZOUFlazZqcFhm?=
 =?utf-8?B?UHZ6Vnd5dUVvQng1MVovajdQUGJCNmQ2SzRCd2x6RmpJcWJ0aWJBNWwxZHpB?=
 =?utf-8?B?T05xQnVwZDhnUVROSFYxS2tMWUNmV3pZekdJVk9lVkorUEVDYWN1bzIrSjht?=
 =?utf-8?B?cXlPNmcvaXZ3RHN1ZEJwcnA5d3QyN2VoTW13c25YOXY1L2w2enF4SWhiQWhp?=
 =?utf-8?B?ZHNjZnlWa3h4Tk8wUmhXbnpNWDFEcDhUS1RtY0YxZ1BwcHZjbk1JRmtHUHkr?=
 =?utf-8?B?NDJYMkpkVWVwWTM5K1pRL1E5VklVa21IVE84eVVrRHMra29PZWljb0hjcUxi?=
 =?utf-8?B?QzM3Y05Uc3BnUVh0aXB0Z2Q4RTFxQnJJSVZDSDVLZjlTUHliUWE5eFB3cGVD?=
 =?utf-8?B?bGR2T0tOQy9OdmtYN1F1R1FzWDhUczkzeit2anNuMy83eWlKNkl2ZkRvRUZt?=
 =?utf-8?B?S3E2dFZyYTRoZk9OZVI4QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmRRdDh0M2VRQittalRNQTN1cHVRWGZoUjVjUExwaWFGaEV6ajEySEVuQUpj?=
 =?utf-8?B?WTQxNFdDcW56cXlsNGFUcEVWUW95aS92c1NvTGJ5Mm00Z2pkdmVhN1VoRm9D?=
 =?utf-8?B?TlFjQXNvOVUxcEkzSkIwTlp6VUpTWk03eVN1WmN2dEl3Ky90M2NNWm9tY1dR?=
 =?utf-8?B?SVl1MUpPcm1yVkVJWmFSY2FiTUVWYzJKUGN6N1RqL0s1eCtEYjZnelFVc1Nm?=
 =?utf-8?B?SlcrSE5XaXVoN1UxVFVMNEJ4cE8rcXV0QktOSnpFdWYvVWkwTUlnZkMzQTRO?=
 =?utf-8?B?VUZyaU1EWDVkZ2NBQ0dxMmVWaHVnYXVNbTBDbkpNTW1mK2gzYzRSdGd0cXd6?=
 =?utf-8?B?dUsyMkFnTERrQXB6cmZmdzZ1STZhQjZPTWQ1S2prbDZsTTlRY2ViMmtVMzJY?=
 =?utf-8?B?YnJoUTVlZS90STRYbEM1RkJtR2puZHA0Y3UxMGhkYTVGZy9tK0dtMjZRMjNr?=
 =?utf-8?B?Uzk3M1NyMTdQZG1PMmFSUjdLQ0dCejN1TksvUFdrQVY0Nkg5czFQUEdWVkpY?=
 =?utf-8?B?VXc2R0w4QTNnR1JzTktYaGxJZmtjaWxUZWxRVEJDY3pTNDZhalI2cjNRQ2Nw?=
 =?utf-8?B?dmdtOXMxTWV0YlBHR005ZmNNaEVodjZONVJPQ3FrZTlkK3NneHNLNHVybUV1?=
 =?utf-8?B?UTUzY2UrcklXRkJOWmRUcXd4cGxtcXE5aEI3UmMwM3VaeDhKNndCVVpKQnFC?=
 =?utf-8?B?dVRNVVpPV0JkaHJERzM1cW9mWHFJSnlJcGZnbHJFSTJZOUpoOHQyS2ZCdmJT?=
 =?utf-8?B?OFpvL1VSNWtBM0xGcnFET3FnRzFtR0cvNXB3K1VOZnR3QWVPSUp2VXBDNHVT?=
 =?utf-8?B?QjJEdWR6UDNoMWtBbGpvZ0FCcmNrWTdmTjBUZmpvbERBb3lCZjg5dno1SmNo?=
 =?utf-8?B?YngyZzRMSGxJSzdSS0FGdzRWZ2RnY2haM2ZGVDdCRWF1QTdVeEdtUjBBTFNB?=
 =?utf-8?B?ZHFoOVhZSm0ydVdjNmVPTFRkSTRpNERyYWpaM1RPbENjTW0zQWNwZFhrZUxi?=
 =?utf-8?B?dXZ2eGpHbStlNHoyRzNJdHBPYk9UV0d1L05RNVhjWHp1dTRFWUtFN0s1WTZM?=
 =?utf-8?B?b3hQSG1md2QyMlk4Y3dMUVQyMnh6VElGQ3NENWJ4eGpvc1h4YVhocndvVGZo?=
 =?utf-8?B?Zk9nelFUWUtYRU8vWm9NMVVnenkzZGJob1VFYWQ2bEw3anhrUUZ5MldIM0o2?=
 =?utf-8?B?QzVxbGNJdjJjMFZnRFBnVklFaXd0Mm5tcHMxenM1TnpiNURhczh3RVBZTE9a?=
 =?utf-8?B?ZmN1UEJWR1ZvUjg1azRkYlZSQjc2K0RGY3pUMkxnbHF6ZjkvNVJqenNVdHZI?=
 =?utf-8?B?bERBVm05UG8xdDhBWnhPUFJDK0hBWE1DKzNoaS91U3o3R20zci90bHdYUEQw?=
 =?utf-8?B?WXBWS3lJL3RyVjcyaTc1cHFlQTZmT0k0dXdXdnZFZEE5d3F6WVk5SHdvSGFq?=
 =?utf-8?B?REJuR0hCYWRsQ25pOVhzT0l1S3FrcEZpUjlLQmhwSlNIcE14RGROLzI1U3BL?=
 =?utf-8?B?ektNQjVFL1dVRHFOKzVYRGdxRVI3ZUxJc3o1dXIzS3FHZTdlVVVKUWo4bC81?=
 =?utf-8?B?N0VwcnQwOVR3TWFnODRLL240eVNYL09Odm1jblBRelFJTzk5ZzcwdnU0NkZB?=
 =?utf-8?B?dkx1MWpzQlkvMkFjZjhGZG05RU5jaTNmYzZhWXNWdWZuYWVpRFo0R2xPNFF0?=
 =?utf-8?B?SGpXZm1pR2VCTGtTOTFrZ1J0dXVIcm5NKy9EbXlTeXlyL1llWHhsa1JkZGJW?=
 =?utf-8?B?Nk5lakpmdmdrWDMwbjZtSGJrWU5SYlptaDFLbWFVZTJNa1JXQWsyU2JIbXVW?=
 =?utf-8?B?L0tBcjNOQ1JaMWtKTEQ3SWgyNE1ZTnJlQkJaQVVxd3JPS3NYS1RLQXVqNmxh?=
 =?utf-8?B?RlVBOHpiYkRISnpKbXdQNjNBR3JZSUpmT3NSTlVkZnkvOWE0eUliSGtidmJp?=
 =?utf-8?B?bDJEMWhLaEcvK3dybk0zMVp5SUg2UHNPQ3BhdkliVW1VdzdnTjYyWXRmRzZj?=
 =?utf-8?B?K3FtdlJWeUhkMXNOT0dXU2tWd3hMVkx2VHNxWitCaFBUNU9ONlVBU0hFU0NZ?=
 =?utf-8?B?b3BLUFlxQUxnbWhhK1ppa0RZWjREWU1XeTl4RUFwOGJYQ01vdEdsVkd1U1Bp?=
 =?utf-8?Q?owyqJRy08J3UFM11msiGQRKH1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8792813-6dd3-4b71-f6c5-08dd197b1878
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 00:31:03.9992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRvX0RDXd+kIkwp7VZEavJKbBEjMHOySQbzzmdr4Kq5MDZtSAZay5PZPWj9sGKccxSIof21KEj5Pd2iOFrV1Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6772
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

On 12/6/2024 15:59, Lizhi Hou wrote:
> Add device status to track if aie2_hw_start() or aie2_hw_stop() is
> re-entered. In aie2_hw_stop(), call drmm_kfree to free mbox.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_pci.c        | 17 +++++++++++++++++
>   drivers/accel/amdxdna/aie2_pci.h        |  7 +++++++
>   drivers/accel/amdxdna/amdxdna_mailbox.c |  6 ------
>   3 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 349ada697e48..19c76b2b204b 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -267,12 +267,22 @@ static void aie2_hw_stop(struct amdxdna_dev *xdna)
>   	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
>   	struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
>   
> +	if (ndev->dev_status <= AIE2_DEV_INIT) {
> +		XDNA_ERR(xdna, "device is already stopped");
> +		return;
> +	}
> +
>   	aie2_mgmt_fw_fini(ndev);
>   	xdna_mailbox_stop_channel(ndev->mgmt_chann);
>   	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
> +	ndev->mgmt_chann = NULL;
> +	drmm_kfree(&xdna->ddev, ndev->mbox);
> +	ndev->mbox = NULL;
>   	aie2_psp_stop(ndev->psp_hdl);
>   	aie2_smu_fini(ndev);
>   	pci_disable_device(pdev);
> +
> +	ndev->dev_status = AIE2_DEV_INIT;
>   }
>   
>   static int aie2_hw_start(struct amdxdna_dev *xdna)
> @@ -283,6 +293,11 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>   	u32 xdna_mailbox_intr_reg;
>   	int mgmt_mb_irq, ret;
>   
> +	if (ndev->dev_status >= AIE2_DEV_START) {
> +		XDNA_INFO(xdna, "device is already started");
> +		return 0;
> +	}
> +
>   	ret = pci_enable_device(pdev);
>   	if (ret) {
>   		XDNA_ERR(xdna, "failed to enable device, ret %d", ret);
> @@ -345,6 +360,8 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>   		goto destroy_mgmt_chann;
>   	}
>   
> +	ndev->dev_status = AIE2_DEV_START;
> +
>   	return 0;
>   
>   destroy_mgmt_chann:
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index 6a2686255c9c..1c6f07d9b805 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -149,6 +149,11 @@ struct amdxdna_hwctx_priv {
>   	struct drm_syncobj		*syncobj;
>   };
>   
> +enum aie2_dev_status {
> +	AIE2_DEV_INIT,
> +	AIE2_DEV_START,
> +};
> +
>   struct amdxdna_dev_hdl {
>   	struct amdxdna_dev		*xdna;
>   	const struct amdxdna_dev_priv	*priv;
> @@ -171,6 +176,8 @@ struct amdxdna_dev_hdl {
>   	struct mailbox			*mbox;
>   	struct mailbox_channel		*mgmt_chann;
>   	struct async_events		*async_events;
> +
> +	enum aie2_dev_status		dev_status;
>   };
>   
>   #define DEFINE_BAR_OFFSET(reg_name, bar, reg_addr) \
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index 415d99abaaa3..eab79dbb8b25 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -530,9 +530,6 @@ xdna_mailbox_create_channel(struct mailbox *mb,
>   
>   int xdna_mailbox_destroy_channel(struct mailbox_channel *mb_chann)
>   {
> -	if (!mb_chann)
> -		return 0;
> -
>   	MB_DBG(mb_chann, "IRQ disabled and RX work cancelled");
>   	free_irq(mb_chann->msix_irq, mb_chann);
>   	destroy_workqueue(mb_chann->work_q);
> @@ -548,9 +545,6 @@ int xdna_mailbox_destroy_channel(struct mailbox_channel *mb_chann)
>   
>   void xdna_mailbox_stop_channel(struct mailbox_channel *mb_chann)
>   {
> -	if (!mb_chann)
> -		return;
> -
>   	/* Disable an irq and wait. This might sleep. */
>   	disable_irq(mb_chann->msix_irq);
>   

