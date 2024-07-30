Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65780941097
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 13:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC7F10E500;
	Tue, 30 Jul 2024 11:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="E8bowaVa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2043.outbound.protection.outlook.com [40.107.117.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E4B10E502
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 11:36:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soie/ALrmxpTu8UEcVyYKpPoZmhKNdastgLB5xAJQHzZf3uwnS5dDTQeP5uUTJkffzL/KRkbiwZ4R+gLGdN+0ZMggKO7719zoFXycpuKanKbDs0aM3c7fmRDIQeaJW5pX5u+xxjb4E5P1zAx6EWHgeaQ4YhHpCOU9+UlRMeZzFntSHp3lObNWrOb/ZGaMhTxPnUrt3ijKT3HD6sNz1W80VG6bpkFx2jY/pdS0U1GB56gRDff74mUY1ipBpwirM/cdkueDVJ2RS732I0444+DWiot0JyXPAa30zu+UPqHqLfMX777pIyLpkOYSupzkKj0fAnx57nG4ua6M6tKayoU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCjQ4qnBp3ge44wj54alBUWA2p2hV2DG6mRiRYz6ZCs=;
 b=hUjKl7qaeGsFQdOl6u6YQsCUPMecjNOjdF+/FPlE7bk8EJYrI0HpHTpLglbTy6hULfygAUTM84k8rLsKUEN6xls+UVPx5/iBvnQqrfzOYC9+jJ4+ojlL9+w5/vl9lyl+UikdpCI55RI3F8O/y9LwjX/hpuuInIlWxgYdD9qWGLNIvjAjRBbC1DBZjsA+ke3qoK+GTaJJZFcMkas7E2OpGvKGH/VVT56Qj6yhW8O/oQMD/Zs94YcLm5bt1H+jo3hjNELzyrbMZgAJWHMYGRvkyaEVXdGivULsoJTmQiGjaSotrgOE/xvOUkFsk+9/rS1wO9Td34THHIqFB5u4sqkYkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCjQ4qnBp3ge44wj54alBUWA2p2hV2DG6mRiRYz6ZCs=;
 b=E8bowaVa5Sq01bqTcVQP/M/SI6pfzl7TDmHHGHT2c3+0QtbaNcG3EGNhtrdsqQ7R08t6U8vb+JBsbS3Lrkg+Fg0sJAD+yznZzL4Oc6bvYUdXrR7KBT7/8d03nJi55x1Jg5R+xwxwwXpEsSz5VdvcMQ7lhVDpodrbz0/s2iXGcxMkz/uk/RIjicpmZtS9DcX8IJDQuW+CxWi8ZUioL5JHxmgAyCiMF9jDmjGbFA+r7TTr22ajZ1STvPFPJKTwKAwUFQPamjPKAJA34w5NWRCNfguNQbnGjDXflCbqYg+6QpjBTBCuXt9NodC32n4Tzi9c1bLkr6Sk6dtQrSBOQW19qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEYPR06MB5961.apcprd06.prod.outlook.com (2603:1096:101:d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 11:36:19 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 11:36:19 +0000
Message-ID: <2d94446c-72d1-4c4d-b7e0-696767b98654@vivo.com>
Date: Tue, 30 Jul 2024 19:36:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240730075755.10941-1-link@vivo.com>
 <d2f56198-a3c2-4f7b-9d10-616deb348351@amd.com>
 <966651c0-42fc-4827-bf3e-2170dcf4688c@vivo.com>
 <d5d7674b-eab3-465b-97eb-e33bdbecd7c0@amd.com>
 <79b51a8f-9c28-488b-9be7-b5ce715aa1f2@vivo.com>
 <d8529566-249d-4ae0-87fd-04cdc7e4e573@amd.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <d8529566-249d-4ae0-87fd-04cdc7e4e573@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0040.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::9)
 To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEYPR06MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 48332f65-490d-4e03-8d22-08dcb08bd46f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFlJNW1DWnU4K0dKNzBlZGQxOVFmOSt5SENJS3lJT1kzejk5b3g1R0RETkdQ?=
 =?utf-8?B?OWgzNStmNGkzTEZPeGJKYkprL0drdXU2L1gyclQrU0RYdW1mbXNJN09idmRu?=
 =?utf-8?B?dkx1RlpXRnJ4OGtYMzlyc3Raa1YvZ0FzTFVlSkZ3YlYrYnRXVlZDSnpmckMy?=
 =?utf-8?B?dkxoOXFCek1QNmFFQ3daeHhweUZaR2YySGhwUkFQbFZlcENBTi80N0tnb1lt?=
 =?utf-8?B?a0ZKMzhxSXc1V0Z6RUZwQ0dkQUFWUy8wd0NuY0ZSSThWcjFHVW9uTXdIRXlu?=
 =?utf-8?B?TG1VNEV4UDFRZUovSld5VUtFandTZEFRQlNIcUpmckxsOHlkYVBWUWdBRlBS?=
 =?utf-8?B?K3JRT1V2RU81RkRFbnNXQ2UrK0VseHJtSFY3V09SWkFKS3laWm1GR0F5U0pj?=
 =?utf-8?B?bVNsdi9zR0xDZWwvMTlMOVJsMFpTUHRRNllYcTQ3Q2FMY1Y1Wk9yTk44V0pQ?=
 =?utf-8?B?eEhMcXFiblFSN2RWN3NHakt0V3Jrai9XOGFuclpGZldxUitEWWN4aDlwM0RG?=
 =?utf-8?B?a0pycmhPZHhNelpVaXh0cUxjZ1lITHlXNE9xQWNHQUhhbXZpakxFRi84OUhS?=
 =?utf-8?B?RzFTT0MzdmV5QzZFUGwyakU5WlJtc3pxRHNiS01PNnVlNVRxL3hBWHAwcXAy?=
 =?utf-8?B?MDhJYjA3OEY0bW1SdDU3c0hxQzBucXd3UVhVME5CVW1zUG5CQ2dOYlNycTlj?=
 =?utf-8?B?YTZOb21KVEFJUEF6dlFiM2lDcmpBdUFtNzhtSm9ndzhsZnNKQjljY2FpU01s?=
 =?utf-8?B?Y2FoQ1dmK1VieTNQeTRsV21oOHcxNGZFVEtCMmxzVnovRTF6RnM2RktVUDJS?=
 =?utf-8?B?SVNEaVFRcDJieFlHeVB3R2l4TE1Ia1dOeVNyMGUzcW51L0paK09EMmYyazRM?=
 =?utf-8?B?MDM2QnhvM2EwQXFWTXFxdzZKZjRvNWtVemNnWnZ6NHRhNlFpTUZHR3dqdHgy?=
 =?utf-8?B?SkkzY0I3T1NzSnkxUWorRkRnYVd0SXBmNFJiTGwyRSt4K0lDVjd4ZmZDR3E5?=
 =?utf-8?B?WUZnbXlCL1YvaG1tc1Z0VXRxQ0dNVjdCTXlRUUdtNTdOdEFNVDQwQ1FUd0Qw?=
 =?utf-8?B?VHFEdWRCODBuT1I1SU9kZWRMc2svdnh4c1N4d3hneXhNVm0wRmYxSzJBU2VU?=
 =?utf-8?B?SG5jYk1wb1BEK25HazBYSmV1TWNLY250SXpkeVY1bER4U2VnNUdNVWFLZExo?=
 =?utf-8?B?V2F5N0M4TTZxREQ2NzV5RUZMeGNWbVFCdVZJRkpVejFPR2tWUEJ1czVJcVkx?=
 =?utf-8?B?UGZSOVB4OHRmb0haa0xadGo3cHdORjNwY0dIbkt1UjV0TWNWOHJyejVEQlVT?=
 =?utf-8?B?eDFFQ0lYVWgyRFV1dXpsVEZCc3pHTzBQK0lkc0ZCM0x4d2ZpZHZrdXpsZC9P?=
 =?utf-8?B?enRwL2JHZXlSdWV5Q0ZlelQ2RnhBd0tLWHhNUjBDSVZqZzVTVWtsVWlxY0gy?=
 =?utf-8?B?NkJETDRlTmoySmRYU1orTTIyQ2hJbFVPdSs1WUhqYWcxcTNsSlZISE9vaEVF?=
 =?utf-8?B?VFNnUStVNVdrWVF4RVRCcEFUNDF0WldVQXExZi9ibHkvSkdwWmk0ajNWUFFl?=
 =?utf-8?B?WUo1UXNFc29PaGgxSWdLSGRReENDZmpibXBmczRJTzc1N0pvRUltWUhJdTNG?=
 =?utf-8?B?L2hYTlAxL0IyOFBsSG50Q3BaaTBZbGlUTGluU3BoOTVEMzVIVktTaWFtd1J6?=
 =?utf-8?B?MDhMOE5uWFdXNDduWE14L1hJNVNhSFNrWWtXcWJPMzMzL2ZmbExMclBXb3FY?=
 =?utf-8?B?MnhTUXBZM1lWeXVMY3RxdnZ5Mk1rOTBET3Q1NFFscGtmbEtSVG55OHF0K3hm?=
 =?utf-8?Q?iesybaDvC9fOaPya93WNIj480E5QZ6D1fzLhI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2puN2FWU1JRaFYzWHNjYmFLRWh6aVk0M3pTVkUyUS9jZDE4QSt6ZUc2NDdL?=
 =?utf-8?B?ckR1Z1ZSWkxUT3QyL2dhc2pad0MrK21rcWZoVkJxSW9iMXFIcXNNMXZDL3F1?=
 =?utf-8?B?dDQwYmZXK0RrUjhtemxiNWlzVWVBcmtZZnQrSzNtcnNVS2R6QUJ3WUtuOFpG?=
 =?utf-8?B?TUpnT3F0b0lqbjh3NkxvaS9rZ2t5TEFQWlF4ZzRGblNvZ2EwcmtoRTQrY1cy?=
 =?utf-8?B?dHBsOHdPaG9WVXQwUjlZYXNtd2tHZ0RzaVFSczFSL1NTM205TUE0Z2lSV0Ra?=
 =?utf-8?B?ZGZEK2RmaVJXTnFNQlVONm9rTTdMbEVmT2xjc3VvK3EzOUp5TzUzazRvOW01?=
 =?utf-8?B?QTJjVU9idzNFZER6QWk3dzZBQUYwYlFrb3FxNllkd0hXbWpIV0xEV09QcjRQ?=
 =?utf-8?B?d3IzT25wWFhyeUFKa0ZDem9oVVhMVHVhTnNSMnpmVUlJUW1Oc25lS2d5dnVT?=
 =?utf-8?B?V1VFUXRBdTFHMWNGVFZaMGUxM0h1dzRONW1BeFlUN0N1TWJISklQNi9RVnZH?=
 =?utf-8?B?NWlyUG95bnJNU1ltSDZYanU4SmdqbGxjc0tLU1hHdEsxb2ZnTHEvYnhVYk0z?=
 =?utf-8?B?RHdsVHhCdnlXdXV4TEh0SXo2L1NuY3FrTmNONFdaNkorcGVqZnpoeWlzN2Y3?=
 =?utf-8?B?VjlyZFZXRDU4bGNwellkV293TUwxNTVVRXdHZ2JQR0JxcE83a0hoWVlvSmdt?=
 =?utf-8?B?d0t6Z0dTUFRNWWZieWpVUkFyS3BGM29hZ1hIcGVYdW5valJNNGgvdkliRUcy?=
 =?utf-8?B?TVFWeDNMTGlxMTl5K2FCc3U3UjZyc21tdjJBTU5oeXNsaXpCZkxPeThHR29X?=
 =?utf-8?B?UW91YTlCN3JyOGp4RSt6REJHUGN3QWp3RUxBc3lhM3ZnZ2RqWmhybXdpT3c5?=
 =?utf-8?B?TjFuek1rMTBiVmdIQ0F1eWN2bGhjYlFSbkk5THZlYnplRFFZSXkrTnE3REpj?=
 =?utf-8?B?SVY4Y3ZkY25tTTIzRGZwV0FXeEZ3WXR4Sk9TNllWbU5OSjVpSmFqYWQyOUhH?=
 =?utf-8?B?K2x5dnJ6VmNxU25kN0NTMVVvdk1sQjMwZC9zNlFKbnFwL0xKRWtXaFBvK0hq?=
 =?utf-8?B?NFNxaEU5U2QvN3Q1SmtENlRyLzNIcTNsVnhtTnExKzNwKzhYbmVDZHVZS0ht?=
 =?utf-8?B?bjE2Q2N2Y2V4RWdDS095Q0VyQWNid2E2RGVrOHJLZmVGN0pXUHVNKzVBNUpt?=
 =?utf-8?B?ek1zMVVJK3V3Y1FEZStuMEZGdmZJM2ZFMW5zWjlSV0RNQ0VzOUFwbWtpZksz?=
 =?utf-8?B?S2JuL2hTRFlzZHFQNXB1MkhkK1pWSW5Td3hmNHd5clRTQmtKaTlXdjF6RWw4?=
 =?utf-8?B?cjd3QktkSkFsVlRsMG80WU53QlNIeFFoU2h6Q2l1U2taekpWZk1EQ2FIY2JH?=
 =?utf-8?B?WEZJWHdFUGYxZ1VRbjNFQ2cwM2R2WGZ3cnE4RmhGSEhpMVBuS0svNXVmVkpC?=
 =?utf-8?B?N042UzdWME9yN3NxVUt0OGFPWHN1Y2tJV2IvTzdvQUFDcFJtTWk4bDN0NitF?=
 =?utf-8?B?RHp2L1VPcVpVZ1pBVTdUNXd6b2FvMFdyZG5BcCtzdEM4aXhTM1B4SW91V2pk?=
 =?utf-8?B?eFhlZnhxN0dGT3hNVWhnQ2ZCUERnazhxV0U1eHMya3JPUkRYRUxLR0VjSEVY?=
 =?utf-8?B?YXlEWjUxamdicUtUbTk2anBUc3dzZlE5QlhMampFL0x4WEtrbC8xZzhYWUhT?=
 =?utf-8?B?NTVzaFZOaGh0VHVUb3Y2UFpveXBoTW1uLytkYnVJM1BhbTZkblhGWXh5U2V5?=
 =?utf-8?B?NWdmOHpMZm5UMllTZ0dNY2FSN0VvV0J4MThMNldpV0w5VTU2V1JzM1dOeU0y?=
 =?utf-8?B?anppZEJKN1dTV0x6KzNZejFFYzZ0RHNzSnpHSVAzSGpoUkdqTk1ORGNSRUg1?=
 =?utf-8?B?dXoycVpKQXRoZW5FcTAvdGI0aERoMmJsRTZPQU1pK05UN1QyMGlpeEE3TjRC?=
 =?utf-8?B?SVVKc1BINkdta0paWnhQVU9TS0lkVWhpZXdmeXVHR0d3YnRNamsybDhvdU1l?=
 =?utf-8?B?MEZVeHgzMkY2dVB0Z3JUN2pmdkFpQVY0NnV6eHErWG1VaWZWbzRYaVptTDgx?=
 =?utf-8?B?VXQ1citwTkdXWDA2c2ZaN1lOWVU3UnJhWFd6S1I5dUNGc1VpeXhXUW12QWdl?=
 =?utf-8?Q?hijVZFixfEd5pAXqOyuFfLezC?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48332f65-490d-4e03-8d22-08dcb08bd46f
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 11:36:19.2305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEoVIuXYml8F6/PTh+TJXpVJTk6f2b05WNJeCgmJ2+Hm2T1upEO/LQsrrR+wPfq2KJE6BLDm2dDDicUPxE/GjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5961
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


在 2024/7/30 18:43, Christian König 写道:
> Am 30.07.24 um 10:46 schrieb Huan Yang:
>>
>> 在 2024/7/30 16:37, Christian König 写道:
>>> Am 30.07.24 um 10:14 schrieb Huan Yang:
>>>> 在 2024/7/30 16:03, Christian König 写道:
>>>>> Am 30.07.24 um 09:57 schrieb Huan Yang:
>>>>>> Background
>>>>>> ====
>>>>>> Some user may need load file into dma-buf, current way is:
>>>>>>    1. allocate a dma-buf, get dma-buf fd
>>>>>>    2. mmap dma-buf fd into user vaddr
>>>>>>    3. read(file_fd, vaddr, fsz)
>>>>>> Due to dma-buf user map can't support direct I/O[1], the file read
>>>>>> must be buffer I/O.
>>>>>>
>>>>>> This means that during the process of reading the file into dma-buf,
>>>>>> page cache needs to be generated, and the corresponding content 
>>>>>> needs to
>>>>>> be first copied to the page cache before being copied to the 
>>>>>> dma-buf.
>>>>>>
>>>>>> This way worked well when reading relatively small files before, as
>>>>>> the page cache can cache the file content, thus improving 
>>>>>> performance.
>>>>>>
>>>>>> However, there are new challenges currently, especially as AI 
>>>>>> models are
>>>>>> becoming larger and need to be shared between DMA devices and the 
>>>>>> CPU
>>>>>> via dma-buf.
>>>>>>
>>>>>> For example, our 7B model file size is around 3.4GB. Using the
>>>>>> previous would mean generating a total of 3.4GB of page cache
>>>>>> (even if it will be reclaimed), and also requiring the copying of 
>>>>>> 3.4GB
>>>>>> of content between page cache and dma-buf.
>>>>>>
>>>>>> Due to the limited resources of system memory, files in the 
>>>>>> gigabyte range
>>>>>> cannot persist in memory indefinitely, so this portion of page 
>>>>>> cache may
>>>>>> not provide much assistance for subsequent reads. Additionally, the
>>>>>> existence of page cache will consume additional system resources 
>>>>>> due to
>>>>>> the extra copying required by the CPU.
>>>>>>
>>>>>> Therefore, I think it is necessary for dma-buf to support direct 
>>>>>> I/O.
>>>>>>
>>>>>> However, direct I/O file reads cannot be performed using the buffer
>>>>>> mmaped by the user space for the dma-buf.[1]
>>>>>>
>>>>>> Here are some discussions on implementing direct I/O using dma-buf:
>>>>>>
>>>>>> mmap[1]
>>>>>> ---
>>>>>> dma-buf never support user map vaddr use of direct I/O.
>>>>>>
>>>>>> udmabuf[2]
>>>>>> ---
>>>>>> Currently, udmabuf can use the memfd method to read files into
>>>>>> dma-buf in direct I/O mode.
>>>>>>
>>>>>> However, if the size is large, the current udmabuf needs to 
>>>>>> adjust the
>>>>>> corresponding size_limit(default 64MB).
>>>>>> But using udmabuf for files at the 3GB level is not a very good 
>>>>>> approach.
>>>>>> It needs to make some adjustments internally to handle this.[3] 
>>>>>> Or else,
>>>>>> fail create.
>>>>>>
>>>>>> But, it is indeed a viable way to enable dma-buf to support 
>>>>>> direct I/O.
>>>>>> However, it is necessary to initiate the file read after the 
>>>>>> memory allocation
>>>>>> is completed, and handle race conditions carefully.
>>>>>>
>>>>>> sendfile/splice[4]
>>>>>> ---
>>>>>> Another way to enable dma-buf to support direct I/O is by 
>>>>>> implementing
>>>>>> splice_write/write_iter in the dma-buf file operations (fops) to 
>>>>>> adapt
>>>>>> to the sendfile method.
>>>>>> However, the current sendfile/splice calls are based on pipe. 
>>>>>> When using
>>>>>> direct I/O to read a file, the content needs to be copied to the 
>>>>>> buffer
>>>>>> allocated by the pipe (default 64KB), and then the dma-buf fops'
>>>>>> splice_write needs to be called to write the content into the 
>>>>>> dma-buf.
>>>>>> This approach requires serially reading the content of file pipe 
>>>>>> size
>>>>>> into the pipe buffer and then waiting for the dma-buf to be written
>>>>>> before reading the next one.(The I/O performance is relatively weak
>>>>>> under direct I/O.)
>>>>>> Moreover, due to the existence of the pipe buffer, even when using
>>>>>> direct I/O and not needing to generate additional page cache,
>>>>>> there still needs to be a CPU copy.
>>>>>>
>>>>>> copy_file_range[5]
>>>>>> ---
>>>>>> Consider of copy_file_range, It only supports copying files 
>>>>>> within the
>>>>>> same file system. Similarly, it is not very practical.
>>>>>>
>>>>>>
>>>>>> So, currently, there is no particularly suitable solution on VFS to
>>>>>> allow dma-buf to support direct I/O for large file reads.
>>>>>>
>>>>>> This patchset provides an idea to complete file reads when 
>>>>>> requesting a
>>>>>> dma-buf.
>>>>>>
>>>>>> Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
>>>>>> ===
>>>>>> This patch provides a method to immediately read the file content 
>>>>>> after
>>>>>> the dma-buf is allocated, and only returns the dma-buf file 
>>>>>> descriptor
>>>>>> after the file is fully read.
>>>>>>
>>>>>> Since the dma-buf file descriptor is not returned, no other 
>>>>>> thread can
>>>>>> access it except for the current thread, so we don't need to 
>>>>>> worry about
>>>>>> race conditions.
>>>>>
>>>>> That is a completely false assumption.
>>>> Can you provide a detailed explanation as to why this assumption is 
>>>> incorrect? thanks.
>>>
>>> File descriptors can be guessed and is available to userspace as 
>>> soon as dma_buf_fd() is called.
>>>
>>> What could potentially work is to call system_heap_allocate() 
>>> without calling dma_buf_fd(), but I'm not sure if you can then make 
>>> I/O to the underlying pages.
>>
>> Actually, the dma-buf file descriptor is obtained only after a 
>> successful file read in the code, so there is no issue.
>>
>> If you are interested, you can take a look at the 
>> dma_heap_buffer_alloc_and_read function in patch1.
>>
>>>
>>>>>
>>>>>>
>>>>>> Map the dma-buf to the vmalloc area and initiate file reads in 
>>>>>> kernel
>>>>>> space, supporting both buffer I/O and direct I/O.
>>>>>>
>>>>>> This patch adds the DMA_HEAP_ALLOC_AND_READ heap_flag for user.
>>>>>> When a user needs to allocate a dma-buf and read a file, they should
>>>>>> pass this heap flag. As the size of the file being read is fixed, 
>>>>>> there is no
>>>>>> need to pass the 'len' parameter. Instead, The file_fd needs to 
>>>>>> be passed to
>>>>>> indicate to the kernel the file that needs to be read.
>>>>>>
>>>>>> The file open flag determines the mode of file reading.
>>>>>> But, please note that if direct I/O(O_DIRECT) is needed to read 
>>>>>> the file,
>>>>>> the file size must be page aligned. (with patch 2-5, no need)
>>>>>>
>>>>>> Therefore, for the user, len and file_fd are mutually exclusive,
>>>>>> and they are combined using a union.
>>>>>>
>>>>>> Once the user obtains the dma-buf fd, the dma-buf directly 
>>>>>> contains the
>>>>>> file content.
>>>>>
>>>>> And I'm repeating myself, but this is a complete NAK from my side 
>>>>> to this approach.
>>>>>
>>>>> We pointed out multiple ways of how to implement this cleanly and 
>>>>> not by hacking functionality into the kernel which absolutely 
>>>>> doesn't belong there.
>>>> In this patchset, I have provided performance comparisons of each 
>>>> of these methods.  Can you please provide more opinions?
>>>
>>> Either drop the whole approach or change udmabuf to do what you want 
>>> to do.
>> OK, if so, do I need to send a patch to make dma-buf support sendfile?
>
> Well the udmabuf approach doesn't need to use sendfile, so no.

Get it, I'll not send again.

About udmabuf, I test find it can't support larget find read due to page 
array alloc.

I already upload this patch, but do not recive answer.

https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/

Is there anything wrong with my understanding of it?

>
> Regards,
> Christian.
>
>>
>>>
>>> Apart from that I don't see a doable way which can be accepted into 
>>> the kernel.
>> Thanks for your suggestion.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> Patch 1 implement it.
>>>>>>
>>>>>> Patch 2-5 provides an approach for performance improvement.
>>>>>>
>>>>>> The DMA_HEAP_ALLOC_AND_READ_FILE heap flag patch enables us to
>>>>>> synchronously read files using direct I/O.
>>>>>>
>>>>>> This approach helps to save CPU copying and avoid a certain 
>>>>>> degree of
>>>>>> memory thrashing (page cache generation and reclamation)
>>>>>>
>>>>>> When dealing with large file sizes, the benefits of this approach 
>>>>>> become
>>>>>> particularly significant.
>>>>>>
>>>>>> However, there are currently some methods that can improve 
>>>>>> performance,
>>>>>> not just save system resources:
>>>>>>
>>>>>> Due to the large file size, for example, a AI 7B model of around 
>>>>>> 3.4GB, the
>>>>>> time taken to allocate DMA-BUF memory will be relatively long. 
>>>>>> Waiting
>>>>>> for the allocation to complete before reading the file will add 
>>>>>> to the
>>>>>> overall time consumption. Therefore, the total time for DMA-BUF
>>>>>> allocation and file read can be calculated using the formula
>>>>>>     T(total) = T(alloc) + T(I/O)
>>>>>>
>>>>>> However, if we change our approach, we don't necessarily need to 
>>>>>> wait
>>>>>> for the DMA-BUF allocation to complete before initiating I/O. In 
>>>>>> fact,
>>>>>> during the allocation process, we already hold a portion of the 
>>>>>> page,
>>>>>> which means that waiting for subsequent page allocations to complete
>>>>>> before carrying out file reads is actually unfair to the pages 
>>>>>> that have
>>>>>> already been allocated.
>>>>>>
>>>>>> The allocation of pages is sequential, and the reading of the 
>>>>>> file is
>>>>>> also sequential, with the content and size corresponding to the 
>>>>>> file.
>>>>>> This means that the memory location for each page, which holds the
>>>>>> content of a specific position in the file, can be determined at the
>>>>>> time of allocation.
>>>>>>
>>>>>> However, to fully leverage I/O performance, it is best to wait and
>>>>>> gather a certain number of pages before initiating batch processing.
>>>>>>
>>>>>> The default gather size is 128MB. So, ever gathered can see as a 
>>>>>> file read
>>>>>> work, it maps the gather page to the vmalloc area to obtain a 
>>>>>> continuous
>>>>>> virtual address, which is used as a buffer to store the contents 
>>>>>> of the
>>>>>> corresponding file. So, if using direct I/O to read a file, the file
>>>>>> content will be written directly to the corresponding dma-buf 
>>>>>> buffer memory
>>>>>> without any additional copying.(compare to pipe buffer.)
>>>>>>
>>>>>> Consider other ways to read into dma-buf. If we assume reading 
>>>>>> after mmap
>>>>>> dma-buf, we need to map the pages of the dma-buf to the user virtual
>>>>>> address space. Also, udmabuf memfd need do this operations too.
>>>>>> Even if we support sendfile, the file copy also need buffer, you 
>>>>>> must
>>>>>> setup it.
>>>>>> So, mapping pages to the vmalloc area does not incur any additional
>>>>>> performance overhead compared to other methods.[6]
>>>>>>
>>>>>> Certainly, the administrator can also modify the gather size 
>>>>>> through patch5.
>>>>>>
>>>>>> The formula for the time taken for system_heap buffer allocation and
>>>>>> file reading through async_read is as follows:
>>>>>>
>>>>>>    T(total) = T(first gather page) + Max(T(remain alloc), T(I/O))
>>>>>>
>>>>>> Compared to the synchronous read:
>>>>>>    T(total) = T(alloc) + T(I/O)
>>>>>>
>>>>>> If the allocation time or I/O time is long, the time difference 
>>>>>> will be
>>>>>> covered by the maximum value between the allocation and I/O. The 
>>>>>> other
>>>>>> party will be concealed.
>>>>>>
>>>>>> Therefore, the larger the size of the file that needs to be read, 
>>>>>> the
>>>>>> greater the corresponding benefits will be.
>>>>>>
>>>>>> How to use
>>>>>> ===
>>>>>> Consider the current pathway for loading model files into DMA-BUF:
>>>>>>    1. open dma-heap, get heap fd
>>>>>>    2. open file, get file_fd(can't use O_DIRECT)
>>>>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>>>>    4. mmap dma-buf fd, get vaddr
>>>>>>    5. read(file_fd, vaddr, file_size) into dma-buf pages
>>>>>>    6. share, attach, whatever you want
>>>>>>
>>>>>> Use DMA_HEAP_ALLOC_AND_READ_FILE JUST a little change:
>>>>>>    1. open dma-heap, get heap fd
>>>>>>    2. open file, get file_fd(buffer/direct)
>>>>>>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap 
>>>>>> flag, set file_fd
>>>>>>       instead of len. get dma-buf fd(contains file content)
>>>>>>    4. share, attach, whatever you want
>>>>>>
>>>>>> So, test it is easy.
>>>>>>
>>>>>> How to test
>>>>>> ===
>>>>>> The performance comparison will be conducted for the following 
>>>>>> scenarios:
>>>>>>    1. normal
>>>>>>    2. udmabuf with [3] patch
>>>>>>    3. sendfile
>>>>>>    4. only patch 1
>>>>>>    5. patch1 - patch4.
>>>>>>
>>>>>> normal:
>>>>>>    1. open dma-heap, get heap fd
>>>>>>    2. open file, get file_fd(can't use O_DIRECT)
>>>>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>>>>    4. mmap dma-buf fd, get vaddr
>>>>>>    5. read(file_fd, vaddr, file_size) into dma-buf pages
>>>>>>    6. share, attach, whatever you want
>>>>>>
>>>>>> UDMA-BUF step:
>>>>>>    1. memfd_create
>>>>>>    2. open file(buffer/direct)
>>>>>>    3. udmabuf create
>>>>>>    4. mmap memfd
>>>>>>    5. read file into memfd vaddr
>>>>>>
>>>>>> Sendfile step(need suit splice_write/write_iter, just use to 
>>>>>> compare):
>>>>>>    1. open dma-heap, get heap fd
>>>>>>    2. open file, get file_fd(buffer/direct)
>>>>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>>>>    4. sendfile file_fd to dma-buf fd
>>>>>>    6. share, attach, whatever you want
>>>>>>
>>>>>> patch1/patch1-4:
>>>>>>    1. open dma-heap, get heap fd
>>>>>>    2. open file, get file_fd(buffer/direct)
>>>>>>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap 
>>>>>> flag, set file_fd
>>>>>>       instead of len. get dma-buf fd(contains file content)
>>>>>>    4. share, attach, whatever you want
>>>>>>
>>>>>> You can create a file to test it. Compare the performance gap 
>>>>>> between the two.
>>>>>> It is best to compare the differences in file size from KB to MB 
>>>>>> to GB.
>>>>>>
>>>>>> The following test data will compare the performance differences 
>>>>>> between 512KB,
>>>>>> 8MB, 1GB, and 3GB under various scenarios.
>>>>>>
>>>>>> Performance Test
>>>>>> ===
>>>>>>    12G RAM phone
>>>>>>    UFS4.0(the maximum speed is 4GB/s. ),
>>>>>>    f2fs
>>>>>>    kernel 6.1 with patch[7] (or else, can't support kvec direct 
>>>>>> I/O read.)
>>>>>>    no memory pressure.
>>>>>>    drop_cache is used for each test.
>>>>>>
>>>>>> The average of 5 test results:
>>>>>> | scheme-size         | 512KB(ns)  | 8MB(ns)    | 1GB(ns) | 
>>>>>> 3GB(ns)       |
>>>>>> | ------------------- | ---------- | ---------- | ------------- | 
>>>>>> ------------- |
>>>>>> | normal              | 2,790,861  | 14,535,784 | 1,520,790,492 | 
>>>>>> 3,332,438,754 |
>>>>>> | udmabuf buffer I/O  | 1,704,046  | 11,313,476 | 821,348,000 | 
>>>>>> 2,108,419,923 |
>>>>>> | sendfile buffer I/O | 3,261,261  | 12,112,292 | 1,565,939,938 | 
>>>>>> 3,062,052,984 |
>>>>>> | patch1-4 buffer I/O | 2,064,538  | 10,771,474 | 986,338,800 | 
>>>>>> 2,187,570,861 |
>>>>>> | sendfile direct I/O | 12,844,231 | 37,883,938 | 5,110,299,184 | 
>>>>>> 9,777,661,077 |
>>>>>> | patch1 direct I/O   | 813,215    | 6,962,092  | 2,364,211,877 | 
>>>>>> 5,648,897,554 |
>>>>>> | udmabuf direct I/O  | 1,289,554  | 8,968,138  | 921,480,784 | 
>>>>>> 2,158,305,738 |
>>>>>> | patch1-4 direct I/O | 1,957,661  | 6,581,999  | 520,003,538 | 
>>>>>> 1,400,006,107 |
>>>>
>>>> With this test, sendfile can't give a good help base on pipe buffer.
>>>>
>>>> udmabuf is good, but I think our oem driver can't suit it. (And, 
>>>> AOSP do not open this feature)
>>>>
>>>>
>>>> Anyway, I am sending this patchset in the hope of further discussion.
>>>>
>>>> Thanks.
>>>>
>>>>>>
>>>>>> So, based on the test results:
>>>>>>
>>>>>> When the file is large, the patchset has the highest performance.
>>>>>> Compared to normal, patchset is a 50% improvement;
>>>>>> Compared to normal, patch1 only showed a degradation of 41%.
>>>>>> patch1 typical performance breakdown is as follows:
>>>>>>    1. alloc cost 188,802,693 ns
>>>>>>    2. vmap cost 42,491,385 ns
>>>>>>    3. file read cost 4,180,876,702 ns
>>>>>> Therefore, directly performing a single direct I/O read on a 
>>>>>> large file
>>>>>> may not be the most optimal way for performance.
>>>>>>
>>>>>> The performance of direct I/O implemented by the sendfile method 
>>>>>> is the worst.
>>>>>>
>>>>>> When file size is small, The difference in performance is not
>>>>>> significant. This is consistent with expectations.
>>>>>>
>>>>>>
>>>>>>
>>>>>> Suggested use cases
>>>>>> ===
>>>>>>    1. When there is a need to read large files and system 
>>>>>> resources are scarce,
>>>>>>       especially when the size of memory is limited.(GB level) In 
>>>>>> this
>>>>>>       scenario, using direct I/O for file reading can even bring 
>>>>>> performance
>>>>>>       improvements.(may need patch2-3)
>>>>>>    2. For embedded devices with limited RAM, using direct I/O can 
>>>>>> save system
>>>>>>       resources and avoid unnecessary data copying. Therefore, 
>>>>>> even if the
>>>>>>       performance is lower when read small file, it can still be 
>>>>>> used
>>>>>>       effectively.
>>>>>>    3. If there is sufficient memory, pinning the page cache of 
>>>>>> the model files
>>>>>>       in memory and placing file in the EROFS file system for 
>>>>>> read-only access
>>>>>>       maybe better.(EROFS do not support direct I/O)
>>>>>>
>>>>>>
>>>>>> Changlog
>>>>>> ===
>>>>>>   v1 [8]
>>>>>>   v1->v2:
>>>>>>     Uses the heap flag method for alloc and read instead of 
>>>>>> adding a new
>>>>>>     DMA-buf ioctl command. [9]
>>>>>>     Split the patchset to facilitate review and test.
>>>>>>       patch 1 implement alloc and read, offer heap flag into it.
>>>>>>       patch 2-4 offer async read
>>>>>>       patch 5 can change gather limit.
>>>>>>
>>>>>> Reference
>>>>>> ===
>>>>>> [1] 
>>>>>> https://lore.kernel.org/all/0393cf47-3fa2-4e32-8b3d-d5d5bdece298@amd.com/
>>>>>> [2] 
>>>>>> https://lore.kernel.org/all/ZpTnzkdolpEwFbtu@phenom.ffwll.local/
>>>>>> [3] 
>>>>>> https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/
>>>>>> [4] 
>>>>>> https://lore.kernel.org/all/Zpf5R7fRZZmEwVuR@infradead.org/
>>>>>> [5] 
>>>>>> https://lore.kernel.org/all/ZpiHKY2pGiBuEq4z@infradead.org/
>>>>>> [6] 
>>>>>> https://lore.kernel.org/all/9b70db2e-e562-4771-be6b-1fa8df19e356@amd.com/
>>>>>> [7] 
>>>>>> https://patchew.org/linux/20230209102954.528942-1-dhowells@redhat.com/20230209102954.528942-7-dhowells@redhat.com/
>>>>>> [8] 
>>>>>> https://lore.kernel.org/all/20240711074221.459589-1-link@vivo.com/
>>>>>> [9] 
>>>>>> https://lore.kernel.org/all/5ccbe705-883c-4651-9e66-6b452c414c74@amd.com/
>>>>>>
>>>>>> Huan Yang (5):
>>>>>>    dma-buf: heaps: Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
>>>>>>    dma-buf: heaps: Introduce async alloc read ops
>>>>>>    dma-buf: heaps: support alloc async read file
>>>>>>    dma-buf: heaps: system_heap alloc support async read
>>>>>>    dma-buf: heaps: configurable async read gather limit
>>>>>>
>>>>>>   drivers/dma-buf/dma-heap.c          | 552 
>>>>>> +++++++++++++++++++++++++++-
>>>>>>   drivers/dma-buf/heaps/system_heap.c |  70 +++-
>>>>>>   include/linux/dma-heap.h            |  53 ++-
>>>>>>   include/uapi/linux/dma-heap.h       |  11 +-
>>>>>>   4 files changed, 673 insertions(+), 13 deletions(-)
>>>>>>
>>>>>>
>>>>>> base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
>>>>>
>>>
>
