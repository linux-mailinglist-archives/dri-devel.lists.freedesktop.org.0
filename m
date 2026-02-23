Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN8vKDIgnGkZ/wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:38:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3635A17408C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F70610E2CC;
	Mon, 23 Feb 2026 09:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qkdGllaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012000.outbound.protection.outlook.com [52.101.48.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EC010E2C3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 09:38:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTWPPE0sGuSnACSmFIjg6vRmocPPDYZhNkpNeC12kE6pS29FoGC6VRxVJiOiam7yOmSRLv+5xokxAgiCvIzz5G4y6qdHWKyeUu7BiX/+2MuqL/jxf5ucVmzwEBp36zqt2klzxOMzjYds5C58Qa1LrdINVx9iUfQOx1zM8mQAPeAzSNoBtO2SCUocm5cxmbtLlu3xXfISZziYrv2gllMzX0IOz9WiAzgcm4zE1yNBboWy+cyuHUD2He0bBsESigFLixC3eLRByYpi9GF/838JkvJ44x135/FhpduOqqRaZrKpuPtaEkFxlxIHvo/z3L4Ye7gl4LVUqahT+R6KThKawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28qrH4YsHxQFWkS+7IuARMbgvDUxiG2xX/mbhXeFDXw=;
 b=juYB2SHye5I+7zl4erGbsGNUZb3ObX/B/wmeWBXrW91s4T8wi82FaE9c3zX69Lj0Fu+YH4G47YsoAPf1Bmli/lpwd3ToW3gybrafHWp6pgc4HxIhe3DEesbhCbPv0OAZLCCutgoqnhmIlt6XmJm+ImTPyGSn+wa6jt9YUXYzg05UaLplk25Lw+8On7drXVMyKyI9/REeY5KUIxXesXvTvB0/GrQeD8fdOPOj/l1I6oMG54yXk3WC3lG981+GKY4TMNwJs/0R+jobY7p45zT28VyyquAlPkHT+g2F/GFpetWREnKW1etZvi/SXo9hFTyhcK35DX4w0Y+OqOoVdmZY8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28qrH4YsHxQFWkS+7IuARMbgvDUxiG2xX/mbhXeFDXw=;
 b=qkdGllaZeA6PXclhwjr7WvEgAoy3zhY/58V5lTTrjR+AEeifINmOgjw3bG9rTkR09yl92MV1INZHAywfB7eZiXzmEdMGmfaH5bxML8x+6CxHF6SmNIPJK4PHp0JPdy0nhNBvKGaSyN1Vfckfv2TZ2URVczcycWRe3pZDKKawmEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS4PR12MB9818.namprd12.prod.outlook.com (2603:10b6:8:2a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 09:38:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 09:38:49 +0000
Message-ID: <d6a1c9a4-c25d-4f56-b5b0-5ccfa836cbb1@amd.com>
Date: Mon, 23 Feb 2026 10:38:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/3] drm/syncobj: Add flag
 DRM_SYNCOBJ_QUERY_FLAGS_ERROR to query errors
To: Yicong Hui <yiconghui@gmail.com>, michel.daenzer@mailbox.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20260220022631.2205037-1-yiconghui@gmail.com>
 <20260220022631.2205037-2-yiconghui@gmail.com>
 <d27ae98b-b401-4110-b233-a8da2dd3de05@amd.com>
 <9b952d44-6fc6-4594-9e16-78d529290c9d@gmail.com>
 <c61bde06-51fe-4909-b9e6-5edb619ad031@amd.com>
 <4a4afe2c-a592-432c-a46c-3446878501c9@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4a4afe2c-a592-432c-a46c-3446878501c9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS4PR12MB9818:EE_
X-MS-Office365-Filtering-Correlation-Id: 994d79ed-4bee-4320-0ba3-08de72bf5956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHJSWHROcE9VSktHSDZMdmtTUzc2cHZYa09BMTRyUUs5RXBpK2tBSkc2R0ZM?=
 =?utf-8?B?ZnIrd0dnb0NvRHVhbU05ZjYxQjVQdDJ4VmJwSlEzMVJJa0lGZkFvalpVTUQx?=
 =?utf-8?B?L2RSZ3JuNlR6cjJ0U3lrRnF1TjA0L2JiM3RIZmlJRWRucXdwRGF4dEd6RjJ3?=
 =?utf-8?B?VUxRaGdGS3gwdHArb2FRSDYrZGNBcGdOQlNkUms4U1FwZU9JUXBqcjR2RDBy?=
 =?utf-8?B?N3RCRkovR1hZWkMxcDBzdFhIMHcraGswV1ZxTGR3b3VXTXZaMEs3cGEydllW?=
 =?utf-8?B?L1BKVUpWQUd4UkorQVhyMDIxUVhaZm5OT3RIMGhLOEZ2eFRBNnlsM0pWUmRP?=
 =?utf-8?B?SkxjYmcraWRnT08vN3N4eUg1SExCektZN3c5T005SHZzTVJaV3NmZEc1MjJq?=
 =?utf-8?B?a2hvZk1SWENIOHpVRHlPNVppSGpnemI5YklMcFFJWjVFaU1uUm9IU29rZ1R5?=
 =?utf-8?B?K3BRQTliTUhGbEhJS0thTlVSSmpZMnhSVjdScDlnTDZ3V096R1JEMFI4RER6?=
 =?utf-8?B?cW1NbmJrc3dzT3oxZjd5RnFmTlY1VnBmL1ZtTEVvQkJhMVZCQUdFU3NqZ0o3?=
 =?utf-8?B?ZzQrSVM5c0FvU0lZVE5rZlBlalRsYlNjYWt2elNhQ0dIYk1WdnN5VURaQm9L?=
 =?utf-8?B?S0UxNVlXQU1nTUM4K0hxVE1GVXc2b1ZHblFWNWpVU0JVbXdkVTUwVFZtT1Nw?=
 =?utf-8?B?aEpYeFdEQk5rUEJOVlZZcDg1NzQrMGI0S3F1VER2OHRQU1ZQZjY3Nkg5a0Ri?=
 =?utf-8?B?cjJpTzJqaFpYRVVMa1pTZFVHL3ZiTjBGWjVNYkhrYmN2eFk3aDBNeXNWOXY0?=
 =?utf-8?B?VDZoNnZUblpXbFNJeGxCZDhNYU95VFF3bDFoNHJmbGVHZ3YvOXB4OFFIdUl4?=
 =?utf-8?B?S1ZIeXAxRkR0M09ZekJkLzVWTVVBNm5MRzEreE90V2JCY2lGSnRCQjFVY0kx?=
 =?utf-8?B?NEFwVVpXaVhkei9NZng1RzRtajYwZ2tKUGZEa3ZyM1VTR1pBNm9LZDR6Q1dJ?=
 =?utf-8?B?dmNOcW9lTy9yOEFvWUQ5S29HRSttQ05CVnhCa1hlOUV1NHRNV1paMGhwQ0pw?=
 =?utf-8?B?ZVY4MXM1Vks1MVUyK2JrZDVOek00Yy85WFFLM2lCbmMyQWh5WEp3SEVKMjVX?=
 =?utf-8?B?SkpQUUtPOUthdDBqMDZVMXAvS1UrQ2RIeGpqemU4cTYrdk1kRUFNMjkrZXZ5?=
 =?utf-8?B?Unp3V1JyYnFrVVh1RFdYVWtvSkl3aWxqdlR1V1VacS9lZVBLajZla21kOFpt?=
 =?utf-8?B?cHVIM1I1YlBJL1hpdGxtd05QZVZHY3EvcjNRSFMwMk51VXYvQW5peHhhcWVw?=
 =?utf-8?B?eTM3VFA2aHJOUVR5czdrT1B3NHBOaUI1akRzYW1JZkx0YlJiQXJqZ2M0L0FU?=
 =?utf-8?B?MWlkaTBIYm1CT0JPbkxzOWVOUVN4dERmWkxlZExCaFpOTXhudHhpYzZIalNi?=
 =?utf-8?B?N3VVUVVJWTgyTDNPZHdUdGpiRW9sdUdjS2RzR3Vnbkw1N3JWWmVRV0ErdU1N?=
 =?utf-8?B?QngxRmw1SXA3ZmwyU0VDamhQY2hrb3RDRnNhNjMyYmVCVitMOEVTS20rNGQw?=
 =?utf-8?B?SDB0WVh0UTM0NG9Delg4RDIyejJua0tmaHY0eDYzT3ZORWJMemJaU29kOTF4?=
 =?utf-8?B?SFNDcDJ0b1V1NkNkZDlDajR0dGg3VnhleGZRdkJ1U2QxZVBXNmsyRS9tZUU5?=
 =?utf-8?B?eDgrZ2w0dFJNZEVEMFU4R1MvZUZ1WVNtY1RaNVJmU3Q2ckZ0aWQwejRvM1NR?=
 =?utf-8?B?R01JNXRLRVRZVnZ6NVB4OVpMVjZ3WDFxY01RYnRGdnZWcmlnRCs3RlAwVTdU?=
 =?utf-8?B?R0JxYjZURkVnL1cvUDhnVjZMVGtoRWthU1ZCTmplTThCTzNZak84RmVYcEpy?=
 =?utf-8?B?OEVCdnc5aENGQ0FrMUVkRVIzMjNUOVdGMkx6RWFUYUxTVW4wN21zMm1FZ3J4?=
 =?utf-8?B?dXRWcXBaTkRBQUZnWmMxa3JvTHJCUUZUZnZuWnR4MGZIc2dmdkRLVGIwUE9R?=
 =?utf-8?B?a1dFMzlVN1F4cjFxeUEzMnRkdHE0d3lkVHVYd3hRVzhuZ0t3TlhFZHE3eVRH?=
 =?utf-8?B?VTE2THhHK3l3LzNvWGZXaG51dm8vdXZTSzFGcmxRL3ZYcndkZXZwdVhiYlRl?=
 =?utf-8?Q?o+hc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WitrdUMrejE4UHo1d3pBMGV1STRHbmZ2OHg1S0NPY2g0OGdOc3RGN2VlWnhW?=
 =?utf-8?B?WENDQ0NKQStGSmd3UmNscUdxd2RCQXdDSW9VdkEwT2I5N0JNSXdEQ0NYenhY?=
 =?utf-8?B?UkdMdGU0NjVLK0RQSmMzbnNKMGt5VVQrbCtOd3hya2tpL2wzS0FLeUFnY0V5?=
 =?utf-8?B?OEYzYkcrTUZCeHlPU0k2aSthN3Z5VkhrbWY5ZWQzYUI1Z2E5cUNDTThpQ25T?=
 =?utf-8?B?V1d2S3F6TnhycjY1TTgweFpNcDdxYVRHeVVwakcvNXBXbGZiRHdQa2ZyazZw?=
 =?utf-8?B?VTRvYWlOSFptYmRqMkN6S3NLbFIyd0diZzJmM2hlWVVPdlAyVldMcWw1d2Rl?=
 =?utf-8?B?MUVxazlYZkloOW1kdllGdGZkZldiU082QVcvYmU3MUxJUlhlazRrUGZudzZk?=
 =?utf-8?B?NXFsUExJUzJnaFZ2bTJObVdYd2xVUFpia3JmVmZLUm1kbkhWLzI4eXpUcktG?=
 =?utf-8?B?TmExUXJNOXNhSitVVWFYVzkyK3JhUWFqUGVMN0xMeFlsT0dGeGczc0lHNEEy?=
 =?utf-8?B?QUtpVjdMaktXTXczcTVHcndXM0F2eUVYVld2ZUpGc3p3bXpNcnJhcHRVV1F4?=
 =?utf-8?B?RFg5VWp1MjZCTW9LQ3g5Rk9NZVdyRXYzc3RFYTRjRlQrMk56Rm1uK1pGK2sw?=
 =?utf-8?B?cFJudzgzRmlXY3M2dnU2dkN3NzdxdlNaVENLY09OdFd6QlFycHBuNFlWeXpH?=
 =?utf-8?B?bVd3eUpWaHlyOHFiRzVES24zQkFsdDJLS3ZxcGEwaVFsMUdoTTllTHhyU1Yx?=
 =?utf-8?B?dTJ1WFBQN0w2d3A1YkcvMnZLS29zekZHS2R0TzRQbjdvRzdlSVFQVXAzM2V5?=
 =?utf-8?B?dWJiZmwrS0Q2Y0UySjBWTW1CVEVZbnF1QlRCTndKZWJLK2tnOXlRaGp2cDcz?=
 =?utf-8?B?M2tIU1pGdytSa3pLbzNJeS8yVWNHMEcra0QrRVhKT0o3WENxSjNMOHhkSjg1?=
 =?utf-8?B?YUtmVmZ0Zm1TM05PUGMzanBlYndXQ2RVRjd6czQ2TTEranZpZ1pDSVlYWTVW?=
 =?utf-8?B?YkhJZERvcWpnRGNNOTFRYmtxaXBlWS94SkQ1MktBcTNucFZtQk5sUjZienZu?=
 =?utf-8?B?dmtaUXdPdEo1SUtLWU5yU3dNVlFXSEFLYnlENE5vcTFGZzNUM3o0dUhQVUtn?=
 =?utf-8?B?YzZQVTRwcTIwajllZWpIcGpQcjMvMW16K3BBZXh4Uys5NEJid3lpZVFwODNP?=
 =?utf-8?B?YXJ1d1R4NWUxRlBUYkFWb0NtekVkbC9Vc3NZc2hubFA1NndFMXBJUVhrYVQz?=
 =?utf-8?B?eG1IK3REb1NhTC90Q25NM1JKZWt6dkcza1JVMnRYbVdWZVVEcHZNSVQ5eVZH?=
 =?utf-8?B?YkEzbTUwdUNnOWpMdEx2NzhPZnFPTys3UG9waGpiNk41c3hDM0xnczRiY21R?=
 =?utf-8?B?T1I3UG03L1pNQ3JYaXJlNmRlbmR5bTBsT0FXMUZFNXBlZ3BDVGNGNzN5MEdI?=
 =?utf-8?B?eTl2UHJMWmtjcHNMcHpQa2RsVXl2Ym1jRjhKdkxFcWpwRExvSFZBczBHQ1Vo?=
 =?utf-8?B?SWFUSEdOcDhPSVFLUzhwWTBaVzdUeGhjUFhOVlZucmxlMjl1ZXdOZFlxNXdj?=
 =?utf-8?B?bUJiaEFvbTVHTjlkMm9MSElUaHpWalQzd1JVZjd3ak9DaU1qTjNhVmViQUZV?=
 =?utf-8?B?OWgwU1F3ci8vR3J6bC9WUTI4bHZOMTZ1M002WkxMamxwbUZaUGpyU21hOU9r?=
 =?utf-8?B?T2MvR0tDRTQwd3U5ZjJUeWhLNHMxSHdyU2ZaVmdZUGRWQUxLNHkwb2hwOVVH?=
 =?utf-8?B?YjExNFZ4YjRuanROSFhwTlZsUEtaUkZCZVY3bExIM0ZIVXo5dVkvMTQrUm13?=
 =?utf-8?B?NkJYT0I0VjhlVVNZSElTZU94TGZTSUV4SEloYUpZQ2tkVENLNGxPNm1RKzlu?=
 =?utf-8?B?aS8zamFYcTM0N2dSbkpPcHNkcWkwSW1uc3dPcUpHZDdXWVlrNThTUWRhOGo1?=
 =?utf-8?B?TjJXK1ZpeVhYemdJcEdxa2ZrVDRuaDR2dUthODdTN2Z6WEVwYzE5QmVuMkcy?=
 =?utf-8?B?ZjhlSXFhZWVaTm9URVZDTjVMZ0JQTU1WckxFUm41MGlVK1kzdDBoYkIxLzF5?=
 =?utf-8?B?bGRQTlJteWdvQXQwVFZHQlYwR1RMMHlaMnRmRmRQMWpLa1Axd2xtS2hwa0FT?=
 =?utf-8?B?THNYT0lXaVlzNUhkSUVtemo0amxnUENLQ25IVXFsTWliN0FGYk9iQnpYWTZZ?=
 =?utf-8?B?VE5mK0d6NU9IQjc4T29pUmJwbENPektLNjdWRUVGUGtqV1N6SUJwR2JjbWpy?=
 =?utf-8?B?U1U1OE1NRUN6SGZZSzk3TGI2SFRaUDBFeXI0ZzRGb1pFL3ZGQytERFora3pp?=
 =?utf-8?Q?B7lltVOa0ZtaLbBa25?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994d79ed-4bee-4320-0ba3-08de72bf5956
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:38:49.7568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DptPk/v2IpPqnqhVzIwEJLmCjZJ9JxpfJOPE/7D/Nc00U6Z0ypNPrdPr3XmXnS4V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9818
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:yiconghui@gmail.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,mailbox.org];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3635A17408C
X-Rspamd-Action: no action

On 2/20/26 20:40, Yicong Hui wrote:
> On 2/20/26 5:07 PM, Christian König wrote:
>> On 2/20/26 18:05, Yicong Hui wrote:
>>>>> +
>>>>>    /**
>>>>>     * dma_fence_chain_find_seqno - find fence chain node by seqno
>>>>>     * @pfence: pointer to the chain node where to start
>>>>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>>>>> index 2d4ab745fdad..322f64b72775 100644
>>>>> --- a/drivers/gpu/drm/drm_syncobj.c
>>>>> +++ b/drivers/gpu/drm/drm_syncobj.c
>>>>> @@ -1654,14 +1654,17 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>>>>    {
>>>>>        struct drm_syncobj_timeline_array *args = data;
>>>>>        struct drm_syncobj **syncobjs;
>>>>> +    unsigned int valid_flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED |
>>>>> +                   DRM_SYNCOBJ_QUERY_FLAGS_ERROR;
>>>>>        uint64_t __user *points = u64_to_user_ptr(args->points);
>>>>> +    uint64_t __user *handles = u64_to_user_ptr(args->handles);
>>>>>        uint32_t i;
>>>>>        int ret;
>>>>>          if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
>>>>>            return -EOPNOTSUPP;
>>>>>    -    if (args->flags & ~DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED)
>>>>> +    if (args->flags & ~valid_flags)
>>>>>            return -EINVAL;
>>>>>          if (args->count_handles == 0)
>>>>> @@ -1680,6 +1683,22 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>>>>            uint64_t point;
>>>>
>>>> Make a local variable "int error" here.
>>>>
>>>> ...
>>>>
>>>>> +            int64_t error = 0;
>>>>
>>>> The error code is an int and only 32bits.
>>> Understood, will change that!
>>>
>>>>
>>>>> +
>>>>> +            if (fence)
>>>>> +                error = dma_fence_chain_find_error(fence);
>>>>> +
>>>>> +            ret = copy_to_user(&handles[i], &error, sizeof(int64_t));
>>>>
>>>> The handles are also only 32bits!
>>> Ah, that's my mistake. Was thrown off by the __u64 in the struct definition but it is obvious now that it is a u32. Fixed as well!
>>>
>>>>
>>>>> +            ret = ret ? -EFAULT : 0;
>>>>> +            if (ret) {
>>>>> +                dma_fence_put(fence);
>>>>> +                break;
>>>>> +            }
>>>>> +
>>>>> +        }
>>>>> +
>>>>>            chain = to_dma_fence_chain(fence);
>>>>>            if (chain) {
>>>>
>>>> In this code path whenever point is assigned something do a "error = dma_fence_get_status(fence);" and then eventually copy the error to userspace after copying the point.
>>>>
>>>
>>> Hi! Were you thinking something that looks a little bit like this?
>>
>> Yeah that looks like what I had in mind to.
>>
>> Thanks,
>> Christian.
>>
> 
> Hi! What should I do at this point? Send a v3, or..?

You can go ahead and send a v3. But after that I think we need some userspace code using that.

Could you also look into writing IGT tests for this?

Thanks,
Christian.

> 
> Thanks!
> Yicong

