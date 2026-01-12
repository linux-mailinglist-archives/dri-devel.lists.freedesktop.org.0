Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C87FD13587
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 15:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC9B10E0BE;
	Mon, 12 Jan 2026 14:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KJO7jv7r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010029.outbound.protection.outlook.com [52.101.56.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E6A10E0BE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 14:56:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXREwUMqKlgH/M/afb8lOyUlCAZrnc3hMBp6qR2gpmRQrIdKyWA6JGoCyAGesaFica+UHeyQyGE6twXcuVPBt7w79+YzBBu2SbhhbS+jaxchvgf1CwuwcVtQqprJKQg/cwaTnYp/gHpYYkEW0sCvrLScZXP7fCuPIskm5X/jiwln0N/d4f6phOX8+M9eua1Y+SQBYpzPRsIOtUtek9CoXaw6QEf1yMzzQVSONjY/2kim8gTalPpDry+KDIUjAsQMmwSCRW1gpsGUlqgw+lehtWHY0R0JzaqXDqzamM3zNaWqusdHnJK5mM0H659H0YTVALH+OpkO+sIys1eHz2oQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSPK60YoGahwIv93vY5tyv7YvlL0ESoZun9xjYX6M/Q=;
 b=rczYyn5orGmw4m8e2kv7167a1baXi59kl1cK4w3qTGa3fcHffHajfm84a7muFrdhb9v7cJ9l53+0jMRoI8WSp9l8F0Zfrov3c4bMGmTH8tsGDlmjZWSkCJX/uLEs77LaTK2wETT6ULr+IvoPoGLSGcZ1+pFU0DGwekg0vSOzthH4EyiLjzcldE8+6hUD45AZUA2ZOTFLPWPAcCObTd/0NlYSuC+J3/+lJo0ssiN3lTjMIiyj6IjtZMoVfS9+Jcdm8U3x6fwG8pwm1gGD7BXs2vOZCfoGAFfsF17mU3GUXjGCnV23V1DnruvQr3MGTZ89+2M4v5VDqHIpWvTLBtTW1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSPK60YoGahwIv93vY5tyv7YvlL0ESoZun9xjYX6M/Q=;
 b=KJO7jv7ro51CSQ0iQNubUFrXM5Bpv+Rot3eRVFvJpUYpQ30S7B2qpsJu4J5iwBhAQfF4K/pHNh0VqTPqdzezYI2IfeYG3WV/99J+2O6OO+Tj/PoYnMGEabc6RmzPS1Q1ZCPufz6GgUTpVG+pdIZ+KDfcFl7mBln3DIiHRoEelxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8526.namprd12.prod.outlook.com (2603:10b6:8:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 14:56:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 14:56:38 +0000
Message-ID: <f7f1856a-44fa-44af-b496-eb1267a05d11@amd.com>
Date: Mon, 12 Jan 2026 15:56:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] dma-buf: add revoke mechanism to invalidate shared
 buffers
To: Jason Gunthorpe <jgg@ziepe.ca>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Williamson <alex@shazbot.org>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org, iommu@lists.linux.dev
References: <20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com>
 <eed9fd4c-ca36-4f6a-af10-56d6e0997d8c@amd.com>
 <20260112121956.GE14378@unreal>
 <2db90323-9ddc-4408-9074-b44d9178bc68@amd.com>
 <20260112141440.GE745888@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260112141440.GE745888@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0398.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: eda155c2-f9da-44f0-68cc-08de51eac9cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDNnVFcrUnRjOVREQk1FTndta1R0azBJNkFqd2JOWGxhZ0JzcEMrQTVLTCt0?=
 =?utf-8?B?eGxQaWtvM0VIZXlXVkZTVlZvbllxcHR3OC9KdlByTmRiKzBGUXMvWGxoYTEr?=
 =?utf-8?B?Y1QwbzZrNkJFVWgwbFlKTlRMYjNtTlpHNlN4VFV4Vndhd05ENTBMeU1EbUhI?=
 =?utf-8?B?S29GbVVRNmZzTTgzc2RGTmZwMlFJYnFVNXJQazl3cmNlMSs4Z0RJWnpKQmNo?=
 =?utf-8?B?ZnZBUVlFUkVBMnRxdEgxVXpTcXl5aVJxZlViMGVEbDJQNkNLaDR2WkpVSnFm?=
 =?utf-8?B?RU9aOUw4YW5oUlZwaTdzNmNlQmJtcmk4YlN6cG9PMUI2b2JrREJLQk1rSkFW?=
 =?utf-8?B?ak5iY0U2UGVBNE1yRHgyMi9aVjNRZkExY2I1VnRrcmNQVzdZRUVlSm9DS3NN?=
 =?utf-8?B?TzloN3U4NTYzT28wQkh6M2IxcXkzVnYzQlJIQklrSGR6eEtYRWJ4STRRckhs?=
 =?utf-8?B?K0N1L0pFQ0E2L0crd256K3oyaVJHeFZLRkQ0UEFDM1owYlkwYVd0SHE1dkdZ?=
 =?utf-8?B?Ky8yYVFzRFhKaHl2Mys3SENTN2JlOHBiVnNYREEyQStwK1J1aXYzRHVhdG5V?=
 =?utf-8?B?MkpJOWJpRWlwbUxsWmQrbnNqbUxTaWFYaDV0L1VKWUxuWVJiQnk0bEVnRGc4?=
 =?utf-8?B?MG9mTmlVTGhHckZXajFWZTk5UGtEQnBFRnFscUllSUZEUlRNam1GSUQzUEt1?=
 =?utf-8?B?Z0NTTWNyc0E0QkJwbm01dzluSzg1bTBhQXlyRmsyRWlYN29OVEt6SloxYkhl?=
 =?utf-8?B?RHhEM01qNmx4NmJoVVBHN2RocHpBYnhIZkNYcXNtTG9wWCt1ZWpOZGZYVVU0?=
 =?utf-8?B?MWViY0pDZk9TR29Sa3pCRXB2YlhSUFFtV1lxb0Z3SXFlL1pUQ0VuRUJOVHY5?=
 =?utf-8?B?OE1ZaGY0MG5CTXNkNWdFeEcyR3BsUVVZRXZYQmlXeXYrUTZPMEZkeTBYUklY?=
 =?utf-8?B?ajRuakVFV2VZSUVjeHNLazJzMzNkd2xLV1QyUnlsMi9YdDgyNnlraWZJT3o5?=
 =?utf-8?B?a01McjZ0WHVOWUEzcVFEZzJWc3FFUmFycUFvNW9BYzlqdTUzN2JsRG1QOW5i?=
 =?utf-8?B?TGxTM2t6Z05IZFRYeXB0TmFZYTZURmE4bU42VDIvZm5KQ3NyTW1sdjdhcWZV?=
 =?utf-8?B?ZFhBMExKc21TR1pseUwxOTU5RFJISHJ4elV3dVZvdktJdjVkakt2dnJvSG16?=
 =?utf-8?B?OUc0aVIwUSs2UHdobWh0a3hGSFZ2eDFMU0lPVW0xM1BRdTBZVzhoNDZPUWNE?=
 =?utf-8?B?WDR6STVqS2RzOWNwUlB4clREQnZuK1ExNjRrTGlwL3lEZ09vYVNxd3BRUXN6?=
 =?utf-8?B?VWhLZTNLMzlVNHdRUzJTdy8zSENtUmYyalNTY3hHcXM2SGRrSWRzalhEbTcx?=
 =?utf-8?B?aWVIakxlVzhTdmpjUHB2K3lsbWdsN0xqcmFna0N2MXlaRnhRalEvc0l0Qjd0?=
 =?utf-8?B?TXBiMm5lcS82SEtUekxZM3Q3cjU3bnpHOG4rb09ZUEdGdTBTSzZEREprKzBs?=
 =?utf-8?B?bEovUldBRDVJY3VISlA2MzFoWmhkdE05Rnd5NHFUQ25FZDJvSThGK3I3djlX?=
 =?utf-8?B?Z2t0b0dCRjQxRGp3WGU4R0pzNm4zWEJwRGMvY1JIWTBrMzc2c0tDY0s3Ukln?=
 =?utf-8?B?RUIyQ3QycTJvQjA0RHFlUExHZksveXdvd1J6ajYwYThINTRnQVhRZHhtZXZs?=
 =?utf-8?B?NzV3cUU3Smlpc3czU21FNEc0eDc3dFRTRjNFTHNEU29QMEhlaWZEVkpucENT?=
 =?utf-8?B?NkNna0x0SXFObzlOZ0d6b2hvd093MFNPRXZDNnhpY2lRUjM2ck5DSlp5MFQ5?=
 =?utf-8?B?SjNwQjdDMm1aalV0ZVdrcHUyc3FMN2JsSmtzYzdNNlJJcGdjYVUydUJNVThs?=
 =?utf-8?B?ZDh0TEJnbjF2alROZWZ3dTU1N0Q1U2VsK0h2RWNvQnlnY1Q0Q1BURzdWWEVw?=
 =?utf-8?B?eithWnNHa3l0R2ZscE5Tc2s5NUdDamNSTFNXbXhONldyeHF0SVRLVjcwalpy?=
 =?utf-8?B?MzFtbDhNTExRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akhTOWJXbEdxNGdXV3UxVEpxYjVwamtLWU1ZbmFjV2cwNWF3M1hWR1pFelhj?=
 =?utf-8?B?SzM2REladGN6UWZkdmNRdnUwZ1RpbmdlWllnUnJpd2FIcFJqMk8rdGhvTGFD?=
 =?utf-8?B?TzdZT25ES0lSVGdpbUZSaXBpRjBqOVBVU3lUdG91SFRxZEE2d1pDeXZUcFZj?=
 =?utf-8?B?OUxOeVRWWVlGa0VYbXYzYmVmVG5ZcXRwMlpxSXMxT0xsUktHR1RVVS9iUXZP?=
 =?utf-8?B?S2VxM3llUDB2N2JNSG9BdHJIWmpjSXE4YWUvYXB1ckc0NzJ0aG1jQzFzNVN0?=
 =?utf-8?B?aGh6aldOT255VzNVbkJxV09qbHZMYkI5WGJpZW1SZ2x6cnpxQnBHaEEzRjJT?=
 =?utf-8?B?RTU1ek5QMU5OZGsxOUNTM1dybDdlY2o5Nng4QjBiZFhBdFdmNTg5b3RETVVt?=
 =?utf-8?B?dDV3bzg2dXNkckpsUjRYNEhaUkFDSHcvZlRTRnVVOUpSbXliajBLVjgvYmd5?=
 =?utf-8?B?T2hsRllVbU51clJEUWRtdXZYWk9zc0I0dzQvWmc2YytPTFcwY1BqVnRiRVVk?=
 =?utf-8?B?WDNvU01tdVUyNFpZOHliTUE0TG5TREhpTTkxanBycmFZajBaL0dZRnhwWlpF?=
 =?utf-8?B?aFlTUDdaRXdneGRBcnoxdmFIWno5a0hmUEhmNm9ucGZlSU4ydk4vdGFyL1pv?=
 =?utf-8?B?Q0l1OFRYcitFV3JlVjNsL0N6blF0a1JCRXlOTjVuQkVNVWt2em1XY3V3N05G?=
 =?utf-8?B?UEZ1a29WSGt6akM4WnUycmpKYm8vSWViRjMrSTJ6LzErR3IyazRGY09CNXE4?=
 =?utf-8?B?WjFPeDRzMncvVmxKM0FXVDFOZVF0MUpYVmVrTXAyKzFjNnJ6SldEb3NjNE5v?=
 =?utf-8?B?QWE0K1F0TitTTkpIdXo5RzBWOXgyR0ROaU9xZ3AvdW5aa2U1QVFVQ29WZ3ZW?=
 =?utf-8?B?cjUyQXJTc3FzbXdZalhFbnQ0cTRVYVFySG5vNjhZQWkvZldPRTFiSVRDL2Z6?=
 =?utf-8?B?UlU1VmZSWkphLytxQk9LQktXM0NvVE1KSUVVc2J4eEFBbm9KRkNhc3BkUlhS?=
 =?utf-8?B?eHc4NmYyc3U2NEpEV1V1Sk9UYUZ0cEdjRlQ5RW0xOUc0cStBaG9LazM1ancy?=
 =?utf-8?B?d2NleWUvSml4NGhibUFLMWE5OXI1TUNpT1UzK2tDYXFPb21ueThWci9ZMCtY?=
 =?utf-8?B?UHRzMmZFWUc0TnJoS29VSnRnMndpYTRtZkZEaFhLaFVxSGFKV0F0RVBjekdh?=
 =?utf-8?B?dzEydlRGMlU1SHNzMzFMeHRWMEQxSVYybXBkK1MwK1JtRCtRVHRqSGxxS2tH?=
 =?utf-8?B?cEdNZHhUaDNYRWUwdWZZclp1UmgxUEhyQnc5cWszOGZWeTdFRlpzbVg0V1U0?=
 =?utf-8?B?TXNpMFRBdk5tKzNqOVNRRFNKTWRrbWZBRHM3eTFUVSttNUh4SUs0NEhvZXZu?=
 =?utf-8?B?eUdMeEpRd0dJUXJES0ZON3o0VGNGbGs1Mm5Mck0rakQ5Q1FiOVRBMC9ScWJp?=
 =?utf-8?B?SDBGbEpERkNJbGgzdjU2NGNpWnY3MTAyV0tscnJ5bjJwaW83MnVDVVNqMWNu?=
 =?utf-8?B?SWJ0dzdTODU0T2pUbk51bUZwNG9WcU5sMzFqbDdHcmowUy9Td1g4NkJxNEdY?=
 =?utf-8?B?aGVoN2xDcEZJWmJSNkxHdis5SEtMVHpDRWFVRzYzVGFrS0RUNU9abUZqUEds?=
 =?utf-8?B?NWNMazYvbjdRcHhTZnZOd0JtK0s2QmhSN2FmdGNRdVdXd0h3ME5EY2xYSWdF?=
 =?utf-8?B?M0srS1FHUFpnOHJVUWErWVFoSVRUa2Nha2w1STJhaTN2YVRNSFZyc21JdlY3?=
 =?utf-8?B?RHlVb1dib2wrejVndWNLRGdNTWNLanowK0FRcitNa3M5b3VYS3hTb1JyUkZ6?=
 =?utf-8?B?SHI2eFh1SVRrSEYrRDd6dVVGSzhVUmdMa3d1SEpxVVNYbVZXdS8xOXJMcjFL?=
 =?utf-8?B?alFzbUFVYXRIZzVWR0prODdpNU04Y3EveHdWWEo4S0ErUjlZTVFIM0IvU2Ja?=
 =?utf-8?B?bXg3UldNSGZpSjM2VjZWZ3dxckRnQ2tTdVRWb1NBU0hqWUdDU0NYdm51V0hB?=
 =?utf-8?B?c0x3ZVFRNzMzYk05TXVHdEQxeTZ1d05yNnFNMElnNmdCRlcxY2tsYWVobTVM?=
 =?utf-8?B?NW9VbnlHU0I5QzJDTWZLb0MyZzlmeUJGdHpTNnRraHhQejVjamNDVC84OERn?=
 =?utf-8?B?eTdvS1IycXlhRWp4UWVtWVhiR0w4M0pPWkpldjBLTnJKWDUweHMrR2VRM2hD?=
 =?utf-8?B?TlZXVmhlVi8xQVBCSzhBdzF5anV1SUdmTytuZVZ4YTZLY0d1Nk9XallSbmY1?=
 =?utf-8?B?cDdpYml5WGJtWEFOb3QxQXhIN0QvcjJqWjJWR1VnaXhIM1pzNWthSVNaUDhU?=
 =?utf-8?Q?fovrMIZezKDeZDKhbw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eda155c2-f9da-44f0-68cc-08de51eac9cf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 14:56:38.4621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Whwq1c/yCYbCmiiHcuiuxpEppDWTRfNr8YPodUQhueuipAqZpHM90d6LpjowJXV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8526
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

On 1/12/26 15:14, Jason Gunthorpe wrote:
> On Mon, Jan 12, 2026 at 01:57:25PM +0100, Christian König wrote:
>> Clear NAK to that plan. This is not something DMA-buf should need to
>> deal with and as far as I can see is incompatible with the UAPI.
> 
> We had this discussion with Simona and you a while back and there was
> a pretty clear direction we needed to add a revoke to sit inbetween
> pin and move. I think Leon has no quite got the "dmabuf lingo" down
> right to explain this.

I was already wondering why this was clearly not what we have discussed before.

>  https://lore.kernel.org/dri-devel/Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local/
> 
>    Since you mention pin here, I think that's another aspect of the revocable
>    vs dynamic question. Dynamic buffers are expected to sometimes just move
>    around for no reason, and importers must be able to cope.
> 
>    For recovable exporters/importers I'd expect that movement is not
>    happening, meaning it's pinned until the single terminal revocation. And
>    maybe I read the kvm stuff wrong, but it reads more like the latter to me
>    when crawling through the pfn code.
> 
> The issue is that DMABUF only offers two attachment options today, pin
> and move. iommufd/kvm can implement pin, but not move because they
> don't support faulting.
> 
> vfio and others don't need move with faulting but they do need pin
> with a terminal, emergency, revocation.

Yeah, I know that this is confusing. But that use case is already supported and we just need to properly document things.

The move_notify callback can be called even after pin() in the case of PCIe hotplug for example.

We could potentially rename the callback to something like invalidate_mappings.

And yes, I know that we had a few issues with that because we didn't properly documented things...
> The purpose of revoke is to add a new negotiated attachment mode
> between exporter and importer that behaves the same as pin up until
> the user does something catastrophic (like ubind a driver) then a
> revoke invalidation is used to clean everything up safely.

With or with pin() you need to guarantee to the importer that the DMA address you gave out stay valid until the importer had a chance to free up it's mappings.

It is intentionally done this way to properly support PCIe hot plug because even when a device is gone the address space can't be re-used until all importers stated that they stopped their DMA.

> You are right that the existing move_notify already meets this
> semantic, and today VFIO exporter, RDMA ODP importer even implement
> this. Upon VFIO revoke move_notify() will invalidate and map() will
> fail. RDMA ODP then HW fails all faults.
> 
> The problem revoke is designed to solve is that many importers have
> hardware that can either be DMA'ing or failing. There is no fault
> mechanims that can be used to implement the full "move around for no
> reason" semantics that are implied by move_notify.

In this case just call dma_buf_pin(). We already support that approach for RDMA devices which can't do ODP.

Regards,
Christian.

> Thus they can't implement move_notify!
> 
> Revoke allows this less capable HW to still be usable with exporters,
> so long as exporters promise only to issue an invalidation for a
> "single terminal revocation". Which does nicely match the needs of
> exporters which are primarily pin based.
> 
> IOW this is an enhancement to pin modes to add a terminal error case
> invalidation to pinned attachments.
> 
> It is not intended to be UAPI changing, and Leon is not trying to say
> that importers have to drop their attachment. The attachment just
> becomes permanently non-present.
> 
> Jason

