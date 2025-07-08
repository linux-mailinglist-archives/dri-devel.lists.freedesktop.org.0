Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32989AFD044
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 18:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CDE10E6B3;
	Tue,  8 Jul 2025 16:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2VF67Tjl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2083.outbound.protection.outlook.com [40.107.95.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6071910E15C;
 Tue,  8 Jul 2025 16:11:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3dAOqWKCBkvGLxnbLAeimtW7f8dc6vkBb3i3/HUtSNdpWHR6DJ5jqBNpusOH76ze6E2uYbjeuR5aBwmv3C8y9SII1uIqFEtNgIavP23uHfihniPhMBPSZunfl1Zu0yFajtWpew4wmw8eoYEwgdQF34OI+6qKr6drOlu10WfFc+jkX8usfd+KENMNYDiE/9jMZaKk50GxkX5ePX5qJkg81XIyxac4rG65KrFrgahixRctz+oL+SjWCHDgXgi5EDOSVJkxAk2MKgOj5K6YnDGgmG2XLRB3dqXBNNGT2bmMGrJrWJA1Zb/ClhWclFgsfPIuZifnXLvqhwMEMg03qo6+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uotbA1FDMGM9qgV9D+FuBTiVn3fCyZij47tsJob/G5o=;
 b=UUzusWp+igBmruy6hovDTKcHqf8X3v+SWk/VNhCAzhqGnzFz7OPWS5/BMpZ/d21JwgfWsqQLFiAs5ebkOkOIDeIuz/iTkgLIFheYo0SRyhBOVTwrgrTBKt0BsxPNJjCPpvRmav7gvMbsDt0TJ2E2pbco13+f2li3YRrh0t8A3rlkIlmfvUOxXmTvapqqHRggFox1rgSdyj/IrCSm6K8NPVVPbssemGyPzFnMoiHgAywenKDJCeVn/1SBSsBuf75tC8SBn3ntpJDCKur659uF2sgjoGjAD9c2yT3O37lhZg3/d060tc1YVWYq2NV/0WYpb+HuuOeIb0x5HKAKBQithg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uotbA1FDMGM9qgV9D+FuBTiVn3fCyZij47tsJob/G5o=;
 b=2VF67Tjl+yqhDGMmVqflQRXMrgzC/vOWcu7XiItvQuc86Ty5JWTEDdJqQWLB+yF9odr2QWHiOvqP2AysD8Zxp1NWfIQuZCeaXV+RZFiI95iAXwrH7AI/tX0WpX8nk0ToU6mjTfAG8wSI3q4wwl4a4RSlEeue9jIdW1SmGrlYidM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW6PR12MB8960.namprd12.prod.outlook.com (2603:10b6:303:23e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.36; Tue, 8 Jul
 2025 16:11:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 16:11:09 +0000
Message-ID: <fe24f8ab-39f7-4471-beb5-e623ea3fb75a@amd.com>
Date: Tue, 8 Jul 2025 12:11:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] PM: hibernate: add new api pm_transition_event()
To: "Zhang, GuoQing (Sam)" <guoqzhan@amd.com>,
 Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, Owen.Zhang2@amd.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250708074248.1674924-1-guoqing.zhang@amd.com>
 <20250708074248.1674924-5-guoqing.zhang@amd.com>
 <1fa50a8e-9942-45c4-bef0-f31c23ef9923@amd.com>
 <41a78619-d9c6-4e2a-9684-056e91d09e64@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <41a78619-d9c6-4e2a-9684-056e91d09e64@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0052.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::7) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW6PR12MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: 948796cb-04bf-4fb9-9380-08ddbe3a0d1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjNTUUw3VXY3SmFCN3hTVkkxNVd2ZkRXdm9hVm9qYXppcTQyYzZEamtLYStZ?=
 =?utf-8?B?a2RIR3Z4RXZNNlF3bHdaWGNzRXRtWHROV0dsTDBGQ2lPQ1RWcDlSb1k5WmJi?=
 =?utf-8?B?MHJCUk1SR0VzdWhIWmI5SWh0d2RVSXpkUlhmMXJEV0UwZVRLOTdNbmIvTE0x?=
 =?utf-8?B?L25QdHRITlNtNEpSSjZGMlc5dUp6a0t3SnBuS1hVWjR0VENHZnpGcmFiUEFH?=
 =?utf-8?B?MWtNYmE2TzF3bGt4cVN6UG5mVVh2RERnc1Rvcm1FanpwVUwxU1dhblFCREw1?=
 =?utf-8?B?djBQOEZDbDRBSHpUQ3pNTWF2REl6UjQwek9WSTlMUE1BaWZkN2FvNjIzR2Z4?=
 =?utf-8?B?Wk8ra2JXWVhUSDNyNWg0V25vZTB0S1lwTzBkZkdtZDBOVklrS01RamhWaUFR?=
 =?utf-8?B?MjZpK0ZKcWRQMTI3UDlvVTNNYVFZS0JyQ0hZVTVGamRRdi9xdVpDaC9LKzBJ?=
 =?utf-8?B?RFZ3ZThEOTBHNEo5Qjh6ZldiMUJIYXBpNm1WbGdlbUlEM0swYnc1a01JMyt2?=
 =?utf-8?B?MXNHbUx6UEJTSzBxQjNsYWltRWE1dE1qV1J6S2s5T2lXSG8rb0FjUmhBUUJW?=
 =?utf-8?B?eGtCTmNsKy9la2o5ZEVuN1Rvc0dCRmxwRUZCWTFEbnUzUitreTJMZXA3SzYx?=
 =?utf-8?B?M2NiYjJwN1ZndHdiMlNPZmkzeG5KY1lyYjhGS01jMitpS1p2blA5WVI1eFBG?=
 =?utf-8?B?NHg3UE1YUzJLcnB3U000OXMrZDFoaWsvMXFOL2ZhNUdzWWZDdHVMZWc1NWJW?=
 =?utf-8?B?aXN1bWZIcUkrVHpTME4wTGFRV2dYWWdSYkJNV0JCdld0UFBTeDJkT0FhOTlS?=
 =?utf-8?B?MG5WYW8yNkx0L04rUVpNRHdWRmVIeldyck9HZkd5QkZHNzA1U0k2OENiYndZ?=
 =?utf-8?B?NHlCVDZEVXdsSkxWVlR6eFFrclNZUnJleGRqL0lqQ0JmMXowc1IwRFhHeFN4?=
 =?utf-8?B?Vms4L3R1RHh0eTI3V00yTEFTeEpsMmhBcFdiM0NiUEtzTU1MdE5tZUJnMlpO?=
 =?utf-8?B?NEswRDF1N0FVeW80SVlGNUxQZnJ4VGVBS1FjcTlBR1Y0MVpwbW5DeVNTK0w2?=
 =?utf-8?B?dVZ4eGoyNnozWU5VWVU3ejRYanJxU3EvQ1k0UTN1OURkdUdlaVNaVFZyMHZs?=
 =?utf-8?B?cWRGTG9mVkV1WDQrVXQzREQrNisrRlFDckdZQ091QnF2dkFjR2RJbnVreFU0?=
 =?utf-8?B?YjRySjZ5YjgrNDFxVVRjaC9QZTRPRUhSUjdERlZmT05XRkhiWDJxb1JkeE9U?=
 =?utf-8?B?NTNQYnl5dW0vdHVQcE96UXNJV0tWaTl3akEwTGp1NVZid2s0cVRqWkxEeUNT?=
 =?utf-8?B?ZlVlaUFkUTVKcnFLNFFiM2dubkZ6dXJndlJ3NlFQd1BGYzBNbXJOblVrd2ly?=
 =?utf-8?B?ZmpQS3E5VllDL2xxSHRFSkQ2UFhBVGxneTFxMWprcStlSEZTQUEvWGVRb1Bk?=
 =?utf-8?B?QXM2WmtFU0R5NHlSNSt3dUEwRWZENDhWem82ZWR5Um42Z0JFdWlRZVkwaGtY?=
 =?utf-8?B?R1pKVm10NUgzTGJ3V0VGczZVS0FqbG13RlRmQ3FXUERWWnJwRCtUT1JFQnNY?=
 =?utf-8?B?ZVNrV2ZyOWVxNzYxUnJTUXdtRUYzOFQxZTdyUm5hYzZyT2lKVXZMeldsblZL?=
 =?utf-8?B?RWpVMVVyWndna3BJNDNwM2xCRjBaU0tXV0ZLMzVsZ3Y1MEh4V3ZYY3h5SGtu?=
 =?utf-8?B?TVNNMEFGV2w3aVE5TzYzMTlhMU1aeE9WeEJDV3FNN1lRc0s0VGh5aTdZNWhQ?=
 =?utf-8?B?ZnkrUFFTSFQzYWtGb2ZabTNuTXZPY3JzZGRJSHlWYUNpVHVQc3FsVkd3em9N?=
 =?utf-8?B?ZkV0djZVMU1OQ3ZZSnkrMVJDSzZoMm9CTWFHTnlLL0FuWXJZUXhkaUsxRXU2?=
 =?utf-8?B?RE1uOWdESUVPcEsvKzRwZlJiNlQwZ04rbDg4dXZEQW92STVvMnJueXppTFQz?=
 =?utf-8?Q?k5Vfrxr0Zhk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUZiZUhrN0VCcWJDV09MQnpOVmRkL3lGOHdJcWdnbEtZT25ZSTJKTkdQamh2?=
 =?utf-8?B?c0Y2Rko3a0tVdXlKQU8vdzVDNWRaZmIxbXdNcUsxZk1wNWx0ZGc5OFM1cDl4?=
 =?utf-8?B?blBOOFpvbWtSUXRIL0k5N2tCUmZPTFhKQ3FTSTFqOFRsUnpQaGp5TWwzM1dC?=
 =?utf-8?B?cWxHSjBkcnErY0FpM210dnF2MjNjOWJ3TXhTZG0rbnlwYUZBb1NyY2Ivc2tT?=
 =?utf-8?B?L1FUb0tVdW0xRU5FSmdBcnJwdGpxWnhEMVFobm5nNnZpc0ptWFFhczZ0MXIz?=
 =?utf-8?B?eWZMTWoyZXJud0kyeCs1V0MrRjI1VE5VYTV1T1NHWko5cnVoZkp0dXExNTdK?=
 =?utf-8?B?ZldkcnJwRmZIUElSVTFmbTVBK043bStZaHZTS0FtQ2xHVW5tM0RUU2pyQnFX?=
 =?utf-8?B?TCtpTVBsaHlVMUZtSHdQWlhFOGNsYkZ2RDR0RjlXTlUvRlNwMTA2TXp6eU1l?=
 =?utf-8?B?VEVvQ205RGlUSnlFczlFeGMwM0dqckxhdzJUdUlkVkxkUGlTdHBlSlZya05T?=
 =?utf-8?B?c1VYcnNGVGpXU3Y0MFNuK2lLclJSeWVyeWFCdjIyTFFNaSs2QTJSTitLRzMr?=
 =?utf-8?B?ZFB6YnpNbVgybE5VNk1TdllIUWNLaHZHWmpxUElqMUNFcXltOFpDaE5UOG5P?=
 =?utf-8?B?MFdaNzZLRDl2WWY5TVl6WHg2eGFzcjVLdEMxNDR6c3kvaVM4TTFBY0Iyc0Zk?=
 =?utf-8?B?cER3eGxqSEpNenpBSTVIQkJXZ29XcHNFb0k0bWF3VFo4N09seTFwaVYvOXRh?=
 =?utf-8?B?ZFN2S3RIZXl3cEhDaXJ1QUZHWFRPWnkrWlkwQlZxSEpQVk9hNDFldXNTN0FE?=
 =?utf-8?B?U015aVBBYTJCZEE2S0FEY1JqOHVEUSt3YUtjZ3hQV0R2a2RwQzJudFpoSkxJ?=
 =?utf-8?B?Y1NsVXhEY2hLY0RpN2pDbmhnTVVBclpQdDFqbFowUEhROVNpK25vQms2UEMy?=
 =?utf-8?B?TXl3OWZXRmJVbHRDV3JjSmxJWXVhbDJWQW1tY2xnL24vU3NGS2N4bHRORStY?=
 =?utf-8?B?WFhwaEoxUnpvWld3VTNtQjlsdkpmT1UvM284K1EzUkJiYXdtaFFJcjhydElP?=
 =?utf-8?B?RGJDcHFMSkxOSTh0dmJ0SG5wRUdUM0I4MW43SzZkL293L3ZiRDd6ZzhtZU9Z?=
 =?utf-8?B?TjMyejBiNDZOVndha2srOWQxaXlNSFJkd2VORTFSaFQwQndOSFh5Vys0RWFw?=
 =?utf-8?B?bjI5V0IxUFg4aXpFY0tUQWxsVTdrcTdHNTRtdVRhR0ZSdUZhQ1A5b3puR3Jw?=
 =?utf-8?B?UTJYK3B3eEpwdExQMTF6aHFnVWRxWWZPekMrMGR4TWtBR0RmQXR1SXQ3QnBm?=
 =?utf-8?B?ZnBVaC91ay80ZlR1c2RwUktqeHE3RFdHbXJkTnY4ZmlDVDVmMk01YkJDNTU5?=
 =?utf-8?B?Mm9WR1NoVGVwNmg2WnVuaVJqdTdFdklsdi9nZ1Y5WFV0Vml0WENXckJjdGpN?=
 =?utf-8?B?YVVsWUdjY0ZMa1hzcm1SZDhpaUNjRzhaeFhrUFcyWHBRazEyUlRpTUNtbFJH?=
 =?utf-8?B?SW1IMFdoS0VwV0hPTUlMWWZic2VuUjY5dWpkRFdsOXozMEU1M1Z2d0tzdnY3?=
 =?utf-8?B?YnFER05iZWFNV2lQSVhSK0krbWdXOGdsSkMzOG9rVW5ValNZWStZRlpZd2tm?=
 =?utf-8?B?SytiNEVSbEFSbHlSKzNGdXAvN0NmTVdDMlpJdXI0TlJ2Z1ozc0x6ZHlJYnpG?=
 =?utf-8?B?U3VyKzF6VHlMUFQyejJMb3VldEpLam9qN2ViR3czeTFyd3pMZHJCYUJKeTlD?=
 =?utf-8?B?UkxuUFI4SFJTbGRNZEs0WHl2UTVHT3JsZ2NENWtNT1c3Ykx5U2JqdkU0OHpB?=
 =?utf-8?B?OFJEcFdYaXVyandIWUlLTzVSRjB0U0tpYlFQQlE1VVc2WEY4MURSVFZTRjNP?=
 =?utf-8?B?ZkRZRzQ5TmFnNTBFSjRIblVrUnkwelVzU0hqc2F2MFRreHNCRld0UDNBZXBM?=
 =?utf-8?B?OUVYaWQ4VzgxN3U5eTVmN2s1OEJtY1hnZXlRTXZxTE1lamFVdmUvZjBNVHpz?=
 =?utf-8?B?R1k0RHRlWDRnaFZMdEVUSno2TWxFUUhkY0NZVUg5SFM5NVVVTXNCUG5FeXpv?=
 =?utf-8?B?LytPem9BaFBHN1NkMldnZlVIeW9LQmhRS3pmbE9sTFN4RCtWL1BJRFc4YXlh?=
 =?utf-8?Q?AgFyPt082yGFeA93kbiMQawDu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 948796cb-04bf-4fb9-9380-08ddbe3a0d1e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 16:11:09.5797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozGWGK/so4m1/F5RrYGkUfsqtGh6EQDrZwlfeG8YM/hXB2lZ4Nkx2b1zEDNxHBhI2k5c5zrbHU9vHbUNaMwXVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8960
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

On 7/8/2025 12:07 PM, Zhang, GuoQing (Sam) wrote:
> 
> On 2025/7/8 22:36, Mario Limonciello wrote:
>> On 7/8/2025 3:42 AM, Samuel Zhang wrote:
>>> dev_pm_ops.thaw() is called in following cases:
>>> * normal case: after hibernation image has been created.
>>> * error case 1: creation of a hibernation image has failed.
>>> * error case 2: restoration from a hibernation image has failed.
>>>
>>> For normal case, it is called mainly for resume storage devices for
>>> saving the hibernation image. Other devices that are not involved
>>> in the image saving do not need to resume the device. But since there's
>>> no api to know which case thaw() is called, device drivers can't
>>> conditionally resume device in thaw().
>>>
>>> The new pm_transition_event() is such a api to query if thaw() is called
>>> in normal case. The returned value in thaw() is:
>>> * PM_EVENT_THAW: normal case, no need to resume non-storage devices.
>>> * PM_EVENT_RECOVER: error case, need to resume devices.
>>>
>>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>>> ---
>>>   drivers/base/power/main.c |  5 +++++
>>>   include/linux/pm.h        | 16 ++++++++++++++++
>>>   2 files changed, 21 insertions(+)
>>>
>>> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
>>> index 40e1d8d8a589..7e0982caa4d4 100644
>>> --- a/drivers/base/power/main.c
>>> +++ b/drivers/base/power/main.c
>>> @@ -62,6 +62,11 @@ static LIST_HEAD(dpm_noirq_list);
>>>     static DEFINE_MUTEX(dpm_list_mtx);
>>>   static pm_message_t pm_transition;
>>> +int pm_transition_event(void)
>>> +{
>>> +    return pm_transition.event;
>>> +}
>>> +EXPORT_SYMBOL_GPL(pm_transition_event);
>>>     static int async_error;
>>>   diff --git a/include/linux/pm.h b/include/linux/pm.h
>>> index 78855d794342..d1cb77ede1a2 100644
>>> --- a/include/linux/pm.h
>>> +++ b/include/linux/pm.h
>>> @@ -657,6 +657,22 @@ struct pm_subsys_data {
>>>   #define DPM_FLAG_SMART_SUSPEND        BIT(2)
>>>   #define DPM_FLAG_MAY_SKIP_RESUME    BIT(3)
>>>   +/**
>>> + * pm_transition_event() - Query the current pm transition event value.
>>> + *
>>> + * Used to query the reason why thaw() is called. It will be one of 
>>> 2 values:
>>> + *
>>> + * PM_EVENT_THAW: normal case.
>>> + *        hibernation image has been created.
>>> + *
>>> + * PM_EVENT_RECOVER: error case.
>>> + *        creation of a hibernation image or restoration of the main 
>>> memory
>>> + *        contents from a hibernation image has failed.
>>
>> I don't believe this documentation is complete.  In the use in this 
>> series those are two events used, but as this is now exported this 
>> might be used by other callers later which could use it for other 
>> PM_EVENT_*.
>>
>> So because of this I think it's best to convert the comment in 
>> include/linux/pm.h to kdoc and then reference that from this kdoc.
> 
> 
> Hi Mario, thank you for the feedback. I don't have experience on kdoc. 
> do you mean generate new `Documentation/power/pm.rst` from `include/ 
> linux/pm.h` using the `scripts/kernel-doc` tool? Could you give some 
> guidance on this? Thank you!

If the comment starts with /* it's a regular comment.  If it starts with 
/** it's a kernel doc.

You should just need to convert it to a kdoc by changing it to /**.

Then you can reference it using a link (IIRC)

https://sublime-and-sphinx-guide.readthedocs.io/en/latest/references.html

> 
> Regards
> Sam
> 
> 
>>
>>> + *
>>> + * Return: PM_EVENT_ messages
>>> + */
>>> +int pm_transition_event(void);
>>> +
>>>   struct dev_pm_info {
>>>       pm_message_t        power_state;
>>>       bool            can_wakeup:1;
>>

