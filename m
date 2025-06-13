Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F2BAD9487
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369D410E8EF;
	Fri, 13 Jun 2025 18:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zqI3XwqH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6DD10E8E4;
 Fri, 13 Jun 2025 18:35:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mq0S0O1MePIbLpCHWNQoeosN0BU3ciURXPfgQgU4IqBAu3j2f8bfxJDBSoXnIuSyzG2LyMmUd96voLTp3sYYb2sjxfywIi7/1y12VHVEN+p60fkjHqIp8LIXMOhIQwRZGdzqMdMGfnySK3/PmQOJRA8DrM0Vp8zvdS3togSYibd5ZRRVEwD5kXVriaE1B1QMMKYwAiXKwuZHIMvSaZV2hC4KMaHh/E76SWHhzKctnfsB5uDzdidUNnQ3Ppbx4L+bWBJp9ruQCrQ9vWLS86Y48OH1+dIguHObiypva13Ml57cPS2cXBtmNaBrzGZXnUVwA0QxSwYw3p6iMebmxnq4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxG9vPEO5aRWH8oJUXd+lfO/kPfYY6nOmZbn3pgMMGg=;
 b=Af/VxAjoFCry1QR8wpARmToOF1ebeZI4cIWCbHqfEeKYMna4qwZffY4i8+fjsF6iMk+/Ph44kENpwjS6p3TRKwFocl10MX6owU/HPl0GyYK08fAtx/tB5kCoQ7TsOZBVDwAAunOhVsRicu82Y6FV6ql5qf4yMRwg3Z/RuXEzsS0TeXj0REbecohpADBQ7mNpHTUaVhTh6sX4wlnG5Wn30NJgSf3se9HNeVgXoaeOp09/ct2NLaMnKhX8ooLIl2Cbf66WR/no4DpK3lHb5pdvuxTf/No5EyAI16uolhdBJyvnYr+YWecYAiQCTYDZQcytyfs6hS/+s7ACpff1g5wF3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxG9vPEO5aRWH8oJUXd+lfO/kPfYY6nOmZbn3pgMMGg=;
 b=zqI3XwqHVqY9WPQ5QBbnJ4s/UAvtc6Tn5caKSzwMe0MpAd3O7eQm+hU0kKApPS3pEi0h+SZAndB3lQ7bY9EwHwpVYRgtnNHHCmR0R2jARdcnQWYVN+HY5e8sLJqecenOSZI72BGWKloHzXFqnBjMhiNXraFfPbRUmHOIi4+RuBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB8214.namprd12.prod.outlook.com (2603:10b6:930:76::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 18:35:38 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 18:35:38 +0000
Message-ID: <28470c12-cc2a-4327-ba72-e926960d5c81@amd.com>
Date: Fri, 13 Jun 2025 13:35:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/14] drm/edid: introduce a helper that compares edid
 data from two drm_edid
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250613150015.245917-1-mwen@igalia.com>
 <20250613150015.245917-13-mwen@igalia.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250613150015.245917-13-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0219.namprd04.prod.outlook.com
 (2603:10b6:806:127::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY8PR12MB8214:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e18ea3c-af93-4117-c347-08ddaaa917e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1dYaGNYdHEvcFFHWnd2R3Vqa0FiOEhMTGNsYS9NU0RCQTBiUzhEU3p0eTlU?=
 =?utf-8?B?YWx3SXZ2TkhCcjNrOXRtaWg5Qm95T2tJRjlBWlNMTkgrdXNHaklWcC9KOEdz?=
 =?utf-8?B?K0hQd0pTVXRBMnVNNStnRFBSTTN1Smhlcmc4ZUd2c2RCYVl5eStUdGU5OTgz?=
 =?utf-8?B?VExIU2lrc0pXZlEzTzF3SjB3NFdBa3V3bmZ4cXlwS1ZXSHliNUJVcmovTEh1?=
 =?utf-8?B?a3FyRDZEVzRxYTQyWnl4bFRlWnZhTWFCdXQ2bHJ0b2ZlKzFkU21sK1RFakNX?=
 =?utf-8?B?RGJiZURFUmxWV2MxTnVYMGpCN3Y1U0dxRDFVRE1OZ3lpM2tkM2pSRUswUlEz?=
 =?utf-8?B?bDluOFJsalhBdUIxbCtxOGxHRjNFUDBLRlNrYjBLU0JpZk1rU2hLYjFhSkov?=
 =?utf-8?B?SnRWa2xidWVqT2RmWFQrN3lpL3ovUDFsdXhaMGYwdDNUcjBwa0JEaFRrVkdQ?=
 =?utf-8?B?UDZHd3hGNWgyM29QK1pCaGs3blM3TFIvSG84S3dxNC9kcDIvdTZzOEJrV2FF?=
 =?utf-8?B?eTBLVzFmcUI1STZ6dEw2YUU0dFNuMHNNRU4wb24wazU2TjZHdE51eWIvRmJw?=
 =?utf-8?B?RVkrREkyV1FoZHB6aHdPZzVETmZyaDJ4K2doa2owWFpzZEJWcFkxZ3YxZnoz?=
 =?utf-8?B?djRrdWtjSnlVTDhMQzNDV2tvaExobzNNWjFUK3FOdVorT0RiRXREdk9BY1c1?=
 =?utf-8?B?MHNJeEN0dnlsMGhtQlhvT1J6ZVpnUzZKbEE0OXE4Y3JYTUNIRjVySDBwYVRX?=
 =?utf-8?B?V0VDWS9LSVlLSlgrYzE3RFdDcjg0cDdzdndRU2Y5SmZ5NkFvVWoxQVZNbW5s?=
 =?utf-8?B?UHJ2QkFzVDY0aS81WE9pbk1zVWN1UGxCZmhxMDV6cGh4WDRYWVFsNWNLQmlC?=
 =?utf-8?B?MHRlc0svaSttbUo4U2NybXkySFIyenNlb0F1RC9ud0JHMWpxSHRoeDlSZVk5?=
 =?utf-8?B?bjZZaXJ6SW1xbXZUWkwrdlhtbEplODlBb1pTRk5tT3Byak9KU1E0WTYzdDc2?=
 =?utf-8?B?c3hKVWtCRmdiUitGM1pKWDZKZjMwK2JxU0FyS04yUUpONVhLWWJ2MlJ2UnVz?=
 =?utf-8?B?dThPZ1h4cGFTNXJIWVhleUVTa3R3bTFSK0JjY2FWeEdLVzVmeXUwSUJGV2R2?=
 =?utf-8?B?ZUU1Rk1VTkxZOHk5ajdneEwzdFp1aFM4VG9NcHJ5Z0pNNnJxbU5TbUJaRjlQ?=
 =?utf-8?B?bHJvNC84WXJqbmZabjMvbzVsUlBGem9FSmlDVzR0NnFiaFpiNmVBRHJQYSsy?=
 =?utf-8?B?aVdxU1c4ZFFrM2hDd1V6MlBkdnJuTHF6MUFpNHhtTDU3ZHJmdDNWR1pBYUQr?=
 =?utf-8?B?YWRmbGRkT2xYWEdTY3ErT1FGcXdFSE1SOXdPZ2hYajJPK0tPY0JmbzNvVGFo?=
 =?utf-8?B?ZVk2SEpxQUlvS1h6L0xwK2IyWWdvWGlxdFA4R01vM3h3dEVmLzRmdSs2cHpG?=
 =?utf-8?B?a0tpYnlOQUF1M3QvRnFKV3FnYWJjTldxNmdlOHNBUWN3RUFsaWJXZHQzVnMy?=
 =?utf-8?B?REdqN0gxWWdBNEM0NHQyV3M2cG9yYmFZNnJkMEFNU0JJK2kvdmRKVWFaQm5y?=
 =?utf-8?B?SzkrVWxCcStiZ1psU0h3Vzg4YmVqMjZZUG9VajlnWVlqUnYrVytZZXIzZXNq?=
 =?utf-8?B?b0FSZmZpaG01V2wvQVBlN3p5M0dIT3R6S2E3cTBUYmF0Q2MyZktxR1d4VTRC?=
 =?utf-8?B?ZDFGcWR0TEpWQ0lIMm9yWEZjZVo2bTgzdi9iYm5sNHA1Z1dObHZKUWRQNXlR?=
 =?utf-8?B?OFpXZ1lCYjRyT1JEb3BScCs5bGswYmY3NzF6ZFhyWTBaUUYvekNyN2YwZ0lq?=
 =?utf-8?B?Y01lMlNWeWpzUlJSVDJIZmpTdDFHNUZpVmUvTG5pQVUrQ3k0bmhIMDVhaGg2?=
 =?utf-8?B?NW43NGk4YlFCU0s1SDhQUVEyQndZYnE3NmNJbzgzb2hBbkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVVFa0FFT0YzcUoyaG5XZzZ1YnRrMGVEVWRPdExtQjRQVzZhREdWbEIxVWVw?=
 =?utf-8?B?TmN6bmltKzVsdWVBV0x4Zm42a2dWRHRzcFMrazdoL0QxSThoSG50YzJDY2VV?=
 =?utf-8?B?cUpNYmhnSU9yWUhtVno2ZDQ3R0g1MFFRWnVNRDY4TTMzUHltUE5YVkgxdkp3?=
 =?utf-8?B?dXQ3N1VpY0ZQUTJQNS81ZExRYUxweFNqa1RpbUNzbGlQc29zeExLb3ZGNWJE?=
 =?utf-8?B?Z0g3VVlxVnJoY2RLVlEwRVdZMEdTdGpxZUhnWWs2Yy83WnZid0JNbFU3eXJD?=
 =?utf-8?B?bzB3V29Ec0F4eVdCcnhFQS8wd3hZRUNwbGdHOHFsajhoR3lwcExtRWV3WnN1?=
 =?utf-8?B?YkJqM2ZjRTJ0S0tmSExrWDFTaUUxb3JNaEhaK0VzVkd3bElZZWowSy9zNDNX?=
 =?utf-8?B?emxxeHRKOEQyTVV5NU9ySTlaUUFOOWxiMVE3MUhZV2RXNnNlMmJBckg3Q1hX?=
 =?utf-8?B?amhodXhCUys0R1Q2OG9pRUJ5elIyWDRVbDB1R3p0ZitQaFBuK2kweVN3QzRG?=
 =?utf-8?B?eXNlMllHYURRR2ZSV2wwajRHV08xbFRXbEhGNkRkZ3BFZE5ES0FwMVRqRHEx?=
 =?utf-8?B?WCtTZFVFbHM4L0lORlN2R2N6WGs5cGkzTklkNnM0OWRaQnhkVGlPUVkyQ3hM?=
 =?utf-8?B?Ull3eEhlVWxMdnpDd1hwRFVHVXltV1V6MytTeFUwR1NLYzlKbTZxQlhZZ0dQ?=
 =?utf-8?B?NWlja1NOMFI1MDUvdEdzUHdvYThkQmdFUmxiWkF6N29JQjdEMXlyVXc3a05m?=
 =?utf-8?B?TWVkbS8rVDN3ckZPejBvVzdwK3cvc255L1Nnd1RZMDlob05pQnI1OVJiZjhv?=
 =?utf-8?B?em9KUjhEdjdXNG1qMElBZ2xjS1hpVkpJdWR5WHhZcWNJRWU3SWVFY2dsWDlI?=
 =?utf-8?B?a01XNGYrcFlGczdnaHJmR1hKcEsvRzJNemVpQ3ozOFlrTFJyejBtZmFCL2Fh?=
 =?utf-8?B?ZGxDSHY4YndNRmtEMWpFcjZJanBCdm5LZUJaR2RmMGxNRUs2dVZZS2lReEpz?=
 =?utf-8?B?WEpzK2pxZTd1TzZuNVhmTWcwOHBaa01lTjcvLzlLTzlZTkVzVGsrd08xbG9q?=
 =?utf-8?B?bnlrcFFvRGMxTlB3QXlkOTIreFd6Ym8vbnIyTEovYjFTa3ljb1h5Y0JRV1pK?=
 =?utf-8?B?ZGZGdzQweEp6cXFXTVU5SWlQek80QWdNaFlzRG1uVzUxN2dKbmN1MXRNemho?=
 =?utf-8?B?bXNGOEFQQks2Qno3TnNrZVRBemhSTVFqWU80aDJsWCtmbklqSFBoMldaZXZw?=
 =?utf-8?B?RDV6V08weUIyS3gyZ0NEcDkra3pDVFNkQmI4dDdNOEVRT0g4OW9YWTV2bUR0?=
 =?utf-8?B?TE5UdVlnbjd2amk5Y0pzYVcxOUpLLy9SVmpiUDVQeGtqSi96VTJRU0NPMm9h?=
 =?utf-8?B?TTR2dE52R2F6dXFKY2JJV1RPYzFGTW5pM0NjTjNVSTdab3NXN0NjdUZpalBl?=
 =?utf-8?B?c25zblRZSUVBQzlNd3Y5NUhjRC9FUFZVSE9CS2V4NU5aVW43aTliRnJPSEdr?=
 =?utf-8?B?ODRPSUo3ckdVV0lkU2kyME5Ma1dpNnd4d1lnOVZjcDdWbFlreTZqOFhBTGtu?=
 =?utf-8?B?V0pYWkxObVpPRXhTMzRYVmw5czVMT2ZnRFlYSEV4WTFJSitZUjhkN0syL2Vn?=
 =?utf-8?B?OGZXaVdmUVIyUC9ZemFCOFF1TnRseGdFdTlma1pPbmorRytHczgyVEgrSWZu?=
 =?utf-8?B?SldwaTVjNWJHSXBuY280K2NPWmh5aWZ1VVNkVWxVdjUyRG4vSUUxZTYwcWE5?=
 =?utf-8?B?a2ZYaC9HQktUTnFhWlFBbkxoOS9Wd2FhdFNRV2lDK3RiVmVhbUlBcURzZStp?=
 =?utf-8?B?dFc1cnVrRFlGQjVLZ3ZwSmN6bVBxQjUxYlNpZDFKY0pCNFEwMnhDTXgxNUxj?=
 =?utf-8?B?OFQ0SnZNQlRGUUsxdFY1aEtZNUI4R2JtRTZzL3FqMHJFd0FVMHowM05ReXBX?=
 =?utf-8?B?Z1Y5NU9iTzBMYzZ3Q3gxbkhTNVE0SFJyMklpdzV1WG5HQkFOY0g2QlVBa0VC?=
 =?utf-8?B?OTdaN1BvNzJWU21uN2J5NTlaV2x4a2xmbnZYRFdvemdzK000YmVVdm1uM1gr?=
 =?utf-8?B?MVdhTThtWjJyTFViTXlFdFExYWtSanM2STM0eDlEUis0UXlaSUJnODFtM0hp?=
 =?utf-8?Q?Dw3wqcdvB7H8/cmHOKQCq05np?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e18ea3c-af93-4117-c347-08ddaaa917e4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:35:38.5161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OReZ+UAb7a0/DLz+dYflWvON642xzvGY+km5s82PD3w0WDIeHJDLk9c2q9YzhYK9YXmVOmJ/nEcOjbBGkC2/9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8214
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

On 6/13/2025 9:58 AM, Melissa Wen wrote:
> AMD driver has a function used to compare if two edid are the same; this
> is useful to some of the link detection algorithms implemented by
> amdgpu. Since the amdgpu function can be helpful for other drivers, this
> commit abstracts the AMD function to make it available at the DRM level
> by wrapping existent drm_edid_eq().
> 
> v2:
> - rename drm_edid_eq to drm_edid_eq_buf (jani)
> - add NULL checks (jani)
> 
> v3:
> - fix kernel-doc (jani)
> - fix parameter names
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Co-developed-by: Rodrigo Siqueira <siqueira@igalia.com>
> Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 24 +++++++++++++++++++++---
>   include/drm/drm_edid.h     |  2 ++
>   2 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index d5772a3d27f1..056e070b2f55 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1820,8 +1820,8 @@ static bool edid_block_is_zero(const void *edid)
>   	return mem_is_zero(edid, EDID_LENGTH);
>   }
>   
> -static bool drm_edid_eq(const struct drm_edid *drm_edid,
> -			const void *raw_edid, size_t raw_edid_size)
> +static bool drm_edid_eq_buf(const struct drm_edid *drm_edid,
> +			    const void *raw_edid, size_t raw_edid_size)
>   {
>   	bool edid1_present = drm_edid && drm_edid->edid && drm_edid->size;
>   	bool edid2_present = raw_edid && raw_edid_size;
> @@ -6915,7 +6915,7 @@ static int _drm_edid_connector_property_update(struct drm_connector *connector,
>   		const void *old_edid = connector->edid_blob_ptr->data;
>   		size_t old_edid_size = connector->edid_blob_ptr->length;
>   
> -		if (old_edid && !drm_edid_eq(drm_edid, old_edid, old_edid_size)) {
> +		if (old_edid && !drm_edid_eq_buf(drm_edid, old_edid, old_edid_size)) {
>   			connector->epoch_counter++;
>   			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID changed, epoch counter %llu\n",
>   				    connector->base.id, connector->name,
> @@ -7520,3 +7520,21 @@ bool drm_edid_is_digital(const struct drm_edid *drm_edid)
>   		drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL;
>   }
>   EXPORT_SYMBOL(drm_edid_is_digital);
> +
> +/**
> + * drm_edid_eq - Check if EDIDs are equal
> + *
> + * @drm_edid_1: first drm_edid to compare edid
> + * @drm_edid_2: second drm_edid to compare edid
> + *
> + * Return true if EDIDs are equal.
> + */
> +bool drm_edid_eq(const struct drm_edid *drm_edid_1,
> +		 const struct drm_edid *drm_edid_2)
> +{
> +	const void *edid_1 = drm_edid_1 ? drm_edid_1->edid : NULL;
> +	size_t edid_1_size = drm_edid_1 ? drm_edid_1->size : 0;
> +
> +	return drm_edid_eq_buf(drm_edid_2, edid_1, edid_1_size);

What happens when the size for edid 2 is different than edid 1?  Does 
drm_edid_eq_buf() already handle this well (I didn't immediately look)?

If not; how about including an extra check directly in this function?

I was thinking this will handle it effectively:

if (!drm_edid_1 || !drm_edid_2)
	return false;
if (drm_edid_1->size != drm_edid_2->size)
	return false;
return drm_edid_eq_buf();

> +}
> +EXPORT_SYMBOL(drm_edid_eq);
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 960592167486..e7a9a4928b97 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -469,6 +469,8 @@ int drm_edid_connector_update(struct drm_connector *connector,
>   			      const struct drm_edid *edid);
>   int drm_edid_connector_add_modes(struct drm_connector *connector);
>   bool drm_edid_is_digital(const struct drm_edid *drm_edid);
> +bool drm_edid_eq(const struct drm_edid *drm_edid_first,
> +			 const struct drm_edid *drm_edid_second);
>   void drm_edid_get_product_id(const struct drm_edid *drm_edid,
>   			     struct drm_edid_product_id *id);
>   void drm_edid_print_product_id(struct drm_printer *p,

