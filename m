Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F177C9B8386
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 20:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9B510E91A;
	Thu, 31 Oct 2024 19:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qr7lliyx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2063.outbound.protection.outlook.com [40.107.100.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACC210E919;
 Thu, 31 Oct 2024 19:37:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTNLgy7Owqa2y7JdfDGGuDH1JFVInKsMCBsPLTGG3mF4C0c6IR6B9crHJ1FaiZ5N1250sz1j7s3evrmtpKSO+a7QGPBgWWeSGDeSvNLcUGlbJbnNC0Z6Maq63Q2TkSqVI6YCiz/iU+I0msYBjhWRXGT3/G1EMyKCNuP95oxvXuWTv4SyEI/Zs0CXS7xvST3Do4UILqxU8WHUPtx1hBwelw45clutFAHB4go8VsE1/9kJMrPJPJT+BtHGEbo19JisXg7lemh2xuxU9a957f+9C10Rj5DmYnyLgKmbSQmk/6Ek7lf8TG6WHArwL61hQwKVlzP87CU7tbRJ4twSkhTUfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZTTpmHKXRz7CnrVAc5TaQWAhuYd9JOjGJjmlO/wkpA=;
 b=GHonMLUscaS+S4gErz50WXRBPYIucTVZlhZFQDBdgzg5hmRiZDUmlZVv6BKw+juKPVHOXnrHu+lbk4NAKI65aP8iEkG19kWfRRgsOMAQCzXnsr0Ky7kJKYufzgY4Ig59jz1O/cdkry4x+5VL7VJT91iSLiNiDw2SNG+DHtPLMZFoX0FiqAx4GI4nqCIpdokwAJxNdIqv9mKq/YlDtPmZQEoSs5BEsgugwwYa523/0eUWyoUPwtkvs/upPMEwBb+t7JjhP6cHqxC2S71AuF8rkWO1EKPmne5wbVbabk5BZ3Bve/3w0SoK6zr8UhxHR3TMN/4HOlp/B0JLLpW9LPo37A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZTTpmHKXRz7CnrVAc5TaQWAhuYd9JOjGJjmlO/wkpA=;
 b=qr7lliyxBnEzexOrycl/4t5ZdHwmz7dF73O9EV09DYVp0B1s08WvMO1Inf7La5p1INWJ4+MeNq5UgyAHEo+8a7HOgRSyNnkq5qra5B00l3KKKPv+KQczCM6IWNIOBSfw2FTW0ClBdo4dkole9JqU1/9OjRdsm4xEGtNsltqJS1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB5807.namprd12.prod.outlook.com (2603:10b6:510:1d3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 19:37:21 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 19:37:21 +0000
Message-ID: <00e9b1f0-7bc1-418c-8e67-e8f1893be665@amd.com>
Date: Thu, 31 Oct 2024 14:37:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] amdgpu: prevent NULL pointer dereference if ATIF is
 not supported
To: Antonio Quartulli <antonio@mandelbit.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241031152848.4716-1-antonio@mandelbit.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241031152848.4716-1-antonio@mandelbit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0004.namprd21.prod.outlook.com
 (2603:10b6:805:106::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4aafa6-29a0-45f1-251a-08dcf9e37042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTIzNWl4S0NmZXlyRldwMWFUY1JqZ0hpY0pYWXE5MVNXaXRET1NrZ3E3WHlr?=
 =?utf-8?B?UnNEREc2WjhCYmYrZTJraGZDSzdIZEpxYnZVNWFlUDNKdWh6dkpSQ3dtUGRO?=
 =?utf-8?B?ODlEd1AvK0ViMThKNXI5U3pNekJLYnZjZThVM0JHVHdRcjE5clNRNlVlNFQv?=
 =?utf-8?B?TWZ2MG9DeWxiTVk3RUgvUFRIU2VwTmhuQzFWUUcyNlp3bDdFSzUyVzBneGRY?=
 =?utf-8?B?eFkxaUhQU29PNENqMzNTT0o2U0QvL1E0REt4QkYxeDlITUVMNDJidVoxRTZ5?=
 =?utf-8?B?N21qeVVsVmZyUW02VFRqU0R5NUt5aEE3cVBtQU1ub1RnNkxHSm9mWkwwS0hv?=
 =?utf-8?B?M0d4NGR6R1RDczdnNTg1cGZob3JLL1J2eFJVSnhWcFd5czZpMTkrcXBiK0RP?=
 =?utf-8?B?amtOVm5lZFc2L2l0djRLWEdRVjZ1aTdNaXFSdHlBS2Z5NEZPaTJZSzBValo0?=
 =?utf-8?B?UGJFYkg0T3hhTWpkNFlHVDI5K3Q3VnpkbU1CbFhTV1J2YzErUWgxa1VKRCtM?=
 =?utf-8?B?MStDUWd1Wi9VYTJXZFZubDZnVkJobkkvNEpRSnJaTHk5TEwwMHZxdnNvWXRQ?=
 =?utf-8?B?SGtLdThLVE96OXJDNmt2eDFBWG5qTG5oMUJZRXNIU0UyK05zbWpvQVZHbXhN?=
 =?utf-8?B?YWxhRkdSSkxCTy9XZ0F5MkZOTDRtQnA2QXdrZWNTMDhmMEw1UnJDS2JRVStq?=
 =?utf-8?B?OWxRN1k1MlFXWldzeElkL3h4RjJqN3FjT3ZOVUtsRlg0ekw5Y0kzN3NuSFZy?=
 =?utf-8?B?ME0wODBwNWhRaGEwQmxzRlJsTGVpTjl0KzU2Mm5jclArUlBOYitOajVQY1Vi?=
 =?utf-8?B?SmtHc3RHQXRURkh1ZytNYUFkaTlvdjZDZzd1eFNoNHNKWDYrTHRodmgydmFF?=
 =?utf-8?B?dmhuSmZlMzZQN0ZVVDhncFdEQzZSTnlXOUNSNGZHVFl4QW92dnkzdVFEYkVa?=
 =?utf-8?B?RlFZbVNZRUZZYTAxWXJCVHJvMVRhOHlyM0pIcEoxT1NOaUlaRjhzZGNqRGZi?=
 =?utf-8?B?dnBhdWR2eE1VNzdWWWJEU0lHbVBiSVhpa3h0bU1pdGdvR1RGcjhkd0lFSmQ2?=
 =?utf-8?B?SElYM0JkUWZqWm1TV0hNWklSeUV4SjFNMDd4VFhSYnFQaHkxc3ZCemFTdWpH?=
 =?utf-8?B?UDFTc2hOUVZ0RDVnRittTXlZOS9oSVlJWVJaeTZKamY5dkM5Zm1PY2MyTTZC?=
 =?utf-8?B?b3ViVDFRUDIyVjdQZUhlZFBmaEZ4VlBUVFZlUzRtbDZXd2tJbUFvSUMzZDdQ?=
 =?utf-8?B?MkErMURBa2JCM21zR0NKSjEzQnkvempmZXowaUVRQ3pUWERaZWlub0JqWGxr?=
 =?utf-8?B?UFczdmZQYTRINVFmUmY1Y04xNXp5Zm9oSXlTL0RaRDhJVjdnR3JRVDZyOWUz?=
 =?utf-8?B?U1o2MTVnWjhKbVRxVjBEdzFMRS9oZGpzL3ljV0d1Smpyak50YmRLckF6djFk?=
 =?utf-8?B?VUVqbWdobm92MUdBaGdncWJMcTVWd25NTkxmR2RlQXZTOVpvQWtDWWZXc3VF?=
 =?utf-8?B?R1BnZ0d4amtDRmNBelBFSitxRzIreGk4TGVKVDl5YitUVGFZYm91OEw3dHpW?=
 =?utf-8?B?MFVaVEJCbkhTYXRhanFqeXRpOE1RY1F3OUpFNVlxT0sxbkhpNjNsUFp4NnZu?=
 =?utf-8?B?MGNOMEtma0Y0OUE1SUZJODUxeVlNUEFWS1loT08wcnVpSnA1ZFlFTEVTRlNj?=
 =?utf-8?B?WEVvMUNrcyttR3hrMHVuRkE2cVJlWFpqR2lpb2V1SVNpM0Jwc2kyQkU2b3I3?=
 =?utf-8?Q?oATGmaY+HWWYMWf97TfT+cTFLK/cfWmiqiIgfrf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V09LRk9WSWVBMHBqTlh5OURpTE5GMnltOEVIM3dqMU4weXlDVm1xT1M1bHFm?=
 =?utf-8?B?K2t1ZDB1alpqMk1MdDI1Qzg2QU5FZzBrQ01tS1BGeFZjS3drWUxyMEowNUNs?=
 =?utf-8?B?YnMydWtmbjRvZHM5dCtsTDJFanViYi9ubnhVYnlLZ05qWDFLaTNKN3J4Vk5Z?=
 =?utf-8?B?MlJhNkR4QzBIZ1U5MC9ZSis4WUo5NG80K0lGakRjZWZMQ0lYdFNaRUQ2aDZo?=
 =?utf-8?B?ZEhGQmE3MGs2bVpOOW5MMVpVODZvbDdwMGdEVmZnQ3hWQkcyK3M3SDBQNERN?=
 =?utf-8?B?ME92a0JZM1diMXZLNVJ1TGR1elZ4N0pLempxZnQ5TjZXRlp5bE5oUXd6Wm52?=
 =?utf-8?B?STFNeUpQRU9peXlkdTQ3VTZlcFB0Tm5hckg2b3d0eGZsempjWGN5ZFBDbmho?=
 =?utf-8?B?SjFYWDZnOGhmTlhyMTlQNzI0cUc0V0NxaXNKdENPUk10Ukx6Rm8rVUtOcWN2?=
 =?utf-8?B?WHZwSnpaWnBncFBNSjBSRlJjSC90VHhiM2RWWVdERmF1NzNtUzR5bERabXNM?=
 =?utf-8?B?SGhrUFVna3gyWmV0c3Ywako1T09GSmc2SVZXMHBEOWk2bWxzL2w4eWFoK09E?=
 =?utf-8?B?ejZiOTVwa3NlZFZIYXFRSi9XdU5YYW5teEc0WjhYMUhva1VaeG1rOUNlOTlq?=
 =?utf-8?B?bWxyN3VaeW11aDlWd2FtYVJ4V242c3J5bW9UTllBYmdUWUFZU3ZDL3A2SGd6?=
 =?utf-8?B?ZXg0TFhRdWhoZVFuS056WFlKa2J5WU05RU9zekhDb21qVUNrN0N0TTB2b28w?=
 =?utf-8?B?bXBWM05VRDJsVitLNUJnOFBWcUd1TEJlcWtEUDFhdmFLaDJ2dUJ5TlJ6T09O?=
 =?utf-8?B?Y0oxVmxnTDJaWEQ4NW1xZGluNEduUldwTk54bndaYW8veml6UkEyRVgveEgv?=
 =?utf-8?B?eHFIT29MTEQ1cTlUb1JrQlVhcFNvN3lwcUkwUHZ4WGljaXdZK005dGI2V2xH?=
 =?utf-8?B?cjN2V1hqRDBIYmVuK3ZpblpJSzR1blBwS1dtTTVGMXRXNXhmU1R2MU90aVJX?=
 =?utf-8?B?WDZqZ2VWRlZoeWx6d0lsOWhFM3VvYmFNSFprWCtIb0FBdE93WUppM0ttMzUw?=
 =?utf-8?B?RjJFSy9yRlBJTEhVUnZUVUJPZFpUWEVpQm04OVp3MGdrNXh4aU9PN3J2TzE4?=
 =?utf-8?B?clR4TmVweVUwY1ZTQUdwODh6M3FhVkxXRzB1NENmYUxURmtCLzQ4US9HeHVj?=
 =?utf-8?B?R2RZMnFzWEFRemVkNWxrQ3NyMzY5S3V2WStCVU8yRWlWVGx1QTZFN0tFcExl?=
 =?utf-8?B?WXBRNXp3UkZNTUFQSjZBckpCampaektxS1l2UXpvUlBha0E2NGYzRkRpVXpm?=
 =?utf-8?B?VGNDMjl5K1FPZXVFNkUybTFJM0NIZFNsaFJrSURFSEVZb0NHL1FLMTBraUpl?=
 =?utf-8?B?U2xEVlQ5NWUyV1JnVm9qbXNiWExKUTAxUlZ4ZEFaTG1RdGNxN0tlanprczVi?=
 =?utf-8?B?TmozWjVwbDg4N0hBbWdDbzI5czRLazJQY0hMWHZ5ZkNWb045NzFtSmJpcVhI?=
 =?utf-8?B?ZDJmUHM5dlgvWHcwWHM4KzVvb01VNHBPaHFtdS80MkNBcHpXR1VHRkt3Z1U5?=
 =?utf-8?B?aDdyMGUzV2hKREFEZWdMOVRQQ3dsa2h2UDE4T2h3Z3diYmVoaFpjZmFqTzhN?=
 =?utf-8?B?ZVFYN1RXeURMQTBnTGtGV3U3cjZNU21PSzVqSkJGM3owT21ETXkzblhSVnRS?=
 =?utf-8?B?S3luMExWVG9nQThobzVrMjF1TUYxbjJ1Um1NbFlaMmtiOUlDZHFzUzVRTkhY?=
 =?utf-8?B?VXI4cDNYekIxK1R4ZXJLTkV5SllIVkwwTitvL3BXcFlBdUNGMXRNNlRwQWJm?=
 =?utf-8?B?d2lUMG5zRmtSQ1B2VEY0N25HeDYycHEweFdVUVVzbDlLZ1loWW1XenNJWmtS?=
 =?utf-8?B?SkhHelVRUXF2N0ZOTGc5aGRtVXZOVFhBb01mZEVINTZXV2YweG1WOXFUaFNY?=
 =?utf-8?B?YTRXK2crMlpqZCtlSFpFL01LSlpwaE12QWJadTlLK2FFU1dnUTNyS1RIWXFz?=
 =?utf-8?B?UE01Rk1OTW5kR0xidXhVRGJZSU91YmRhcWVMMW1OMlBXM2Mxc2ZXUy92OG9j?=
 =?utf-8?B?VldLSUlXU0Zxa3pyTDRabUd6aTFJTEFDWFJuakNLZGp4dnV5cGVOSmJnRUNB?=
 =?utf-8?Q?oyJOyads3q1vZJr+gkBCVFLCi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4aafa6-29a0-45f1-251a-08dcf9e37042
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 19:37:21.7640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKgjJc+3F/1SOuPKRJUdEa16spiwwfXJ9ySdo8igzB4WnooDAPb1FReMRSawsLHogYu7f/ZEC+jvi0aOBKrGGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5807
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

On 10/31/2024 10:28, Antonio Quartulli wrote:
> acpi_evaluate_object() may return AE_NOT_FOUND (failure), which
> would result in dereferencing buffer.pointer (obj) while being NULL.
> 
> Although this case may be unrealistic for the current code, it is
> still better to protect against possible bugs.
> 
> Bail out also when status is AE_NOT_FOUND.
> 
> This fixes 1 FORWARD_NULL issue reported by Coverity
> Report: CID 1600951:  Null pointer dereferences  (FORWARD_NULL)
> 
> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>

Can you please dig up the right Fixes: tag?

Besides that, LGTM.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index cce85389427f..b8d4e07d2043 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -172,8 +172,8 @@ static union acpi_object *amdgpu_atif_call(struct amdgpu_atif *atif,
>   				      &buffer);
>   	obj = (union acpi_object *)buffer.pointer;
>   
> -	/* Fail if calling the method fails and ATIF is supported */
> -	if (ACPI_FAILURE(status) && status != AE_NOT_FOUND) {
> +	/* Fail if calling the method fails */
> +	if (ACPI_FAILURE(status)) {
>   		DRM_DEBUG_DRIVER("failed to evaluate ATIF got %s\n",
>   				 acpi_format_exception(status));
>   		kfree(obj);

