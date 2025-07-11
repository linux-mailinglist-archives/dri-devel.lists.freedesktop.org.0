Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34D5B021A4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 18:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5779B10E0A1;
	Fri, 11 Jul 2025 16:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zAWk1oKv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2076.outbound.protection.outlook.com [40.107.212.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A209710E0A1;
 Fri, 11 Jul 2025 16:25:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHafuT/Sfg+WnV9p1HjuZoXo2eJ1rYURzBKOOGZsGC5wtkSSFlGBaxIjxm7SITMTjteHwurYu+v11S9WG2a1ETHwE1L6GAKwACwrMRdXZ9LqFyC0UD6MIRGpHzyU3LEJQ1Pk26n6IOun4W2BMTeOH9pDDTvzpWXimIMaXlteNGRod5b09DAlY4i6Ihxi5exi4+DLh5VgW7UUtrPq1zlMfeDkq8a7ak8bmtn4znj9ohqsYzSEbXxB8XdQ89j/kAju9QAqDJIEEqYXDrKdxrJoMVxcxoPdshb47oLtQc5qTHsn/wdZWwSIDrzuEj2yKyZdPpU/Ddz0kf2u7wOAlk4LPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NL61dVZRUXBwsO438SpGr5nMhEez5bbHlU0J8sC5+sM=;
 b=VZP6IUgIHTr2C18v7xSEJK4ith7zseILmmOAFgXklyQR/PDbDvUCxghmXR87pXocNpf05CWnkvzrCLDhqCXovHaSfiKQYdWmV2rR1tOHiI+V85oKOX6zzHttoo8ISW/b5oNgY9O7ulWm0elmhrJ4XV1ptKPEsL2UdFv1yrzmpItfqbjxzlndN3WOtvxdD2VvzNhJD9jpnI0EW5Oe6xHqmikIPHv7+R+aJZFW8t+WHlrULwB7f8/AnLjC0uJO+dayiYytTrLVGCVfId4nDVET9QxnaYd9PGFcjkWrcf+FnnfutLrngOAV2V2/VnpJJzUdF4dXhNNw0kmcmUVOuFhYwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NL61dVZRUXBwsO438SpGr5nMhEez5bbHlU0J8sC5+sM=;
 b=zAWk1oKvsYpxJug9bfEfx1RZpLslfCch51p2yEOQAdp5dpTPyLXH07Q+o9r8k67NaGjUUzoSIAhivnO3RVHMb31ZRmIYSChzJ9JuOjlgqD5EnWfkzMOAknzpO5iVJm6CQBCU32uzzLqrQWzRT9LdJTwVPTy37ma+n+azTPj1Ov0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MW6PR12MB8914.namprd12.prod.outlook.com (2603:10b6:303:244::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 11 Jul
 2025 16:25:11 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 16:25:11 +0000
Message-ID: <6aaddd3b-5475-4341-b816-711cc6dcf4f3@amd.com>
Date: Fri, 11 Jul 2025 12:25:09 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 33/46] drm: Add Enhanced LUT precision structure
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com"
 <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>,
 "agoins@nvidia.com" <agoins@nvidia.com>, "joshua@froggi.es"
 <joshua@froggi.es>, "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Shankar, Uma" <uma.shankar@intel.com>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "marcan@marcan.st" <marcan@marcan.st>,
 "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>,
 "arthurgrillo@riseup.net" <arthurgrillo@riseup.net>
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-34-alex.hung@amd.com>
 <SJ1PR11MB6129B6D3BF76BA0A517B2FF7B949A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <SJ1PR11MB6129B6D3BF76BA0A517B2FF7B949A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::17) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MW6PR12MB8914:EE_
X-MS-Office365-Filtering-Correlation-Id: bd827802-8bc1-4afc-7532-08ddc0978239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTdydU5RNFcyTXRhZmR6Q2RUcEd5T3JQZGVJdHNoT2pxRnFJNXNWSVdOV2xo?=
 =?utf-8?B?bjgzb3ZaOUVQQ3h3NlNYYmFESGNGMmJBUUlBOGI2c3Rzc0hNMXNVVkRPZG1y?=
 =?utf-8?B?NFJvaFhNUlljaXQvVnpNYW00SDBhQUtuNTFvZjZjZlRkdkZGVzY0QU9YU1Jt?=
 =?utf-8?B?SXlJQXVpaGF1NHVrVCtvVnpBY2lSdEcxQkNDRnF6U2FaSzNEeDlaNVhURUNJ?=
 =?utf-8?B?bCtHT0t5Yll5SmYzeUpBN0VweFlRcnhzR1Nhc09IWGVMajhpdFRnQmpLRkE0?=
 =?utf-8?B?TndmNDgvelhja25VWkYrQWJSWlg3NzJQVUxjckxzRzJIT1g4MlljK2VNdFFo?=
 =?utf-8?B?Sk9YYWJYM0ZyUWUrbjhETlF5WWZBOUxkNkpwYlQ1QWNlYlpTZURsYVhPcTFO?=
 =?utf-8?B?SzVGR3AwYjU3MWZVa3lvODNaUndTTytiUVlldU8zWHViNWFhTnpIUVFrUk0y?=
 =?utf-8?B?S29yNXIzZGE0SmFSdDZEUFdIcWRmQ0tqZVdGRHo4Q0YzUlhzcSthSWY0VDMr?=
 =?utf-8?B?Y2wzeGNtUE5keXRXaUhGL1VaY1VvSjduYWdmOVMrVFZoMWJ3aFVLMzRLWllE?=
 =?utf-8?B?dzFXYi8xdDRNck13NkFBU1drUUZXbnA2K2NROHpqQTFRZmp5T1gwZE4rOTVV?=
 =?utf-8?B?dWNoU1F3TUxrVmJwT1pIZDc3cWFFRUg2N0ptODZvZmRKbGdFV2VYeFJzQ3k1?=
 =?utf-8?B?eUJGL1JKRG41SVZmbm5FU2hRNjN0VXdOVCthM205SDJlVC9oZUVKeURXM05Q?=
 =?utf-8?B?NjBqYzROQWlsQ0RxSlBSTGJ1YjhxaW1GRUE3eUNkTm1ERDVnZy9SZUR3ZU91?=
 =?utf-8?B?MUk0akNwc0lwUExKeEdTTFpxaUpGb24yd1daK3RxSExhMXBYS20vTmRibGo1?=
 =?utf-8?B?QWMreDdXMG40RzBNbkp4c3lCbHlyUTVjL0wrM096WG85QXV3d0hDZEdSRkpZ?=
 =?utf-8?B?T1k3OUJVU0RwVTRCaDl0TUF5NHB0ZFNYQVNvTUd3Rlg1dFJzcnY2UlhPYm1w?=
 =?utf-8?B?RllYQmpsRVFiL1hsbGpJMUtyVmY3eFpCZVNJTGZrTU1jNXNjSWpWRmhxdmRp?=
 =?utf-8?B?UDltNjBwaGJtanErdU94SHZxVlVVSFpPdEd2MFkvbzM1ZXc0Y0pNbXhDc2hP?=
 =?utf-8?B?dWMvU05VWmwwd0JoUTFhbFBTODVCRFJZRVFNOU90a1hnZisvb0dldlJIWW9z?=
 =?utf-8?B?SmUra3NKZXpwdGdsY1ZudjdWQXRBOEJCWW5tMzYzbWhzd3o0MU9SQ2J0Tk5m?=
 =?utf-8?B?SkhvOGk0NUx4Q29GN1NHc2tBTG5KWUJGeW5SeEpqOXhUYTA1SG9EUmYrT3pP?=
 =?utf-8?B?MmhoM29nbVZFNGtVRWgrejZmWnpvL253NGMwei96TWlENUdqMkJPUVhqNEha?=
 =?utf-8?B?LzdUZ0I4Y0tIek5zUTBNSzh3Z2c0S1JMbGxld2w1eldUdkQxbGpVeVhsVnVM?=
 =?utf-8?B?UHpudEhQWCtHZE1FWmJEOGppRkxqajBWVEpVOVhNNjRRdkhldXJXWkVuWGs4?=
 =?utf-8?B?VWsxTmhEMElyTE0vRWNPdmJScmZXYlJodnFqcEtQU29STzN5Y0R3TGFuQ3o1?=
 =?utf-8?B?WXhUUkd0N29YTGFrcGRrZjlKMHhEd1NTN3pjMkhWVXFyOTBpZXRHdGptKzFI?=
 =?utf-8?B?aStzL0tmRUJQQVo5ek9NZkpaQlVwZHM4VDVkcUVvSzVOU1ZCTEJCY1IrLzVF?=
 =?utf-8?B?YzFjYmw1UXpTaGxGbU9UcXI3cnN5QkNoMlpDM25JTDZSSDRWNmEyU25FZmVh?=
 =?utf-8?B?cU9MU3JjVko2Y0tYYjlDL0FDemIwS2lLS3JMV3grSSswWG43N0dvVkxxcklK?=
 =?utf-8?B?cWdxTHRrdXl5WTE2d2hXTW90Y2pTTVZmc1dpRzFJTDdqdXBwcWxSeVNDVjZC?=
 =?utf-8?B?S0YwZFcvdEZ2cmZlUGwxOW05YU5sUkQrb1pxamFpZkk4UklSUmg5TU9ya1FT?=
 =?utf-8?Q?ZNWamgiojG0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVhIVnNaNEwrNndPL2JtcDUvWDJtZEkxdTRESzdVNSs0RFI1dlo2UWJqb1hQ?=
 =?utf-8?B?VitsL2pGanpQNkJmaVMvd2hYSVJ0UktEdnRZa2psZXdnZ1BSSGp0RlJNOUt1?=
 =?utf-8?B?RStOZVZjN0tiWnBhTjJhSzhNYXNkV292S2k5aUVLZlR1ZVMzbmhjcENqYkt4?=
 =?utf-8?B?cFM0Z1Z0VXpBdWxhOVRPS3lSNncxM3J1MTRCa2VBKzRKRXFLWi9QM2pQZmZT?=
 =?utf-8?B?WUtNUDFZOGd5T0tkc2xxSEZ6TFN4WjVRdERRRWZNeFhNcDRUeVdHdkFIUW1I?=
 =?utf-8?B?Qmw4MmwvSU04a1NnbHlHTjRIYmdQVDFkY0hxenZlNXVQTHJCaTh0azFHMzFv?=
 =?utf-8?B?dEc1TFc2RmRYbytIQzVsaVlaMjN6N3RWVHY1RnU4MDJuWUs2QzhJanZlOEg1?=
 =?utf-8?B?LysvNDhUWHZvZ0lkTGVyWjkwYjNWMFoxaSsxTXNyaEY1Znp3M3NycTBIVnJx?=
 =?utf-8?B?TlZ0UE54Q25iRWJseVlCUVNTUVptSEhRekMzSVFKYWc5UVR2ckdDdHhyQmpG?=
 =?utf-8?B?ai9kWUZBUXVwck9nSWt4NERlbU1zb3F0WmlLYURnbytyVGJ4ekpGZ3hlNmFU?=
 =?utf-8?B?ZHFvc241ejFRbVY1aXFIVlM1TUQ0V3I1b2FudmtPWVN5bkRqZTdPR0V4d1ZE?=
 =?utf-8?B?VnNiQjMzMGpVUjM5bGVHU2tnZURPdTY5dXI1bHJqUkhoZkprekF0ZDhaMGsx?=
 =?utf-8?B?Wk9QUnV6WEZSdHBJOHpZaGpJV1ZlaWVncmw0YUZBQWhkNHk1NUVFUlp0YXVW?=
 =?utf-8?B?aDBOZWU1dHI3V015OE1meXJuSzNKOVpacHIvV2Y4UkJtL3p6blV5eDR5SitP?=
 =?utf-8?B?c0NES3RYWGRnSG9yMHlZbWZoWkdEV0xLeUpXWWZKWFV6VVlubVBnRkZwMkdy?=
 =?utf-8?B?SzEzcXF5VWcwVVE3RDZqVlZESkhuTkM3MFhzZmFicEJUaWZPbG4zb1R3YlY1?=
 =?utf-8?B?ZG5OUVJMcktxVVRzRHhLU09neE1HUDhPSHpNWVA0L1FmU3NYWDVsdjl5KzRJ?=
 =?utf-8?B?NXBWK0dpemdzSkxLSUlSekhXb2FhSTVYVys4a2Y1MzhIeUlHUlpDSGZIK0pW?=
 =?utf-8?B?MnZuekdack0yYnU5SUxvcW9HR3hFN3RtNVdDZFlFa1d5VitpUGp6YWdPaTc3?=
 =?utf-8?B?c2RXNm9JTk5ZS1p2eDQ5d2VQOVY5RmdidGdoZk1qd0swVmpKc3d4dTVDaE9k?=
 =?utf-8?B?N2VvYklabWtPc3R4R3BEeDlBTWdLdFN3VEZIemFRODNvejcwdkw5UGJlQkIr?=
 =?utf-8?B?eXB6U0U0V3g5SjRxZUNpUlQ2T1BTeVhVaHNWOXl0Um9qZ29TVng3amYrb2tU?=
 =?utf-8?B?V2ZIVVcvZGt1MEo4Vm5yMmlMbm5UYWVRNXJDQ3pURXdlQVVWMGlneks1Kzl2?=
 =?utf-8?B?TGxpSHl4UTdCUXNmZ0VpbTZDMFFGNXpPRDBMNlhhRFFybDN5SlFNWVlyV0pu?=
 =?utf-8?B?cWlLc0k1S3E1SS8zanBqOUoxY0FRNnM0L2Ezb0xhVlVUT1U1S0g0VW9tZFkr?=
 =?utf-8?B?ZkhIV0V6NjVHTFF4Z2tVeHpWZzBxYVBOS1ZxbXBEdDdSWXhYOGRPWHNXaUVB?=
 =?utf-8?B?WjVOOTZ5ek5XbktERkJVUVVrQTNGWXlLd0lRYTl1V1lHelF3SDZrVmhsYTZs?=
 =?utf-8?B?UC9BSW0wVzhicWVSQk8wek11dlNQNUM3TE91TWhMM0h2ZGpPWUxFM1NSMWdY?=
 =?utf-8?B?VUpsS0tDTll6cDh2S3hRRHpyZ2N6dm12Qm5lQWdjUDVFelc4Tzh1bk1sZWZv?=
 =?utf-8?B?STh5REl3Mm5GaHdUUkhFV1FMVHF2WlBuVFJmTDZPTlU1NHphOUk5MmlyT01X?=
 =?utf-8?B?eWxrNjJPWTVadmhRTDlscndnWFc5ektzZnRJVVd3aGhHL3FHRFNlTmZrMTQr?=
 =?utf-8?B?RURiZEhpTlduejdaL3pQaUVGZHNpQnRrTk1jdHRPQmJLR3BRSjBZRERGV0xZ?=
 =?utf-8?B?TU9ZV0Y4dG9VNkhBdElPWElyQklFcnFmb3RmK3JJNHBENGdLRUx6a0thM1Mv?=
 =?utf-8?B?dEFtT1A5c1NUTzlWcThNMnN5NC9jZ3hRZ1VXby9IYUVzTTdiQ0M1OHpwNWND?=
 =?utf-8?B?YTBWNktka2p3akdaVUZCa0V5YkxDUUh1OXdBaDIydkVDcWx4aU9GNmkveGZo?=
 =?utf-8?Q?bXdHNo4lTxVaK8G/82ysGzZWr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd827802-8bc1-4afc-7532-08ddc0978239
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 16:25:11.5889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QD+nS6dVDOCGVELQAlpdKWcbmF0tDwRD0nGqtI92aZBRHR2jmQzsAQrakRMlvVFJ3XbgJfNXu/BEVI5DxgcZkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8914
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



On 7/9/25 14:49, Borah, Chaitanya Kumar wrote:
> Hi Alex,
> 
>> -----Original Message-----
>> From: Alex Hung <alex.hung@amd.com>
>> Sent: Tuesday, June 17, 2025 9:47 AM
>> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>> Cc: wayland-devel@lists.freedesktop.org; harry.wentland@amd.com;
>> alex.hung@amd.com; leo.liu@amd.com; ville.syrjala@linux.intel.com;
>> pekka.paalanen@collabora.com; contact@emersion.fr; mwen@igalia.com;
>> jadahl@redhat.com; sebastian.wick@redhat.com;
>> shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
>> mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
>> victoria@system76.com; daniel@ffwll.ch; Shankar, Uma
>> <uma.shankar@intel.com>; quic_naseer@quicinc.com;
>> quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com; marcan@marcan.st;
>> Liviu.Dudau@arm.com; sashamcintosh@google.com; Borah, Chaitanya
>> Kumar <chaitanya.kumar.borah@intel.com>; louis.chauvet@bootlin.com;
>> arthurgrillo@riseup.net
>> Subject: [PATCH V10 33/46] drm: Add Enhanced LUT precision structure
>>
>> From: Uma Shankar <uma.shankar@intel.com>
>>
>> Existing LUT precision structure drm_color_lut has only 16 bit precision. This
>> is not enough for upcoming enhanced hardwares and advance usecases like
>> HDR processing. Hence added a new structure with 32 bit precision values.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>> V10:
>>   - Include drm_color_lut_32 from Intel to support 32BIT RGB in 1D & 3D
>>     LUTs (Uma Shankar)
>>
>>   drivers/gpu/drm/drm_color_mgmt.c | 43
>> ++++++++++++++++++++++++++++++++
>>   include/drm/drm_color_mgmt.h     | 13 ++++++++++
>>   include/uapi/drm/drm_mode.h      | 11 ++++++++
>>   3 files changed, 67 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_color_mgmt.c
>> b/drivers/gpu/drm/drm_color_mgmt.c
>> index 3969dc548cff..83dc850d3b54 100644
>> --- a/drivers/gpu/drm/drm_color_mgmt.c
>> +++ b/drivers/gpu/drm/drm_color_mgmt.c
>> @@ -630,3 +630,46 @@ int drm_color_lut_check(const struct
>> drm_property_blob *lut, u32 tests)
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL(drm_color_lut_check);
>> +
>> +/**
>> + * drm_color_lut_32_check - check validity of extended lookup table
>> + * @lut: property blob containing extended LUT to check
>> + * @tests: bitmask of tests to run
>> + *
>> + * Helper to check whether a userspace-provided extended lookup table
>> +is valid and
>> + * satisfies hardware requirements.  Drivers pass a bitmask indicating
>> +which of
>> + * the tests in &drm_color_lut_tests should be performed.
>> + *
>> + * Returns 0 on success, -EINVAL on failure.
>> + */
>> +int drm_color_lut_32_check(const struct drm_property_blob *lut, u32
>> +tests) {
>> +	const struct drm_color_lut_32 *entry;
>> +	int i;
>> +
>> +	if (!lut || !tests)
>> +		return 0;
>> +
>> +	entry = lut->data;
>> +	for (i = 0; i < drm_color_lut_32_size(lut); i++) {
>> +		if (tests & DRM_COLOR_LUT_EQUAL_CHANNELS) {
>> +			if (entry[i].red != entry[i].blue ||
>> +			    entry[i].red != entry[i].green) {
>> +				DRM_DEBUG_KMS("All LUT entries must have
>> equal r/g/b\n");
>> +				return -EINVAL;
>> +			}
>> +		}
>> +
>> +		if (i > 0 && tests & DRM_COLOR_LUT_NON_DECREASING) {
>> +			if (entry[i].red < entry[i - 1].red ||
>> +			    entry[i].green < entry[i - 1].green ||
>> +			    entry[i].blue < entry[i - 1].blue) {
>> +				DRM_DEBUG_KMS("LUT entries must never
>> decrease.\n");
>> +				return -EINVAL;
>> +			}
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_color_lut_32_check);
>> diff --git a/include/drm/drm_color_mgmt.h
>> b/include/drm/drm_color_mgmt.h index ed81741036d7..882253a82bf1
>> 100644
>> --- a/include/drm/drm_color_mgmt.h
>> +++ b/include/drm/drm_color_mgmt.h
>> @@ -72,6 +72,18 @@ static inline int drm_color_lut_size(const struct
>> drm_property_blob *blob)
>>   	return blob->length / sizeof(struct drm_color_lut);  }
>>
>> +/**
>> + * drm_color_lut_32_size - calculate the number of entries in the
>> +extended LUT
>> + * @blob: blob containing the LUT
>> + *
>> + * Returns:
>> + * The number of entries in the color LUT stored in @blob.
>> + */
>> +static inline int drm_color_lut_32_size(const struct drm_property_blob
>> +*blob) {
>> +	return blob->length / sizeof(struct drm_color_lut_32); }
>> +
>>   enum drm_color_encoding {
>>   	DRM_COLOR_YCBCR_BT601,
>>   	DRM_COLOR_YCBCR_BT709,
>> @@ -118,4 +130,5 @@ enum drm_color_lut_tests {  };
>>
>>   int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests);
>> +int drm_color_lut_32_check(const struct drm_property_blob *lut, u32
>> +tests);
>>   #endif
>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>> index 651bdf48b766..21bd96f437e0 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -872,6 +872,16 @@ struct drm_color_lut {
>>   	__u16 reserved;
>>   };
>>
>> +struct drm_color_lut_32 {
>> +	/*
>> +	 * Similar to drm_color_lut but for high precision LUTs
>> +	 */
>> +	__u32 red;
>> +	__u32 green;
>> +	__u32 blue;
>> +	__u32 reserved;
>> +};
>> +
> 
> Since currently there is no way for the kernel to communicate the precision of HW to user-space, I am guessing that we assume the precision of the LUT as U0.32
> and driver is responsible for converting it to whatever the precision the HW needs.
> 
> In that case, do we also need a function to extract that similar to drm_color_lut_extract(). Something on the line of [1].
> 
> [1] https://lore.kernel.org/intel-gfx/20250702091936.3004854-7-uma.shankar@intel.com/

Yes it is also needed. I will include it in V11.

> 
> Regards
> 
> Chaitanya
> 
>>   /**
>>    * enum drm_colorop_type - Type of color operation
>>    *
>> @@ -879,6 +889,7 @@ struct drm_color_lut {
>>    * and defines a different set of properties. This enum defines all types and
>>    * gives a high-level description.
>>    */
>> +
>>   enum drm_colorop_type {
>>   	/**
>>   	 * @DRM_COLOROP_1D_CURVE:
>> --
>> 2.43.0
> 

