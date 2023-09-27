Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFAF7B0B09
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 19:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBBD10E571;
	Wed, 27 Sep 2023 17:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E49610E571;
 Wed, 27 Sep 2023 17:27:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZUrjzXKgoW+VAOtwCJ+hJvMtKWNQK8LBuqUETZV5w7dntYB796LDesKSxSZIsBYlWofsJ89doN6L/l1CsSQZCiX+SOGet66gbNZ8EUhmUXo+HkRYkl7LuD46oFlnC6H6w8a9ujINs+e14VcxWnSpRd0hlGPG/CmXd2+wCwdyWQ/A/kBA1lUMth1+LmhF0RtRcm7dOfwiBDrUz+M7pBAeegnBaGyW1rTqeEr27krp4vTCFltQGAL7RGOAJdnsi1aT2MF2svRjWodIA0a4p2+ZZXN0RphH0L6YeUVXZ0lnxw8KjoVRsUNhAU+yT34fTlyM3jw1he6CmO5A33bX5oItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5n7OXI6BtCRXoQBTCWiZrpfHg0yJ8w0MGrERZqzj5eM=;
 b=hn5QDsp62vTSLzXDSXA3XFmL5xgPeqVzmgjdX9eEmewl2dSjvuWgrogP6sO8WKjv+pX6mvvvEu2GWanQUx84JqGi1CNi5hKhf7CeZ3KjBXtrd1zc8G4lMl9hS6n86jPqx7NEOsz3WKVD299CmZ4kZSXFZafseHAljxE+zMMONnSwX5qo6u1ol2WMV0haem2a6fo5dmj3k8sNHsy3eZ8jl9aDx8/+HDOKBAxX+E8L62dBJBF3W8eanqMC/PdrS3v/8UqRbXfeEQFpqXzKHDQLzJQmXJlLDV+/aa4tbu/UXHrnjar6uBk3W04Zbdy6g8nCII5bf5zmcyUZRK83akk4vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5n7OXI6BtCRXoQBTCWiZrpfHg0yJ8w0MGrERZqzj5eM=;
 b=Std4ATNdRUxtdMBZnDM1WgW0Ac5vTwG4ZfWGXmQwkLAgK/08cegfl4tpIEayLaGD4Qwmc8Llw7UeeTHmPKMDoPWQzwZ16fys05anNx6H86aD5cAVEHC4YMmaMQxyFKdDAEDlj7GpEo7cK12xNoI8KrglSgi0yFyA6RrQHWmwj/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by LV3PR12MB9402.namprd12.prod.outlook.com (2603:10b6:408:213::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 27 Sep
 2023 17:27:06 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2e40:ffd7:e752:644f]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2e40:ffd7:e752:644f%6]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 17:27:06 +0000
Content-Type: multipart/alternative;
 boundary="------------233S5Ho8FhZdm1g6lnPEFj6Z"
Message-ID: <a893f9d9-3cc8-44af-9712-602a7b72f780@amd.com>
Date: Wed, 27 Sep 2023 13:27:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amdkfd: Fix unaligned doorbell absolute offset
 for gfx8
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, shashank.sharma@amd.com, Felix.Kuehling@amd.co,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Mukul Joshi <mukul.joshi@amd.com>
References: <20230927161616.3335-1-Arvind.Yadav@amd.com>
 <20230927161616.3335-2-Arvind.Yadav@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230927161616.3335-2-Arvind.Yadav@amd.com>
X-ClientProxiedBy: YQBPR0101CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::23) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|LV3PR12MB9402:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4c25ab-a7d4-419e-4402-08dbbf7ef895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ymYZGChXMcehuo8VvCXxJSFiq115OQ/uVgE4Fc4CJufPM4uFV91oKVjlLpSv60hwrLLMEHhzMe/UNcEZdSXaJD1qVln7GkGD0w+KEh2gnguSEl8p65cZ5KJqJBjCv2IbSLvPBfa59zjS6JG4YnnAr2+2tHwnTpCiIk4uUmOTvL3xyrI8O6F7Cb1mPekRh7dzlcyzhb3u0IVu8aQm8uiFPZ/quAG4JURewLvWEmYGtDhiWk0MbWyCihjMd7dqs5t2WYKkLOkhfV+x/5+VBM9XkPE/Ezx7fB6XNDv7j1uxoiPXdsTcFHabFd/4wzH0ipsNyfHqjnUiUuAK1pvsLCdZTn9VaUrPWPgbtZuE/ajQIOtPT0A/zSOBQNt6q65hBHXUAKwpAAyhxT3aJJqWm3yFCeCoWqf8HUI2EYFQMiicYAuAsuwO3o3PN57qZvnXzqdajsTRZylOa+7IgPx4CCbHsPD48WGsqG+QiPDYyLeGEJuGDRQRkFhleD8dmA7kBX11lrRcJXshSLiVqN3JOajlnhktAnJlwMWc5ZL9LPOEc4RFLcSgjk38OHT2QYYJi0LYri6bWJvcGY8SsOeb/qWTi9mV5DhMIPTKmgHRzMPD/Z819dy/6gHpmTnAk+aOqMANPpEYQDFPnhMSrd33cRVARA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(366004)(136003)(396003)(230922051799003)(186009)(451199024)(1800799009)(66556008)(110136005)(33964004)(36756003)(38100700002)(6486002)(66476007)(6512007)(6506007)(53546011)(26005)(83380400001)(86362001)(6636002)(478600001)(316002)(31686004)(31696002)(8676002)(4326008)(8936002)(2906002)(5660300002)(66946007)(41300700001)(6666004)(2616005)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlE1K3JYMS9BTGQ0Q284Y1g2N2NhOTQzUGozS2ltVDVadnErOVpqYlh1ZGZm?=
 =?utf-8?B?RFQ2S3VlOGpjeXk5dFJWSkR5bVhIOWpITFdGNXZzdGdxYUJQN0h5NmJ1VUln?=
 =?utf-8?B?Z3JOTXNZS1BZamhaUEZiU2tkMFpKcjY2OFc1QWMxbVh6ejIraGtCdlh1VjF1?=
 =?utf-8?B?a1pMajZwcnUxb01BSVdKamlhVXZ1dStLT1pHaGkyNzhubXFkL0czVDNMbjda?=
 =?utf-8?B?dldOR3ZneXVRMkxzczF5SjZQNmpPS3ZwOG5zV0JvTHpOSW5rR2lwTWpscDgw?=
 =?utf-8?B?V3BvUTZFM1gxcGdQV2YrcTEzZC9adDd1VytoTENTVXBXVVl4R25TdW4zenYv?=
 =?utf-8?B?M09HSmRPVlowcGgvZDRzb05ic2VEUjFEZVFwMDkrNmhKMGYybkd0ZEtEWHRr?=
 =?utf-8?B?dUE2dlo4NGhVTWZWSXM1KzIxamw4Nm1uQzhieE9SYlFERGtVSGQvMldPUXUy?=
 =?utf-8?B?a2VjdFUySEo1UmhVRFJpbFozdFRtRDAwMngyaDVaQzhTaGYwbTRsL0lRc2k4?=
 =?utf-8?B?V1dKQ3hPK0hQaVRCNHJNVnJnVi9lMXYyR3oxOGZMNUtZUDlHTHVjYk9IdHZV?=
 =?utf-8?B?eFpLTjdSODZqRUZxWTNjR21SM3o0ODdxSW1hb0gvdTFjVitWdFlYeXkvZHZC?=
 =?utf-8?B?Y0VxeGEvUVV6cGZrb2VySDZhV3RXc3B1ZTd0N1puK2VXT0g2d0FzNlVjcmNx?=
 =?utf-8?B?SHcrN0RIQVExREZzTVBDN2xHMk5jTnBRbTQ4ZFB2eTZGd0JoeGtwT0MwTE9F?=
 =?utf-8?B?R3ZyaGtLWndya2Y3cmk3WGtlT3k5elpHcWtaNmgzbjNuYUlBQmtaQlZGNXBJ?=
 =?utf-8?B?RnVZWVJraURvMmJtQkxwdGF0U0pOeW9NTHlRWVZNT1Q1VnhjNWRMZHFJaGFQ?=
 =?utf-8?B?STdGN3ZpaGNsbjhYb2dHSHRNVlU5MEpsS2ZOaXIvREtBVktPVmhJY3h2cjFS?=
 =?utf-8?B?UkxzeVFYVUFaNG11bjZYSTMxUzNBUUc4STFuR0ltZkJETmcraVg1dFd4Qjk4?=
 =?utf-8?B?OGNGRm4rME1obGpoSVU1aGdvN2d3T08wRG1mVWxZRmNEM0piZUJXUmtjUG5L?=
 =?utf-8?B?Wi9rY0dVNU9kdXJrZ3Y1OTFIQW9QOFRFQS82WUR3cEoyeU9pbGpoQlBQZm8z?=
 =?utf-8?B?QzlEODVPbXE5NzQ2N3dnTVNjRTVhUVpHNFhYV2lHc0ZpRTBMYUt0bWV6SGJE?=
 =?utf-8?B?OXF6QWVuL2xqSEc1VlpFNVcwUFFTaEVyKzNycTVadmZOY1V2TzNYcC9YbVN3?=
 =?utf-8?B?dXZmdEg2bHA2V0Fzc0pWT3VwZTNROFJYaUNvVTVlSWlERUxBOUo1ZVBCSVNa?=
 =?utf-8?B?WkI4Wjl5Y29VTjRIalc3dzBQRkNhNFpFSnlqb1VHWG8ya21hU0ZRRlc3dTh4?=
 =?utf-8?B?Y3BibDdrSHBhNGhFL2ZDem5qcE9NQi9LWHRjZ3dwRitka0FuQ3hZQ2hqNjZj?=
 =?utf-8?B?dVB5b3E2WmxodjhCellqcW1LeEtaamJIbFNtYzFxUHQwRWZtbWNIWis2VHlx?=
 =?utf-8?B?SVBxVWtnK0Z6UW1Qd3VwS1lpT05iNGszWnNJOURxYXoySE1tRmVTU1MzTUpa?=
 =?utf-8?B?b0doc003SkxsZFhHTnk1MkVpMGd3R3hEVUJZRUozSUtwcDhoTTE4dGR0a2Qz?=
 =?utf-8?B?am9BdGplNXBWSldyM2YwZXp3WUNnenNjRWlXRU1sekRHOGVUVnBoNFhjMVRr?=
 =?utf-8?B?NVJSbnFNZ2VGU3J5MDFsOTRoaktBYXk2ODZsNFRiVkk1TWZlUi96RjVyNU1S?=
 =?utf-8?B?Y21KSEIvdkp1Mk1vQ0ptNlJlWmdRN1JReGtuM2xrTzJCbjJNM0I2OVVkK3hq?=
 =?utf-8?B?aE1PMW05cmMwUGdZUEs4NlYwT2dKMU1FMWNQa2l3NHBidEhKQ1JHWERSWmNI?=
 =?utf-8?B?Q0tvelNtTTUxMDk2aUdYUE1SMGVuVDhvMi9IQXlzaWVKVkxmejI1TloraVgv?=
 =?utf-8?B?S2xXK2xGUExpSDFzN0JZVkF0a2l6eXJhcHJ4K2lTUnRTMGU5RUdoaVFhN0xa?=
 =?utf-8?B?K0k2a0ZlaW9EUHF6UDFwSkdua1IvajU4OWFmRjFWKzZGL3NPdzdYNitDSE95?=
 =?utf-8?B?UTlXbXEyUnRZQXBJRVViUHFxRmJHV0MwSEErWEVpQ090VmxxbWR1TmpMb3VT?=
 =?utf-8?Q?LpuNOoCfz4T2PXO5961ldJf4x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4c25ab-a7d4-419e-4402-08dbbf7ef895
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 17:27:06.2345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0roQyDJbKzNGBOGDFoepCXRdudx0Uzc2VELeHgdipoO6cl/gJF78Nk/jSRr1GzVA1r/HOYhVSAp/q3r1kyc6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9402
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------233S5Ho8FhZdm1g6lnPEFj6Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[+Mukul]

On 2023-09-27 12:16, Arvind Yadav wrote:
> This patch is to adjust the absolute doorbell offset
> against the doorbell id considering the doorbell
> size of 32/64 bit.
>
> Cc: Christian Koenig<christian.koenig@amd.com>
> Cc: Alex Deucher<alexander.deucher@amd.com>
> Signed-off-by: Shashank Sharma<shashank.sharma@amd.com>
> Signed-off-by: Arvind Yadav<Arvind.Yadav@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 0d3d538b64eb..c327f7f604d7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -407,7 +407,16 @@ static int allocate_doorbell(struct qcm_process_device *qpd,
>   
>   	q->properties.doorbell_off = amdgpu_doorbell_index_on_bar(dev->adev,
>   								  qpd->proc_doorbells,
> -								  q->doorbell_id);
> +								  0);

Looks like we're now always calling amdgpu_doorbell_index_on_bar with 
the third parameter = 0. So we could remove that parameter. It doesn't 
do us any good and only causes bugs if we use any non-0 value.


> +
> +	/* Adjust the absolute doorbell offset against the doorbell id considering
> +	 * the doorbell size of 32/64 bit.
> +	 */
> +	if (!KFD_IS_SOC15(dev))
> +		q->properties.doorbell_off += q->doorbell_id;
> +	else
> +		q->properties.doorbell_off += q->doorbell_id * 2;

This could be simplified and generalized as

	q->properties.doorbell_off += q->doorbell_id * dev->kfd->device_info.doorbell_size / 4;

Regards,
   Felix


> +
>   	return 0;
>   }
>   
--------------233S5Ho8FhZdm1g6lnPEFj6Z
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>[+Mukul]</p>
    <div class="moz-cite-prefix">On 2023-09-27 12:16, Arvind Yadav
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230927161616.3335-2-Arvind.Yadav@amd.com">
      <pre class="moz-quote-pre" wrap="">This patch is to adjust the absolute doorbell offset
against the doorbell id considering the doorbell
size of 32/64 bit.

Cc: Christian Koenig <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
Signed-off-by: Shashank Sharma <a class="moz-txt-link-rfc2396E" href="mailto:shashank.sharma@amd.com">&lt;shashank.sharma@amd.com&gt;</a>
Signed-off-by: Arvind Yadav <a class="moz-txt-link-rfc2396E" href="mailto:Arvind.Yadav@amd.com">&lt;Arvind.Yadav@amd.com&gt;</a>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 0d3d538b64eb..c327f7f604d7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -407,7 +407,16 @@ static int allocate_doorbell(struct qcm_process_device *qpd,
 
 	q-&gt;properties.doorbell_off = amdgpu_doorbell_index_on_bar(dev-&gt;adev,
 								  qpd-&gt;proc_doorbells,
-								  q-&gt;doorbell_id);
+								  0);</pre>
    </blockquote>
    <p>Looks like we're now always calling amdgpu_doorbell_index_on_bar
      with the third parameter = 0. So we could remove that parameter.
      It doesn't do us any good and only causes bugs if we use any non-0
      value.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20230927161616.3335-2-Arvind.Yadav@amd.com">
      <pre class="moz-quote-pre" wrap="">
+
+	/* Adjust the absolute doorbell offset against the doorbell id considering
+	 * the doorbell size of 32/64 bit.
+	 */
+	if (!KFD_IS_SOC15(dev))
+		q-&gt;properties.doorbell_off += q-&gt;doorbell_id;
+	else
+		q-&gt;properties.doorbell_off += q-&gt;doorbell_id * 2;</pre>
    </blockquote>
    <p>This could be simplified and generalized as</p>
    <pre>	q-&gt;properties.doorbell_off += q-&gt;doorbell_id * dev-&gt;kfd-&gt;device_info.doorbell_size / 4;
</pre>
    <p>Regards,<br>
      &nbsp; Felix</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20230927161616.3335-2-Arvind.Yadav@amd.com">
      <pre class="moz-quote-pre" wrap="">
+
 	return 0;
 }
 
</pre>
    </blockquote>
  </body>
</html>

--------------233S5Ho8FhZdm1g6lnPEFj6Z--
