Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CF4876C10
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 21:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383F81121B1;
	Fri,  8 Mar 2024 20:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5j5YHkbm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA27C10F37A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 20:57:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jj1nlXePJbXu+Tl4lXmpFnYEGkiusxtBVMjwr8mNmSkwTaVAMEipe3EkRabwWZoVva75hVPw6UQ+S0lANUqd7BLCNYvn8HrtnyyuEWQczlbH/F6gMMRqRz0WnvN+n60tBe11aHajic2HGNKnsoVJnvb6L/kSVh5AqlGg9qA/wGwJLAsVaeqcPH/p/C7H+AK6J8JTWR09OqMrlqkVvBhQ0zs2U7qjr9KLmt1FOtnkr22eeojS4/2t9G3SSE0fCHd8XquM8Vpn28Hu25NQ8hZ7EaGFTUP9hwMiG2iMkCyRRzkxcNQmi+MYzI/cG3gNLOpDMznXgOQPm0MjCQ6dy8wGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oM+pHZuC9K8LNQSZO+qrilvDBWB/5aukgyGmJ6ZIBNs=;
 b=apoteti6hF4Q+ArTcgP9z+QvpMR3AcodkLLK0ETnMiMybtBu//V/RR4og8hMiP+V1cX1WR/azwoJPp0bHRzvcaQXIW1eSthEOm9pUNAjS+kwT9hdGrvVRh/nyI646RpduptGXzQzs3iEUoEwslgGW+p47hs4ox4445WZ1mofJqII8fjT0zcusWH3Y+LOVOr6O7lBuPVROIHU9B3NLRiDVJrx52czpzLDxMgbc/+Rr+8B1B0JK4jEeK9XzM68mFUpqqD5zlDDl+Vo/cFY/UwoHdyDWJuM6yGsKCtwNtpwEy3KEMCK5scgZQWyFmU1AgSaStz/BGW6zg0Ip42D5Ya+8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oM+pHZuC9K8LNQSZO+qrilvDBWB/5aukgyGmJ6ZIBNs=;
 b=5j5YHkbmbft1VLeceEYDBm0gpltok2v6KPFTrxYL05vC8ppaPRpyjQOhywKiCDaxqeND79MsB0B9uQni4y0eiRbw5L4liF50kUBqFHSBEElK8OHdvZ/3L7AkwESvdmY6/z7PhKiErXx01tstwy8BsT2MolQ+luIM+0bBKh3UFLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MN2PR12MB4373.namprd12.prod.outlook.com (2603:10b6:208:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Fri, 8 Mar
 2024 20:57:07 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6c3b:75a3:6af2:8bf4]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6c3b:75a3:6af2:8bf4%6]) with mapi id 15.20.7362.024; Fri, 8 Mar 2024
 20:57:06 +0000
Message-ID: <0255d007-6929-4366-b47e-0826e13b86e8@amd.com>
Date: Fri, 8 Mar 2024 15:57:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm: Fix drm_fixp2int_round() making it add 0.5
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com, Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
 <20240306-louis-vkms-conv-v1-1-5bfe7d129fdd@riseup.net>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240306-louis-vkms-conv-v1-1-5bfe7d129fdd@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MN2PR12MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: ad1ec340-bd88-44a2-699c-08dc3fb25012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N2sTxWAOh4sCcD26CI6earh7NxgmGhGwOlGXBcCCC1HhvAmWaxzKGrl8d5Vvt+14JPDIuAxE41upSg5J53fZ1krLwtIfJeeaMfu7umc+ucDwigIwMmymAdX4OCNeBX2eNZfnQN+4BvLFZ23XkU/G9oOIngMOuvFcf1qxOFpSiYOjrQWU2irciICDns5zddws4uEbaIR9WI9tRkdApMNuUIA5ty6vzYtoeb+2zVXQUvsBeXOCwRu7WbHLLDodwI0XzxjFpzqCT9/8N/vZuuf1m+o1j3rmXuJc3vPXKSTXZxL6PmpRikHaahPpibGMDJblrNjpgsMaBjiUVDWMn44qjLzN9nPQ/vdId4x4uu++EHhQ7e2USZB7Od/87QYDln2KC33pxuYwqtZucnxYJBhjdDPxDEECvOwlxMdJ10tLr0SszZaB1eKGPRppLoPtCE7SmVUk2andXOg8LiqJwsj4CvjrCK0ckY2OLMJ28L8hFDb/iTZ1Nmy4yE3vSv823BSGjFeidjrXa6kGksxSXGa8yy3I6rrXBVS7jOq5SGOwF+fU/dOy2UwiR6JB7UeswGKk7+Y+b04+A0rsul5mTeFsGJQBbNDRybsIhw6eL6gB8YJLWnVo3aUfa89PudRPIdNVmn0AnLxbiOjyYj1qSBG1YciO8ud/WVvgXknN9l3Gd3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005)(921011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEVsWTdZbjdUaG1ZanpNNEUyZjdlTU9NUGNISjJzS3FjNVVITDdDa1FvemRy?=
 =?utf-8?B?T1ZBTjZDY2dQR0pGczhzU3FZMHM4bFpWd0VxQUVlUUV3MWdITTF4K0VYK1Fw?=
 =?utf-8?B?RWZKWC92RFNpMUZkM3ZOdS9hT2ZNaGdVMkgvUERTRkFzdWxML2plczVDdkNu?=
 =?utf-8?B?bHZRclVXN2JuWWVESFNhbC90VTVlTlZYeTlaZlVoMkVLT0x6S1hyNHFxTURK?=
 =?utf-8?B?cDI2NnljZG5JeVl0dGhOUmMxL3dpV3RaVGVLbFdCUVVhMERJRTJ6MVpXdUtz?=
 =?utf-8?B?S3JCWGxsOUZ2VGg4enh2TkdHVllKVzlXYUxNcUgzblQ4RkNWMU11ZjNnVldS?=
 =?utf-8?B?OHBMUXhuVklrV1hQcFFKcy91VGJ3V0IrZ2xnc01Ud1JTMUwwRWZZMW1Wejl6?=
 =?utf-8?B?NjhhWnl1VER4STd2aERPVzlYYWtiM3ozNkVzRzdjeVh6VlcyK1hoTS9Yb2lY?=
 =?utf-8?B?SGFvSmhGVitsQjRVdXJva2VYUDZjS2psMG9zbm4xbk9xc0JWOVBsbTRnMkNB?=
 =?utf-8?B?SzhHZzl5N0tMc0xnY01lNmRrcEc2b3ZxY3pmbHRVckRHY0p0bEx3ejN1eFZx?=
 =?utf-8?B?c2w3OTJXbzc5UzRncThiVGF2UzB3a0JWZmMzcWsvd01pekRVU2orQVFPYkJE?=
 =?utf-8?B?ZVZJQi9XRFdtcDQwbHdvcWxoM3lhM2RBREZzYmNuaC9CM0ZTcXlMMjNLY2dw?=
 =?utf-8?B?bDZTQ0UrZGFIZVZEY1BuOWFFQVVqY3kyb2xONzk0TVJUZkJReTMraCtmcUg0?=
 =?utf-8?B?eVFlOHcwSEt4bDliSERxclRaQjBibzJnQWMzSGZVMXh4bkhyR1JyZGVPSVhu?=
 =?utf-8?B?cjV1eHdmM2Z5VGo2bG5ldFZDT3RNekJaaEcrdEZYZkZ6a0h5RFFPYnpWMTl0?=
 =?utf-8?B?aEc2MHA4Y3BiQm1KOHB5NUxMQy9RbkdVRGJtcFVsOEplMkl6SGRyRjRXSGo5?=
 =?utf-8?B?ZjIxcnhZSGpoWUlGMndqNFF4T3QweVR1RktJTkF1QUNaV2lpK1k5YUNWMWsr?=
 =?utf-8?B?dThyKzNrUzl3bmt6cHJkRUw3NWNLc0RHbmlhU1VpMXZVRHFWY0h6ZUVHUUVL?=
 =?utf-8?B?aFBack1pT2FEZ2oyRzFLWFM3SGhmK1JQM1l6MFBKakhjemRoWnJrSjZjSEFJ?=
 =?utf-8?B?a1Yyb3dXbytpcmVPNWxZT2pqVWxMaGtBdWFFbEhWSW14cmpQckFnS05IN3I1?=
 =?utf-8?B?cjVkb3dFcU1CWHdOV0ZRYkdqK2hyVkVsNy8xRnZYNHJVaXZrekJiZ0VMOFU5?=
 =?utf-8?B?Rzh5WGxTZk1HRDYzdkJvNVZITkNCSDE5bjZBNFZCT09ZOHltOUhaV3dneGNi?=
 =?utf-8?B?a3FJUjVGeDRLZTB2dEUzaFRYb2dySWd3aGxHZ3lFU2Jhc2xaeHRVYVhjSG9Y?=
 =?utf-8?B?UnNmL2ZLb2xNMmNBOFcwMmlldVlhN3VGcDF2clNrcDRDdzBQQVY2dWluZUh3?=
 =?utf-8?B?TUZPVnBKbEl0RFp6eXNOdWRHTjVIWGpEWWkzRWxKUEVyZW9KL3k2TDBmZ0lI?=
 =?utf-8?B?MVo1dTJjcVJHSDZna2RrVFhPRzRXU2JIbkhWN1BQZWhJVDZmMXVKOGQ1NzJs?=
 =?utf-8?B?VmJwcjI1OXBsLzI5ZGc0bjd2NGVPc2loYlZXRXFKUXBnTitBeVVJVWYzQ1dI?=
 =?utf-8?B?Y3g2bWZJbTJJMHZ1MWdxUG1ZOWhVM1ZadU5ZTnpMeGVjSVhJWGdzOU9Md1Y4?=
 =?utf-8?B?aEhxSDBBSGMrM0tCZGtobDBHRkV1V0xlV1pDWVR3TDd5bDFYc3lIRlVYc2Rw?=
 =?utf-8?B?OE1NdXpMelhVejhXaVNablJrYnRBVTFvaDU4cVVTR2I2WmduOHRkZHE2RzB2?=
 =?utf-8?B?ZFlMYlJJcjNZOFlwU1FGeituYkZCc2ZHeW1OaDdyeG1QSXFJNGdza1lrRmFn?=
 =?utf-8?B?Y0lreTVxRkFKT01DSG1qZFg3TjhzdVBzWjl2WXFjQ280MTh2WmtHNVM2c0gw?=
 =?utf-8?B?ZkxVK0d1aEQ0RUh4Y054NjcwcTBQTXZSeFR4S0dyanpjbTdwNEVlTUlOdHBa?=
 =?utf-8?B?L1RISnh4T3NuYjFXa1BPaU5uM21oUE96NDNialNpNDl3VExYQi9PL284M0E4?=
 =?utf-8?B?eGJHVUovWXltSjFCWlA0M2VnRGpZTFp6Y0c3L3lLMldXQXU5KzcyRHhEaGtJ?=
 =?utf-8?Q?Ds1sYCAwXPyWz392ncqWPebD/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1ec340-bd88-44a2-699c-08dc3fb25012
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 20:57:06.1575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QemGvLDKP8dmvgQibB2AmL1+AJsFIH2SufWVz6gHY/0zCGL/05nPQTxCrwSKBHqdbbsXTJwJUERtdBdQcwGJEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4373
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

On 2024-03-06 15:03, Arthur Grillo wrote:
> As well noted by Pekka[1], the rounding of drm_fixp2int_round is wrong.
> To round a number, you need to add 0.5 to the number and floor that,
> drm_fixp2int_round() is adding 0.0000076. Make it add 0.5.
> 
> [1]: https://lore.kernel.org/all/20240301135327.22efe0dd.pekka.paalanen@collabora.com/
> 
> Suggested-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

I had a different jab at this [1], but your patch is cleaner.

https://patchwork.freedesktop.org/patch/579978/?series=123446&rev=4

Harry

> ---
>   include/drm/drm_fixed.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> index 0c9f917a4d4b..de3a79909ac9 100644
> --- a/include/drm/drm_fixed.h
> +++ b/include/drm/drm_fixed.h
> @@ -90,7 +90,7 @@ static inline int drm_fixp2int(s64 a)
>   
>   static inline int drm_fixp2int_round(s64 a)
>   {
> -	return drm_fixp2int(a + (1 << (DRM_FIXED_POINT_HALF - 1)));
> +	return drm_fixp2int(a + DRM_FIXED_ONE / 2);
>   }
>   
>   static inline int drm_fixp2int_ceil(s64 a)
> 
