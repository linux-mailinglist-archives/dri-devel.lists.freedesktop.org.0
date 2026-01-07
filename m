Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF39CFB673
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 01:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5BD10E541;
	Wed,  7 Jan 2026 00:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wbAqKg0A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010000.outbound.protection.outlook.com [52.101.201.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D032510E49C;
 Wed,  7 Jan 2026 00:02:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EY3f09YEa7FGtM6/z3M5fEbdnXNCnw9sca4dy2JueBwbg5v4GOLbPWu+//IDiWOAMDN2aHKG8Lo/i2rUUk8VBQFfirnS82OtpRbLZE+C0f7356ksKzShx/2s8qkFyUYKxAGu/3dmLngGjes5d63c6Zwsn5Ui7QHnTyIOIo0zpwkhEAK+CWPwt3Fh8GvE+svLgg7YKe7ac6rEqXczPHLwZUJHzISL6+C7zpstp4MVvYONHKMYBsKCHe5QrKjTJIlObSYzBI2O1h78aPOwviVSaQgUL8yCwIGAvF/JWBQfuQqvKJ2uvx3jfiSqRLT2YPm6TWW9pdVntLfML2+S5yxJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=id0YGdhM/jTfnYJMTGsnhJkC6hhDX0qQVxQmz6IZeAw=;
 b=FUuqIbwjfFVAA5ORcyjJXlVova/c05ULhodnzpNilazqcmYIv1mKZOAApQ8/kWItZ50LAL1wRqbvIcf8Uub7zVcsdQmOzJUh3a9KrmPQopChWCCdLO5ecTT/dtZPGbnWEGH6S1n9/KYaMRl1n3pew85aHeYSY2v277e4W1X8Yp4Qz7U6tin45LAtozZur7f1gl+jVJlpWyMns2ZAMAmMr5U7+gokeObQCFHMWclpYpHc9Dw73wvDrTC5EsAagd2rJieXMukR8CxMcGaU+EhJ83dN3F1BgDcMJ0dOv2AbpbM4zZDiTG0NIIMW1B3MbiBOfTbOBUHddZuSOBB7aXdAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id0YGdhM/jTfnYJMTGsnhJkC6hhDX0qQVxQmz6IZeAw=;
 b=wbAqKg0AMzescbFIkwKJm7TDX2Njs7pJm2BjJ5bvxCySa8BfQOLGSlTHOWZQCCMDdY65sScO0aqQLza7wsjrc3MiPShgr2n3OKTxaL13gUT4Y2KigIV27xfnf/fnWVAQfG1XioFKRgfBX19SfljcUQOnw1hIehbKowl/5ZQDlBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 00:02:49 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 00:02:49 +0000
Message-ID: <d28e7b86-010d-4f01-bf40-6b96b71de12a@amd.com>
Date: Tue, 6 Jan 2026 17:02:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] drm/colorop: Add destroy helper for colorop objects
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 daniels@collabora.com, uma.shankar@intel.com, suraj.kandpal@intel.com,
 nfraprado@collabora.com, ville.syrjala@linux.intel.com,
 matthew.d.roper@intel.com
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-7-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20251219065614.190834-7-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:303:b5::29) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cfa5f8e-698b-4135-edbe-08de4d801823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2Z4WDdGYjJTejN1aFlTaDFrc3Jrc2ZySko0bzlzY0duVTBvUlZhTzJvRnI0?=
 =?utf-8?B?VkpUTHFVZHhpZmNNQTcrSnF6cjl1dEdKbTkyaWJ6YURjMm5TditSWG5sTzE5?=
 =?utf-8?B?aEZNazlqMWhjMDFUMDhhVW9CUUhaNDVOYy9jL3JEazNJWlF3QUZlU2wxRVBN?=
 =?utf-8?B?bEE5VFhrM0JKZ05QWlFOWXRhQ0IySm9yaTFoWXBaOXh0TE1YTkJRcU9odGJa?=
 =?utf-8?B?VFU0dGdMNEpCQldoaWhiZ3N0azZIY1RrS21LZEFZWUVuSU9qLzZ4bEMyd2wv?=
 =?utf-8?B?ekMrZ05hMk4vdTNjK2JKTS94NXRNZVdRby82K3RreTl6VmhpanN2WHo2NmpM?=
 =?utf-8?B?MTErWlR3UFFmSmZleUtjUTVkY3F6QXRPVzJpcXkwRzVZY1EwM0ZPd1hqYkhp?=
 =?utf-8?B?TUQ2bmpmalB0NTVLdkZlbTJTNDcyR2k2TVF1WURwTjZKVnZkejU2OHZkNnlG?=
 =?utf-8?B?bG5pZjVUWVV0NWJXNEk5R0NKQXBac3cxTFpyd3M5aXJsOUlQNE8xWGdkZTY5?=
 =?utf-8?B?ZXY5OGljZFNVUHdSREYwSTNFeFRxMnlRbGUzbWRIUWtLSnVDYVUzSGZRSmRj?=
 =?utf-8?B?eTNGdXNmUklYNDZkZVJ1UEFoY0dGOFVzUHF3NXh3WVc5NEFkenRuNHAraENa?=
 =?utf-8?B?T0V5VkpOaEhBT0thVlJXa21kd293a3VRdktnK2JndDVGU1UyVEZjR1ZZMEpP?=
 =?utf-8?B?OEVCTFJvNW40R0o1cDcrVG9jSHg3Q1BKY2JiTnpONGFBbDd6b3lyYjc2QjN2?=
 =?utf-8?B?T2xNRWppYzYvOERzQXN2eG9JTmMrMkZzNTE5ZXV5dnhlVW5zQlpNYnBrOGl2?=
 =?utf-8?B?V1lseVNIM2x4MmtEcjAvTmMvZ1dDbWUwcUkxOHF1MWRkWXpISTQ5WU10TWdn?=
 =?utf-8?B?aW9rTUE4UEF6cnplSjFOTVBwUkI1ZUdXL3BabHJtTHVhU0xYOFNRalZKbVQx?=
 =?utf-8?B?T25oRk9PWDdDVDkvRWZmdmpibEo0ckNCdUVZOUJ6Mjg0U2JTeVlaYkkyaCtB?=
 =?utf-8?B?N1F6SXh6bTRSN1RraHl3SFpXWWdLYi9IemJZNldWYjY5WGtsNVBaWkd5ZnV4?=
 =?utf-8?B?Q2kvNVVzZEFDT3hhaDFzTStCaW1FcEJhNGZVZVYvSFAzR004WGpiSnFqVFZI?=
 =?utf-8?B?VU5Pb3lyZmtVU21JbS95NTJRYVR1ZGRidmw3SVhSZmxMWElDWGZyZEJnUnN1?=
 =?utf-8?B?ZVBycVlwaDFlZWpVazNSQ1EyRDRkS3kzWTg4dU1aY2dFc21DbHlKM0hTN00v?=
 =?utf-8?B?Q0RkOFRYdkNMaEd4V3h3akN1MzFZYmpXcDBRNmVVNVI0azZuVzVUYmNiSXdV?=
 =?utf-8?B?dHJvOFZXV0hhaXZ6SHhUYTFLUzB3S0FZbmRtbUNmclZKazJtaVRRaWFibU91?=
 =?utf-8?B?WkFrb1ZxZld1T3c2dFpTWjJzeWtMcmoyZzlFV3h3KzFiWG5JQ0RjN1EraG81?=
 =?utf-8?B?UWRDVlFSMCtxNkttZXRzcURXT0Z6ZC9RYW1wQlZrazZ0SGdOMEVzSml5SW5t?=
 =?utf-8?B?N3dEc3FleDRadG1sQkNkZEF5WWYzWVczYm1xZDB5aVVGS3h2YS9HVk1KWmxi?=
 =?utf-8?B?WEp5ZUxXVDVCRjRNUm1yc09oaXdyMi82UUJ4a21rSC9hRGtwVGhvMHh5aXFO?=
 =?utf-8?B?TWdwU2VvdWthcElSQ29oQ1hySU5jZjRiTUE5RitSQ1dGZzlteDdCSUx0cHJZ?=
 =?utf-8?B?RE1MMXRxZm5neWJBTEQyZGxCcVBEV2NFRFJRUk1YQlJreEJTTDdJUjh5aVVp?=
 =?utf-8?B?UmhFc3RxRFY5MmpoRm1ZTlFOYUVYZ2hYNTUvbmhvZnczTStFdVpHY29wZWlr?=
 =?utf-8?B?Q2RjNE0rRzdnZXFGMmdBQmNHOTd3N1d3VTVBdEhoVW9lQzE1ZGNCbytRaFJq?=
 =?utf-8?B?NStZQkN0L0N1Rk9HMUlTNkIxUVV2RjBIKy9Ld2NvL3JIWkZTeDJmUjFyZ0wz?=
 =?utf-8?Q?kxw2HmyEhNxCoilHiwNubH0GroKKHytW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXkvWWg5ZW9vQ0R0TkxiUWpOek8zZGZKcjdRRWx1YnhyS3R4MkxIMlhYR08y?=
 =?utf-8?B?SFJXT1htWlFZYnY1aWxVRUE0T29RZktheWdnMUcxRFZwN2ZtazhnSzdxU05U?=
 =?utf-8?B?U3QxaHBHcUJkbDdWYUdLa2JsMVpiMTd3NlZzUVJYTUlBMEtsOTdyYzZNb29w?=
 =?utf-8?B?Tm5QZXUweEFweFBINUQ3WjlZSFFYcVNscnBuMzg1VGxaNDFoanVLcG9jNEdi?=
 =?utf-8?B?WnZxVDF6WVhicjRkbE5zMkw2VGZqN0hIZTdRSDYzN1U0SThFUUEvUWJ4d3d5?=
 =?utf-8?B?WHhoYjBrTnlKcTVzN3FKS3cwelovWkp4VHAyMExlRUwwNzE4end5MnREY2Yx?=
 =?utf-8?B?SFhIM05OOUorUW9qREpGQkgyVVlzNDUrTE5WOXpvN05CRnVlcmVLbnVSM0dF?=
 =?utf-8?B?ZVk5cTNDVmk1UHV1VGdsWS94amVUaFVXMm1qNlJPSFM0S0VKZVJqMjd1Vkpq?=
 =?utf-8?B?ZlZzTHo3Z2t1TXdnaEJwZzBDdVFWcGlWWUNlUGVTYmkySFlLRy9kbVBFQTM0?=
 =?utf-8?B?QVJIcENNYlhrdE9QSWJQRHU0ai9Sb3RCQ0VPYlFiWVlyMEJLSmpPcitqRm84?=
 =?utf-8?B?Q2xXc3JDMFZyRHNDT2JpRVE4SVk5UHcvLzVSRmxVeEN3VzhTUVNVdnQ5UmZD?=
 =?utf-8?B?djBNNjYwZjJUVjZiTzhjYVhybDIvNDI4WXB4Z2ZGMk0zOGJrWUYvNHY1bkls?=
 =?utf-8?B?M2Z2MEJjTy90aG5kZEdnYXpNblFocU1FNkFHYkI5aWNLMmNnQ3NFM0FrT1ZL?=
 =?utf-8?B?aEFJL0phTUN2MjdkR214cXBGcGNKQm40MmxodzkyeitoRDRuZGJsM2JLT24y?=
 =?utf-8?B?am5IenlTUjRkU3g0RGFSLytWU25BaEhRb2ZpdlJ5OXhwcUJVWFVZdXU4ekNB?=
 =?utf-8?B?MDNNczZ5eWNnd2Q5K0g4UXJZaFNWUHhVVkRaVGRRR1BPdnpuc3JHNW1xcTkx?=
 =?utf-8?B?eWVCVVp3TEtMejE0WUZydS85UXJrOVA5WFN1TUlqR3dOTUdXZEtMTWZNdmZ1?=
 =?utf-8?B?M3NoSmF6emMrNzVQNE9HNXdsOUk4SnZVRUNYMU52VnlZUzIySTFXQkJaZkZm?=
 =?utf-8?B?UGN5N01FWURBcXJFVXBJcVhXbk5pbmVLL09GMUNnVHJTdGZBOEFzL2J1VTJr?=
 =?utf-8?B?dm9SWmhYRm5NQURkRUVydHZBTnkyU2hINVVZeU1SV0NxV2luam5WTmt0S2FE?=
 =?utf-8?B?K2VCR282b3dTMlJiVkRPOThvdzJyN2kybnFsSTk3VEQ4aWQ4MWdJUm41dXYy?=
 =?utf-8?B?UkNUdmNmVXNmVm9adjd4b0g5dzViMEp4cloyMzJVQXFLVnNLV1MyazB3aW1J?=
 =?utf-8?B?Y2hmQTFpRU5IR05JeTZGYm5YT2xpY3hoTHJVVEhONlN0YjhIOTVmNGI3ME9u?=
 =?utf-8?B?RVRDeTZhY2o0dzllV3R6Y29qMzV6OHNhbXNnT0tsOTVrcm1Vdm9ncmoxSmYz?=
 =?utf-8?B?OEFvS0M2dzFMM3lOUUFjK1VoR20vV2l6RWZVQXNocWNNdm1abXpUTnpKZWlq?=
 =?utf-8?B?TlZHb2RKa0RIclJoUmNmS0tYdDlGY2lyNVphU0x1dDIvazU2WTdPN0F6OFln?=
 =?utf-8?B?ajZreS9TQlpyZVdFaWJXN2lxVU95THcrNldWL05mTlkxUlVEcExUYmg3Z2h6?=
 =?utf-8?B?Y00rM0dmUTlGVkpVdGJWMHRuK3hCSUlqS3JuNGFha0s0aFlPOG5JTW5JTGdM?=
 =?utf-8?B?S291TkEzaHUxSGl2UXRrZERRbXdjVW1GcnY0aWhJSEk1bFZHOFpSL1RBd1Ny?=
 =?utf-8?B?M00xLzVYeGxEdTMwZGFscmJISHNMWW83WDdCNmFsRHNpY2syenRKSDRlWS9y?=
 =?utf-8?B?V0JDU2RyVHkrakRJQlM0TEZQam1WbG9zQTRSYXFXeldhd1psUVJkT2Ntc3BR?=
 =?utf-8?B?VjN6TUl3RUgxc0R5TVdTbkNORzNXNk5yUHZ2cWdQS3RqdXhuTWRZMnZlVEpW?=
 =?utf-8?B?eUxnNld0SVc1RGRkUDl1TmU0UWRUKzJKL2gxeG9xTHY1dUlVeVhwZGRPdDBh?=
 =?utf-8?B?Vk9mcUhiZGJac3Z1L25tZ1ZzaWJ1LzAwVDhQUmNaUVN0VmtGMHFoNDlrdGFY?=
 =?utf-8?B?MnMxTFNYNFFZQmpKTGRoNkxGYWRQbi93cmxVclhZNW0rdzRJNXgxSTJiU1FI?=
 =?utf-8?B?amFTSGxra3FDSXVycy95MEwzYTRzNGF2UVZ1RmQ1ZEtXT0k1c1BRMkdpcDky?=
 =?utf-8?B?YVBSSVNGSFRHTG1jVHRMSk02UU00S0UwYjEvdUExNXE0UFo1R0NRYjlQRXB0?=
 =?utf-8?B?YlRXcnlRMWZvV1VXQ2Y4cTVDeEMwbTFSSDI5T05VMFM0Wm1kL2xidVZTTms1?=
 =?utf-8?B?MlIrb1RGVEo0Z3lEOXJRSzJHOUF5YTlWRjVXZldTVmxvZVVIMllhUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfa5f8e-698b-4135-edbe-08de4d801823
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 00:02:49.0432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYwDASuYQsNTFSfb+FMa45r7KTuGKzLres0qloN6TTFnc4si91MP1RbnO7vRixBt7Q7II97fmRmFiIlGkDRkFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 12/18/25 23:56, Chaitanya Kumar Borah wrote:
> Add a helper that performs common cleanup and frees the
> associated object. This can be used by drivers if they do not
> require any driver-specific teardown.
> 
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   drivers/gpu/drm/drm_colorop.c | 12 ++++++++++++
>   include/drm/drm_colorop.h     | 10 ++++++++++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index efe61bdd9b24..4b27804bb0bd 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -180,6 +180,18 @@ void drm_colorop_cleanup(struct drm_colorop *colorop)
>   }
>   EXPORT_SYMBOL(drm_colorop_cleanup);
>   
> +/**
> + * drm_colorop_destroy() - Helper for colorop destruction
> + *
> + * @colorop: colorop to destroy
> + */
> +void drm_colorop_destroy(struct drm_colorop *colorop)
> +{
> +	drm_colorop_cleanup(colorop);
> +	kfree(colorop);
> +}
> +EXPORT_SYMBOL(drm_colorop_destroy);
> +
>   /**
>    * drm_colorop_pipeline_destroy - Helper for color pipeline destruction
>    *
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 45d1b1d3faf9..ee6454b08b2d 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -440,6 +440,16 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
>    */
>   void drm_colorop_reset(struct drm_colorop *colorop);
>   
> +/**
> + * drm_colorop_destroy - destroy colorop
> + * @colorop: drm colorop
> + *
> + * Destroys @colorop by performing common DRM cleanup and freeing the
> + * colorop object. This can be used by drivers if they do not
> + * require any driver-specific teardown.
> + */
> +void drm_colorop_destroy(struct drm_colorop *colorop);
> +
>   /**
>    * drm_colorop_index - find the index of a registered colorop
>    * @colorop: colorop to find index for

