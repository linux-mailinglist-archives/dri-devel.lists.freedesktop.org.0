Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1023ED1D4A6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 09:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA6F10E33A;
	Wed, 14 Jan 2026 08:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xMkwMfZk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013039.outbound.protection.outlook.com
 [40.107.201.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E5410E33A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:57:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wV3xekd+8gd+tLGqwzbncJOjjXTaUCcZLSoxN8GA5FT8+HBVKCsZl95eqXx9e8EWIZplcFUoNmxwI/HdsxXbionMJoB+dLkIeeW5OSvFBCprPoeEkj57OTeVOlwsUpooP1h3ntM1SFDMAj3Fb8uUmrTTgJGx1NY0+SY0t0A3HUTXuIlJYRSFfOF7cYNjN9ZIOYJJTbiQxSBzSIeGNYJ7FuL0xN7ygSyIndlHA5NAUxNaa3esucEBUlg2WgTOlfJMi5eoDPA38Jsolc+NTcM+HiGpf1pJ0CgTntPM4SCiTASzVMwi1dUYJXvHe+8LaHqpHIAXiT9BKzVp/2xY8QwYQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7sr4Iw+NCMuzgsfu+CBWPGnOvrEDrDsDznuMOv0DfY=;
 b=lSGCiLkrRh0hUoNiya1z6GYwAZJ+SCi6oKrz2KMLKdWLpEb+Qgy/aF7wHj3RLHf76LoxOuEOItk6T6bUNu9eSM9+KqIQlEiMfOIvHTVKrERslY4Wf3lURdZufGJh4CWaJwMvrNrqZ9gC5bsOv0rZkQ1Q5xYYHLOlGc4U+74G7CKs125SbwjVA7JlXevCUMgMTeb6IgbAkR1ycFMqrUw/0mGoqW3RCEQTZ0fPPGxlF3R76+5/pYPAiagILoc/Be/oDylHTDU+k31oJybEU/QJYsVYkF7OMJboB99l4S8XwPJy9kmrN/k7XqvLjpPlXK83xCGjjjbK9AqGfVET34ikZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7sr4Iw+NCMuzgsfu+CBWPGnOvrEDrDsDznuMOv0DfY=;
 b=xMkwMfZkvFWwPcugdgI13w1D3SxXjmqDsFYPql6O+gnOfYcWSjjHWcNXPhhrMLdwD+FixpDGO0sDfUUHgzJ2SLpf7MJoVOMR2pUSm0Cs/6/gX7iDzLNpby4R2ZmglWlY6/DVCHxuUTWRXqi8aDpvqsMNbRenHxeA8gBwM3QacRA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 08:57:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 08:57:51 +0000
Message-ID: <16e956eb-d721-4926-bf75-1baca9677c04@amd.com>
Date: Wed, 14 Jan 2026 09:57:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] accel/thames: Add IOCTL for job submission
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Nishanth Menon <nm@ti.com>,
 "Andrew F. Davis" <afd@ti.com>, Randolph Sapp <rs@ti.com>,
 Jonathan Humphreys <j-humphreys@ti.com>, Andrei Aldea <a-aldea@ti.com>,
 Chirag Shilwant <c-shilwant@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
 <20260113-thames-v1-4-99390026937c@tomeuvizoso.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260113-thames-v1-4-99390026937c@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0496.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc9ccfa-8292-427c-875d-08de534affc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007|13003099007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0x6TithdTl0YWlCR3U2c2tPc0tQYTNGRHBzeUVIOGFGcGgwS0FsU3IxTjVv?=
 =?utf-8?B?U3Y4MlNSQmloamFWRHF4ejA5UmdLYzdYV0k5QTJGSVljRms2NXNhcUczc0la?=
 =?utf-8?B?M1J6TFFtd00zcFFmVVNxSGRNMzlidi9SUjNVMGtqbXlUZDRwVFRkVTdYaWxZ?=
 =?utf-8?B?M091cDJXOWRxYzliR21wQkR1UjEwR1pMN3BTTG1tUGRwcXBUWDZnOEI5WThI?=
 =?utf-8?B?Um8vcEkrNnlOL2xTN1luM3Fsc1dIdURmV0RaTzJlYmxEMk00NVFZbTRkZ3Ju?=
 =?utf-8?B?KzFMdkNyQVZvU0VMSFZ2UVd6dDNOd0VMdGwyUWVFL1dSSW5sem5pSXE1TVd0?=
 =?utf-8?B?S2NLaTBGbk9hSEJmeERFYjVGbUJEQ3dzS0pDTVRlRXNOREQrQ0kxazVQOWtO?=
 =?utf-8?B?ZkdiTmN1YlJvN1dUWCsycTB4dkF0eXBGSUdFdklWd0Z3Z0ZicFhEY1RGTDY3?=
 =?utf-8?B?RnVWZE5jSHc4MHo2VmtxMzRLa0JYSTRCcnNNWHA3M3htU0cvN09kMTBwV0Ra?=
 =?utf-8?B?dTNXVWZKY0NoUDV0MENiUlJiNEhjWEJKbVVWOVN6YkpkeXdCV2dLNDNsYnF1?=
 =?utf-8?B?UjVXOXVyalpoZDVrWmZvMlNPS0dFOE5SWHN2SWU0R0Y0U1g0Znh1enJhTzNI?=
 =?utf-8?B?MGpwcTdCOXFqV1paMEgvL1FNUlo5VUtrazV2TDdKV0x3S2NUdWUrTjhOQUt2?=
 =?utf-8?B?SXQ2MFB3SDE3OWloNzFDa3BNbDVBMTZieEYvbzhJWGdUZ0NoMlk0RUFSVzIv?=
 =?utf-8?B?TG9QcTltWmVxY1FwQjhGNzdmWE9rQ2ttMG5SVU5qeDFNRFNFZHVHRUNKbW1W?=
 =?utf-8?B?NWZ0SW56NG9pdmptVDJQMXdzNU1STlkyRktiQW5LZnVGOE1Ya1BQNlh1U2li?=
 =?utf-8?B?V2NuWEtQMGZ6Sk5oc3MwNXdkVVNiVDhFTHBCZWFEd2t3bGlFNVpoa01RbWdW?=
 =?utf-8?B?RUdhNXo0SjBZdGs1M042c0d6dTdGUUxKMFhsWCs2ZzFZbnNnMnN5ak4zbm03?=
 =?utf-8?B?NUhMdGVuQkx4RWtuQWF3SkFneUh4THN2Y2I4WjJwTmh1TWVBOVVaenFIcGJQ?=
 =?utf-8?B?eHBJaXY0Z01LNVlEL2tNZmJ1Wkcxa1MyU0gyUkQvanF0KzB3UmZkODVRQzgz?=
 =?utf-8?B?K1ZVQW91T3RlaHkra1VRdzdKOWsveDFwRUZIWDFockVERXdVY3hVb29KRnRQ?=
 =?utf-8?B?NlMvc2xVd05JdmV4bURQZHl2ckJ6WGo3ZjlCZXc4R2JDOEw4S1NhSVpwanF2?=
 =?utf-8?B?eGwrendVU0JCUUFPSUl0OU9paGxmT0htVEZUOVc0bEMrdFRuMktMZEFTTy8w?=
 =?utf-8?B?ektiWGdKV0NNejBjcjQzekp5MHo5WmJnMmIvZUE5cWFQR2ZwS2FXN1ZvWDN3?=
 =?utf-8?B?bmJoemlWUW9xNjF2cXd3MnJCTWUvaW41NkhybmRqdTFSdWlQTkhVVDBpYzQw?=
 =?utf-8?B?WU1KSEEzWHRXck1TT1ZiYjI3V3JKbndkTXZMUVFRUmFRZGFpSjJwcU9vM2U3?=
 =?utf-8?B?b0psRnpaaHJCMlkyeS8zaXczeFFRN2RsbTRUUDBidHU3RENCS1JJUU4wZ0g1?=
 =?utf-8?B?aDg0TnFHYXVEeUpKYU15NjJxVG5UZS9BZmpNaDdTN0xYR2JpdEh6a2ZFS01q?=
 =?utf-8?B?TVNKeHpoL0Vuc0pwSmVia0lhcFluS0pUQ28rSnpDSGZLK1g3bnhIMTZSNndl?=
 =?utf-8?B?Z1pHamFzMmVoa2M0djlnWW5MM0FKNlIxQ0RlU3hZa3FaSTFyVlRWU0Zjc3FD?=
 =?utf-8?B?YWxyWHZPL1VpbjFwaklHMkxoZEwxeTIzcG9xT0doUUVCZHh4b3pxdlhubFQ1?=
 =?utf-8?B?OTY0L3JHekN6Q21BZU9BZ1EvVjBjTnZOTDJORXVUWVlOZDZob01YRWFURXdX?=
 =?utf-8?B?ZU1aMzVCbUZuNmlJZ3dyRmVldlF6Y3pHKzc0OFRsY255ZHVHejRFSDFpYXNr?=
 =?utf-8?Q?IHGlbRE1YknLRZN9S1QQpln1bb0wxaFT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(13003099007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T01CSUwybjJONTZjc1RXUjdMNktaYmt6aTBaTzU5dUQ4WUVVYmJjUGtYZXor?=
 =?utf-8?B?cTZIT0ZoNEtkYkw0RkFzeDgzRTcxcThBR1NoS3RpR0VVSm1ienl3c2dSTDdE?=
 =?utf-8?B?TjlQbmkvdDFSdFA5RU9jaHg0eW9sdktzOXlyK1E4ZEJVc1d6b2U5REFqemlz?=
 =?utf-8?B?SS9CdUIrQ1dKeG5MczkzNnlVLzNTaHJOc1JPYUt5azJKNERrUm9hN2QydkpM?=
 =?utf-8?B?YnZFRzRSQStyL1lqZDRaY21Yc0pRMHZmaDhLMzBOb3RoNWJSNVk1YTFQaWhu?=
 =?utf-8?B?UkN2bnBjZVc3L3N6bGtKYkNkS0p2M0ZMQ0dicHBUVjcwUTBPY2M5Sk5zMFF0?=
 =?utf-8?B?K0pUZVVFcVhXSFh4TkpyWjIvZDJ0QXFNMGhpZmVHbCtwNmJ4QU8rUVJFUEhs?=
 =?utf-8?B?VFozUWwxc2FWMVpBbjFwMkxQWFNXR1EvTVZDN1ozSWRMRmh2eWtUMjhiT0o0?=
 =?utf-8?B?OE1Lenh0RVFmblJqMUJZVGV5c1hyQXlDWitWMXp5NUs3ZkdJbEI0R0NTcVhs?=
 =?utf-8?B?UlgvZDFlM0FVRFFSMnhrTnZ5U2R6NnA3b2JWa2JYUWVmZTNYWnVNcHJENDhU?=
 =?utf-8?B?b0xLTHBEeU1BQ1V1N1BPL1JicEFsa1lVeWVONmc4QUthK25mS3hlMm9TTzll?=
 =?utf-8?B?WEJoM2Vjc2k0bEpmT1VRMVZCOW9uRmxVREd5bWloVUEyeVB2aTQ5YU9EV2NU?=
 =?utf-8?B?eUdVSW5ZQUgreVFmdU1yVUxwWDI0bFk4NEJZVjl2c1cxZHJUbzlmN0pUeTNV?=
 =?utf-8?B?UjRTcGJTdTBZQ3FnS1hWazIzci8wL1VZemoyeHIwVnZ0VFBKZnFGcHV0UlhW?=
 =?utf-8?B?OWdMalAya0ZTTEhZcU9IOUxSTFpFYzMvYmJEeTBoQmUxVk1lZk1rUHpySTJw?=
 =?utf-8?B?dVpyVEZxa2NCSGptM3VFOTJ3a1BSYWFHekJIYjRybGI4U1VuUGMybStSWGx4?=
 =?utf-8?B?LzhzY0d5bzM2cENZeGU0VW5Pa25UbGNUcm5hNTMzbFBOY0hETDVvblI3Vnh3?=
 =?utf-8?B?OFlZb3hPeXNidCtEcDJ3dmZHbnVCaElQVmphNFpJTDU0OGhpZkZiYWlDQS9q?=
 =?utf-8?B?d050d0I3QVFEZHVqSWFScGplK1g2SDJGTDNiTVlaQmpWWitNUUhTaUlNN1BE?=
 =?utf-8?B?SlNsaDJzcEdmamcyREQ1R3JnNVdYQjMyMXpyS0p6N2NuME9RZlZUZERvT2ts?=
 =?utf-8?B?bThTSVVYazlDV0ZWR3RFK0xSYkZQdmZUNnk1dTR6RU1KRHVvNGRMWTlndWVn?=
 =?utf-8?B?MHk4c2gwOFFaL1I0ZVNOdkF5U2pHNVRyUHk1U3kwT2RkU2VlRENxVDlYb25G?=
 =?utf-8?B?Lyt4NlNLR1V6QWZFdTQyWEJST2VQOGpQWlhaOCtZQWZGdFM1dWp2Z0dRVW1y?=
 =?utf-8?B?L01jSENGalQ5U3BWM3RXOWpoZFhoVFhNQjRaV05sd2IySXNFSjFGYy9lRUxj?=
 =?utf-8?B?NG9uZWZYQ05KeE9DL09ycXRZNG5GT0pPRGFRTDlNWk1iUUx3R0F6MWtyd0xY?=
 =?utf-8?B?d3paeGpJNnBxUG0ybkVVaDZYMFpqVHAxN3hMRkxXTGxNMnY4b3FQUjhPVWda?=
 =?utf-8?B?bTBidzR0SFkxaVZZUlVYa0QwZytqZDBwdWRJZ3JieVpRNENQYjBkTkFtOVps?=
 =?utf-8?B?OXdnM3U4MzBXaEcxRDRvZmJTNE5zUWlULzV4TmswZHl3NjNlcXkraitYcFhG?=
 =?utf-8?B?clkvbHAzUE5haGRGUmQ0WHE3SDlWQzFFcG9JeFhabUttMFppMnZuUit1a2lH?=
 =?utf-8?B?Rm8rSmxraVpCYkk3MEJNUTY0Z0F4ZGhtSGxiY1NxdHd6eEtYeVpycjRRbERs?=
 =?utf-8?B?T1ZXbDZPZ3lqKzZ6SURlV2lsZkxmd1RNbnlVaEFCNEJPanU3TnF3ckVpYk5R?=
 =?utf-8?B?WkVkc1FLVjhkVHI0ZmF2dHZCY1lxaXFCL0V5R3lXQ0pyT3VKVWZxc2NVRkFV?=
 =?utf-8?B?aHZheHBpdDJzaVlyUTBhckJyRjlYeXd6Sm1kclFlK3IrVmNreWJ1aFFCdzRt?=
 =?utf-8?B?a0t4Yzc0S2ppUzNJbC93VWZtMG5EWGFrUkxOSE9TYjd5ejJ5c3dqTEFMMkNl?=
 =?utf-8?B?Y3dNV3pxR05RbHJ2bGRDRm15QnBoTFJublAvbTJUa0xzNGdqU1hlN1hJVW0r?=
 =?utf-8?B?ME1YTnVLejQ0RUt6RlNJUmF4c1lMZWkrWGFJdGIrWG9XNUR2Q1NZQzcxbmFB?=
 =?utf-8?B?eHhRcVMyUU1wb0RyVk9EeVE2YTJjZ0ovNGQ4YUtRNXk2M0RDU2FVTWpKVGdP?=
 =?utf-8?B?K3BiamYvSG92bHgrVS9lalZFaHBueUY3UG44czUrMWRnVEx2em13S2tYcS9a?=
 =?utf-8?B?OGtmai9tdFpPSHJrVGtqNjRTOGFPRUo4cGYrR3kyV0xoYURrM05yZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc9ccfa-8292-427c-875d-08de534affc3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 08:57:51.7973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCqSjimYc+kMkjDif3VgNCS8eQnh9HGl9uX+ST0Fyzdiblrr3CeMzpqNKizjHs6K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8495
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

On 1/13/26 18:44, Tomeu Vizoso wrote:
> Using the DRM GPU scheduler infrastructure, with a scheduler for each
> core.
> 
> Contexts are created in all cores, and buffers mapped to all of them as
> well, so all cores are ready to execute any job.
> 
> The job submission code was initially based on Panfrost.
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  drivers/accel/thames/Makefile       |   1 +
>  drivers/accel/thames/thames_core.c  |   6 +
>  drivers/accel/thames/thames_drv.c   |  19 ++
>  drivers/accel/thames/thames_job.c   | 463 ++++++++++++++++++++++++++++++++++++
>  drivers/accel/thames/thames_job.h   |  51 ++++
>  drivers/accel/thames/thames_rpmsg.c |  52 ++++
>  6 files changed, 592 insertions(+)
> 
> diff --git a/drivers/accel/thames/Makefile b/drivers/accel/thames/Makefile
> index 0051e319f2e4966de72bc342d5b6e40b2890c006..b6c4516f8250e3d442f22e80d609cb1be2970128 100644
> --- a/drivers/accel/thames/Makefile
> +++ b/drivers/accel/thames/Makefile
> @@ -7,4 +7,5 @@ thames-y := \
>  	thames_device.o \
>  	thames_drv.o \
>  	thames_gem.o \
> +	thames_job.o \
>  	thames_rpmsg.o
> diff --git a/drivers/accel/thames/thames_core.c b/drivers/accel/thames/thames_core.c
> index 92af1d68063116bcfa28a33960cbe829029fc1bf..5b96b25d287096803e034fcd4261d51795871543 100644
> --- a/drivers/accel/thames/thames_core.c
> +++ b/drivers/accel/thames/thames_core.c
> @@ -13,6 +13,7 @@
>  
>  #include "thames_core.h"
>  #include "thames_device.h"
> +#include "thames_job.h"
>  #include "thames_rpmsg.h"
>  
>  /* Shift to convert bytes to megabytes (divide by 1048576) */
> @@ -115,11 +116,16 @@ int thames_core_init(struct thames_core *core)
>  	if (err)
>  		return err;
>  
> +	err = thames_job_init(core);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
>  void thames_core_fini(struct thames_core *core)
>  {
> +	thames_job_fini(core);
>  	thames_rpmsg_fini(core);
>  }
>  
> diff --git a/drivers/accel/thames/thames_drv.c b/drivers/accel/thames/thames_drv.c
> index 29a80b9747ae84778b09f5dbd5b8d6d596f1947a..bf7355832241d5a671e196f465d891effaa4a8fb 100644
> --- a/drivers/accel/thames/thames_drv.c
> +++ b/drivers/accel/thames/thames_drv.c
> @@ -14,6 +14,7 @@
>  #include "thames_drv.h"
>  #include "thames_core.h"
>  #include "thames_gem.h"
> +#include "thames_job.h"
>  #include "thames_ipc.h"
>  
>  static struct platform_device *drm_dev;
> @@ -38,8 +39,22 @@ static int thames_open(struct drm_device *dev, struct drm_file *file)
>  
>  	file->driver_priv = thames_priv;
>  
> +	ret = thames_job_open(thames_priv);
> +	if (ret)
> +		goto err_free;
> +
> +	ret = thames_context_create(thames_priv);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to create context for client: %d", ret);
> +		goto err_close_job;
> +	}
> +
>  	return 0;
>  
> +err_close_job:
> +	thames_job_close(thames_priv);
> +err_free:
> +	kfree(thames_priv);
>  err_put_mod:
>  	module_put(THIS_MODULE);
>  	return ret;
> @@ -49,6 +64,9 @@ static void thames_postclose(struct drm_device *dev, struct drm_file *file)
>  {
>  	struct thames_file_priv *thames_priv = file->driver_priv;
>  
> +	thames_context_destroy(thames_priv);
> +
> +	thames_job_close(thames_priv);
>  	kfree(thames_priv);
>  	module_put(THIS_MODULE);
>  }
> @@ -57,6 +75,7 @@ static const struct drm_ioctl_desc thames_drm_driver_ioctls[] = {
>  #define THAMES_IOCTL(n, func) DRM_IOCTL_DEF_DRV(THAMES_##n, thames_ioctl_##func, 0)
>  	THAMES_IOCTL(BO_CREATE, bo_create),
>  	THAMES_IOCTL(BO_MMAP_OFFSET, bo_mmap_offset),
> +	THAMES_IOCTL(SUBMIT, submit),
>  };
>  
>  DEFINE_DRM_ACCEL_FOPS(thames_accel_driver_fops);
> diff --git a/drivers/accel/thames/thames_job.c b/drivers/accel/thames/thames_job.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..bd8f8fa1783cf10c5e71c8f2ce5fcc880a9b150b
> --- /dev/null
> +++ b/drivers/accel/thames/thames_job.c
> @@ -0,0 +1,463 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> +/* Copyright 2019 Collabora ltd. */
> +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
> +
> +#include "linux/dev_printk.h"
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_print.h>
> +#include <drm/thames_accel.h>
> +#include <linux/platform_device.h>
> +
> +#include "thames_core.h"
> +#include "thames_device.h"
> +#include "thames_drv.h"
> +#include "thames_gem.h"
> +#include "thames_job.h"
> +#include "thames_rpmsg.h"
> +
> +#define JOB_TIMEOUT_MS 500
> +
> +static struct thames_job *to_thames_job(struct drm_sched_job *sched_job)
> +{
> +	return container_of(sched_job, struct thames_job, base);
> +}
> +
> +static const char *thames_fence_get_driver_name(struct dma_fence *fence)
> +{
> +	return "thames";
> +}
> +
> +static const char *thames_fence_get_timeline_name(struct dma_fence *fence)
> +{
> +	return "thames";
> +}
> +
> +static const struct dma_fence_ops thames_fence_ops = {
> +	.get_driver_name = thames_fence_get_driver_name,
> +	.get_timeline_name = thames_fence_get_timeline_name,
> +};
> +
> +static struct dma_fence *thames_fence_create(struct thames_core *core)
> +{
> +	struct dma_fence *fence;
> +
> +	fence = kzalloc(sizeof(*fence), GFP_KERNEL);

Oh yeah, that is the classic mistake :)

You should not allocate any memory in the schedulers job_run() callback!

The best solution is to split your kzalloc() from the dma_fence_init() and allocate memory when creating the job.

The alternative is to use GFP_ATOMIC, but that is not really nice since it digs into the atomic reserve without a good reason.

For things like core dumps and debugging output you can also use GFP_NOWAIT, but keep in mind that this can trivially fail so it is not good for things fences.

Regards,
Christian.

> +	if (!fence)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dma_fence_init(fence, &thames_fence_ops, &core->fence_lock, core->fence_context,
> +		       ++core->emit_seqno);
> +
> +	return fence;
> +}
> +
> +static void thames_job_hw_submit(struct thames_core *core, struct thames_job *job)
> +{
> +	int ret;
> +
> +	/* Don't queue the job if a reset is in progress */
> +	if (atomic_read(&core->reset.pending))
> +		return;
> +
> +	ret = thames_rpmsg_send_submit_job(core, job->file_priv->context_id, job->job_id,
> +					   to_thames_bo(job->kernel)->iova, job->kernel_size,
> +					   to_thames_bo(job->params)->iova, job->params_size,
> +					   &job->ipc_sequence);
> +
> +	if (ret) {
> +		dev_err(core->dev, "Failed to submit kernel to DSP core %d\n", core->index);
> +		return;
> +	}
> +}
> +
> +static int thames_acquire_object_fences(struct drm_gem_object **bos, int bo_count,
> +					struct drm_sched_job *job, bool is_write)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < bo_count; i++) {
> +		ret = dma_resv_reserve_fences(bos[i]->resv, 1);
> +		if (ret)
> +			return ret;
> +
> +		ret = drm_sched_job_add_implicit_dependencies(job, bos[i], is_write);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void thames_attach_object_fences(struct drm_gem_object **bos, int bo_count,
> +					struct dma_fence *fence)
> +{
> +	int i;
> +
> +	for (i = 0; i < bo_count; i++)
> +		dma_resv_add_fence(bos[i]->resv, fence, DMA_RESV_USAGE_WRITE);
> +}
> +
> +static int thames_job_push(struct thames_job *job)
> +{
> +	struct thames_device *tdev = job->tdev;
> +	struct drm_gem_object **bos;
> +	struct ww_acquire_ctx acquire_ctx;
> +	int ret = 0;
> +
> +	dev_dbg(tdev->ddev.dev, "Pushing job with %u in BOs and %u out BOs\n", job->in_bo_count,
> +		job->out_bo_count);
> +	bos = kvmalloc_array(job->in_bo_count + job->out_bo_count, sizeof(void *), GFP_KERNEL);
> +	memcpy(bos, job->in_bos, job->in_bo_count * sizeof(void *));
> +	memcpy(&bos[job->in_bo_count], job->out_bos, job->out_bo_count * sizeof(void *));
> +
> +	ret = drm_gem_lock_reservations(bos, job->in_bo_count + job->out_bo_count, &acquire_ctx);
> +	if (ret)
> +		goto err;
> +
> +	scoped_guard(mutex, &tdev->sched_lock)
> +	{
> +		drm_sched_job_arm(&job->base);
> +
> +		job->inference_done_fence = dma_fence_get(&job->base.s_fence->finished);
> +
> +		ret = thames_acquire_object_fences(job->in_bos, job->in_bo_count, &job->base,
> +						   false);
> +		if (ret)
> +			goto err_unlock;
> +
> +		ret = thames_acquire_object_fences(job->out_bos, job->out_bo_count, &job->base,
> +						   true);
> +		if (ret)
> +			goto err_unlock;
> +
> +		kref_get(&job->refcount); /* put by scheduler job completion */
> +
> +		drm_sched_entity_push_job(&job->base);
> +	}
> +
> +	thames_attach_object_fences(job->out_bos, job->out_bo_count, job->inference_done_fence);
> +
> +err_unlock:
> +	drm_gem_unlock_reservations(bos, job->in_bo_count + job->out_bo_count, &acquire_ctx);
> +err:
> +	kvfree(bos);
> +
> +	return ret;
> +}
> +
> +static void thames_job_cleanup(struct kref *ref)
> +{
> +	struct thames_job *job = container_of(ref, struct thames_job, refcount);
> +	struct thames_device *tdev = job->tdev;
> +	unsigned int i;
> +
> +	dma_fence_put(job->done_fence);
> +	dma_fence_put(job->inference_done_fence);
> +
> +	ida_free(&tdev->job_ida, job->job_id);
> +
> +	if (job->kernel)
> +		drm_gem_object_put(job->kernel);
> +
> +	if (job->params)
> +		drm_gem_object_put(job->params);
> +
> +	if (job->in_bos) {
> +		for (i = 0; i < job->in_bo_count; i++)
> +			drm_gem_object_put(job->in_bos[i]);
> +
> +		kvfree(job->in_bos);
> +	}
> +
> +	if (job->out_bos) {
> +		for (i = 0; i < job->out_bo_count; i++)
> +			drm_gem_object_put(job->out_bos[i]);
> +
> +		kvfree(job->out_bos);
> +	}
> +
> +	kfree(job);
> +}
> +
> +static void thames_job_put(struct thames_job *job)
> +{
> +	kref_put(&job->refcount, thames_job_cleanup);
> +}
> +
> +static void thames_job_free(struct drm_sched_job *sched_job)
> +{
> +	struct thames_job *job = to_thames_job(sched_job);
> +
> +	drm_sched_job_cleanup(sched_job);
> +
> +	thames_job_put(job);
> +}
> +
> +static struct thames_core *sched_to_core(struct thames_device *tdev,
> +					 struct drm_gpu_scheduler *sched)
> +{
> +	unsigned int core;
> +
> +	for (core = 0; core < tdev->num_cores; core++) {
> +		if (&tdev->cores[core].sched == sched)
> +			return &tdev->cores[core];
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct dma_fence *thames_job_run(struct drm_sched_job *sched_job)
> +{
> +	struct thames_job *job = to_thames_job(sched_job);
> +	struct thames_device *tdev = job->tdev;
> +	struct thames_core *core = sched_to_core(tdev, sched_job->sched);
> +	struct dma_fence *fence = NULL;
> +
> +	if (unlikely(job->base.s_fence->finished.error))
> +		return NULL;
> +
> +	fence = thames_fence_create(core);
> +	if (IS_ERR(fence))
> +		return fence;
> +
> +	if (job->done_fence)
> +		dma_fence_put(job->done_fence);
> +	job->done_fence = dma_fence_get(fence);
> +
> +	scoped_guard(mutex, &core->job_lock)
> +	{
> +		core->in_flight_job = job;
> +		thames_job_hw_submit(core, job);
> +	}
> +
> +	return fence;
> +}
> +
> +static void thames_reset(struct thames_core *core, struct drm_sched_job *bad)
> +{
> +	if (!atomic_read(&core->reset.pending))
> +		return;
> +
> +	drm_sched_stop(&core->sched, bad);
> +	scoped_guard(mutex, &core->job_lock) core->in_flight_job = NULL;
> +	thames_core_reset(core);
> +	atomic_set(&core->reset.pending, 0);
> +	drm_sched_start(&core->sched, 0);
> +}
> +
> +static enum drm_gpu_sched_stat thames_job_timedout(struct drm_sched_job *sched_job)
> +{
> +	struct thames_job *job = to_thames_job(sched_job);
> +	struct thames_device *tdev = job->tdev;
> +	struct thames_core *core = sched_to_core(tdev, sched_job->sched);
> +
> +	if (!core) {
> +		dev_err(tdev->ddev.dev, "Failed to find core for timed out job\n");
> +		return DRM_GPU_SCHED_STAT_NONE;
> +	}
> +
> +	dev_err(core->dev, "Job %u timed out on DSP core %d\n", job->job_id, core->index);
> +
> +	atomic_set(&core->reset.pending, 1);
> +	thames_reset(core, sched_job);
> +
> +	return DRM_GPU_SCHED_STAT_RESET;
> +}
> +
> +static void thames_reset_work(struct work_struct *work)
> +{
> +	struct thames_core *core;
> +
> +	core = container_of(work, struct thames_core, reset.work);
> +	thames_reset(core, NULL);
> +}
> +
> +static const struct drm_sched_backend_ops thames_sched_ops = { .run_job = thames_job_run,
> +							       .timedout_job = thames_job_timedout,
> +							       .free_job = thames_job_free };
> +
> +int thames_job_init(struct thames_core *core)
> +{
> +	struct drm_sched_init_args args = {
> +		.ops = &thames_sched_ops,
> +		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
> +		.credit_limit = 1,
> +		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
> +		.name = dev_name(core->dev),
> +		.dev = core->dev,
> +	};
> +	int ret;
> +
> +	INIT_WORK(&core->reset.work, thames_reset_work);
> +	spin_lock_init(&core->fence_lock);
> +	mutex_init(&core->job_lock);
> +
> +	core->reset.wq = alloc_ordered_workqueue("thames-reset-%d", 0, core->index);
> +	if (!core->reset.wq)
> +		return -ENOMEM;
> +
> +	core->fence_context = dma_fence_context_alloc(1);
> +
> +	args.timeout_wq = core->reset.wq;
> +	ret = drm_sched_init(&core->sched, &args);
> +	if (ret) {
> +		dev_err(core->dev, "Failed to create scheduler: %d.", ret);
> +		destroy_workqueue(core->reset.wq);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +void thames_job_fini(struct thames_core *core)
> +{
> +	drm_sched_fini(&core->sched);
> +
> +	cancel_work_sync(&core->reset.work);
> +	destroy_workqueue(core->reset.wq);
> +}
> +
> +int thames_job_open(struct thames_file_priv *thames_priv)
> +{
> +	struct thames_device *tdev = thames_priv->tdev;
> +	struct drm_gpu_scheduler **scheds =
> +		kmalloc_array(tdev->num_cores, sizeof(*scheds), GFP_KERNEL);
> +	unsigned int core;
> +	int ret;
> +
> +	for (core = 0; core < tdev->num_cores; core++)
> +		scheds[core] = &tdev->cores[core].sched;
> +
> +	ret = drm_sched_entity_init(&thames_priv->sched_entity, DRM_SCHED_PRIORITY_NORMAL, scheds,
> +				    tdev->num_cores, NULL);
> +	if (WARN_ON(ret))
> +		return ret;
> +
> +	return 0;
> +}
> +
> +void thames_job_close(struct thames_file_priv *thames_priv)
> +{
> +	struct drm_sched_entity *entity = &thames_priv->sched_entity;
> +
> +	kfree(entity->sched_list);
> +	drm_sched_entity_destroy(entity);
> +}
> +
> +static int thames_ioctl_submit_job(struct drm_device *dev, struct drm_file *file,
> +				   struct drm_thames_job *job)
> +{
> +	struct thames_device *tdev = to_thames_device(dev);
> +	struct thames_file_priv *file_priv = file->driver_priv;
> +	struct thames_job *tjob = NULL;
> +	int ret = 0;
> +
> +	tjob = kzalloc(sizeof(*tjob), GFP_KERNEL);
> +	if (!tjob)
> +		return -ENOMEM;
> +
> +	kref_init(&tjob->refcount);
> +
> +	tjob->tdev = tdev;
> +	tjob->file_priv = file_priv;
> +
> +	tjob->job_id = ida_alloc_min(&tdev->job_ida, 1, GFP_KERNEL);
> +	if (tjob->job_id < 0)
> +		goto out_put_job;
> +
> +	ret = drm_sched_job_init(&tjob->base, &file_priv->sched_entity, 1, NULL, file->client_id);
> +	if (ret)
> +		goto out_put_job;
> +
> +	tjob->kernel = drm_gem_object_lookup(file, job->kernel);
> +	if (!tjob->kernel) {
> +		ret = -ENOENT;
> +		goto out_cleanup_job;
> +	}
> +
> +	tjob->kernel_size = job->kernel_size;
> +
> +	if (job->params) {
> +		tjob->params = drm_gem_object_lookup(file, job->params);
> +		if (!tjob->params) {
> +			ret = -ENOENT;
> +			goto out_cleanup_job;
> +		}
> +		tjob->params_size = job->params_size;
> +	}
> +
> +	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->in_bo_handles),
> +				     job->in_bo_handle_count, &tjob->in_bos);
> +	if (ret)
> +		goto out_cleanup_job;
> +
> +	tjob->in_bo_count = job->in_bo_handle_count;
> +
> +	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->out_bo_handles),
> +				     job->out_bo_handle_count, &tjob->out_bos);
> +	if (ret)
> +		goto out_cleanup_job;
> +
> +	tjob->out_bo_count = job->out_bo_handle_count;
> +
> +	ret = thames_job_push(tjob);
> +
> +out_cleanup_job:
> +	if (ret)
> +		drm_sched_job_cleanup(&tjob->base);
> +out_put_job:
> +	thames_job_put(tjob);
> +
> +	return ret;
> +}
> +
> +#define THAMES_MAX_JOBS_PER_SUBMIT 256
> +
> +int thames_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct drm_thames_submit *args = data;
> +	struct drm_thames_job *jobs;
> +	size_t jobs_size;
> +	int ret = 0;
> +	unsigned int i = 0;
> +
> +	if (args->pad)
> +		return -EINVAL;
> +
> +	if (args->job_count == 0)
> +		return -EINVAL;
> +
> +	if (args->job_count > THAMES_MAX_JOBS_PER_SUBMIT) {
> +		dev_err(dev->dev, "Job count %u exceeds maximum %u\n", args->job_count,
> +			THAMES_MAX_JOBS_PER_SUBMIT);
> +		return -EINVAL;
> +	}
> +
> +	jobs_size = array_size(args->job_count, sizeof(*jobs));
> +	if (jobs_size == SIZE_MAX)
> +		return -EINVAL;
> +
> +	jobs = kvmalloc_array(args->job_count, sizeof(*jobs), GFP_KERNEL);
> +	if (!jobs)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(jobs, u64_to_user_ptr(args->jobs), jobs_size)) {
> +		ret = -EFAULT;
> +		drm_dbg(dev, "Failed to copy incoming job array\n");
> +		goto exit;
> +	}
> +
> +	for (i = 0; i < args->job_count; i++) {
> +		ret = thames_ioctl_submit_job(dev, file, &jobs[i]);
> +		if (ret)
> +			break;
> +	}
> +
> +exit:
> +	kvfree(jobs);
> +
> +	return ret;
> +}
> diff --git a/drivers/accel/thames/thames_job.h b/drivers/accel/thames/thames_job.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..3bfd2c779d9b783624a25e6d06368f3e1daf569e
> --- /dev/null
> +++ b/drivers/accel/thames/thames_job.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
> +
> +#ifndef __THAMES_JOB_H__
> +#define __THAMES_JOB_H__
> +
> +#include <drm/drm_drv.h>
> +#include <drm/gpu_scheduler.h>
> +
> +#include "thames_core.h"
> +#include "thames_drv.h"
> +
> +struct thames_job {
> +	struct drm_sched_job base;
> +
> +	struct thames_device *tdev;
> +	struct thames_file_priv *file_priv;
> +
> +	u32 job_id;
> +	u32 ipc_sequence;
> +
> +	struct drm_gem_object *kernel;
> +	size_t kernel_size;
> +
> +	struct drm_gem_object *params;
> +	size_t params_size;
> +
> +	struct drm_gem_object **in_bos;
> +	u32 in_bo_count;
> +
> +	struct drm_gem_object **out_bos;
> +	u32 out_bo_count;
> +
> +	/* Fence to be signaled by drm-sched once its done with the job */
> +	struct dma_fence *inference_done_fence;
> +
> +	/* Fence to be signaled by rpmsg handler when the job is complete. */
> +	struct dma_fence *done_fence;
> +
> +	struct kref refcount;
> +};
> +
> +int thames_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file);
> +
> +int thames_job_init(struct thames_core *core);
> +void thames_job_fini(struct thames_core *core);
> +int thames_job_open(struct thames_file_priv *thames_priv);
> +void thames_job_close(struct thames_file_priv *thames_priv);
> +
> +#endif
> diff --git a/drivers/accel/thames/thames_rpmsg.c b/drivers/accel/thames/thames_rpmsg.c
> index a25465295a177877c5ca2b3c93f52d8288863797..9747690e0f84fe00d605ad0e708d597da2240d97 100644
> --- a/drivers/accel/thames/thames_rpmsg.c
> +++ b/drivers/accel/thames/thames_rpmsg.c
> @@ -11,6 +11,7 @@
>  #include "thames_core.h"
>  #include "thames_device.h"
>  #include "thames_ipc.h"
> +#include "thames_job.h"
>  
>  #define THAMES_PING_TEST_PATTERN 0xDEADBEEF
>  #define THAMES_PING_TIMEOUT_MS 5000
> @@ -71,6 +72,36 @@ static int thames_rpmsg_callback(struct rpmsg_device *rpdev, void *data, int len
>  		ida_free(&core->tdev->ipc_seq_ida, hdr->seq);
>  		break;
>  
> +	case THAMES_MSG_SUBMIT_JOB_RESPONSE: {
> +		struct thames_job *job;
> +
> +		scoped_guard(mutex, &core->job_lock)
> +		{
> +			job = core->in_flight_job;
> +			if (!job) {
> +				dev_err(&rpdev->dev,
> +					"Received job response but no job in flight\n");
> +				ida_free(&core->tdev->ipc_seq_ida, hdr->seq);
> +				return -EINVAL;
> +			}
> +
> +			if (hdr->seq != job->ipc_sequence) {
> +				dev_err(&rpdev->dev,
> +					"Job response sequence mismatch: got %u, expected %u\n",
> +					hdr->seq, job->ipc_sequence);
> +				ida_free(&core->tdev->ipc_seq_ida, hdr->seq);
> +				return -EINVAL;
> +			}
> +
> +			dma_fence_signal(job->done_fence);
> +			core->in_flight_job = NULL;
> +		}
> +
> +		ida_free(&core->tdev->ipc_seq_ida, hdr->seq);
> +
> +		break;
> +	}
> +
>  	default:
>  		dev_warn(&rpdev->dev, "Unknown message type: %u\n", hdr->type);
>  		break;
> @@ -191,6 +222,27 @@ int thames_rpmsg_send_unmap_bo(struct thames_core *core, u32 context_id, u32 bo_
>  	return thames_rpmsg_send_raw(core, &msg, sizeof(msg));
>  }
>  
> +int thames_rpmsg_send_submit_job(struct thames_core *core, u32 context_id, u32 job_id,
> +				 u64 kernel_iova, u64 kernel_size, u64 args_iova, u64 args_size,
> +				 u32 *sequence)
> +{
> +	struct thames_msg_submit_job msg = {};
> +
> +	msg.hdr.type = THAMES_MSG_SUBMIT_JOB;
> +	msg.hdr.seq = ida_alloc(&core->tdev->ipc_seq_ida, GFP_KERNEL);
> +	msg.hdr.len = sizeof(msg);
> +	msg.context_id = context_id;
> +	msg.job_id = job_id;
> +	msg.kernel_iova = kernel_iova;
> +	msg.kernel_size = kernel_size;
> +	msg.args_iova = args_iova;
> +	msg.args_size = args_size;
> +
> +	*sequence = msg.hdr.seq;
> +
> +	return thames_rpmsg_send_raw(core, &msg, sizeof(msg));
> +}
> +
>  int thames_rpmsg_ping_test(struct thames_core *core)
>  {
>  	const u32 test_data = THAMES_PING_TEST_PATTERN;
> 

