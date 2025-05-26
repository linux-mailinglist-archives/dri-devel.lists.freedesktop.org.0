Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CB2AC3A75
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 09:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA3910E11D;
	Mon, 26 May 2025 07:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ky5nhlmh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBB110E278
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 07:19:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6EdXznEUMggS0q2fowvJ5CIp5qxj//9FN14ct3t2KAwaPBu8FxJnde7AAD0gAPQryrBYjYyLhVxktpQi9NBmoAeLeVnNePHLVlHe9UX3/WSmu9osL5ug/pc5cgXHQ8CsHaagfjkX7kMefNhu7qG8HxWcOP9y4muzR4hwUSurazwQNc/quZcBdFWOfImMvSWFYQime03lzVxCphLbGe+ccVYx8jQwAH/6lOMBQOAcdD4UDNWoWV0cIoV+xbrTifHeoo+cX652jH8s4266gVcq0pD1yXxP1KHK1aUHzFL/Q/UZ8H/XFDWQOMaL9iqOJVmqEnGcMDz/UDNA5X8i42smw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhaddvfsM4HixVuHMuEybmJtu9/lVCcRrjCgpzziCh8=;
 b=h6YpnEfbNC1oRYrILDhJwswV0u17Ow8bo2O17hhvGFB9RIaaNtMe6ccjnFuhkWnWHT9DGOd9alD47qqlpkIs56qEHwmEtryAWGG0+yi9jgk8vLdjZtVZzcitZKlxeO14b0yCRabqNVnuI2zYymqMEHJAiizN2fX7oPTH6J0FnPlmGFNlliWMHFFyppd+fqmMPXeJQMuLuLctIuSCEyn/UjIFpmiixklLhBtrhb+3i/rCGzPRUC9Gf1HzFkjs1+aGIZ8RWGpziJe5QlbyhNFJqxp5IlmiRo+Y9PNDZJcyd3dkHdJTT2nYdEF1KHTSmFxJtIVxldUiACFPklREuK3UuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhaddvfsM4HixVuHMuEybmJtu9/lVCcRrjCgpzziCh8=;
 b=ky5nhlmhR41OTOXG6EZAs0TE25sHyhiecmsmzKluP1+bwk/iwfrZicYRAFNEZHXlQKv3lc6mTlz8aEHFDp1Mss22pWk2MnzimiymTIIkq79oONpnyEPN8sYPgTb4UtKfMghodAXNJpJBtVq3bhdeYp5TKESb5J8t96Ip7AZbyWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by CH3PR12MB9169.namprd12.prod.outlook.com (2603:10b6:610:1a0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 07:18:56 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f%5]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 07:18:56 +0000
Message-ID: <ae16db07-5fca-4369-aa67-cbe2e0fd60fd@amd.com>
Date: Mon, 26 May 2025 17:18:48 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050> <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com> <aCRAHRCKP1s0Oi0c@yilunxu-OptiPlex-7050>
 <20250514163339.GD382960@nvidia.com> <aCYQdDrYYZRAgsen@yilunxu-OptiPlex-7050>
 <9dea400f-a57b-43be-a2e4-24a9f51e6ba0@amd.com>
 <aDE5SPzOAU0sNIt+@yilunxu-OptiPlex-7050>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <aDE5SPzOAU0sNIt+@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY6PR01CA0021.ausprd01.prod.outlook.com
 (2603:10c6:10:eb::8) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|CH3PR12MB9169:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d15fc76-9f25-4551-da12-08dd9c2593af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STlZL3pzT2pWZ1ZpTGY1WWdnOXVXQzJRVUJ3Mm0rVDJiTzErVmo3NGYzZVdI?=
 =?utf-8?B?TjVhazdwTHE4aE1aNXNYdDdCdlB4czhQc0NhYTIzM1U4dzliNVBMKzJsbmNu?=
 =?utf-8?B?bDBaQjhLQWVDTnI5RW5nMytibHhMbTBVdzcyUUhLa2E1ZS96Rk00MVJ2SFJR?=
 =?utf-8?B?SEZEN2k5KzZ6K1d2TFBWY0g1WVZkeDBRVXRCS25UMW1mY2xLRVRWQ2NqbEdP?=
 =?utf-8?B?VExDMkVSK09LY2VBYUJJZTFKbldsOHhVdFNwczlUV3ZiVTJrZWRpR21BQkQw?=
 =?utf-8?B?V3QrcGhZbGcyTjVyTVFYOVZ3UlFvekEvalpLK1I5NkRpaWo5MWN0L052QnI3?=
 =?utf-8?B?K3dPU3BGSEZ6RytqRnZuSUlIWkl1TWN1eFVGc3JNcThuWmtQVGd2cit1cmxu?=
 =?utf-8?B?aC9iVFVmdkxDM0VXZXQzS3ZFcCt2anZFcHdKeG9kZFEvTmwzclVIWGdNaGRE?=
 =?utf-8?B?OGYxNjdGSGNsMEljVTNpMGRqclFCNTJ4dEh4aWc3dW1aNVpVcnp0TloxbWcy?=
 =?utf-8?B?RGpaOEJidGRRams3VHZFTyt6eXUyMjhrajJDMUJxSENGbkREYnBUVUZNRDhq?=
 =?utf-8?B?djlkdGlyVWRsRjJ5VERXZEZPUmNyVHYxWlYwZDZsVjZXUkxjNVFMdmhYc2hC?=
 =?utf-8?B?MlFNMGNZOEFFMlQ3bEp6eTVhNzJobmI0dmd1WFhXbWtEU0ZPb0s0UytCWWo3?=
 =?utf-8?B?TklnU0VZcXlmL1NiY3lJL05FY3Z3alh0OTNGQkEzdWV1UXQ2TzV4S3o3NXRr?=
 =?utf-8?B?Q3lvZUpyQXNNTjNYSlhpaUpiSWZJYnNLS292dVhzVjhGK0YyVE1PRkR6cU5w?=
 =?utf-8?B?UWt0T2pTMExweWpKMW9vVkRnYWs1MGV3bFZpWm1PYUh3cjZHSTBNS0kwbGs3?=
 =?utf-8?B?ZVkwUkE5WGNPMFdQaUdueVN6aG0vUlMyclVnWEtHbk5VU0ZhL1JOUWlhZ3p2?=
 =?utf-8?B?dVhuMldBV2pnbDFjYkVVMEJPODBwU2RYcm82LzFLek5obm9kcG9iaXRqTzZ6?=
 =?utf-8?B?QlNDcS9OTWhIc2pyTlNjWUEzc0N1dGZYMGJXS0w1alRVRGpEZ0tCZXIzTGZH?=
 =?utf-8?B?Z2Z6K3V6OGlnc0hlY3NMc2xNcEY2aW9NekFJeTkxZUFBSWZ5eXAyc2kyRTdG?=
 =?utf-8?B?WC9CaXl2OEUzSzhmT2NRN2pVNFdxQU9lQnM2SHU0WTVOUjBCM2Q4S1o2WHlC?=
 =?utf-8?B?QWpTQmVLNWgyMk1HTWE4bytXYVNraG44Q2hwWHVMTUpSVmU5aklxbmQ5WUZ3?=
 =?utf-8?B?eXRBUDlXMFM1L3JSTzNkcjlzVTEyNC95ekZ2bm9YbnAvWFdPTm9oTXoxZzYr?=
 =?utf-8?B?WmlFUEoyR0duZ0k1RWpxQzhFN0RiYmtmaUswZWV5aDFzS0Frak1RQTVPenlR?=
 =?utf-8?B?NVZsaDA1TGIvcEVCdk5QMkhvZiswbld2SjdST1p4RDFhamp6a2FocVo2V215?=
 =?utf-8?B?MElaQjJKeVhGK1FaMkJJYWJMTHNXSm5BVFI0c05uMk1mTlA2Y1BrcVo0ZlpG?=
 =?utf-8?B?dmN1MzlhcW9xVnFDZHhxUldDV3d0TGM1SlJodEROWHlMYjdmWjlCY055M0dW?=
 =?utf-8?B?Slk2aUcxWmJKamRWVmJtWW5pdE1uQjUxb0xFdlZ6M2gwTG5DTkFnUS95NFMz?=
 =?utf-8?B?ZGR3ejVONlZadVZQVUZ2MC9pTk5WVmJlOGEwY1daMUdKb29PaStiSHUrRmxH?=
 =?utf-8?B?Nkw5NnNqMkhaelVPWExtR0d6ZThsbnJkZ2ZRMXhvNnVrWFVjYlVtelRZc2Zi?=
 =?utf-8?B?b0dSOGNGTGY5NitOcktHclFRVlpKVHZZSmNRTEVNV3R5TTBwd05EMmZFZ2lW?=
 =?utf-8?B?MlRsVVpKT29SM3hEYndvMzRRT0lwdXpSNWlMdmhmblJHV0hsMUI3OHFuMWwy?=
 =?utf-8?B?MkFCdTlDNWpERWhPeGxQSnd2NnFlckpJRU1BTkZydGxPbTlBRWF5WWRJQk1U?=
 =?utf-8?Q?fkpkTI+b1kE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVJ5bytkZERWVE4yaDlpNW1lMUd0MEo3VDZOb2FGRDJFTXhQK0N1WHc1SjZX?=
 =?utf-8?B?dXpKQWVOQWc1MFhFbUpEdkxoQlhmNXZKSFlIREFSZ01EWmxHckwrVDVWenJW?=
 =?utf-8?B?TnhoSmtGUEVodG5YTFpYZm4yakQvWUpFOW1JMXpSNXBpcWdzNEtpTjZrWk9P?=
 =?utf-8?B?bnNxcVljWFZSQVByVHF0ZTcvcW1Ic2U3SWtKYi8ydGVVSVVsTHhYb1VGaHV0?=
 =?utf-8?B?VFBsbXJZZitGU3RaRnI1Z0orSEZlU2xJNzJCQXdTN3VpMnNrTEdJRHA1cHNH?=
 =?utf-8?B?bzhDaWFvWmpqZ0RMa280UDBTZWNKbjVNNHZ4bysya083TTBEbnU0TTNRdTA0?=
 =?utf-8?B?cUhWbS93RWlWUkFyQjRubnBpT2RDbTJZZTViTnV1MmQ4Z1FhWWRGTWlxT25H?=
 =?utf-8?B?OSsyZXZWK0F4ejNuajJGbDUyNGx1K0lpWWJva2xyNVZsUW5JOElKTFBidmhZ?=
 =?utf-8?B?TXdEMDYwaitIUmlkeVl5dFVQNGZzMEl2VERrNk1Ic2FOUWJJNjl6c1lUZy9s?=
 =?utf-8?B?QkJrdGdFcmVKU1czcnBSSExKVk9MSjlXZmxSUXV6SGR3Z1BvK1lxUGY4Yy9E?=
 =?utf-8?B?UlZNSUZJYXdobkM3T1d1OVpObzVDczNEMnlMOVJTS1lzSndNM3NLcVhEMXRt?=
 =?utf-8?B?VGR4VDVjV1M0NExOTXJCNXpaQy9oWmRoRXdLRmZyVU1FcHFVdE5GM3pvZDVQ?=
 =?utf-8?B?SHZobjlieXY0ZFFvM3FBOXJaZ3VCWk0rVnJnRDdRaFpyMW11ME81eTFlY0Fv?=
 =?utf-8?B?OUw0c3g5VmVKY1hjQWpwa0lHNlpqbXZVT3Z6N2hFTElCczRiNFluUHlmVHdK?=
 =?utf-8?B?RXhwQ0RSWnZLMTM2NHV0cCt2RWd6Q2FiV1FITDhxeG1mcno0N3FzeGFjdWVD?=
 =?utf-8?B?a2JkQlMxNEFkWU9QanpBb25UV3hUYjNiZi9VUnB6UlhoZFYvZEFKcXpIMGx1?=
 =?utf-8?B?ekJjZXN6RmxBQVJzTDZHdlJnb1ZuRllqVUdBVFZWRWZLcUQrMVRmeDZBcU1l?=
 =?utf-8?B?NlhaTHpoc1JseWZoemlyd3BMVlcrb1J0ZG1oOU5pcTJ3L2tXa1NIUzhPWHdS?=
 =?utf-8?B?b3oraW1DN3F5b01QNEt5SWNvdUlaN0h2aUxPUDFWcWpqTjg2dHpPQXpiTmVS?=
 =?utf-8?B?TXJnV0doVElTUWhpY0VKTXRPTDU3cDV0QitabVAzN29sSkhjc2RkendLdjRi?=
 =?utf-8?B?Lys1ZTNIMWc4RldDcHZ5K3k2M2dmNXZwSXFEV2RzMUt5dmljOTVDN3lmSTlm?=
 =?utf-8?B?Qis3eEU4dk53em03SUlqMzVoT0FoYlM5ckN0bkZFcWM0b01TaDR1Y2U2RjNa?=
 =?utf-8?B?eE4yOTA3eFNScEpMWEFDSC9ubVh2VDV6bWNVVVhFMVQzTi9wbkt3a3Z1dFBo?=
 =?utf-8?B?bTVtQkNndUNrQmZxaHBuZEFMcXY4NjNGNGs3V0pjcW5XKzRtVFB0eGpFVXd2?=
 =?utf-8?B?ek5FRUZvVndGMzM3eTBXdWhTclIwVWNmSGlsSlRRckV1Vzd3a1FJWmdjSzFi?=
 =?utf-8?B?SGZWazlrUkJiTjhTRzVYZllueGNTMmg1Vmt0alZnaGpTVHpiT2M4SlVyMW9w?=
 =?utf-8?B?K3MrZm9MT2pCc3l0dTJRMXg2S3l6WlFpbkdzZTdZYlNleDZJL2piaitldzJF?=
 =?utf-8?B?QUNNRG4wYSt1ckU2eDVXQWRtK002N2swYTREWnFEU3UvaUpneHpWSzBHNmMw?=
 =?utf-8?B?ZCtaUlEwSjNEcXhhRHlJZWo1a3JWTzBsYmJKQ3ZhOFZWRzNkWGFiQlQ4YkJH?=
 =?utf-8?B?YUhhVmVyOGUzYW00bDRnQ2txSnBreVJ4TGE3Mm9keTc3azVpaWxvZjVPSEJu?=
 =?utf-8?B?dVE5S2xIdW1kaXJiRW8vZUpRb2tJUXlhMnduUnF2OUlGa000MnZZMDFGcXpB?=
 =?utf-8?B?bFNJWFdUMXlMS2NoQzdPR0ltK2pEaWhOaWVZQm1DVHVEV0NFTER6Q3FxY0hq?=
 =?utf-8?B?L0MyWkZobk10emZNckpQMHZRN1JRZFpvSkg3RFI2YlpkV09wZTNIeTBDbjdP?=
 =?utf-8?B?Vi8zcFg3anM0YWZ5R1RkYk8xOCt2V1lQaDgxdWdFNWxQRnZ0NGNud013eTcv?=
 =?utf-8?B?TTc3UjdIOE04djhPcEx6a1ZKWFM5SXlmSGdIMzhZY2NZUlpsZGdxa1BIQ25i?=
 =?utf-8?Q?6weALENgY57ZtrudmSwN82VYH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d15fc76-9f25-4551-da12-08dd9c2593af
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 07:18:56.5366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11kxop4AtYD9c8YrbFp15HgnOsewfVhEx2msWtyt34RqNQrsQlu1jAqc7chSFdrZ5Nff6zU8oNk3D3EA6W5rBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9169
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



On 24/5/25 13:13, Xu Yilun wrote:
> On Thu, May 22, 2025 at 01:45:57PM +1000, Alexey Kardashevskiy wrote:
>>
>>
>> On 16/5/25 02:04, Xu Yilun wrote:
>>> On Wed, May 14, 2025 at 01:33:39PM -0300, Jason Gunthorpe wrote:
>>>> On Wed, May 14, 2025 at 03:02:53PM +0800, Xu Yilun wrote:
>>>>>> We have an awkward fit for what CCA people are doing to the various
>>>>>> Linux APIs. Looking somewhat maximally across all the arches a "bind"
>>>>>> for a CC vPCI device creation operation does:
>>>>>>
>>>>>>    - Setup the CPU page tables for the VM to have access to the MMIO
>>>>>
>>>>> This is guest side thing, is it? Anything host need to opt-in?
>>>>
>>>> CPU hypervisor page tables.
>>>>
>>>>>>    - Revoke hypervisor access to the MMIO
>>>>>
>>>>> VFIO could choose never to mmap MMIO, so in this case nothing to do?
>>>>
>>>> Yes, if you do it that way.
>>>>>>    - Setup the vIOMMU to understand the vPCI device
>>>>>>    - Take over control of some of the IOVA translation, at least for T=1,
>>>>>>      and route to the the vIOMMU
>>>>>>    - Register the vPCI with any attestation functions the VM might use
>>>>>>    - Do some DOE stuff to manage/validate TDSIP/etc
>>>>>
>>>>> Intel TDX Connect has a extra requirement for "unbind":
>>>>>
>>>>> - Revoke KVM page table (S-EPT) for the MMIO only after TDISP
>>>>>     CONFIG_UNLOCK
>>>>
>>>> Maybe you could express this as the S-EPT always has the MMIO mapped
>>>> into it as long as the vPCI function is installed to the VM?
>>>
>>> Yeah.
>>>
>>>> Is KVM responsible for the S-EPT?
>>>
>>> Yes.
>>>
>>>>
>>>>> Another thing is, seems your term "bind" includes all steps for
>>>>> shared -> private conversion.
>>>>
>>>> Well, I was talking about vPCI creation. I understand that during the
>>>> vPCI lifecycle the VM will do "bind" "unbind" which are more or less
>>>> switching the device into a T=1 mode. Though I understood on some
>>>
>>> I want to introduce some terms about CC vPCI.
>>>
>>> 1. "Bind", guest requests host do host side CC setup & put device in
>>> CONFIG_LOCKED state, waiting for attestation. Any further change which
>>> has secuity concern breaks "bind", e.g. reset, touch MMIO, physical MSE,
>>> BAR addr...
>>>
>>> 2. "Attest", after "bind", guest verifies device evidences (cert,
>>> measurement...).
>>>
>>> 3. "Accept", after successful attestation, guest do guest side CC setup &
>>> switch the device into T=1 mode (TDISP RUN state)
>>
>> (implementation note)
>> AMD SEV moves TDI to RUN at "Attest" as a guest still can avoid encrypted MMIO access and the PSP keeps IOMMU blocked until the guest enables it.
>>
> 
> Good to know. That's why we have these SW defined verbs rather than
> reusing TDISP terms.
> 
>>> 4. "Unbind", guest requests host put device in CONFIG_UNLOCK state +
>>> remove all CC setup.
>>>
>>>> arches this was mostly invisible to the hypervisor?
>>>
>>> Attest & Accept can be invisible to hypervisor, or host just help pass
>>> data blobs between guest, firmware & device.
>>
>> No, they cannot.
> 
> MM.. TSM driver is the agent of trusted firmware in the OS, so I
> excluded it from "hypervisor". TSM driver could parse data blobs and do
> whatever requested by trusted firmware.
> 
> I want to justify the general guest_request interface, explain why
> VIFO/IOMMUFD don't have to maintain the "attest", "accept" states.
> 
>>
>>> Bind cannot be host agnostic, host should be aware not to touch device
>>> after Bind.
>>
>> Bind actually connects a TDI to a guest, the guest could not possibly do that alone as it does not know/have access to the physical PCI function#0 to do the DOE/SecSPDM messaging, and neither does the PSP.
>>
>> The non-touching clause (or, more precisely "selectively touching") is about "Attest" and "Accept" when the TDI is in the CONFIG_LOCKED or RUN state. Up to the point when we rather want to block the config space and MSIX BAR access after the TDI is CONFIG_LOCKED/RUN to prevent TDI from going to the ERROR state.
>>
>>
>>>>
>>>>> But in my mind, "bind" only includes
>>>>> putting device in TDISP LOCK state & corresponding host setups required
>>>>> by firmware. I.e "bind" means host lockes down the CC setup, waiting for
>>>>> guest attestation.
>>>>
>>>> So we will need to have some other API for this that modifies the vPCI
>>>> object.
>>>
>>> IIUC, in Alexey's patch ioctl(iommufd, IOMMU_VDEVICE_TSM_BIND) does the
>>> "Bind" thing in host.
>>
>>
>> I am still not sure what "vPCI" means exactly, a passed through PCI device? Or a piece of vIOMMU handling such device?
>>
> 
> My understanding is both. When you "Bind" you modifies the physical
> device, you may also need to setup a piece of vIOMMU for private
> assignement to work.
> 
>>
>>>> It might be reasonable to have VFIO reach into iommufd to do that on
>>>> an already existing iommufd VDEVICE object. A little weird, but we
>>>> could probably make that work.
>>>
>>> Mm, Are you proposing an uAPI in VFIO, and a kAPI from VFIO -> IOMMUFD like:
>>>
>>>    ioctl(vfio_fd, VFIO_DEVICE_ATTACH_VDEV, vdev_id)
>>>    -> iommufd_device_attach_vdev()
>>>       -> tsm_tdi_bind()
>>>
>>>>
>>>> But you have some weird ordering issues here if the S-EPT has to have
>>>> the VFIO MMIO then you have to have a close() destruction order that
>>>
>>> Yeah, by holding kvm reference.
>>>
>>>> sees VFIO remove the S-EPT and release the KVM, then have iommufd
>>>> destroy the VDEVICE object.
>>>
>>> Regarding VM destroy, TDX Connect has more enforcement, VM could only be
>>> destroyed after all assigned CC vPCI devices are destroyed.
>>
>> Can be done by making IOMMUFD/vdevice holding the kvm pointer to ensure tsm_tdi_unbind() is not called before the guest disappeared from the firmware. I seem to be just lucky with the current order of things being destroyed, hmm.
>>
> 
> tsm_tdi_unbind() *should* be called before guest disappear. For TDX
> Connect that is the enforcement. Holding KVM pointer is the effective
> way.
> 
>>
>>> Nowadays, VFIO already holds KVM reference, so we need
>>>
>>> close(vfio_fd)
>>> -> iommufd_device_detach_vdev()
>>>      -> tsm_tdi_unbind()
>>>         -> tdi stop
>>>         -> callback to VFIO, dmabuf_move_notify(revoke)
>>>            -> KVM unmap MMIO
>>>         -> tdi metadata remove
>>> -> kvm_put_kvm()
>>>      -> kvm_destroy_vm()
>>>
>>>
>>>>
>>>>>> It doesn't mean that iommufd is suddenly doing PCI stuff, no, that
>>>>>> stays in VFIO.
>>>>>
>>>>> I'm not sure if Alexey's patch [1] illustates your idea. It calls
>>>>> tsm_tdi_bind() which directly does device stuff, and impacts MMIO.
>>>>> VFIO doesn't know about this.
>>
>> VFIO knows about this enough as we asked it to share MMIO via dmabuf's fd and not via mmap(), otherwise it is the same MMIO, exactly where it was, BARs do not change.
>>
> 
> Yes, if you define a SW "lock down" in boarder sense than TDISP LOCKED.
> But seems TDX Connect failed to adapt to this solution because it still
> needs to handle MMIO invalidation before FLR, see below.
> 
>>>>>
>>>>> I have to interpret this as VFIO firstly hand over device CC features
>>>>> and MMIO resources to IOMMUFD, so VFIO never cares about them.
>>>>>
>>>>> [1] https://lore.kernel.org/all/20250218111017.491719-15-aik@amd.com/
>>>>
>>>> There is also the PCI layer involved here and maybe PCI should be
>>>> participating in managing some of this. Like it makes a bit of sense
>>>> that PCI would block the FLR on platforms that require this?
>>>
>>> FLR to a bound device is absolutely fine, just break the CC state.
>>> Sometimes it is exactly what host need to stop CC immediately.
>>> The problem is in VFIO's pre-FLR handling so we need to patch VFIO, not
>>> PCI core.
>>
>> What is a problem here exactly?
>> FLR by the host which equals to any other PCI error? The guest may or may not be able to handle it, afaik it does not handle any errors now, QEMU just stops the guest.
> 
> It is about TDX Connect.
> 
> According to the dmabuf patchset, the dmabuf needs to be revoked before
> FLR. That means KVM unmaps MMIOs when the device is in LOCKED/RUN state.
> That is forbidden by TDX Module and will crash KVM.


FLR is something you tell the device to do, how/why would TDX know about it? Or it check the TDI state on every map/unmap (unlikely)?


> So the safer way is
> to unbind the TDI first, then revoke MMIOs, then do FLR.
> 
> I'm not sure when p2p dma is involved AMD will have the same issue.

On AMD, the host can "revoke" at any time, at worst it'll see RMP events from IOMMU. Thanks,


> Cause in that case, MMIOs would also be mapped in IOMMU PT and revoke
> MMIOs means IOMMU mapping drop. The root cause of the concern is secure
> firmware should monitor IOMMU mapping integrity for private assignement
> or hypervisor could silently drop trusted DMA writting.
> 
> TDX Connect has the wider impact on this issue cause it uses the same
> table for KVM S-EPT and Secure IOMMU PT.
> 
> Thanks,
> Yilun
> 
>> Or FLR by the guest? Then it knows it needs to do the dance with attest/accept, again.
>>
>> Thanks,
>>
>>>
>>> Thanks,
>>> Yilun
>>>
>>>>
>>>> Jason
>>
>> -- 
>> Alexey
>>

-- 
Alexey

