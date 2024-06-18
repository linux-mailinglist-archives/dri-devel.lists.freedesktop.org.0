Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A3F90DD40
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D9310E78D;
	Tue, 18 Jun 2024 20:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UStrxbTv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB5310E1E8;
 Tue, 18 Jun 2024 20:20:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f739pttWq1qWMx+1Xg1LzHtQAbjg+9muU+n0E9DmoMynuFTcUTEqB/y2yHYIMU1R9lTgoFxynVjke7W7VNJkER+ijXNElVs61e7mWJT5cNE7RHfnBZidSIP23xBRC5rTuhTOa2Z77gl2h0gHF0Yc4Ekq4gogyMs+WVNQHSXAMpqkCZJHOoX0vrDzPzNVSlkXPlRqOO44mUrJ33spF03w9SPRiC9ot09cMY6+AF87Zp3n345VITIaSELmc4coZVj1ze/+rsL73YyWuToQrJrb0Lu0vQiWTztJIRi1iuSPtMIPbfz8K3PJKqKQWfAzgj1iVHPIniUgeNRx36acnPFV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLQEZ539IrYP9crJmwsHeADGtNZq20Lji9sfpI83REY=;
 b=RDiO4Phtfly/CaXI7BJXDtwHkxlEH/on3887zniz8gqtErYrBAJ4UEwXLd8YKhLyZ3GLMmSfv2EdWOWkO6ESSr4bMpOoD4yhpmSXYtu2ofPrRcSrmJJqUYfQZsnf6gim99uv61d4Xc3+C7K7WT+8Dy01tNva81TWUxHscHclpejpUu+auMVPTcitqwkT1uECkUyeFjcnycACxDe/2yW1FjYeN9jYy/Bf3bl4uoIlQzsWsmUkJxrcWwU5bvvQ5nXFd6fK2I9M2iL/+pY1Vqf2VtC/rTYikvW8S27W553O4ifMzpa6TUnRd16hHur/DR8p9XBUu64tPMTvhfHCtCD2vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLQEZ539IrYP9crJmwsHeADGtNZq20Lji9sfpI83REY=;
 b=UStrxbTvd0MVc6jPPHAcVafkmsP4jeEQe1aT0za0uyLeN1sEUxqHu85JHDNOr3VbAhjNAszt6lgEUAS8toMjmbm2ws5yjJs48Znp+mx18uhVOsTAmlWKZJWsAW78SIY6r+Lr5X2Tmi/AAiSRrbC9jU/4SxJXcXXwkcBlvZPZxWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Tue, 18 Jun
 2024 20:20:28 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%6]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 20:20:28 +0000
Message-ID: <54e77cf4-4fdd-430d-8c9a-7fe7c2eefb3d@amd.com>
Date: Tue, 18 Jun 2024 16:20:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] tests/amdgpu/amd_psr: Add support for `power
 saving policy` property
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@google.com>
References: <20240522220849.33343-1-mario.limonciello@amd.com>
 <20240522220849.33343-5-mario.limonciello@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20240522220849.33343-5-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0117.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::17) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|SJ0PR12MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: e3c1b138-df1a-4b0a-54f9-08dc8fd41852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUFXTi92dWV6M054RU9TeUJkWXpuYkNMYnluUGJScXdOdTFzMjFGUnN4eUxC?=
 =?utf-8?B?ODZXTFZEKy9yNTFXcGpTSzRyQTlPb2Q0RlRsMnNORTlGQzA5N1R5MmJGc3or?=
 =?utf-8?B?SjhNRUdjdUF2ZDU5eTR6Umw5QzlvMjZ3YTRGOCt0K3MxWVBTSzg4U0VKQkhZ?=
 =?utf-8?B?L1YwRzYxU2c0WTJuOW9uVGJkcHZmb3d3TGFETCtrU1V1VGNlSnZVdndrOUM1?=
 =?utf-8?B?VUozMEtWUHlHeEpZall5a2ZYZ053Rm42Umw4TGQ1QzFaZUNuSVREUXJsamM1?=
 =?utf-8?B?OFJYRjY4SUh2dkpIcXNucVU3aWZYajU0V0JETXhQR3psVFNVMHBEbExJYjJL?=
 =?utf-8?B?VDdoSzFSdzJndEY0and2QWJDSDB5cnVSVmRobTRNeGQ5RUJ2emFKbzgyZlI1?=
 =?utf-8?B?eGhQeHFxRDRXT0J0VEZYckFRRytzNUV1VnlFdmttanBFSDJUTmk4dTgvMGNm?=
 =?utf-8?B?NkxVZ0ZLUE1mTldSdTh1WkV1MUJNYUxpKzcrelg3N1JUNGdvYXY2RG5iOGpa?=
 =?utf-8?B?OXFBbWM5NFFMaERRS1dpUXUrNGZEaHFDbjZoNHpWRXhUUHJQRldGTS8rRzNa?=
 =?utf-8?B?aWNBYk1NTFM1cEE4OTUyWXZKQTRUaXE3REx2TVR1V3h2TFVQZWkrWHhINS9o?=
 =?utf-8?B?NUdQb2lNUUtiMXhUOU5CNTRPK0d2cW1tanppdDlUSWhjVTlwN3U4S3JDd1du?=
 =?utf-8?B?Q3lNZklwWTdXdjZZdG5GbXNhWXBZRW1RR3Q0ZFhwcFFBVmdCQnlUeHVSMFI2?=
 =?utf-8?B?SEdvUWJ6ZGNYdjlhd2sybTVieUxOWmY3cmFjOHA4NXl5Uy90WTZSZEpRcFBL?=
 =?utf-8?B?ZXA0dFJjNUg3UmI1dVJxVFgxQmNOVktMVXZoK2VpazF0YTZkd1Rkbnpvemov?=
 =?utf-8?B?ZFUvSm8wUHJOOEFzcU1DSFJrcmgzbzBMSVo1OC9sd0ZJOCtuWG1YbVdxZTdJ?=
 =?utf-8?B?cnJsaUFISU9JT29qb29LZmE5ZWFtcEZHWkVYc3lqRDVhanJRWTJlUVVnanVn?=
 =?utf-8?B?OFVBQXdSRWxwbm83ZmxUcVJxN0xsTFVsdHhxeVBPamFUdFZDeExqejVOUC9u?=
 =?utf-8?B?OUFsVytyandjT1VyL2JxRmJSUWlTME8vbHpZSTEzL0ZjemlGNUNrZFNWd2Nw?=
 =?utf-8?B?RFA0Rk53aVU2d1A4L2pPelROSFpycyt0Y1hjVXpTY09vNUdQMjdxemxnUTQ2?=
 =?utf-8?B?Sk5rWk92NWVkYTBKMUxpMFUvb2pXVVJRdXIxV29GclUyMEkraHRZRjZ0YU5w?=
 =?utf-8?B?ZUdOTElXb2dnc3JsczYrTjJCMTNJVmlQam5GL0Z4NkZvZk01WE1XS1JXajhv?=
 =?utf-8?B?TnF5YzF5TFVUTi8yY2dqREpUaC8yYVFoZGlGQ1oyc0JsM0IvNjZ5Smo2R3Jw?=
 =?utf-8?B?YUsvcFQ0RUpjcjlXd0VDbElXQmRJT3g3aWYvNmRhOXVZUFBFb0x1Nlc0bU1X?=
 =?utf-8?B?ajYwemV1a3pRbkxFM2JpODNYSjFSM0hCa1dFclZ4QmhDdE9FTFdIRnRlQVh5?=
 =?utf-8?B?QnpWWFlNcUc3VXJTdWc1MkdQaHc2MkhGbWxiQ0VRYmRWdkF4TWRsU0VKZllq?=
 =?utf-8?B?SHJaa1k3aldKdzRoTGl5MW5VWHlIdWh5a2NTSnlsTjVpS1liRzc5MzVPcXhP?=
 =?utf-8?B?Vy9SWEUvWlo3NzZ4V1BLekpHSUZPSU5WWjhVN0lyalgvNU1aNjJJdTBjQjNp?=
 =?utf-8?B?VGJpR0JGV0VqSjIrRm03MzA0Vzc5K2hrYWlUV0tneWhuU2JvbWU0OTJ5OTVC?=
 =?utf-8?Q?Z8N3d316/RgRHlUc8d73fhJD+7KSO+ah1cbVaOh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3cxZlBVbXgwR2hUd1ozRXozUWZ4VjU5MXozSUtBMW5YZ3U2QmhNbU03bWxM?=
 =?utf-8?B?ZS9OMTZQVEpoRVZjcXArNDF0RWpCUlV1QTY1dkEyaVlselkvUjBzNmM3VEhY?=
 =?utf-8?B?NlhVZ1JzdFRlY3B3cEQrV2gyMW1XQ2F0Zk9xUlVYTmdYbWd0a2tWWVpJZFdl?=
 =?utf-8?B?T0d4TW1odTlOSndFb0hVcHF0U084ZmZEM1Q2T3Y0eTJhU3ZTeXh5cFpCMjFv?=
 =?utf-8?B?U0tDaXJDcXJuZ1RWRzBHQm14NFZyRUVlSC8vc0s3YnNnVzZPc0xseGVqK2Zs?=
 =?utf-8?B?clR5bVIxMS9XMHpweFM2SFdhQnlUTnhrYmlTeHVseHp2emRWNTV6RVJwRjEr?=
 =?utf-8?B?STNVNnFJRDMrQ2lEUjZVM3JmbWdpdi9wUnNiUnY4ZkpaMmNMZ2RTc25RZWd2?=
 =?utf-8?B?RlUrT1c5SzRNT3BDN215UVVnNEFMNlhXazNRSGNNUmFnbkRRWWF5ZHVsZlpj?=
 =?utf-8?B?emhLNGkyaVZVc3J3S3lGRjUzUW9MNFNJMUZmZVEveW9sNHVaNzNMQjdNNUI2?=
 =?utf-8?B?STFtV1hZc2ZLeGcwTlV6TFVKU3ZEeXg1T3ptQml0ZzAyMWNBLzVzNHFNZDI3?=
 =?utf-8?B?em9Lc3pNSDB1SVhHbFVSMkdHcVNXQkd1bkJCbmM0cFRiTnlhUTRtb2E3Z0VR?=
 =?utf-8?B?bkZuRFVieS9aQmtOazVidFc2VHBPTURPeHU3c0pwSy9pSml5TEd6NHowZW85?=
 =?utf-8?B?aVhIUkZnRjBnalJXQlpOVjBCcEN0TzYySm92OHJhbjNqTWdoMVM2eVkyUWE2?=
 =?utf-8?B?WURQTG1uYUVDNC9mQjlqSG1RWW56VmJBa2FoMzVITlRlRUx1c25wWjJDMjNs?=
 =?utf-8?B?dThwTnByeXo3a1dGTzN5SkJYV3dTYU1aWEgrcmNOUnU2RmNta2Yxb0xhL1hK?=
 =?utf-8?B?RGlrd0RURmJBZldURWR1U1E1M01uS3dMeU5oeFZJK21HRWhzL3JuRGZTbTZW?=
 =?utf-8?B?c0IyOURNWnNIQ3RuZGd0U1VQWGVCMUMvWVVnajBqbnFMZHdPQWlSTENLRnlu?=
 =?utf-8?B?SVdzRzR6anJndzBsc09QaUV1d1lUeXh4TEpuSFNKRmxqdldyVi92NXdwclV6?=
 =?utf-8?B?Y3Qyd080K2lGQ1l0Q2dRM2Z2UWJGbDR6ZHpBQkhHR0cxVUcvY3JJeXUwTTho?=
 =?utf-8?B?c1ExQy9aSFppZEFMeXRkZFVpY3V6SFRlVTFZeGIxbGEwODlySGZGN2pDdWZt?=
 =?utf-8?B?U3U4MXp4SUt4STBtTWhuelR0bno0bjZVaU1FSDNZSm5tcUhDZU1QdFlGS05x?=
 =?utf-8?B?cHBRcUpXNndQdUUyMEZDV3RhemhvU2dLTlppVGVIWm9sbGgzTzZTUGxJU0Ux?=
 =?utf-8?B?MVBub3JCSGkrM2JZZHhkVk43bkRFSy85eVUxNG1iUXFVdmxoT25vRTRrUzdE?=
 =?utf-8?B?MTVTS2Q0eHdsRG5VTkpKdnl2NnJXU1lBeGVWODE4eXFYSFdRTVpvR2d1a21I?=
 =?utf-8?B?eXNHUmxlOElRMzN2WTJtd2hFV2ZoZUlDRG92VzFMTFVZV3J3MTExekRKak1h?=
 =?utf-8?B?WkhUMURMVWVNRmV3VFhadHNKejFDWlg0ZmxyYnJId3Q5ZHM3QnRzV1ptS2xV?=
 =?utf-8?B?VjRId2JWaHJaL01iSWYvOVF1UzVHOU9TeExNTGFzbm5JZm9UeFdBa053Z01w?=
 =?utf-8?B?UjBaaWhYMFRFZDJtUk50UWJqY2I4OHBSM1J6MENmT2todzZCQUU0eUtFcVd0?=
 =?utf-8?B?eG9IOHdGYklVSE9RWUo0WWt5NDc5S3VRY25pSDI2Z2lwQWhhVVRvQ3VRRXl1?=
 =?utf-8?B?S0NMdjVsM0hXNktmZmVSUFo1VFpRamltNDZvUFdHNERXM2RYSzFSUXhGN2I5?=
 =?utf-8?B?VmU5aU5FQ0ErSWd0RnFrVXJmNVAvSFByZjRTeDRQeTBMWHBRQy92cXdZTUQr?=
 =?utf-8?B?MU9HNTVwd3R4cE0rc3h3TFpQM29VQUJZTGxDdWk1bDcycXNYajF4aHpobklY?=
 =?utf-8?B?OUIvd3J5WElCVkJDOHVQN0k3MGE2eHVzN09HS0ZXQ0VrWHpaS1JIOHhoS2Ey?=
 =?utf-8?B?eHYwRmxucE4wbnVyQlNQWU5aSDVoVVlzWDFLQndrd2ZHZFFraysxYU9JYmR2?=
 =?utf-8?B?Q1hpNzhHb0owdVlQWmJUeXgxeE1Pb1J5UlNYSDg1RGVvYXRVcy9NUFowQWcz?=
 =?utf-8?Q?thmh2i+Hp1OYhmrYotgVJtChj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c1b138-df1a-4b0a-54f9-08dc8fd41852
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 20:20:28.5025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sZqTUxPubdK/I2WXXxqpG+RboHrwGSweysm4HvOE7hojvCgXDUuyZJDYpo5Wh0M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6760
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



On 2024-05-22 18:08, Mario Limonciello wrote:
> Verify that the property has disabled PSR
> ---
>   tests/amdgpu/amd_psr.c | 74 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 74 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index 9da161a09..a9f4a6aa5 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -338,6 +338,78 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
>   	test_fini(data);
>   }
>   
> +static void psr_forbidden(data_t *data)
> +{
> +	int edp_idx, ret, i, psr_state;
> +	igt_fb_t ref_fb, ref_fb2;
> +	igt_fb_t *flip_fb;
> +	igt_output_t *output;
> +
> +	test_init(data);
> +
> +	edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> +	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
> +
> +	/* check if eDP support PSR1, PSR-SU.
> +	 */
> +	igt_skip_on(!psr_mode_supported(data, PSR_MODE_1) && !psr_mode_supported(data, PSR_MODE_2));
> +	for_each_connected_output(&data->display, output) {
> +
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +			continue;
> +		ret = clear_power_saving_policy(data->fd, output);
> +		if (ret == -ENODEV) {
> +			igt_skip("No power saving policy prop\n");
> +			return;
> +		}
> +		igt_require(ret == 0);
> +
> +		/* try to engage PSR */
> +		ret = set_panel_power_saving_policy(data->fd, output, DRM_MODE_REQUIRE_LOW_LATENCY);
> +		igt_assert_eq(ret, 0);
> +
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +				    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 1.0,
> +				    0.0, 0.0, &ref_fb);
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +				    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0,
> +				    1.0, 0.0, &ref_fb2);
> +
> +		igt_plane_set_fb(data->primary, &ref_fb);
> +
> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +
> +		for (i = 0; i < N_FLIPS; i++) {
> +			if (i % 2 == 0)
> +				flip_fb = &ref_fb2;
> +			else
> +				flip_fb = &ref_fb;
> +
> +			ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +					      flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +			igt_require(ret == 0);
> +			kmstest_wait_for_pageflip(data->fd);
> +		}
> +
> +		/* PSR state takes some time to settle its value on static screen */
> +		sleep(PSR_SETTLE_DELAY);
> +
> +		psr_state =  igt_amd_read_psr_state(data->fd, output->name);
> +		igt_require(psr_state == PSR_STATE3);

igt_fail_on* or igt_assert* should be used here, igt_require simply 'skips' the
test if the condition evaluates to false.

Should we be instead asserting psr_state == PSR_STATE0 here for disabled, since
we've set REQUIRE_LOW_LATENCY?

I think as part of this test, we can also check that PSR re-enables after
clearing the power saving policy. Something like

ret = clear_power_saving_policy(data->fd, output);
... do some flipping ...
sleep(PSR_SETTLE_DELAY);
psr_state = igt_amd_read_psr_state(data->fd, output->name);
igt_assert_f(psr_state == PSR_STATE3,
              "Panel not in PSR after clearing power saving policy\n");

Thanks,
Leo

> +
> +		igt_remove_fb(data->fd, &ref_fb);
> +		igt_remove_fb(data->fd, &ref_fb2);
> +
> +		ret = clear_power_saving_policy(data->fd, output);
> +		if (ret == -ENODEV) {
> +			igt_skip("No power saving policy prop\n");
> +			return;
> +		}
> +		igt_require(ret == 0);
> +
> +	}
> +}
> +
>   static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio)
>   {
>   	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> @@ -756,6 +828,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   	igt_describe("Test to validate PSR SU enablement with Visual Confirm "
>   		     "and to validate PSR SU disable/re-enable w/ primary scaling ratio 0.75");
>   	igt_subtest("psr_su_mpo_scaling_0_75") run_check_psr_su_mpo(&data, true, .75);
> +	igt_describe("Test whether PSR can be forbidden");
> +	igt_subtest("psr_forbidden") psr_forbidden(&data);
>   
>   	igt_fixture
>   	{
