Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHWzDslYgGkd6gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 08:56:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4DFC9674
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 08:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023B110E237;
	Mon,  2 Feb 2026 07:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="buFQwhfe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012026.outbound.protection.outlook.com
 [40.93.195.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761E910E237
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 07:56:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lg30aNdEKJ4+A8puDJ0HKvWs+KwsZlqzDBdI1vDYEUzYHnHw51zXdJDnvmXphKNlWkgzxETVtcE1zt3jYE2DVEwE7u6k1EWWqrTT1gFqlOV30ntYKen4uKkgX/NXuUQQ3r/x8aHMZ7+P4dzUYfdGmqi9dBfAgI+KujxwSJlckQNulz++GzsOJMtUjI6d52eSYaGpbfCMz+yTEFBmdlc7VTTbu72NnFOI0rjXT1SyVWLK3PsMZ56OoYWOIsMxpwp2rhTRvXMl2W4+0rv3b1nzTVIgiC594eD6RjCxPfBP0LqAWHYvPtfITdTFtNdY6kSgthMUOaktrxCcNhL+/cj40A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1argCWlqaCqqHQ5zXD+RZETgiuL9+Zu60xhBGKVLuBs=;
 b=qw80jhb2qORch0fVrydDxykKexlfElU/7x/3dm09Gnd94By1MseqJAFLO/ONHTQ9yYXO8vl0v8ovXW/i8lK6QaUnXvpmz7Gml3+RmLccD4ToK66Fv0s38eqQqXae8QDDHF2U8gn26AXllaNocniLAA9chC8X6EddadcSC7DheRse7A2Ay6Lo41icrQgNKK68IrfBpwmCs1pAELaT58HTmY1ZQtn4M4PSVcdCS3vbgLmLppWREmzZkCinQkEl74VgDx/dPTQS9+bOnRe3XjwFb7to33Q2snukoetBLKGbkFJxEWHVp0Zm815n2eUgCR+/3QNi82SxtwrSLYoAq9CKGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1argCWlqaCqqHQ5zXD+RZETgiuL9+Zu60xhBGKVLuBs=;
 b=buFQwhfePrBe+QkOr0RbcpXGPcis9HL51JVbEETQ2E/MetpRZMx33nEv8Zw4Woa2ivyD1s5ve86/aLa3bC8iqWRJIIZ3N3sx27s6NBYY9+Hh3ysznMU0Mzlrh6isbw4NDbVj31OKBMTfu4yPObl46GLebUSzxKpYtg1KksDt9x0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by CY1PR12MB9649.namprd12.prod.outlook.com (2603:10b6:930:106::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 07:56:50 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 07:56:50 +0000
Message-ID: <a1dc7f3a-376f-4910-b6ae-8ee733bd598f@amd.com>
Date: Mon, 2 Feb 2026 15:56:44 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: Ray.Huang@amd.com, dri-devel@lists.freedesktop.org
From: Honglei Huang <honghuan@amd.com>
Subject: drm_gpusvm: questions on multi-GPU support
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0360.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::6) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|CY1PR12MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: b02271dc-d198-469b-3eba-08de62309f0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blNZanJpQ0JDV0MvTTBRenNRQUdKYSt6REVpaXlvdmREa3kvZVZHODladnly?=
 =?utf-8?B?SU9RRzBQUGxRMTlJVDZrSHh0Nm9xYTZjTzNQSkNyZ00wNmZEYXJqTjRkS0to?=
 =?utf-8?B?dG1IRStrOWttSFRDc3JRV1p6QVBaK2tMZkdxQS9lZmhXd3BRcUxFc0Fsejlv?=
 =?utf-8?B?WVJlQXR4bFdvRDJkM2R4T014MXdBUC9PQVpKdkJSKysvQkNoR1Z2Y3JBQkRi?=
 =?utf-8?B?M0ltaHUyeGVwWmhrVk9Vc2kxNlY3L0EyYjZVSkdaREEwWjBMK2cyQk4rcHZY?=
 =?utf-8?B?M0x1SWlVZ1pDN2xNSkxUL3BaS25ZYWpzQlRtbTF1TTIrRWVVNmY0VmFtRDhK?=
 =?utf-8?B?ci9JQW1KTVNGRE1EOW1VNis2Yk55QnZvdzFwUzNZMTRHZktWbzEvSGlpRHhM?=
 =?utf-8?B?dnZCVXBwWDZXZUZPUyt6OXJHR05vaFpmbzJkdnBRWXVjL1o5TUliNjBaYnN5?=
 =?utf-8?B?NVZDeW1nL2dYRUQ2U2p1UERtd3M5S0daNWxOYmNlYWFjN3hmYkxJaW5wTlNz?=
 =?utf-8?B?OVdXMnp0bHVCQi9OOWhsNWk1V2Q0QnFSZFJGQlVyeGRRVFlRS3ZQa0YyUkpT?=
 =?utf-8?B?NkdySFg2UWRuNURnOXZmSE1GeHJaQUhyc2tvNGFyVG9aTkdQY2VXUzdWb1Zi?=
 =?utf-8?B?em1UY2kyZk1YQjEwQlFmUkF1bmtCMk4xVzBSRS9BM3NNcGZMM2hPZ29SRGZP?=
 =?utf-8?B?NGFsNHp3UytPZE5EZjdWT0l4UnZMV0xKQUM4RC84c1hDRUQzTWJNM2dTSHBD?=
 =?utf-8?B?U200bDNlZ0h5ZlpmZVVmanNPcXdTZlBPaWh1UWFqcmR0Vkg2WEwrWTFqK3A2?=
 =?utf-8?B?QXFjQ28rU1REOVdVUXdHU2l2U3ZXc1hZb2VkdWt6U214Tm1RdFVJSGRpQ3o1?=
 =?utf-8?B?K21nSzZVTVNFVEJlSmtrNjFDUGV3TXZNcnh4TlptdHVNdXk3eFdydDdXYi9D?=
 =?utf-8?B?cnEycmIyMlpwczJzZjBBTG5lQTRNTUdQbnJNbWhjMXNZOEg2cFZwcFpsY3NX?=
 =?utf-8?B?K21taTNkZ3kzenVsRjREQ09uOFNjdEdvdVpYM1RMTzI1bTdHaVI3T0l2Y1pu?=
 =?utf-8?B?ampWVnYySVBGWmZBUXVvTVA1NldSV3pwUkM5V0lJOUFnT1VWUG9SMG9FVHIy?=
 =?utf-8?B?T0x1YkFJVFM2cmk1SHFzaFVQZ2tzNmxraXo1eWpBYXpUdHRkSEhYZ0U5Qit3?=
 =?utf-8?B?VmV5Q0pISy9ULzEva0RodTRqaGJmaWJCazVhdzJ5VkxFdG5tTWNsNDJoNGNP?=
 =?utf-8?B?RG8rSUVsaitpeEpuQlljb3ZHRjVNVy9MYWgzNjVyYVkySC9pM3hmWUd5dUVw?=
 =?utf-8?B?TnRHTGc4NVp2cVJKZmlhT2tkL3Zsdlhid2paeUgwZ1pMZllXU0loT1hzS1hW?=
 =?utf-8?B?Y2hWTjR5VWs2NS8vZktaZ1JkaWQrOGs4c3MwalRRa1RJRUhvQWN5Z1h3dFNx?=
 =?utf-8?B?VzZEdHV6eWFaQ3c2MElrMmZTcnppcmMyVWVqaWdRRHNQcU5CZ0pmT3IyTmgz?=
 =?utf-8?B?UEM0akhJSVUzKzJObjRlWkJTWUYzaVpPbHFOVXlSV0w4Z05POHN0Skt1T016?=
 =?utf-8?B?TDN0M3l5dFhTa1I0NUgvSzR5NzZjN2x6TldYbFg4aCt3OFhFaGRHMWdueTJJ?=
 =?utf-8?B?MC9aRGlDUUpNaEdmM1M0ak1aYzlySVV2cG01U0lTc1NRemhxVjFod3NSbHE0?=
 =?utf-8?B?akR5djIxd21BSXZzZmlETVVYUGNOSG9iMmhEUmsxTkZ1V1MwU1lXemN6QTBq?=
 =?utf-8?B?ZEtsKzdCNVkxaS9hNi9uOXptVXhQd2FzOXpBQ3lzWjFEdVJKVmxISmtZMU1t?=
 =?utf-8?B?TWdOR0hQM3VmWDZPdURYR1h6K3d1bXFod1JHMU1hRzlNZlV4aXNuL0RoWCtS?=
 =?utf-8?B?VnY3VWVSNmt4MnBRSUxUTDRwNkMyaFZ0SWZpMzB2Z09uRXloYXdmUS9mNHJ2?=
 =?utf-8?B?TVFmSVBDVDlQaVpCTlRkRXZ0c1doNm1nVHZCeTdlWVEvdDBBU3lERkZOOEFr?=
 =?utf-8?B?RStZOEcra3d6Nmk3ZE1xN1BMOXRQSTRTc3UzS2FGOVRxcXU5TkxsUVN1MFVT?=
 =?utf-8?B?NDdXaFFhbmk0ajlMRjhLZnJxZnRhWHlraVhiSGVxYldYVm9zVE5nREI2YUx6?=
 =?utf-8?Q?J4EA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzVkWnZwMlAvYWZKQXN6bjJjVUR4T0Q5Tk1sZjg1bmtJRnlMdU1RMlZZTkVC?=
 =?utf-8?B?REJwRnU0RUd1VGppanRWb2ZKNnVMcmthenAvaWtLR0UyWFkwRXBQb2lBK2NC?=
 =?utf-8?B?WWgvNERMUXBBV2k2MmhhVzdqSEw5MDF1S1dCS0lLcDJMZkkwMVBXclRCRW5S?=
 =?utf-8?B?bzUyS252NjRvQTBYY2Fmemg4OWZGTUZIYTBpanNXVXljWk9Vd0RraGk3eXhL?=
 =?utf-8?B?aWZJdm05ZDl2UHhUUklRa2VWY0lmNFZDaGdONXZNQ01WT0MrSjh0V1JsS2Zx?=
 =?utf-8?B?ajNFODNNcFlQRUROOVpJWWgvRVA3Wk1JOGIxUUxsQmE2T01rWFRhbDE3QllT?=
 =?utf-8?B?ejg0bW12S054Y3ZpWVczZ0lLQTVkaHNyNUVqa0lMUUdGTHFLbjlVOS9KbVpi?=
 =?utf-8?B?bHZkUFpKc3ZBa1BKbU9tK0liNC82ZzdHc1o2cy8xcVRFMFdkdEg3cUhBYTJl?=
 =?utf-8?B?VjVPZVh0eUU4b09LZEg0RDNLOGE2cG83c3VaQWFsSURRZjNaVG43T1ZXcTFq?=
 =?utf-8?B?YVRzVmpvRUVzYTMva1VOUTRRbEREL1RidUF3Q0hPeHlZUXF1dXF4LzZVS2Qy?=
 =?utf-8?B?dk5VUHZTWUZQY1pSTW90L1l4Rktibk9nblFQY1dYNDFraXVMeWdybFltSExn?=
 =?utf-8?B?T1lqaHk0Qkg3VkJCcG9QYkZuN3U5UzhFRGo5UWlqYkdCRmxNclJtOGdhV0hI?=
 =?utf-8?B?K0NyYTVwTDJCQWxxTkF0amw3aDVTell1SXJCaXU4ODZkeTVPZVVDM3p1MVhP?=
 =?utf-8?B?UElpaTF5djNZUk5KcGFPLytNcXpGdTdVWEtnQ3lpMitRNFY3QVdWU3V5SGhF?=
 =?utf-8?B?VElhUFkvcXZBY3Vaa1VoOWdyRVo4QkF1VTFIMllxdkg5MkNWTHZlZEtzOWVJ?=
 =?utf-8?B?KzY3RUsrZXpDQXRXeXpqUXJCY0N5OTNBQjI2L2Q0MUdFSThnQXZCYkg3eHZu?=
 =?utf-8?B?VTNUWWFKSXZ4UUNKdmhEU0pja251M0ZQWDArbEZ1bk80d3hxd01RejRqM2tZ?=
 =?utf-8?B?M1I0MkxVM1NqM3dneUlEVmRBR0xqcHV1Yk9EVjRBS3BMSTBOK3VpbnJkTzlJ?=
 =?utf-8?B?YWJleEJQZTRuL0hlUDRaWXpPV0JkRVBzYTU5NkZQR2ExRmpZekgzZGRyL25N?=
 =?utf-8?B?dDlNdlVRUW80VUlRbUw4TWUyeXZvYWRhamw2aEk3dVJsSkJWc2ZCQkJmbTZ3?=
 =?utf-8?B?ZndkREE1MDB1QkVrVGJsNW1FcjlCbmNnYzN6R1J5c2lSK3ZYQXcwSGhpNGpk?=
 =?utf-8?B?NVUwQ1JMSlZFYzU0aFc0aTlCV0docHRZRktoMVBaT3pxaFNiS2o5OGVVcGxl?=
 =?utf-8?B?SkNuSFJlZm15dlphSURzdjRKVTAvZklSQjc4dWNIM0tuN3VuVHJTeXBuM0VI?=
 =?utf-8?B?V0J4SXBJcDJHSmtScERvemJBYnBuMEQ0cmFIRDZLa2FnWnhvbnAwL2c5Uy9L?=
 =?utf-8?B?Rnl2MDFmRGQzN1VESHIyMzVZbVFja3gwT3cyNTlxMFJvb29tS0RSZEdCQXRp?=
 =?utf-8?B?c3dQdFJNQ3ZpOXU3YTVSQkp4VjFYczBkQ2orbkR3OW1Ec0J4T3VjbEZVN0pj?=
 =?utf-8?B?Q2VaclY5ZHF2V3NRQU42K0FKdGx0WkRlUEFOOVorV25Kc041QzRqclQ4VVhq?=
 =?utf-8?B?eTRuYkJISjJvbVRjbGlKZWtTNGNYWXNMWTVmNEU0TFo3NWpjT21YRWpIR1oy?=
 =?utf-8?B?bjMzK2dzcVZib01lMklub083RERWQTNXM2x4dnNvZXFPUmRDWUhwaHpoKzds?=
 =?utf-8?B?ZFhrUjlERm9PMzg4RGdPcFF5cEJ4MXZEN1E2T2RjSTFWbEpMTUNYQjJhZjBv?=
 =?utf-8?B?QnFFT2pWTE5Ya1F0SkxXL2haUzhaYWxJM3FVQXdWNHgxQlFEUmMyMGxNd2Rn?=
 =?utf-8?B?ZTdCL0xjUEgvOWlkSnEyUGl6RS9PQ3F1NGVOL01RSXBZNDBTNlNWWUlzRllU?=
 =?utf-8?B?eC9IY2lkeTUxSTFIamtkSU1keGUvQ2lHSi9iSzJQNDVkTlBuVFpzd1dZQzV4?=
 =?utf-8?B?TkxiTmZCa2s2OS9iY1JQYnQyWUZITGhkNCtQeW9QTklFUTV3UDdsRkJMdkVa?=
 =?utf-8?B?d2t3OHg0Mnl3Vlo0SnM5TDIvbVdDZk1VcmVJMFNuOWF2YUN5Z0l0Rlk5cDJ0?=
 =?utf-8?B?RmxHWjV3MEwvUkxGMzFaYkRTYUVkem8xUFphOGF2RCtnNGV4a3YrRXN6VmJh?=
 =?utf-8?B?U0lGMk5mNHpYVTZEL0hoZzB4T2l3NnFwNVVFNHF3dzVsdmpGOGFScE5MTEk0?=
 =?utf-8?B?cmRNUHdaMmE5MWJDeVF3WjdGVWNiY284YitzaEdKem9sOVk2d2tZdWIwRWsv?=
 =?utf-8?B?TjB4WlRLelA0OVJ1WXhoQ2dsdDJQQ2ZBVmE0djB2YWlnZkcrNmtkdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b02271dc-d198-469b-3eba-08de62309f0a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 07:56:50.2717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QeFOqjx8ng2lnAEJEbTdjYhaGcdMW+MrOinoJtRbYaCraaeZz0hMKcW65p17NX2MsaArbIw+2FbY/t4zW/tQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9649
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:Ray.Huang@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[honghuan@amd.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[honghuan@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9B4DFC9674
X-Rspamd-Action: no action


Hi Matthew and Thomas,

I'm exploring the use of drm_gpusvm for multi-GPU shared virtual memory
scenarios and have some questions about potential synchronization issues.

The drm_gpusvm design is per-device oriented, so for multi-GPU setups,
each GPU would have its own drm_gpusvm instance with independent MMU
notifiers registered to the same mm_struct.

When multiple drm_gpusvm instances share the same process address space,
I'm concerned about the following synchronization issues:

1. MMU notifier ordering: When CPU modifies memory (e.g., munmap),
    multiple notifier callbacks are triggered independently. Is there any
    guarantee on the ordering or atomicity across GPUs? Could this lead
    to inconsistent states between GPUs?

2. Range state consistency: If GPU-A and GPU-B both have ranges
    covering the same virtual address, and an invalidation occurs, how
    should we ensure both GPUs see a consistent view before allowing
    new GPU accesses?

3. Concurrent fault handling: If GPU-A and GPU-B fault on the same
    address simultaneously, is there potential for races in
    drm_gpusvm_range_find_or_insert()?

Is multi-GPU a considered use case for drm_gpusvm? If so, are there
recommended patterns for handling these coordination issues?

Regards,
Honglei
