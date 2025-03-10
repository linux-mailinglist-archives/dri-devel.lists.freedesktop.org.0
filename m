Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8653A5A3F4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 20:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2494210E4D3;
	Mon, 10 Mar 2025 19:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Fs5k4Zy+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2081.outbound.protection.outlook.com [40.107.96.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27F010E4D2;
 Mon, 10 Mar 2025 19:43:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WrEnHf/bP4T4zOr3Vvk1jwCVaRcpO+5FKHMH6r1nZ/w8FxKMPgPrQfj5xCAP8FmrIINmCjrRR0Znp1urqVBdNskFysLERcRGDkDOpuLwyG+rDUM8zEuVqc3UCQyjSxLekKwlZhzWqY9DTXISvayjVfQVeTQXRdXAKmwqshTCUEZNcgjaiMOJNxsReUudAociZXNU59vwYxNWka2glFYCh1BCHkgxRNXiU8FvYw5xWtQMO7K6N5pVGZ/18XAU/xPaa7prKK+uquXsBEMe1BLFTeH8/mFRiB/lFQThN393LIKJetk4u9MLTiLFOoZYXpgpMpF5fUcnWJNbXq79mVUV7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQDnIxtLJMHBjscHgRIsfojJ/vPgrhxZX7aAGxVFePs=;
 b=QpH/z8HW91sixBiFAw1xBeiGUIewD0WYhaVr+xpWtV26LrKBJNsAy6zlvRGHRrKEBm/S/LA34auiJBBQG42MsTqr0dc5+Nq6D1YXludPl0q6jYUWatE6m04cNiJv+Liii9+Hil90A7mdMkiE916k5ZckxBJ7Nmd3yxawrhRTz3j4ider7Nmme5rgTzDg86ZZH86wW+q9vjDRgYLF8y7FEUIuF3upKSjshrS5FxuTviNJiGLgoco+ZX6MRhRG+k2NIYud5t/T211sx5cU7aGwe57bOQPj/e9Ve3MGlXxrIBigpiJDidJL5MNespixZ8uTq/aSxRc4jL16cm/CboQlWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQDnIxtLJMHBjscHgRIsfojJ/vPgrhxZX7aAGxVFePs=;
 b=Fs5k4Zy+VmNKCtWDMhu+h1BV0VmdLJxuILpnEODTm4muH1EuAQg6J+c+Auni6zLnvcQXiwJR5pFkEB4L2GU5Mb1YWcw5Ta7JgKL1f2tO1SfJDnaxC7dGwwbA1FgTY6wLVnwqpRKvm3qvJ5UZtWkrvcJn1u94vpQbmbSfKTbv3Qo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB7558.namprd12.prod.outlook.com (2603:10b6:8:133::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 19:43:34 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.8489.033; Mon, 10 Mar 2025
 19:43:33 +0000
Message-ID: <5773086e-6e45-4533-9751-9e43cc9db145@amd.com>
Date: Mon, 10 Mar 2025 15:43:30 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 14/45] drm/vkms: Add enumerated 1D curve colorop
To: Louis Chauvet <louis.chauvet@bootlin.com>, Alex Hung <alex.hung@amd.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-15-alex.hung@amd.com>
 <c2002ae5-2d03-47ef-9742-3dfcc1aa42cf@bootlin.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <c2002ae5-2d03-47ef-9742-3dfcc1aa42cf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::16) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c2e0618-458b-4a8a-84d7-08dd600bd7b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGIwbWRZNHVhSmgveDNwRHVoSXFJcG5DbzE3akxPODVCbkZDNGJLZmtmM3Rn?=
 =?utf-8?B?Rk4xdEs5QjdRSFg5aDRBSlRLZ0dodnY3RnNJMEZWeEtpcFJLNkVjMVdSUUNG?=
 =?utf-8?B?R2lJT0hwa0l0T0ZpVWdVYjQ0Mk03U3UxVnZGVGdWS1hJQjFaQWloWkV2S0lT?=
 =?utf-8?B?cVVhekppVzRES0tvanNmQVdiSVZvZXVSTG1qMmVyeW54VVh1ZjR4STdwcTl4?=
 =?utf-8?B?QkVMblplekJsRkRReG4vTXFPZXZGeWo0SW9Eb3BLb0RyVm5ickVwN1p2Nkta?=
 =?utf-8?B?UERkQUViby80Nmt0b0xaMEhmUTFKVFVpTGFBdjBVekZqMjNGbFBJUWZTcU5W?=
 =?utf-8?B?L2hmVTlxZFhwTFp5alBmbkJTdUlWbUxyb3ZJQ3FEUjJWSUNtcmQ3TStvS1FT?=
 =?utf-8?B?bHFPcEdkNzFwRU9sWVl5S3BjVG1NN1pZUHRRUEJ6blI4allMVkJ1V1p3SUhm?=
 =?utf-8?B?cWhOSGp1dVVyUWdQeTU4NVcwT1IxdS9UeTZFMzVDWGp6ZzJnamdyaVZnbmNJ?=
 =?utf-8?B?Rlh3c3JRSjNTbFlXeWJldkkyd0I5YzNHU3VQOExxWWplM2RnaXQwWEl2VjVa?=
 =?utf-8?B?b1ltQWxOUjBwK3R5K1hDL3JGSm9WbWxnYlJqUTA3MEFMMG90VDZXZWtQbHRJ?=
 =?utf-8?B?VllWUDdtRDVMSktVdkc1S04vV1hWV1REZlZOQ3I4dlpsRkhnejFKRS9TS2lK?=
 =?utf-8?B?MG5BOUIzdDR2cXNHb3ZVeXN4YWp1VTdrRlgxcUpwSkJTa0FTV3Y5V29qK3k5?=
 =?utf-8?B?VDR6enNUSVhuS0tNRzl4MktKTDVMYm10TnhkeTJmUXpuVlRrRDJ3M0Rld0xx?=
 =?utf-8?B?NHY5WVBWN0lKQ3Fza3FabXhRT3BLVjZzYXp5UE1UMUdHWEE4QUkrVUM4ZUl5?=
 =?utf-8?B?ZDlrR1BHNjBGOW5FczdRVTh4OTRyYmpscG4zeTZPdi8vbWN6UkoyUTZDV1Fl?=
 =?utf-8?B?SVZ6cXpyZFdTMmcyOWRKWEh3eTZmcS9XeFZnUzA0YUg2Y1gyUjBRWlBKSVRl?=
 =?utf-8?B?eFZ2OUNiOS8yZFJnNHBFeDVPSXYxbXowTUZIQUVkWFJJNCtCM0lVS3psSjdR?=
 =?utf-8?B?SWtKMFdTaTlHaWp5ajJLUFVlWi8yL2l4UE9leURuY25jUVUwclU4azA5NVI1?=
 =?utf-8?B?TndpMnI0RXcvWU1BRk8rcVpOeFA1czhBczhHUkZvNCs1VnRpOXdieWljVDgw?=
 =?utf-8?B?OWNDL1gwbFZsVm80MlczR1k1QVNaSit6ekVsMDJRczJSRUc0cDBzdUZLalBJ?=
 =?utf-8?B?Y3BpRGtZYVhDYVpTZ1JIa0dpTlg0d1FXb3JvMEdWRC9tZmREUWZCSUtvbUVO?=
 =?utf-8?B?U2grTHRBZWVYZEY1QVJJWVpSejg5Q28xeC91S1ZVRGs4a1grVk9kY1dFVWky?=
 =?utf-8?B?U0NHa0NiVkxxZXh4aEhGS3hkQ3JyR0o1UDFidXMweksxc3hKczl3MDYzVEcv?=
 =?utf-8?B?VXFUZk9PM21tRE9HTStOTUFlSEFzbWsyREtCcEF6bWVDbVA5UTdTWGdwMUF4?=
 =?utf-8?B?TVNETnRTWmw2bUNYc2NEQkZhdjk3cTZaUHFzUDl2RENDMGs2czdWVU9LcVlN?=
 =?utf-8?B?MDVDKzVpNVk4SGMzem9iZzdYSTJDRGN6YkJXRS8vMjF1Yk5FSmtRUy9RUWwy?=
 =?utf-8?B?S1k5R2lzS2VFbFkyc3pNdlpHMTExYitGYmEzNy9kTlBQbDgwdG9iUmZmcVdL?=
 =?utf-8?B?MzIrUEkwWnFmOWhTT3grYVhPS2IxMWo4Nm1FZHBkQlkzTnBQQXYxUlk4UVg4?=
 =?utf-8?B?VFZVVk9JMEMvYUxNUm1iKzBEOWhJeVREL2pkL1E2S25haGtnUHhVWGNNa3Fn?=
 =?utf-8?B?UWdUVC9TZGZZZHo1c2ZZQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTAvcHFWUytGbUM2c2hKYUNnUU1wSnBtdEpMajZwVmxaRnNBZHpKMHY0V1cr?=
 =?utf-8?B?cXB2MDZkUjZLY1lHdldoV0V3UnlKTGlqSVpFbEVrdnFoVGZTYndDSlFqUTJy?=
 =?utf-8?B?SmhSZ2dGL1pqZVZzamJRa3VlVHgvWllnS0I5L1VjMEFQQjQvMHpvSzJ2K2Nz?=
 =?utf-8?B?RWROaVVFSzh4UzBFdG42Nmc4czQ1bUo5S3E5RlNoNzZmcHlRZVlNNVowR004?=
 =?utf-8?B?WDNYU0FEcmhDRTlKZGdSL1BxOVlxRmJLaTU2WFFIdk1iVEUvYXl2akNmZnNV?=
 =?utf-8?B?a3RvaXpSSHFOcGR4SUNwNzR2Z21sN05CVW43NnFKamxLclJFdmhrSnJxdUhR?=
 =?utf-8?B?eGxRVGJrK3FMSURvd0JJMWtlZll3MVZWUTRlcytPS3lJOFZLY3ZUQkZMTXpH?=
 =?utf-8?B?UExuN0tCV1RiL0l1Ti9iRStSUk5uTnVzYXJteFNvVEUva2xzV2FGaUFJaTNQ?=
 =?utf-8?B?a3k3QU5iS3F0dVRMMXhqdk4zSmdQcmRXT1dENWVmT2xnRytTd2NsSmR5ZVRx?=
 =?utf-8?B?aG1Cc1dZWEJhSVQ0aWJWOXBXVXdYVjFsOTF6amIxY0xvNHRpSTE3Ykw1bGRt?=
 =?utf-8?B?Lzh4RmpLYlRIM0Eyam02VlV0UmdiTTRsL0VNMkVsUldJdFJXbDZ5NWxBN0Zy?=
 =?utf-8?B?a0YxOUZpTlZ4N2k1NklyV0kxN0c1YmNWTjQ0Umd3WHBBVDZaenZ3b0hjTldF?=
 =?utf-8?B?YTRFZEx2TWd2WG01ZkR2WjltRHNlYnJtWmI1Z1ZKVGk2bnZRSXJQWExJd1U3?=
 =?utf-8?B?OWtKUVRvSjBkTmpsTGlyRWIrNkZ3NnJYcHNZUmEvMnNSSjBucHQrbGNVMUEz?=
 =?utf-8?B?Y2d4dEtaNU03VmlxZW1ZMndEM3FoRkZNSFlYSXlueWZ1elhyclZueDMxNnRV?=
 =?utf-8?B?OFBqMDM2d3lmOGVBajA2dmI2TjhTK2xBcEpmTGFBOTlSNXVXandRcmZ5cUh3?=
 =?utf-8?B?WXZNNVpvUHJsVmRXZWZsUUQvcUVzVGZRclgzUng1em1XNTE2WHBsemFhOTRm?=
 =?utf-8?B?OVQzajlYMzIyU2pDV1BBR0w0MzNSQnBBWnQrYjdxQ2p5UTEwZDNOSjNUcW5I?=
 =?utf-8?B?QTVnSlNRNVZwRlhrazFhOFNsNzdnZVJ1SFg4V0VWMGNLa1FjZWJZZUtaZml6?=
 =?utf-8?B?N2ZsdHdOUmlQYjZtcVhrYUtsNmlqTGFnQzN2WlpwWWFUdVNkckd5dGdLODMr?=
 =?utf-8?B?bDBFb2paN212UEM2VGlYS3I5eS9kRWpuSjd0SmFjUnZZeWhWaEhyZ3FiaXRT?=
 =?utf-8?B?c3ZCNzNMVVZrd3N5b3hrSUMrTUtlalk4M0dIelZMUmI4TTFhQ2JZRU9yOWNy?=
 =?utf-8?B?ckdEb3JMRGMyS1Q5elZGZG1KdzROakUxS0hONUE1SjVhTEJnM054K2JiZHdS?=
 =?utf-8?B?WUdrZGtzRW1KSkRTR1A2eTRJL2YxOGZCbUJ5LzNzWU13eVArWDhHMnhCK0Nv?=
 =?utf-8?B?dmtPOTNzY2Z0VkdoRDFBdzFZUE1oZXVZM3ZoUW51SjFHdFp4eE5IdE9PWElF?=
 =?utf-8?B?NWRmM0I5cUVOZUs3QWVZL0tJMW9XeEgzbVR3WFJsNkozdjIxUGNlQVYvZkdx?=
 =?utf-8?B?Q0tPeU82RVNiOWhjeG4rUVduSVVrYlNUK1I5eEx5RmpSYkNvbnFwWE9MT01X?=
 =?utf-8?B?eW16aTgwSStqWFZqMHZYTXo0K1RzWTJJYlV1YXNSekJxZVJ1WUdEMUc3TzE3?=
 =?utf-8?B?c1FyaTlCbENrTndIL2RBenFHRGp5UGNUL0tXeFdEUVdPWDYvSlhFYTBiK1hj?=
 =?utf-8?B?ZlV2R0t5bGZ3cE13YjNwY2poREpFdkZPSjFvUHRURFFxMEFMMjhkK1ptZlY5?=
 =?utf-8?B?NldFNFMrVnBwWHYwRFpiNFJSRmxKeFI3Qk81cS81Nkhhc1BDbXNTNklZTUFZ?=
 =?utf-8?B?eXdkZlZ0YWxscExacElTa0E4a0l2OUx0L0xvOXhFRlhTQndmU21Geng2Q2JN?=
 =?utf-8?B?bW9CdmM1SHNmN3RtV2F3Y2pHTVlYMUI2WENKT2t5YTZNbUJDNkdyMUhIWGV4?=
 =?utf-8?B?TU5TRmc4T2FXclAyakNpU1BGcFlqdDNqT2plck1rN1hoU041S2JmUStsOWJz?=
 =?utf-8?B?cFpFb1lxbHhiaFpqWFU0TWJZTTRHUVBDREZ4cnlJbHF2LzRVMkFGeERKbDEv?=
 =?utf-8?Q?x0HAezUqpaare3MTATvvBagv0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2e0618-458b-4a8a-84d7-08dd600bd7b2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 19:43:33.8478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8y+dScEsQVk1APm4CipLYII34fbJEaFr5jnG+H51j0kz3fRb6UT3K0McC5FksP526R2UJD2hVBEHV9lBbD97Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7558
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



On 2025-02-25 06:18, Louis Chauvet wrote:
> Le 20/12/2024 à 05:33, Alex Hung a écrit :
>> From: Harry Wentland <harry.wentland@amd.com>
>>

(snip)

>> +    { 0xfbfb, 0xfbfb, 0xfbfb, 0 },
>> +    { 0xfcfc, 0xfcfc, 0xfcfc, 0 },
>> +    { 0xfdfd, 0xfdfd, 0xfdfd, 0 },
>> +    { 0xfefe, 0xfefe, 0xfefe, 0 },
>> +    { 0xffff, 0xffff, 0xffff, 0 },
>> +};
>> +
>> +const struct vkms_color_lut linear_eotf = {
>> +    .base = linear_array,
>> +    .lut_length = LUT_SIZE,
>> +    .channel_value2index_ratio = 0xff00ffll
>> +};
>> +
> 
> Can you add a comment to describe the values here?
> Something that could help if we suspect an error in the values of the table, for example:
> 
> This LUT table contains values from <spec/iso/whatever>, mapped linearly from 0.0..1.0 to 0x0..0xFFFF.
> 

The tables were generated with a simple LUT generator
that's based on skia's TF code. You can find it here:
https://gitlab.freedesktop.org/hwentland/lutgen

I'll add a comment at the top of vkms_luts.c to that
regard.

Harry

