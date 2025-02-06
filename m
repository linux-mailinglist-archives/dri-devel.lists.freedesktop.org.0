Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA453A2B5F2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 23:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D0A10E98E;
	Thu,  6 Feb 2025 22:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NopkpfQC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2077.outbound.protection.outlook.com [40.107.212.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B9210E97F;
 Thu,  6 Feb 2025 22:53:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjhGiH0r/uhdtqIJQRdak/Erj0Wvao1fvoBBXPyNkqCHdjq3dEi4SU1WJvrGcZe5h/+gRjq9RcI2SQqRgSrtN2v673BWU2yJSJNMXk3pzGXcQsI0QtBpWetieV4eLbbM0gnX2CvpaL4mBQPZ6HCOswtduAHRkw3OLSIMXfZSMOAGCSq8poARXzQ7Fv5u6F2WiEg1Ko8oFqE12l/X2JsZ6umvNTugAz1Tnk65gz+xt65Soy7x53iq40avPCgHlybRoeTYkkEkN8DwT7O85hLj8oKGJsu7VJtBVsHOimLdaXU+7LRRFfDySwKrD7kR/JwWr6TF0bVtsXebFn8cyDit1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfmwKZH2U5n4XTnQioXNaIKQRGpP4mv5myUXh4a3Emg=;
 b=ZudhAcAbsijISnv4zs+AEPKIvJ9dFy769C+VurwZoU6gH3tpnDRZ12I3FWBiFeVuugQ3TvZTxfZARZ/870VA64IsC4QrhwPvUW6H5pKdpt6RgSVjz9b2yR4UYL+9pZos7T9qgdTDX8O5CntzTqh4sB7f/XkO3cSmrPUNDFZtjUyUCDZWHX7SzExJ5JiAjiqaD4ywTw/9ZnF1wfCJFhbVRIRaQji20DkaZmX3zbvgiYUavg9zjgi3l/fIBH+8sis98zhPWNDRBmLojhalFI+xm7YEn/06/KE43PLv1G7ZFFyGkBzUsWo3BAW+RQPr8sE1oZUZpe7bGQ+dmVkpV9j3rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfmwKZH2U5n4XTnQioXNaIKQRGpP4mv5myUXh4a3Emg=;
 b=NopkpfQCIZYqLepuo53LLDBLc8SAmUS0mfrPJax8CU8PUE6HvnmbTsgiDKXQLSBvYcEJTlLjjDS23qyzjLCoB3iL/XUvEUR1Moa4ZKUNJEc6DJoZnua7Xw9abFUsOiq7JhPSJIWitqwkckMv+DcEfQmd5+lfRaOqX81Qdk6JMUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA0PR12MB8352.namprd12.prod.outlook.com (2603:10b6:208:3dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 22:53:36 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.8422.012; Thu, 6 Feb 2025
 22:53:35 +0000
Message-ID: <3755f3f6-f7d2-4385-b709-7974c815bb2e@amd.com>
Date: Thu, 6 Feb 2025 17:53:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd: Refactor find_system_memory()
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250206214847.3334595-1-superm1@kernel.org>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20250206214847.3334595-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::25) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA0PR12MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e1fd69b-f8ec-40d1-13b8-08dd47011634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0h5MFFHeDdyM2M0MFI2dEtObWlBMGdSdVVJTGgxay80M2VCV25HVS85M1dM?=
 =?utf-8?B?Q0lwNHdZRUp0THNTSVZWWW81bDdub2RSRFdQUDlMTmltbzBjUkVXV2dKVkcy?=
 =?utf-8?B?VVhEUEh2VmpkYU5Ceit2V2FoZk1JSVdWTE9LUnBhSkp1TG43eFFPZmtSekZl?=
 =?utf-8?B?UEtMUDlmQkxzMHJkTzIrZWtyNmlXWEd4RkR0ek1sa29ldlZEV1k1WElhb29u?=
 =?utf-8?B?cTBFZk43M2ZnS3JPQS92MWVVUEM4SEJkWi9FSTZrTjhnbmVjUlpKSkhzRERZ?=
 =?utf-8?B?dEI5RmRpNW81Y0xtUnh2NVRwbDFBT3BWeWx5RDlKcjJMZEtwR0ZWdVM4a1FB?=
 =?utf-8?B?QmZGT3J0aGdFaDBpYTZlRy85MGFiTko5T1kzaVJRZlRmYlMrdWI0a3RhZ29i?=
 =?utf-8?B?STI1Uzg0UFZBalltdGFBVHJHZG5wSTZnb3RWOTJuRVE0NHk3bjFwbFpid0R6?=
 =?utf-8?B?aHhMWTY2QjdlVitwU2l6Zm1lM1hoazRXeG9GdWI4VThHbDlnYmRYSDFaeVdh?=
 =?utf-8?B?NDRCOWFuYXU0YmNPYXJRd1d2aTJmRURPTkZ5aHdsSXYwK1J1Zmk4dmhlQWww?=
 =?utf-8?B?U0duL1cyRHlBazRzUjBBVmkxamlVcUREbThPMlE5Q1ZIbzZTSkdGSklVZkZS?=
 =?utf-8?B?UEZmSFk3RGNNZDYyNitYNGpRNFFLdURxd3J3ZStPdVFlOE45Yk1ZZ0tGRUZm?=
 =?utf-8?B?L09ydEdpaUsrYmlNbFhzT1pjQkZ4QnlPZHZoeVk5a2cvTzdiejRzSThhZC9n?=
 =?utf-8?B?Q2Joc3FWV3I3c0dZYVhjNDRkQVl1eHJRSGs3TlJVOTVEQ2hnT0l4VDV1Q2Ns?=
 =?utf-8?B?ZVhRek1OMXFSekxGOGh3YWVURFpCemF2YjJwUWtOVzJqT1VBV3FmOU5YMERJ?=
 =?utf-8?B?MjlBNG41ZnNMVFNDSDlHYVd3cksxdm1yV2ZuTXN4OVd5d3drWGUyRzBFL2l5?=
 =?utf-8?B?d2t1L1lrZXhaMEZMMnpqcXZ4R3BKSGdqM1dQcklGbWNIRHpjdUY1NXgxeGdJ?=
 =?utf-8?B?czlhTWhlMTljbVpOQlM2U3VpOVN0UWg2bGNzR0U5L1JmMGh3VGJ3OXdzeWs3?=
 =?utf-8?B?MU5xSkVCNUpucXpLR1pyR2JIRmw0YWlmTjNlNmJPdnZXY1Ruc0M4TGkya3Zy?=
 =?utf-8?B?cDAzb1JEYmxXNHBuY080ZlFieFh2OFQ0SDVYTFVkMHN0cm04TlJLYlFzbi9X?=
 =?utf-8?B?Ly9ONytRaWQ0aDFnWUZsb1pUREM0N2VWWnAxRTcvdmlVbE9UWENaS0RTZXJz?=
 =?utf-8?B?Ynl1TFFWVnQ4Ync0Z2xMMWlNRFVwUTk5NFRqdXRoQmk5QjFLODhucHJoL0Iy?=
 =?utf-8?B?S24xd0Y0Z3ZLcmZiVkEza3RPbC9MTVZWbG5LSnJlejQvSlRranVidk9zckxx?=
 =?utf-8?B?b082RC9XaENOb2p0YzJwREFnakFiZEhKSXk5NERYTWFVMzFMY0lYK2Q4ZEpn?=
 =?utf-8?B?T3BHOVl1ZkRzamdVZHBFMCt2MEdScFEyaFhHTnJBSEd4ZlphSUtHcVlpak5v?=
 =?utf-8?B?SDRkZkVLRXI5Wnh2MUwyUjlRYjU2dm1GM0lMcDd3K1B4TzA1eElSeHhOVkdP?=
 =?utf-8?B?WGxGM2NLMCtoTDRLbnhwbGlTTUIrMC8xVXYxN3FOaFJmYnVnVmR1WDdsWFcr?=
 =?utf-8?B?TWdEOE9Zc3JBVzVBQ05SNFQrSlRydmFEbVcwVmxsbThvVk5EYnhFQno5dHdL?=
 =?utf-8?B?Sy90L3lENXQ1WWZkSzZmajdvU2crYkV2QVcyK0k2dDVsdk1BYVNVZGQ3SHRS?=
 =?utf-8?B?bFVFU0oyazJrTHdralY5SktOT1UzK1BDOHF2ODdRNlA3VVNzMnJZdnZ4RHJB?=
 =?utf-8?B?WHVUcVZCNDdmNjZXYjRlUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTdBSlpyUlBOK0lreTZIZEVlSThsZldhQWVJYkx2RWtvOTNVcTY4TFFQK3Y4?=
 =?utf-8?B?YmVpbEE2VndZZ0hyWG0raU81VUlLOEtHN2gzVDZqeVkyemVBMEJueU1GWmVQ?=
 =?utf-8?B?R1Q1cUE4aTNyb09UVE1UbWpZWWE0Wmd5SXFPQWc0Q25tVUUwdUxSa3E4b2tk?=
 =?utf-8?B?bUpJdW5ieUhMSzBhaC8yb3NKNGVpNVlaUzdlMERRNS9qaklsMnlVNDRRTzA2?=
 =?utf-8?B?NDVmR25yOUVQNzdUMGFYbkVZQ2c5ZnJTaXQzSG9kMmpLaGh1Rk12MXBaRlgv?=
 =?utf-8?B?RThUU0NKajA0ZTZYU3FlajV5b3BTM3o1UVAyaXJGWUkzTnN0OXdhbm5jMmx2?=
 =?utf-8?B?R3h3dkpITEdhVi95ejJ2eFZjNjBjRmZBRGk3WE1tL3p0dWkrekdMK0hUS1gv?=
 =?utf-8?B?UytVaWE0aGtKRVd4T3gxWFpodytVYzhibDU2SHZpdWVNR0hBZE5EL21TOHd5?=
 =?utf-8?B?a2JodFJ0a0dlRm9UN2x3UVp5V1M0NmZSSWNYMHJlSmNxbDhBTHJjbm9nYnNz?=
 =?utf-8?B?T2JUS3FnSzN2alRrL1pubUprVkFnNHVNZU1IVlVvVWlONCtUSDNucHRxRUp0?=
 =?utf-8?B?RVFkSlk0SzVHYThWekxJcldNNDJnK3ZKcVBlRjNXYXA3WkdLeFNtOHNFMXAw?=
 =?utf-8?B?eFhWb2Z5U1pTTlJnRGZUS2dJbFg3eUFVZU9FUWZKQ1RuSnRuK0t5a3VBSkpT?=
 =?utf-8?B?aFVGQnR5UVhkc2lBZ3FuS1BkOVY2U29sOFRSL0p4Rk90a1R2OGtMVjBqK08w?=
 =?utf-8?B?bE5OTDV2SE01cEFPVzJPMHA0UFlRZjhuVXlZTlp1SlZJRmRhMXRHeUo4RXAr?=
 =?utf-8?B?dm9SNXpPOG5hU1JqYVg1KzFhR0syTWhVdTdQQ1NqSFVSRC9GdWIvcEtMVHdJ?=
 =?utf-8?B?UldLYzN0SWlETTNnb3VVZGVaTDRBblJFZkRJbzVGaGJrOFcrdnFlamI5c3c4?=
 =?utf-8?B?dUlZS3BGKzhaTzlmNzJtK3VvWHBrT0YxcmdLMWVWMDZiS1FtZGtvL0xmNC96?=
 =?utf-8?B?NEE4bzdIVDVjNVRTaGpTbS9DTmtQNyt2MEFoa2ZFM1liT1o2L29iQllBUFUy?=
 =?utf-8?B?ZWlXTUN3WW04R1pxRkdkL0ppY1dpTjNGU29ESXFhVWZ6cmlWMnpEL29qY1pV?=
 =?utf-8?B?cGg0SStNUm5zdjVLcFNNQlNuT1haM1kyaGkva1pDY3ZNTVNSY2N0TFZaRy9j?=
 =?utf-8?B?dFFtSzlOZXhzM2dCRWVoWW0yK1orVXJtL2tGcWFMS3luQWt6S3Y2OGgrcGtG?=
 =?utf-8?B?NnRScWk5R1VJaDN0MzZKVlpiNGozcVpLeHUzUnVMV25nYTZWMDgraEZ6cWNy?=
 =?utf-8?B?S3ZYS0pEM0pZRktEMmNCYUZRbGhhVHg4b05jY2R2Vk9ObTRnNkpteitKcEgv?=
 =?utf-8?B?U3pvZnN5ZEh3eFFhb0N3d0JEWTljOGdJWjMwNmJiR005TzJsWDJNQUNSYlI2?=
 =?utf-8?B?TkM5d0QwZzhrMEo1VFFsaTVNU1lkaEtsSGJlbVVhN3FGbFNqNnAwSnFQYUdp?=
 =?utf-8?B?Y083TkFEL2NzQzJyZTNHcGJzTFNxWlhJTmErVU5NR0wwRTBCTk9LbTlWV0N6?=
 =?utf-8?B?T2dDS1NYd3d0blVJamdUN21CTDlZUUN6VVNGNmRlSGJKT3BEZlBjWGVwc1dk?=
 =?utf-8?B?eUFuWDZIeE0wTDRBekpGNUNtY0JTWEtkamF2SE1rMWNZUC81Y1ZPWlJGOEdr?=
 =?utf-8?B?L0ptOWc2T3ZJRmMvY0x1MjgzM1RmUWNWSGpOL0dDNnZIOEpiWjhpSFBra082?=
 =?utf-8?B?WllZald5bmtaeDhSWEtWZ3E0SCtzRm9xRFlQSVVoeUVaTy9EUnR6b2ZKenNE?=
 =?utf-8?B?ekFwdDF1TjJBYWtua3M2UjV2RFA1VGNYNmpwMldocFF3cStLcDI5ME83Ymhr?=
 =?utf-8?B?M2RQZmt6eld1YjB4TlhQWG1aUldlNlF1RGNSRGpiV2hETnJINkJiRnNQcEM5?=
 =?utf-8?B?M0dqREJGa1Z6c05EZzhBOUFlenNVdm12TnJPSWdrRE5QUzk5SUtETDdUNmVp?=
 =?utf-8?B?dHh4TS9QQW5Yd3ZleW0rYjh6ZThobDFzZWRLbnhuUDdpQjFaQ1hEYTBGU2N1?=
 =?utf-8?B?eUpNaHlqYlVacFR0YXVBVEtFTGV5UFFYSU5CSW0zcUsrSisxTFZSKzNMdWNz?=
 =?utf-8?Q?5zzP5re6hH5aNu1lzjWSF+uxt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1fd69b-f8ec-40d1-13b8-08dd47011634
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 22:53:35.7963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hIyQ5bKHrekRrGdhjm8uwidNl8dcV5WpSdrRneuwdUMcXM+AFWCFkFMeLKdJVyeg+5AZhCYaAWeVK/xHqVQgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8352
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


On 2025-02-06 16:48, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> find_system_memory() pulls out two fields from an SMBIOS type 17
> device and sets them on KFD devices. The data offsets are counted
> to find interesting data.
> 
> Instead use a struct representation to access the members and pull
> out the two specific fields.
> 
> No intended functional changes.
> 
> Link: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.8.0.pdf p99
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>

> ---
> v2:
>  * Update commit message
>  * Use container_of()
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 27 +++++++++++------------
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.h | 17 ++++++++++++++
>  2 files changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> index ceb9fb475ef13..4c4846dbaa2d4 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -968,24 +968,23 @@ static void kfd_update_system_properties(void)
>  	up_read(&topology_lock);
>  }
>  
> -static void find_system_memory(const struct dmi_header *dm,
> -	void *private)
> +static void find_system_memory(const struct dmi_header *dm, void *private)
>  {
> +	struct dmi_mem_device *memdev = container_of(dm, struct dmi_mem_device, header);
>  	struct kfd_mem_properties *mem;
> -	u16 mem_width, mem_clock;
>  	struct kfd_topology_device *kdev =
>  		(struct kfd_topology_device *)private;
> -	const u8 *dmi_data = (const u8 *)(dm + 1);
> -
> -	if (dm->type == DMI_ENTRY_MEM_DEVICE && dm->length >= 0x15) {
> -		mem_width = (u16)(*(const u16 *)(dmi_data + 0x6));
> -		mem_clock = (u16)(*(const u16 *)(dmi_data + 0x11));
> -		list_for_each_entry(mem, &kdev->mem_props, list) {
> -			if (mem_width != 0xFFFF && mem_width != 0)
> -				mem->width = mem_width;
> -			if (mem_clock != 0)
> -				mem->mem_clk_max = mem_clock;
> -		}
> +
> +	if (memdev->header.type != DMI_ENTRY_MEM_DEVICE)
> +		return;
> +	if (memdev->header.length < sizeof(struct dmi_mem_device))
> +		return;
> +
> +	list_for_each_entry(mem, &kdev->mem_props, list) {
> +		if (memdev->total_width != 0xFFFF && memdev->total_width != 0)
> +			mem->width = memdev->total_width;
> +		if (memdev->speed != 0)
> +			mem->mem_clk_max = memdev->speed;
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> index 155b5c410af16..f06c9db7ddde9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> @@ -24,6 +24,7 @@
>  #ifndef __KFD_TOPOLOGY_H__
>  #define __KFD_TOPOLOGY_H__
>  
> +#include <linux/dmi.h>
>  #include <linux/types.h>
>  #include <linux/list.h>
>  #include <linux/kfd_sysfs.h>
> @@ -179,6 +180,22 @@ struct kfd_system_properties {
>  	struct attribute	attr_props;
>  };
>  
> +struct dmi_mem_device {
> +	struct dmi_header header;
> +	u16 physical_handle;
> +	u16 error_handle;
> +	u16 total_width;
> +	u16 data_width;
> +	u16 size;
> +	u8 form_factor;
> +	u8 device_set;
> +	u8 device_locator;
> +	u8 bank_locator;
> +	u8 memory_type;
> +	u16 type_detail;
> +	u16 speed;
> +} __packed;
> +
>  struct kfd_topology_device *kfd_create_topology_device(
>  		struct list_head *device_list);
>  void kfd_release_topology_device_list(struct list_head *device_list);

