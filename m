Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1677C415A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 22:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E056E10E3E5;
	Tue, 10 Oct 2023 20:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0420710E3E3;
 Tue, 10 Oct 2023 20:39:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzjFfGB90ejNJDv5MkVwAdJwk6Ci+8nCoM1Jghh8Y/77dXaTVObVgbKzEkMB5iF7z3rBpHoq6l632kT97Ue21lQBfVAb2gSWPT0yT7wpy7/2x8m2x40090r7QfZjDlXulFzG1vFMs7iEiJRSpixEcBnBqjptNNSIDAgkkRnZmN9Ucqsla5Itsm/Xu9/ZDQLo1i7vIkvEi5Uv6NJiuL8IlT10Iz29VkwQL8PEchm9Aok5kyeN38mDMnWn1Z/SfpGvui+ZcCM/cOkkyUdVoQp4qpT0QT7+T9hM7ZcKO1QvAmKsOnXy5tKu7QZiwEFdkPOIn1x/r4V9RYbChQf2REZlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPkNph1M5138PEjmVoaGxXGT3sljodOAbuOEziApsNI=;
 b=Fvf+vTK1rSmOCuc3omIhMGH7TeKnLbVAm0BS0QmdhsOrPN0nrx3SQFg23fqO/zA4o/sbcs3t5BaMiBO17h7NvVnfqii4dATtbsiaPr3xZ+8zArOkjnDXXZ+LLwjMVYlZ6CP1/3nEpTPmzQgXanui/xIXe8IVvnzAyePfwo8lcTNjdJmxBHFr/3Z15MoipRDabFtto8BFj+WVpSSKSmK0S19ImJd8QdM0nsF8QYyJb8asAKdFG1fFosZKbLEeSV12Lj2cM1R0u9oTBh5YV8rjl0oSsrnUoAgGODrvZ67FokkPfvaP7kSnFbDfBitEE8jSsx9jEQUlb7m67QtZAO7ExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPkNph1M5138PEjmVoaGxXGT3sljodOAbuOEziApsNI=;
 b=vfeqURVZA6VXayxmW0EEgx0kFoDXEec9sDCcbK2U3OAQ/OezqIcxX9mJYllxi3xzpQxSMAAYhPltW+C3hNM+miAGWNIVbrs+V86eyYM9KTB3oc3sm5uBVwYkJWC5/LzuLtsiIrOid5E23gw9LuANJF0gybvXHrbfvTyIc1trUt8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CH2PR12MB4086.namprd12.prod.outlook.com (2603:10b6:610:7c::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.37; Tue, 10 Oct 2023 20:39:16 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5aa2:3605:1718:3332]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5aa2:3605:1718:3332%7]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 20:39:16 +0000
Message-ID: <aba3e3a2-8f1a-4bbe-a769-b131151479d3@amd.com>
Date: Tue, 10 Oct 2023 16:39:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 1/2] drm/print: Add drm_dbg_ratelimited
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20231010121545.1046793-1-andi.shyti@linux.intel.com>
 <20231010121545.1046793-2-andi.shyti@linux.intel.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20231010121545.1046793-2-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0084.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::20) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CH2PR12MB4086:EE_
X-MS-Office365-Filtering-Correlation-Id: 554ea0cc-e042-4931-16b4-08dbc9d0f876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rZ/BPOGwr5CVrVzh3FKJnrzDRThofYXibRNiRB8wfDWBwI+UQDonmfm8TAyUnfuNn5cejqmEUiQRhnqJXfanUPbCvoN52Fa9UIECrhtzLRfv8ul7Vo/bzKsE7PL1SWlwk3ItsGJQyHBQpk+/4UFAv8zfZCMfTdneytKXSa1modhngv1fl5TqjOrQUzxSyJXuPXHOG67H0T91C6jjmLBuzhGzSqATc51ZKF1w9xaPY0hN/4mVxIMZdN+Q5r9Xe2xx0S+pTtLLSLopzMEh/pQIm1SX0P5TTBlgjX4fWo2H9JditdWnJv+5yBdM1UfZ+OnAMoTplBY4YurPegZkE37C91zCaIJR1+Y/zvygFTrkO7jVZ00euFZFIm4P0ptsDCj89qCmWMrSL6U51IELuE/DsWFIN+XnOjpAIinBv+xt2F4V5Z+71cs4XWOGGVjIFpfQB7ahpjFP0ecbtNRSw0uLiTq7tW+opxNgzXwgEBJw9zhX4mHcQqah39qe9+BXJ7gMt+JkTOtZWqMBwkM7kdeWOR/NzXLOKaWM63HFvQvkLsOkdqgOvsDjyH7PJKh/xII81omwfxQP4Fzdm5Akq5nm7YPbLipmiyDJHb6zjrM1DgZ8p/m6AaRUrhghHgA86I/yEEh+xE8epzLMNTpcAiE9bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(346002)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2906002)(2616005)(83380400001)(316002)(26005)(110136005)(7416002)(66556008)(66476007)(66946007)(54906003)(5660300002)(44832011)(4326008)(41300700001)(6506007)(53546011)(8936002)(6512007)(6486002)(478600001)(8676002)(6666004)(38100700002)(36756003)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkhLSldmVjdvYkt0WkxCazRqcmhrWVJhU2pFODN1cWs2WVFRU3dFNWdheEk5?=
 =?utf-8?B?YzVxM1VHL2Q4VEZUK01YakxuNmlUdWpXYUlQaUlxaHJmNjN3REV0TXVTOHU3?=
 =?utf-8?B?RFp1MGR1UHAzelFRd2xQT1hYc0RqNENHSmJRVGtJZkZDMDFpZjQ2Uno3Q2Nv?=
 =?utf-8?B?OW1JbFpTcWtWd2lETlgxZzh3UEhvMFB1elZKaHo0UUVwaVY3WGRHOE91aXJm?=
 =?utf-8?B?dlJ5cVdWQ1h0TnRUWEg2YmU3QWt0ejg2Ym1WUUZrcHdIRkhZbnFabWZ4UmMz?=
 =?utf-8?B?VlRoZHdDWTZJb0J5aGNiMHF4T00vR0FCLzFUV2pVU01mSUpFdGNUalBkcHNQ?=
 =?utf-8?B?YUswdTRzeEVQNUU0dGlzNk8zM0dLQkVSTXc3RngrRWVIRHRnektqVU5DaDRk?=
 =?utf-8?B?VDZhSGFiaHJkVlpsZ3hteDJYV1BpMUJ0VENCSElQVmR4MmIycDY3eFhpUTlY?=
 =?utf-8?B?dzJWVDBMNUgxUGlselNJU3R5b0cvMmEyVjlnQjBkTlc2VjNTdjRBZHIvdUcw?=
 =?utf-8?B?RDdkWHlvbnkwUHBkbEU4T0xaczkxZFZqcWtWMVVleTZCeWN4OHdTOS9wQW5u?=
 =?utf-8?B?eVdCNGpseFdNTm5GWXdNazB3WExlSzBFbVhMRVdNT1ZZSldRTnFIc3VsOEg1?=
 =?utf-8?B?NCt4eDhZZEVjbkxLKzgzbTV3bUpTUkd5QUFDK0dPd2dudEtESk1IVXM4NEY1?=
 =?utf-8?B?ZXczNnRzU3ZSZUtaNjFCMWZUandJdmw2UVc0NDFqWTNFWmk0NDAxcUREUEN2?=
 =?utf-8?B?anpZRFVRZmRta0xISW5HM2ZUSCs2Mklxb3YyUkQ0RmhheCt3YlRKU3JkSWhL?=
 =?utf-8?B?ZjBITkRvWEhLWXRlRWZsN09ud0ZxY1NVYUpES3RsNTZTZEpKVHAwUml6dk1x?=
 =?utf-8?B?aXVBZjBsNG9XNDNHTkhmWWhLQVRHdzBGdXNlcWhwWUdMR282Zkd2UFFHdmNT?=
 =?utf-8?B?anBqTElHTHA3eE9UVUtVdmZydHRGdDVMN1l1N09vV2MvR3ZMRUpPTktCdUpU?=
 =?utf-8?B?TndibGluTGdpRFpHNS8wM3ZvNk1wOHhUcDBGQVBWc292RVRBTTlSWGdEaXk1?=
 =?utf-8?B?d1VwQVRVTjZncG9HWHRYRGVTTG1JZmo3SzFWdzlQbWJXMGsvelNqRnY0MlR0?=
 =?utf-8?B?SkRvdXlVaEhnakFaZXpwOFk2TVRNNEtKWjZSMmN1NURYUC9sQkdLaWtKTjl3?=
 =?utf-8?B?RitOb0F4SnE1RWFOT1pxNFhkSDZ6ang0cjFYczRtSHlZR2hYaFFVZ3h2d1lM?=
 =?utf-8?B?YWh0cUxZWVV1NWxtWVgvV3gvczRQbWVsOUEwc0MraVNjMzlRZ0x2OGttWUNS?=
 =?utf-8?B?S3hJY3F4NGcyZWJTQVNZOUFjVzRXRytlU09VSkZFTjd5VFdSMEkrSU1sSE1U?=
 =?utf-8?B?SHBLeW9DNHhaS1JVNWRjM3N1RU5mTEgrYzB6by9zeDJnTUIvODFzVmx4WWV0?=
 =?utf-8?B?clo4Q2hsK05YUDZJc2puS3lMQ1NoLzc1bXNIMnh0dm5nSHdsbHdVRmRFZitz?=
 =?utf-8?B?eGtGbHJlNXFCSGpOc2loakhKOTBTYjNaSVc2UFppQmQ4dzZ3Ykg3OGZac3hF?=
 =?utf-8?B?MjZxVzhMYmUzT1dtZng4emorNGhlbG5nby93L1lxR0Jia081aFhXZmdRRmN2?=
 =?utf-8?B?MG1QZVQ5R0V1dGRkcmgzenJSQTBnbUhZNFlSUnNqdUE0cDYyVE5QMmpDNG9O?=
 =?utf-8?B?OUV2ODNTeHBiQ3hkcit1dmw4Z2I2QVplRkJQRTZVTFVqMWY1Zkd5cnNMM2xp?=
 =?utf-8?B?RGFrV3U0eWtFODFGZ3pxWkpNeFZ3c1d5TnhNNjFEVEcxY1ZnTTNOSTZUT25Z?=
 =?utf-8?B?SXNuVUJRVHV5aGVFbVFadVI4ZGM0OW8wTDV0R0ZWYm03b1RhRFFXSjlHWldq?=
 =?utf-8?B?aWFVcmpleWRvbCtHMzlXRThXVFhxeEpmZU5oRlRHdzdQNzEySnpGRXBpd05M?=
 =?utf-8?B?amhoM01KV3RRcXRhZE5uZHpiekJoR2QxTVoyQzVZVGdsRTh3Y1laKzI0bjgx?=
 =?utf-8?B?TDdvS2VxRHcwZUp5ejhvL0NzMTIzcFJLdEo2N3M3RG9VWmtleEhxc0dVL0pr?=
 =?utf-8?B?NzVDMllXUTZtOXBXckZudlRQUm94VlZ5bFNwWGVPeDNlQVd6TENHSUJrcWxo?=
 =?utf-8?Q?RcKnzZ3oCpOzB8l7rXSqzxsQK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 554ea0cc-e042-4931-16b4-08dbc9d0f876
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 20:39:16.3520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oe1cPC9pVuLYcw2Mm6e0T3MDVvN6pSz/nI7BHYyWmfi11nblbvN+hATG/9oA0QRKnjntIkVGMy+kembfa19Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4086
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, John Harrison <John.C.Harrison@Intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/23 08:15, Andi Shyti wrote:
> From: Nirmoy Das <nirmoy.das@intel.com>
> 
> Add a function for ratelimitted debug print.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   include/drm/drm_print.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index a93a387f8a1a..ad77ac4b6808 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -602,6 +602,9 @@ void __drm_err(const char *format, ...);
>   		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
>   })
>   
> +#define drm_dbg_ratelimited(drm, fmt, ...) \
> +	__DRM_DEFINE_DBG_RATELIMITED(DRIVER, drm, fmt, ## __VA_ARGS__)
> +

I guess since this was last sent drm_dbg_driver() was introduced,
with drm_dbg() only being grandfathered in since it's already
widely used, so it would probably be better to call this
drm_dbg_driver_ratelimited() instead.

>   #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
>   	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
>   
-- 
Hamza

