Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 521D4AE9D55
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 14:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E547010E2B8;
	Thu, 26 Jun 2025 12:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VnT/2oKj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98D010E2AF;
 Thu, 26 Jun 2025 12:18:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2kuRz19CUyXRON9CvCOEP4qJUdu8J4x28MbuC7iTFlDmS/OcFaRl2Wai+NXmvyBgcRrHhwj35tWPirC5xeX1i49LdLSDUBzJ42xAz+nmcJ5gkBQ+MWUpnLGGBSgPnSpRc4AdLB/nDx3MSDbFr1wFzM9P4eOlz5gx+fZ6UiVJYVB7syEMW6h3pciibR7NfXO96e6U4vmxpJNqwL8jUZorUduIIdL4TYVZZLgugVOkIYIlrE7pH0qtr9Vg/nGw+ASPwBYrwXLuoB6vg3eJF4ShvfNtVfnvRpFzXzHKixOctVjdVeNJnrHu3L2UjG6eCIwjsfsYk1PUhoroy+z24r0xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwVasi2v2rrrQ2rmF0XXO2xHihgWQxgCXuDDl6hBB3U=;
 b=e7CAUuqopRPuY09aX55XFrBJa8zghnshciwutmbPido/hcUZ9nvDic2fFDmo7W0yV7doQKNxGXxlQIO11QelxbE1Or6EmeF3zcFAjdvQA0iOMItjtGAXqfQ4cr2gp0Xpc9RNzqs6sSsrz1/m5ZQGFW/+3KyfQ2i9+Vj69tjTX6ehEAjiigEvIILB9jexjIvUMjIL26J5S1b67Yn82LwCdfKil03ThTE1IGssO/8l4x0wXPzOxWNTMbkfzZ32zCg8FhxkXV94uvRzKxAqAfuubbdf91eEMTQzlenkj7fQy1ZP8fUZnN++1FRPFO/IgWFwVZdSM/MGjI3rwOyzIo4RMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwVasi2v2rrrQ2rmF0XXO2xHihgWQxgCXuDDl6hBB3U=;
 b=VnT/2oKjOdhRoSCYlWYauvULB79bE6nUH9pGA5gq2L+lUq+1ZN+bThrXB0Wd8zL44sDQy3Q7jJkdUvUSn78ZTwnN7MvLL+c5R7hkzoE/+1seThrbHFvLmtw3jyKSftNbUeea4O1EojEE/qYfh7BHn3D9X6Il5csyKKGMyZAOpIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7579.namprd12.prod.outlook.com (2603:10b6:208:43c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 26 Jun
 2025 12:18:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 12:18:48 +0000
Message-ID: <cbad6610-dc6c-47e2-a982-6a991d680627@amd.com>
Date: Thu, 26 Jun 2025 14:18:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] drm/amdgpu: add debugfs support for VM pagetable
 per client
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250624113454.2322935-1-sunil.khatri@amd.com>
 <20250624113454.2322935-4-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250624113454.2322935-4-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0239.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c5a174e-8b66-4a4e-78c0-08ddb4ab9a82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFFaZzM5VXVDNEhORHFBVkd1S0tkSDhEay9JTTlLZFZjaWF3ZXVSeHZ3ODAv?=
 =?utf-8?B?Qm4weldwUUF3K00yS1UvRFNJOFhjZm1PbWJSanJzclJEV2JXV2QzbzRLMkht?=
 =?utf-8?B?ck9QaVI1Ymk2dnB2RFNXR0VEZHB2aEhER3NLQmo4RXdUNEhqeUdtWnl5TEdG?=
 =?utf-8?B?azBJS09iYVNEV0ptTUNPa3k1L2k1eTh5YXN0OHJjbnRzZGhCeUJPc2JwaWUz?=
 =?utf-8?B?c0QrMUVtS21DNFltNDhXTm45aGhWNm1qVktQcGpLc3hpRlBHTGZVelI5ZnhG?=
 =?utf-8?B?YWNaR0tWNEVKNDVHTG5RVGNxc2ZITlJ1TWdaSU5Sd1lTUnJIa2NmS2oyeFFF?=
 =?utf-8?B?QlpJOFhEQTV6SndZZEQ1N3ZvSnJFZ2cwbW9TK1h6WElIMStLS0t5RGd2cUtz?=
 =?utf-8?B?b05PY244L3hjaTI3VjV2SHVLT1VMN0FuY0haM1lHam5jd1lzTndjWGRUTXN3?=
 =?utf-8?B?YXNnaUdIVnNEVlZCU0xTOVg4ZmlBblJVUndjVW5LVU82MFBHeTEvdWtNelB0?=
 =?utf-8?B?dzZSYjQwS0JzaVhKSlhReEtiK045UTI5clZ1T213cFp5SncvK1NRd2xnOUpN?=
 =?utf-8?B?MHBHa3B2UkFzTDFzR1dDTzZHTDBhOTJ3ZHFoYmFiSDBiRkJxVWJYOGFGb2Z6?=
 =?utf-8?B?M3lDOE8wZ3FxbFV3ZDg5ZlNWY2RMcndCNjFLemlHVW9WMERqNkhVV05PTFdw?=
 =?utf-8?B?dnloOWxWY3JHTlZCUC9NTTE0ZmwzTXJacDJROGpuL2hJODJJT29yV2tyUjJj?=
 =?utf-8?B?b1hZVVp3TUlPUzRITHpyZnYwNFpGN0tzUlYyVnhETXVvYjZML1FmbUtubXBt?=
 =?utf-8?B?YnVUeVhoM2Y3elJOMUVsdkU2bFViOEVGblRiL0IvdXp5NUlaZENDU29iV2NL?=
 =?utf-8?B?ODRwZEQ1ak02Sjl1Uk9QaStpMEhOVURjSWJJL21mUGRaY3dMU3NYb0RkYmRi?=
 =?utf-8?B?N2F5VGd5RUEzdHZSbldsWmN5KzB3dzhwaElVWEN6dEJEWG9QazdJYTh3aExp?=
 =?utf-8?B?Yy9NempZS0E1SEVHV3Z2L3J6WkxaRlBXcHl1MXVRRWNVaFEwcmpsTDcydWMw?=
 =?utf-8?B?dlcvVmZDUTd5aEVDUHpCWlVqNHJxT3lCdmFyQXp3dmVJdFJ4TFpkOTdGVGhF?=
 =?utf-8?B?dk9nb1pVWkpNN3JBZDRXempzek50Zzd6eGNpell3dHVRUmtrU3VqaVB5RGp2?=
 =?utf-8?B?VE1iOThNTll5OVVmUkFCSEwyUTgxVmpLcTlSYU1RdDEzbEZqUkQycVpKQVRS?=
 =?utf-8?B?RmpBOFltUEsycFU3eC80NDNzZHhJSmtBSHprUGlicHF1d1BkYmc0b0JBYzNS?=
 =?utf-8?B?Wm45dHJNV0lzRU1oa0hQSmRBNFl0WTFXcWMxdVl4VFJJbFQ0L01CT0FjYWh1?=
 =?utf-8?B?MnVnWGtDdVB4dEdwMTFkMER6amJtUnNPZ0tYQmZycnBkQXo3c2puaEZ1UXI5?=
 =?utf-8?B?ZnFRak9rYXJrSVFrdlkxK0ZIRE5hMzRzb3REblJ1T2hGZDQ5WldiQ05uMDFQ?=
 =?utf-8?B?bFVva3IrcEptbDZWenBkN2VGVTVFYW01b2pPbXMxMGdZUDVGTHJqRXI0UHc3?=
 =?utf-8?B?akV5WUtYck1JSnExK2ZvQnQvMjh3QjVheXY0RDlDT2lBeTFjc0VvTXVHZGJm?=
 =?utf-8?B?VlFSM0YySEVvU2xFR2JnbGF6bmJLNTlhMGhBSG85Ym56QkdXb21sWktxZnZs?=
 =?utf-8?B?YnhsbUNtZFhwZVlmMGRTTFo0VGhqa1dLTTZhRUFuVVk0Q1lSU2NBS2t2bENL?=
 =?utf-8?B?RnhCYXBEVnE0WDhIcEU0VHlFRVRWeW9sSjJ6V1FNOWZZejZrS1lVUTdVWG9C?=
 =?utf-8?B?RjNTdm1SazBkaTY3Y1czODFjbjlHODBnU1JRVGtrUSsvMVcwUW5VU1Rja0RP?=
 =?utf-8?B?TVJXdHV5VDZvNWxvRmxSdUZKYlNJenYxcEZSRzZYSkY2bFlndC9pbHQwYUdl?=
 =?utf-8?Q?mhemYIjVy40=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHBaMFl1RU51dno5MFhabE9TNnR5aS9Ud0F1UjdVRHY2QXAzUWdmNWJoR1dK?=
 =?utf-8?B?a2NZc1MrbThrN2hmaDBlT0hZSFJsOUN1Q0R5QTVBVS9ISk5hSDRud3lkSStB?=
 =?utf-8?B?enp5MkVBR3p2amt6TVoxZ1lkTnU1aE9XUzhhVWtMc1pDUEplK0hHQ290OEda?=
 =?utf-8?B?K0hNSWxCZmV0R1FpeDZ4OUtqb29jbWpmU0hBTkE1MmhaWVhSTDk5M2JRMnBm?=
 =?utf-8?B?UnlJdzgwTE54Z3BMK2JDempYRWlUUkpTc2pVLzR6MC9nOGZwd09tVWhNT0sw?=
 =?utf-8?B?L2swLzRlc2xJR1BaNjROVzBnS2RiUmJkZUFpV3BaS3BhWlYwa0hROEtwRCt1?=
 =?utf-8?B?OEZySENsRWpqR1M2NnMrcU5PVWZTUytHcUdQRUZHeHlqeTRiZ21kR3lJVFNj?=
 =?utf-8?B?VVVGcFVwT2JsU1ZDQm5GSGF5NUJBcHdBd3I3clM3YVlXb3NNWWNpSmNSemV2?=
 =?utf-8?B?M00wZ0pqODRMdjFHcHdBckVZanJzQzBCd0FVYWZFU0I1T01vQjFDYmF4b1F2?=
 =?utf-8?B?VXErdlNNVUhSVGN2SE5hR2ZtdnQrNS9LZzA1UmVFR3p1NTBCQkRJUjNVVnFi?=
 =?utf-8?B?Tm5XSFlRNjlVWk5rNVlaRlhYaXV3d3BsMmZKMFZERjViV0NqNERmcUVWU2Zr?=
 =?utf-8?B?aGJsN0lTcmtqV2hWOHMyc01vRjdLeEI3bUN5ZnQ2WWlqU0YvTGVRcVRQa1Zh?=
 =?utf-8?B?V3RvU00zalVRc3pqYkltM3FoaTljeG16aDIwWjgrVWd0bjRNZ1lFZkVyMGVn?=
 =?utf-8?B?NStJUzkwbGtNU2Fua3hvYU1BTkZnelFsaEV0UmZ6bm0wMEpKZEZldTRCLytT?=
 =?utf-8?B?NUhpTVJKNUxWSWhrWHk5T2k3MUdYZ2FDcTlVZlpLVXBDNmZzZlNKVkNYcWRE?=
 =?utf-8?B?Tjd4ZjJyMFlnV0cybHNDbXR1YTdLSUdtZENaVi9FZEpERU1UV21BbU41Uitq?=
 =?utf-8?B?SzE1aTM3cEw2Rk9lZ0ZhZ094RzRsZG1yTDFhMXRFUkg5TzBiTUljV0NzbEJ6?=
 =?utf-8?B?dFROMFdlaU5PWk5LS3piVWNuMDVJMkNaRVVDenRoSVRkN0FDVEFmSnNXbm1K?=
 =?utf-8?B?NUJvQThUbllnT3ZBNkNMOUlWTlhhTlk3NTR6NUEydDF6WWRpQ1RJK1V0RTNi?=
 =?utf-8?B?VnAvckJ4NEZ0enQ4NVF0cFUzZ29Ka0JMdmFyRUd4enJIMFIwYjdsNHJWL09r?=
 =?utf-8?B?ajBPYk5aNVkrd1k1QkR5Y1NVRnZ5cXNCVUI4QmE4dkxtSXp3ZWhOa2lTU2FO?=
 =?utf-8?B?eWlkR0QxZFFyZDc1RVhmSmZkRXFTaVhnRWZhK1FDZEhwMm84NGtZMTI5Y0RQ?=
 =?utf-8?B?dWtyWFBPcWpnMFBwMldNMFJKZkRZTWVvSDZ3M3JZaUhGU205Si9SWUNJMzN0?=
 =?utf-8?B?anFtVXVHWG9nalIwS2JyK1FXSzBMUHdrR2pHMGFHYnd3MG9WV2Zuc2N2YnF5?=
 =?utf-8?B?ZnlCTEhvU1RacFF3MXgzekc0LzFDVXJWQy9ENzg0UlpDQldGTG44djdaa2I3?=
 =?utf-8?B?bVViVzJkVFYwQWRQUDl1R0NpY1VzR2pwSVg0bVVNaW14Z1B2a3BoamhVV0FJ?=
 =?utf-8?B?WjhiejdWcHdxM0dIWlNYZ2tpTGsxRUgxUDhRTkN5SFBJNnJhVlVmS0Zoby9i?=
 =?utf-8?B?NHVab2diZHlyZHhkYnlJakJHVXhhSHlOc3RNZ3R5N0pFRUNlTXJPSFNrMEQv?=
 =?utf-8?B?TUlTaWxEOXNxNnZ1VUp3UEI0eEtNTUpNZXdIUSt5b056TFVIK3dpSDJSN1NN?=
 =?utf-8?B?K1QwdlJ2UWJISm1FREZWZGs3VTBvdVVZVmxzQklEeGlISzZWSkJpMGVNaFEx?=
 =?utf-8?B?VkVnUEtvMmVVQkhQQWF1b1B6SXdpZkJBWnlHTUpSUzF0ZU9jZU9TeUF6OWxn?=
 =?utf-8?B?YlRSNHdFVW01elZ4T2k1MFJ0dmF2V2xZL2RLRjU4NmhoVDJCenNqTDlpZEZ2?=
 =?utf-8?B?blVCT2NJRE5ucXBhMEhMSU11RVFoS1RNSW5vMVhVUjk1cnJiV2F2ZGtGNmNu?=
 =?utf-8?B?SUdNTXFFWEZkNUVROU5ucHBOSVBLc3lwN3FjWHFjbzh2OG8zL2x6bVNOZW5X?=
 =?utf-8?B?bVNPR2NmdzlFN24vL1EzSXdaVkpLaHlIVjhWajFtb1JDMnZrR2ZZOG5JVW8r?=
 =?utf-8?Q?856w+Xr4KTyEDA9aP6l2tF7Dr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5a174e-8b66-4a4e-78c0-08ddb4ab9a82
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 12:18:48.3774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VPbVM8KVmbDwvLFKKoD/wDJacbtfkMnfeV/6EN+tTRp2bByOV3SpLRdSilsGSLG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7579
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

On 24.06.25 13:34, Sunil Khatri wrote:
> Each drm node is associated with a unique client-id.
> Create a directory for each drm-file in the dri root
> directory. This directory is unique to hold information
> related to a client id which is unique in the system
> irrespective of how many drm devices are on the system.
> 
> Adding root page table base address of the VM under
> the client-id node along with the process information
> in debugfs.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 58 ++++++++++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  4 +-
>  3 files changed, 61 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index d2ce7d86dbc8..aa912168fd68 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1395,7 +1395,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>  	if (r)
>  		goto error_pasid;
>  
> -	r = amdgpu_vm_init(adev, &fpriv->vm, fpriv->xcp_id);
> +	r = amdgpu_vm_init(adev, &fpriv->vm, fpriv->xcp_id, file_priv);
>  	if (r)
>  		goto error_pasid;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 3911c78f8282..9e3dd187b597 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2520,12 +2520,67 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>  	get_task_comm(vm->task_info->process_name, current->group_leader);
>  }
>  
> +#if defined(CONFIG_DEBUG_FS)
> +static int amdgpu_pt_info_read(struct seq_file *m, void *unused)
> +{
> +	struct drm_file *file;
> +	struct amdgpu_fpriv *fpriv;
> +	struct pid *pid;
> +	struct task_struct *task;
> +	struct amdgpu_bo *root_bo;
> +	int r;
> +

> +	file = (struct drm_file *)m->private;
> +	if (!file || !file->driver_priv)
> +		return -EINVAL;

This here is racy. It can be that the debugfs file is opened and read in just the exact moment the client it belongs to is closed.

You need to do something like this here:

if (!file_ref_get(&file->file->f_ref))
	return -EINVAL;

And then an fput(file->file) at the end of the function.

It would probably best to have a helper for that in drm_debugfs.c since that needs to be done for all per client debugfs files.

> +
> +	fpriv = file->driver_priv;
> +	if (!fpriv || !fpriv->vm.root.bo)
> +		return -ENODEV;
> +
> +	root_bo = amdgpu_bo_ref(fpriv->vm.root.bo);
> +	r = amdgpu_bo_reserve(root_bo, true);
> +	if (r) {
> +		amdgpu_bo_unref(&root_bo);
> +		return 0;
> +	}
> +
> +	rcu_read_lock();
> +	pid = rcu_dereference(file->pid);
> +	task = pid_task(pid, PIDTYPE_TGID);
> +
> +	seq_printf(m, "pid: %d\n", task ? task->pid : 0);
> +	seq_printf(m, "comm: %s\n", task ? task->comm : "Unset");

Thinking more about it, the pid and task name should probably be a different driver independent file, e.g. implemented in drm_debugfs.c

Because that is something all drivers should be able to provide.

We could potentially print the same line of information we print in the clints debugfs file.

Regards,
Christian.

> +	seq_printf(m, "pt_base: 0x%llx\n", amdgpu_bo_gpu_offset(fpriv->vm.root.bo));
> +
> +	rcu_read_unlock();
> +	amdgpu_bo_unreserve(root_bo);
> +	amdgpu_bo_unref(&root_bo);
> +
> +	return 0;
> +}
> +
> +static int amdgpu_pt_info_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, amdgpu_pt_info_read, inode->i_private);
> +}
> +
> +static const struct file_operations amdgpu_pt_info_fops = {
> +	.owner = THIS_MODULE,
> +	.open = amdgpu_pt_info_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +#endif
> +
>  /**
>   * amdgpu_vm_init - initialize a vm instance
>   *
>   * @adev: amdgpu_device pointer
>   * @vm: requested vm
>   * @xcp_id: GPU partition selection id
> + * @file: drm_file
>   *
>   * Init @vm fields.
>   *
> @@ -2533,7 +2588,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>   * 0 for success, error for failure.
>   */
>  int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
> -		   int32_t xcp_id)
> +		   int32_t xcp_id, struct drm_file *file)
>  {
>  	struct amdgpu_bo *root_bo;
>  	struct amdgpu_bo_vm *root;
> @@ -2609,6 +2664,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  	if (r)
>  		DRM_DEBUG("Failed to create task info for VM\n");
>  
> +	debugfs_create_file("pt_info", 0444, file->debugfs_client, file, &amdgpu_pt_info_fops);
>  	amdgpu_bo_unreserve(vm->root.bo);
>  	amdgpu_bo_unref(&root_bo);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index f3ad687125ad..555afaf867c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -487,7 +487,9 @@ int amdgpu_vm_set_pasid(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  			u32 pasid);
>  
>  long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout);
> -int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp_id);
> +int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp_id,
> +		   struct drm_file *file);
> +
>  int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm);
>  void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
>  int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec,

