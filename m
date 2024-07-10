Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B2292DA81
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 23:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5019910E906;
	Wed, 10 Jul 2024 21:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H53w1wtB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC9810E906;
 Wed, 10 Jul 2024 21:01:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCqE4SrbbR8kR7AwVm6LDhwx49PJK/GDxtiOtMt//R7JNhmbxQ8cWFFf+5R0BuxmLTGO5UkFE25jUwarGZr7GeWphpYaMsaPbWHFLod/QO98zDInnioI3rLnG9jLbbJNYh7gBN/9pZ5ZGxMUl093y6/8TUi/7AlQNrIbRBZ6uzuy75x3LDbnH/mdTTRWM58dNfxUFzruOdxQoOvFLHt5k/ZJ6bog7ATwzg+OaNwrF2fhPhfS/3zZLufsE6sO6y1jhQMTYVJ6vAqGZk9RpsHwj8Y7b8Gdz3/D3TCv/l/w2xuYM4zLYVUVJYgIyFr1Snbgx+mgdEinFcrIALETyIHczw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwtHu3USxXzDsEQZyw/g11w1jOJSLkrztb+v90fvloE=;
 b=crXOyGRWGFU6BsuxsPR2ZOO1hBxdjeWssIMa292Cw02taBdvC2RcpNwqvwCLolXMBJ1Rgbs1ZzDOZiRSA6UrHJMiI7p3Hmw+F98PG2pbXyp/Z9czN56+eqVFokThsowVSD+AggFLzB7gS8t07ve25VnVM/NCz7im6xudEEtV+WHEOY35rwnt7J8m3i2j55OwbHNe9A82l4iA+yxTNDDxbfHuNg0Hz2a4WvdQYRF4OfXOdLTg43UEVrprPw+ZnVVB8d5Ch1Xk03d8fcDLZUnI64WUMUHPt8BorJl82ny8TBvK+tJAEDWr8GeoC2cnTTf4NMfTtO/+IocaXf0z/IULxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwtHu3USxXzDsEQZyw/g11w1jOJSLkrztb+v90fvloE=;
 b=H53w1wtB4v8T9nEWQx9L2C+jDUI97Mk64FB22EBp3IBDWB7G7n8xgkIauq1zQERRlbHWhpag/uBbE7RXK2UlgAwxmUZm6fCDFU+XFinuiKztdPFEtijfokV5ARPmpuRGFeIHvDOw+CIL8khz2lPvgybZir5W/w6KJSCHp9FB+no=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by PH7PR12MB6934.namprd12.prod.outlook.com (2603:10b6:510:1b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 21:01:26 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%6]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 21:01:26 +0000
Message-ID: <3a590f4d-18a5-46ba-a536-a4ea76bda59b@amd.com>
Date: Wed, 10 Jul 2024 17:01:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add support for 'power saving policy' property
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Sean Paul <seanpaul@google.com>
References: <20240703051722.328-1-mario.limonciello@amd.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20240703051722.328-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0277.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::14) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|PH7PR12MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db28b0c-872d-4c57-8eb8-08dca1237682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0FqSjF2RnpzN1dlYklwMmZRRnNTUzl4d2p0eno0Zjd3ME1Fcm1RdlF4Z3d4?=
 =?utf-8?B?TG4xQUhaOHNkeEtGbzBwNTFMUGpLMGVSQ2h2NHdqdEpyWjcwTDZ4dU9vMU5L?=
 =?utf-8?B?ODZzS2R5L05JUWxwZ0EyRmhhSDdGdFRKQUR4STVyRnBETGF2WGJDdGg0ZVZz?=
 =?utf-8?B?cUVYOG53UHRBNTA5azh5MWY1R3lObkVXLzFEMEs5aXNFZk5IUjdGMzAwUzdk?=
 =?utf-8?B?STFCSVRqdE5QNENiVStVR1BnVjFyUTlkelRZN0ZPZXFzU0YzRzRRSm9XUHc2?=
 =?utf-8?B?Z0J2cy94RWlvanA1V2VPbFUwWi9QMmVqNFliME5DL3NaNjNXRUVKSEc5NzNE?=
 =?utf-8?B?N1l6QXNMOERZRy9NUjJyaE5mQmJNVVZJSmFXYmxEeTBqQmNzN0d2V0RPUm9F?=
 =?utf-8?B?SGJtdFpSVFdvTGU2U09INWlGS0UvUExCbW1kZ2VuSXVJUXdrbWtoM2dmNG9p?=
 =?utf-8?B?S3RrTkRCaDd5K05aamZHNzhONFJoSDdHcTAvc1g1VjYxckRjUVJTMFYzbDJP?=
 =?utf-8?B?L3pxUFRSaDk1Vi9zVm9SeGUvZFdIbDdxdjhhYUhCL2xoK1IxRG5POVVWbWdR?=
 =?utf-8?B?YzA5MHRldm5DelUyWVdPMG11UFFpWUlCeTU5TVJnL2ZmbnpWa09ma1dzRU9i?=
 =?utf-8?B?NnFVYUlOVmhXdjgyeHl4RW5zaklhOVdJaU0rZlA3NGlhUHFKeHY5RkZQdW1H?=
 =?utf-8?B?UjNBblRidXVWYW0xUUk4d0pTT0NGR285SUwxeWpHUWt4TUFHWG5rQUR5ZnUr?=
 =?utf-8?B?WkVOSFJtNEVoV2V6bHNQT2xIV3JXTk5VQWh3TDNyM0o1UGdmRFdOUVJYNkQ2?=
 =?utf-8?B?cXhrcXUvNW1BTzNDTGlOSGNUa25YNDJZd2lJV2ZRZDJDdXU3S1ozMk1lTnph?=
 =?utf-8?B?ckRjZ3Jvd21zS1FTUWJUYVFJekNYRTBEZFI0OUU5bE9KWGNVOG1vNFRkaGo4?=
 =?utf-8?B?UnpMMlVjYXBtR29hUks5UGNCOGcySTAwNk90ZXZsb3krOUFUYnBtK0lBNkZh?=
 =?utf-8?B?Y3lMV0x5V2M0U3JVTDJKNHVYd2tHTDBvdzJTMGFtOUNrR3R3R3hIL1MzbGtz?=
 =?utf-8?B?cmFBZnVCelkzNDJ1Wi9kcWQrZnZRQ0xVVmZRellWN1RwdjhwYjN1QkJPK0No?=
 =?utf-8?B?V0l6N0FmaGlrTUJWbnZETlZudTlHeEJyQUoxM3QvRDJnV0RIa2pEbEhiWmk0?=
 =?utf-8?B?aHl4VGlCU01aY3lNNlZGNlVFbGR6eXIrYUVqME9JS1QyRkc1eGZtNElKYm11?=
 =?utf-8?B?VE16cStTS3dwRzBNMmFadU5GNFdZZDBDY1dod1VWOHhFbHFDSm1hc09aZTFD?=
 =?utf-8?B?TlBBVDlCMzEvOHhmRmhHZnJuc1RUNXQ5bnp4TWRXMjFsUjFZa3l1RXY5aktV?=
 =?utf-8?B?dFdEMHdjaVVyWnphV0d2dzlhaXFGa2lzMkNZZG9LZWRXKzlsdHNhcHh0MUN4?=
 =?utf-8?B?U1JGeDZnUXIxcThhTWNvamoyU2t2L01USEQ3SFI4eCtRajVLcUhFUDhzUFZI?=
 =?utf-8?B?M2haQzFUVmdSMy9PV1dhaEdZZHdkOGF5TTJTa3pMUElncHhDSjBKcC9wd0ZP?=
 =?utf-8?B?QnNRVTEvOVppbWJrNzBOMGZybVQ5aE5kR0EvdWF1dDI3VkhDZURHVk5ZVk1u?=
 =?utf-8?B?UXZyKy8vNm9xeDhGQ2NDQUVVTlo5TEZrWTM4MGYvTHhWU2U2dklxV2tWWHI3?=
 =?utf-8?B?alg0aUN0VXlUUnI4ZHYzYjBoV2hSMVZCOXo0R0wzd2FtTFBudnIxNU54cFRC?=
 =?utf-8?B?ZkdNZzBSb2tDSkJPa3ZXUTAvTXpMRjcyMkQ1WC90WG1SUE1yVkdwMEsrMEJV?=
 =?utf-8?B?ZnNYclBSTTgwTFUyODFuQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkxIdGkrSUdLYkNzb1BCUXdDMk1OWENTWCtuVUcwcWxsZm5qdDhCblNRRzl3?=
 =?utf-8?B?NTVuTFlESC9SQ25qQnZiTzN1bGt1TVY4dE8wY1hlZEpZa0tZRlVXNURZYU5i?=
 =?utf-8?B?YlgrUDlmK1NJRzVPZmIza0dzZjFvK3VhRXZ2bGsyOWVyT09HY01MU1J4V1Nm?=
 =?utf-8?B?akFuYlQwVE5pSmRqSzRkcit2UUR6ZndpQ2Z5aGNRN0JROFM1UkJMSFlXaThK?=
 =?utf-8?B?Z21PODI2dWoyUUY3a25zbWhMQ2VETkM0eVN3MUtPQm9qSnp4RC9sYi80Szht?=
 =?utf-8?B?U1lFSldYQ09aWEljZTlrbUZOSFZFMlZhaVl2YVZHeGlxR0xCUUVhVGtPTHJr?=
 =?utf-8?B?NTRhWGpFRFhyaDE5YUF2VDd1MkpnMUNGTlRKdTRpWHNWbHA3aURJVEdoa2Yr?=
 =?utf-8?B?a0xXMDVZZjlnaEgzaS9taWtlaHY4L2tIYk9yUFdFblpiamVWKzRlSnJJT3Bw?=
 =?utf-8?B?MERRZG5uMFJ1Um56aEJJSEx2QkNtTmxPVVVCbWd2MHQyTW5wN0s2d0VpeHBr?=
 =?utf-8?B?YzdGY0ZrVXRXV2c2bUVjUUFPVS95TUFTakVTMWJPcHZyREY5QzRnbE5mT0pn?=
 =?utf-8?B?QXk4RzBmL0VWTGNmVUJoSTdUSWdCTjBVaEZScHRYNHRjcWsvRWYxVHFnV29h?=
 =?utf-8?B?Ny9qU3pVTkFlMDR5Szl0OG12a25yZkJOUE12Y1UzL3VBTk5QaFE2ZlZPWWND?=
 =?utf-8?B?anBOSlRrQWhKNllpQkVudnY1RmRhTTArbGlHUHpMSG9RTUdPOHJFbnVBODhs?=
 =?utf-8?B?cFpPSjJVbjFZcnVDWDhBaEROYkl4dFc4N2FWYmkwQlhwZVE3NVE3STl2akt0?=
 =?utf-8?B?cmUrMGYrTm1LMkVkdWoyNXl3WVZ0KzhZa1U0STErWjJjTXliN3R4MFZRb2Ex?=
 =?utf-8?B?WnJyRXpXU29XNTRqM2UySGJpNnFpS2tIWllVMVFHQ3h0MDJmSUlMMEp6bnZS?=
 =?utf-8?B?K3BoU2RRMVhGaFpLRUhiVWIvM1RWZ0d0NFh1dWQvSjVXcGx5T1hkT2lYWTR0?=
 =?utf-8?B?UzVLWkdaMGVSTU5sTXA0eXh2Wm9JRDR5cS9VUzdCKzRIamhZYm9SNTMrZFdl?=
 =?utf-8?B?aFpVNEFUWjNtcmIyUGs0WFFMZXhBSGs1QXVPMFFSQXRLVVZJaXkwWTV4R2to?=
 =?utf-8?B?NERiMkxSUEtLUE51V3lvb1ZNeEpObFBsdUt6ZkQ4RnNHUGRKMmdIbE91Z1k5?=
 =?utf-8?B?VWNVbGZxVnZBUVJvUkxuYWZ2bTJsajVSZVNPWE9neVV3OTdYM1ZKZ2IvcCti?=
 =?utf-8?B?b1lMVnF0NWQxbmwyT1J0WVF3Y3g3WDVSUWluWkJUQTFMN3hlNWxCK2ZtcUcy?=
 =?utf-8?B?N01nOEhMeU16YzlnT3pWcTJZbldvOEFKMlAyeEc0N1VQSXVFQktVODUxaWxL?=
 =?utf-8?B?VCt5U3J1UXM0RFhCaThxQWM5WHpLQVJ6aldrYnJFeUh4TTZuRkNrWEsxL0w3?=
 =?utf-8?B?TEIxczVHc0NKbkYvZHdYcFZhbkUveGMzdWJHMWxvVWpvLzRLY29LZUtjZC9X?=
 =?utf-8?B?UXYyL3VwMEdCMjBkdmVBQ3VoMkZKTGcwYkFWTkliaUlQemxuazdqTk84cGx5?=
 =?utf-8?B?MGk3cU00TG5qcWJwOWZoYVorYWFwVjRnWnJ4RkZNR1FZVlFRQWphNStMbjBZ?=
 =?utf-8?B?Tk1OOGxMRFZva1QwWThkbGR6UUFnRkxMRlMweU9uVE1JV1VaOEJmOUR1RURz?=
 =?utf-8?B?ekk4UlcxWGg4aXB1WG8vSmlNWTczR3NrMlc5WWxzbHlMR2dtOTB5VS9JQVlU?=
 =?utf-8?B?YWhkYlBkT0tnSWxQK2FJZUxTb1l3OGJvb0hjUFhUSHFoU1NGcTl2TEcra294?=
 =?utf-8?B?aWZsM20yYVptQ2JIZ2FaOURxZTVMaFdNWUJJUUpoU1EwU3ZGdnNVT0grdWFV?=
 =?utf-8?B?YTgzVlZaSTBKNjJIaExabkJhSldkOUdmcitWVWsyOC9vdkVQS1AzMHgrQTFJ?=
 =?utf-8?B?aGR5anFzMnlHQjNlZElIOEl0cFN0T2dVb28wTWxSK0VUT3g3N3VibUtiM25j?=
 =?utf-8?B?eGgvUEVBRFlXNDg5Z2s5R2szc3VNb1JwK3Y1UEEzYzNsaTVLQTZ4NE1ZaHVK?=
 =?utf-8?B?b0l5V3c5bjNTdlp6SjlxaFZGU085TERuK1hZSnFZenBrV0NTclNCT2hKRlJQ?=
 =?utf-8?Q?C3wLEc+E9n9akOBeVhwJu/DSI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db28b0c-872d-4c57-8eb8-08dca1237682
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 21:01:26.5255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKPVkH9PyFh4MYeapwbenFGX9doaFQbkFoZZT9avA9V0elDlkN+B3zukZsGCeLSEk8kZUzjMDtosf4BpcIpa3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6934
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

On 7/3/24 01:17, Mario Limonciello wrote:
> During the Display Next hackfest 2024 one of the topics discussed
> was the need for compositor to be able to relay intention to drivers
> that color fidelity is preferred over power savings.
> 
> To accomplish this a new optional DRM property is being introduced called
> "power saving policy".  This property is a bit mask that can be configured
> with requests of "Require color accuracy" or "Require low latency"
> that can be configured by the compositor.
> 
> When a driver advertises support for this property and the compositor
> sets it to "Require color accuracy" then the driver will disable any power
> saving features that can compromise color fidelity.
> 
> In practice the main feature this currently applies to is the
> "Adaptive Backlight Modulation" feature within AMD DCN on eDP panels.
> 
> When the compositor has marked the property  "Require color accuracy" then
> this feature will be disabled and any userspace that tries to turn it on
> will get an -EBUSY return code.
> 
> Compositors can also request that low latency is critical which in
> practice should cause PSR and PSR2 to be disabled.
> 
> When the compositor has restored the value back to no requirements then
> the previous value that would have been programmed will be restored.

Applied, thanks!

> 
> v3->v4:
>   * Fixup for Xaver's reported issue
> v2->v3:
>   * Updates from Leo's comments (see individual patches)
> 
> Mario Limonciello (2):
>    drm: Introduce 'power saving policy' drm property
>    drm/amd: Add power_saving_policy drm property to eDP connectors
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 ++
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 50 +++++++++++++++++--
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
>   drivers/gpu/drm/drm_connector.c               | 48 ++++++++++++++++++
>   include/drm/drm_connector.h                   |  2 +
>   include/drm/drm_mode_config.h                 |  5 ++
>   include/uapi/drm/drm_mode.h                   |  7 +++
>   7 files changed, 113 insertions(+), 5 deletions(-)
> 
-- 
Hamza

