Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8011193C743
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 18:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C5B10E301;
	Thu, 25 Jul 2024 16:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rB/jWJFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9052E10E301;
 Thu, 25 Jul 2024 16:39:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfHdOjvzUPJ6PIQmZjc8JcVkaVfUTpgT1FRyqsxomlRNWwMrvvA63noSxymwGK8o15F6ZBXVDf2LJv4w7Dd3M29MGWsEkULwk08iTEdyxwVE9PvGUzqj2HI0jkRTJAflxkeTxpE/fcWKahdj7g284eGzWl29GQhEGgSDHgjzXquT2zt7cIdlgK2r5Lc1QUcyhdp+tSPVIS3JRPvLlkFbZmQdIyPEqzmCDBsT/BK/bBi3VxrbaYAHNGVQbRZuhSSecvzEF9jz3Dm1XnjBiWA0q/NYPqnuAjwhB58UxfcPXd7eGm4qo/wPTnPb9upOWFIgOQnTYXACCc9VYz8yPpjjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNdV3PPx3+ft1IpoQGOKGKDlPucypyZ2gR/hv4LNb+E=;
 b=S7yVEjlCY7djN7aG/Bs8bn4wwY+9G5YzWZ2N3XeMzLFvYPPzhSwnp8HZSnxtGxPWeSjjIO4cCblnx+6FGLrlYoe2irKN993zlPQd+6BcQF1CSEuSfcIYrD9zsnG0p7SisE5AhSu4iZm4Cyb/q3bx4vIfBGk/rm/iA31hGunzSO1XUbXjc4xme8GRqgOTPhbAdF91mw4RNaZL4/U6Yx15Zz2iKk8lE3RI4VxYiuU28P8BigNu5RKNVcqYIdeVNNiffQAfEpvfRbulRIK1Zk/7aIiJdm/I3PLq3LMF/8WTcA/RCVIz7ECBOJn0UrXcfgdo7Dq5xpfVxhstslSpVatqsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNdV3PPx3+ft1IpoQGOKGKDlPucypyZ2gR/hv4LNb+E=;
 b=rB/jWJFWgyuOZeoH9VH2l4e01yaMX1tPodtnRqL4TvziSQwmZNZYZ1NI4PPWfU9eP2FhRfpKNhdWq0yCq+DlgH3r3XNYfFQHZ8xCs7b2GS2zpgA5LdqUyPV8iic3APpw8Y4PNuADbBbHj4fEXJg6c/7ekyKsGsWJrvJKkmFdIRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by BL3PR12MB6475.namprd12.prod.outlook.com (2603:10b6:208:3bb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 16:39:47 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692%4]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 16:39:47 +0000
Message-ID: <5ba61e74-6435-4cfe-b21f-8690f47ea44f@amd.com>
Date: Thu, 25 Jul 2024 10:39:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/11] drm/amd/display: get SAD from drm_eld when
 parsing EDID caps
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240706034004.801329-1-mwen@igalia.com>
 <20240706034004.801329-10-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20240706034004.801329-10-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0239.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::27) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|BL3PR12MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: 06523a6b-1bf3-4ee3-39ff-08dcacc86530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVBYcncxL0lEM2NJckpEMGZGejR5Y0g2UXYvNERlM3dWT2NvTTVqeElLWVpM?=
 =?utf-8?B?cjFlTXp2ZjBPdi80cUsrZkFxZXRVYTBKbEU1UDA4ZFNINlVOU3dObjZRZ0Vt?=
 =?utf-8?B?M1U1Y1h4QnNEWDJhcWFiQnR2c3lsQTdlQ3puRWhMN0JnZnpzNWJCdXJ5eC9E?=
 =?utf-8?B?MnJiaVVQU25FVENrSDFFYlFLa3hlYmszZCtRWW5vY1NMaDAxblBZcnhRVVpl?=
 =?utf-8?B?YzQzNTkrWjY4aDZ4di9mWHF3NTM2NFBrelllakJHNlh6UEdhTFVOeHpMbGtW?=
 =?utf-8?B?VkNYMFhZaUoxNXpHM09EcGRQS0YrSnBWTWF2VVB3UDhtYlVnNlhGVm5PVmxQ?=
 =?utf-8?B?TERZN3JORmVGOWNZYWZhTUdQYnd5eUpDVzQ5TXp2eEdKbDdzNHhqK2FBZjRF?=
 =?utf-8?B?cVNWeUJyY0hJR0taeXkrZEs1Z3pvVlR1dFhNaG1oUTN1Y0VGMEhha0VOTXJR?=
 =?utf-8?B?TzNXait0MStEb2FiTEYzRGIrTkRXWStsUHJmV3pjUTdxa0F6bk8ySVNleG1P?=
 =?utf-8?B?R1VxQVdlR2wydFZxOURWWCtUQkFhTlJRT1pzQ2R3THhQWElvdmxjUXZ3cUdj?=
 =?utf-8?B?NzR2VXNrdFp5OEk4TTBFUDVDYWdYY3ZXSjllSWFVTmdxdWpsMlgrRUlvdDlF?=
 =?utf-8?B?S1lTbG1Fa1RjQXFnY09JLzJhdnFnYnJKcUVzUENZTk9qQ3BSekVRMDZRZ2Ix?=
 =?utf-8?B?N004S1dFSVlIRWludGVxZTRpd045TmIwaElIM1VlbjVyQjBhRGhVK2JMUFJG?=
 =?utf-8?B?UndHVGRnTkRiMTFsSHAvYXMzdGJqblQ5aDF2UTJXNVZBNExGUk9HSDJnc1E3?=
 =?utf-8?B?OXVpTVNCOUVGZ3lidTNRcG5OT0dFWTE5RVdEZkZLQmgrRldUdFo0UEFjUTlQ?=
 =?utf-8?B?ZHB1MElQMFFjM20zRmxQeVFYcUpTa2NrZk9VSjZYeXZLVURWeWhncXpZa0U5?=
 =?utf-8?B?S2JBRUxHMzBsNWRBZkphbTQyVXFHYndwQk54TkpQMHV3RjRNM29uaktGSGsy?=
 =?utf-8?B?UmtIaFBRZXZFeURwbG5LZ1FCOVNlU0hBalV4KzJtb0lQcjJBczIrZmZCaXps?=
 =?utf-8?B?UGNlSmdwWHZxb1JQbzZFTWZPUE11TlMzazZpYXNUVG03NlRGYngrQlo0Ukx1?=
 =?utf-8?B?MXIxZ0tGNmdSZU9ESk1OZTR0cXg0ejNkRVYzUjJlT0hMZ082bU82c25mMk9J?=
 =?utf-8?B?NHd5RHd4cTJoQ0tKWE1mRENzaTQvUjJkZDR2YUJIYkVoa0dYR0JPSVJLcXhh?=
 =?utf-8?B?OWtKVzVYOUNwM1NuVHY1S05zZk05OVFKUC9YeXpQbFNvcTNSU3hhY0tZTnls?=
 =?utf-8?B?VFljR3Bzdkw2cXRkQXlNUWExMWlSL0lydmErTlBxN0VscnlMRThJc1pJcmox?=
 =?utf-8?B?V2JhMHdKZGVQM1Vwc3EzV0tqZXhCMFZRMzBITEx3OGZXN1ZTYmhpTW1zajU4?=
 =?utf-8?B?VzhWa2ZyVG5JQmI2QTBFODUxLzdVNWdWdXlzQVBSV2tWbEw2MVZKc3ppYUxB?=
 =?utf-8?B?RzF6YkZpZzI1S3g3TUp0c01XSEExeC9IWDFzTy85MXdqL2RHNXBxOXJHQ1NI?=
 =?utf-8?B?VmRwbXRIY1E0WVdMT09Mb2ZRM2E5U3FURDI0a0dkSGlYS09aQTUxV095Q3ph?=
 =?utf-8?B?UGtHdHFBaXVJdFpZbHVIdzhMeThQNmJqMEhSWDBNbTZuK2trSk01RjNJbEsz?=
 =?utf-8?B?ZXBRYW9STWY0RUl2dHRNUnNaellPME82NzlacFF0TzlPcmU2czVvS1JsdnZM?=
 =?utf-8?B?NFlOZGRJa014SzlHNkZFZ1hKZG1RdUVRbmxDeVAyREVCTEx0c3phQzBQQkg4?=
 =?utf-8?B?Vm53dHlNUVJEaGkra2hhQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8495.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFdXeFVBbm44Q0JWOFZSTEtWREVHUWN1dkN5L210NHdPREMzMWRvMVhMdUtq?=
 =?utf-8?B?OTlCdVBleTNZREJMQVR1dHhtNk82Ujk0VWpVRVFDd1N2WHBMQzVIS29Zbzdr?=
 =?utf-8?B?TUtTdDc1a2JCaHNHcWkrMTA4ckdnR2Rxd3VVSnl5dUlFdmNTZkkvK1BidklB?=
 =?utf-8?B?RCsreG55MGlCYis4Z1BQeDRXWHo3bG9SZWtFVFFlVzJ2NWt3RStlaVFVUDRx?=
 =?utf-8?B?Z2lXcUNQR042Q0JzVTgvS1NxM3hUbzVnZjRoM3RNblRhSFhBQ1BWZXFDazEz?=
 =?utf-8?B?L3grQ3YzRzI0WUptUVBQejUyZTUzbTdENHN5Z1RCMWM0dmhCRmlERk5RMjFv?=
 =?utf-8?B?N1ZQWWsvZkFyVEx3d0M2WUttWFN1cGVaNlN2QUhraC9EODkya0U3aC9weGNK?=
 =?utf-8?B?ZDE2bUNtN2d6YmVLa3FPWG1kWnB6M3kzcjhnQnl4UmpRdWdOLzdpS2Qzc0s1?=
 =?utf-8?B?TEFBRDZHSVh3QVNtdFhsVmFRSzIvRmtGanA2eVZIMDdhYWZQcTdyN1Y2djF1?=
 =?utf-8?B?OGF6aVlUakwvQlNmTDJiRnV2a1NBQms2TS9GL2JlWFlRZ0Jzc0g5TnhCSHQz?=
 =?utf-8?B?eHZVUnNhdko4NVRCVTU0dGV0d1JDTE9sSkYyTEYzdS8yNHlFZWhpcGpPNUx5?=
 =?utf-8?B?TjZzY3huUVM5ZzZxZ3UvSFM1UUowOThSTmVkN00rb3NHSXBIbmxQaENsQ1k5?=
 =?utf-8?B?MVFRYzhyYmtkeGxOTkdCWU02U3greXdPc0Jyd1U5c2hINCt1L1QwbDNjRTNz?=
 =?utf-8?B?V2QrVGFiVmFkV0MrZGY1c3lwMDU0Mng2NW5Fd0lGV0VFV3VyUFBuaW40cmcy?=
 =?utf-8?B?dzJrb21rRWhrRkhYcGtxNlNGSkN3RUZuU1puTXRUZnJjUWNHa2RIcHBUelZE?=
 =?utf-8?B?L25SSTNIOWRrM1NWNlRNRmRlVHVQSVBWS0ZnTDdYSmNvVldOLzlCUHFod2Zo?=
 =?utf-8?B?S1hGRWk4SWp4VDNwRkhvaXI2M2EwQ0JuVlNYQW1vb3ozZVRzT1hwOFZ5bnpK?=
 =?utf-8?B?ZU92R0RKblJuUXpEcFh4UUFQN3JTSjh2Q3JaL0Z1eFlPRjllaG1NZGhLeGZY?=
 =?utf-8?B?bzA3azNhY2FGcUVON3BKN2xZM3FhaUJNaEJLQ2l4cnU1bkNXOWJOVWcwRjZ5?=
 =?utf-8?B?bU51d2dvSVUzYnUxRTJ0U0pWRUNoKzVSKzJpazlxSlE1TkthNlEzdEtkenRF?=
 =?utf-8?B?c0pZcGNmRVJ1bko1anB4SUNPU0JnNnVXakYxS0piZU5FODhxN054dWpNeUEr?=
 =?utf-8?B?dURBbjN6dXFQMlZtelMvNkQvRktUbDFQcDFpL0UxUUVua1d5bnFWYU1kRXNX?=
 =?utf-8?B?YnZGSjNvOEg5bmprOU5FR21FQ3pRTzZ3STZZb2hnMUM3aUh0bFNyM2ZjaGpX?=
 =?utf-8?B?TVg3cWRzZmZLU2FjT0kxRmpFb1BGcEp6cmpLUlB6NGhSV2RjeGFiUExDdmxq?=
 =?utf-8?B?d3lWdE9kNFFYV1B3VUo1VGhIMmlDNTVaZ1BNVVJqVnc0cVlnWW1laXBVVVBo?=
 =?utf-8?B?endHR3QxdHgxMWZoL3RZQW5FcTk1eUpHK2N1Uk9MaCtwa2xhSHZHNFpjZWhT?=
 =?utf-8?B?SnlpNUJ2eTBkNWhkRG93ZzBlMTRQVmdwSWZpRDVBSkZHN1JjTnhRMlZXbVNh?=
 =?utf-8?B?UFFiZGhHTTNjU1JMSjhCZ1U4RkpOQ3EvUkF2bVpZSjNIMVlDUWZaV2lKSEF4?=
 =?utf-8?B?QTA0WDhYQ2xmSURYZE5WY1FTdlk1MmNoYmxUcWE5eUFTN1NPL1ZJOGdYUWRL?=
 =?utf-8?B?TEttbWt0eTNkZjFqRFgxVGw2Q2xTanFqamZ0MTlMeitGa1JVQkI3YWNIL2hO?=
 =?utf-8?B?SzBzT0hpQVVBd09mZnNjRkRxQjRpQjh3LzlZcUdtV3A2a0hkei92SUhad3R2?=
 =?utf-8?B?d0NVaTQ0UThMMG4xb1NRbTA4UVEzaDZob2VZMmwxeDM1OEt2djJIb3ZiS0NB?=
 =?utf-8?B?eEJ2RGVKNEFZdVpERHJsU2hXTlNlRnArT2h1RnphQnFaUUdZZUl5M295d1Vt?=
 =?utf-8?B?S1dsSDQwZGZDa0JtRE0wdEovMnpIelJCRnVNYjl1Y3Q2UFNrVGU3NjI4Mmg5?=
 =?utf-8?B?dFQ4K2Vwc05oTjVEK2lzQ2g3RGx3NE1OQ2dFY3JMRFpJUytqUnIzQ1ZwZTds?=
 =?utf-8?Q?JPu7gdw5OJBOihiDL/7sM213d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06523a6b-1bf3-4ee3-39ff-08dcacc86530
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 16:39:47.1990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbaGS22MGBBevKu6bskpC5e/c2vG9uh8dt9bV9zEaxEThYkysR0wAydQ8WEsSsUIE8eSL8q4KIn04H79FtxYcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6475
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



On 2024-07-05 21:35, Melissa Wen wrote:
> instead of parsing struct edid.

A more informative commit message will be helpful.

> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c   | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 7657b1051c54..45c04de08c65 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -97,7 +97,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   	const struct drm_edid *drm_edid = aconnector->drm_edid;
>   	struct drm_edid_product_id product_id;
>   	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
> -	struct cea_sad *sads;
>   	int sad_count, sadb_count;
>   	int i = 0;
>   	uint8_t *sadb = NULL;
> @@ -127,18 +126,21 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   
>   	apply_edid_quirks(&product_id, edid_caps);
>   
> -	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
> +	sad_count = drm_eld_sad_count(connector->eld);
>   	if (sad_count <= 0)
>   		return result;
>   
>   	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
>   	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
> -		struct cea_sad *sad = &sads[i];
> +		struct cea_sad sad;
>   
> -		edid_caps->audio_modes[i].format_code = sad->format;
> -		edid_caps->audio_modes[i].channel_count = sad->channels + 1;
> -		edid_caps->audio_modes[i].sample_rate = sad->freq;
> -		edid_caps->audio_modes[i].sample_size = sad->byte2;
> +		if (drm_eld_sad_get(connector->eld, i, &sad) < 0)
> +			continue;
> +
> +		edid_caps->audio_modes[i].format_code = sad.format;
> +		edid_caps->audio_modes[i].channel_count = sad.channels + 1;
> +		edid_caps->audio_modes[i].sample_rate = sad.freq;
> +		edid_caps->audio_modes[i].sample_size = sad.byte2;
>   	}
>   
>   	sadb_count = drm_edid_to_speaker_allocation((struct edid *) edid->raw_edid, &sadb);
> @@ -153,7 +155,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   	else
>   		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
>   
> -	kfree(sads);
>   	kfree(sadb);
>   
>   	return result;
