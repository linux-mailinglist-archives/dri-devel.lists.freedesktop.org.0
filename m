Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JxJCKYMcGlyUwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 00:15:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68444D9F5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 00:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A08210E658;
	Tue, 20 Jan 2026 23:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RfcMZO7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010019.outbound.protection.outlook.com [52.101.46.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20CE10E658;
 Tue, 20 Jan 2026 23:15:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I07dLNjlApSJOUXq3xQmwR+gWY3zGeK/52K82zTcFGr2yuGRiyoO1DgRAsXBWXM8+ERs8eko22pot/bj8Mg8vaiO72IZupkrmHzMZf3hSU3YYVl3GdOW6jKZ66XGbA5jo9bg5luP2tiaYa6aRBwgfdpxtww7KPsG3XHw9uKIRQqKRZ8HT+H7fjNoVsExLR/sEdoUMGQsBSxDAcnrKi2RIAfsGIUM6BrOLsIGSwnnMt2bOG+WeHFJeNHnB92xg1nJzjupU3IkEYRZwkt7z1tAFxQmkZ2DDSJ2L6gDJ3naN7tNhA4FfBBPaPhXFcRkebQOYx/bVDNCYXwF0c7DD47mrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jq34lQtyJ9nzPI33QWbt8XxPlCqVCjg5qj8W/ujo6I8=;
 b=ABNrIhD9wO3xuhrkyAnwX41l/OPEoxg7Sp9FP6fBIo5N+25oy3HZOgK+Ex/KaeKiGF/tfCtQcwqqDuA+v71rV6rY23aqmnrXLKNgaP+EXD+fuvVRKVKHsqagbBH+GM67H7XjL4VxmBkF+T3+5I0DXChW0UbdP9pyZpIBSw4T7J0zL9hN8WclOujCYzHrhfSv89gc5Hx0cekNr+UlGCXG15W8z1hlrCi1jpNCp15tcA/5PMeQI6sw/MPC4T05f+JI1amwm+E0luYxmnfWaGt7aCK8ECapt21ArAJiCUWFyNzzIREnxmQF4px5FZg51cU7iEoLsLnXJHdQBM9NNDVN6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jq34lQtyJ9nzPI33QWbt8XxPlCqVCjg5qj8W/ujo6I8=;
 b=RfcMZO7v5Vzx66PdHBECn1X0gqAUimoemTjIIAuoODEvE7fUOBLY6GZ6MTYhj2hLheP1RxugifEgHlorHmFRX9jGig537Ynfh/GlLFRfT+0+t6rs6i2XQeRpcmwEbDtUWOYhMaqYgzdrOdi62Ngr+lnaPAoz6rlapdr01NDWr7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 by CY8PR12MB7562.namprd12.prod.outlook.com (2603:10b6:930:95::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 23:15:41 +0000
Received: from BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::d977:95c9:e89:ff27]) by BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::d977:95c9:e89:ff27%6]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 23:15:40 +0000
Message-ID: <b07fe002-704d-4c26-aa09-6f7116d5c53b@amd.com>
Date: Tue, 20 Jan 2026 18:15:38 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdkfd: simplify svm_range_unmap_from_gpus()
To: Yury Norov <ynorov@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260114160512.831773-1-ynorov@nvidia.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20260114160512.831773-1-ynorov@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0154.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::27) To BL1PR12MB5112.namprd12.prod.outlook.com
 (2603:10b6:208:316::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5112:EE_|CY8PR12MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d33ae0-002d-4301-df30-08de5879d41e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDlpQ3F6UCt3WmNqLzZYNXhLTUFnaExNbmtwbnpPb0t1Rk94SGU0UDJWTFph?=
 =?utf-8?B?SHRtZHNPR1FkV3EzN29QUVFUbjJKSThRVEZMR3hxU3BlTG9BTW5rRHBMY2tx?=
 =?utf-8?B?a0JrTDd6cUVxRGlGRG5QUDJ0WWcwWHZCVERTb0pzblFERDR5cGplalh5SmND?=
 =?utf-8?B?bFd0R1lsc3U5d041ZEJFVGpXeGxqYzZZSEtpV2JWY2F6QzZGMUN0Mzh2RmE5?=
 =?utf-8?B?eGdpVkVka2J0SW9YZ1M4U1ZkWTUvY1JpL1RLT1RNY3pHOWRmdlBobi9FRmpS?=
 =?utf-8?B?ekt4ZGVlanFwY0JIaUtVQUQxQmFBNUVrUmFGVnl5MWFZcGprMGtBZFFUT0Jt?=
 =?utf-8?B?UTg4K003WTdmY29LekZMWjF1U2pYdE5rMnJaTnd4R1diV0VRaHRwVGhsVEtK?=
 =?utf-8?B?aVNkQktsc25zRVZnYld4cTlmUGVoSFk5cDIxOHZRckFNVEI2dUVpOFRMZFpm?=
 =?utf-8?B?NGpsMjVQZTlMeVBlbWdhRGV2WFJRazlaUWxURDl3dlQ1Y25IN0NzUmR0QnJs?=
 =?utf-8?B?Q2FJL1dmbXpxZmVBdmdlSmR0Mi9lbkN3bUtsa3lGTnNzY3N4bGptdWVEVnNu?=
 =?utf-8?B?aE0rTDFXdFhuKzcwbTNmbFgvTkIrSUUrZjNGUlZKS0tCRXUvU01xWWk4USsr?=
 =?utf-8?B?T1E5eHBUWU45MU5yOFExSjZWUXVuR0pwRmZtZy9ZTURiSWlCdVJLTFl1MGp0?=
 =?utf-8?B?djFXNXZSNmsyVEI3NlkvQkxXclUzZlc1cnNheVRPenIySjdxVjdoT2cyV0k2?=
 =?utf-8?B?bmd4aTg5WktFU0VlS1o0dDgzQ2J1K1N3cGJveTNac000QTdhMk01dDhkVnhF?=
 =?utf-8?B?c2c0bzRqVURkeUZpV3dUMUhDd3BEbEF6elR5OHdkSFJ1YkZJc0hXS0Y0Rk1v?=
 =?utf-8?B?cjcydWtuL3FXZVNDb2lXbU5mWWJSRy9DRkQ2T0dSV2pyMWZ1dTMzNEUwRzJs?=
 =?utf-8?B?cDc0d284TU5ML2VsY0RLMWNSVEZBUzFTSDg0ME1OMUZkY3pBU0RycVNOUWo3?=
 =?utf-8?B?N0EveGtZRURtYnI0NUJraCs3Qk1RWEJBSDRhWVNnMTIrRlpsc25JV3UrU0Q3?=
 =?utf-8?B?QmdxK3lIb0RVYXRPMEVKdHZJUGJ2R1VRUURZMGJ5bVRaMzQ5YlJhbytiVkpY?=
 =?utf-8?B?dnNmZjJicHFRRDY3NElTNlRvQjlHekdMZE9PeU5VS0hSeFFxUjkyNjE4cFpS?=
 =?utf-8?B?RWF5UlN6aktRY0syTXQ5b2h1LzZwMEVqMjF3M3cwTnp5MTBBVkFLeWdWTm9p?=
 =?utf-8?B?Wi96Z0xLNGVpOXpqSGo4K0dTQllSVllwVXFQVUMyZTBCeHZCSCtRUkRoRjRy?=
 =?utf-8?B?dE9GZG1BMEozT2xqcmorUjFBbngrZ0h3ZjZWRG9tQVh6bGZwVHd3Q2FwMm1L?=
 =?utf-8?B?aExpYkpXallHOFFxa1hzY2UzT2k5bUVrV0NKY0l5Y2xuaDFmcEw3Ukkxb0ZU?=
 =?utf-8?B?WHAzTUhIeEFBQ0lYYW84MDFVOWV2NHc2c1UwTnVKSGJYbUQ5YUlYWmtpWUJR?=
 =?utf-8?B?Q0xXM3IwYzdMd1BrNmdFZzNKalhFWFg5N0hMbkJlakkzeC83SHZ5V3hFbWNT?=
 =?utf-8?B?MHlIb1diSjJCT1hMdzVEQVY4dVB6Y3ZiWDcyT0RzZ3ZjZzlJR21PUmxWNlpZ?=
 =?utf-8?B?UEVUWng4a3NYaFlWWTUwbVRkMDFBVlJ1Z012b3VEYnpmNitkMmJFdW0rdjBB?=
 =?utf-8?B?V3pXZFF1VklXa0RTcStYYWlJdG94QmVmSmhBZVBpRUxxdXlBR1owZXNlQmg5?=
 =?utf-8?B?TUtQZTRHNDV4L0tIWWdFS3poWk1iSmo0WHFBTEp0ZGdqdHd2RGpaT1dHTUNi?=
 =?utf-8?B?c1BmS1YxSmN3MGN1Q1duZWwvR2pZYlFmLzZ5R0dVQ1VYVzJVVC9QbHptcGo0?=
 =?utf-8?B?L01nL0lqdGtUaDRFS1ZKV3JyQnlWYjVnZFBqb0VhTGJHU3pXV0lFbGhEb3dt?=
 =?utf-8?B?TG1DZHF0dE1acVBVTWtOODJtNmgxYVNVcGRRd1U4cGhWeTM5VUNhd1p2SWNO?=
 =?utf-8?B?OWJNdHNKendnakVjREs1SlBLYzV5dHZ4elBkaUFQc0cwTkFCaDFWS0VUTEx2?=
 =?utf-8?B?UGdqSEVXQmliUm5qdEF6TkJGcU50bGw1Zmo5OEsxZkVEN0JTcXdSWk8wbDdY?=
 =?utf-8?Q?+15E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5112.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHVXazRiMG5UUkJSTXg5dTNIWDZmbnNOeWFvc3hYUkc5MktDTURMSy9aNFVj?=
 =?utf-8?B?TmNvLzg0ODI1dVYvQU9zSTQ0SytRZVZVWHVBcEw2L3Z4VVJGeXFpQUk2MGs3?=
 =?utf-8?B?cXhEemdkbU9EUHNZMGFNL09FdGMwYVc5dWFlcEZBSFdUSkI0bUFRZXlaZElq?=
 =?utf-8?B?NGRITmFZRFh6ME8rbTZzMnR3ak95cG1yTmhvTVhtRjVYVWN3WlRxL1pZT0ti?=
 =?utf-8?B?REk0aVBXTUxnYlU3cmNhT2JXV1ZodE1tOEkxMExmb3ZvY3RsTmFSTHVFZzVl?=
 =?utf-8?B?ay9GT3RhanhiR3RZd0piRW8ydEtacWNqR2VlSm9xTVI5RStZVm8zUThlOGxl?=
 =?utf-8?B?ejI3K04zWWJrNHU5MEdWZG8zQzNaOE9SSExXQTBBRWhmMmxrRTFCdU9uQmRk?=
 =?utf-8?B?M3ZoMVRBd0VGdDVJN1gvN1V3Sjl5TVlFNElZc1pIVFhMU09DbDhzaUtTYldm?=
 =?utf-8?B?UjJ0aXFhN1E4MmNxbElWQkZ5U1dGcUROcXhwdDg3VVZNYVJxMzB4N1N4d2pO?=
 =?utf-8?B?Um5Xa1VvRWNUMlpxbW5GdEQ0Rm5LQlVGb3RUVG1GdnowU3lLVEI3ZEJrcDcz?=
 =?utf-8?B?cWV3OXlSOTVETlZWanU5aEIxY0tmemd1N2RtcWpmQnV1OVY3S0oydXprdUt4?=
 =?utf-8?B?R0sxQzdrK3QzbXN1WFlxeTJDdHVyOFlVdkdkVWVLT1VKS2NjR0hRT2xtSFpq?=
 =?utf-8?B?V1JWcXpYTEhzcUMvUmVKcVJqK05rR0lGWnJiL3ZhSVdYTDdIZVJyY25zWmE3?=
 =?utf-8?B?L3lSZXpVMVFkRGlXdGtheTFLWURrWWtMMzBTOS9nV1Z5S1BVcDdOZGxXWFlu?=
 =?utf-8?B?NjlEaVpMUDk1Y3dJNEVWM3RXcUZrNGdOSnNFUmYvLzZBaHQ4UWptTjJEckhj?=
 =?utf-8?B?V1ZBWTlYRHpnVjBRbnlra3FaVWNtbXVpTitOM2tobE9DUVNOdXVZZmZFeFVV?=
 =?utf-8?B?L2lNbUFPZzA3Wm5LaDdtUkYwY01oNnl4MHRPUXBmRjZvNnFvcFJ0Vk01UmZT?=
 =?utf-8?B?Tm1pVC9VemVhQ2IzOFpRbTFwbjRtdXM1T1dWWFN4cE1CRjA5SVNtUGcvRzBx?=
 =?utf-8?B?L05wQjhVekNqcUEzdlBwWlZuYlFaTDVsdmFacDg0N1lDM2RFNFJaeFRTc1pU?=
 =?utf-8?B?N0NWVlM1Q25ZWXNNYWg3c1dxd2prckFFTFFiY1BaTjk4cmVmTFRhWUZnQkd1?=
 =?utf-8?B?bk9HZ2QvcEpVQVNhS2NScXBQakVOUkxyQUZCeU1DY3ZTMTA4b1RuTkNnVTlS?=
 =?utf-8?B?RVJUeFFCQ2diU2lWL2dKRkp1clFNdk93OFNHZ1liR1NtWkN2cXNpZ0ljMmNU?=
 =?utf-8?B?ZThKN0hBcXJabHJLdk1WWTYyaUltQ05WU3JJQS9UT05wOUNvWThrT2Y4ZFlH?=
 =?utf-8?B?Y0dpbzh2bW5lOHBtMEEzNzdFdGErVEJVNHl1YXgwYXhobDF6U2djd3c5c1g0?=
 =?utf-8?B?MFUwYUwrS2RiWDBOZUFDZEdFRC95bEJiRFIzVE9Pekw5dVRyMDcvU041QlBW?=
 =?utf-8?B?cjFFcWpYcFo4SFRoRWdnRkF1UkxGMUNPWHhZekc3dXVwV1BlQm5zWEx1VU1P?=
 =?utf-8?B?YzJaU0NRM3ZCQnBaTUtRUTIvVkdxZUJreHdzOGpNdFgvRTl6WlVlQjk5NmJ6?=
 =?utf-8?B?NmNHbWFxVy9lMVR1L3RpazVveDVZeVpLLzFJYkJKaFlsMzRwbngybkhHbm5r?=
 =?utf-8?B?UVU3enh4aUxidlBITEI1cTZnQUZ2ZlRLQ0FiQVloaDJtZ2hCVmpJMnlja1cv?=
 =?utf-8?B?ZC9oSlhYeVpReXdCR1ZUcU1GWS9VNjVyVG1nWWNaMnFMaVVzVS90bklqY092?=
 =?utf-8?B?Q0s1WlE2bUF5R09aS3paT0pXVkdxek8zZjYwWDZocFpVSlo3L0NHTjdrbW02?=
 =?utf-8?B?L0tIN2o5TWRwdHYrSWNSRVVhUVdRdlc3YmlCK2ptZ3FCVWRzTHhqKzcvTW5O?=
 =?utf-8?B?SVlocUdFSXYzc0JFb3VVNThuVktWdllwU0lQSEc0K0JncGwzMGhJOXNYMEYw?=
 =?utf-8?B?djk5Z0F3QmlwMzV5RWhxQTZvQWtFUy9pVkpydFV4UGFwODdrN1A1aldFQldW?=
 =?utf-8?B?TlFNcGdRYUNRelVmNHJ6ZlFPQnBhd1lPUW0yT1RrMmhabjYvT1ViWkErVURa?=
 =?utf-8?B?V01SVDZGOWxmTnRRRlh4bWVpaUdaSWpDNklxVDNGMklqQ1V6K3pJcUpheElB?=
 =?utf-8?B?U1lvZE56OU8wdTdMMUJOZ204KytSTU9MSC9vUktoTHZiaEVCcHlNbWRscHVw?=
 =?utf-8?B?QTlwenozOTJJbXc0c3ZySUFEV3o2S3JpcDlKU0Ewa0liR2k5cVlpYWFtS2ts?=
 =?utf-8?B?OUFYUlJuWVhqK2F5Y0x6VXBCUEFOenN3Z3FpY2dsMC9ZK3k0em1UUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d33ae0-002d-4301-df30-08de5879d41e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5112.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 23:15:40.9302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEk8ym30fQbBnwvNTg5F/9wrashDTzF34J0orVsuCJEN3HjlYJ/f0mUkgEZ9JokzjptEfUJdV98d1ouUog2Hnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7562
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[felix.kuehling@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: C68444D9F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-01-14 11:05, Yury Norov wrote:
> The function calls bitmap_or() followed by for_each_set_bit().
> Switch it to the dedicated for_each_or_bit() and drop the temporary
> bitmap.
>
> Signed-off-by: Yury Norov <ynorov@nvidia.com>

The patch is

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>

I'm applying it to amd-staging-drm-next.

Thanks,
   Felix


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index 79ea138897fc..eed76b13d191 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -1344,7 +1344,6 @@ static int
>   svm_range_unmap_from_gpus(struct svm_range *prange, unsigned long start,
>   			  unsigned long last, uint32_t trigger)
>   {
> -	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
>   	struct kfd_process_device *pdd;
>   	struct dma_fence *fence = NULL;
>   	struct kfd_process *p;
> @@ -1362,11 +1361,9 @@ svm_range_unmap_from_gpus(struct svm_range *prange, unsigned long start,
>   		prange->mapped_to_gpu = false;
>   	}
>   
> -	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
> -		  MAX_GPU_INSTANCE);
>   	p = container_of(prange->svms, struct kfd_process, svms);
>   
> -	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
> +	for_each_or_bit(gpuidx, prange->bitmap_access, prange->bitmap_aip, MAX_GPU_INSTANCE) {
>   		pr_debug("unmap from gpu idx 0x%x\n", gpuidx);
>   		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
>   		if (!pdd) {
