Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34AAB21EA7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 08:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CB810E5A1;
	Tue, 12 Aug 2025 06:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3P5M7PT7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FC610E5A1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 06:58:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRz5/QkmmpaM97zf2uJYErydRKQMDXFF5Cwv/QAPDPVCtDrDpJklQm6zYodBsq7KGh+2mZ3Zr6r667NLOeYLs9lfF453uht1ILwxVHXqZMRVrPL0Tvmpm9LSK9jlfNXKvkjQR6sG4t/D/aEN2U6jUreJQz/DnMGTx8FGdXwEZ9IIoJ22JyYBcrmEl1TQjtyFJ4cbn9jXwsLVU2GKlGqfn+/mmhG9FVfP2ER/rowKvZ67pbG1McRCgVSnsumfPLj5sm9MbrWTBXVdfj/PPsB/lfQCat6WIGYJ5YUgnF8Rx9O0cFhvjTtf1fkRZVu88iCsjDWOQeUbCgraLzIiOVWxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meAVYfXZ/wxupSeiCZ5xr/OpfNgSLuary9GOCruL0f4=;
 b=Ho1ZDgIzg5IiUa7izXgxha6dQFngRd5+uJAWoLhlW37zbwI2C5k8IP71vM9PLa1P2pX2q4nBEZhbmAUhiup77uiCvYUYI9sNTvdtAn+mUFwPDcVv8J9sIRkva7LYK5xT63nHI2Jifa4btySAVByHkz590uvLSGSHIoUKpL8uadRkBYoIJInvG4Dqgij7C7cv8MFrlz6CCShg05EeHVYnQWm1vqIHwD4WdZStv1VO0F3cT5ThXkNLowDtiOt8LnvgQpdz9YjB/zpAV9/j67z3N9jEQbQYbXt2w/g++HzXo3kigQsT0iYLMF87AfnsfZvoj9rCvmJD6p43rUx5d8RehQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=meAVYfXZ/wxupSeiCZ5xr/OpfNgSLuary9GOCruL0f4=;
 b=3P5M7PT7BaRNoGJVmnEd7QhgQy2QInLyW+i18M+8tt0rcCZce3gjPszYPtHQoXwCS0EpgyPUtrJ5/64rg4lmcD27c/1gTbxVGa1BWjmIHrjIo8RIDAxshhLmjNodUQyJdg7iZc9ncTTPlw4wwfueP+0XBMf3/wsRqexV9sZLDG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8162.namprd12.prod.outlook.com (2603:10b6:806:33a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 06:58:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 06:58:30 +0000
Message-ID: <b1a98f9f-78d4-4dcc-9477-e8529d34dcd7@amd.com>
Date: Tue, 12 Aug 2025 08:58:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: fix task hang from failed job submission
 during process kill
To: "Liu01, Tong (Esther)" <Tong.Liu01@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "phasta@kernel.org" <phasta@kernel.org>, "dakr@kernel.org"
 <dakr@kernel.org>, "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "Ba, Gang" <Gang.Ba@amd.com>,
 "matthew.schwartz@linux.dev" <matthew.schwartz@linux.dev>,
 "cao, lin" <lin.cao@amd.com>
References: <20250811072050.3838241-1-Tong.Liu01@amd.com>
 <b2e02500-0d50-4d84-8ec5-fb8cb753c91a@amd.com>
 <DM4PR12MB613427A4B81ED0A910B530B59028A@DM4PR12MB6134.namprd12.prod.outlook.com>
 <323722ba-257a-4808-b369-5b9e35435fda@amd.com>
 <DM4PR12MB6134C087D13FE3608AC597D5902BA@DM4PR12MB6134.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM4PR12MB6134C087D13FE3608AC597D5902BA@DM4PR12MB6134.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:91::27) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: d2570398-53bb-435b-01d7-08ddd96da56e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFJ1V1FMN3U3Y1g3c2JhSkhwUUVzR0U3dnI5VlJLSks2SG9nQVc1aEdZeTRj?=
 =?utf-8?B?YmY5YjN5a01zTHdneTZQaTVFQWt1STM3WE8yWDlJTkF4T1NLRHhaRlE5THFC?=
 =?utf-8?B?cDFtTDNrZEZOaGFvVXVFZU5WV0VsUEdtQ2RuZ2pDU2VGT2E2UGRsVW93OFFs?=
 =?utf-8?B?VmViSlBsZ2E3RmNMZUFQZUJFMlcrQUZlTDd2a3ZWdDlwUi9jK2ZhS2k2c1Jj?=
 =?utf-8?B?Uk14enhGYk15VlFjbjh5OCs0NEdqVE5Ub3czeW5wRzJQRjQwRjdCcWNKZ2tH?=
 =?utf-8?B?ampKREh4enBFczIrbzBBQzlIUytLN0d4WGIrNXhtSzJ1ditFWk1YYkNnRlZ4?=
 =?utf-8?B?elQ0ZXcrbnE5OEUvTEZpSDlDRFV3azJZVThtSWlDc0tBVUMzRzdVRmIzc1lE?=
 =?utf-8?B?WkFzY3N2cnpMWHR6ZnRZTXd4UDUxcDVXNVJDdXdSY0I3dmhycjBCbjhyN2xE?=
 =?utf-8?B?M0hnM3lpNGt6U2RGdFE0bHgxTHJQaWxDOG5jWkUzZ2Jvb3A3ajZIRUFjb0Z3?=
 =?utf-8?B?bC90VjI3KzJCVnBIaTNhTjlCS1ZHdXR6WUd3U212UnNSaGxORVhTdHFlUFp3?=
 =?utf-8?B?RGJ3SWYrejgxeUhpMmtkVUE3b1BsMHVCa3djSGNBN0VXL0RxZ3Zwb2Z3N3FZ?=
 =?utf-8?B?aDFXL0M3V3lkcVVTWThpajc5d2tqTWhSaW1XZEJ4d3dHTzVURkRsWWVjakJ2?=
 =?utf-8?B?TlJlbUVBYWNPUkpxc1lXU29ZVmp4WUFrcVlCUzRsc3FHYVcwUTB5L0l2T0x1?=
 =?utf-8?B?dVZ6Z0xnWXhPbXA1QmJxYTJPNTlUU1hJL0YwVEV0elZRZkU4ZWxUbXo4TWxs?=
 =?utf-8?B?LzlLMEdVU1JKcUdGNmFyYWlkK3o0b2RHbXpjY0dadlp4Y2ppcDJ1OVA1ZmJt?=
 =?utf-8?B?aWRoUlB1RXZGcm1jV2FOVEFFZEwzMGI0Tm1RTGlWcjlsNXdTRzllUWxZNEIr?=
 =?utf-8?B?NVpOSk9sUzNNTk5EMjJvTGtKa1kyVU50cjIyb1JvM2dqU2tiY0ZQTTFxcmxx?=
 =?utf-8?B?QUtEVGphWW45bkJ3TTF3YmRta09NQWgwY3NmWkUzekM5TGo0RndwTXB0R0hJ?=
 =?utf-8?B?Mm85MFAwTmQwU0Q4QnZ4QlFrbGluaUhnay8wdHlMaW53by9HSE9hSzJSNjlK?=
 =?utf-8?B?a0tHK0N4SmoxUUZxS1Zob05FbmZtWnNNaHFmR3FlNHZKakRLdFoxT1NqNGhm?=
 =?utf-8?B?UVR3SElvY0RGNnFqQTBSZm1BRitPd0k3dU5seHV4UjBQR3EwSGFuV3lRQ25u?=
 =?utf-8?B?Ukp1ZVNxVW9UM1hrTXpuMXY5eW9vSklNY0trc1RhNVpOWlFjRjcvV0Z2RHB6?=
 =?utf-8?B?ZlNKc3VRN1hHUjVYUGY1SldWMGp5TzBHa0pxcGZMSG9LU0JKSFNsck01TllN?=
 =?utf-8?B?Q2dSU0xsb0RXRjhJWWprMW5ONjNWSWhlenRFc3NkVVRxRUpMTnJQbjQ2NXRU?=
 =?utf-8?B?M1FuekxyREtyTzBhWEREWGRzZEdkd1RXeGFDY2RYalZwMVFoeFdPWHRLRU56?=
 =?utf-8?B?RWF1aWNiSWxzdmxhK0hsQk81NXp2REE3Y1dXZFBOdWxJWEpYL04yS2s1ZTNX?=
 =?utf-8?B?VG1YZk4zM1NrUGcxZlpSSkxpZyswc3lLSzYzOG1ZMS9XQ2ZWR1BVbDdoRDJQ?=
 =?utf-8?B?MWppSVY3UlpTYVptQkI5bG5IZGhNQVRZeDl0UVRaOHJsbFpnWTFKdC8rYjRR?=
 =?utf-8?B?dXRnM0pwWjZBc0M2SmZzMlZia2g5bTlHT1BWRFM3K2NNb1VaeVFZeW51Z1Vi?=
 =?utf-8?B?bnFRYTljcGRvU0J1M0FLYytEcExJNmpuL05QdFBHRnJ5TTN3L0I5N0dwK0wr?=
 =?utf-8?B?Q0hlVmlxM3Jud09pYmFWRWQ4TjFCVWdScGZHYUhSTXdBeDBhWk1OYzNMSFJm?=
 =?utf-8?B?TXJ6Q0lBa2lxakEvekNmY1AxOGZ6OCtIdGZaZFc0Vjk1L1Myb1RBcnBxQ2xB?=
 =?utf-8?Q?nQnIBGpbF/Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0ZKeHpac3lKejhjbktoVEpEczZmNWNVNXgyV2grb0tOWjBPV0xFNUhnT09U?=
 =?utf-8?B?b2t6NXlZeTcvNXNyWTE2cThpR2RXK3JxZXZZOUVQZURYZUlwSiszR2VUZGVD?=
 =?utf-8?B?aTFBdGwyK3NYak9QNXFXRStLWXAwdzNUdHJaeXBJcEVTZjRKWjBGNVB6eW8v?=
 =?utf-8?B?S1oveEErcXlmdHRsUjNVcFFYUFdTckFCZHp1V3hFUDZzQS93dFlSaWZTVnFa?=
 =?utf-8?B?UGdIS3JOVmErOEc3WTFiSkFDY1phV2NCNlNZRkIwTysvbmZvZXRvSS84b3h0?=
 =?utf-8?B?bnpvK2h1cUpxcFpLakhJK1k5Szh3U2dodXhEZWdRRXN2YkNESEVId2FSWUZ3?=
 =?utf-8?B?NlphOXlZZDZpelBYSEVxbTI1Umx1ajRTb0J5bmg2YVBhWlNUU3ByUVdGblJn?=
 =?utf-8?B?am1VYkdNd00wSU9CcVRJQWZibTJwVE5WMDlVcDE0eVFPd2hGdnRvZXAwdnZj?=
 =?utf-8?B?UjBXZnRmR3A2WGZDOFduSE9xUGUrNTg4UHVzcm56bFhVRDdsR2pNTVhvUmR3?=
 =?utf-8?B?RFl4bTdXZWd2VHpMeVczTklSM3VyOHh6OHVOWGxvaExadmxvdEhMMlhHd0c1?=
 =?utf-8?B?dkt4alBZWVVCdk14eHE3cTFFdkRPQlI2YktrOFlxdG1FV3VsZ1FPY0VmOUxG?=
 =?utf-8?B?ZFJuMGRHZmhKWjBEV1ZxZUxTcUdDNDRhVUUzamJOd3ErMUhnSzBBK2pDZGh6?=
 =?utf-8?B?TXFHait6KzE3L1c1MC81RlZVNTkxN3V3VHNZeHkzQ1dVVW9XenQ1TWVaRDlt?=
 =?utf-8?B?NjZDWmI2OXdtUC9ueTRNb2h6d1l1NGRWdExVNWFKc2QyS3dKMnlyYnBWMmFk?=
 =?utf-8?B?ZHNybm5sbFhQSWlqU3B1SWlWUWN5SjVHVGlMZWs1b0tDbUVNT2pxeGo1Kzlo?=
 =?utf-8?B?RmxDNnlEbVRmZmZ3WUVFQnlIazdHWWJaMFBHY0FnK3dYb2RMbnNOTkRkSS9L?=
 =?utf-8?B?MkNQdVI3WnhBY2V3bnA2aW5qNS9RYWdMbGVTRkZUemhtTEpBSEZSUlhDdGgw?=
 =?utf-8?B?OFh3L1lTd0lPTGRhTGFPVHcyc2x3emVCUk5ZdXRmYldlVm1GUUw0VTJsZDZh?=
 =?utf-8?B?MXUrT1N2bzFycGhKWnd0Z1R1TlNlWm42VVNEQkpucVVFdkJlTndIdVpoNHlz?=
 =?utf-8?B?OFpsYkxWbVpHOTV5S2VtWHU0c3hPc1NoclhGcUVldmIydnd1aHVvOC9rZGYz?=
 =?utf-8?B?K2Y5RmxNZE9UK3lwSER2U3ZmblJzQ2ttTUR5ZG1VRmpiZWlXNzFYNWV4Q0Vr?=
 =?utf-8?B?aWRjbWtHYU5WZFArQjVFYWtpbUpzWTMvK21KWVU1Y2szdzhHbmRDay9iZWd5?=
 =?utf-8?B?TVN0U1o4YjdaMDh6WHpycTh4eTRkK1BMUjEvOS80ODJRSTAwb1dTdG4xZjl1?=
 =?utf-8?B?RVN3cjYvZ0thOGlUY2M1dGQvZDdTQXp3aWhmWXMyVGpWclpWblBJZk43RUtZ?=
 =?utf-8?B?QS81eWgzdGJ0MnJtd2R5Q2twc2IvclR0U3JsQzlSZndyRm5YOGd1SjdLdVZa?=
 =?utf-8?B?TlAxeVVhSjI5R0plVzlUMnFVVE5GUWVmemJWcEhMQU0vRjNvNUxLNlhGVDkw?=
 =?utf-8?B?TGhzTG4zdkNIUkcvN3JZWUN6aCtlSGtBYTRGZGdKTnNQKzFrZXlkRmJXWlhu?=
 =?utf-8?B?WjZJZ24rZmRwdW5uOHVwT29GV3hTVGJkakJnWGJZY2JBTEpSazIyNldhZFZ6?=
 =?utf-8?B?ckNDT1VRK3BwV2c1QWg1emtTd0JWMkJaTmlFZGQ1QisxdjZ4VDhhWXIzMVhQ?=
 =?utf-8?B?T01rMmYvSjdadWhuSUY5aTZOMGJHOFdieFg3cnRPZHBmbGR1N2pIMVpVV25h?=
 =?utf-8?B?M0hWaHdsTGF4Ykw0cjdrR2pFNEZqVDR6RUI0YnRScFozQjFoUWtiaDY2MFpu?=
 =?utf-8?B?c29sSHZMVk9tME9KZ3FOOWF3dE5IVzRCTkd1VkIwcVBuOXFyZlZ5UFBJREky?=
 =?utf-8?B?WVptL0ZjOE5xSTZNRDZ5VDJhRjhzcVN1YUVsZUNjNWhoOFJjYTFwcDZzdkt2?=
 =?utf-8?B?RzdlMGVDcWxWQ3J2TFlUZFM5Q3hDS1dpazBFQWRqVGJBc1F5aExTcUt3WWhY?=
 =?utf-8?B?ZTNEckhxQkVtcmMvNHpDNTVxeVJqeGNYTVB5RlAzTjlNK3JLTFl1YlR2TGlm?=
 =?utf-8?Q?ISbSmnlLEFuvTuEl6b8mXcg4b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2570398-53bb-435b-01d7-08ddd96da56e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 06:58:30.7888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/Oh14LO0NodIaGF3jP8ytz1iJpDxbtibbTvvRZkS/wuVy2Zum1wZSbknkSXgOLV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8162
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

On 12.08.25 08:37, Liu01, Tong (Esther) wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Christian,
> 
> If a job is submitted into a stopped entity, in addition to an error log, it will also cause task to hang and timeout

Oh that's really ugly and needs to get fixed.

>, and subsequently generate a call trace since the fence of the submitted job is not signaled. Moreover, the refcnt of amdgpu will not decrease because process killing fails, resulting in the inability to unload amdgpu.
> 
> [Tue Aug  5 11:05:20 2025] [drm:amddrm_sched_entity_push_job [amd_sched]] *ERROR* Trying to push to a killed entity
> [Tue Aug  5 11:07:43 2025] INFO: task kworker/u17:0:117 blocked for more than 122 seconds.
> [Tue Aug  5 11:07:43 2025]       Tainted: G           OE      6.8.0-45-generic #45-Ubuntu
> [Tue Aug  5 11:07:43 2025] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [Tue Aug  5 11:07:43 2025] task:kworker/u17:0   state:D stack:0     pid:117   tgid:117   ppid:2      flags:0x00004000
> [Tue Aug  5 11:07:43 2025] Workqueue: ttm ttm_bo_delayed_delete [amdttm]
> [Tue Aug  5 11:07:43 2025] Call Trace:
> [Tue Aug  5 11:07:43 2025]  <TASK>
> [Tue Aug  5 11:07:43 2025]  __schedule+0x27c/0x6b0
> [Tue Aug  5 11:07:43 2025]  schedule+0x33/0x110
> [Tue Aug  5 11:07:43 2025]  schedule_timeout+0x157/0x170
> [Tue Aug  5 11:07:43 2025]  dma_fence_default_wait+0x1e1/0x220
> [Tue Aug  5 11:07:43 2025]  ? __pfx_dma_fence_default_wait_cb+0x10/0x10
> [Tue Aug  5 11:07:43 2025]  dma_fence_wait_timeout+0x116/0x140
> [Tue Aug  5 11:07:43 2025]  amddma_resv_wait_timeout+0x7f/0xf0 [amdkcl]
> [Tue Aug  5 11:07:43 2025]  ttm_bo_delayed_delete+0x2a/0xc0 [amdttm]
> [Tue Aug  5 11:07:43 2025]  process_one_work+0x16f/0x350
> [Tue Aug  5 11:07:43 2025]  worker_thread+0x306/0x440
> [Tue Aug  5 11:07:43 2025]  ? __pfx_worker_thread+0x10/0x10
> [Tue Aug  5 11:07:43 2025]  kthread+0xf2/0x120
> [Tue Aug  5 11:07:43 2025]  ? __pfx_kthread+0x10/0x10
> [Tue Aug  5 11:07:43 2025]  ret_from_fork+0x47/0x70
> [Tue Aug  5 11:07:43 2025]  ? __pfx_kthread+0x10/0x10
> [Tue Aug  5 11:07:43 2025]  ret_from_fork_asm+0x1b/0x30
> [Tue Aug  5 11:07:43 2025]  </TASK>
> 
> Checking vm entity stopped or not in amdgpu_vm_ready() can avoid to submit job to stopped entity. But as I understand it there still has risk of memory leaks and resource leaks since amdgpu_vm_clear_freed() is skipped during killing process. In amdgpu_vm_clear_freed() , it will update page table to remove mappings and free the mapping structures. If this clean up is skipped, the page table entries remain in VRAM pointing to freed buffer object and mapping structures are allocated but not freed. Please correct me if I have any misunderstanding.

No your understanding is correct, but that page tables are not cleared is completely harmless.

The application is killed and can't submit anything any more. We should just make sure that we check amdgpu_vm_ready() in the submit path as well.

Regards,
Christian.

> 
> Kind regards,
> Esther
> 
> -----Original Message-----
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: Monday, August 11, 2025 8:17 PM
> To: Liu01, Tong (Esther) <Tong.Liu01@amd.com>; dri-devel@lists.freedesktop.org
> Cc: phasta@kernel.org; dakr@kernel.org; matthew.brost@intel.com; Ba, Gang <Gang.Ba@amd.com>; matthew.schwartz@linux.dev; cao, lin <lin.cao@amd.com>
> Subject: Re: [PATCH] drm/amdgpu: fix task hang from failed job submission during process kill
> 
> Hi Esther,
> 
> but that is harmless and potentially only gives a warning in the system log.
> 
> You could adjust amdgpu_vm_ready() if necessary.
> 
> Regards,
> Christian.
> 
> On 11.08.25 11:05, Liu01, Tong (Esther) wrote:
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>> Hi Christian,
>>
>> The real issue is a race condition during process exit after patch https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1f02f2044bda1db1fd995bc35961ab075fa7b5a2. This patch changed amdgpu_vm_wait_idle to use drm_sched_entity_flush instead of dma_resv_wait_timeout. Here is what happens:
>>
>> do_exit
>>     |
>>     exit_files(tsk) ... amdgpu_flush ... amdgpu_vm_wait_idle ... drm_sched_entity_flush (kills entity)
>>     ...
>>     exit_task_work(tsk) ...amdgpu_gem_object_close  ...
>> amdgpu_vm_clear_freed (tries to submit to killed entity)
>>
>> The entity gets killed in amdgpu_vm_wait_idle(), but amdgpu_vm_clear_freed() called by exit_task_work() still tries to submit jobs.
>>
>> Kind regards,
>> Esther
>>
>> -----Original Message-----
>> From: Koenig, Christian <Christian.Koenig@amd.com>
>> Sent: Monday, August 11, 2025 4:25 PM
>> To: Liu01, Tong (Esther) <Tong.Liu01@amd.com>;
>> dri-devel@lists.freedesktop.org
>> Cc: phasta@kernel.org; dakr@kernel.org; matthew.brost@intel.com; Ba,
>> Gang <Gang.Ba@amd.com>; matthew.schwartz@linux.dev; cao, lin
>> <lin.cao@amd.com>; cao, lin <lin.cao@amd.com>
>> Subject: Re: [PATCH] drm/amdgpu: fix task hang from failed job
>> submission during process kill
>>
>> On 11.08.25 09:20, Liu01 Tong wrote:
>>> During process kill, drm_sched_entity_flush() will kill the vm
>>> entities. The following job submissions of this process will fail
>>
>> Well when the process is killed how can it still make job submissions?
>>
>> Regards,
>> Christian.
>>
>>> , and
>>> the resources of these jobs have not been released, nor have the
>>> fences  been signalled, causing tasks to hang.
>>>
>>> Fix by not doing job init when the entity is stopped. And when the
>>> job is already submitted, free the job resource if the entity is stopped.
>>>
>>> Signed-off-by: Liu01 Tong <Tong.Liu01@amd.com>
>>> Signed-off-by: Lin.Cao <lincao12@amd.com>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_entity.c | 13 +++++++------
>>>  drivers/gpu/drm/scheduler/sched_main.c   |  5 +++++
>>>  2 files changed, 12 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index ac678de7fe5e..1e744b2eb2db 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -570,6 +570,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>       bool first;
>>>       ktime_t submit_ts;
>>>
>>> +     if (entity->stopped) {
>>> +             DRM_ERROR("Trying to push job to a killed entity\n");
>>> +             INIT_WORK(&sched_job->work, drm_sched_entity_kill_jobs_work);
>>> +             schedule_work(&sched_job->work);
>>> +             return;
>>> +     }
>>> +
>>>       trace_drm_sched_job(sched_job, entity);
>>>       atomic_inc(entity->rq->sched->score);
>>>       WRITE_ONCE(entity->last_user, current->group_leader); @@
>>> -589,12
>>> +596,6 @@ void drm_sched_entity_push_job(struct drm_sched_job
>>> *sched_job)
>>>
>>>               /* Add the entity to the run queue */
>>>               spin_lock(&entity->lock);
>>> -             if (entity->stopped) {
>>> -                     spin_unlock(&entity->lock);
>>> -
>>> -                     DRM_ERROR("Trying to push to a killed entity\n");
>>> -                     return;
>>> -             }
>>>
>>>               rq = entity->rq;
>>>               sched = rq->sched;
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index bfea608a7106..c15b17d9ffe3 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -795,6 +795,11 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>               return -ENOENT;
>>>       }
>>>
>>> +     if (unlikely(entity->stopped)) {
>>> +             pr_err("*ERROR* %s: entity is stopped!\n", __func__);
>>> +             return -EINVAL;
>>> +     }
>>> +
>>>       if (unlikely(!credits)) {
>>>               pr_err("*ERROR* %s: credits cannot be 0!\n", __func__);
>>>               return -EINVAL;
>>
> 

