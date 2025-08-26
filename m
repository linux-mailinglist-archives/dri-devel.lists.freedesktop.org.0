Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019E8B3713E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 19:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5972E10E38F;
	Tue, 26 Aug 2025 17:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0uy/VGoq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EEA10E38F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 17:21:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZKDoUWjpV0Wyst1vPwQVdZVhQMwRvj2NdjWYLZ+2hccctu8NBncAMK37uLOEj2oO9oDT9Abo3C1DYR3rNwMI+llB+7IsSA1pxyv6E3LL1PyFtTKZBF7CocsMEK6Wc5fXcnSyCPLWibnd66fS1MNnrqHvudwsKTFA5dT43wNR2lmmkPyhK2/hYH0qQlqCo2G5qfh4cZQ7iWLJb7ffjv8G+tLsY0n8cYIlRc8sjiZ8/0GgxnhWp+zyPs81rNrN6FIEvgEgMY9xWaDSJrGgiB8eq6hSr8qmXbkgRdVzP3WrdJvn+eHCjmH649VbtE4SYL3EixE5BcCun2NaBMKqehIIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPUD70TSOcD5ODQCzTQbTH6Avlz3Ex7APsHiON+e3og=;
 b=sJKRDmv3L28uV6RVts3jPtC+2HXLus07cS81hVnko/aQGbJbR8vHPSPB/ozCFA6yBwTv6c8WjPLwHsPbQ2tJ8KuCKKv63JKo1vgdpjHjrJ9f1stkKA5VSGZ8SWhxxpQjCnx3focQycFYNX0bJS7Lja/l5KHIhif0Ttepc/xpFYLvKaePDs6T5AQDiYUsAs08fCeBirB8Cq3wklzEBmVduvpa50Bp/5hSFm0Jf43r7wz1uX9hVD+agjFvLlIPU7/d0n2cc12/cF1N38DdLCjaaiPXew3MeGVrQvg+no1qg1Ovx1e7hx3U0fK5vj/cVVcOH48zK806NUAXCWFbW9hmvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPUD70TSOcD5ODQCzTQbTH6Avlz3Ex7APsHiON+e3og=;
 b=0uy/VGoqdciegberr9Zb3G9jeAzFmA4FitybfYF8GgFYZlKgEY9xY3fwCk+fTlhFflRfBQjQ/+1oayusAwzIAwKfJbmC+vxUiM46QaY88R+pUhmyuawyw2huJmAN+f9nH7yQIrCDo1CiKB/DutUxoQmOAvc+ffhVl6//4oZDVeI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB9733.namprd12.prod.outlook.com (2603:10b6:8:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 17:21:36 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9052.017; Tue, 26 Aug 2025
 17:21:36 +0000
Message-ID: <3a831b90-e610-40ed-9017-1ba7ca66a0bb@amd.com>
Date: Tue, 26 Aug 2025 12:21:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Fix incorrect type used for a local
 variable
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, jacek.lawrynowicz@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 kernel test robot <lkp@intel.com>
References: <20250826171951.801585-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250826171951.801585-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0044.namprd12.prod.outlook.com
 (2603:10b6:802:20::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: b2279495-d176-432f-9c04-08dde4c502d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1dzMmFpUkNnT3NrT2l0enNPdnZHSDBWdERucEVFRFRTMjVqQnZnNWJmOEEz?=
 =?utf-8?B?M2RiZXZGY1NjaHNoc1NpWVZUMGMwVWxNeENOMXdTeWVSOTYrNThFOTFnSU4x?=
 =?utf-8?B?c1FSTVFNWVhQUkdjakQydzM1cDlYSVU3bnhTamxCTkhYNHVqSTVZM081Yitw?=
 =?utf-8?B?dTRtRXo0TUw3cHpjVEErTXh0bHRZVlJVVldlRHJtMVcyMEE4eGtwYU44aHNK?=
 =?utf-8?B?dktya2dkZk1FZ1FGa01LczczM1g2bEJUaHB2OXZxZnNjQW5xU01pazlMM2Ex?=
 =?utf-8?B?V1Jsb3d1QnBDczVBWDF6VndCVTFDTzRBL0J3NCthTGdHanV0Uys5SFZURnJz?=
 =?utf-8?B?bnpXYWdWUGZqSVBmNnduNDV2Y28zVTI5bG1hS1dWM3ZnTXRIbm5wZTNEWmps?=
 =?utf-8?B?Ym5OdDJHYW9LT3pnUlhlemJDNTdaVGVYVjI0UndLMkg2UGdCZFVIUG5nMHBs?=
 =?utf-8?B?bGRmRytreVNWMlRoczVHUHhZVjJWcDF4SklYZDBIQVkvUWtQTEh0ZExsRU12?=
 =?utf-8?B?TW1aei9YNWszWVlFTDdlUE1ET1ZtSUlQNktkTFdGQkRnbjhhcXdMUHJYN3Ez?=
 =?utf-8?B?R0tiZFhSQzNQbkdhNVRXbWJ2UzhJUk4yMmhjOHZWc05ZNFNtMVRwWUpaYTZw?=
 =?utf-8?B?cnpKRDRHM1dWZ1NTRnp0WkMyN3BUb015ZENCVVZvYndlUndia1hrYnFNb09p?=
 =?utf-8?B?aG5XSjJyMFNaOStVdzFIczNYMS9EdnJTWjkvc1VUSXVTMEt5eW8vcmFOV09t?=
 =?utf-8?B?bnY1UzBKZjM4UlhKSy9VelFSOEtVUXkxVFdEUzRMZ25tbWpwTVplOEdUUmNs?=
 =?utf-8?B?Q0dsVnoycnhmY1o5eTIxRW9LZGhwU2FiR2FmcHljMUlWaG4zVjRJclBTZTNP?=
 =?utf-8?B?eWRXVHN0ZjRadGtWNmVIcFJDRVk3eUJHWUZ1dWVGa1NXdHByMHpJbDgrL296?=
 =?utf-8?B?ZnUrVUdydENSQTNYMkJQWDNwMDNrcTE5citYYkFBTHFPVGIwV0pPUC9ORWVP?=
 =?utf-8?B?eS9EdTcxak9IR0dUNGt1emZCQnRMMU0vYWttN1BpdW5QVVh2WkkybjdJUWIr?=
 =?utf-8?B?VllwT1NMNGtFYWRDdHpLc1lseUZyVVZTU201SFNLN1Z5bEpXcTlLY0JKL0RV?=
 =?utf-8?B?Wk9EaktoTXBqZWR5Z3NZam50OTlmUFJHNHdHS3VheFpwNVN3OHNSclR2bmc2?=
 =?utf-8?B?Rmljbm1rWm92bzB0NEZsVHVYcGUvOEdqaGNNUk0yTFprcVFRRmVHbElNV25Q?=
 =?utf-8?B?eWxEVll5UWphTG1YNUtLejhXVkU3MUs5RGU3aVZuM09lZG1ZUnpTVXJxQ2tP?=
 =?utf-8?B?TU83N0NwaHZ1aDR6ZEdtYmR1VVZ4bDFOZnd1VGtXNlRJVjJQcWVDejFhYmFE?=
 =?utf-8?B?a1VHWDVDZWpaQys0bU82dDF4V0IyWHpCWjYrQmtEU2VaeWlnT2xrbHlHaDgw?=
 =?utf-8?B?Z0doeFB0VENMdEtPRWd6cFoyUVZaT1MwOVVvekVndndRd1dWcTNwVVZqQmI5?=
 =?utf-8?B?Rk9rQzB0QUx3TEh2c1Jxa29WUDN0NGlNb3RRaDBOR1ZHTVRXSzlUdjRkODNi?=
 =?utf-8?B?SXVUNWhoR0ZIaGdrMUIrR1hNOVhqRWxZaDJsdWZ1MEZZU1hmdDhJcTBRV3ZW?=
 =?utf-8?B?dFBNWEJGa2xlNDVsVm9CUnUwZHEvZVlkd3B2Qm5yNHlEMk83NVA5M0IvZkxX?=
 =?utf-8?B?RW0xbDZxMEtxVUF1N2g1ZFF0Rk9hbDdIMjFLQlJWSUZ3NXlqYmtVY20zUDRD?=
 =?utf-8?B?b3R2RDVodEJ2N0twUGdjMVllUlE0aHdMZnBKOEl1OG5ibmk3a1FZamREVk1v?=
 =?utf-8?B?Nk5aRURlRmJBdVcvYmVhSTJZeTFUUTB3TzVoOXBtc0dqNTc4amlaZ2J1NW5K?=
 =?utf-8?B?SzBWMUp5MlNDNVRTMWtxd3ZaaHZBclJ1bE9TYnlWZXI2UUNPWllOUnYyVVIw?=
 =?utf-8?Q?G59iQX910i4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFNXeDIrcERyb0JncEpOaDh4ci9WRGg2bUlZQkY2bFVub0MrUnVEZTRBYmls?=
 =?utf-8?B?N1RSQTl0clRRa1ZLcDhna3h3Ty90R0s5dDE2RElnMG5MaHhzNHdWbUVnTUJi?=
 =?utf-8?B?UWZsWlZQUFFFTkxmcUliTkhhbmt4c3dZL1E1RXV4QjR0NURLT05DajNiWHhv?=
 =?utf-8?B?L2Z4NHlSQjQ3Q29nUktaWTNWbTBjU09ubmFacWRNWUR0dHE1K2dHSWJKeU4y?=
 =?utf-8?B?L3M2SUwzZ2lrR1phbGJkR1JpUUtqbmVTL2p3R3EzMENpajByV3ZEdHA0dHdW?=
 =?utf-8?B?dmJlMHZQeTZKYm4wV0t5cGUrMFVWWnVvVldFSEN4R3dFeHhyL2Q4UTN3NkFq?=
 =?utf-8?B?VkNuTnZ4SHVtMWpqNWxTS0g2R09zZ2Z5OTNPRTFpU0hMUlZQTDF6dmRHeHYx?=
 =?utf-8?B?TURBaldJWU5nMDA2Q1FxckRXZkNYRXdqbjhIYzY0YzlIdEo2SUZTSzc2QWZG?=
 =?utf-8?B?WjlSVTVqZVVkZW5kTHpMaW1rS1hGR1htSkFBRkxIeWVPKzhxTVBjT2VnRXI1?=
 =?utf-8?B?aTRJcWRVdFJtRU9LVFRGQXhjYlhDZUVpQjFod2xZU3JWSHE0eTdoQU5JeG1H?=
 =?utf-8?B?VUV0YjM0ZmlNU0VzS3NySWdLM2NMUEt1MzRFazk1dFZPc2g5bmV0MlVFMmxp?=
 =?utf-8?B?Qnh0REFjZCtuY05QL1IvMjdhTmJ1c3BHY2RvWTd5VEJpYWE5M2d2NFgvbVJs?=
 =?utf-8?B?QkUwMkN1Mi9FaExEVzFDVFRuRWVlZ0U1OHNPNHhIKzk1VTZMckRmVFhGMU1M?=
 =?utf-8?B?cXVnTWxlYmdGSzNhQXA0VE5ZTm9Wb0NQZVRsT29PSkNSYTYzQktCVVZrRkJN?=
 =?utf-8?B?NUMyZHpzMjI3bVc4anpUVEVtZTlLSXprNWNyV014aW1HQzZqRzI4ajMvWS9U?=
 =?utf-8?B?OUNzUm9tcnk5Q0hwWmJyTmVXYnpmN0E2NEx4ZjQ2VG5XYjQwbUZRVkF5TU4r?=
 =?utf-8?B?dDk0MlRKOGpvNGpHWkFmMlQwK3JxM1RmUGY4OWtiWHFPZVhlajJwRHVSb3Na?=
 =?utf-8?B?TG9reENWeDFUYTMvTy9KVEpPUThTTXcwdWswN3VhR0JsOHg3VllIV3hwbWN4?=
 =?utf-8?B?dy85RkdtV1JIZ2d2R1U5Yng0Nlp1ZGlid0hTY2pnMjUvcmszSlF5MExNbEpC?=
 =?utf-8?B?ZmpibVFKTlpYSS8yOXFsYUIyWXoxL1Rja2E2SlgxTGNFMWhvWVZhbHlnZElK?=
 =?utf-8?B?UlJRcWl5ZFRrYXFyRWFMVEJ4TVhKMVRGN0tMSUtNcEsvNEM4Y3QrZWlvRjRu?=
 =?utf-8?B?aFJDKy8yc2E3Zk1TYlh2TWVZMHRuT1RBN2ZxREhFQkIyenhHQ2YzSHFudDVN?=
 =?utf-8?B?ZjRraG5QR3BkUVVzVVhwY3dkU0tsQkNlMHdHZHkyRjQ0ZGkrTG1mb0M5bGZT?=
 =?utf-8?B?b1puNy9YUktqMW4ycys4Skllc1JRZ1N1K2VaSmVTWGxveXNxd0hTVk02Ty9H?=
 =?utf-8?B?TGFNTWlMaTBVUmlPZ05MMXJ0YlhESUtzamI3cEk4Q212cktYaStXMGNmZEtI?=
 =?utf-8?B?b2ZCU3pQeEMxeWV5N294WjlESWJZaDNHSjA5SlMrcHpaUktCaktHMzBFYmFa?=
 =?utf-8?B?U1VzYnJtejNsamdjdmVkOXhlU2tINVF3TUZPdU9oMzZBYThsb3AvZXlvbVhT?=
 =?utf-8?B?NmkwNEp2dTVBTEx1SmVFUktBRUplSjAxcktlVTRFYkpuVlkvM0MrYXp0U3FQ?=
 =?utf-8?B?ajBhVWxxaTE5S1gvdEluSTNNbXAxQlJIeURCSEZOWFlieDhhSmlZVm03MFlo?=
 =?utf-8?B?cGk3bm52K0F5WXNWSnZEQ1lCdm1YSGErdmVmaERmNWF0UEFIVCtTdkp3TmtK?=
 =?utf-8?B?QUVhT01nUUdCQTN1VEczbXoxZmFxeitnYlR6NWJ6Y3JoTks2cVRCSGU1ekpO?=
 =?utf-8?B?am1zOG5CcUNYT0x4VFMwcnJIK2hoYmpoZnVIOTdVT01yT21xRTNDUTE5Ky83?=
 =?utf-8?B?T1VVSUpBOEwrT0UzOGRVQm9RbzVERDc1M1gxVDl2Y2FXYXF0VWgrQ2I4WU1r?=
 =?utf-8?B?bFowbis2Uy90b2N6RDh3Z3ZDZzZIQkFnN1M4VWhPbHFvY3hjQWZVdWVva1dO?=
 =?utf-8?B?ODhmWkpEUlR5cVY2dTNwNkt3K3JZclhTWExmVFVuK1padmMrN0JVaVQ2ZkZo?=
 =?utf-8?Q?HTtKcT9/dRr3KwVUu7BXW1MUg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2279495-d176-432f-9c04-08dde4c502d6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 17:21:36.5056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVthFhS9m6B5JVVD/5xh8E0aPbW0gzhZ3GnJuh28KHJjaCluZM4ypq0AtveOxhbM6CJrfq8806kbSEVLIN0IsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9733
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

On 8/26/2025 12:19 PM, Lizhi Hou wrote:
> drivers/accel/amdxdna/aie2_pci.c:794:13: sparse: sparse: incorrect type in assignment (different address spaces)
> 
> Fixes: c8cea4371e5e ("accel/amdxdna: Add a function to walk hardware contexts")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508230855.0b9efFl6-lkp@intel.com/
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/accel/amdxdna/aie2_pci.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 16ac0cab4f44..7a3449541107 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -785,8 +785,9 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
>   
>   static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>   {
> -	struct amdxdna_drm_query_hwctx __user *buf, *tmp __free(kfree) = NULL;
> +	struct amdxdna_drm_query_hwctx *tmp __free(kfree) = NULL;
>   	struct amdxdna_drm_get_info *get_info_args = arg;
> +	struct amdxdna_drm_query_hwctx __user *buf;
>   
>   	if (get_info_args->buffer_size < sizeof(*tmp))
>   		return -EINVAL;

