Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AB89DAFF2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 00:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C820F10E430;
	Wed, 27 Nov 2024 23:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C/z+ambY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE71010E1D0;
 Wed, 27 Nov 2024 23:50:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6/md4594JdrGoNN3cK7MKxyoFYICFQPaz9rjBSdhOip8g46lUdZeAKxOpxXrzs6md4sC5Hd/EggVZRq4apOCR4Rj6cU+OhiHdDjr5+Tdm7sHWw72Ywy/1z+lgMkINeWk+2XUxbznqf5P11m7EWwZCWQPmZaCYg3nlR2Vg+IJzjT1m6/VP7btgv73uqAvVU0P5xPeTMcHgXXSZfQXx6XQAUtVD4DuljBdnXPU+z9YxQ1uuSuhXGF+93zw0enYZ7xbgq6cF4HBl6TEJwomV3KaKQVi9twxvEy7xewC+M5GC0enzRnT7KFCWhOAeeyYK5kfTTxvn83XR6D/Q7f4QgDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ugfx1iX26dLLfk68JVY82VTLglyEtKh2iSSUB98jUh0=;
 b=xuwhwyFQM11rwdkpKbOA5nMNxCcq2wEsMvR/uN/Dk0XUkKKl+cW+a4+l3qKLimiQU8PA1cNfTo4+gXW9xHsRjlnCzQ1EVYVAhJTYI85jQyyGPUzz6ZZlwDvTE/dUZUAZSR0WZeUkQGQNP4WNjeKcRvwwdgt788dsSFTcY6mxAmGnjHuJ4kcJ3M8AVRuj7gvgg00NUi/PtUc13JQgR6qNtH58VyZ5Ygtmkdggc76Nl+EmWuh6YdHi5/kTJQwc5XZjmiMjMmS6BYYdXzvA4VrpAkv62dhSGTwXD5+0En05EtF3N95GWB34hapv5pfvbKXxH1M1GNGtUwoae3++6sEb8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ugfx1iX26dLLfk68JVY82VTLglyEtKh2iSSUB98jUh0=;
 b=C/z+ambYtM0zldzuzk5TPgM814e3usq0n00cQlhy3PMTOWnpfHbB0M5fw0blAdpB8WC9vM4ZfWSja/WpwtP1I3Tj5q9SH/20tFU86E0T775CkJ3u4vcCx1Hxe2PNItmxoxohQwpRcmmX97c571bApocP2JkTjXZkfA1k3Ls0hHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 23:50:10 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 23:50:10 +0000
Message-ID: <744cb13e-d46c-40b0-8d88-b223db5178da@amd.com>
Date: Wed, 27 Nov 2024 18:50:07 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] amdgpu fix for gfx1103 queue evict/restore crash
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mika Laitio <lamikr@gmail.com>, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Hawking.Zhang@amd.com, sunil.khatri@amd.com,
 lijo.lazar@amd.com, kevinyang.wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241127114638.11216-1-lamikr@gmail.com>
 <20241127114638.11216-2-lamikr@gmail.com>
 <8266003e-eb98-44cb-a326-1e4f688eeb4c@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <8266003e-eb98-44cb-a326-1e4f688eeb4c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::35) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MW4PR12MB5667:EE_
X-MS-Office365-Filtering-Correlation-Id: 9962f0f7-8b77-4a22-c8da-08dd0f3e3a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXdmRmdXR2RiTjBQbTFrRkpFQTM4MEJyT3J0OXNPaXV3NlRYTG1FaEdGVVVK?=
 =?utf-8?B?L3V0L2ZaWlpNd0pKNVg0VzFLeWNXTCtkMnR2M3hqWUpMbHVzRjdqdm5ra05m?=
 =?utf-8?B?T0lTaFZPanNJeW9rOUVwU2hEWkVmeXdqckNjbTVzVVlDNnZYTkVWTVlhZHJQ?=
 =?utf-8?B?MFpJK0FOTGhreW5jM2lYVG1reVdrYVpmdHcxK3F1SU9qWFBvUlNaUGlYbkFt?=
 =?utf-8?B?ZVJQMjEwV0h1TFlLK1ZQZFF6UXZNUHR3Y3dFa2wzZzFpWUhCZ3ZwMDZieWV5?=
 =?utf-8?B?UUFjeUhTa1dvVkYxVXlCMWZTSlBTZ1BYZTc2VVMreUcyNnJtUHdvd0U1ZnpZ?=
 =?utf-8?B?dVA0VDVIUHh5Ni8zMUMzSENQWjc5Wnd2KzgrMFV1M1k0MUt6VlNzNlpPNUNL?=
 =?utf-8?B?NnNUcThacnYvc0VlY2k4NkRxd21SazBCN3lNajFTamVHdUZkN1BGVkZJNjlP?=
 =?utf-8?B?d0JNWFVaTmJiTkoyU0R1cHVRVlJHUlAyZCtlNEJRWnR6TEVVR3VSVjF0NkRC?=
 =?utf-8?B?OStQcU9JYkNJMXhNNWZxUmxCOXNNTmp4WTRWazVaNzFpYzhheVI3cWozYUhR?=
 =?utf-8?B?TlNiLzBlUFFuOHBsSlZ0VWQ1MExZdndoYmFvSCt0bUV4a2I5RG5LQnBLb2dR?=
 =?utf-8?B?UDlrRTdqa1RDQ2dUZzAwUTQwS1JOT0FmdXN5SzlHMS9KSTF2d2ZlU3gzTC82?=
 =?utf-8?B?bGV5QnduNUZjT1B5dEFpSjBCcXFYQ01hdlZySExMVXVYTENHdURUdmhGb0Zi?=
 =?utf-8?B?dEhkMXZTeE5IMFhxVkUvNDFjZ0ZCRzdhbUgyTjlnOVlYV29rNUVWY2huUFVP?=
 =?utf-8?B?bEp5WVVMSzc0UkxSRzJuWXJWWXFqMkZPeWd0Y0Z4TzRCMi9LS2t3OUJLZWI3?=
 =?utf-8?B?d3dFRER0c0ZXeHFrQnkrV0daSURISHJ1NG42NFlzZnZFMm5lMUd0TGhhT3hx?=
 =?utf-8?B?ZUx5MmxOTFRjS2oxWjN0aDJON212amNWUjBYL0JkN3FFdGQrSjBVOW9uYWlJ?=
 =?utf-8?B?aE9vc3EyVWtpZFdiNlJHbDRLaTJQV0loNWlEOTNQSW90WjBWTEtSN2J2ME9j?=
 =?utf-8?B?K1FSU2pnMnRPK2FZWFhFOFlTVThqZGtjL3BoTno3OExlQlVnVlBjcDNWeXNM?=
 =?utf-8?B?UzhTNnFQYlFscXFOdm1lUzR6QmdURFE0UlBUSE1vL3RjYWRnOUhZYkRWQmEz?=
 =?utf-8?B?T09jQnZZYTN6Vks0aG9LclhNSTBmUmFpTjRwU0k0WVhIelhtREVsZkp5YldE?=
 =?utf-8?B?UzdneVNVa0xBcjVmS2xkd0YzcFFMaVhjRGZIcDlGTzRwdTBPNFRhWDdlUk1H?=
 =?utf-8?B?TE92bmdVbWQ2UW5qZTM3aGVZaWUzYnBXbTM1b1IvU25mdmE4b2hTbFpoc0tR?=
 =?utf-8?B?Z0s0bWhSVnVraTNZcnVPa285a0pFRTVndHhkU2lxRU82MHNWUlo3d1A3Yk1q?=
 =?utf-8?B?Q29iOVducWFlYzJhUDh6U1FKL0E2b1lwSDlseGtMU1FyUXBhdi8zaUJJbTRo?=
 =?utf-8?B?bDhpKzZBaGszNXYzUFEzZDZZdk5wWnJtYnZ6S1EzckdTTy9NQUxvM0dRcVp2?=
 =?utf-8?B?NW02MGJGODNZcGdqNXhQTDBtbGthdk9YaDZsayt3UmZZakd5VzJpa3JTYm5D?=
 =?utf-8?B?Mk1ERSsrQUgrWkZjMmVHOEZKdzJTQjJoTkZYcGo5bE5wVjBtY2d0WWRTaitl?=
 =?utf-8?B?Nmdub2xEU2hlSkxGYUtqc1JXUi9EQUJ4VXcwNTB1S3JMcGY2djlXY0xpTDlt?=
 =?utf-8?B?Nmk1TWFRZGp4VElxRjNxdkM2T1hnTHUzTC9scVRPNktPb0VmUFk5Z0pvNWg1?=
 =?utf-8?B?VnRQSStkcENUZXJ2aXFXK1ZndklLMU5hRkgzY2RBL0lrMHk3YUtuaFJhVEwv?=
 =?utf-8?B?ZWh6MzdXZDJ1dWsxelBkMVRpbVFZUkNKS21zL05yRlN1dWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFFYWUo1ZWNIK1k1dTJhaGREQ1RWSE5TVGZtVXUxUmpieVNETUIxQlhLVkUv?=
 =?utf-8?B?WkZzK0Y2WUxvN2pqdDNSTTIwWXJqNzhNZkVQT1ozaStLNjMxVVc3MkgxY0dH?=
 =?utf-8?B?RExONHJVWFNaSEZpL0VyZCthSmdyZUZSQ1NMczlSUlFFemlRNmtZUWt2Nmw2?=
 =?utf-8?B?VnkvNGtONWtnaHVZbnB6N1R5TUhBNVo1Y2Nva284TFI0UVBhTURWNmJJNmVG?=
 =?utf-8?B?b3pzL21oVkxrRTBraHJYbnFuVGhWMHVTNE85ZE1oN1FZbkRtMmJvVXlqRCtl?=
 =?utf-8?B?K2VUT1JqOTFhd0lEOXQ0bzF3bGFxMUJWN1FrUXNJdWMvd2lRR3RTTkRZaUZo?=
 =?utf-8?B?VHFnelZpQ2Mzd2hnVDltQnlBRUxmczNtMHdUUnQvWnI5QmhhVjlyOXkycDFZ?=
 =?utf-8?B?SXZBYUQ3Um1ZVVZvUU1ZRlFPYVE4c05oR3VEQmdDVzlPQmtwR2tleUI3bEFX?=
 =?utf-8?B?SldpeDhraWJXbkJzY3FycE44UVp4c3E5SFMrRndVaHZZeTJ2emxqa0wyN2ty?=
 =?utf-8?B?bDVzWEQ0YjNSdDJPdzRRc3huQ29LZW5MVHFIM0MwR0ZKU2gycjNLcEREUlBm?=
 =?utf-8?B?eEhYSUszbTlpOC9KQzZQRmZGMEc3SUdDTzNleDdCUENsd2kvVjlQRmxvaFB6?=
 =?utf-8?B?bnF5NTlXYUxiOXhwdkQ0SHZXTlRscWV1ZGpVMlhVQ01UQi85Si85MW5QVTQz?=
 =?utf-8?B?N0hVY0VYeDVvRGtsL3RISXJsRmE4c0NCczE4QlVxdS9zdE9LbFdiTVZ2S0dO?=
 =?utf-8?B?WVdyOW8vU0pSZWdvZXdXclJwYzY4TXdncnUzZVRXR0lsOVVQWnA0bU05cnJ2?=
 =?utf-8?B?VzY2VysvdE1HUWE1V0xnZ2c0aU00QW93cDJYcVpXTE12YjRETmtOejRCZ3dG?=
 =?utf-8?B?SXhYUHVvMVRtQzFaVk5QbThJcUR3c0NtSFpCNmw5WkFFUVBQdXpVcWM4S05j?=
 =?utf-8?B?RHNneHNsNlZSb3pUV0Jub2phMFRBcE1tSDBvU1RPaFg0dFpQK291eU81RXps?=
 =?utf-8?B?Z3JKSHU1ZkhGUFBnR003eU5MU0hmVjA2cHhBMDFYL2pkaFpZZVQ3UnNiRVBl?=
 =?utf-8?B?Qlc1aGRwTEVEQ2t1YzlRbVpOL252aDZIWG9lUXZUaXIwL1FUYm9Ba0pkOHBt?=
 =?utf-8?B?enlxTmJ0Z1ZjVkRtYWFsZEZpTGFWa3dUOTNlL0VEeGFXbGdFV2FiZXNHSy8x?=
 =?utf-8?B?MDd3TmJMRld1VVdROVpZa0lqMlNjUHd5UDNIT0hmM1JJQnR1OEdIcDUrdnp1?=
 =?utf-8?B?MDdEVzAzZHZSSEM4WUNCRnhSU0ZGZnlLa2NwdzdYUENhamFOVXM3a2IrQy9w?=
 =?utf-8?B?Z09sZFhNVldGNERYVHJGOW9lNjQvWW5FVTg5MU9ZVUc0Yy84dVJWZlRFeWxG?=
 =?utf-8?B?aThUaTlidmxFekt6Y3hOQi82Z0xuQnZoazhPZ3ZZL3Zwam5sYmhPaEk0M0w3?=
 =?utf-8?B?cXNNM1l5MFpKZVpwOVpPM2JGaWZ5ck1Cb1pNNFhmN2VFekxLNEZkRTNkV1hZ?=
 =?utf-8?B?YXhFUW42OENrVnpMV09NYkU2Nzk1RHU2MzExVUhtQ3ZwOGR1bUtCS0IyeEhC?=
 =?utf-8?B?V1FmWkd4U2pWb0JtNmxXcTdyd1FBOEJkaW54VDkydTFxZGdnRTV2MGZWQmVL?=
 =?utf-8?B?dlJ6TkpONkdISkh5SU5PNGt2R0g5VDRhMjNDdnJsVklpMVVFQ2pTdkxQY0Ns?=
 =?utf-8?B?SlhXUjhjNDB1MVVySTgyUGlyKzNKaFdpbjlUemhHTGw5L3lNbzBIVGt3dTNx?=
 =?utf-8?B?dWphZkVmbVgxd2xuYXZQZWdyalpVYUg2QmwyWWtFMmtrWmRzdCs0SGJDcjVt?=
 =?utf-8?B?alRPRDlqK2wwU2xTZE1oWWhyNHRmTFQ3VGVaVXhqM2szK0Y5UE5Hd1pmam01?=
 =?utf-8?B?aFllc3Q1YmxKUVhpZXFIQ2QxRGRodGhQeEtCNkVNZy9KMXNvZ3p0cnFWYnRD?=
 =?utf-8?B?cnJRQ3RWQzNTbElYRWZQem1JckN6Z0VHdmQ2dStyYVE4anhST0hYVjBob3JB?=
 =?utf-8?B?ZG1vZlRFMmdsY0p3Wjd1YzRTWi9wR1lJaTBwUzA0ZS9oVTJ5U2hjZFN4dEo1?=
 =?utf-8?B?OTJhLzhpMVJRbm5XNW5abmFzcVJXVi9GV0FYUmQ2clh1V0gxR1ZxOUZnK2ZP?=
 =?utf-8?Q?sntnXHtu5OIioVK0d2VT1uVDE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9962f0f7-8b77-4a22-c8da-08dd0f3e3a71
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 23:50:10.1084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FS5T7cHZs9jZJJ6goHzWfsaRDskRLUw4z2TTgRIXsJUNjgAtr2bQvBOBP6uQTbBI90DzufqzpZJYQzpbIfIPUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5667
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


On 2024-11-27 06:51, Christian König wrote:
> Am 27.11.24 um 12:46 schrieb Mika Laitio:
>> AMD gfx1103 / M780 iGPU will crash eventually when used for
>> pytorch ML/AI operations on rocm sdk stack. After kernel error
>> the application exits on error and linux desktop can itself
>> sometimes either freeze or reset back to login screen.
>>
>> Error will happen randomly when kernel calls 
>> evict_process_queues_cpsch and
>> restore_process_queues_cpsch methods to remove and restore the queues
>> that has been created earlier.
>>
>> The fix is to remove the evict and restore calls when device used is
>> iGPU. The queues that has been added during the user space 
>> application execution
>> time will still be removed when the application exits
>
> As far as I can see that is absolutely not a fix but rather a 
> obviously broken workaround.
>
> Evicting and restoring queues is usually mandatory for correct operation.
>
> So just ignore that this doesn't work will just is not something you 
> can do.

I agree. Eviction happens for example in MMU notifiers where we need to 
assure the kernel that memory won't be accessed by the GPU once the 
notifier returns, until the memory mappings in the GPU page tables can 
be revalidated.

This looks like a crude workaround for an MES firmware problem or some 
other kind of intermittent hang that needs to be root-caused. It's a 
NACK from me as well.

Regards,
   Felix


>
> Regards,
> Christian.
>
>>
>> On evety test attempts the crash has always happened on the
>> same location while removing the 2nd queue of 3 with doorbell id 0x1002.
>>
>> Below is the trace captured by adding more printouts to problem
>> location to print message also when the queue is evicted or resrored
>> succesfully.
>>
>> [  948.324174] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added 
>> hardware queue to MES, doorbell=0x1202, queue: 2, caller: 
>> restore_process_queues_cpsch
>> [  948.334344] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added 
>> hardware queue to MES, doorbell=0x1002, queue: 1, caller: 
>> restore_process_queues_cpsch
>> [  948.344499] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added 
>> hardware queue to MES, doorbell=0x1000, queue: 0, caller: 
>> restore_process_queues_cpsch
>> [  952.380614] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes removed 
>> hardware queue from MES, doorbell=0x1202, queue: 2, caller: 
>> evict_process_queues_cpsch
>> [  952.391330] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes removed 
>> hardware queue from MES, doorbell=0x1002, queue: 1, caller: 
>> evict_process_queues_cpsch
>> [  952.401634] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes removed 
>> hardware queue from MES, doorbell=0x1000, queue: 0, caller: 
>> evict_process_queues_cpsch
>> [  952.414507] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added 
>> hardware queue to MES, doorbell=0x1202, queue: 2, caller: 
>> restore_process_queues_cpsch
>> [  952.424618] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added 
>> hardware queue to MES, doorbell=0x1002, queue: 1, caller: 
>> restore_process_queues_cpsch
>> [  952.434922] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added 
>> hardware queue to MES, doorbell=0x1000, queue: 0, caller: 
>> restore_process_queues_cpsch
>> [  952.446272] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes removed 
>> hardware queue from MES, doorbell=0x1202, queue: 2, caller: 
>> evict_process_queues_cpsch
>> [  954.460341] amdgpu 0000:c4:00.0: amdgpu: MES failed to respond to 
>> msg=REMOVE_QUEUE
>> [  954.460356] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes failed 
>> to remove hardware queue from MES, doorbell=0x1002, queue: 1, caller: 
>> evict_process_queues_cpsch
>> [  954.460360] amdgpu 0000:c4:00.0: amdgpu: MES might be in 
>> unrecoverable state, issue a GPU reset
>> [  954.460366] amdgpu 0000:c4:00.0: amdgpu: Failed to evict queue 1
>> [  954.460368] amdgpu 0000:c4:00.0: amdgpu: Failed to evict process 
>> queues
>> [  954.460439] amdgpu 0000:c4:00.0: amdgpu: GPU reset begin!
>> [  954.460464] amdgpu 0000:c4:00.0: amdgpu: remove_all_queues_mes: 
>> Failed to remove queue 0 for dev 5257
>> [  954.460515] amdgpu 0000:c4:00.0: amdgpu: Dumping IP State
>> [  954.462637] amdgpu 0000:c4:00.0: amdgpu: Dumping IP State Completed
>> [  955.865591] amdgpu: process_termination_cpsch started
>> [  955.866432] amdgpu: process_termination_cpsch started
>> [  955.866445] amdgpu 0000:c4:00.0: amdgpu: Failed to remove queue 0
>> [  956.503043] amdgpu 0000:c4:00.0: amdgpu: MES failed to respond to 
>> msg=REMOVE_QUEUE
>> [  956.503059] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* 
>> failed to unmap legacy queue
>> [  958.507491] amdgpu 0000:c4:00.0: amdgpu: MES failed to respond to 
>> msg=REMOVE_QUEUE
>> [  958.507507] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* 
>> failed to unmap legacy queue
>> [  960.512077] amdgpu 0000:c4:00.0: amdgpu: MES failed to respond to 
>> msg=REMOVE_QUEUE
>> [  960.512093] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* 
>> failed to unmap legacy queue
>> [  960.785816] [drm:gfx_v11_0_hw_fini [amdgpu]] *ERROR* failed to 
>> halt cp gfx
>>
>> Signed-off-by: Mika Laitio <lamikr@gmail.com>
>> ---
>>   .../drm/amd/amdkfd/kfd_device_queue_manager.c | 24 ++++++++++++-------
>>   1 file changed, 16 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> index c79fe9069e22..96088d480e09 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> @@ -1187,9 +1187,12 @@ static int evict_process_queues_cpsch(struct 
>> device_queue_manager *dqm,
>>       struct kfd_process_device *pdd;
>>       int retval = 0;
>>   +    // gfx1103 APU can fail to remove queue on evict/restore cycle
>> +    if (dqm->dev->adev->flags & AMD_IS_APU)
>> +        goto out;
>>       dqm_lock(dqm);
>>       if (qpd->evicted++ > 0) /* already evicted, do nothing */
>> -        goto out;
>> +        goto out_unlock;
>>         pdd = qpd_to_pdd(qpd);
>>   @@ -1198,7 +1201,7 @@ static int evict_process_queues_cpsch(struct 
>> device_queue_manager *dqm,
>>        * Skip queue eviction on process eviction.
>>        */
>>       if (!pdd->drm_priv)
>> -        goto out;
>> +        goto out_unlock;
>>         pr_debug_ratelimited("Evicting PASID 0x%x queues\n",
>>                   pdd->process->pasid);
>> @@ -1219,7 +1222,7 @@ static int evict_process_queues_cpsch(struct 
>> device_queue_manager *dqm,
>>               if (retval) {
>>                   dev_err(dev, "Failed to evict queue %d\n",
>>                       q->properties.queue_id);
>> -                goto out;
>> +                goto out_unlock;
>>               }
>>           }
>>       }
>> @@ -1231,8 +1234,9 @@ static int evict_process_queues_cpsch(struct 
>> device_queue_manager *dqm,
>> KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
>>                             USE_DEFAULT_GRACE_PERIOD);
>>   -out:
>> +out_unlock:
>>       dqm_unlock(dqm);
>> +out:
>>       return retval;
>>   }
>>   @@ -1326,14 +1330,17 @@ static int 
>> restore_process_queues_cpsch(struct device_queue_manager *dqm,
>>       uint64_t eviction_duration;
>>       int retval = 0;
>>   +    // gfx1103 APU can fail to remove queue on evict/restore cycle
>> +    if (dqm->dev->adev->flags & AMD_IS_APU)
>> +        goto out;
>>       pdd = qpd_to_pdd(qpd);
>>         dqm_lock(dqm);
>>       if (WARN_ON_ONCE(!qpd->evicted)) /* already restored, do 
>> nothing */
>> -        goto out;
>> +        goto out_unlock;
>>       if (qpd->evicted > 1) { /* ref count still > 0, decrement & 
>> quit */
>>           qpd->evicted--;
>> -        goto out;
>> +        goto out_unlock;
>>       }
>>         /* The debugger creates processes that temporarily have not 
>> acquired
>> @@ -1364,7 +1371,7 @@ static int restore_process_queues_cpsch(struct 
>> device_queue_manager *dqm,
>>               if (retval) {
>>                   dev_err(dev, "Failed to restore queue %d\n",
>>                       q->properties.queue_id);
>> -                goto out;
>> +                goto out_unlock;
>>               }
>>           }
>>       }
>> @@ -1375,8 +1382,9 @@ static int restore_process_queues_cpsch(struct 
>> device_queue_manager *dqm,
>>       atomic64_add(eviction_duration, &pdd->evict_duration_counter);
>>   vm_not_acquired:
>>       qpd->evicted = 0;
>> -out:
>> +out_unlock:
>>       dqm_unlock(dqm);
>> +out:
>>       return retval;
>>   }
>
