Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F039D940C1A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 10:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888CA10E4F9;
	Tue, 30 Jul 2024 08:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="FrKVCnx6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2060.outbound.protection.outlook.com [40.107.255.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BBA10E244
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 08:46:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHLALIENhxY2xf9dZ1OXqUhVBKVTJkRkKAzzLtGdcPgzvdcjAYbw8IYSmW8QE9NweYvxzWZC3fDEsWbX2ADGRs5AApo8B4laLHSc5BoSVgUsLi8xsyFxA1V0BuNXr+TUSUfvhylUW6I5Cp3cmF96CjI1Tywubz2tHZCTuU3suztX9B02cNlIGder9IOCn/nZnVVXXULhnCj1czsDX4EA5MmnmwL6XQKQF13l2ZHV1T0eQOAS0J/gv1TPbOzsIXOMHRy+XLdnjOzBxJ3ZlO2Peaq4Owu++6LbX5pn36RxnQl/d7yQkwjVW8fOV/R/6pesVryzsAOjXkDu12F+6wyBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nuTkHjITNIsdY0VLejZZFvvF58vybvloAHisOylvt0=;
 b=xzZ1BpUaf9agobeOg9WrS7a1qWCEtaSsj6IlnYBHUNQlY0o5Oz0qWWwlZb5bt6Jc2Z+ol0h/hiJA6zg9ItYxk1feEKA67fgM62a6FK/xmwiETURc2U2oLKAsDI7gFv4K2cgDaWxt6RzpZG79n30jDg9RY14DbzVglKvQbMAsYcjb69zUwA0OjrvcEPan2XYWsE5gpr7qtbDNRgVHOlBp+87EF4ue35dnFPiGxLA1WrQWiGFdlSKEmcGudOkeaw2uYlJQMAf0ONPywcbro8hPlFX5LsP9sRjiF8yREpStwUxhgfhVK3CB9sork+4aUCFqcOaOqFyGt1Rf11lA5dBoag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nuTkHjITNIsdY0VLejZZFvvF58vybvloAHisOylvt0=;
 b=FrKVCnx6xPUW5Y2pBXid9bIFhYGA128B6UWW+92v0YNDaCA2/iS6p92M/TKcARI1s3cTdpnuVVzUrFfzZVUIemvt9UOWftQ1YFsLAjBGb6C5pBFt0WcG55aquW9h1sWpYhAhjoBXqDtz41Gl6KMxtjyGF40HaHoSVo11bNr1nY6awTAHxmBXQRUjt+ridOo2k0EiTmFC1t4n/7O6Y1tYx+pSx4uk79yIZRJbe4/QkJyutjEgIFf95gkZBlcUl6h7jTnJiGl7NMGokgmYCDzEzPPsPr9bdcEG4/ZctKwYx7jHDSpkWFHPhnpUftAmkHZVlHAH12351mhDxSqrzYQ7gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SI6PR06MB7217.apcprd06.prod.outlook.com (2603:1096:4:24f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 08:46:22 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 08:46:21 +0000
Message-ID: <79b51a8f-9c28-488b-9be7-b5ce715aa1f2@vivo.com>
Date: Tue, 30 Jul 2024 16:46:17 +0800
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
From: Huan Yang <link@vivo.com>
In-Reply-To: <d5d7674b-eab3-465b-97eb-e33bdbecd7c0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0110.apcprd03.prod.outlook.com
 (2603:1096:4:91::14) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SI6PR06MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: 48029149-1a0c-428b-06ce-08dcb07415f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlFPOFA2MHBRWStHQ2xSN1ZJVEFPZEtTaHYvMXM2RzJNaXFtRmVrRTFDV2lJ?=
 =?utf-8?B?ZU9LUUxETzE0U0dOSzkvTlJCZGNWb1lFcENiMlY2NU5rY0htbmxwTXV2aFVV?=
 =?utf-8?B?Q241WkZGTUtNdjV4K1RyMW1uQ3QxNmdzWlArVnlVQ1hORE14N0FQTXpCRjVW?=
 =?utf-8?B?c0Q1ZzcxQ1Qyb0tvQU1NZkJaYXJOTG45YVVZRUNxL3VQVW9Ba2hKeE4zeVFk?=
 =?utf-8?B?TmFpcWNkMXM3V3NROVRVVUtkWnRKN0M1K2ZMUmdoNkF1aFdVZWZ6bHcxL21z?=
 =?utf-8?B?RFEwK3I2c1VvVmtMdHEwZ1g4TGRNdlppZ3JCajFjRlloREFURDhXQU9sck1E?=
 =?utf-8?B?ZWl5ZXZlSFI2OUtDT2lQeEM2WjJmZ25iUndqY0RYSnhUbTdSTnBUcWFpQ0p1?=
 =?utf-8?B?eTA1VGdPOUR4VlpuMFBKbDBmNERvM1lMNUFHS3JRLzVBdjhtVFo4K0NoTnZa?=
 =?utf-8?B?dit4Wm9ScG52bldPMVg1d29qMVhWN25GTi9tZmswUmt2L2thaHNGaUl3bGYz?=
 =?utf-8?B?dDZtalRvWXFRQkNyQktQMURUMExvSURtbmF4aEp3M0pIZ0xBejcyekV3QWF6?=
 =?utf-8?B?RGpVT2lYc0F0L2orU08xK1NiS1REVU04WUJpSHdCaFlPd05McDdPUFZTRWM1?=
 =?utf-8?B?bTh1RlpyVkJPNmU5Mi9vUmpyT3U4YVhoVGdSbUM4MjB0R3d2eUk4TzBNeHd4?=
 =?utf-8?B?Sm9kV3JoMXhvV015aFJFeGdTRVE2WWJMQXBzbEU4Y2ZYbHpDRTRId3QzZml5?=
 =?utf-8?B?NkJya2lKclNaekR2QWgyekZIdjVhc0tQUm0xMGl4c1ZxODA3Z3psSW41UUpC?=
 =?utf-8?B?WndlSnk4Qzc5TXhLVk9ZTzdvb3hSTmVpV2tyemk3emVrUnpxcm9oUTFnQ21v?=
 =?utf-8?B?RWV4SjlvWjBmUDZZcCtONXNOdEdHM3hEazVQUmZnWTNjbTRJVG05NGMweWIw?=
 =?utf-8?B?dFV6RkJVYXhocmZKbVdiMjZFcHNCWExQeUhJajhnYWpuVUdkZ21QMmlJZXNq?=
 =?utf-8?B?eUlmUlFqZHdnRXlrRElneFQ5elZ6S2JjWnBwWnRRMHl1RUJtTXZJK2hreUsx?=
 =?utf-8?B?YTBiKytrTlNCOUZ5MGVGaE5wSE9ya3VEV3VSelltUHhtbWVDVG5zRzZXY0g2?=
 =?utf-8?B?aVQzWk41cmFHMHg3ZG80TlZJdzlOZjNMR1RNZUVWSkJONlduREZqblg4a2lL?=
 =?utf-8?B?UUxRdnNEaVVhRjl0SXM1OHRQRDVsOEh3a2p0WURJSUw1ZFRyS3NSd1hzY3dD?=
 =?utf-8?B?THBEK1U2Z3pBeUpUdlI0WlRKVE9FaUQ5YTk1dmxKeStIZDRuNmRBaHUrVWhV?=
 =?utf-8?B?WFFTSU15TGx0bHN4YUpuVDJCdWdzOXgyRlVIMDErVC83QjdRNWhaY0ZZRklo?=
 =?utf-8?B?V3AwWHQzK1JMVThodzRwODJQQnBYanhEUGRmakNpdmVYYmk0ZUZZYlVwcitw?=
 =?utf-8?B?cFhxem5uSk9nU2wyZEUvbzdzZndTVnNDYkt5TnJUZmlpVnZnSWRqS3o0Z3E4?=
 =?utf-8?B?ZzBKdGo4b01mZ3FwZUo0T2czSmwwYy9sUzJxT2xvN1Q0UjBrM1l6dS9EN2xw?=
 =?utf-8?B?TExrVDc3QTIyWEF2UjdNTDBRRVJtS0RxelZpaGZGbDV2cmNIZW94c3hqM212?=
 =?utf-8?B?dXd1Q2krSFhSOGlzL1Bnd3ZRZW1odUpvVVkrQmJSVHBJamg5cDBiTTZNbmMw?=
 =?utf-8?B?RlpnWVZ1K05jTUk1bzRHTGt6Z3h2TUw1YzBOOExxbTZZWWZHTDdlYWNqWHdI?=
 =?utf-8?B?K1Vkc1RiM1EyU1phc2JteXgyZ3J6VWk4MnBzcXRzdVk2RGdzVHRJLzZPczhr?=
 =?utf-8?Q?Az9AFbaBiBXhh3RVlzvBY5y0lGWTdEjwmvdPI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2gvYWdIT0dxS3B6U1VyM1VxWTBjMjFySyt4ZXJSNFJ0aXhWbTlhU2tWS3J6?=
 =?utf-8?B?dEFEb0NYNGxWRmdEY2NsWUg2YzNJTEJ3OC9QUmpENWExeXhsLzZ4Ylc5ZGRz?=
 =?utf-8?B?cGUydUVkMmc1Nmh4d3dUY05GSzBjZmh0M29YZ1RjcTM2NlZvNXpBUDNLdHhO?=
 =?utf-8?B?YVFvczErKzdJT0ZzR1Rta0FzVDRteGdMNVFieTlvL0lZODlZSzNjaGJ4Kyty?=
 =?utf-8?B?RzNocHYzUDlTd0d3TnpsbkZRM29QbDNZdUJocm51aVdtNEhhWDlSS3FEOXlw?=
 =?utf-8?B?WWJLRERqa1pPYWc3dWJqSnljWmZOOEN1aVdwakZJc2JjYkVxS2kvU0dtb0Nx?=
 =?utf-8?B?QlREeXpZS3NLTmNVdG5mK0c2MUVjam81RS9veHlyd2N3T2NJVU81L0krK2dv?=
 =?utf-8?B?R2J2YngyR1JVNTFiRTNFalNacDhEOFBCNHNIZytEZ1hjSGtmZ0hvdlRESmFo?=
 =?utf-8?B?dElESStHaGVCczRNamFMeWsyRy80R25Hd1BnTWthdjZVWTR2WlgwbE9hQkt1?=
 =?utf-8?B?UjhYemluaWJNcHplYS9PQ0FKQzJSbjFWSE5kUnkxcEc4QkRtQjVaeTh3VkZa?=
 =?utf-8?B?Z1BLRW8wZVhLRGN2RXBMNjgzbWx4VEdaRHRzNXdFcTNtb3hlTG9WZEl0cy9E?=
 =?utf-8?B?dHpJaUhBMVZMWGExUy9lMUoxTkhOa2M2QjYxVDdtNWlPWmoybVp4REdOMkln?=
 =?utf-8?B?Zi9vY0xBd1BCZzVSMzRQN0N4NFRuS3BVbEozOE1lMFFwUzlKeHFzUk1kcEE4?=
 =?utf-8?B?T21BWlIxdFR5WmFQTVRSNEhwNGV0SHpCcXJKUWVxZG5paXVNR0RwVWp2N3Mz?=
 =?utf-8?B?UGVJZ2wxNm1PQ25ORkZFN3drVnIwMEt3OWlrV2cvZmRxbkc3S29mZmN1U09M?=
 =?utf-8?B?K3NyMko2NVFOQzBUMTEvZnNWbHdnUm5vUDRzTElpMldrRXdIVk1kVXVBb2Vn?=
 =?utf-8?B?ZmNTWFJ0ZWFYMGxVaGVNQ1RVclVuVUIyd1lOZFl2NkVZQTZsMy9oalFYRWsw?=
 =?utf-8?B?Z3lrZXVIS2NzaTVSTlZLVUx5c1dIdUEvNTEzUFpzYmtPd2tQZktVZWRQQnJW?=
 =?utf-8?B?OVNscXBVd2pyNnBIOVRMTTFMQ2R5b3I0OTliblVSb0Rza3FZSEN6cHJGc3gw?=
 =?utf-8?B?blZqbGd3eEZUKzRGYVFHTUdiUUFUUVN2ejI0OFg1eFk4S0k0dFYrZjZHdlNk?=
 =?utf-8?B?M0lYYks4RW5zUkFCUjVNalQ2SG9vam0xWjZDb0VOMnZUdWY4L0Nxa2RLWlhS?=
 =?utf-8?B?L0F0UjJwbUpRZDUwTWMzc1FSd1FNUDQyM2IvQXNiMFkrRUtIWXN6NVhDTUww?=
 =?utf-8?B?NXIzVGd4bi9YYzYvaEFzQXFpTWlOS0p5a0VkOFZadTVDQm9Jd2tUaEhRakIw?=
 =?utf-8?B?c3RQL2dkVGtlNXF4d3VJazBOVTFGbSsxZ0xsdU5PYlNGVjlqNmFmVHQzSThw?=
 =?utf-8?B?VG9aekFxU1pxZ2crVHpHRkFQTGtuUkxrNWJPL2FXMkh2UlhDSE1LbVE4SFJI?=
 =?utf-8?B?ZFdqZU9UMFc4cVJmc2o1N2pUMjNHVnN0RER5ODYvNWV4Wld3Mk51akJqOHps?=
 =?utf-8?B?bEhPVmlTcHFHclNFbm0zb1paMXQwMVdxWkVSQXYyWmsvZFdVajdBZ25ZWWx6?=
 =?utf-8?B?d0Z2UysxdmF3a3Rld3dSVDZrR044YkpFTnZqekgrVFRMdis5U2FaOHF0ZzAx?=
 =?utf-8?B?ZDh6cTArRlJUMFdMcUltY1ZoVlNqaVA2NVN3citCZ214N0R2ZWl6TWhhWUlM?=
 =?utf-8?B?QkJlY0lDMThOdXFaSUs1TE5BVFdmSEdacmw2d3BRQW9JUzZ0YlNycTlGc1NR?=
 =?utf-8?B?MnpSQ3gwTGZUWEpqUitPRXdqTW83aEtCZWhGd1pPbWM2aDZmZ2pDWFlxZFVs?=
 =?utf-8?B?b1lBZFBVMGl5YU1kWFdYdDJoWVgrUFFQYXBtWkhTbWRKRzQwcTBMVDlRV0Yw?=
 =?utf-8?B?Rno0MGtaZVd6eWNaYUpLRmNIQ29hazRGWGxWakc1elljclZhL0xpMVRGellq?=
 =?utf-8?B?U0hsZVY4TlA4TjlKNVdVdW5ybkpJZGNtdXRuVWZaN3JMNVNYUG1TWWQreXRy?=
 =?utf-8?B?a29PaDVtMExrRENGM2pnRUpCSmlJdm9UclY2dVBUd0QvajhHKzFMbkVVNFN1?=
 =?utf-8?Q?dSKhHx7yUrp1loUAt5h4BHDXr?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48029149-1a0c-428b-06ce-08dcb07415f2
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 08:46:21.2384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gu0cMs2Q4fPLaRKRYWABL05SB7Dy0/QtexMI9Y7Z/C/YxVAHomuYAGFdyV53mZT02Hgx3nrmUa5Wl/b6CQTWUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7217
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


在 2024/7/30 16:37, Christian König 写道:
> Am 30.07.24 um 10:14 schrieb Huan Yang:
>> 在 2024/7/30 16:03, Christian König 写道:
>>> Am 30.07.24 um 09:57 schrieb Huan Yang:
>>>> Background
>>>> ====
>>>> Some user may need load file into dma-buf, current way is:
>>>>    1. allocate a dma-buf, get dma-buf fd
>>>>    2. mmap dma-buf fd into user vaddr
>>>>    3. read(file_fd, vaddr, fsz)
>>>> Due to dma-buf user map can't support direct I/O[1], the file read
>>>> must be buffer I/O.
>>>>
>>>> This means that during the process of reading the file into dma-buf,
>>>> page cache needs to be generated, and the corresponding content 
>>>> needs to
>>>> be first copied to the page cache before being copied to the dma-buf.
>>>>
>>>> This way worked well when reading relatively small files before, as
>>>> the page cache can cache the file content, thus improving performance.
>>>>
>>>> However, there are new challenges currently, especially as AI 
>>>> models are
>>>> becoming larger and need to be shared between DMA devices and the CPU
>>>> via dma-buf.
>>>>
>>>> For example, our 7B model file size is around 3.4GB. Using the
>>>> previous would mean generating a total of 3.4GB of page cache
>>>> (even if it will be reclaimed), and also requiring the copying of 
>>>> 3.4GB
>>>> of content between page cache and dma-buf.
>>>>
>>>> Due to the limited resources of system memory, files in the 
>>>> gigabyte range
>>>> cannot persist in memory indefinitely, so this portion of page 
>>>> cache may
>>>> not provide much assistance for subsequent reads. Additionally, the
>>>> existence of page cache will consume additional system resources 
>>>> due to
>>>> the extra copying required by the CPU.
>>>>
>>>> Therefore, I think it is necessary for dma-buf to support direct I/O.
>>>>
>>>> However, direct I/O file reads cannot be performed using the buffer
>>>> mmaped by the user space for the dma-buf.[1]
>>>>
>>>> Here are some discussions on implementing direct I/O using dma-buf:
>>>>
>>>> mmap[1]
>>>> ---
>>>> dma-buf never support user map vaddr use of direct I/O.
>>>>
>>>> udmabuf[2]
>>>> ---
>>>> Currently, udmabuf can use the memfd method to read files into
>>>> dma-buf in direct I/O mode.
>>>>
>>>> However, if the size is large, the current udmabuf needs to adjust the
>>>> corresponding size_limit(default 64MB).
>>>> But using udmabuf for files at the 3GB level is not a very good 
>>>> approach.
>>>> It needs to make some adjustments internally to handle this.[3] Or 
>>>> else,
>>>> fail create.
>>>>
>>>> But, it is indeed a viable way to enable dma-buf to support direct 
>>>> I/O.
>>>> However, it is necessary to initiate the file read after the memory 
>>>> allocation
>>>> is completed, and handle race conditions carefully.
>>>>
>>>> sendfile/splice[4]
>>>> ---
>>>> Another way to enable dma-buf to support direct I/O is by implementing
>>>> splice_write/write_iter in the dma-buf file operations (fops) to adapt
>>>> to the sendfile method.
>>>> However, the current sendfile/splice calls are based on pipe. When 
>>>> using
>>>> direct I/O to read a file, the content needs to be copied to the 
>>>> buffer
>>>> allocated by the pipe (default 64KB), and then the dma-buf fops'
>>>> splice_write needs to be called to write the content into the dma-buf.
>>>> This approach requires serially reading the content of file pipe size
>>>> into the pipe buffer and then waiting for the dma-buf to be written
>>>> before reading the next one.(The I/O performance is relatively weak
>>>> under direct I/O.)
>>>> Moreover, due to the existence of the pipe buffer, even when using
>>>> direct I/O and not needing to generate additional page cache,
>>>> there still needs to be a CPU copy.
>>>>
>>>> copy_file_range[5]
>>>> ---
>>>> Consider of copy_file_range, It only supports copying files within the
>>>> same file system. Similarly, it is not very practical.
>>>>
>>>>
>>>> So, currently, there is no particularly suitable solution on VFS to
>>>> allow dma-buf to support direct I/O for large file reads.
>>>>
>>>> This patchset provides an idea to complete file reads when 
>>>> requesting a
>>>> dma-buf.
>>>>
>>>> Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
>>>> ===
>>>> This patch provides a method to immediately read the file content 
>>>> after
>>>> the dma-buf is allocated, and only returns the dma-buf file descriptor
>>>> after the file is fully read.
>>>>
>>>> Since the dma-buf file descriptor is not returned, no other thread can
>>>> access it except for the current thread, so we don't need to worry 
>>>> about
>>>> race conditions.
>>>
>>> That is a completely false assumption.
>> Can you provide a detailed explanation as to why this assumption is 
>> incorrect? thanks.
>
> File descriptors can be guessed and is available to userspace as soon 
> as dma_buf_fd() is called.
>
> What could potentially work is to call system_heap_allocate() without 
> calling dma_buf_fd(), but I'm not sure if you can then make I/O to the 
> underlying pages.

Actually, the dma-buf file descriptor is obtained only after a 
successful file read in the code, so there is no issue.

If you are interested, you can take a look at the 
dma_heap_buffer_alloc_and_read function in patch1.

>
>>>
>>>>
>>>> Map the dma-buf to the vmalloc area and initiate file reads in kernel
>>>> space, supporting both buffer I/O and direct I/O.
>>>>
>>>> This patch adds the DMA_HEAP_ALLOC_AND_READ heap_flag for user.
>>>> When a user needs to allocate a dma-buf and read a file, they should
>>>> pass this heap flag. As the size of the file being read is fixed, 
>>>> there is no
>>>> need to pass the 'len' parameter. Instead, The file_fd needs to be 
>>>> passed to
>>>> indicate to the kernel the file that needs to be read.
>>>>
>>>> The file open flag determines the mode of file reading.
>>>> But, please note that if direct I/O(O_DIRECT) is needed to read the 
>>>> file,
>>>> the file size must be page aligned. (with patch 2-5, no need)
>>>>
>>>> Therefore, for the user, len and file_fd are mutually exclusive,
>>>> and they are combined using a union.
>>>>
>>>> Once the user obtains the dma-buf fd, the dma-buf directly contains 
>>>> the
>>>> file content.
>>>
>>> And I'm repeating myself, but this is a complete NAK from my side to 
>>> this approach.
>>>
>>> We pointed out multiple ways of how to implement this cleanly and 
>>> not by hacking functionality into the kernel which absolutely 
>>> doesn't belong there.
>> In this patchset, I have provided performance comparisons of each of 
>> these methods.  Can you please provide more opinions?
>
> Either drop the whole approach or change udmabuf to do what you want 
> to do.
OK, if so, do I need to send a patch to make dma-buf support sendfile?
>
> Apart from that I don't see a doable way which can be accepted into 
> the kernel.
Thanks for your suggestion.
>
> Regards,
> Christian.
>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Patch 1 implement it.
>>>>
>>>> Patch 2-5 provides an approach for performance improvement.
>>>>
>>>> The DMA_HEAP_ALLOC_AND_READ_FILE heap flag patch enables us to
>>>> synchronously read files using direct I/O.
>>>>
>>>> This approach helps to save CPU copying and avoid a certain degree of
>>>> memory thrashing (page cache generation and reclamation)
>>>>
>>>> When dealing with large file sizes, the benefits of this approach 
>>>> become
>>>> particularly significant.
>>>>
>>>> However, there are currently some methods that can improve 
>>>> performance,
>>>> not just save system resources:
>>>>
>>>> Due to the large file size, for example, a AI 7B model of around 
>>>> 3.4GB, the
>>>> time taken to allocate DMA-BUF memory will be relatively long. Waiting
>>>> for the allocation to complete before reading the file will add to the
>>>> overall time consumption. Therefore, the total time for DMA-BUF
>>>> allocation and file read can be calculated using the formula
>>>>     T(total) = T(alloc) + T(I/O)
>>>>
>>>> However, if we change our approach, we don't necessarily need to wait
>>>> for the DMA-BUF allocation to complete before initiating I/O. In fact,
>>>> during the allocation process, we already hold a portion of the page,
>>>> which means that waiting for subsequent page allocations to complete
>>>> before carrying out file reads is actually unfair to the pages that 
>>>> have
>>>> already been allocated.
>>>>
>>>> The allocation of pages is sequential, and the reading of the file is
>>>> also sequential, with the content and size corresponding to the file.
>>>> This means that the memory location for each page, which holds the
>>>> content of a specific position in the file, can be determined at the
>>>> time of allocation.
>>>>
>>>> However, to fully leverage I/O performance, it is best to wait and
>>>> gather a certain number of pages before initiating batch processing.
>>>>
>>>> The default gather size is 128MB. So, ever gathered can see as a 
>>>> file read
>>>> work, it maps the gather page to the vmalloc area to obtain a 
>>>> continuous
>>>> virtual address, which is used as a buffer to store the contents of 
>>>> the
>>>> corresponding file. So, if using direct I/O to read a file, the file
>>>> content will be written directly to the corresponding dma-buf 
>>>> buffer memory
>>>> without any additional copying.(compare to pipe buffer.)
>>>>
>>>> Consider other ways to read into dma-buf. If we assume reading 
>>>> after mmap
>>>> dma-buf, we need to map the pages of the dma-buf to the user virtual
>>>> address space. Also, udmabuf memfd need do this operations too.
>>>> Even if we support sendfile, the file copy also need buffer, you must
>>>> setup it.
>>>> So, mapping pages to the vmalloc area does not incur any additional
>>>> performance overhead compared to other methods.[6]
>>>>
>>>> Certainly, the administrator can also modify the gather size 
>>>> through patch5.
>>>>
>>>> The formula for the time taken for system_heap buffer allocation and
>>>> file reading through async_read is as follows:
>>>>
>>>>    T(total) = T(first gather page) + Max(T(remain alloc), T(I/O))
>>>>
>>>> Compared to the synchronous read:
>>>>    T(total) = T(alloc) + T(I/O)
>>>>
>>>> If the allocation time or I/O time is long, the time difference 
>>>> will be
>>>> covered by the maximum value between the allocation and I/O. The other
>>>> party will be concealed.
>>>>
>>>> Therefore, the larger the size of the file that needs to be read, the
>>>> greater the corresponding benefits will be.
>>>>
>>>> How to use
>>>> ===
>>>> Consider the current pathway for loading model files into DMA-BUF:
>>>>    1. open dma-heap, get heap fd
>>>>    2. open file, get file_fd(can't use O_DIRECT)
>>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>>    4. mmap dma-buf fd, get vaddr
>>>>    5. read(file_fd, vaddr, file_size) into dma-buf pages
>>>>    6. share, attach, whatever you want
>>>>
>>>> Use DMA_HEAP_ALLOC_AND_READ_FILE JUST a little change:
>>>>    1. open dma-heap, get heap fd
>>>>    2. open file, get file_fd(buffer/direct)
>>>>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap flag, 
>>>> set file_fd
>>>>       instead of len. get dma-buf fd(contains file content)
>>>>    4. share, attach, whatever you want
>>>>
>>>> So, test it is easy.
>>>>
>>>> How to test
>>>> ===
>>>> The performance comparison will be conducted for the following 
>>>> scenarios:
>>>>    1. normal
>>>>    2. udmabuf with [3] patch
>>>>    3. sendfile
>>>>    4. only patch 1
>>>>    5. patch1 - patch4.
>>>>
>>>> normal:
>>>>    1. open dma-heap, get heap fd
>>>>    2. open file, get file_fd(can't use O_DIRECT)
>>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>>    4. mmap dma-buf fd, get vaddr
>>>>    5. read(file_fd, vaddr, file_size) into dma-buf pages
>>>>    6. share, attach, whatever you want
>>>>
>>>> UDMA-BUF step:
>>>>    1. memfd_create
>>>>    2. open file(buffer/direct)
>>>>    3. udmabuf create
>>>>    4. mmap memfd
>>>>    5. read file into memfd vaddr
>>>>
>>>> Sendfile step(need suit splice_write/write_iter, just use to compare):
>>>>    1. open dma-heap, get heap fd
>>>>    2. open file, get file_fd(buffer/direct)
>>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>>    4. sendfile file_fd to dma-buf fd
>>>>    6. share, attach, whatever you want
>>>>
>>>> patch1/patch1-4:
>>>>    1. open dma-heap, get heap fd
>>>>    2. open file, get file_fd(buffer/direct)
>>>>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap flag, 
>>>> set file_fd
>>>>       instead of len. get dma-buf fd(contains file content)
>>>>    4. share, attach, whatever you want
>>>>
>>>> You can create a file to test it. Compare the performance gap 
>>>> between the two.
>>>> It is best to compare the differences in file size from KB to MB to 
>>>> GB.
>>>>
>>>> The following test data will compare the performance differences 
>>>> between 512KB,
>>>> 8MB, 1GB, and 3GB under various scenarios.
>>>>
>>>> Performance Test
>>>> ===
>>>>    12G RAM phone
>>>>    UFS4.0(the maximum speed is 4GB/s. ),
>>>>    f2fs
>>>>    kernel 6.1 with patch[7] (or else, can't support kvec direct I/O 
>>>> read.)
>>>>    no memory pressure.
>>>>    drop_cache is used for each test.
>>>>
>>>> The average of 5 test results:
>>>> | scheme-size         | 512KB(ns)  | 8MB(ns)    | 1GB(ns) | 
>>>> 3GB(ns)       |
>>>> | ------------------- | ---------- | ---------- | ------------- | 
>>>> ------------- |
>>>> | normal              | 2,790,861  | 14,535,784 | 1,520,790,492 | 
>>>> 3,332,438,754 |
>>>> | udmabuf buffer I/O  | 1,704,046  | 11,313,476 | 821,348,000 | 
>>>> 2,108,419,923 |
>>>> | sendfile buffer I/O | 3,261,261  | 12,112,292 | 1,565,939,938 | 
>>>> 3,062,052,984 |
>>>> | patch1-4 buffer I/O | 2,064,538  | 10,771,474 | 986,338,800 | 
>>>> 2,187,570,861 |
>>>> | sendfile direct I/O | 12,844,231 | 37,883,938 | 5,110,299,184 | 
>>>> 9,777,661,077 |
>>>> | patch1 direct I/O   | 813,215    | 6,962,092  | 2,364,211,877 | 
>>>> 5,648,897,554 |
>>>> | udmabuf direct I/O  | 1,289,554  | 8,968,138  | 921,480,784 | 
>>>> 2,158,305,738 |
>>>> | patch1-4 direct I/O | 1,957,661  | 6,581,999  | 520,003,538 | 
>>>> 1,400,006,107 |
>>
>> With this test, sendfile can't give a good help base on pipe buffer.
>>
>> udmabuf is good, but I think our oem driver can't suit it. (And, AOSP 
>> do not open this feature)
>>
>>
>> Anyway, I am sending this patchset in the hope of further discussion.
>>
>> Thanks.
>>
>>>>
>>>> So, based on the test results:
>>>>
>>>> When the file is large, the patchset has the highest performance.
>>>> Compared to normal, patchset is a 50% improvement;
>>>> Compared to normal, patch1 only showed a degradation of 41%.
>>>> patch1 typical performance breakdown is as follows:
>>>>    1. alloc cost 188,802,693 ns
>>>>    2. vmap cost 42,491,385 ns
>>>>    3. file read cost 4,180,876,702 ns
>>>> Therefore, directly performing a single direct I/O read on a large 
>>>> file
>>>> may not be the most optimal way for performance.
>>>>
>>>> The performance of direct I/O implemented by the sendfile method is 
>>>> the worst.
>>>>
>>>> When file size is small, The difference in performance is not
>>>> significant. This is consistent with expectations.
>>>>
>>>>
>>>>
>>>> Suggested use cases
>>>> ===
>>>>    1. When there is a need to read large files and system resources 
>>>> are scarce,
>>>>       especially when the size of memory is limited.(GB level) In this
>>>>       scenario, using direct I/O for file reading can even bring 
>>>> performance
>>>>       improvements.(may need patch2-3)
>>>>    2. For embedded devices with limited RAM, using direct I/O can 
>>>> save system
>>>>       resources and avoid unnecessary data copying. Therefore, even 
>>>> if the
>>>>       performance is lower when read small file, it can still be used
>>>>       effectively.
>>>>    3. If there is sufficient memory, pinning the page cache of the 
>>>> model files
>>>>       in memory and placing file in the EROFS file system for 
>>>> read-only access
>>>>       maybe better.(EROFS do not support direct I/O)
>>>>
>>>>
>>>> Changlog
>>>> ===
>>>>   v1 [8]
>>>>   v1->v2:
>>>>     Uses the heap flag method for alloc and read instead of adding 
>>>> a new
>>>>     DMA-buf ioctl command. [9]
>>>>     Split the patchset to facilitate review and test.
>>>>       patch 1 implement alloc and read, offer heap flag into it.
>>>>       patch 2-4 offer async read
>>>>       patch 5 can change gather limit.
>>>>
>>>> Reference
>>>> ===
>>>> [1] 
>>>> https://lore.kernel.org/all/0393cf47-3fa2-4e32-8b3d-d5d5bdece298@amd.com/
>>>> [2] 
>>>> https://lore.kernel.org/all/ZpTnzkdolpEwFbtu@phenom.ffwll.local/
>>>> [3] 
>>>> https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/
>>>> [4] 
>>>> https://lore.kernel.org/all/Zpf5R7fRZZmEwVuR@infradead.org/
>>>> [5] 
>>>> https://lore.kernel.org/all/ZpiHKY2pGiBuEq4z@infradead.org/
>>>> [6] 
>>>> https://lore.kernel.org/all/9b70db2e-e562-4771-be6b-1fa8df19e356@amd.com/
>>>> [7] 
>>>> https://patchew.org/linux/20230209102954.528942-1-dhowells@redhat.com/20230209102954.528942-7-dhowells@redhat.com/
>>>> [8] 
>>>> https://lore.kernel.org/all/20240711074221.459589-1-link@vivo.com/
>>>> [9] 
>>>> https://lore.kernel.org/all/5ccbe705-883c-4651-9e66-6b452c414c74@amd.com/
>>>>
>>>> Huan Yang (5):
>>>>    dma-buf: heaps: Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
>>>>    dma-buf: heaps: Introduce async alloc read ops
>>>>    dma-buf: heaps: support alloc async read file
>>>>    dma-buf: heaps: system_heap alloc support async read
>>>>    dma-buf: heaps: configurable async read gather limit
>>>>
>>>>   drivers/dma-buf/dma-heap.c          | 552 
>>>> +++++++++++++++++++++++++++-
>>>>   drivers/dma-buf/heaps/system_heap.c |  70 +++-
>>>>   include/linux/dma-heap.h            |  53 ++-
>>>>   include/uapi/linux/dma-heap.h       |  11 +-
>>>>   4 files changed, 673 insertions(+), 13 deletions(-)
>>>>
>>>>
>>>> base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
>>>
>
