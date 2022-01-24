Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A883B4981FC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 15:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD26410EB8D;
	Mon, 24 Jan 2022 14:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD49E10EB4C;
 Mon, 24 Jan 2022 14:23:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1pCJOFJ3KDR1aB4uhnPez/KR1On7+L2zuXAqzNnmM9QzvPO/KXJsLWvD7djl1GADratn07IUyWVGByXizVWG0Ba8Pu9zjP3hoabd9QMQu5OffycUTrDhMIvQdZyaIdCg9YPd8xz3u4UtFB2TsVlrxt6T/wR/Uozz9BFOGx0DGAZEqRnOafUq8VXtKyJDpBgk/+E5YrggfU5LA+tuylhV7JhQYkKUjO7v9bGcyYgdq0ieVdRXHPpsrtYoMGHbLKj/BR58A2zSbfbQR0tzRQPNuc0H9fb3otT6WNe8/OwU2TEbeXB9z7Ou9HZyIeMqZPm/xgDKND618JVP7dXfqYZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYtfSUSnGpli56zwWbfySqDQFpEYJkejph1Yaizkfxc=;
 b=VeUk5a8sBoDSDzOih1pSDni1znWPVLw7TqUkKbfr0wNE0QJQLq8LzaxAWPZ8QkBT05fx0/zEtyh2mCWvhp8TSQJiB+fjgTCiAiv9o8WJjqmhGvd9cyjIVk7SgWpkhZnq/6ezgZe6+huJBCcM/PQSjBZI4QA0l7Il7Qbu9NJrsw4swemTVs7UywzLjoCXAz7po7TJ4vGIMSmGwdROWlhUXC1y3kttjtJrc8sDtC2jBnmGPFYnOPy8L+s9bN2Pt5wuSpKJ3uqwfWIump+U/eSclRy8tXpNu69nzmoGX7H0okClMrcFR9EXcDWoQnq8a0MtI2QNmZamEydR5rytFDIjRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYtfSUSnGpli56zwWbfySqDQFpEYJkejph1Yaizkfxc=;
 b=qJXQStmkmW0qx15dyxy+DNYIHJnIqk16Vr+XnFOIY1zaoD3qiTAenVrpsIJdiHvxhPqhMtzBJzYLvdY474Y/kvWyoizfbu+/h+NZ+K4sDtOHjirBFonptgNiYNDRFkl8x2y+IMf2mMgTWOOPhtzTfL5wbt8beh5naNd+GWi2ohI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by CH0PR12MB5059.namprd12.prod.outlook.com (2603:10b6:610:e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Mon, 24 Jan
 2022 14:23:10 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::b07d:3a18:d06d:cb0b]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::b07d:3a18:d06d:cb0b%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 14:23:10 +0000
Message-ID: <9beb041b-b757-311c-5ea1-1b9fa1d63074@amd.com>
Date: Mon, 24 Jan 2022 19:52:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/amd/pm: set min,max to 0 if there is no
 get_dpm_ultimate_freq function
Content-Language: en-US
To: trix@redhat.com, evan.quan@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 darren.powell@amd.com, guchun.chen@amd.com, Arunpravin.PaneerSelvam@amd.com,
 andrey.grodzovsky@amd.com
References: <20220124135259.1057828-1-trix@redhat.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20220124135259.1057828-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::7) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dca88c4-015f-4ca3-56c5-08d9df450c36
X-MS-TrafficTypeDiagnostic: CH0PR12MB5059:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB5059814B034827D9792158C2975E9@CH0PR12MB5059.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gkP0XgXtSqVzY+xwfMBvnbLVfRyfoMym+z48WJtd/5/Stv9HHNvVOvvRCtO8oeEShJJgUJRu6EK9A8UofEHHx8lQvTZmeMIg8S1r86qT4VxcYRzgl+zHuqqp2kGvXJPvRY/zuYDkQr3fgr47cEbU+QGXtYfpts1383odBKRQsjACB8KaxEHz/VDmyq1xTpAFbHrTpp0X2cU0g3dQsgiJfXV/FglDzxvRqzFISwzy//t9fqRVGffU3/g8InDRkzrTvyt4y8H087XMx5/WetzPSAQA5dVkiq7Nr43Fhp+dEiH5Bvo70+QIG4EnLp8ChQqVp5/BAZoidFGobZwuCHbWl2F19VHvf5nbfShjZBzK6GUV1xGaTg0VHzrn1ZiarAWp8spb/3Hh2Lz4Kcel1i4OpgBv7Ps3gIXqexNU8i4WQk7xUE4Kh4AxVGcLv9PsQtxOLsg0ucI4CBocCwhNCzVFaRDv2GKofsKFdXJm14lkUQc2OB1WutBHaMxwAFN33598vwEoIoHHhoG1eK3q1w6biY5Od+xDpdehLQx0DL+S9BoynqL8IQTOihnSID6jBNgmyN308Dv4ZkwzWIJeP9iDli4RJTTh4xv1XOtKD5ucHS1lZ7QsedztZoX3sGLb9ZX/zKnbLDCxN0Ktbze98NP4ITgZkYrekoJoupDo1hI/H3NI7uNOqNJjXSQEwFe5YDUU+lHIRaZ97M52PP6QWhFM00gFzu1kUuioyUZn9owz7Bot7jHgUnr9OcacNQhZ8bk3t3TdZfBiAB6IVFb0WStyXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(36756003)(508600001)(83380400001)(4326008)(38100700002)(921005)(2616005)(8676002)(31686004)(6636002)(66556008)(2906002)(66476007)(6666004)(5660300002)(86362001)(31696002)(8936002)(53546011)(26005)(66946007)(6506007)(6486002)(6512007)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEVPM0dXOVJ3UnUyeTlFcWFpckdnRURZbVJzWHJmN2E2cEsxZDJONm56MGRN?=
 =?utf-8?B?OXRpcVEyOTZYbWhWZzUxY1FpM1JZcHZKMlBTTDdDVHRSTm1WMVYydmhvNFhy?=
 =?utf-8?B?RjUwTFo5R3BuSU1kemx0MVovRm0zdGNEeitMamtGQzNmQ1lSajlNcnNDb1F5?=
 =?utf-8?B?T2FQenBtRE5hdnBYNFBkdi9ka09JRk5PYUxQTld3NTZWNGZDTllkTGNiOVJR?=
 =?utf-8?B?VDN3cEZtTU0xeExOVTMwMmFuWldPcmFCU2pUME1NeVUyVXBFZE1oWVpVb2p4?=
 =?utf-8?B?c3RBOHlUUEQ0VEdLQlQzdjQxNnp2dTE2L2VWSFcreHN0dnNoU1JVcTV4SS9C?=
 =?utf-8?B?UlNWODhidytOVXdpV3QzaG0zQnFWbGN1elJOSk5FWldDVlZBeVhneVNlQlN5?=
 =?utf-8?B?N0VDa3ZsWUdOeVBDMG5iMW9UTStaSWh0Q1FNUENnUFd5YVpQWFBwbitjblY1?=
 =?utf-8?B?L3JRVE1EU21VS280SWp6eFpBdzFobXN2cURwUWo3Tms4VkZhT3JCS2ZTWjN2?=
 =?utf-8?B?cjJjS0hlUzBpS1JMUHVSZyt2MVEzQ1g5Z3ZEcUtNYWJqTFhQb3FTM2lGQkZo?=
 =?utf-8?B?ZnZXZmprNUNmSDNyWmtxa04ydWxWbHZVL2ltUEZkVEZZcGFuOWIzRG5ldGpL?=
 =?utf-8?B?TkVuVGsvWTgwUWZXMEZsWTFhbC9aRUpnNUFkcXZiZnY1SURpc1B0c2k4VVAr?=
 =?utf-8?B?WjZaVEROQlFVSmJRbDFYMlI0TURsZk9LdjhvQ04wekVWb095QjBXY3ViSWQ5?=
 =?utf-8?B?RHFrU3FkbFEwbFhud2JTVWg4RGI2UDVWYWhGMTEwRWlPaitlemxjVFYzbmts?=
 =?utf-8?B?UmxoT2R4NHRrcjhocWF3Q05pdzVBYVA2azdveWo0QTl6RWZ0NDJ1NmZIZ3BX?=
 =?utf-8?B?TEM2S3E4Mm5teUR1cXUzSnJ1aEYwcU9Pd3dPUFZQQUlLYUdkaFRmbDNMdEpm?=
 =?utf-8?B?U3h6WDdieXBGcFJ3RDZDaHV4QzlDb2F6RGFkT0V4Z0N1bUVUdHRNTEY3aks3?=
 =?utf-8?B?YW1HNlJJS0c0VVVWZ2ZlN2F1T2ZqZytLTVF6T095ZzA1YlhwQzVKc3hGcFN4?=
 =?utf-8?B?QWl4UUxndE44Vm5KdUR0US9MRFZCR05ZcFh3bGxYb3Jhbk1OTGZScGhUYU5T?=
 =?utf-8?B?YStzc08vejRmU1IzN3NKUFZsT3prdW0wZlFtaHpoKzJIdXpDMS9BMC9vYStx?=
 =?utf-8?B?cHdIbzlCVXFrS3AyM1l4NDBDSUJLYnN2NzNrVHYzYkN6OTc2eGRyUjh6UVNq?=
 =?utf-8?B?NGZibGE1V2lVeFlNT3cyWkF6dTlEMHQwSzQ4OW9rbGdMOTNsZmtxeUJ1cmFN?=
 =?utf-8?B?eHhaTFl4Tk82YVpwdk5henhtSFM4MVFBd0hXd0pkK0FxQk9Lb0swQndseDVo?=
 =?utf-8?B?cEQ5SFlscno1Q1p0RWROYW1kUEZtaG5ZRjZMdXBJek9zeFJLTUdMeEJweTBx?=
 =?utf-8?B?RVMzOGVuSzlLcTNNdkhvWWdROS9CNG8xY0VsSW5uUnV5MjNKRGFna2NuazhB?=
 =?utf-8?B?dC9FYlN3bWo3WTRWNWhXdzhUcWNxZkdQMGJGMy9mYUllMFRSeitRa3hja1hC?=
 =?utf-8?B?NU9CS1BzTG9mZ2VCa01YeHVtMG9LajJldmErQUoyS1FsL1R5enNqd21vTTFo?=
 =?utf-8?B?UVlydVZQbW5zVUtmN3BPSlY4MHZwcitTN3Avd2ZWSFRvWTdzaG9vZ2FIL1dM?=
 =?utf-8?B?YnJXUnUyczNFUTF6R3MyTVRicXhjVTBJTU9BSE52UWZ1UmV4Tmw1U0x3dDZY?=
 =?utf-8?B?UVZnVU0vL1loU3M3Z282dElBTHZpcWFRTDVTaTBJS1hqd3cvT3JJNHFzV0ht?=
 =?utf-8?B?eHNFUlF3SmVoWloxamowbVZaR29vZlI2eEQzbjlkQWplQkQwczZ6blNSMEtG?=
 =?utf-8?B?ZHJDUkhud3NtTGFFSVd5cFpVeTcxamZYaGorditOcnh3TUxXaWQreStHK3Z3?=
 =?utf-8?B?cWxWdmJva3M4YlVTaG9pL0paUlFNQ0IvQWo0NWt4NmdtNXhyaFhsVWx0M2hL?=
 =?utf-8?B?aW56WnZaMzMxWEhFZGR5SU16U0RaOW45eGpGQmhrVUFXaVVSTHk1RkNHeXkv?=
 =?utf-8?B?S1UxQzlyeitocm1iVlF5UmpXQUpuR1NubnF5V3JQME9TaXppQ1UvNjB6UkFD?=
 =?utf-8?Q?ZE+I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dca88c4-015f-4ca3-56c5-08d9df450c36
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 14:23:10.3698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFxQ8sGxT0x6tEAuvASp/Y9vZM5T50iMTNO21OZe+czXaR/TE1EYNSxu/45cG7DK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5059
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/24/2022 7:22 PM, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analysis reports this represenative problem
> amdgpu_smu.c:144:18: warning: The left operand of '*' is a garbage value
>          return clk_freq * 100;
>                 ~~~~~~~~ ^
> 
> If there is no get_dpm_ultimate_freq function,
> smu_get_dpm_freq_range returns success without setting the
> output min,max parameters.  Because this is an extern function,
> set the min,max to 0 when there is no get_dpm_ultimate_freq.
> 
> Fixes: e5ef784b1e17 ("drm/amd/powerplay: revise calling chain on retrieving frequency range")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> index 5ace30434e603..35fbe51f52eaa 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -121,11 +121,17 @@ int smu_get_dpm_freq_range(struct smu_context *smu,
>   	if (!min && !max)
>   		return -EINVAL;
>   
> -	if (smu->ppt_funcs->get_dpm_ultimate_freq)
> +	if (smu->ppt_funcs->get_dpm_ultimate_freq) {
>   		ret = smu->ppt_funcs->get_dpm_ultimate_freq(smu,
>   							    clk_type,
>   							    min,
>   							    max);
> +	} else {

return -ENOTSUPP; would be more appropriate.

Thanks,
Lijo

> +		if (min)
> +			*min = 0;
> +		if (max)
> +			*max = 0;
> +	}
>   
>   	return ret;
>   }
> 
