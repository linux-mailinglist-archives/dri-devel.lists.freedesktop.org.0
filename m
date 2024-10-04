Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27DE9908CD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 18:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B48410EA42;
	Fri,  4 Oct 2024 16:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xlwQID0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9318010EA3C;
 Fri,  4 Oct 2024 16:16:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOiNCZYTcxNw4bN9WVS8bO4saIgVh/Oj8Fxe+Qa9Sl/f3bzo/Ky335O94DcolSlTV1FgkPJZnWbYfrEcvP+EIPYfD87T5gs7SXdvaLeA6JOpYKxlmC/nuUkbHL26ut2J8iDXIyH5RCdcHEy5Bu9o45p6OIl2+V9Xu0bBrxxLi4X22R0av6d1obxIiQWe+WOcmQa6JEOkfq+MMouu26ItFqUm2pcdEOixn6BpNQISqVDi8nl4S3TWadJQxpUlBpBYwiS0Mm5sylGpRFC617kJ+DVe1cTMXzUfX8UEG5pwUvwPZ4IIcuwZaDg/mUh8cg56fFUqBS027yL77HLnGocJAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PP4xQKb6P7Mi+kU+3xAZWdeYyZzq1V9G9smqXFqELwM=;
 b=xoVAu9l3MtRlx+qCH/agRvq4+0i4J86RvoT2NOLrSzAgbr7NGE3S8yOe/ehcol4QW+9NtXZylE/OdRROPa/Y/ITPIKYTfW5t3j7/vQMr0ISbF22ErporRGWiYcm7ZswbJY3Qokkrsb8oCr8JIbf5s/x1WvS3z76v4OteU73qOyOanvkzDwxz3TSmZFxaHS66LgZDi2k78GdICY1FZndprQuMNZwfvaP7EF5ea79M6s4mza0HEjSPgEk0bCJpEdI7Mkc7AeXI4VBLHV8BvHmU/y/wIdfcTlL4P8f2IGXAbQit7EcW+qBiWDO5rQ2ydMgv3jVjsrwGLMzl/hALw51t5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PP4xQKb6P7Mi+kU+3xAZWdeYyZzq1V9G9smqXFqELwM=;
 b=xlwQID0j9uxy7r/Mvu6tL2PQSR27en4SX4twGoJsWar/MD5Ha4jAkZGhIWcOs6wo+zScQRl5oljpZ/36qoXiTxRYKzKreiJGk+QVBMjwSPH4GX/gFuem656TsgshknHLa2F3rm7Y1ACBfgW2dekwdMDIpsn78DRKdtEtERpR8JE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA0PR12MB4366.namprd12.prod.outlook.com (2603:10b6:806:72::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Fri, 4 Oct
 2024 16:16:10 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 16:16:09 +0000
Message-ID: <9c8c49d2-f167-424a-a916-c817957d4c9a@amd.com>
Date: Fri, 4 Oct 2024 10:16:07 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] drm/amd/display: Use drm_edid for more code
To: Mario Limonciello <superm1@kernel.org>,
 Alexander Deucher <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
References: <20240927230600.2619844-1-superm1@kernel.org>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20240927230600.2619844-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::23) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA0PR12MB4366:EE_
X-MS-Office365-Filtering-Correlation-Id: e54dc7b2-6e65-471e-260b-08dce48fdba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXUvcHVNUkNPM2loNEdrdWdzODFGN0FWK2grbTZVSXg2a1N5MHMwK3B2YUJK?=
 =?utf-8?B?dVpoQzFEQmZLMU5VRk1YLytDdzN6R21uM2pLdFMxTGl0ZU5Pa3dINkpSM2xQ?=
 =?utf-8?B?SnhyTUp4TWtJT1FWSEkxQ01wa2hFeDNtQXFUdUpHSzdYdDc1T1krYXVia1l4?=
 =?utf-8?B?UitTaWpMTXhvOTVKSjJydUg3SWZhSzZUNTNjb3JFdGJzTjJMVmNUeEMxUUg4?=
 =?utf-8?B?U1ppMEdXdjlMV3FueGxyRXc0ZG1FWjNJeXZvQy91NkZUNG45dW1NU0pnYW9T?=
 =?utf-8?B?NytpbXZxbG5pTy9oMVRWWkMvOGlRK2pmcklaZHZiSnlBbDBhS1F6VTRvU0VV?=
 =?utf-8?B?S3B2VG9tdTZQcUQ4ZHozVU5uQlBidU52V1RrUGE1bGRKTWlwZWxzNnU4Rkgw?=
 =?utf-8?B?VURzelhITllOazJWL2FUUEJwUjNpalBsZ3FyWGNUWEhoSFBUUUV6Ylc5S1A1?=
 =?utf-8?B?SU01cCtiVkxiM0lPdDhhL3YxbmZ2TzgvUFpqUnFnTmRNNmVkMndIZ2VOb3Nz?=
 =?utf-8?B?L3RsS0FWYVRDTVFvbEdDV3k5TFRpaGR0MEpWcXRJYW5LNUdWeUVDMTNYbTNE?=
 =?utf-8?B?aHRCaVdMYlBTRDVYT0pQTGlMV1JMSDBaTTdGZUxiOFVPR3BEdlFkYlJrczZD?=
 =?utf-8?B?U21NR2U0SDRLZVA2eDRreG5wUnFTMW82b3I4ZGdXdHZERHNjbUI4WnhuWHdB?=
 =?utf-8?B?V3RXSmgwZzhVN05oc1BjSWRkUFdiU3o1Wk5hVjc2VzRFUlczVHFXSXVOeWhY?=
 =?utf-8?B?OEt6ZE9YRTgxUXUvSk55aGU1UHhyV3hmY1VLUFNVaFcvemt6Um5pYjk1bmU4?=
 =?utf-8?B?Y0xydkc2Y1Y0dzd1emZESzlaNkxYRzVsOG03bXBRU0hvdS81WlB3WXM1VUI2?=
 =?utf-8?B?eEJ5bWhtZGt0NHFBNU54UjdLL1o0TjVRWWJiQzYyU3hsWjBzWm5qUFl1bm1O?=
 =?utf-8?B?dWZrTyswLytKQU54UUNsRVh0azNSdUlBdytEM1BnT0E5UWhhamIwSGhEcWMy?=
 =?utf-8?B?QXNPVzQ2OUFjWkJFcTllTkxaa1dDaHlrRjR3MVFXa0dNdU1LeU1ua0RDK3Nh?=
 =?utf-8?B?eE9kRW84NG4xZzZrSi93WnM3ZEZWUXpveG5JcXN3UEZMdGFjZFBOaXE5eWl3?=
 =?utf-8?B?d2FIeHdibFZnRVNXVzl6RC8xOUhpVmJPK0dWcXN3U25GNjIwU2VZUnJHRlZk?=
 =?utf-8?B?d2p4dFMxbzQ4VXZManJFNUk4Q2U5QnltdWFxS2NKL2EvTnczRXZlVFJzenMy?=
 =?utf-8?B?aU16YjIrM3hkNG9DQ1ZTcGwvSWNSSldxemlTazVXODJ0VXRyWHJXNDRYOEd0?=
 =?utf-8?B?QXdObXpEK2NQa0FlSmtUdzhna2RwRVhJcVlyUXNmeEhHVDVGcXViYkhtR1M0?=
 =?utf-8?B?RFBkNmVPVkdnZXdwZGJwcGkrLzhWeEJRK0dCcmxkRTkvQW94MnYvNHZsYjRV?=
 =?utf-8?B?emZFb0VmYjdvQW15aGJScVppZGtodVZ4dEpCRDFUU2tmLys5cUhxR2JDUXFP?=
 =?utf-8?B?bnRLY1hwS2ZPVWVCZTlOTVFrcFpITUxEWWtvMzVmOWFrRG1hMXNqZkE3Y2xW?=
 =?utf-8?B?SlYyQjJRbm9qdXZVUm8rSHA1THg3cU92LzB3WkFwS1lpZXRsdVZrQTVvMVVH?=
 =?utf-8?B?Yk10WkM4SGNyZVNYemNSZ0IydHRZOXNHZk1UZmtNQlFrSCtoYklJUUpGL203?=
 =?utf-8?B?S3JvVDFFNmJLYVlqWUZsQXQzNDF5d1BnMkd5SURlUC9vVU9PTHNzUmRXbWRK?=
 =?utf-8?Q?WbeaKZUOQ4qqXMfgL4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0srNmNHR0NBVTdTUzVjVHE5cnpJOTkrbGNlbERnbFovTjJRZHhBbGlpN0t5?=
 =?utf-8?B?L1owQVNCS3ErclE2ZHR4cTE1WGtadWVyUkRRc2JqaDFiS2Y2N2h2cG51c29T?=
 =?utf-8?B?bWdzUHJLMXI0dDNuYkVPRVZZMEYxNEluV3FyZ2tGSWJXTXdBcEc5ZFA3MzI4?=
 =?utf-8?B?Q0hKVWM1Y2pIWVlCQ3A0NTI5RmZZb3JDNTN3VG9ESm02cXNPL3RKUkRZRDlV?=
 =?utf-8?B?MXBoTDAzZFpFTUdaYlpWSExIY0hZSW42R1Y5UEF1Um52R000T2gwc2pQVElV?=
 =?utf-8?B?blVEK1orOEljKzJ1UzVlUlUvM1BqMS9Wc0J5V29acTA3K3U4eFJ3eHV3MXlL?=
 =?utf-8?B?VVdIWFBHY2w3OFFpTE5hMTJ4bllweEorK0g5azFlV004T015SDAvODhhVCsr?=
 =?utf-8?B?OW1QTjdHZEE5bUQ0eUx0ajFNek0wdTB6endPbCtxQ2RmU3ZLc0RIeWMzMnBu?=
 =?utf-8?B?ZmVwZi95TVM1YUxDTUw1bGhOS09GT2s2eS96TUNSUlB6L0g3QlZkS1BpY3p0?=
 =?utf-8?B?a0VNQTBlVDhkeStsREZneEplMHFobi80MEJFdG1LZVpobWJwNm81a2hlcm1D?=
 =?utf-8?B?aDg2NEFaT2VuMWNvc3BCc0pLS0d6ODNZZVQzY00yRlNHN01lZWtUQTdCRno3?=
 =?utf-8?B?aG9oMGJJYUJoWEQ4SHJJV1NReFV3bnZURlJHN0pSOEp0ZXN3RFJDYWV4Nm1N?=
 =?utf-8?B?MGVpQ0dFZU1XTElkN09wa205K3lralpFeDFUN3BscW5Ud3E3VkxlRG5STFo4?=
 =?utf-8?B?SGFzZXJlTEhMamdTOCswdkVqa1I0c2lpNGdtSU9hRXJRclE4SGg3YkFPQWdN?=
 =?utf-8?B?dWFCeEN1OTlSMDBiUEhXeTdUbUFDMnRvM0hLRm02YjlJbkx3NUpmK2RQQVlj?=
 =?utf-8?B?M3N5NHg2VGNadnpiMXN6eFlMZXpzdFQvWVBvUmppc3dqOEVKN0lUOXpNRi9l?=
 =?utf-8?B?UHpkRmxON2RidGswOGcrNm1TbFZUaVMwanNsY1I5YUNMRXdMUmxyaWRMdFNC?=
 =?utf-8?B?cWY3UkJMNHNkQXh1dzJVVDI3c2FKZTcyM2YwVGtsMHRXMmRkcXc1bDFXb3Y0?=
 =?utf-8?B?M3NiV1lxZk40K0hQRmpyZlpPMDVLS2FoOEluaHFrZ3V1VWpHNXJUS082SkI2?=
 =?utf-8?B?TWtGQlNLQXQ1dldjeklpbzdCcXBjK3RrMlZwbDFOWGFRVzNUQ21PTitTZjBF?=
 =?utf-8?B?eVFVNXRta3dBbnNIUWVjdlFyc3hKNThHdzE5YUdrN1p2YUFuZmhFSmhuSTJu?=
 =?utf-8?B?VlUreENXR0tSRDdPOTQ0S2ZQcmFlQU9ETkQzREVzL2hQbUxnbEVtVmNQTm1D?=
 =?utf-8?B?VkNOMHV3OXBMakYvMmFoQTJhWEpNRzNWYllWanNHU1c1Sm1zNzhWZzB6MVdu?=
 =?utf-8?B?TElwY1NwNFMxd3Yra2ZTbmNHQzR4TEZWRWJSVENUb25QTDlNMENWaW45aHpz?=
 =?utf-8?B?cU5vWS9nUENJMkNCVG5ETk9CSnhhZUJWQzJPeFN0R0JGdGhlUjh4NGk5TDBK?=
 =?utf-8?B?OE5LMTdBOGJCak1Qb0s4TGJMSmdYbHlsNkd1QkMzaUVCeHAyZGJ6akkrRUxI?=
 =?utf-8?B?eXc1ZW1Qby9oTWl6aXlRS0VlZlZZa2tmdXR4S1JUM0ZGOWVOclQwQWsweWZi?=
 =?utf-8?B?Z1U2M0I3Y0thZmhBb09YTDNuM1NXODVmcDFuNnJyVGlmU1BMRXNvSnIvUDVs?=
 =?utf-8?B?MTZHcHZPYkNlOWtCcmdnK25DZS9WSFNvTGwwRExROWFkZGJIeUg4cnFZUldQ?=
 =?utf-8?B?YWhXTUNLS3VaMkdHd1F1d0t1WE0zWDJPcFNRRUZFNzNFUDYya0YzalpzN0J0?=
 =?utf-8?B?SzRsRFZJNjR0eEZORWtCMlNEc1JjbUY0aTNzR2VMNGpteUtaTjhHbGZ3bkdt?=
 =?utf-8?B?RTNBdDJsV0FQSE93U1VhMzd6SDJNNERpSVlWV1NaU0ZhdjdBTzRnY2k2Wi9T?=
 =?utf-8?B?Y0s1VlpSeU9ZZzVIWVM5WjRMV3hEQzlsblVnZzFoL2hYcHJsUzFUQ0VYZzZk?=
 =?utf-8?B?U0F5cmI2YXpRMHcxUTlEWnFnanJUNVNrSDRKTzU0em5ITTBaT2N0Y250ZmJl?=
 =?utf-8?B?aFA3elBUWWJkMm1STGlJNExSQTZqWjNReDkyVXF0c3lxakwyMEIyemx5ZFN1?=
 =?utf-8?Q?LWDDJ4IDQQcvHfsi4osY9zJBk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e54dc7b2-6e65-471e-260b-08dce48fdba5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 16:16:09.7797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kktvEuzzpgH+P5qlaUwmUPHm7UImlvGkb8wlsln1aUi6owXazcPl3EnMkJV6++jgtEgQcc++VvvczQSt9cxAyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4366
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

No regressed found on this patchset series.

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 9/27/24 17:05, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> This is the successor of Melissa's v5 series that was posted [1] as well
> as my series that was posted [2].
> 
> Melissa's patches are mostly unmodified from v5, but the series has been
> rebase on the new 6.10 based amd-staging-drm-next.
> 
> As were both touching similar code for fetching the EDID, I've merged the
> pertinent parts of my series into this one in allowing the connector to
> fetch the EDID from _DDC if available for eDP as well.
> 
> There are still some remaining uses of drm_edid_raw() but they touch pure
> DC code, so a wrapper or macro will probably be needed to convert them.
> This can be for follow ups later on.
> 
> Link: https://lore.kernel.org/amd-gfx/20240807203207.2830-1-mwen@igalia.com/ [1]
> Link: https://lore.kernel.org/dri-devel/20240214215756.6530-1-mario.limonciello@amd.com/ [2]
> 
> v8:
>   * Drop patches 5-9 as they cause regressions and will be future followups
>   * Rebase patch 10 on patches 1-4
> 
> Mario Limonciello (1):
>    drm/amd/display: Fetch the EDID from _DDC if available for eDP
> 
> Melissa Wen (4):
>    drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
>    drm/amd/display: switch to setting physical address directly
>    drm/amd/display: always call connector_update when parsing
>      freesync_caps
>    drm/amd/display: remove redundant freesync parser for DP
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 195 ++++++------------
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  76 ++++++-
>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  34 +--
>   drivers/gpu/drm/amd/include/amd_shared.h      |   5 +
>   5 files changed, 153 insertions(+), 161 deletions(-)
> 

