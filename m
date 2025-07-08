Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4A1AFC9BA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 13:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617C310E609;
	Tue,  8 Jul 2025 11:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DdA8gkO8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A32F10E607;
 Tue,  8 Jul 2025 11:38:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cw09aDffMl2EgcPUZXmJ2qDO+E2FrPxHp9u18niVOH39wn0bnsgGtrQEFKEz58EDKmlKfHOvt9s28k+kJ/GRgZGpjEkPVrXh3Y9I9paI7pujAg/YJx9ZU7R4EI3g2kClC8ffVo8b8sXTgUryGSgfzofujoqIwbgTCV7+2HQP450KHKlcKOQR0gNXqB6pTsgBvwWyE4bnxq3xDFw+lwl4sWM0Ps1tPb1kOcShghd6OAZeuyAxJeCfD/96RzLLT6X30NP4og/UGHdTM4s1O61b2NpS3CeIZKleOI5BKy7ZBwcQwEUtsHU9u/vOXMsQdvmd84nFBPXfV5uFGv4WxG8UHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaVYXihkVMSAt1VFgA4IKClPoCsXbZ3HLzsRLr3AZEU=;
 b=iIa5OLDVEbw2X5uX0N8UYU7l9nF5hqlEakTQdsDJwjsa8q6u28u6yBxHs8csAksiRAc8vdTcN8OT+QE/HR7DwzXMOA6yYJlyyfLVztGwCWbpiMMqcOb7Rv/RyAnOWTWmJEbzVS1yZfHUXlKogp/UpUMcFDgN+rEifVAXkDc6unWS5B251aH+i9thuB0aDXXaOCMxQJhW9uuLRMB/IutJn3L9fZR1Hrc3ZMqAItXXJ+Vj7nT1NwJFsER+wbqvoCof4zqcYGrESiim+h8pDrbRxROruc6sFaIq2wIh++QzLQu6eu3KaskrOTLayhzuwDRDzEQqATgBMSttWgkeYDNLWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaVYXihkVMSAt1VFgA4IKClPoCsXbZ3HLzsRLr3AZEU=;
 b=DdA8gkO8KWW7UvklOWu10pWff0oHXw7HR86nh326H5N85lYXKO8OpCSC5Eg86dwBD5GfrNRS3lQvx1xZ7YHfGTTGNnMo+HBRSggrrbya/zoxg2co9UFErJ0cRDv3SpAYsigE4GGar3s5/KarL1WVnE5OI12Ly1U6xUd9UtS/QdA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW3PR12MB4425.namprd12.prod.outlook.com (2603:10b6:303:5e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 11:38:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 11:38:46 +0000
Message-ID: <d0928396-488d-4862-af32-1eb3e0727970@amd.com>
Date: Tue, 8 Jul 2025 13:38:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: fix MQD debugfs undefined symbol when
 DEBUG_FS=n
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net
References: <20250708101551.68033-1-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250708101551.68033-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR0102CA0069.prod.exchangelabs.com
 (2603:10b6:208:25::46) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW3PR12MB4425:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aae8776-a8ef-44ee-0214-08ddbe13feeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkwwQ2cxSlJoTmtNT0N1ajAyQmRnQytHdEF6ZUgxMTdaNUVnTS9WYmNPUmJ5?=
 =?utf-8?B?RlFZTElSbm93cmVSRFVBY1dka1F2ckZGenhIWTEzbEhKeDZLNEw1eTJSWlRU?=
 =?utf-8?B?clA4VmhHRkRpUEQvSFhxL0svakdDbnR4SlYvZC9vS0cvQmhKS3VmYVdwMlBm?=
 =?utf-8?B?blIwNlJ0ZWFQY2NLTHFvNlEzbmFhTGJmbTZ4SEdmZnJEV2YxajBzMThtNHJq?=
 =?utf-8?B?OWc1K29jcVpyazdiWkJRWUw5dyttM2FFWFdCaWYvbmR6Z1BYT2MwdklXemZk?=
 =?utf-8?B?MjQwRHViNmhUb2Y5N2U5anh4YnZKT2psVjNncitLQnVZSkdRKzZFdmpGQTdE?=
 =?utf-8?B?dUVSOXdJUGozQmtBVnpHaktBTEZNZmVhWUs2Y0UzOFhpUU5iaVZZMDF3NnpR?=
 =?utf-8?B?WDR5MEUzek1JMlRkWWdnY05uSmY0dHNkdW5sSFZOemgxVXVKaVhNVXBDZlVX?=
 =?utf-8?B?OU5uaVp6TU9wUE4xSGM2UGJtODFveVZuVlhLY2p3dTNBK2dOZ2VzQ05jcncz?=
 =?utf-8?B?STJQVEl5WjZOUzdaN2laRzI0TnVzdU1Tb3hUb0VSZE5ya1ovS1pmdzRRWjJD?=
 =?utf-8?B?N09iaVV3Wm1KeHVoa2s5emRtZGltWjMwcmd6L1N5QUliM0N5eGVXTTc2MUpk?=
 =?utf-8?B?WklaaVUrV2p4cERnK3hhdXhWZWVlRVVHRFFXT3VQWWZ2aWI2RGZMRlF0Rlcv?=
 =?utf-8?B?RWJrb1ZzOHhFd0hIYlpkT0FNM2w2cVllUVh4RU9tOXRuRXA5Zk1zS1JPeDNw?=
 =?utf-8?B?VGEvVG0vUkhNVUFLVjFpNWw5bDJ2S3IrMEZPMENtSnJrWWxYY0tuMy9meTZ5?=
 =?utf-8?B?M2VubGZsTlNuQW9qMXRtNlExT0VGY1ZyNHBSZXVzTlVwMktlTm9paWpjbDJr?=
 =?utf-8?B?eWdhTUlhOEFUOFhTbFhWekYyRGdYRkVTY1NhZXpoWS94S2dKU2o1Z2JsMDg2?=
 =?utf-8?B?dmNvZlNxRGc1QURSWS80K0poU0wrUkNrQVI0b0J0bUx5b3YrR0t0VTZKbU5V?=
 =?utf-8?B?aDVLMnZUWWJYeHgwcXFLcXZkczYyMEFXSncrUVJQNjFZcC8yVWxOQUxDOGtn?=
 =?utf-8?B?VmFHMjN6L2RwRG5XVzd0T2JLNG9yaTdvdloxUTJaRUYzYkMyRms4VWpVajhz?=
 =?utf-8?B?c1dZOVZ3YTgxNlpWb1ZoTmh1M3crdTU1WTE3Vk5oQXRaUFhVQ2VNRzYrUXVG?=
 =?utf-8?B?c1dKL0hkZzNZdDFHeWhxenU3dUdqTFcveGJhbzRuNEhpaXd2YzRPLzZCaTFH?=
 =?utf-8?B?WnZsQjIzYWNjVUlucnkyc3VlSk4vdHpZb3hUdkIrY3JuY1dSRGdMak5sS2hO?=
 =?utf-8?B?U2sweTM2MDdvdXJMSzh0TlF4Y0FxQlNZTFV4N3hlUWRXMEYxT1hzR0UrbTBn?=
 =?utf-8?B?Q3hScXp1enJPRWNjSWhMMW1ESWs1c3dGcEtzd2FYVVNieXd2SUcrUWZORWF6?=
 =?utf-8?B?MDZCTDRDU2ZHL1BJR3VXVXJKdEJRbEErdWdOQXYzWUc4WmlpMTBTb010UWln?=
 =?utf-8?B?OFBhUkFjRlhYMjhxRlN3QlJOeG1UM0tVUlFnZkVlQmxSQVF6UEgzdUY4aXVS?=
 =?utf-8?B?SUZSMTRUTVgrcjlEd0pQREpVb1kvbjlzUHl0TGJ0V0YzQUhBb2lxdWRkY3hL?=
 =?utf-8?B?MzFRUFFoQjVtOGVDYkdLMThtcERpYU9DTWpFcmE4a1VmZE9nbklRRjJhdVlB?=
 =?utf-8?B?Mk15eU04NURtUHVxMU0xTk9oQlFGK1NIYUdDRjRMTkF5bUw4VDNFZWdHKzZr?=
 =?utf-8?B?dzN6bkRZZGJVZytDMjNKckt4cjZwUmhqbWw0TG9nTTg4QmUwT3gvSlNaNGlT?=
 =?utf-8?B?Y0hRMC9iRlFVcWlzSlRCTjFaS2FDTit4K2d0R05jb2dRY3JEL0YwdEtwNGVu?=
 =?utf-8?B?WERwWnF2R3MwaGduYXM2WUIwOHFtelROeEFvR1NacjdSSWNsaUEwK2o5T2NV?=
 =?utf-8?Q?y63uWVk+jms=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVI5dVdySTZTUG0zd1Q1emw5RStRZzFwV3F0T2JCT3hCRUE0SFh3UUR5RnBv?=
 =?utf-8?B?TDRHaDdJT0VJR1ZJQysrMXl1Q0c3RFRlTVRydUZ2YmNrblg3cUJEVUs2dy80?=
 =?utf-8?B?c2N2Q3RQSU1pbTd6MDlLRVNqaGo3SWtPWFYzMklWeGlvLzRPYkRRRXNKMWJk?=
 =?utf-8?B?bEIwNTlDL1BZd3Jjc3ErODhka0JmUW5MRmgzR3dVOFkvTW1adFJ4elNkbW9M?=
 =?utf-8?B?aUhrc2ROd3cySGh3NDdtbjRrYi9ScUVhbk5YcmY3eDFyNDlBRUkzTWo1WXpB?=
 =?utf-8?B?dGI5UnI0UDgyWmV3V3ptcDVnRWVyZm1xWHQwQ0JZbDdwd2xkalZoVXczRVlZ?=
 =?utf-8?B?amY2em8xTnRwWjNNSlUvUk9hakRNMlJqeUFDVVlnNlN0TWJtRzNWMXk4c2hh?=
 =?utf-8?B?dkVxREI1TXFaSUFCSXFoS1EvRExKVjRwMGJaTHhlSmttaSswUDNqZU5wZzBr?=
 =?utf-8?B?WEgrNXFPamFLeVhNNmZMWmtXWndjdStaMDZ3L2I0enFSS2h3RGpTeGRjT3ly?=
 =?utf-8?B?VXBDNlI0NGtHbURlSVR2RUl1R1krUnF5Z2pGTzVLSTRXNmZzVVNoUnRDNEJu?=
 =?utf-8?B?R2UwRzVZQ3NZSHNzYkgzSERxVzRJS3lPQ1k0M1lucTBFVEJRYVlURzVEL0dr?=
 =?utf-8?B?WnZxY2VHZ2VscWJGWXNROENjR3JaeWsxNTJDTFF2R3hwZlFBK3ErSFJYajky?=
 =?utf-8?B?dThMT2FFeS9xNVlUUXBwYUxZdmtyeXZqSi84eGdvaThXbHEwM3JKbU1WNUVU?=
 =?utf-8?B?aStrVUU2bUl0UUZ5NGtJSkl4NU1PUXlxSUxKREt5SVJYRE05UWZ5N1h0SVNM?=
 =?utf-8?B?VUxzbnV2elZEWUlJUGVDeDErdnJRMVphcUNXTThZajVyUHVMUUY5dTZ0dzBu?=
 =?utf-8?B?aGlPVGxoR0Z2WFpYaUNsSTgxVHBDdFFUREI0L1pvalBKNmk1ZWpLTHk3OVcv?=
 =?utf-8?B?eERsM1F6MWltMXBqTFI2Uk9mcmhKRzdEM2JDWDBuRCtNd0hlQzJ4cS83Vmlm?=
 =?utf-8?B?NUQ3NU1WMTdEZ1k4SmVpd0VzV01yOFZ2K3AxWWVjbXljRHVJMU1iYzkrTnpq?=
 =?utf-8?B?M05lSkQwZVE2eHMwNFUwQUtKODErYmFDQkphTmsrMkYvd3U5YXpTSG9VUldp?=
 =?utf-8?B?Z05lYlNOZm9Hd2RmQ1ZWQk54a2dxYjN5VS9jZjlLTWU3UmVPeW5ESWxWTnZj?=
 =?utf-8?B?bE1JWHhUdkFjSTNvSXY4OWI3SldyWTRFcndzcDVLSVh3VTJzNVBNREEwNDhz?=
 =?utf-8?B?dWVlQzZxRytTc0JoWU5WWHdWaGFuNlFWVzU2dmhMUDhFcURoTUN2bDZ3dUM0?=
 =?utf-8?B?NlRTQkxGSkxFSlpjdDZESEZDSDNDR0ViVWloMW9WRWxkTCtWNzBnU1E3OTVT?=
 =?utf-8?B?dlVGenZBUjdXdVdxZkNCMGtkb09VcHNtZnlrRCtnK1VSUlExeVdPMjhVeHZw?=
 =?utf-8?B?cnNRVHBLUEJ3T3dyUGZOMm5lTFVRSkRtS1JVTWJPai8rM0xEZDFzYm5yME9w?=
 =?utf-8?B?Ukk1Y0tXUWx6YXJwSzBYeWlZdzNSRVZacEtVMGFlWkJ5eWh4SktJWGMycDhD?=
 =?utf-8?B?a3NBcTgyZmMvNFFSV0hIS2tSVG15bkg0emE5S2s3WEN6TG9EMnZtby81cjVu?=
 =?utf-8?B?M0ExUUs4N21wS2o3OXNJNUR1V1I0VXIyWHRyZi9BLzlPcFp6L3pZU0N2bVAr?=
 =?utf-8?B?dEt6eVVBQ3hRUmUwQnF6aEpnOUt3eXg1THY2cGJnWlBHL3kzb2VFalF6clZV?=
 =?utf-8?B?Vk9mYzV1T0VWS2R5YWJuWjZsUFRWdDhtR3pOQUd0Y3dsNWFXZ2M1VHZQdmds?=
 =?utf-8?B?QS80ZHNnNjVGVlBWUVVhZWVGeXBhSnVuWU11NHM1STVna09jdDFyMkhVRmZn?=
 =?utf-8?B?Z0JycC8wdXhmMlJRODRiREw4aFMzU0ZhaE8yWWFya0trNm53Yzk1ZUpPaGJN?=
 =?utf-8?B?cnY3d0h3NVd1Q1lwRkg4MVJMbERNSGh1UGxhdG9kV2RETERmNDVPSnhxMFJC?=
 =?utf-8?B?R2ZyQTFxQ05ZOVFBb0NCcHFzSnQxY25aR1g5QVUvdXRRcStjNllxa29MRDlZ?=
 =?utf-8?B?S3l4dzZtSUg5b3MzU21jU1RtYTlLRmFHdXlucXdvL3d3K0laR0ZLeXFCWmhH?=
 =?utf-8?Q?Sm8MmLUk7iNkMJhTxdSz/fAru?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aae8776-a8ef-44ee-0214-08ddbe13feeb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 11:38:46.0747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2g4MrbCZRozqg3bj7aSe2lxzjXymw2wPrf8thHN+EgYEmGv8cb9j2LhzXZveGMVu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4425
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



On 08.07.25 12:15, Sunil Khatri wrote:
> Fix undefined reference to amdgpu_mqd_info_fops during
> debugfs_create_file if DEBUG_FS=n
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>

Yeah, that's exactly the reason why I wanted to put this into amdgpu_debugfs.c.

For now Reviewed-by: Christian König <christian.koenig@amd.com>, but we should clean that up at some point.

Going to push the patch to drm-misc-next now.

Regards,
Christian.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> index 115d53bc9a8d..b1b80efc7993 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> @@ -319,8 +319,9 @@ amdgpu_userq_destroy(struct drm_file *filp, int queue_id)
>  	}
>  	amdgpu_bo_unref(&queue->db_obj.obj);
>  
> +#if defined(CONFIG_DEBUG_FS)
>  	debugfs_remove_recursive(queue->debugfs_queue);
> -
> +#endif
>  	r = amdgpu_userq_unmap_helper(uq_mgr, queue);
>  	amdgpu_userq_cleanup(uq_mgr, queue, queue_id);
>  	mutex_unlock(&uq_mgr->userq_mutex);
> @@ -523,9 +524,11 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
>  	if (!queue_name)
>  		return -ENOMEM;
>  
> +#if defined(CONFIG_DEBUG_FS)
>  	/* Queue dentry per client to hold MQD information   */
>  	queue->debugfs_queue = debugfs_create_dir(queue_name, filp->debugfs_client);
>  	debugfs_create_file("mqd_info", 0444, queue->debugfs_queue, queue, &amdgpu_mqd_info_fops);
> +#endif
>  	kfree(queue_name);
>  
>  	args->out.queue_id = qid;

