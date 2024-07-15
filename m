Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDCB931CB2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 23:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C16110E0ED;
	Mon, 15 Jul 2024 21:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5RQvvgWu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A04C10E0ED
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 21:42:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTbB8zItNsIbeXKomzSdvvVXW6P9Ug+282oZYfI3gRqyt4GC9gt994hA7APhTOCRgybNTyyU/MtJeRx/B3LgyzO6FXOJC6BG3XEbXMzopIJBPIj8fVrmh+rHtKs33l9irW+l1gYwSZsGg2e0UZ0RMeS7rV4K84z7fQibTEzUS5/1EyeyhCnkhaqvmZcCgpX3XnS76CKz2YCSD4qdssZhDIMXc+8CqCErEqi046cmuYnvL7ctS4YCbLhIBAdnX0OMLf+QtGrmeKDpH/mxChVaqW9PWUZgqIt+mmZmO77TM57s309PZFj04UDZ75I7JO9py11TbZ6ERDIY2DpITlSosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zc1xgJ6M0ShFJ5K3n1d6loo2AGjmMHtgapqa5itoMtk=;
 b=OkEv70dKYkXa1ngIav/ZyU8vvv4UxZhgZE7Wji+jaexA+O77W/nyjD8liOtpI4GpPL512b3am22sB2wKEbwWxfgpi3HwkFrXoKGtvkdX1W+DZVWC2MNpbyteWmPhsXWdXrqiod1u3rPfig76lJ1DRgoG43dSPHfbdAHag0wWj4TZHKCVL94Qd2C7Fw7ZUXyq2BeaYsHqSWKVjVlMIHnHtO0q9XYkHuSYedYvUChDfJtV1JdKAC1SuKOrjdJba89zqxUxOI0UlcZPLbWhrzE04y2LcfJGB2WUz4GboUkjUS3EwZ/a9G8nD7DhlH04nePD0+V8h19OZSD78xd83SWt/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zc1xgJ6M0ShFJ5K3n1d6loo2AGjmMHtgapqa5itoMtk=;
 b=5RQvvgWumD2r7mPjnCbTc3NqET0WsvJRsjOMC5wYg/hXTt9ml/gGER0OPUOP3aUVD3E7jNHSoHNSlI/hAFoR70l+BHJVrWdXWcovb2xjUGQtwudIwcbofrPJhVu2Nf7rovdulX+dKg8hmmY0qE0XXxUcYw2zf8Z9ehoWGDl3MCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by DS0PR12MB7969.namprd12.prod.outlook.com (2603:10b6:8:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 21:42:37 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%5]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 21:42:37 +0000
Message-ID: <914b9038-d38f-46f2-9d60-8620c301359d@amd.com>
Date: Mon, 15 Jul 2024 17:42:36 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Fix documentation warning for read_mpcc_state in
 mpc.h
To: dri-devel@lists.freedesktop.org
References: <20240712174510.70467-1-abhishektamboli9@gmail.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20240712174510.70467-1-abhishektamboli9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQ1P288CA0018.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::20) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|DS0PR12MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: c8849c9b-2b5a-455b-ddb2-08dca5170b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlBTcThwUytjK3lJNUd1UXUxdXlJYjNWd25pT25DRWNxVHRRZjBhVHBXbWho?=
 =?utf-8?B?OWxyWks4bmxNaFdHeFNnSG1HMWxqWkUzc25OVjRudEt4NDhmNG54TGZ4Mzht?=
 =?utf-8?B?b25iU3o0REFhY3FpR282QllyYmI1UHVLdjA2R2VlTnRDejFFNFpDQzk5UHBC?=
 =?utf-8?B?ekdjTFIrRUdiZ1R0YVc5cjJmK3Z6OVBqMXVaZG9VZDNRZUJlL0VLVWNWeVFz?=
 =?utf-8?B?UXNUdWM1Z3FxdnVkTlBnMzJ5bTZDcnBmeEFjREVUdlhya1FQbEFFb2N0MExM?=
 =?utf-8?B?b1pIb29IdndDKzlaSlRMR0h0cjBxYjNhRGx1U2hUNCs3WG9HbS94SHpScFhI?=
 =?utf-8?B?Nm1wSWxlTmxNaWpmWDFVVmJZZ2twdUIra3B2eEdBSUNmSk9mN2ZUN2l0RStF?=
 =?utf-8?B?TjRlcnkxV042Ly9YTFVjTXRyb3VvM1YxaCswMkpMYTRqNXovbW9lYWduUzJY?=
 =?utf-8?B?NVdRb1VqUEpSMkUrWnVrK0RYa1pjT3g3V0dJVUphREhMTnFkOFNPd2ZwWjBE?=
 =?utf-8?B?YnFRWlVlc2FNZlhaSS9LNm14S25ENU1wSzVya3EzcTZJcGNGOW1qS0l0TGNv?=
 =?utf-8?B?NlVWMVZ2NkxJYlFFUFZUaFJkQTY2Qktab2FYeWloNnFQV0loNi9FSXNtamxV?=
 =?utf-8?B?NFI1emJqamNQTGVEcFFGbjVXNTBSd1F1aE9ZNFg4OTFibFRkeWN6SlU5MXNw?=
 =?utf-8?B?RzB6OTBCK3lpYTRUbldQVmtjSzZ4T01HL3p3Q3RpbWIwM1VWTWJIa3VOSmFq?=
 =?utf-8?B?ZG1VdTdLbW5Ub1VKUENQdG5WZHhzeXljWDVCdUpWbDBJelhwYlhPdFF6Sm1L?=
 =?utf-8?B?SGVVcXRZWkZQdlFhcFZBWHVOUDB6KytVUHdHbXIrbVNPT0xOWTBHcnUxSGNH?=
 =?utf-8?B?M3BVQXBrVDdiYkJyOVpKZ3I2TTRuaStsdUgwZ1Z3UUdEdnJWUUFlOEV6TFRs?=
 =?utf-8?B?WGRUUGJQZ1EwN1FleGJUaDBMTUpmcFRTcHFMeWdFNFJ0eUlncThES2pkQjdD?=
 =?utf-8?B?MjdMZ1VtVytKSzZ2cmtSaGNhSFFWb1llaEU1SzZNeFUwTklWSGcwN1c3YlFx?=
 =?utf-8?B?MkxaNG9nSlNqNXdrUEpCMWNTMmEzaWYrVmQ2VXh1U3ZhUm13RTdiV2ZYb3RI?=
 =?utf-8?B?alJXZHZYRXBXaGdoaWYrazZ1cWZvUHdEeGthZUorM0x5a2NvRE1IWmJ4Qkt5?=
 =?utf-8?B?dVRyYXIzQ01WNkJtMldQaHdmc0FOTTdjTkJ4OUtIMkZ0MFk5TDlya05KbzQz?=
 =?utf-8?B?c3l5TGZLSEVvai9iUTZtdjdmdHU4ck4xeWlQMlFHZkt0QThydnllTHIxYlFn?=
 =?utf-8?B?MTVENDk0bGJxSVNHcFh3RXYxRDE3WGovS1ZNWURHdm4wSThrUFd2a08rS0s4?=
 =?utf-8?B?dGVtd2xBWm5SYTROdHhjOW96cmZqMHgyNGNtUk1nSEtHcnRjUm1yclBJTmpY?=
 =?utf-8?B?RE9jMkFYaVNhNk02bG9JaFVaSXRKY1pzajBaRVpJRTRtWURxYzRqU0JzYUVP?=
 =?utf-8?B?NThPRjJ4LzJQUjBsekdVWkxyYUt1bnp5bktZSzVsdi9VSWdtMmlUOU9WWkF2?=
 =?utf-8?B?RXo5SEFaZmYzK3BEMzB4WnBJZFFxckJUVnkwUWY1YzZQc1J0ZFFiWGNwRnN6?=
 =?utf-8?B?ZjNBUjZHYzhxNTN5NkI2cUdsdjRlckVSQzl6K1RvTnNPczNSQlNXVnFvSXVI?=
 =?utf-8?B?MUxONkJvS1Q4MWdDeFpGQVczanBKRjdHMWpwZGtDVHFoS1lvK2FtbDJLQTk0?=
 =?utf-8?B?dHY5bVFCNnc0T0tGWVU1c3UvNldJSW5xRkhVZHFNUUdnVE1RdmV2aXJqbGJi?=
 =?utf-8?B?QlR5SndCaHZRZUFiWDg2dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2Juc09HNDVLTEVPV2p3UGJKNVRLNXgwVzkybkh0VWl4N0J0UGQyY2JTeXV2?=
 =?utf-8?B?T3o3SHpEejMxRDJ3ZC8yZ2hTQ0IyU0plVGtIelQ1aFBPbjZLK05zVEtlYXJz?=
 =?utf-8?B?MFc3ckpKaEJZR0x3SjdGcStrekNPOVh4RGZzODZUVENXZklUcDBtWXIvR2JR?=
 =?utf-8?B?Tk52cE95QXdSaWo3ZjYyc0F4MkhLUWxHQzFVZm01akJnOG92cVRYYklTMGxz?=
 =?utf-8?B?eWZrVktHOHU2S3UvSmVZdEtmTHFVcllPWU0yVG5PY1M1NmM5bThqTjZJY2JF?=
 =?utf-8?B?dVFlWDdSOUw4UzN5alQzQlFzYXBhcDZTSk1sL2F4OHdtWWxSQTBxcjE2bmIz?=
 =?utf-8?B?czVyd29iRksyYTBYTGpFZnNEYnN1d3o4WmFWMVdWOXlEdVBCMzdhdU5SdVpE?=
 =?utf-8?B?QlZidmV1N1h5SjJub2thNXpXSStKalpEUFA3bnRZUWVIQzFGRS9rdTZYMzZv?=
 =?utf-8?B?cHJ2RVpYYndmeUlzUkNBRHhVek5JaXlTV2tYNThjYTZFTWhLY21jUVpCVUFE?=
 =?utf-8?B?dG9zN0c5MFNEU1NYbVl6VFJuSnlrUFFrdWRzZndrMWJhcnBHbTZES05VckFF?=
 =?utf-8?B?RHc1TU9tbXlNUUQwalkzVlBHTkdXb2tRcU5sZy8rOHlzK0dWeEtFS1psWVgz?=
 =?utf-8?B?bU0vSmFITUtvVUdZcSs2ZFZPYS9kTjhIWWJqcnBMNk9iczRJQlJ6YmQzdGgy?=
 =?utf-8?B?S293cFI4T0pFRnFIbzNEZFNNVm5DdVQyZTJUT1FLd3NiM0JWdlZzTk5tTG5r?=
 =?utf-8?B?MGtPRjRMY3pjTkFSM2p5M08vdmpaTlVDUWhzQWlwbGJCQXdncUp5ek9sdEEy?=
 =?utf-8?B?OTd6VUNEZ2hBNldYQ0hJTllRRHFEaDN2N2t6NWhweFhhUVdnTngxOFhtVjlj?=
 =?utf-8?B?b2tXMGFoVHQ0TVdjQ2tnbGcvTTRWSXFBMmNMNVFQelhtV2NLKzFMaFJRYTBt?=
 =?utf-8?B?R2dNS1ZOTDhUeFN4ZUxRK1ltVmt2SUx3SDhTdDhLbWVTQzhLams5LzNUbFND?=
 =?utf-8?B?a1Q2OWl2WFJrbXQ1cGtKaHY4U0l5dWtUbDFLd3A0bXoyenZXSmV3aVFFSDdZ?=
 =?utf-8?B?SXVMQlVlUXp6MXhDQjNHZ0xMaXAyT3p4NDVTUFJqK2ZsRFhXblpzOFFzVmpx?=
 =?utf-8?B?SUFTZEdHeDlFQk5KMUJNdlZYMkJHNVl3RkpZRGl1MldMT2NGNnBwYlgvRmVY?=
 =?utf-8?B?UjNZWUJ0cHFhZ0k4Z3pjU0tnclhmZ0ZkMmdaYkxTOGlWQkcrVTBlbXdkQmNO?=
 =?utf-8?B?K0l4R3NOVnJhUlNoSU5wY0RhaWRRZ0N0MTRTUWhTUHpoUlVNcEFxYzZDSEtD?=
 =?utf-8?B?ZEJURXJ4Tjh0NFJtRG5LOUgrNS9wWHlLOEhMM1FKZ1VLNmMxYmpGQ3ZxQUp5?=
 =?utf-8?B?K2dXejJ4cFJzTGZ4M1BuL2FQWlk1QmJYUll2bU5DL0VVOVFxSUhaWGIvV0JB?=
 =?utf-8?B?ODFuTi9vdllIYmlzOUhMZzdwa0ppRkZTM0ZhbHo4dmxEOUVtV09UeVdNR2V3?=
 =?utf-8?B?a3pMN3B6cDZadkRiM1lnYUx4RUFDaWpJYlhwTjhBY1F1VzVReXl6VnJUYjZV?=
 =?utf-8?B?aFJUVHVFY0Nzd0E0bUZ5TVlvTzAvYjh4SmxVWU9qSVBaTWZhT2R0R2UzVXdi?=
 =?utf-8?B?REVOU21FelowWGZXZnVLVUVsTUFhQTFuMFNIMGk2TEhDOXJxSERHcjFMblBx?=
 =?utf-8?B?eVNSTWRpaEZSSDAwaDlBdDVJeFpZL1pOZ29FdG45TFFObGVKY0lWTzd3WFhq?=
 =?utf-8?B?aUVJdC9JcGo0Z2t4V3pPMmZUeTNuczZ3QVpuNjJHM0M5LzRvSzlsdXloZ1Jq?=
 =?utf-8?B?S0RhdmNQWHhEbDlhSlNhN0x5VS85Q3FvV1RDNjhKanZ0dVI5aG01TFBuWFJX?=
 =?utf-8?B?THJkbkpTNzJNSDRZelZCTFZ4ZmxQOWwwSWFUTlhtZ2s5UUtXd2RHTjNhdDBz?=
 =?utf-8?B?TEwrVVR1S25xeXVyZXJHbFRJbktTRjRhWjJCMENRSlV5R0E1bjVjcXYvU21l?=
 =?utf-8?B?ZE1McXJHQTMyMlJoa2pJUS84b2V6OFI5djRaNWNMaDhweWFUWGMveGVRUklY?=
 =?utf-8?B?MWJDd3dBcWdTQXhHelhza3paK1NLZDNDVHYxa2NWbFlrdm80N3N1VGNBNWpu?=
 =?utf-8?Q?xzRn7ugdPYg6W43JaKHHCANSW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8849c9b-2b5a-455b-ddb2-08dca5170b7c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 21:42:37.6431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuCHdmi/gh2D+8ZX6Pt3glDxo95YWnjy1Z0iWA5iwU4R7zpPTlM4VOQiHGSQ3gbLWTooEHMIIexQ1TnmAcGGyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7969
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

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

On 7/12/24 1:45 PM, Abhishek Tamboli wrote:
> Add detail description for the read_mpcc_state function in the
> mpc_funcs struct to resolve the documentation warning.
> 
> A kernel-doc warning was addressed:
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:547: warning:
> Function parameter or struct member 'read_mpcc_state' not
> described in 'mpc_funcs'.
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>   drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> index 34a398f23fc6..9e65ecf1d3b0 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> @@ -282,6 +282,22 @@ struct mpcc_state {
>    * struct mpc_funcs - funcs
>    */
>   struct mpc_funcs {
> +	/**
> +	 * @read_mpcc_state:
> +	 *
> +	 * Reads the state of a given MPCC instance.
> +	 *
> +	 * Parameters:
> +	 *
> +	 * - [in/out] mpc - MPC context.
> +	 * - [in] mpcc_inst - MPCC Instance whose state is to be read.
> +	 * - [out] mpcc_state - MPCC state structure where the state
> +	 *                    of the MPCC instance will be stored.
> +	 *
> +	 * Return:
> +	 *
> +	 * void
> +	 */
>   	void (*read_mpcc_state)(
>   			struct mpc *mpc,
>   			int mpcc_inst,

-- 
--

Thanks & Regards,
Aurabindo Pillai
