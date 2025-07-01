Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1DEAF00B6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 18:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054F210E5EF;
	Tue,  1 Jul 2025 16:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ionYpf4H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C5F10E5E5;
 Tue,  1 Jul 2025 16:53:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4seGP3E8z1svK9o3E6f8etd324/viBb9Z5e8666/HZ1N32tD1OLXpY7mJdsVHCBkI0ODNDMCnIjOMm30uIM+t693jEDmfZeooA9ZC/AVjfOO8ZAbjcXSV+FXmEEJO/jG5MlMj7kd+2V1aoMTwszAVSsQtM55k897OPv9xg7HJ4NXvswMZKHS5gtY4NMB3dwPRix+39wMBWReJW3qfwa67LIHuLoDw69VRx/tv8WZDWaGDT4v4hTAIiotT6yoQonQEjeWrv7su7KXZa5oFwE9rFpGb1WE2qamZE63a1sqoabwptbpOsxoIUySINfr0MjeCkRN9Ps2GBOI92KzNPttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPs8k+8mE6FejROiOMUq1DqYyaOIk+gPNal1w6/aWUg=;
 b=Xs4DM4XzHQHFexlHIZhWjbESXhnBK4Dhudd1qDerGDvEE9xF7UDgbiePN6FJsPFjXXB1bdkUoA/JkzQ+cfRJEVtBkUNFCixriStzY8TkoUGAsCsDOt+NsSe75fVxxoaCNYnVQXCb2UglNZtE/F3TyyCeYO+5bLVdgdHETl1nCZa/GRIRnQu7r7Fs1ThqDvIuz8DuxTzk1IxdwttBKA52097v8Z0wbnNh3dRKHMeeqfak16uAmsDQmYPVcT1WzEfrutjnyTxg7ILA2P6KGdDX77/LOpuP0F10BOhS4GcDI5tPXo8epx14tEvkaypdmYR6qhd1FDFgj1X0eEqYj4b6kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPs8k+8mE6FejROiOMUq1DqYyaOIk+gPNal1w6/aWUg=;
 b=ionYpf4HEeuyAamAC19Il8onWJUbL/Jhfkk9vrEKbVzyxy/dqCjGTAimNpTltQIjcq9h+bQXb0fao+XR3Y8LXqzvknNZNmIO8/J5v4Ck5CdKHq3vsMRkE2O+2J/ejSTA2Tu5zYpolPwHJ6er8xEnOy8foa0YyyQXkVP0IMGMzx4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 1 Jul
 2025 16:53:49 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::81e6:908a:a59b:87e2]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::81e6:908a:a59b:87e2%6]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 16:53:49 +0000
Message-ID: <0cfc548f-3a76-43d6-836f-708ecb7f5479@amd.com>
Date: Tue, 1 Jul 2025 22:23:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] drm: move drm based debugfs funcs to drm_debugfs.c
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 "Khatri, Sunil" <Sunil.Khatri@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "phasta@kernel.org" <phasta@kernel.org>, "dakr@kernel.org"
 <dakr@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>
References: <20250701063303.3210665-1-sunil.khatri@amd.com>
 <BL1PR12MB575314D550E85AAB35321DA79341A@BL1PR12MB5753.namprd12.prod.outlook.com>
 <04216cc3-c8ec-4782-a021-705f53c0fefc@oss.qualcomm.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <04216cc3-c8ec-4782-a021-705f53c0fefc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2af::8) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb3640e-eb91-4361-2bd8-08ddb8bfd9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OThzVkxEOXJtSmFxUnpCd3FLZVNFamsyS0pFU09HaEhrOVYwc0EvS2svd1pU?=
 =?utf-8?B?cXlNTWxmdXhMMnoybHRUNnljdGtocjI0akZrRm8wYVlIYlYvQXgvaVo0Mmdu?=
 =?utf-8?B?ZXQxdWF4bjRVVWY5Nm41MS8vRzVvc1ZycVh4R1RyMFV1ZU5tSDdSUm4vdGYy?=
 =?utf-8?B?anRCRGZ0QjFHNFpVZ3czZXRXbGZRR3lvcmZsQnFuR2lWem9jSXJVMU5GZ1lG?=
 =?utf-8?B?Ull0T0Q2Qit5OEpUY3QzWHo4b0R0UVhpNkwvZDVCbTRRdnE3UzRvQjl4ODg4?=
 =?utf-8?B?clIvZ2NZRzRZMHZ3b05ScjNhcFJZMUNHRjZTdnVOdWlwN1Q4djIvaVF5bDFw?=
 =?utf-8?B?NEFqZlZuOWptd1FmZnlaUTZwbzEySlAvaTJOcW4vNXdNUFBJb1J5cXVMbDdN?=
 =?utf-8?B?cURYSW9CblFqQ2FnV0Z3TVhia1REQXpSUHlpeHRNWVZiekZSTkZuTjl3elRp?=
 =?utf-8?B?YmpiYitkNFNVNUxFWEFzNy9FRncxUG1VNElxVGlmTzlKUU5WZ2NibC80eHlY?=
 =?utf-8?B?T2lvOW1kU090NVdzK1V2U1ZDYkdLMFhjYXh1bnl0NUNDN2ladS9MQlkvQTNi?=
 =?utf-8?B?cmdKU1JMajQ5U3JnVEVsbFhVa0ZKbE80WDZLeUZxWjlPYm1MNWpFYVRnYUFG?=
 =?utf-8?B?MExFNS9YVUJHS0FxVHVWV21pQTVrMmpselJjQ0RBbGFoSXY4bDhXck9Da2ll?=
 =?utf-8?B?OFJNSWZNa0QyUjdUSjVjVm1ic0x3Yk9hNEw5VktPYVJSMlVJTG1PaHhtN1RM?=
 =?utf-8?B?RmhSU3U5S0tjdC9RZENHMVpiellIM2tJd0FRTWRYVDM1Tytwb3JpbVNmMWRJ?=
 =?utf-8?B?dTE0R0E1VGJ3YitIelRTYno3MkhtRCtLUzhBSnBYZ3VJUlBvRHE1S1dWRkhC?=
 =?utf-8?B?M1RISTc0bG1ic04zYWszOHNnMzVhaDlMaFovNVpJZnNObEVGS0dXMVdDYVJY?=
 =?utf-8?B?WmdiNFJTb0pWcWdtckNIWEpEeWNrRFd6R0w5VFNMVVhIKy9rWVRjY3JoRHVo?=
 =?utf-8?B?aHlodXVSZHpnMkdJMGUyc3Q3VFlJSnJZVW1XVC8yRVljaXZHUFpqNTNMYllR?=
 =?utf-8?B?SFFCWnZoRUVOVjBEVGhYU29hTDZpSzRUYXR0T3VhWGtNYWZNUTMzT3V0U2FE?=
 =?utf-8?B?RUZPbnVHWWd2Q2pOVmJFanl3ZHVCTWtocFo3a0VDTUI5Ykc2SHVvbDNYL1dm?=
 =?utf-8?B?d1ZZUmtLYXcxY1UrQ2ZJN0xNS2s0Ukh2bXRKaVRhMDdjQWR1czE5eVcrem10?=
 =?utf-8?B?LzdsSENidXhLNFpYS1pvaG9ldFhWNVlvY3pzZ1M1Q1k4VVFNQ25qdmJWcjN3?=
 =?utf-8?B?TG82d3hkWHFTM09JclBwZ1pLQjJTOHh1NFhrRU1IcjQybHZoNVF2aEFNQVVw?=
 =?utf-8?B?SDBLVzh6ZEQweFpWM29OWEJBdFZ4UE1lNnZMWlJOMnZ0YWRDVVB4Y1hKK3Zx?=
 =?utf-8?B?TllpaWhjd1N1NFdDcmNYUUM4YzFKNUFLWkc1bGpwaDNOR2RySDM2eDYxRC9D?=
 =?utf-8?B?cGtqeDlWMEpaeEZGNTA5T0daWU1KWERoMHA3N2szbUpZcWJVV1p1ejZrc3g4?=
 =?utf-8?B?dDFXbDM0aWlLQjcza2ZFSkhuMER1Z0YyYUxaYnROTEs3TThINDdra2g1ZW9y?=
 =?utf-8?B?U1c1WmtjVGVEWTJnZGtHNUptbmJRYmF4QklhdStQN1hHTjhUeXdTd1hqNU0z?=
 =?utf-8?B?UHFtSE4rUFhPSW1pTkNBSnRlS0dBVzNRTlJqSy91bnU1WTlkNEgvVmVBQkY2?=
 =?utf-8?B?OHEzVWxmd2Z1TTRZNXBmN2NpSnF3bWVwb2M0bmpPbXhsY3Q5VC9RZktpQThZ?=
 =?utf-8?B?VEMydUNGWFhmdHVmKytUL2NPanpUZkQ1WHFJMTlFYUlERGM0OU1TNTNrMmxF?=
 =?utf-8?B?b3cyUFlWd0k1Wi84VmxtTENOZWQvOXF5dnFqOHJNQ0d6NmY3Sm54emlkSEhj?=
 =?utf-8?Q?bZh2aVJC/+I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjdlZUVxeHVuWmJrR3U1UmtQVCtqa2drd3Nadzc5d05lcm1vVkFMWVlEcklZ?=
 =?utf-8?B?UDNMcjB4cHdRT3ZXMTVSL1Y3bkl6b0JRWUZvWThxTHR1dUFhemxDNWVpZ2xs?=
 =?utf-8?B?MjBQb0djYWNWUFJuYjVIekwxdEh4dlkrSnBWRy9vbGt5WXVnYk1VdUhmdVVB?=
 =?utf-8?B?a1c0d2hWYm51V1BMK1QvQk1JbkxablFUbW5kOWRpZnRzbWRScGZWeWRkM2c0?=
 =?utf-8?B?SGNBM2hYQWgxWVc3dzNBcnlnR0RoVXZ3ZTduMFVDWW1hYVdqenZFQXVBNjFp?=
 =?utf-8?B?bW56dCtCUm5kY2dtL2wwWHc1WGdQbmk4ckpPVmp6QXo0WUQrakx3Y2FTMU5n?=
 =?utf-8?B?c1puOXlySDRocEcrWHJCZHZLSUJqMjZTQTRsLzRhS1h0M1J1UlZHY1lPazdB?=
 =?utf-8?B?dGc2SmEzVk1xWFcrbVhzNW0xVmRJbENXVm1YaHRFcEpQK3pLbUpqaVgrV25k?=
 =?utf-8?B?UlFOd0FaRkR2bUJJR05kQWdJSldVUU1QTmNFRVplcmRsK0lDeEJBeG1wbHAr?=
 =?utf-8?B?djdYMEtObmRzRGFXV1ZjZldKeDFja1VkYkJpSU8xTHl2aVp0QnJXTHVKMkdW?=
 =?utf-8?B?YjVsVEV2REtEb1lJQmk0ejI5djgrcUY1NDJDbHptS1VoN25jbWc2a2tGWmUr?=
 =?utf-8?B?MmhEQzlvZnJ2TlhRcDJvY2Y4L3FYdzRPTEZSVDlXTXlZbDFGODMvQkhFcHdR?=
 =?utf-8?B?UkFXKzRMeWZxblgxYW1VV252RDU4YldhaXZRZDE5c0FyVVpQYUdhUHk5M1cv?=
 =?utf-8?B?RHhsN2N4cjdxSDRVbHhDS09Wb1NBQlhJRTVzUTlvWWxWY0RyWlJRTExha1Jk?=
 =?utf-8?B?Y3V3R3o2a3V3a0ZTN3RGVDZkUDkxN3g2NTB1Ky9UQng2Zk1BR2hvNTZTaHR5?=
 =?utf-8?B?S25DM3FYSkJDeEN2aDg0cUxXdFdqaTl0QWsvRWhPRFRqU3lheExzUFNWVkVT?=
 =?utf-8?B?ZzhzOUFaWTVYMDd6eXZjTndmalJoaWsrdlVyV3FwV2lvc1lvUGRPRmFSclRj?=
 =?utf-8?B?MkZSUStkL1VBTWJDa2h5akUvM0hYZlFsWm9QWGtzam15blBrRW5jQWdQMmdN?=
 =?utf-8?B?WVh5RjBOQjM1bVlmOTMwa0hsUm45bm5KSGFyLythaHpsZlppdDFzWndYQTlN?=
 =?utf-8?B?R2VITExZQTZIbWRJZ3FGcnJaOG1yNG93SUdGVkROSVBOOGwzRDc4Tk5Rc2NY?=
 =?utf-8?B?Y3g4ZnIzV0tMc3N0YjNIYjMrY3RoZytXVFFhcWFEd01UVzNvZ3pVSFVuUGFn?=
 =?utf-8?B?UGs4SG4rZWxOWldaUmpLOTBidlJpVG9yQ1hmbkpQc3N0STU4ZjRva2M2Rnk0?=
 =?utf-8?B?alRneFhLQmdzakdJeXFnSHVETHFvN1crWDBkVENHQjRkVFZqR0FGeHJjM0Za?=
 =?utf-8?B?ZzY0TXc1Z2w5R0xLZmFjOHJYT2o5bmIwc20rWU9iSGFBTGNkVUxvWmVBQ2lQ?=
 =?utf-8?B?NzFDeExoT0hPa3NkNFFLa1Bua3hub1hIc2lJNkowUm90N2ZFWmRWbHdIK2RB?=
 =?utf-8?B?aStkM2FwaytjU0ZRT2JEVTNSZFRiZTYvaGpsNUtlRmZHNFR4SVYrZlQvcklS?=
 =?utf-8?B?RXlGUks5eWRTYnRVYUpJTUNsV0h1SisyK1JRcXNNRlFoYURUV3FYZFhvUkRL?=
 =?utf-8?B?eUt0YkxVYTBqdGU2OSt5dGM5WFpiM25NQjF3QWVRUU1CU01DZk84TTRPZFc2?=
 =?utf-8?B?TGxhY2xOQWpNQ3BkNmNtVmpTR2UvZXk1ZzRBUnFQazhjSDNuYXJMSmlxT3lC?=
 =?utf-8?B?cVRlY3JJbkpYUXJtZHV5ZTZURTJKZDg2clFFWkN5b0IyM3BOS0RUdjlCYlo2?=
 =?utf-8?B?eENRbGxpK2xwS2hJS2NrMlp1TkU2eURMemlWUEJOZStuSmFRVFZuN3dGbG9V?=
 =?utf-8?B?Uko5anloQ0J4V01Kc2hxbWZ6UWM4MnNSOVFTdWxCWTFqdHNaSHVWbERPNFYx?=
 =?utf-8?B?MExQaWdHQkVmZnRXVUlvejV1SVFDZDZjWllGL050VXZ3My9oWm5zZDM1cUdL?=
 =?utf-8?B?ekZyKzVaOXVheWd6R3IyTGFGN3hLckVXMEVQNG8wVzFUZnJPUFhWckdPVkpH?=
 =?utf-8?B?NVRMRUhrcGFsODloZkpyYjRjMU1nWmxNK1RFemx2blByWVlxM3lZNTIxMXl3?=
 =?utf-8?Q?t2NEFv22NNIcOvQJzNRetA/WH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb3640e-eb91-4361-2bd8-08ddb8bfd9ef
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 16:53:49.4908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBrLOlH/ThN689OYCEhyRxuz5AvDgojSBACqUa7jp+pecE0RBddcpqhR8XF6kZPLCyuEa2qyTe7D8husWf66OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138
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


On 7/1/2025 8:50 PM, Jeff Hugo wrote:
> On 7/1/2025 7:02 AM, Khatri, Sunil wrote:
>> [AMD Official Use Only - AMD Internal Distribution Only]
>
> I cannot review this message with this restriction.  In my opinion, 
> your email client is not properly configured for interfacing with the 
> community.

Hi Hugo,

Sorry for the email client issue. Fixed that and sent v9 patch set with 
right format and also attached the cover letter too. Hope this clarifies.

Regards
Sunil Khatri

>
> -Jeff
