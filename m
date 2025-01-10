Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7F8A09D24
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 22:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A05D10F1A5;
	Fri, 10 Jan 2025 21:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BVHIZhHs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D44810F19C;
 Fri, 10 Jan 2025 21:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjdWVGaksY0sPn+VsK6VKf8Q3kuNnGLUrf0rSUFCq8p04FRALMJlhJ2aIZ0yv3TO/O/qPqG/rBx8yNahQQ18NSq0zhkIh5EYjr9oIygw/MTIzFPR0Rg/C6PBLITUkATqBNLLxiE9b0pK3zsFzIZQWkR2FaliVcNzivC3wmWU9OXVg508SXwu4ZS5JupmsE9cDvFPTc11v3ZMIfkkINTWZQRSREKALCErZqK4r0jrxQqw5MOadpblD4GzZ4h0ptPkTn2OKgN6543FzP735brzK6Zpsp17BxdyAhdURNYxsHNjmkGSewIfXxEabOmv8bnm1ttE40dZhRA+leEegQ+8DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HR5Bb8imglAIZcfW165sauvN2TzOGbN86ixEnOXRImQ=;
 b=TMUPfhp+jYHBfCOj8B0/P0T3Sp6a6dI76yCFgBQvhUZ+y1Gl9M7jg40UiRkD9y+ZyTU8qwKIguE7/pKoN/1rDtfqAvQ8dUrEAD332zIWTKBrpWv0LHA5DBnxtw8HJyxdiiR3x2UrYRaOf5Fm/OmsynAeQFsQkT0SU2ccI2599NRUnhFF+Gtr8QmKKyv/gnb7sffX3L4cM1+dkcj0pWXYt9EeKYOXs0erSBI83VogbHQVdWTRmew1C8SmP2+PosYdcYPyHJGTF+gxwcvR0+69ki7cLAuuXsUJ8J3Wd4TPSx+EXHfhKedYcKgk9nbKAYgfzANfHTMUV+MR8wZ3uaQ/xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HR5Bb8imglAIZcfW165sauvN2TzOGbN86ixEnOXRImQ=;
 b=BVHIZhHsA9+o0ABaKqgnEc/nZw61GEBewb+Emd9Ao1CeROzJ2ntIVWMgi5gmnRRFUU22vPnpiOZbHei4/j2j1AwcHFwcwS7/raiUl2eSjITLXr9KGJ4Io7+//mPc5dWVET1se+9gF5/ohMR/PO/WT1Dnsy3tFLNQADeLAMm9sm0/5P314flG1nbMq8T6/WTjVyAiMEefLZRDBaXMRMtsAXydJ/tRbGjXxPohQ7TaIq9KXtQXvx1WCAYAt+j/axpxw//81VMyaLPjhqlbh5ml6bYJ9tKq82E1l4+3SJmZT/kiyOm8n3UdSvcuX/n9lLbvI+aBl0Pv5qruTua4mFLolg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB9146.namprd12.prod.outlook.com (2603:10b6:610:19c::18)
 by LV8PR12MB9084.namprd12.prod.outlook.com (2603:10b6:408:18e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 21:23:43 +0000
Received: from CH3PR12MB9146.namprd12.prod.outlook.com
 ([fe80::a638:d48c:2c10:9b04]) by CH3PR12MB9146.namprd12.prod.outlook.com
 ([fe80::a638:d48c:2c10:9b04%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 21:23:43 +0000
Message-ID: <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
Date: Fri, 10 Jan 2025 13:23:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
Cc: Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
 <Z2Rf7mpSuzZ0ObmT@phenom.ffwll.local>
Content-Language: en-US
From: James Jones <jajones@nvidia.com>
In-Reply-To: <Z2Rf7mpSuzZ0ObmT@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::36) To CH3PR12MB9146.namprd12.prod.outlook.com
 (2603:10b6:610:19c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9146:EE_|LV8PR12MB9084:EE_
X-MS-Office365-Filtering-Correlation-Id: df32692e-000a-4f61-05f8-08dd31bd0f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkF1bVN1T0ZCRzNhb25WT2YwMjV5TXBUSHcvK05qMU5ZaGtLRnVVZy9TeVVF?=
 =?utf-8?B?SkpVZ0s0S2o2RlVOQnVsRStWTlYwVmhEVXdwZlJPdThPcWpOMjBrZmlOenlJ?=
 =?utf-8?B?K3FpT1hGSjQrMUZ6K3JMRmhDc0VqT29hOEpOMFJ5MElWeVFBYW9XazlxeU9Q?=
 =?utf-8?B?U1JFc01rMmVQN0xyRmNBWWhrZk03alRPVXRGb0ZLU3BlUFA1WUFvbnBZaVJS?=
 =?utf-8?B?Y01QMUFiUndZTVNVWHczck5PeUJjTnBGdXJGOXJGM0dOZXkvZGxUa2NvbEpL?=
 =?utf-8?B?ZlN4cEtnMFRMY3NsY1ZEQldBVkxvNDFpMS94UDgvYjJDODRyaEZ6ZmtuUzV6?=
 =?utf-8?B?ellyUjFDcXBaa3cwZmdCdWlGQzk2Qjl6QkJ1QUxpRUNTbC9OZGdRQzR2Rkdp?=
 =?utf-8?B?c0tLWkNFay9DZFY4OEd4NzVoZ1FvUEkxVWFBbDIrUVAzWGVia3BTWXo2SU56?=
 =?utf-8?B?aFFid2llRGo3TnVjMnRvME5PRDIwR1hFUDFNY241M1dGZnp1blNZQ3J4TEt6?=
 =?utf-8?B?enY5WUR0eEZ3S2VzaDlmcE4rc2hTTzJaaXlldTJPZDQyMHlCUFNRZUllQVd0?=
 =?utf-8?B?ZjN6LzE5Wk50cnB3ckIyUEszZ1JGSlNBQTJIaFFINEtxUm4xdDJJMzB4aVRS?=
 =?utf-8?B?YVJDNUFLak9uanJJS0hZMmFDR09LZDRsTUo0Qk5ZVng2Mzg0dG9aSTRsSnBw?=
 =?utf-8?B?V2V2RTd1aWhyNWh2UEpvUEFma2lCZHVRWXJxaVozUzg2ZWoxczJEbm9oV0Zy?=
 =?utf-8?B?NThsb0xwT1MwQWIwTkY1bUdoaVZHOWNrUnhLZ2JBZm5ndEgycEw1eVVSZXVC?=
 =?utf-8?B?TkliZkdlOTltbS85Y1ZPQUJoSG8vVENYZHFuNlRzSngvMXNSazBNdmkwTWZr?=
 =?utf-8?B?S2tFRWJqd0dXYmpmdExrZWdBa2IxSHUyTTh6NFhwTHZNVzlHTmZzSXk5VTll?=
 =?utf-8?B?NjYyVjhaak9ObXVOcDZrUHZPN2lLOGVmSGNLcVdjSVgrTkZyelBHYWlodU45?=
 =?utf-8?B?bFNXY09xc3hQbFFCQ0hIMlpGR2pHbE0rcnBHNlBIRXhJU056QW02cXZEV2wy?=
 =?utf-8?B?M2ZTY0hBdEJtdTNzdnFZVjJIVEF1bmtmWElmZzBScVZVc0lyYWVkTmV3R3ZK?=
 =?utf-8?B?Vktxcm8xWmY1YWhtb1N1Nnc5Zm85bzRkdSt0QWZZRHBjUU9OeWRPdlc1RWZh?=
 =?utf-8?B?LzVnZEhyNVFWVFdWV0Zxb25HZXM2bzdzMDJoUDhtTjFvazVFNGhhMGFnalBr?=
 =?utf-8?B?a0dCeVNLbmRBZm1WdUQrbWg3WDZFTTBsdjE5dnJjaEZKRDhXTmtzUFJoa0ZE?=
 =?utf-8?B?bU1FR01rZjdITTI4QmlTdi9lRGRJK2NLanhnRGJxYTZTelVxVGtWQ0VuVWwy?=
 =?utf-8?B?aGNLTncwUXduM2FTL2hjZU5XSzQ3MnJuYlNGZXg4dXh0ZCtLWENzbkxRZzMw?=
 =?utf-8?B?eVE3VStpMzEvZE1vbmVCZlFZMlZqb20yekRpT1NJUFhYRjVXVkpEcElrMkxz?=
 =?utf-8?B?VmNxR2IrUW1yV000TmgwSTdNbWRVUTBNRFRBUUlaUWpIZElZTEVhcWtvdEFZ?=
 =?utf-8?B?dnlPMGpVdVR0bmV1SStHckFta1JZbzRmNThKN2tzWngzYjA2RGJCSEZLY2RV?=
 =?utf-8?B?UFJ2QTh0djlsYmNGN1B2Y0Joak9PNTFpdUJFckI4Mm1rcXFxUmZoRVZUOGJj?=
 =?utf-8?B?ekM1QUFrYi81ZDVXOER5WjFkUnN1KzBmdEppTXNSeWpMdzd0dWt2NUt5WGlI?=
 =?utf-8?B?elMwcjh0cjVvaGR5ZkQ2eW9ReEZnNTExOGNHS2FZdjkvUFNldlRZcElPeTZG?=
 =?utf-8?B?SnZmd2tIcnpvUDg4Sm82Z1Q0TzVCdzk2dnpweDZlS2tsVzNVcTFyempNbEU4?=
 =?utf-8?Q?s3iBihZ7Oh0FE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9146.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amlwQjNkMTkyYWMzRjFXYXloWmhqcmRIK0l1T2k1NlZGTE9tb2lraUNlQm9T?=
 =?utf-8?B?OVNqYllvUXVMNWF3QWJwRVZvNGhjR3hpblhCNFVaenZGY1IyZ1pONERXNTk3?=
 =?utf-8?B?aGc3bzlQTko5SzZFbVR3MGxLYVBkVmJ2ZmZoNUN4N3JOaTBxUWNDYlV3YmFF?=
 =?utf-8?B?WHRYeE1TcTdWN2taUnNqRFVVUEp1NVVWWXYrL0IzaUNxRkF5cGdwSjhmU3NL?=
 =?utf-8?B?bGxoREptaS9GUWdENTVGRFQxdG8waFdXM2ZDVU92NStMeUlrUjV1RTl6RW5J?=
 =?utf-8?B?dzJDdFVBL21aVFIyaFoyaU9haU01T1BoKzBhV2ZNQzF3MEY3Q2kvUFE4bHBv?=
 =?utf-8?B?RjVmNTB2ZklDVVF1d1QwQW5UdERsbXJGdXh5OWcyb0VWUXFJMm1oZEdJZ2lP?=
 =?utf-8?B?d1o5WTVqSU5ST3hjVHBsUlhzUU13Z2tFMFJsZ1AvWm1lbk1yak53QjRxK29K?=
 =?utf-8?B?aU4raVlBUFRLM0hRUExoVnl3WU9wdnd0eUV5bzZ5S1lTdUhhSzVPWTB1UWJ3?=
 =?utf-8?B?bHdjWS8zQ2x4MWFHSFdxQy9PR1ZSVXdkVUpBMjNOUkZ6cUhNYU9qOTYxY0Jk?=
 =?utf-8?B?b1kyeFZSbVBrOFduSW9GbFEycXBIR1p6WnMrZnlETSs1ai9HM2p0ZytneE8v?=
 =?utf-8?B?a2dtYmVUMlY2MllNcWhUUnlHM3ZyWVRPWnR2dFpvM09tdDkxUmt2UkZ5MWhR?=
 =?utf-8?B?VkZNaEd4SURITVlzSWhWYlk0M2RVc2Y2ZGRkTlIyV3ZpQnJQelJqVDh2SGZv?=
 =?utf-8?B?dVBINjdiaU5zSE85Ui90dHdEc1YyOTBsRGZreUdOeEpESVdkTHg4bElMb1px?=
 =?utf-8?B?RVVvWUZLL0NNR1A1eHhNeDYzZ2I4UVBqZjBNWVFkb3JvVm5CRW5tVUR0SDU0?=
 =?utf-8?B?aTcyb3pPNUh6TkZEa2U1dXVFeW0yZXpNNm13aDdHSm9GU2ZLKzlKcGJ6cjVM?=
 =?utf-8?B?SUJ4UmxEb1lOVXo2TEkxUG51Zk1GZFVCYjJYU2F2T0VlOVh1bS9UVFJsV1h4?=
 =?utf-8?B?UEJkNHo5RkkyTkRLYmdaL1pIbm1XRzg2MFdRSkFDbzF1cEp0SlUzUHlnNTZr?=
 =?utf-8?B?NnZwckNUSGtQQ3NpMTNpY3AxZGF5UWs0V0tFTmdrcVhTQ0N5cnJmWi8wQ01E?=
 =?utf-8?B?ZFpudGJ2VStLSzFaSnJISklQSEZwZndtMWVQQUNoUXBEZmo4a3dxWGRwS2xO?=
 =?utf-8?B?V0VWK2RRNWJZbVpRa3c1MlNhVDhmR09GUzQzUW0rcHNicDNzaVl6cGFtS3RD?=
 =?utf-8?B?STJObDlMTmxaRjgvWktXNlpGdmViUnZXUWZwZGZVK1dTUE1JOE9ETkc2K2Nh?=
 =?utf-8?B?dGtlOVlJZzhNd25Qc1ZKYXVrclphRnNaR1JrNmRFdkU1YXhMODRaRUNaY1FU?=
 =?utf-8?B?M3RlV1lqS3kySTBNalFybDEyUjhvQ3RwZytyOWJ0eGtmUU54eW5GMkxqOVZ5?=
 =?utf-8?B?RW9rZENPUkkvYXBBWDJaZjVhdHpsSTVjWHBvWm9FSGF1TXJSczIyMzRZQzdl?=
 =?utf-8?B?WGNRVnlxS3dRZnJYUmJkcjZjNkx6dUY1TDdRazNyUmdaT1Q5Q0MvaE0rbC9t?=
 =?utf-8?B?SkFVc0xRM3h6VlJETUtUdjNGMlFNZXlzeGtSTS96bWsxSENjeEtIZUZyRng2?=
 =?utf-8?B?OEhMdXBqblpQWThRb1dPV1VYWVNCczFnT1dscjFOQXBsc1BHSmp2eFhmcS9j?=
 =?utf-8?B?ZWhiQVVrQkZibEZ5cG9TcnZMQkpTK2Jtb1BQOTRLYTdOSGRSME12ci83MS9R?=
 =?utf-8?B?ZWxXeDNVaDl0Z3RqMHJhS0pucVcrR1EyUDN3ZlF2dm9DQmJxVVNBSWkyRkFv?=
 =?utf-8?B?ZXhxclN0OHZiS213NzZmdzRDaFNRME1GWDdMWUhYdEJMOEk2SDBDRDI3UlNv?=
 =?utf-8?B?YjNkR2xhNlJJRVhuYS9DMUF2NjRjRUI1dGVMUWNBSTdJbjZOK2N0aHRmRVRD?=
 =?utf-8?B?R0VYZHUyNmljS1hCemlJblpKRnlvWVpQMFRhRVI2RCtGT09kckNOT3U4UXFB?=
 =?utf-8?B?Nnk0b2wxdnZPZ3dlVWJtZ25BcDRvbXRuQWlNd1hBclBIOExMandmVUdvNW4x?=
 =?utf-8?B?dllSZlJEbTVTeldOZWxFWTZyN2ZvdU9Cc3J1cDh1ZFVSOTlMWTNPUDYxRytV?=
 =?utf-8?Q?eVnOKg8yY4Wi/rfyscibTHYw+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df32692e-000a-4f61-05f8-08dd31bd0f4b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 21:23:43.3681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6fVsy0Ver6I5Ck1SV5GAkrq7OcFpyVKz0XaZSGtS0TmcX991eX9v/FjavPwuAQCTH0qHa9FXk1PIiGNa+Cnxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9084
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

On 12/19/24 10:03, Simona Vetter wrote:
> On Thu, Dec 19, 2024 at 09:02:27AM +0000, Daniel Stone wrote:
>> On Wed, 18 Dec 2024 at 10:32, Brian Starkey <brian.starkey@arm.com> wrote:
>>> On Wed, Dec 18, 2024 at 11:24:58AM +0000, Simona Vetter wrote:
>>>> For that reason I think linear modifiers with explicit pitch/size
>>>> alignment constraints is a sound concept and fits into how modifiers work
>>>> overall.
>>>
>>> Could we make it (more) clear that pitch alignment is a "special"
>>> constraint (in that it's really a description of the buffer layout),
>>> and that constraints in-general shouldn't be exposed via modifiers?
>>
>> It's still worryingly common to see requirements for contiguous
>> allocation, if for no other reason than we'll all be stuck with
>> Freescale/NXP i.MX6 for a long time to come. Would that be in scope
>> for expressing constraints via modifiers as well, and if so, should we
>> be trying to use feature bits to express this?
>>
>> How this would be used in practice is also way too underdocumented. We
>> need to document that exact-round-up 64b is more restrictive than
>> any-multiple-of 64b is more restrictive than 'classic' linear. We need
>> to document what people should advertise - if we were starting from
>> scratch, the clear answer would be that anything which doesn't care
>> should advertise all three, anything advertising any-multiple-of
>> should also advertise exact-round-up, etc.
>>
>> But we're not starting from scratch, and since linear is 'special',
>> userspace already has explicit knowledge of it. So AMD is going to
>> have to advertise LINEAR forever, because media frameworks know about
>> DRM_FORMAT_MOD_LINEAR and pass that around explicitly when they know
>> that the buffer is linear. That and not breaking older userspace
>> running in containers or as part of a bisect or whatever.
>>
>> There's also the question of what e.g. gbm_bo_get_modifier() should
>> return. Again, if we were starting from scratch, most restrictive
>> would make sense. But we're not, so I think it has to return LINEAR
>> for maximum compatibility (because modifiers can't be morphed into
>> other ones for fun), which further cements that we're not removing
>> LINEAR.
>>
>> And how should allocators determine what to go for? Given that, I
>> think the only sensible semantics are, when only LINEAR has been
>> passed, to pick the most restrictive set possible; when LINEAR
>> variants have been passed as well as LINEAR, to act as if LINEAR were
>> not passed at all.
> 
> Yeah I think this makes sense, and we'd need to add that to the kerneldoc
> about how drivers/apps/frameworks need to work with variants of LINEAR.
> 
> Just deprecating LINEAR does indeed not work. The same way it was really
> hard slow crawl (and we're still not there everywhere, if you include
> stuff like bare metal Xorg) trying to retire the implied modifier. Maybe,
> in an extremely bright future were all relevant drivers advertise a full
> set of LINEAR variants, and all frameworks understand them, we'll get
> there. But if AMD is the one special case that really needs this I don't
> think it's realistic to plan for that, and what Daniel describe above
> looks like the future we're stuck to.
> -Sima

I spent some time thinking about this over the break, because on a venn 
diagram it does overlap a sliver of the work we've done to define the 
differences between the concepts of constraints Vs. capabilities in the 
smorgasbord of unified memory allocator talks/workshops/prototypes/etc. 
over the years. I'm not that worried about some overlap being 
introduced, because every reasonable rule deserves an exception here and 
there, but I have concerns similar to Daniel's and Brian's.

Once you start adding more than one special modifier, some things in the 
existing usage start to break down. Right now you can naively pass 
around modifiers, then somewhere either before or just after allocation 
depending on your usage, check if LINEAR is available and take your 
special "I can parse this thing" path, for whatever that means in your 
special use case. Modifying all those paths to include one variant of 
linear is probably OK-but-not-great. Modifying all those paths to 
include <N> variants of linear is probably unrealistic, and I do worry 
about slippery slopes here.

---

What got me more interested though was this led to another thought. At 
first I didn't notice that this was an exact-match constraint and 
thought it meant the usual alignment constraint of >=, and I was 
concerned about how future variants would interact poorly. It could 
still be a concern if things progress down this route, and we have 
vendor A requiring >= 32B alignment and vendor B requiring == 64B 
alignment. They're compatible, but modifiers expressing this would 
naively cancel each-other out unless vendor A proactively advertised == 
64B linear modifiers too. This isn't a huge deal at that scale, but it 
could get worse, and it got me thinking about a way to solve the problem 
of a less naive way to merge modifier lists.

As a background, the two hard problems left with implementing a 
constraint system to sit alongside the format modifier system are:

1) A way to name special heaps (E.g., local vidmem on device A) in the 
constraints in a way that spans process boundaries using some sort of 
identifier. There are various ways to solve this. Lately the thinking is 
something around dma heaps, but no one's fleshed it out yet that I'm aware.

2) A transport that doesn't require us to revise every userspace API, 
kernel API, and protocol that got revised to support DRM format 
modifiers, and every API/protocol introduced since.

I haven't seen any great ideas for the latter problem yet, but what if 
we did this:

- Introduced a new DRM format modifier vendor that was actually 
vendor-agnostic, but implied the format modifier was a constraint 
definition fragment instead of an actual modifier.

- Constraint-aware code could tack on its constraints (The ones it 
requires and/or the ones it can support allocating) as a series of 
additional modifiers using this vendor code. A given constraint might be 
fragmented into multiple modifiers, but their definition and 
serialization/deserialization mechanism could be defined in drm_fourcc.h 
as macros all the clients could use.

- Existing non-constraint-aware code in a modifier usage chain might 
filter these modifiers out using the existing strict intersection logic. 
Hence, any link in the chain not aware of constraints would likely block 
their use, but that's OK. We're muddling along without them now. It 
wouldn't make those situations any worse.

- New code would be required to use some minimal library (Header-only 
perhaps, as Simon and I proposed a few years ago) to intersect format 
modifier lists instead, and this code would parse out the constraint 
modifiers from each input list and use the envisioned per-constraint 
logic to merge them. It would result in yet another merged 
modifier+constraint list encoded as a list of modifiers that could be 
passed along through any format-modifier-aware API.

- One consideration that would be sort of tricky is that constraints are 
supposed to be advertised per-modifier, so you'd have to have a way to 
associate constraint modifiers in a given set with real modifiers in 
that set or in general. This is easily solved though. Some bits of the 
constraint modifiers would already need to be used to associate and 
order constraint fragments during deserialization, since modifier lists 
aren't strictly ordered.

This effectively allows you to use format modifiers to encode 
arbitrarily complex constraint mechanisms by piggybacking on the 
existing format modifier definition and transport mechanisms without 
breaking backwards compatibility. It's a little dirty, because modifiers 
are being abused to implement a raw bitstream, but modifiers and 
constraints are related concepts, so it's not a complete hack. It still 
requires modifying all the implementations in the system to fully make 
use of constraints, but doesn't require e.g. revising X11 DRI3 protocol 
again to tunnel them through Xwayland, and in situations where the 
constraint-aware thing sits downstream of the non-constraint-aware thing 
in the allocation pipeline, you could get some benefit even when all the 
upstream things aren't updated yet, because it could still merge in its 
local constraints before allocating or passing the modifier list down 
the chain.

Does this seem like something worth pursuing to others? I've been trying 
to decide how to best move the allocation constraints efforts forward, 
so it's potentially something I could put some time into this year.

Thanks,
-James
