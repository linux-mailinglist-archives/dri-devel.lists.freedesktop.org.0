Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3054FABD5A7
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 12:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF8110E497;
	Tue, 20 May 2025 10:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0kt86n6b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C32610E1DF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 10:57:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VX3ljI7aKguWYuWakSrW/6sp1AR5gYS7u3st5twltapIa2FnmNL93RhYL2ED4OindMA6rlRsB1zFEmBLgjXiPJRscamK7Pi2C085ttUOhC1fvuw8yNw71ra9e5/2ZF57HEwweN4NC3lsQC9+x3BPAPsywyRBSi9j5KjmfTb5ygxmmhq/koXWrcM1sf5paPVzDFKdIbba2lNvm/GNb36usZVNnPfSbYSnEFwRdsiNBad+I05K+mJ39Xh9b41rf9IOhMqdquDMyvKxF3vOl+uJJjpJ2wYy833qYxRpCZb8gEOmC9h7G92U/uwWLKgz/qFANgw7+WHei+Tq9ehELbT8bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0EP2Sjc0Capp9VM9ML/hiOrgOiOlbBxWN20e+ROmDA=;
 b=L7ccgnOEaEB5K46xQCgLeKF8QIkbWHcbmdcLSHD98s/JMS2Gvde7GjoBbJXohBHplGGiaOAHaSJH4YAt11w9r+g21ex01yQZqnPRX05Ww6HmqU0fZ+zbGB5JPA+q/3oIWVEc+g+L7facfxS7GIDGe+0nC4BWgtDoKmn3BPU5d8jjJPF2niHf3Y2vn+XbRG1hFMUV1+7VjNc/zXfy23SzvmJhRtgYuEVttPqHoU/hJKvLRBeoNMSNPTiuisoF8lxzJCzVNoSupcTh/fTOxnnqaBKu0KHidITo94WMvxmQTqs2XZjwysC+MlT2EcskJBFQwUOySFsK7jGvFXbUtWLMng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0EP2Sjc0Capp9VM9ML/hiOrgOiOlbBxWN20e+ROmDA=;
 b=0kt86n6blXMtjFXEjrmRsRQhKrOL+htY9G9ku/k0yQCv+2p7rQ2nSofPzxMpSHdIWWzB2Bt+IneDiGwkLDRvRcq2Vq6U6Yxej4yRfXQj+P3wp6w5IPVwdP6nav9Y/CxVJX7a8ISfHz8xtqjh9o4Rp6sLJUPT5CqFq/VeeT7Du3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by SA1PR12MB8919.namprd12.prod.outlook.com (2603:10b6:806:38e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 10:57:51 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 10:57:51 +0000
Message-ID: <3909686a-be14-4b0b-8336-0674667d5159@amd.com>
Date: Tue, 20 May 2025 20:57:42 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
To: Xu Yilun <yilun.xu@linux.intel.com>, Zhi Wang <zhiw@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
 <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050> <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com>
 <20250513130315.0158a626.zhiw@nvidia.com>
 <aCRmoDupzK9zTqFL@yilunxu-OptiPlex-7050>
 <20250514230502.6b64da7f.zhiw@nvidia.com>
 <aCYsNSFQJZzHVOFI@yilunxu-OptiPlex-7050>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <aCYsNSFQJZzHVOFI@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY5P282CA0058.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:20a::17) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|SA1PR12MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: a959daff-e087-41f6-1410-08dd978d2a2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTN2endPTnBtRWVSMWt0MmM1NTJ3NFVlVmZlUGV3Y2lEYWlnSm9UaFRrT09U?=
 =?utf-8?B?M05DZDEyWnY3enlxUDIyc1RJaW03UytWYm44RWxPekRUaTNIMVhQcWVTT0dM?=
 =?utf-8?B?akR4aVROK3hUUHcwZng3WFFENW93MFVEaWxrQUFjblBDbHA2aW9OM25ONkxL?=
 =?utf-8?B?OGliZms5MUFFUGJ1bnJqT3ZhS1lqaUp3NUlRQ0g0WFZkM1ZDamE1OGtCNlV2?=
 =?utf-8?B?SVg5bTNRM3lRSWprQmEzbE0zTWZhWFcrVGp0N28wbCtTaGU4eVpyMzhCUVVp?=
 =?utf-8?B?OHhsRWRhUXo4aGtNM2NuQXlqbytqb1RSeDU0OVBhcHY4dkZhZ0llYU5wZDVJ?=
 =?utf-8?B?Uks3czZHWE5YcDh3R1U4MGpxR05UMEVlTkdVbmxZcjE4V2toSnVmWXEzS1lh?=
 =?utf-8?B?Zm04VlQ1TUJYTVgxQmVqeXpqSUFjYzNtRjVVWWtkdkFLdHRydjhWVUkxaXNn?=
 =?utf-8?B?WWM4SHV3cXZFV2lFYnhqRUpvamhZbnE2dEZoZnNLdzF1RVVkRzFIeCtmU0Zv?=
 =?utf-8?B?YjNtVjY2VWE0SHZOL2V2bXdDbm5kOW1PUFFzdjRWZ3EwMlJlRFJ4Z3oxL0pC?=
 =?utf-8?B?d05MbHpZaHRoOGVDNnBYMHRXRjBYSDRPY01laDV6Zkhmb2VzenloamVXcWxU?=
 =?utf-8?B?bVNEakQ1RmhTN1hUS2JIaWdPMHZ4VWRNS2w5STFlTFdjS203UzkreEdDUHFK?=
 =?utf-8?B?cDdyR3NPTk1QRUlFQUVDRDNGWHRLcTNXUGl4b2FxTDhUMzBjOGhEeGN6Y042?=
 =?utf-8?B?WWNHWGxTN09TL2pMaW5vbVZwSkJpU25iNElGTDFLa0ZyV2ZWL1VTQXMvV3By?=
 =?utf-8?B?RGwxMVI0dWN0YjA2dG9tWEZPam9LM3lnUms2bnhYNlhDeUE1NGplNHF1NStG?=
 =?utf-8?B?bVRWVGRqVzFlUWkrM1hiRmhkNlg3MnIxRVZSMEE1eUZqRzMzWmkxelcvMFRo?=
 =?utf-8?B?aHVqYy9tTmJNL2J1em5ZUHlsTndjdVdDSVp6MUc0Sk1DTFErSU0rK2pGWUNu?=
 =?utf-8?B?aXlCdVRpazFvZEZqekZLanBOSlRrSjFoaGkybTBVZWZoTUhueEpwaW85R3NF?=
 =?utf-8?B?b0lRVE9iRjVxclduNWdxQnUzdk02MTVUYVVHbVRPMmtRSlNRa2dEcDJLMnJr?=
 =?utf-8?B?MHQ0WUlkaGtUUzA1SWtYTkQzdXlqMllHYnhmd1UzeVNJZFFCcnF2ZXVlcTNh?=
 =?utf-8?B?eXdPL1hyQzlPSE5NYU8xWGJhSDMyNnh0QVRjYTg1eFZ5dEhmcW1lM3lmZXYz?=
 =?utf-8?B?YWRiTThXTm1MOUNieUxURkYya25VSXRDRTB4TWJwczlMSWhINWtIWC8xVzFx?=
 =?utf-8?B?by9ud1FldUZOcWk3cm9kM0dHUjdGdE8yUi9kTTl5VU1FNWxlM2Q4Q2hBQWV4?=
 =?utf-8?B?Zkp2eDYySnJKVktITHZtWGJSUkh2Tm5FWjFXZlMzZmVsS3lTRVhjRjNUZmRs?=
 =?utf-8?B?VGxFbDRnb2R0NTNhMU1Na2dZdFYybzMvMzBKVy95TmN0UUJ2RGltd21VV1c5?=
 =?utf-8?B?eFdTN0R2NTUxdm1oU0F4UG5lNVI0MkZBUFNlbHp3VFpnVWtiTklGUjR4ckFl?=
 =?utf-8?B?bUEzV3dPOG0rSjM3UHlHRXE2Zm5pZytlVG9Ga0p0eHE3OW1iZUZQaXpxbkU5?=
 =?utf-8?B?Vi94Z3Z6cVUySEZjeDFsa01McERUb2VkTHlZTEw5RGtMR2VpREx4bHVkN2U4?=
 =?utf-8?B?cUlhQ0ZTdGVVeVV0TzJUUWVHN1pFalZodVA2QmdzUkM4dUdhQ3ZrTGx2VHlR?=
 =?utf-8?B?VG1DalJQVGZPcldtMlRoa2RoVWUweFdJRHAwSGNyc0o2V01tZWNXcS94YXRQ?=
 =?utf-8?B?NCtLaHF4TGY5RzBKWnBYby9hVkxTRnlwcEwrOWZXaGNFVjYyeXk0SnRFK3li?=
 =?utf-8?B?SXQ4UDVIU21YV2F3ZGlXUnV2OENvQ2ZDYVViWGdLZ01YOFEwMFRGSlNwdVhT?=
 =?utf-8?Q?/5EJckV5oTM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2J2S2hVa0RUK2ZqOG0vT3NCci9UQXNPb3JlVUx3VVk4U1EyazVvYzQzSzBE?=
 =?utf-8?B?WjFLbkpDTUcwWHNPMkFrdG9HNEN5eFlzQ0ZNdThSa3hkNlVyeXRBNzY5TkVu?=
 =?utf-8?B?VFZsSUlWTEV6M2FsdlR5bCtiSTRZQzlhdTV0bWFRNkVvOVpwcXk1bkNRa3RQ?=
 =?utf-8?B?T3BRRXkrK1JGYmloVFA5ZzZXdkFHTzdCWGNIUFlPRFhiQUpOdjBTT1VEQlVN?=
 =?utf-8?B?LzlEdUs3NXYwbmhUV1JDeHZjbHVZNlgwRUpHY2JwUUJoQmdjUUFjeFZ3Znpq?=
 =?utf-8?B?NFpYM0c0R0lEVHNjaEp3U3l3azdkSlVaMldZTU1TN2ZpV0JJQUlnbzlmSWJP?=
 =?utf-8?B?UUUveDY2RVJ2c255Z0pUaG0zaVQ0eno2VytqeUZPK0tvWFVDbm96cWlZZVI1?=
 =?utf-8?B?dkNnLzZIMEt6MU9yaFo4MnZFTjBXMG9HbHFLNVVMeW10OERaWlkwWUI5dGVy?=
 =?utf-8?B?UENLUTJWUk9oSUJDbnR2cS9FMkMzWGFpanU0aW1aTGx6Ym1PZ0F1bmdxNUF0?=
 =?utf-8?B?QVhFdXpqclJId0pPU0pDY1BPSU9yUVc2NXdkSkQzUjdOaVYvS1puYlp2QnRk?=
 =?utf-8?B?S044b0ljU1dQeTJybjVxeEpKaFFhcWtKM0FaRXFpa2dYTXIxd0FQOThwdmlQ?=
 =?utf-8?B?Q2N4c0JOcEozUEt4K3VjVm1HeTdTd1JtZTVkd2dnS0V4cmhGaVF2UzBUc2tI?=
 =?utf-8?B?c3hIOElaSDZkU2N5N3JHYm9CRkFJMkdYeGRZdHR5RmNPNG1lelZUZUZsdXNB?=
 =?utf-8?B?QXdlZE5pVkhLZWhxclZZc1FxbEliT1VCeWtVZVBWRVZHMkk4N01hTUxkbGVH?=
 =?utf-8?B?Z0hSbVd4SnN5S2hwMWN6SFZVTk50VHhqZG9SYW9seERzVjlEN0YvWU5PYUVa?=
 =?utf-8?B?eEoyRWNBblRWYTE1eE9weUY1MHJpZCtYelVkNlNyTTY1Q29hQ1IybWpoa2hw?=
 =?utf-8?B?ZTJYMkdENzJBMGE2NFVtT0ZMT0tocGhyYXpnTjQ0T0xRYXVnclE3RzVDU2h0?=
 =?utf-8?B?UW9wUWkyVUhtVUFqNGlmdjIxa0VuVHYyMVQxSDdINWkxSFkzRGplMmw2cEo0?=
 =?utf-8?B?S0JxR1RoY0ZqU3oxamI3bm5lR2ZRKys3bnRUWVFDTmt1dVhrbTBTK1JaUGxN?=
 =?utf-8?B?d2lDZ1VFUU9SYmlMYmgxUitTbUNLWlg1MTgxbm5jeUw5aDA1Tkc3M2dET3pB?=
 =?utf-8?B?clJ2c3pDQXAzc2VjVnVJeG5NSGtPbHRoSy84TVIxR2c0QmNiOFdmQ0xQcFpY?=
 =?utf-8?B?WExBbnRaTTNLdUoxanhMMFU4SDBnTm85Snh4ZG9LUDVZNmE2ZjR4SlhjL1FG?=
 =?utf-8?B?OFNTTHh2NEpxczQ0bUp5SGpvRUV5M1lRbUFqak5NK241NCtWZGt4Z3pxVERw?=
 =?utf-8?B?ZmxUMkF3SWViQ1EzTXUxVG4wOFcxMi9tSEwyeUkwckErM3Zubk13M2ZDMW1q?=
 =?utf-8?B?SXloWTErZys3SHNQc2VkYXdnbk5JbHpVKzZ0MFFiei9ZdzBiMXdZdDFzaFRO?=
 =?utf-8?B?ai83ak9sVFh2M0txbDlWUlE3a0FOYjFMNXhHNXdBMFhwcE5YRUtmeVpVTDNG?=
 =?utf-8?B?VmFZWUpGKzJpN0pYcWJJeWk3dlVrRjVHT1JhSnJaN2NrMURvdW1kWjR1c0NJ?=
 =?utf-8?B?OS9iMkFwdlEwRXlvenFrQTFBRXphREtldnNHUFUxaDlHUk1MNXNQbENuSTdP?=
 =?utf-8?B?ZkhKTzhoSFJvbHBldVN2ODBkSyt0cVByZ0pHUlNnM1JxRlFmUGczdWZ2czVH?=
 =?utf-8?B?QkJoTmFMWnlVN0xhT0VmcStGN280M1FlZkhHdENTRTc4YTNiRW5FazhreVI1?=
 =?utf-8?B?dFNvSzZEREtMTys4bVZsQUF4aTRzUlZqNWFzbzRIdGl6bStJRHVmS1ZwcVZT?=
 =?utf-8?B?dTNPUHJGM1Vsa3dsYUR3WCt4MUpRbXFObzV5a2xQRlI2YVNTMGNhRWYzVnc3?=
 =?utf-8?B?MkdDZWxKam1rQ1MrSTh4aDRrSDh5a3V3ODNlQ0R3cHpmejRXZndqNWE3N3pr?=
 =?utf-8?B?UVpsd2hmc3liSGY5SXJkMzJWQVRXaldsdkFKZVBkZXJNR1lqQVhmTmVxZ2ds?=
 =?utf-8?B?LzlOZHZVTndLbmZyOE9iTVVvWmFSc2FZUllmSFBaQXNoQ3QrQVkxdTR1enda?=
 =?utf-8?Q?BMYbw1IzH6AuUErPv19GTre6t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a959daff-e087-41f6-1410-08dd978d2a2f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 10:57:51.2757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5+JfwsgPSxQmeuQLop5eIww856/3V6aB0z5CzwpN4JRU+WvaxJJ4sD14rZIxQkJquPvaYRk4ps0k8wTLuS1jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8919
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



On 16/5/25 04:02, Xu Yilun wrote:
>> IMHO, I think it might be helpful that you can picture out what are the
>> minimum requirements (function/life cycle) to the current IOMMUFD TSM
>> bind architecture:
>>
>> 1.host tsm_bind (preparation) is in IOMMUFD, triggered by QEMU handling
>> the TVM-HOST call.
>> 2. TDI acceptance is handled in guest_request() to accept the TDI after
>> the validation in the TVM)
> 
> I'll try my best to brainstorm and make a flow in ASCII.
> 
> (*) means new feature
> 
> 
>        Guest          Guest TSM       QEMU           VFIO            IOMMUFD       host TSM          KVM
>        -----          ---------       ----           ----            -------       --------          ---
> 1.                                                                               *Connect(IDE)
> 2.                                 Init vdev
> 3.                                *create dmabuf
> 4.                                               *export dmabuf
> 5.                                create memslot
> 6.                                                                                              *import dmabuf
> 7.                                setup shared DMA
> 8.                                                                 create hwpt
> 9.                                               attach hwpt
> 10.                                  kvm run
> 11.enum shared dev
> 12.*Connect(Bind)
> 13.                  *GHCI Bind
> 14.                                  *Bind
> 15                                                                 CC viommu alloc
> 16.                                                                vdevice allloc
> 16.                                              *attach vdev


This "attach vdev" - we are still deciding if it goes to IOMMUFD or VFIO, right?


> 17.                                                               *setup CC viommu
> 18                                                                 *tsm_bind
> 19.                                                                                  *bind
> 20.*Attest
> 21.               *GHCI get CC info
> 22.                                 *get CC info
> 23.                                                                *vdev guest req
> 24.                                                                                 *guest req
> 25.*Accept
> 26.             *GHCI accept MMIO/DMA
> 27.                                *accept MMIO/DMA
> 28.                                                               *vdev guest req
> 29.                                                                                 *guest req
> 30.                                                                                              *map private MMIO
> 31.             *GHCI start tdi
> 32.                                *start tdi
> 33.                                                               *vdev guest req
> 34.                                                                                 *guest req


I am not sure I follow the layout here. "start tdi" and "accept MMIO/DMA" are under "QEMU" but QEMU cannot do anything by itself and has to call VFIO or some other driver...

> 35.Workload...
> 36.*disconnect(Unbind)

Is this a case of PCI hotunplug? Or just killing QEMU/shutting down the VM? Or stopping trusting the device and switching it to untrusted mode, to work with SWIOTLB or DiscardManager?

> 37.              *GHCI unbind
> 38.                                *Unbind
> 39.                                            *detach vdev
> 40.                                                               *tsm_unbind
> 41.                                                                                 *TDX stop tdi
> 42.                                                                                 *TDX disable mmio cb
> 43.                                            *cb dmabuf revoke


... like VFIO and hostTSM - "TDX stop tdi" and "cb dmabuf revoke" are not under QEMU.


> 44.                                                                                               *unmap private MMIO
> 45.                                                                                 *TDX disable dma cb
> 46.                                                              *cb disable CC viommu
> 47.                                                                                 *TDX tdi free
> 48.                                                                                 *enable mmio
> 49.                                            *cb dmabuf recover


What is the difference between "cb dmabuf revoke" and "cb dmabuf recover"?


> 50.workable shared dev
> 
> TSM unbind is a little verbos & specific to TDX Connect, but SEV TSM could
> ignore these callback. Just implement an "unbind" tsm ops.


Well, something need to clear RMP entries, can be done in the TDI unbind or whenever you will do it.

And the chart applies for AMD too, more or less. Thanks,


> Thanks,
> Yilun
> 
>>
>> and which part/where need to be modified in the current architecture to
>> reach there. Try to fold vendor-specific knowledge as much as possible,
>> but still keep them modular in the TSM driver and let's see how it looks
>> like. Maybe some example TSM driver code to demonstrate together with
>> VFIO dma-buf patch.
>>
>> If some where is extremely hacky in the TSM driver, let's see how they
>> can be lift to the upper level or the upper call passes more parameters
>> to them.



-- 
Alexey

