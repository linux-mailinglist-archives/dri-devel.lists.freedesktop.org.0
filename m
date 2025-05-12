Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4536BAB3B63
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 16:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0683910E1AC;
	Mon, 12 May 2025 14:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="D/8XI2Rq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BAE10E0FE;
 Mon, 12 May 2025 14:53:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhkxzRM24poReZCAoFSMMUnzH69mCh9kP7MOQhaBLJAA0r0wInq1mwZWIDQCWM0wOEtUDvgvgg2VomaIsUrHLNG0nIo8V1+eUcV4Fioyy56mtS02r3o4rjQnbDvTOjXtBK3iogcAkT/yv0TH7ekfp/irOZyWgaGDAEgrSWcIiJd7vwJsOzhls5usUtzmVuwIUfTFW1m715L+O2OVBkra9q3hjCAoiqbmmDh4HWqqfrQ/3CKYb0OhfexYDEA201BFeLx6y2m5ghg746jSywIohnfECQ0517omhxPyn9BmM5718H7ZUg+5ktqFvly+Vbe0Bb60vxJ/Y7pDUHyXmITlaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wKfC+0pv8WWe+zOUGR2TyO2tjuYPy9DBSYXtPrGzQg=;
 b=Hqsi41W11rvEMq+tFMYzz0Rh/gzhWdOQkJqDlVs8iS4rU86767ylmHDu+aUa0CK2L5VO0qji9MflLVCYWnQDrns4IhBrRrjxw7kdjvC90q4MOEwP5yKl9YAtpErP3tvETRTQ04pqiChcDOkOTorKYzJiAxT/gPfnxsWs9GsCzqQGT2SBGq+DPVp5oMWx1MbqJz856IEKZFg2F3a4rS59ZYAlhgkKpp6rJ7JpdsFx8Thw9mLbEJIWcNGH2rVTArsRftI5G9P2uCtKv9zKeasMEsOD3mq72xJ9ORRTjz8gq96qA0oSZoMvGpU7oggNF+XfGslKaGwlRjtQpVUfZDl/PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wKfC+0pv8WWe+zOUGR2TyO2tjuYPy9DBSYXtPrGzQg=;
 b=D/8XI2RqBNg9Yb5S0OtFEpaPy2pfdrg8VUXSkKxCCnNJCNF4pwXHNFa+EWZCi2p2HseLupe8rqttiDqiqBgw6MZteFIM1dCCBC5rHQ/YKKWXWXXI5rVJAo7EAuk1A9UfsDy+DIcLNOxkoAX6Du3a8RpcDDP0plMhX9YQ1KLC+wk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7175.namprd12.prod.outlook.com (2603:10b6:806:2b2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 14:53:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 14:53:46 +0000
Message-ID: <2c3c957f-8353-4bcc-bc30-b92a1db1acfb@amd.com>
Date: Mon, 12 May 2025 16:53:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm: Create an app info option for wedge events
To: Krzysztof Karas <krzysztof.karas@intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, siqueira@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20250511224745.834446-1-andrealmeid@igalia.com>
 <20250511224745.834446-2-andrealmeid@igalia.com>
 <x3ep3offdy5on6hckumvpsvnlfnmjdfqjlcyv7hojitzsn5u3k@opnou6grp7ad>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <x3ep3offdy5on6hckumvpsvnlfnmjdfqjlcyv7hojitzsn5u3k@opnou6grp7ad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR06CA0030.namprd06.prod.outlook.com
 (2603:10b6:208:23d::35) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 929a373d-75a3-4d77-4fc5-08dd9164cc28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEM5Q2VzNDFpWCtpaVpkbElLQ2xXVkxkZlNjS3dpeHloRER3T1pNVDIzcmFE?=
 =?utf-8?B?Qno2R1BZMXA1cVpxOS9sUUQ4U1RyM3hINVUvOVowV05udzZIamU0LytHanB5?=
 =?utf-8?B?YU9OR0NvdDZOOHFhT1Bzd0JzKzBLNmVXb2ltTUtiUWhCUzdJVkFNL0lEZmdI?=
 =?utf-8?B?TE1DaTBBNHVuV091cGhmbkFtWjUxc1ZDSUQvZ3BZK044OUJCLzRkRUJQYnFY?=
 =?utf-8?B?WXJKSWVCRVB0azJqY05VTmw5bHIzTnk5R2FrVjZpYXdoK1kxdlNxanFxTEQ1?=
 =?utf-8?B?Q0N4Vm02RHJtTlF3M3VieDlEcVVJTUIwY2dxSS9pR0ZFTnJVMlJrRzIveDNJ?=
 =?utf-8?B?d3FORDM3T0svcGRubFZPa0k5M1Q0a2JOaTBJczRhankzWi85THdsR3FBVkVu?=
 =?utf-8?B?dWpaRlNjQWRPOWZ4cDRzeG1aWlZzaVNrM2hrNDFNZWdlV3FvQVRLN3RBazJF?=
 =?utf-8?B?UEltQmlDamh4N2I4T2Z6b3lVKzFsZ3owQkV5SVAyckxKVFk4RkhVWmkzQlhD?=
 =?utf-8?B?NTI2OHRHSjBIL01ycWdGQW1tSHZCYTRMdC9xTDZYK0lyVEtGNXB3cjRMb0xW?=
 =?utf-8?B?eEplaEdqaFFaemEvVGZleUgxSlkwV2VzejRpdmc2WmpHMGVQYUVzWVUzYXg1?=
 =?utf-8?B?TDJ3M3hDL2JZMGg2NFRMdWVXaklPRFpPbU9PYTZBSEFPeHVRai9zZ1BsY3d1?=
 =?utf-8?B?T09HQTcvRTFTYUExTWlSbHhtSkM0dHZmZTN3OFJ4VCtaMGpPaXJwcktGcnF2?=
 =?utf-8?B?akVmSU1jbG1nUUlmVWs1SEZBSjQ2bkVjcnBLSzlxN0FKVHFJRWJ4SERyOEdu?=
 =?utf-8?B?UlV6WUEzeE42eDlwNHZ2RjNpL1c0TFlBYms1WXJ4UGhGWGdDNnU1UW84aEdP?=
 =?utf-8?B?amlxOElpVmVKeGVMOUdYMkJucmVDcEljaUxSV1F4cE5nUnFJd0tZOW9hWUhR?=
 =?utf-8?B?clduWHBWY3U5V0IwZUVGWVcrcFhRdk9LbXkyR2xnUEd3Nk00bWpaNnlCMnRR?=
 =?utf-8?B?ZXcwUnJLamdtQVk3dndvaUFCVGpSVVJ4NVpXbVRHZUJobkE0bWUxdnU4OUVV?=
 =?utf-8?B?SzREVlNzOWJDY3NUMERtdERzRjN0b3I2cjRkbW10eDQ4eFROUG01V050VTN2?=
 =?utf-8?B?ZWRjTlRhZytJTHZ0a3JJekc1VE81eUc5bHVPTjN1ckVRZjdjWnZyNFN6T2Jv?=
 =?utf-8?B?N1JiOW51L0RWcmhRTWZmWDA5Z0dRRlEySEJ3OWhRMUs0Y3hPSmtabDRHcFJn?=
 =?utf-8?B?L2NVZ2lkRkdYSXdZTDFneGJ2eGd5ajJNYk02cFNwbVVNNmFVYmM1NHhpTFhG?=
 =?utf-8?B?Q2VNcUdUNUdZWFk4anNWejdWditnYzZVUk1rRy9MM1RvNjUrZzVJQnhEUVYz?=
 =?utf-8?B?WUpYdjlyUlR1cURaRnp0TFZocU9KN0M2OCt0SmYvVEpkOHE4TURFdnV0bCtO?=
 =?utf-8?B?VUxrTldQaTQwSlluTWJZY2piMnNsR2xLRnNvSFU4Qnp2d3JVNHBDcnR6RWVt?=
 =?utf-8?B?aWw3WG1zWWhkeGtlSTlOUWlWWGNxbkkrZ3ZpSmZVRlZ0bVZ3RWFOVlJYMnBq?=
 =?utf-8?B?MnpaTThuMmZnVGRSSHNoZnpvbXV1aUhDbktVekEwN3BzcHMzSkxPRDR4RkRK?=
 =?utf-8?B?bExKRCsvM3diVTNiZHJvMWQxNWZ4aitmMlh0aDF0SVJ0WDRkTVNYa282UDFT?=
 =?utf-8?B?WmwwV21mRGFpWFNvcStQS3YxOTRsMUNHaTNaNVJ6cjY2c0kyNWpsYjNoUzRF?=
 =?utf-8?B?RFczb1FYcDBWaVpJUmVqYVVpRExHVktOc284eEFIaXAxdkVlQ2tBVWtWZEhv?=
 =?utf-8?B?T0c4TUpkcHpUa0hJTm4xejJQdmJVNlVRZnR3ejUzclNSR0lvaUZXeUNESVRX?=
 =?utf-8?B?L2FHb3l5UWd5QzdpMVc1SWZPNGtoRjc1YW1IRVFWRU95Nmh4MmNWUDQ1bzlw?=
 =?utf-8?Q?AsCL4juSWY0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzJjaWZFZXE5eVJaaGovMG9FQW93UGNtV3pGK3NmbWdyNmh5UEJiNGJ2aWRK?=
 =?utf-8?B?M3FWaFk4K3IrUzc3bU45TjVCOU0yV1o4MGxCVUN4alMwdjcxaUovRkYyODd0?=
 =?utf-8?B?VVcxT0YrdWoxUUpkZXVOQy95N3J3bW02Vkw3OTh3MGswN2RmY1E1bnBuVktz?=
 =?utf-8?B?M3lUM1FyRE50UGw1VTBQTlZ1VzBsVFVmODYyV3ROT0RQUTRaU0FrS1M1a3Zh?=
 =?utf-8?B?R1JwTnRSTWVrWHZMZHlJdDZmekFLU21rODJmT05aSzB5VmdiQ0ZhR2syYnh2?=
 =?utf-8?B?U0FwZmZaOGtWY2JuMmVrTWRQbnhDcTI3RVkzajA0dVhiOVhNdUxkelRpS0Fs?=
 =?utf-8?B?MzZrR21lcXF0cmpxeVpxQmt3SHlWMmh6cU1naVlYTEg3WVg2OGp2NHNMbGNr?=
 =?utf-8?B?S3hBbXBCM2l3Tk1uVkcxNkNXRWpwZnpqRlVvd3pWOS9YcWZjc243aHNVY2Nu?=
 =?utf-8?B?MzgrN3MzRXZmMVRUbXhpRlRHTjdyNHZQVzdqRmFFQjlIT1g3TmErbFNueGEw?=
 =?utf-8?B?a0VnWG1teUhlUTF5WWs4NHZiaU8vZW52ZmdrWFFHMFVjV2xWT3hoMldDRnMz?=
 =?utf-8?B?NlhCMzVNVEltR2d6aWNSMUlhMSswODRkUW1qSHBXTUJqODJyVG5NRE82ZVVL?=
 =?utf-8?B?TFNQVnBBazNaMWYrbmc5a2JtMEs1a25Ja05uYVcwc1ZnVS82UGdTMFd6Nmp0?=
 =?utf-8?B?VEYyN3NkN3ppODRvSUl2aWEzTGhscU1XSWlKeEJ1bW9IZW1ERDFKeC85LzhE?=
 =?utf-8?B?YnJXUEM3cWF4RmJkWVhGcFJCeUFuMHBtYnNZekk1Mk1Ed0VLMEgxdmVFREo0?=
 =?utf-8?B?ZmFSeXdYWWptVjJLK2JBNmVBZUlSb1Q3ZDVKM1dRcXRkU2ZWaC9zcWZJTnJ5?=
 =?utf-8?B?cXowNzI5VExrVUoyVDR1S2xZaFJhQ3BTNjlneS8rTFp6clA3MmpMTmdubXdM?=
 =?utf-8?B?OTJrN3dTRTFCWlJQSXdwSFIyZ3VwQk92OGIyTHNHZlhWYnB5UG9RMFBFZnl1?=
 =?utf-8?B?Q09aQ1V0L3BVN05jUmNPTE0wcjVWUVI4MTFMczR6TTczNzhmN3pvckdEMFkr?=
 =?utf-8?B?K3lRWURJR3JucEY1VmcybE1XTldBVHNXeVUxeFpVOEZSaExXckJqY0xqSUI2?=
 =?utf-8?B?djdnMU1ia2xVNVJnUCtEdmVlMDF2TW41THkzZ3JwL1FsS29wc3JEWnBKbXhr?=
 =?utf-8?B?YmJZOUVucURjUStNbDMxdEhkZmtVaDhGSWhvL0FwREJpeVV3ZHA5elZyMC9z?=
 =?utf-8?B?M2ZVTE9PRjNtNlNPVVdYbEdtUXZmczZUWkdFaWhkcUFzeFpER08yc090Wnlh?=
 =?utf-8?B?Q0syZG9IMmdCOHVWNFJmNFhIL1haWFhVaUVBVEhHRzRHdkNjYzlPajFKY0tp?=
 =?utf-8?B?cjhrTzlLV0w2cXN0Sm5hVHR0Z0ZMTWNkbnpIL0NUVm44b1JlSStpU0VLV1ls?=
 =?utf-8?B?am5uSWQwSWdsUFo3VXdxcStOdyttWEF2dmlZakRRSWtHMFJnd0hodW1xbk95?=
 =?utf-8?B?enc2MVBxMzFJdDJOK09OUGZyek1DQm1wckUxK3hTZUlZMVd4cUYrdVNRNnE1?=
 =?utf-8?B?bVJKbHpKS2JhUmdjRW05MVRhOVJzOGllQk8vOWdxMDNUY2dRcno2Mm5mcXda?=
 =?utf-8?B?Zm40QmFpb3pXc2d6alVNdUw3aDhDUE95Q1E1Ni9rUjJFQ09tWENOTnYrRXFO?=
 =?utf-8?B?RlVkZFlMMDhDcWNieHFqUHVITUk1a0M4WkExZDhuT2VJREhYRWY5Z1dYdDhs?=
 =?utf-8?B?MHJPL3pqVFFWYjRoQ1hqM1EwTWJsZ3pySlQ3eGtTOGswQWdzd3BZWi94OHF0?=
 =?utf-8?B?MXFHamZ2WFMycW0yVjJNVnE5N2pONzFMcTNjVFl5U2ZHby9yS25aWldUd1F1?=
 =?utf-8?B?MDlWK1pkSWVGQWJ5Q1dLbUI0cEJqaUs1dFdnMjNBK0J5cW1kN05oN0R0VFdL?=
 =?utf-8?B?dGxvcVByeHBNSDNPME9QV1BWbmhBTXBLRWlZbDR4Q3BCWHpDb0d2eDZBeUMz?=
 =?utf-8?B?SnIwYTRQS285MG0xNHZYNkx2bEcyL3ZKVlUveVo1TUF6T04xanlMcDBVVHcr?=
 =?utf-8?B?NSs1S3VpR3g5WksrTUQxKzJWSFM5UXlzdFNOelk0Mzd2K1hMUlFGUXIyL0hu?=
 =?utf-8?Q?p4+Ah5Gfz3LJe1p130ef+8GO+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929a373d-75a3-4d77-4fc5-08dd9164cc28
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 14:53:46.5805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7Xtn12VBMtbjyGlFVzFk28lK2s3QMoRHtzbHC3HOV3JvnulTkL7eI+RaaOoi0IB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7175
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



On 5/12/25 08:08, Krzysztof Karas wrote:
> Hi André,
> 
> [...]
> 
>> @@ -582,6 +584,14 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>>  	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
>>  		 "but recovered through reset" : "needs recovery");
>>  
>> +	if (info) {
>> +		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
>> +		snprintf(comm_string, sizeof(comm_string), "APP=%s", info->comm);
>> +	} else {
>> +		snprintf(pid_string, sizeof(pid_string), "%s", "PID=-1");
>> +		snprintf(comm_string, sizeof(comm_string), "%s", "APP=none");
> 
> I think using PID=-1 and APP=none might be misleading, because
> something did cause the wedge if we landed here.

Yeah, that certainly won't fly. 1 is a perfectly valid pid.

I would just set pid_string and comm_string to empty if info isn't available.

Regards,
Christian.


 You could use
> "PID=unknown" and "APP=unknown" or ensure these arrays are
> zeroed and fill them only if "info" is available:
> 
> -     char *envp[] = { event_string, NULL };
> +     char pid_string[15] = {}, comm_string[TASK_COMM_LEN] = {};
> +     char *envp[] = { event_string, pid_string, comm_string, NULL };
> 
> [...]
> 
> +     if (info) {
> +             snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
> +             snprintf(comm_string, sizeof(comm_string), "APP=%s", info->comm);
> +     }
> 
> Then, when printing the logs later you could check if they have
> a value and only use them if they do (or handle that however
> you would see fit :) ).
> 
> Best Regards,
> Krzysztof

