Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20CD8AF583
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 19:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7287B113530;
	Tue, 23 Apr 2024 17:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q+3HGbOd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD5B113537;
 Tue, 23 Apr 2024 17:30:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6jZ7db9S7+eIBj8H64/8RFKXAyyBYB+WsoK5VX5ZYDffrCiTI8WSItQxxWWVx/zs4N4QWNGU69FwLEe5C/PPea5g3SHmuq/IrbMISgX0TnxAh2y2m8ck2cPJhVWVqIEOTesnlEy1bmNXNxXmVgg58B3HKltubLmOO7N+8l9OaT7PEvJ5rgAOecWOAcPgABkq1P95pQ5XwfjQhwgxt51mbyuy/pMcmdFTHFR5kmPDoGMPyEDQz4yl+okVnjwHv7Tz50RIdhsvDU6Xg/M8pSg1yrnzEjXmfRJSwL8FsPty3miMbIMdTgGoMFfrX/jIK35b5Xkoebhms2qXlDQtwDkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lH2eCz3QIO2w8Ml9EKWLW+LTtib+YX+iZHpnRZgGbUs=;
 b=JgzxKqVk6/0TLvJRVqP/Tz3FXwv1MKl4a7561VliqxmZtEOBH7sH7IJMAiEmwOPcDzxdUR5H859Z1tT0Z7j37tTF1G114/3a6xYUPy6DFe+9SH6NkH2AC+56leAYTRfIueAR/znmEpiEK4FO+Bbz3numetY0GyS6gpHxba1HYXhbQn9wzXneW5O6WSohRHvEKeep0iTED6SBfNTRQUpbBPNX6eBP0WDwkuuCV63QQfvoVy/gbBk0JTwVhrpi9RM2sXeaxstpOP1+PDjSDuyjcnGE8ZNXtrelbDKgPWmXz0zvuAKL7V4jnb6qmBuEiIfFSc6VkhgiBt8TKx9f/A/rPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lH2eCz3QIO2w8Ml9EKWLW+LTtib+YX+iZHpnRZgGbUs=;
 b=Q+3HGbOdBEWsr/Bxk+JBw7e/dbDLFZGPsHS8gM4ANfxsETD4IHMHeOBQfrNCY2ptZTz9FahKl2ak6ZcD4LZqr2Nl1umKoeDACcaIbXWjK05J0D+OTtNd54QNDXTxYndP4Vy0ufUuy+e+U5Rho3nNhySoCdTWEh4GuQudf99M0s8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by IA1PR12MB7565.namprd12.prod.outlook.com (2603:10b6:208:42f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 17:29:57 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::2243:aadd:acd3:3455]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::2243:aadd:acd3:3455%4]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 17:29:57 +0000
Message-ID: <581d06fd-3aef-4e35-9f29-e368e9e881f2@amd.com>
Date: Tue, 23 Apr 2024 11:29:50 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/amd/display: Fix division by zero in
 setup_dsc_config
Content-Language: en-US
To: Jose Fernandez <josef@netflix.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wenjing Liu <wenjing.liu@amd.com>,
 Alan Liu <haoping.liu@amd.com>, George Shen <george.shen@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Ilya Bakoulin <ilya.bakoulin@amd.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>,
 Leo Ma <hanghong.ma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Markus Elfring <Markus.Elfring@web.de>
References: <20240422143544.20481-1-josef@netflix.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20240422143544.20481-1-josef@netflix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0686.namprd03.prod.outlook.com
 (2603:10b6:408:10e::31) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|IA1PR12MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: f75c2373-dd45-41fd-fbfb-08dc63baff15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXJscjVkeG9uL3Q3YXduR1VnQ2xzaFlYcmVsdVRvM1VZM3NVSWkveGxqYzBJ?=
 =?utf-8?B?bDEwSmh3NkRWa3Vkci84UWhBMHl1a2tZRUhSaEVHN3Fjb1dCcVY1djZNTHVN?=
 =?utf-8?B?bytyS2FuU2VDRUhZUjJVTnNxUXd6MXZQR1NtdERxc1pMZEFrNVBhV0d6YytW?=
 =?utf-8?B?YitaOVE3U3lrZGFaS3pZTVRobWVUTEpMRFhnNkZRcC93dktmNFNSL01CcGpL?=
 =?utf-8?B?VUJZRW4yUW5idUcrczhXRUFJSExyNDA4WjZyWjJaOGh3VVVJYnZURXQwUnBE?=
 =?utf-8?B?bDRPaDBWdWN5TU1meUY5WlFQd05XTGtVNTJwaXhIUDFuU291S21kTnlFalIy?=
 =?utf-8?B?cW9ybDVBRUs0VmNraXZFbkdQWkRWS0syTzljdWlBM1ZCeWg5Kzk3N1BkbVVQ?=
 =?utf-8?B?dzBpaWRaS1Z6aGcvQjZDKzVqdFVuVzdycFRBRzNkcEF3UlhPcTNIM2lJT0p6?=
 =?utf-8?B?Y3IyQ1RsUTdHTUV3c29VYW1aSWVENi9YaXd0MkZ5b0gvQUFoNG9ROFhYTG1K?=
 =?utf-8?B?Wkd2YU1JTWJhaXFOTGc4WTJnVlNWY2hYR1YvV3FGMXpUekpSd1oyWXVzK2dM?=
 =?utf-8?B?U1htbUdxL2hDSGRDSFlwZnNsbWJvUHd4Rm5veVNkcEFIVSszSEZzeDNlZ0Na?=
 =?utf-8?B?Y3BEMnNkR3hxTXBxaVFSYVZxRFNzc0p1elVkbVN3cDV2bHdrN2M4eGNKUHIr?=
 =?utf-8?B?elphVkJnMU95ZmxzMzBlMGxmZFQvOFBxUXhLeWY4RlFPQmEvdVM2QjRiL25x?=
 =?utf-8?B?aGxPK0Q0c1JYSUI5TU8wbmNKaEdNMjdBOG04Yk5UWGF3QVl2MWF4Z3lpWFd4?=
 =?utf-8?B?S0NoUHlDQ0hNWHVxSDUxMzI1bXNLclNKWjhvWmJrM1RCaEFkT3J1T2lYSGtx?=
 =?utf-8?B?M2VPY1dZNWtvcUdIbDcvUTg5Wm5XNm5qWXJaMUdLRFZhUlNhRmpCRSsrNTZM?=
 =?utf-8?B?dnUvcUIzTmFVT2xyendsSG1Ed2JoWEppSWlIdjMxU1lUWTRyc21ubDUwU29M?=
 =?utf-8?B?bEVmam1aM2l2WjNNbFQ3RWF2ZGtUbmFsUEwvQWlXN2trbURhR29obFFQRlda?=
 =?utf-8?B?WnZnN0JsckFJU3FFNllRVU5QcWZud0FFTXVBanJHc0pGUzYxYmh4c1M4Z1Zp?=
 =?utf-8?B?TnpkVE1Rc3ZwRE1UNnV2SFBCL1JsN2hOUStnd3Vidit6UmJpc1A2ZUlLbmhr?=
 =?utf-8?B?bUg2RUdUenFSZEpMcm5RT3U3WGJ0UTdFblk2MDEyL0E4dnJXR1pnenNFNnhk?=
 =?utf-8?B?RkFGSGt3bE0wL3J2UDJoS2RadFpRRDNwUUtPZ2ptUjdzMmM1ZnZicDVQRmhS?=
 =?utf-8?B?TG1aWkFaeE5UQllpNUowN2tTZlpxbGE1bGt4Tis5dytnblpkNEdaZWlkZ0VJ?=
 =?utf-8?B?RUJjQWdGODBmbk5ENXBlMW12UVpZK3poY3laWGUxRFpoYmZneHVWRXlNcUgw?=
 =?utf-8?B?WG5YMHFZMlFrMkVxWWp2VXlCcFhkTXRaWnJEbXhvN2dEd0JhdkVBZzZUblBy?=
 =?utf-8?B?STdtaDk2QllPM3Zkb0MwbG94UlVYY1ZaMVBjMno0K2lTSVliVld0NUlybktt?=
 =?utf-8?B?Tml0WUxkYnFZZWNPVFNkN3EvTm1oa29pT2RSR0greWxsRXFIUVZCdXI5bVI3?=
 =?utf-8?Q?ICtc+mK/s/Ow/QdrRIKVclRF5a4o/o6MdAe5BmTunlro=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVdtWENKaHpqKzdPYm5YdmJzQXBUWnVQQk4vUEtVc2crNU9sa0l1Z0FNcTZC?=
 =?utf-8?B?Mm5zUnZoNGprUS8vTFFoMCtXelRzdUl5L2w3N2xrL1dKVzBBRG0xUlB3NlVn?=
 =?utf-8?B?clVHa0Zkd29rZjVMcFNDcnNTWHRqTlAvQ3JtcDZaUFZOSlhHVzhabXkvYWhu?=
 =?utf-8?B?RmFYWSt5YmhuUkxKSjB0N0ZZYWVtRU9EaEp4bmdSRkpRcm5jVDVpNXlxUllt?=
 =?utf-8?B?c3Z4dzBKeHRXOXMyWE5LbWdqbkpoMmNhR1ZIWHZDM3FNVGlQQlZPUmpHcUta?=
 =?utf-8?B?eStWdjI3NUdUaUR4OWhtK3BidUFvS3J6c3Jrd0FCRVdpS242eGlFSFZiZnBE?=
 =?utf-8?B?WWJsUEpsSEVVZnBNdUtLK21jTkplK3NPOCt6citTaERIOWRGMURVcE9sUytK?=
 =?utf-8?B?WUJBVEs0cDR0Tk8yMU9aQ1drUXFFUFNFSnhGOVhXMGpFazA0N1lnWVBkMVhx?=
 =?utf-8?B?WHZFUWJZbkxYc0FzYk1WSGNBdFBldm9uWGV4aC9UYUVtSEJYalFCY0lZazN3?=
 =?utf-8?B?Z1BkY3ZtWTFtWWFQZytzOXZDMmZFWnFvdVgyTENWbGV6Nk9FYWdrRm5YSzI1?=
 =?utf-8?B?dVpoUWlEZWJSN2xXQXV4eEFiTjVsUXBCamJGVGNJRTBkdnR1akpRR0k4RVcw?=
 =?utf-8?B?OG9nSHhrS3NETlAwcWxLUXV3M1ExNXVuS1grNStuV1dXTVA5RzI4aWEwQWph?=
 =?utf-8?B?ODFMaFVzKzJETWpNQjdQeDlsQkR3SUlrOURjOHNmelVGRU1sTWlDVDdrK1dp?=
 =?utf-8?B?VEpxb2YwYnNkcWZxOFdkZVFLenVBcEtRYzhkcFB2UVFaTVEzKzFXbW0yTzh5?=
 =?utf-8?B?Y2FWaWtXZ0JENnRKVXJISWFtMWN3RkRsdnFGUUcyaTVjeDBXYkM5TFFxc01u?=
 =?utf-8?B?YnlIaVhZbkN1cXV3eGNZbGRLZFNoYlZtSk90VDJ6aTlOSnNYbkIyOWFRd1I1?=
 =?utf-8?B?WnlkRVpJb0R3U2lxUFVpbnNWUUtFM1lOR01ZMUhhWEZIcGhXVmdBc2tVLzVI?=
 =?utf-8?B?ZHJaTUwybW5QR2Y3Ris3a0R0eGtQMnZCWWxRRENRZFh0MGRPMDZsZ0ZnNkVL?=
 =?utf-8?B?MGozWTNaeXhUVkQxM0Y2ei9RditnMXB6QkNLS1RQS3BIbkU2K21ULzJrU3pG?=
 =?utf-8?B?U21hcjRCRG5vT21hMVp1V2l1NUVIc1A3aTE0a214T3diQjNLdkJxTTJTSVpt?=
 =?utf-8?B?Qy9WSlFsdE1INU5WOGhFQ1pPaGlBdW5GS3dpUmp2c2RhM28rYTliU096emZM?=
 =?utf-8?B?aHc0Y1RIdzUvaHZqdEJNYXEzYXo4VmJKWlA5Rko4ZDJ2THZpSFdKR2dob2Ro?=
 =?utf-8?B?THU1YVJFMWRlZTMxcFQ3dVJoS1BoeFlWcVMyWEdwWjFnQjB6TFptNDQ0bnpH?=
 =?utf-8?B?b3R4QnlyNGF1VjFxQ1V4NXNkaEhldVpkRjZnV005KzRXSEh3M0o2TW01NzB3?=
 =?utf-8?B?eTJFMjJHUmNYc29VaU8xZTREaFZpVUNPNDZ4RFpxMmUyNVJSeGpDT1dlSDlV?=
 =?utf-8?B?V0VKZWlpTnlwRFh6N0llL2pLbmN4dGJYaHk2T25BMTIrU0hNN0lSVTY2VENk?=
 =?utf-8?B?ZTg1Z0d2S2xFdGRsSVpsM3lqM2JWYUlnS0tTblpoUUF0L1lKaktrNm8wQVk4?=
 =?utf-8?B?UzgwTGREcGJDdWY5UUM4UWhXS0IyWmZqY1d6N3lPd0NNSkRQTm9QSDJmeElK?=
 =?utf-8?B?UjdEWndtN0F1QUc3Wm55VE00clZYSmRXM2dLa2pXVmZCQTBvd1A3Vis1aEMx?=
 =?utf-8?B?bjJ6bTkwYTdvdUd6dG1HT05FQUNVZmwvTEQxenlvM1Q4enM3a3czWGRPdTJW?=
 =?utf-8?B?STJ6aUY0b2wyVXM3V1hvMCtKVG9DU2xtSzVqOTdXWDliTUNjNks1R0YwVEYz?=
 =?utf-8?B?a0FiQlZ6VzNGYThGTlRjVXpLWS8ramhNWmZncjJ6eE9xVU05MStVVFJqa256?=
 =?utf-8?B?OERnZTVMcFlkK0JUWlFpOUdIL05NT2ZDbmdQdGFCajBmaUpYWlBDUEJ2eXJI?=
 =?utf-8?B?MVVKNm1wbGtXSVlyNVB0NGpNOGh2TStkd2lhNnIwdVgycG04UlNIMGN6ZFJT?=
 =?utf-8?B?cHdFT1NVZGpKcTRURkFVNlNsUWJKOEVEeFkyS3VnRjFMZXpjQ0w5T203UWND?=
 =?utf-8?Q?WcahEInkaLqikilxNNZ7Wf20i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f75c2373-dd45-41fd-fbfb-08dc63baff15
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 17:29:57.6054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IKYcrLLP39jIqfHKSuQqGkYL+u/wfnB9DppBPexW/AjJM84wfZJY2TdrNjQhxybAIOf2FE6CRg7+mJdOnZcsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7565
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



On 4/22/24 8:35 AM, Jose Fernandez wrote:
> When slice_height is 0, the division by slice_height in the calculation
> of the number of slices will cause a division by zero driver crash. This
> leaves the kernel in a state that requires a reboot. This patch adds a
> check to avoid the division by zero.
> 
> The stack trace below is for the 6.8.4 Kernel. I reproduced the issue on
> a Z16 Gen 2 Lenovo Thinkpad with a Apple Studio Display monitor
> connected via Thunderbolt. The amdgpu driver crashed with this exception
> when I rebooted the system with the monitor connected.
> 
> kernel: ? die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434 arch/x86/kernel/dumpstack.c:447)
> kernel: ? do_trap (arch/x86/kernel/traps.c:113 arch/x86/kernel/traps.c:154)
> kernel: ? setup_dsc_config (drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dc_dsc.c:1053) amdgpu
> kernel: ? do_error_trap (./arch/x86/include/asm/traps.h:58 arch/x86/kernel/traps.c:175)
> kernel: ? setup_dsc_config (drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dc_dsc.c:1053) amdgpu
> kernel: ? exc_divide_error (arch/x86/kernel/traps.c:194 (discriminator 2))
> kernel: ? setup_dsc_config (drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dc_dsc.c:1053) amdgpu
> kernel: ? asm_exc_divide_error (./arch/x86/include/asm/idtentry.h:548)
> kernel: ? setup_dsc_config (drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dc_dsc.c:1053) amdgpu
> kernel: dc_dsc_compute_config (drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dc_dsc.c:1109) amdgpu
> 
> After applying this patch, the driver no longer crashes when the monitor
> is connected and the system is rebooted. I believe this is the same
> issue reported for 3113.
> 
> Signed-off-by: Jose Fernandez <josef@netflix.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3113
> ---
>   drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> index ac41f9c0a283..597d5425d6cb 100644
> --- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> @@ -1055,7 +1055,12 @@ static bool setup_dsc_config(
>   	if (!is_dsc_possible)
>   		goto done;
>   
> -	dsc_cfg->num_slices_v = pic_height/slice_height;
> +	if (slice_height > 0)
> +		dsc_cfg->num_slices_v = pic_height/slice_height;

Hi Jose,

First of all, thanks a lot for your patch.

Your patch looks good; I just added {} in the if and spaces around '/' 
before merging your patch.

Anyway,

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Thanks
Siqueira

> +	else {
> +		is_dsc_possible = false;
> +		goto done;
> +	}
>   
>   	if (target_bandwidth_kbps > 0) {
>   		is_dsc_possible = decide_dsc_target_bpp_x16(

