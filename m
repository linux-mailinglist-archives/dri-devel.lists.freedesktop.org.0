Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C730A34B9B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B99E10EB4D;
	Thu, 13 Feb 2025 17:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zy6lmRQn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D247410EB4D;
 Thu, 13 Feb 2025 17:20:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQEMcYh8+TMNpqJiOCLUaogHWQAUUabZQcAgHhdnMOJvJQ1Pd91+M40yXw1KZYFdG96mg8Bgb8FmF+JVaNe35OawgM8E6rYMsEzzCrwWLtHNdywV2FNtQCB8/qHHsjKQMkinGal8r09m/+SeD9RjBk/onSZvvON46A4lxVuHR5os/RXMfXbbPYrVFgpZRdeoCQ+rakkM+RMarecNThjXOKiuqSJA51JtiyAbb7JnC5Ag7ATnbGGPREQkCrqgr2Sm31fm5O+LiMoVZA4Of4myFsFVVLAWBKu0BOwq0psOnnYF465cS73/ptsC3yT0MSkTa3UoKMvSw09HwbssoRrqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzNQk4YuQVIglN+gcFcwGM9XP3Iw9ceuZylWyMEB5KM=;
 b=ghd09Zj7ah7+2S0hzTyAPfkzspR07PN4eOWfhX0vdQol1f2h4Me+VvMJLTd2bZUm40prUGNNVyh0JRQSuvK3WUV0eAjRXV2V4K4a6liUB7TQUHwnUBn9pRpDLWYV4sbPYKvHmRK3AO8ppk7Pru6a7Y+ytGTjnekZfDnw+Dyl5wws31j7SpXFdvoGy7oDIcqEhIb9I/kcW3waVqSCv89DSPHqp/VNhWIZS2te6HdvRujaNW2XkUEIZgrMQwJXLQ9UZRW+140QSJOOACO3j3UIkNtqmUln/483O21HQmXgdOuKCZxjlRJaclUihcJVIA82OhmCKyhBbzJP93aGHxYj2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzNQk4YuQVIglN+gcFcwGM9XP3Iw9ceuZylWyMEB5KM=;
 b=zy6lmRQnN9JW67ds5PhujPlfVZRa+cGzeYD/sjyO5imU/So4Qeu2VEyvhZXAaX4oNtsOqQ16OGpNGgWshCbe5vse/mFnuZat7+dSr7S6VfwS4RrujqEo6ljS1dfB8oYMmbh0BYR18097bzxk8QqT79JXZIPKwqFmkfqjbOI5MMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 CY8PR12MB7681.namprd12.prod.outlook.com (2603:10b6:930:84::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.14; Thu, 13 Feb 2025 17:20:33 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 17:20:33 +0000
Message-ID: <cd17946d-f576-45fb-afd7-59cfd29cb6f6@amd.com>
Date: Wed, 12 Feb 2025 18:44:44 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 34/45] drm/amd/display: add shaper and blend colorops for 1D
 Curve Custom LUT
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-35-alex.hung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20241220043410.416867-35-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::17) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|CY8PR12MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3c0dc8-c062-4385-196d-08dd4c52b92f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWtxQmxjQjdSdWtVbVhjQVNRbDBOeXNmV2UvVmZXS2hidFE1UExhVHBBZUpk?=
 =?utf-8?B?Sk5wc1BkM1JzNWhnTEQzU1JxWlgrRDVvWEp0Uk81a3VBOUdmcWF3OWQrQStl?=
 =?utf-8?B?Wm1wMzJROXNZSVdrRFFjSUV2alFoeFpSaUxPTyt4aWk4R3ZZU2tpNVMrTUhk?=
 =?utf-8?B?OE5hU2JFM2tZQ29ON29oZ2c5WGhIS0FiUlBvNUtsbWlBeXJKQlQrKzBpVVhS?=
 =?utf-8?B?ZFMzcDJDd1RnNUhMcTc2TTJtaE1TVS9VeCtkbWZoK0ZOeXJENEpQZ2RtdUNL?=
 =?utf-8?B?WERSRnBITXZNZ251VXNNTE9QMEZQTWdMeXNzZVVvL1JNazQ4azIrampoV0Rl?=
 =?utf-8?B?SFB6TWRETThiRUtCMC93UU1mQnVhWERGY0NvZWE0OS95TTVGRUh6OFEvVzVa?=
 =?utf-8?B?WDhVWWJ3TmVoTnY5ZnZ2NStpYVVtVitxZlcrRzVZb2RlUUdXREdGSm04dlI4?=
 =?utf-8?B?ZVc2QmNOdmJmeUpJYmw3UU9NUnNhT3VRVEROS2dZOVhDZEhmd0p5Y04wa2pO?=
 =?utf-8?B?bGtndThuT3hvZktTOTVETUxTN0dtYmdtN0ptdDROb2FkcUlMM2F6eFhtY0xm?=
 =?utf-8?B?d3JMaG9XUlEvNUM0UXllK1B5cTk3YlJJdmJzZGg2L2NnRkdLQVN6cW9oV0hE?=
 =?utf-8?B?QWdUcjB6TVNCc2Z6Q2NsVHpqL2VQVjF2VVFoUWpoUnFFUUZ3TGhsamxWSFRV?=
 =?utf-8?B?VGNiV3IzNENiTThvYXpZcUVWcE1GM0lwWGZYUWRvVy9rUVpseGMxS0lYbU1J?=
 =?utf-8?B?SUNjdGRRRFBIRTdGeXFmblpFZit0dzRDMllKRlEzOFBIVkNOdFdsVThMZGNK?=
 =?utf-8?B?NUg1MUovMEdNZ1h6eU1sY0N5a2U3WTdOZjhkYjdOaFEyZ3FkRUlCVG0xNFRQ?=
 =?utf-8?B?dU9OcEtPeEtpQm0rUEhoc2lhZ0xFU05CeEo5UUc1TnJORy96Rkw0ZU9QUC80?=
 =?utf-8?B?cktPUzlmKzUxY1RvS28zd2duZEh6dEtQekxWUGYwbTZpRkNwbStIcEhPRkk0?=
 =?utf-8?B?eDFhcXRCYlZlcFZaZTVZQkVxcitRSTZTVUJRcmVwWVFGbEZBdXlaMXJWZUNR?=
 =?utf-8?B?Y0NESlFXZ1N2Vndzayt5WmNQZUI3MDJwNHFTYXppZ0tLQmtqV05CWXlycFJz?=
 =?utf-8?B?Q1djWUxFUUxGQ1lOY053YmliQlRGdFExbGZiWXBidGRkVm9WMmlTaUc5cGhV?=
 =?utf-8?B?UzFhcVovamNXbmFqYXNwdVlGMlVkRTI1cVI0WXNobHZvS1ZrYkk1Q3VQZkJP?=
 =?utf-8?B?RDNSYndzUm8wQjdITmxSVTR0eVNHcGNyc1BnQmxFV0RSVnhxeFVrUTJlU2cv?=
 =?utf-8?B?Wk5sUjFiaHMySEpQK3BQS3dhTGxqeHBHbTB3Smg1ell2SDc5SmgvRHRDV2I5?=
 =?utf-8?B?ZS9ZbE8vUTlBd3VwVDVQMlNYUmlJM0FwVjFhOTdTWUYwdGlHTE9EWFpUZEM5?=
 =?utf-8?B?RlR1R0ZUSm5iMUxhWmFmNFhGSmVtdnpaYXBCeUxXREtuZitOK3hnakFrb3FS?=
 =?utf-8?B?MWI1cEtoeExFVjlZVEJTSTJWSFJ0VUNYdU8vdnVFTDdyYkcrY1pJbE8ybkwy?=
 =?utf-8?B?c2JZQUtoWW9KbmVqcEJRaS9PNU1Oc0h5NkR0S0czYUZrOU1Dcy9za0dwMUND?=
 =?utf-8?B?a1dwVGN4cGJjdzNrRm5aTXNHVjVqcFhWdG4xZFVkNmoxdzE1dGZUOWRVZGdx?=
 =?utf-8?B?a1JqQzJhbFVVVmdWMG5Nd05nRlFSK0pnUWQ1WHZoME9Nd29wTENuc0o4NGNE?=
 =?utf-8?B?V1dnMWoyY25mZjcyRzdRMkdhdXgzWkJkNVVhWkgxWGtGZHMxVVp1L3JpSVNM?=
 =?utf-8?B?aGRzRHhWZVZ3cjhiSHJhcktRaU5lWHNkNllaRVEvM0tzc3lSRlBTc1BFQjJu?=
 =?utf-8?Q?FHKjrTVm1Ec33?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S05LQ09DcHMxRnpxRXhYMDF2S3F4ZG14d3dhTVVueEx0bFVBeW5KZTZZRVlx?=
 =?utf-8?B?U3gzNEUvaFZVMXZVRSt2Ni94R01YSThZV3Y0SnhhZGQ0THEzQ2hxUXp4cDlr?=
 =?utf-8?B?cWR6S3dEYkdxQisxMGVyMDV3UHY5L1haQUVpME9VeVhPdFpERmUwMkZjdTQx?=
 =?utf-8?B?a0piSG4wL3JtOWFSQjNUZzc3TW04aWxpMFBEdGxzYllzL3JVUTRhVTZKSDd5?=
 =?utf-8?B?ZG90VVJOZnpxODAwNHMzV2JjUllLOVVUNmZOT2RybWNVYTIzSjF5UWF0ZUU5?=
 =?utf-8?B?OXc0dXlXU2UrMXhSOWJxaEhuNUQ2U3JKZXNHUk9lQ3ovSVpBUWdnNytQaDRv?=
 =?utf-8?B?dldlZWJOVWptR1BDbG9VcWp4OHRIb0RNMVlsN1lveXhOZWM1WXJVaWl0N1A4?=
 =?utf-8?B?NmN0SUtmT2xpQnFnNFd5QmVQbXlzQjFzdExsTlZta25yN2lIejRPM1F2TVIx?=
 =?utf-8?B?cVdWTktjQ2llOGxnQ2kzbVZ5Tk5YRS85eVVYUXNqL0E4N0Vhakx5NjNSdlM0?=
 =?utf-8?B?UkIxbnB4S1ViRkVTcm5BcmhVMyt5SC9URStucU1kcUlJTVV1d1QwRmFjMXhK?=
 =?utf-8?B?VkJJVGtvOFlIKzhXc1pSUW5pMkFrdi9pNzliL0dJSlVQdUxZWktvMTFNY2ZT?=
 =?utf-8?B?cTdyTklCMnQ1MVkvMmpTc09HWVVGYlEwRGFhemJkNjdyVnJ0ck9kKzBCbWlm?=
 =?utf-8?B?L2xLNzJnRVlTY1ZiQThNclZCUDlPc1Q1ME0yeC9FNENabVdQU2dPR3Y2QVBC?=
 =?utf-8?B?U2kwSFVmNmt6enBQMUhLTWlwdm5zbVZ3a09Rc3g5NmpQNUI0SXNNWDhCbXFD?=
 =?utf-8?B?bUJYSXhpMGZaSnBtenI0NVhUcVdGb05iTEwwUmRqS3BwS00rU1AxdjhTMFdq?=
 =?utf-8?B?d2k4cHhnZDhtR0k5QWNvOWJ5d2phZjhFRnpqbDUzSk55bWNXZkhpTmdUbHd4?=
 =?utf-8?B?WVJuMXVvcktqalI5SmN3YlE2TjNhNkVxaCtEcy9iQ0ZMNGlENzdLS2w1SkVZ?=
 =?utf-8?B?VW9LcmJwblRWY1pZVTJHMWxmMEJvMG5NVEtwTzlreGdhRDVZY0RwTmorRTlj?=
 =?utf-8?B?UTh0UnBGTkpubGhJeGxRMVNpWDJ6c1BwWEFXekVuTlBLb3hOdnBJSHZHRzJM?=
 =?utf-8?B?czhERkVVOU1RemtCRlVuN2paT1JpNDhGOWg0aThocmZhNDlxZTYrRWhCY0ho?=
 =?utf-8?B?RTBBUTBSWHRIaFpEWTNMeGpWODdISHREZlBaTTZhWmlmQkl3bU90OVEzYnVB?=
 =?utf-8?B?VHpwWktCalhGc0xaK3hxMUZPTDNoMkZHL1RYT3ArOU1JaVJNRE1odEM5RjRW?=
 =?utf-8?B?OGxTdWJEcEdzV1lNTmJLMC94Sm03a0J4b2RuSCsxRHp4NmxQdmRnU2NGZkFh?=
 =?utf-8?B?dllXYlcvT01QMkpMTjNYU0R3dkozc0RwZ0lWL000bHJsaWsreklQOW1BK2dS?=
 =?utf-8?B?OUFuNlhmS2FnZlVneUxTdmg0YXAycE9Kd1orL3Jxa1NCbVVjdkNSYWpIMkJX?=
 =?utf-8?B?bmZVTm5VRGVyTkQrUExPdDNjSlhKT3NqbWFVUGo3Y211cUl2M24rK2ZOOEhS?=
 =?utf-8?B?S2xZS3NXNUNKUFNRalNMYjRMWlArTUxIaHk5ZXNCM2JFL01yb3Zlb3FTY1lK?=
 =?utf-8?B?aDVOakNmSmlhVWdVL3AxcUxGYXh1dnlIVkg1bFJXK0c4cUtTTG1sRk5kcmhK?=
 =?utf-8?B?OENzR2FIUlJNbE05OFFHT3pHU1lVNjRvem1hcHBwdkxxNU1yYzBkcnJ5cmdt?=
 =?utf-8?B?ZGlQbEhUd090SjJRTVF3bHlBUkpMT1MzMHpkNjB3Z05XQzg3bkQwNkd6RUtV?=
 =?utf-8?B?bVNud3d4bkdnZGRRUmJXL041YVIwbTRNY1QxeGlxNGlEeitRVGJ2UXpvdW5B?=
 =?utf-8?B?d1UveUdhWVBzdmdsMW5oYWx1MFVDTk05WW9LT0lYclM3VVJoQ0FwOW1tT1U4?=
 =?utf-8?B?SlNad2F0KzAvOHU0ek9lM2FOM0FZbnlWUTJtbERhVnFBWUtrNDVYcW5VeVdE?=
 =?utf-8?B?SjFacUMrejFiZFhybDRwY3ZLaXUwaU0wOEFDNzNRU3ZWVG5BRGlkWTQrek1l?=
 =?utf-8?B?bmIrQW4wV2RnWWsyMDBGbUE4WHNMb2tQeGpDMmVTSlBMNS9YZFRWTEdodXBE?=
 =?utf-8?Q?G6zV+/EJMwoVGNKy+A3093NxK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3c0dc8-c062-4385-196d-08dd4c52b92f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 17:20:33.6313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgIkdcTQ5yHpnAnJhsIT4WXkc17Z1h1c9u8a5F8kou7hQjyclMnZhcrjLL/6PlNb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7681
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



On 2024-12-19 23:33, Alex Hung wrote:
> This patch adds colorops for custom 1D LUTs in the SHAPER and
> BLND HW blocks.
> 
> With this change the following IGT tests pass:
> kms_colorop --run plane-XR30-XR30-srgb_inv_eotf_lut
> kms_colorop --run plane-XR30-XR30-srgb_inv_eotf_lut-srgb_eotf_lut
> 
> The color pipeline now consists of the following colorops:
> 1. 1D curve colorop
> 2. 1D curve colorop
> 3. 1D LUT
> 4. 1D curve colorop
> 5. 1D LUT
> 
> The 1D curve colorops support sRGB, BT2020, and PQ scaled to 125.0.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
> v7:
>   - Initialize uint32_t blend_size = 0 by default (kernel test robot)
>   - Modify state->size to colorop->lut_size
> 
>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 166 ++++++++++--------
>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  32 ++++
>   2 files changed, 120 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 1765402bc122..0bea52eede39 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -1211,38 +1211,6 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
>   	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
>   }
>   
> -static int
> -__set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
> -		       struct drm_colorop_state *colorop_state)
> -{
> -	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
> -	struct drm_colorop *colorop = colorop_state->colorop;
> -	struct drm_device *drm = colorop->dev;
> -
> -	if (colorop->type != DRM_COLOROP_1D_CURVE)
> -		return -EINVAL;
> -
> -	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs))
> -		return -EINVAL;
> -
> -	if (colorop_state->bypass) {
> -		tf->type = TF_TYPE_BYPASS;
> -		tf->tf = TRANSFER_FUNCTION_LINEAR;
> -		return 0;
> -	}
> -
> -	drm_dbg(drm, "Shaper colorop with ID: %d\n", colorop->base.id);
> -
> -	if (colorop->type == DRM_COLOROP_1D_CURVE) {
> -		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
> -		tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
> -		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
> -		return __set_output_tf(tf, 0, 0, false);
> -	}
> -
> -	return -EINVAL;
> -}
> -
>   static int
>   __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>   			      struct dc_plane_state *dc_plane_state,
> @@ -1251,64 +1219,61 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>   	struct drm_colorop *old_colorop;
>   	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
>   	struct drm_atomic_state *state = plane_state->state;
> +	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
> +	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
> +	const struct drm_color_lut *shaper_lut;
> +	struct drm_device *dev = colorop->dev;
> +	uint32_t shaper_size;
>   	int i = 0;
>   
> +	/* 1D Curve - SHAPER TF */
>   	old_colorop = colorop;
> -
> -	/* 2nd op: 1d curve - shaper */
>   	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
>   		if (new_colorop_state->colorop == old_colorop &&
>   		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs)) {
>   			colorop_state = new_colorop_state;
>   			break;
>   		}
> -
> -		if (new_colorop_state->colorop == old_colorop) {
> -			colorop_state = new_colorop_state;
> -			break;
> -		}
>   	}
>   
> -	if (!colorop_state)
> -		return -EINVAL;
> -
> -	return __set_colorop_in_shaper_1d_curve(dc_plane_state, colorop_state);
> -}
> -
> -
> -static int
> -__set_colorop_1d_curve_blend_tf_lut(struct dc_plane_state *dc_plane_state,
> -				  struct drm_colorop_state *colorop_state)
> -{
> -
> -	struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
> -	struct drm_colorop *colorop = colorop_state->colorop;
> -	struct drm_device *drm = colorop->dev;
> -	const struct drm_color_lut *blend_lut;
> -	uint32_t blend_size = 0;
> -
> -	if (colorop->type != DRM_COLOROP_1D_CURVE)
> -		return -EINVAL;
> +	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE) {
> +		drm_dbg(dev, "Shaper TF colorop with ID: %d\n", colorop->base.id);
> +		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
> +		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
> +		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
> +		__set_output_tf(tf, 0, 0, false);
> +	}

__set_output_tf() could fail silently -- would that be problematic?

Looks like this question applies to similar changes below.

>   
> -	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs))
> +	/* 1D LUT - SHAPER LUT */
> +	colorop = old_colorop->next;
> +	if (!colorop) {
> +		drm_dbg(dev, "no Shaper LUT colorop found\n");
>   		return -EINVAL;
> -
> -	if (colorop_state->bypass) {
> -		tf->type = TF_TYPE_BYPASS;
> -		tf->tf = TRANSFER_FUNCTION_LINEAR;
> -		return 0;
>   	}
>   
> -	drm_dbg(drm, "Blend colorop with ID: %d\n", colorop->base.id);
> +	old_colorop = colorop;
> +	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
> +		if (new_colorop_state->colorop == old_colorop &&
> +		    new_colorop_state->colorop->type == DRM_COLOROP_1D_LUT) {
> +			colorop_state = new_colorop_state;
> +			break;
> +		}
> +	}
>   
> -	if (colorop->type == DRM_COLOROP_1D_CURVE) {
> +	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_LUT) {
> +		drm_dbg(dev, "Shaper LUT colorop with ID: %d\n", colorop->base.id);
>   		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
> -		tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
> +		tf->tf = default_tf;

Not sure if IIUC --the shaper in HW can either be a custom 1D LUT, or a
predefined 1D CURVE, but cannot be both enabled at the same time, right?

If so, what would be the expected outcome if both LUT and CURVE colorops are not 
in bypass? It looks from the code that we'd prefer the LUT.

Likewise, this question applies to similar changes below.

- Leo

>   		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
> -		return __set_input_tf(NULL, tf, blend_lut, blend_size);
> +		shaper_lut = __extract_blob_lut(colorop_state->data, &shaper_size);
> +		shaper_size = shaper_lut != NULL ? shaper_size : 0;
> +
> +		/* Custom LUT size must be the same as supported size */
> +		if (shaper_size == colorop->lut_size)
> +			__set_output_tf(tf, shaper_lut, shaper_size, false);
>   	}
>   
> -	return -EINVAL;
> +	return 0;
>   }
>   
>   static int
> @@ -1319,28 +1284,63 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
>   	struct drm_colorop *old_colorop;
>   	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
>   	struct drm_atomic_state *state = plane_state->state;
> +	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
> +	struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
> +	const struct drm_color_lut *blend_lut;
> +	struct drm_device *dev = colorop->dev;
> +	uint32_t blend_size;
>   	int i = 0;
>   
> +	/* 1D Curve - BLND TF */
>   	old_colorop = colorop;
> -
> -	/* 3nd op: 1d curve - blend */
>   	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
>   		if (new_colorop_state->colorop == old_colorop &&
>   		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
>   			colorop_state = new_colorop_state;
>   			break;
>   		}
> +	}
> +
> +	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE &&
> +	    (BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
> +		drm_dbg(dev, "Blend TF colorop with ID: %d\n", colorop->base.id);
> +		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
> +		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
> +		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
> +		__set_input_tf(NULL, tf, blend_lut, blend_size);
> +	}
>   
> -		if (new_colorop_state->colorop == old_colorop) {
> +	/* 1D Curve - BLND LUT */
> +	colorop = old_colorop->next;
> +	if (!colorop) {
> +		drm_dbg(dev, "no Blend LUT colorop found\n");
> +		return -EINVAL;
> +	}
> +
> +	old_colorop = colorop;
> +	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
> +		if (new_colorop_state->colorop == old_colorop &&
> +		    new_colorop_state->colorop->type == DRM_COLOROP_1D_LUT) {
>   			colorop_state = new_colorop_state;
>   			break;
>   		}
>   	}
>   
> -	if (!colorop_state)
> -		return -EINVAL;
> +	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_LUT &&
> +	    (BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
> +		drm_dbg(dev, "Blend LUT colorop with ID: %d\n", colorop->base.id);
> +		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
> +		tf->tf = default_tf;
> +		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
> +		blend_lut = __extract_blob_lut(colorop_state->data, &blend_size);
> +		blend_size = blend_lut != NULL ? blend_size : 0;
> +
> +		/* Custom LUT size must be the same as supported size */
> +		if (blend_size == colorop->lut_size)
> +			__set_input_tf(NULL, tf, blend_lut, blend_size);
> +	}
>   
> -	return __set_colorop_1d_curve_blend_tf_lut(dc_plane_state, colorop_state);
> +	return 0;
>   }
>   
>   static int
> @@ -1409,7 +1409,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>   	if (ret)
>   		return ret;
>   
> -	/* 1D Curve - SHAPER TF */
> +	/* 1D Curve & LUT - SHAPER TF & LUT */
>   	colorop = colorop->next;
>   	if (!colorop) {
>   		drm_dbg(dev, "no Shaper TF colorop found\n");
> @@ -1420,7 +1420,12 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>   	if (ret)
>   		return ret;
>   
> -	/* 1D Curve - BLND TF */
> +	/* Shaper LUT colorop is already handled, just skip here */
> +	colorop = colorop->next;
> +	if (!colorop)
> +		return -EINVAL;
> +
> +	/* 1D Curve & LUT - BLND TF & LUT */
>   	colorop = colorop->next;
>   	if (!colorop) {
>   		drm_dbg(dev, "no Blend TF colorop found\n");
> @@ -1431,6 +1436,11 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>   	if (ret)
>   		return ret;
>   
> +	/* BLND LUT colorop is already handled, just skip here */
> +	colorop = colorop->next;
> +	if (!colorop)
> +		return -EINVAL;
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index ff5828a1e8cd..8a5e15083f11 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -29,6 +29,7 @@
>   #include <drm/drm_property.h>
>   #include <drm/drm_colorop.h>
>   
> +#include "amdgpu.h"
>   #include "amdgpu_dm_colorop.h"
>   
>   const u64 amdgpu_dm_supported_degam_tfs =
> @@ -90,6 +91,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   
>   	i++;
>   
> +	/* 1D LUT - SHAPER LUT */
> +	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!ops[i]) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		ret = -ENOMEM;
> +		goto cleanup;
> +	}
> +
> +	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
> +	if (ret)
> +		goto cleanup;
> +
> +	drm_colorop_set_next_property(ops[i-1], ops[i]);
> +
> +	i++;
> +
>   	/* 1D curve - BLND TF */
>   	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>   	if (!ops[i]) {
> @@ -104,6 +121,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   
>   	drm_colorop_set_next_property(ops[i-1], ops[i]);
>   
> +	i++;
> +
> +	/* 1D LUT - BLND LUT */
> +	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!ops[i]) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		ret = -ENOMEM;
> +		goto cleanup;
> +	}
> +
> +	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
> +	if (ret)
> +		goto cleanup;
> +
> +	drm_colorop_set_next_property(ops[i-1], ops[i]);
>   	return 0;
>   
>   cleanup:

