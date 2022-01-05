Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFB5485647
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 16:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92B010FCBD;
	Wed,  5 Jan 2022 15:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2041.outbound.protection.outlook.com [40.107.102.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FE610FC53;
 Wed,  5 Jan 2022 15:56:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fg4ACg5t6r4MZXNsrcQVmwDuSWAl56QSsIL8myjTEbHn8av3iURWbJYmA6CFp80nGHeskrao83nYaUSz+jU2sZPcSdXAhWDHe5iAXEoUwY0ibKuSEPqWYhCvkLhU3LY7o4Mj5dkiBmTFmBSPOweSwG2B4hTU3z+p8ro6Z+Pyu6Hcq2NiS0bTr8qsuyNq3LK7Xabbi+mEIxzrN/CucDjSi9StAjVWFayinSQep2ibq3xQfy9Zn2C6gkieM1Synv+p/UljLmJmzmiWuSYCfjiQeeBRK2OdKfj5to339Bn6zjNF6SDJiUc2aMKBjdUkenb+wMvhWrJ9wd3A3NY4+3WsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vh8aaHRhVUoUIRFilmeLtnT9EeY5BHuGHVnqH1OepPQ=;
 b=ckNWzxV6TSqr5kwmVlhHgSFtz/5aC2MNxBxFaeelsm2DPpJldqilhsIXOyw8xfmBx09iuD8uJTJ6rwFouTCsGDtxB8X6vhJeZw7GdMVtBy/oIZGq2Vdlr0JMVa161ywntEGRK2liKGda7RmJXQ9iN2tUrVM07j2jyAiVxArmv7NULe7Uf0b/om0WiSep1SUH1/YasuT4G1evqg1wYo60d3GJgYI4gI9lQiJ/SvZfB+Q0w1vh+mTg7eZh2pCI/cHf9SQZDLLbJjqfZDaWZyHQhiT0HbpH1AI7VSoZEMxYJBqmqgVJEQR7xms9TzyvRyOT/c9f/smMEibB97cLJLx6WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vh8aaHRhVUoUIRFilmeLtnT9EeY5BHuGHVnqH1OepPQ=;
 b=aqCi+gI4yEwkPiNT/kLOMdOm+uUMZrCzWvyEa5ol5J6jOSEpFMjbCW6grfJjAg68f9cZASkXVzQCjGdCglcClDSGXTM/PlBilDRsoe0LA1sAl7ZhvI98uhdh1fSZjYDL4469bEqgoWMezxww7tptdfOFya+x8GiuMi/Vmu2X+YI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 15:56:53 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 15:56:53 +0000
Subject: Re: [PATCH] drm/amdkfd: Check for null pointer after calling kmemdup
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220105090943.2434040-1-jiasheng@iscas.ac.cn>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <3a1a14b9-3bde-ed44-ea43-42845f4b568f@amd.com>
Date: Wed, 5 Jan 2022 10:56:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220105090943.2434040-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::18) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4da29fe-8e52-48c6-059b-08d9d063fe07
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB52736BFFAE2CB0F631841D67924B9@BN9PR12MB5273.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xA/s8RBBSk2YIOeQSQ0MuIx39kJo0Eo1sFJAmq4OKF/6kZDzEpCnzwfoZQjNhm81O/Sf2N2nvtjlPXWf4WQa3YOIYc0bmcdCraHAvKDMAOF2SkWadqLrxh//6j2VsfeA6fShcAYUD0NmW6qdblOvVD/pDLvnCbi7hWQcwj3oq2tbhZvWoshWPtGLDsLCJN7csyJq5Z5DS7zOlTbACcRa3kc1cPLjIvaAa49fwhnGc3rI8JLe6cw/u0uOSpW6OXtBBuFKwSPgsm/hUCZlbWshzkOO93j3qeJ7T0OpvdT17feLj5d3uwysXmGWRbEMLq6xWiE0ZO3hIUb3D2hVooXWHUoJmLEuNXwWvBd57EM4er9GCuMtas7uvffGg57zX6v1a+OV9h9SG3yNfHUnGz3aDPRoi8Z1q30VMCwP4K3hWFla8s3EOu5aoySCe3vwwn4ZE2nSeWWTztr66saCMPXtwXfvxc9d6z3xYTAGsLzJxdnx2sR/73IfG3NrPrFMI5jM/PVFNf4V0y5O3uGNjGgTSqGs/N6QwyMaD8254ZusQ5zLDnGCopXMhohlnRpq8zJx2aUXae8XMcQASCk+RsxvzxRnPYGpF3B/bYb5IptZHviP4oLjE02wqiHOzkbFDDsvt8Rgqql01EhGTyFiGD2PVN0bKFIjBVAgdOSOk/q3zYhPhFFiWujpaozLD3AT+cA567VVoTErbRtgoqcJeyDC906fXBkZ9yCZ/kDUrqx3KK0ELy9P53Zg4yFjy+PyjPTU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(66946007)(2616005)(38100700002)(6512007)(508600001)(6486002)(36756003)(66476007)(5660300002)(86362001)(2906002)(31696002)(26005)(83380400001)(186003)(4326008)(6506007)(44832011)(8676002)(31686004)(316002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjVNUXJBTERjbkFxeThMaTZvMXlPeUdwWjEvV2NVYWhQV3BBNy9BYms1bGdu?=
 =?utf-8?B?cnNGbEZBRDVsaU1xREVkSkUxdzhOeTZ6d21RTjhwYmw2WGFsc3NBSjU2SWVu?=
 =?utf-8?B?MUdEbjRsYXdBQjgzbG9HZ0pkbHVBK1c0bERaSVZzbkh6M1ZXaUJtc2FZVFQ4?=
 =?utf-8?B?dm9sV0U3dDNtajRkaFljTndiU25Ed3czTE5hOW1mcDU4RWJlM0dUUkFFZGpm?=
 =?utf-8?B?dmIwR3owWXR2cEZrZlhncmk4RzFDV2l5a3ZTRjlicUorMnlEUUpDSXN6VmUw?=
 =?utf-8?B?amtuRTBnSmkyWkpaa3dNSi90Z1B6eFRhbk1nTFhHR3RFeHA1ZXV3bTBpOE9Z?=
 =?utf-8?B?dmd6NkhWYlBGYVZpYXA0MHFtWU1uZ0cxbkIwazNobzQ2cWYxcWEvdnFoMjA2?=
 =?utf-8?B?a1VQR0VYcVRrZFNMVU9IQTYyNENrNGxmcGRuR1RCRFFZOFZ6UTJ1WXkwUTlo?=
 =?utf-8?B?aTcrQnJ3VFdpRkxieDc2YUgvMnhVeVF2ZXUyVnF5NTVhZVptYXFzazAzeU01?=
 =?utf-8?B?RWJHZFM3WE9PWGV6K1hYVGVvQUZnN3lWT0lsSE5aeFI3M3RhSVk0cXpLMFdx?=
 =?utf-8?B?QU5MZ2JyUUVoTmowcEFiVmpwUzE3bGJwSW05cTBiWHpJckpWb0UyUm9ub01I?=
 =?utf-8?B?WDdxK011MGp0TFpYd0Q1Ri9MZUlBVG1qSklGTlU5eDlVNWttS0Z3WDJRNjE1?=
 =?utf-8?B?OGd0eWZLVE1yWEk0OEw3b3ROV3A0MURFbFZUZGhWVzQ2OWFibzFLV01TanQv?=
 =?utf-8?B?eWlSeW5wVytPTWNkaE03d2ZNN0hqYm1uOFFvQ2FKaS94TDc0ZU12bkNhT004?=
 =?utf-8?B?eGhJUHhPcVl0VUhzczN1bUJsd1ZCSno2R0N2aFkyMHpJeHE4eDhvRmp5NkFy?=
 =?utf-8?B?czUvZHR2TGEzRGY5VEJabFRCN2JzU3lLY1JmK3BOZFBsQ3pndTlsYWtXYU5l?=
 =?utf-8?B?WjZaVFUzU2MrZWV6NXhPSG1OL1dqVHg4ZUtqeHR4dDhvcW1yQ2NzWDNYSWpI?=
 =?utf-8?B?b0UvR1NiVVlXZlJiUmR0SU1qdUFlT3VpU1BnSjc3TjVkN0pDYzVRNE1TMVRo?=
 =?utf-8?B?NGtSVXh1Um4yNU9TMyt2MXhweTFMTGlrN0dWZnMwWFdWaEtkTEdWN1g0N2pX?=
 =?utf-8?B?K2RUS3lhZEJBVTdsWHE4ZGh1SG1WaXJYT05LbEh6U2h1K3BNUGtNaXlQUjZX?=
 =?utf-8?B?eWdMV0lPL3VRK1hGMjBPa09tcitvcExEU1lySXlKWSsyYkN4TmNtQ2ZPUzJi?=
 =?utf-8?B?dE85cXhBV2JmNnFpNE5uNjMxRXdRT0Q2VHk1eG9neVJqanVqdW1wTGlHOWNp?=
 =?utf-8?B?bGc2U1hkY3cvVStkbnZJNXRiT2JEaEdYUFRzZEUxdkdqOEZvd25Kb1UwOEIv?=
 =?utf-8?B?MGZlNit5MjZQeHdlYjgrb1BhclpoQUNwOWlDWUUzUTNEVHBXL0I1T0V3Ujht?=
 =?utf-8?B?VGJyamdRbmFPNi8rMTBRRWVjdmFNaUpUdDdVMmtzS2ZSenFVWTBhSlU2T21Z?=
 =?utf-8?B?Q1RwU1ovaXRHUjV6WjJNOEtHSVl3QzJkeDEzLzJuSGhMam8yVDRmV2ZTNXNq?=
 =?utf-8?B?MSs2TytqM1lMeDIvMnc4eEQvR3NPRTBTV1N0TURRMWxkSG00cDNnOFRhRVoy?=
 =?utf-8?B?cE5JV2ZTWXRKUWNBK09adnRUTEppbDVBUGR5TUlDbk1OWktsUXlLQmtURVIy?=
 =?utf-8?B?elYwUmRCcXBjU1JHMFJrMmZGR3NoQ1pBSFBoc0JHb0xZY0llc3dZNzVYRGtx?=
 =?utf-8?B?M1pzeFFmUkdNME5MK3k2VGp3Nk1yOWhUekpkeHl0T1orbExCUjFoeUE1cEl5?=
 =?utf-8?B?MDd3NmhYb1RLUGJQcU42d0pwbnA4MnNTeERkbkZzeWxIZDhUNTlkM1grTjM0?=
 =?utf-8?B?SVFMSHlwYUM2MzRUQ1U1a24waFJCZFVGdzgwWkVJc2k1bUV0M1hYUnBrWWx4?=
 =?utf-8?B?TXl4VkpEQkdiSnM0akl0RTZGbTdHTEJRWXluakZ5SVNjMGQ3d1AwRzdYdXlT?=
 =?utf-8?B?NG9MbjZaT2VONVNOdWlEdHpsOVV0Tm02aG81MDExenBBb1duVlhJMnV4eTdC?=
 =?utf-8?B?M0x2Q2hHK2xNZ3YrSmR0U0FqNTlrRDhhZGJJYU9BbmMwbmI4MENYLzlYV2Rs?=
 =?utf-8?B?NGVMT1BNZmtKbGZGcWJwRHpzZWRnNksxREp0ODhOekFOUEJqcUZoOC9oUU13?=
 =?utf-8?Q?2eOQBjgArYPvnHirNc6SRQI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4da29fe-8e52-48c6-059b-08d9d063fe07
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 15:56:53.3567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76DP1R7qo21/vZe8lQLm5xRncux1Qbksns7uzYPZ32ue3QrlttuvTWafUFvDS9NMB33wOKTj4ks6XJX73dH6Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5273
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-01-05 um 4:09 a.m. schrieb Jiasheng Jiang:
> As the possible failure of the allocation, kmemdup() may return NULL
> pointer.
> Therefore, it should be better to check the 'props2' in order to prevent
> the dereference of NULL pointer.
>
> Fixes: 3a87177eb141 ("drm/amdkfd: Add topology support for dGPUs")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> index c60e82697385..d15380c65c6d 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> @@ -410,6 +410,9 @@ static int kfd_parse_subtype_iolink(struct crat_subtype_iolink *iolink,
>  			return -ENODEV;
>  		/* same everything but the other direction */
>  		props2 = kmemdup(props, sizeof(*props2), GFP_KERNEL);
> +		if (!props2)
> +			return -ENOMEM;
> +
>  		props2->node_from = id_to;
>  		props2->node_to = id_from;
>  		props2->kobj = NULL;
