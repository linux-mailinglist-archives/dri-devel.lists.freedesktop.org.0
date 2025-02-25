Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA2DA444FD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 16:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0470010E0FF;
	Tue, 25 Feb 2025 15:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OjLY0pIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF6D10E0FF;
 Tue, 25 Feb 2025 15:52:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkLWYLiYzVOV/5ADJ8DYi3Euq4ay1l9+es8Z/VW2dcUUBx2K9X9sBKknFmhFevnscBaTBu6g5vcm/ZusgtlfOHtuF1uJ1nysdZbMEGhYsL252MZGA6MOfLQC7byOD9ZKI29xKMz+NYJXLifTLDugNS/n4l4nSY+k/mBU+srGtGvgP55ahYCHnFTshvIZ2bn77PKgxs3h1W+0OBiysawCMK81dSqPkTUZPEnez8oTcce1d3EPW1jEB13Znq1R8ZceL6hQOV7mivzFEQNDhPLQBWq8sTxsJ2DaV5Szg5oWABtpPo3J1rBkKXBWV9hrcBuikciQbYfUFxWh8WmOPTEEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUD6s6plIdzPFnyme81jIUTj53uIA0hp95TzycVyIOw=;
 b=ocRoK0pWoth2Fz0vPIGB1ZDEa6G600Dqk/p/RJiPeAtHS9Tu5Bs6vB+w4If66fY0P5eYonMrron0wvwpAzQNzcs4A6wgrL5LoFmqWv+Cvij5ZJUwkmJ2enhowihokO7v5TgyaofYbRRL4WzD8pXNm9OcAq3oMG5Y67IO25WFjdzBc8dGiGek4kLBM4ex9r571DfOLN4iw+8x3DPxuuoKpMi9kSIYOhTtMpQDjIw9yVh0pIyo51wCfN674NjtMEY81jUxoKh25kXuoyGBOPhi1ud9I6rZvYbKSUFVUz6T00y8P6jSzlT7+xXoi0waHvhKS85HAJ69ww676fJyQKuBNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUD6s6plIdzPFnyme81jIUTj53uIA0hp95TzycVyIOw=;
 b=OjLY0pIcBIhis+40P8FIpAXe2aPxDHdQiQqQv0ilrNtEFyKdaTcEz4mztWb7KfqE7hSwrkVs//kv1nhIfoO5HYAVOECfiixxBqHYyeQ0lIq5nGCc4FkLgMlmDZgT4GJZp88gtkb1jIp+bP4CuY6r2mCwnUBJ6UgcAx+TBEQvMzep/ZmH9cy5NsY9WzCmskR8NJYvo/yzrQITWMjOlsuZh+cQnaux28T3Y2YjcgTsQs9mGygrRH14ahVW95mTTZT/ta9ZCL9xOfNN2xyufcUTtOxSsXT3Rtexv+D9F1IFqRqlwJpBCYYB7NskN/4wFOpdb0YiYhFr2eB+oQoPGo74NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL3PR12MB6594.namprd12.prod.outlook.com (2603:10b6:208:38d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Tue, 25 Feb
 2025 15:52:43 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 15:52:43 +0000
Message-ID: <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
Date: Tue, 25 Feb 2025 10:52:41 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@gmail.com>, 
 Gary Guo <gary@garyguo.net>, Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, paulmck@kernel.org
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <Z7xh5bEyh_MII4WV@pollux> <20250224184502.GA1599486@joelnvbox>
 <Z70EcwNIX0KtWy36@cassiopeiae>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <Z70EcwNIX0KtWy36@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL3PR12MB6594:EE_
X-MS-Office365-Filtering-Correlation-Id: 881d6239-e8be-493d-5737-08dd55b470e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXRnS240NzZpV2VJMUI2M0wyZ1djdUpKbGlvV0ZSQStMZ09LTXhOYWdWZkZV?=
 =?utf-8?B?WURXaVBEakNFNnkxSnEzSVkrTDUrbUlpNWdVd0oza0lab09xa3RzZzlRNjBE?=
 =?utf-8?B?VDdQb0FJeDh3Z2wrbWE5VjZmLzUwNTRDSFYyN2R6MUZReDRhQTNEVlBUSWVj?=
 =?utf-8?B?WnRhOTVEWTFpNnR0RjFJM3B1c2RoNG9oZ0p6N3FZK2NmTnBJR25qZWpGMDZs?=
 =?utf-8?B?VTJQbENMRVJHenJudDF2TXpKMHAwSHJKendzNHgyNmUrdkhjTnJGZGlHZGs3?=
 =?utf-8?B?blVKZUZoV0tOditybmZ0L1NLMHVid01TOVpwejdkUThXZmhEVmJINHVsdTBt?=
 =?utf-8?B?UXhMUHVwQ21MSUZuUUFialoyRzhucGFHaVVjdXVHeVJLeitYSnA0VjVld1M1?=
 =?utf-8?B?WTZiRG92TnR2ZFUxRXgwM3BlaWhMVitIeVRxK0xISUtOc0pzYmN5aDlPZEZZ?=
 =?utf-8?B?Q3RRM2NuemMybUZVWmRwTTliekppVUJCcllLNHBXZXlPbFE1QTlJSUpadTRE?=
 =?utf-8?B?Z0VHbDNEdjR6MDF4VDRlZWx2L3JKaG1zZjRrWEdGa2tuTkp0VGV2Szc5SEtH?=
 =?utf-8?B?TUtBRUNLRnBUQndZT0ZtQkhZWGNhUFhXeTlGaHUrOXlnTXh4Z3pIcEdEUEFY?=
 =?utf-8?B?WE5JMTh2UnJzS295bmNZMHU2SXVib1FwMUM0VTV0YlRrSDJnWkVxcW5TRE1u?=
 =?utf-8?B?OG00ZDl6dy9PckhaMUpwenpSWWtreE9FTVo1QzZUTUtMZWROYjArZnZsOVE3?=
 =?utf-8?B?Yi9GY1prL20rZUlwd0xYaEFjTndnUDRVYUMrNCtsUjdPb1U1aHl4Umtqc3ZO?=
 =?utf-8?B?M2lmUGJ2RGZMbUQ5dmZrWGZSNkUyZ29vK0xvaXZVVm9DbC8wOWRhdlhmNUNi?=
 =?utf-8?B?dVdMYlh6R0EzMCt0L2o0elBLcDdEeDYwdk8xcjJ0NTFjajlhMmplYjBUL1h0?=
 =?utf-8?B?YkFyR3F5bzVCZmV4THo2QmxScGxJcTJFelMxcDBRaWlxUmxHU1krZTZiN0tO?=
 =?utf-8?B?SEo5T09SdWpqNEpGM3VMN1JMQ2EvZ3MwMTZLS3AxeldoL3duN3VoMnBrRU5S?=
 =?utf-8?B?b25laUxWbWhJZGpVWjBVZm50U1dCV01rUmF2MWJieE04NTFtcGdNSDl2cjNu?=
 =?utf-8?B?M1dGTzBTZWJ6cm9XT2krd1pFUTBIUmxPOHJYTDUrQ3h4WGlnTGxDempiUVc5?=
 =?utf-8?B?ck13c3JyREpmV3NBNnhRNFA3YXRJNjBvSGxwQVBqa3NTWE42MFh6N2tIS3J0?=
 =?utf-8?B?V1BDdVlPOUZTNkNsZ1lxcERKTHprc2QvWEFybnpuQ0ZHY3FOdHErdGFFMW53?=
 =?utf-8?B?aTQ5YjBJcHdkcFltRDE3Vm0wQUFHdno1MmdXa0t6VHJZMVVyVEJXWVd0MVlU?=
 =?utf-8?B?ZmtqYkZNUTd2SXUwQUdPTVVyV0ZZdExoVUU1THFyY0FVM216Wld3ZWFnd3Qr?=
 =?utf-8?B?QnpNakt5S2ZzT1dJdXJWTjZUTmcrOVlObTRnQ21PYUJkRGtNKzI5Z3hzd1NG?=
 =?utf-8?B?WStxQjQ5dHRWelNFcHIyTWJjMXAxditHbStsOGh1OHlZVFZUa01qQWg5emFQ?=
 =?utf-8?B?TlRGczVMb1dteml6Ty94MFk5dnhZeG9aRlhWdm5OWGNRbVlkR3VDZGtZemVT?=
 =?utf-8?B?cSsxSzFldWJGVGd0d1ZZZWtlclB4Wnl6S2xESEM4SGNXa0NzYnYyeTg3Skls?=
 =?utf-8?B?UWdSMGRWc0ZkOHVZeGIxOFlHY080aHdKUUxjaXdVNG85dU0xdit4MGxCcGw4?=
 =?utf-8?B?ZVlYajYzQlEwNDVkRzQvYkQxakFCVVRyT08wbUxoMit1RjYwNVd1RWNXSm80?=
 =?utf-8?B?alMzT2V5b3ZZVGxJTFI0SDY5OTZUNEVRT0k1dGw0d21jaFZPbHRWTEExVTEx?=
 =?utf-8?Q?C7PLsAaiefaQq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUh6ejNpL28vMUo1QU1sM1ZzM3JnanlPM1lqT1MyR2dhc08raW9sZG44KzRp?=
 =?utf-8?B?SXFkcTVWeG5OUmNWd3RTVWxPOVRJSVVRMWM0ZmFIWjBqZW9HS3NSZTJ6dFJ0?=
 =?utf-8?B?RlJkR2prc1Bac2pRSmt6Y3RqSit2TTJaZ3ZnM2RpeW1acXdncm43d29aUCs4?=
 =?utf-8?B?THZ0cTdELy9SMTJSRS81OHJhU3daSTRpMDZsYVlPWTBSQi9rVWNXK0VlN2lD?=
 =?utf-8?B?ZjhiS0FZYyszUllDL2F5cVhkL0pEeVJ6b0d1VU5lQUtsYlpwUjJxajdnMXVy?=
 =?utf-8?B?RkY2NUd5eDdQc210VUtZaWxLcHBRUW5PNlcwbGFGSytLR3BQdTlEd08rWXBw?=
 =?utf-8?B?SWxXZDdSK1l5OFVmckZKazllUHdWb3pRUWFVSkIvZFpETjBua3JsSnFHTFFD?=
 =?utf-8?B?dmxtK1BCRVNKL2NnN000dlZ0NEVtOGI4Qiszb2tsYzc3WEhKVEx4KzdQSmh1?=
 =?utf-8?B?L0VLNnNDblVzak9yV0dSNVpIeUhORkx5aTgxTjl5MElvU3dmVnJtVXZrL28v?=
 =?utf-8?B?YWlBQzN2TUlBcmtnUzVMRytCeDI3VU0waUoyc2t1b2ZWb1JYM3dPQ1BmZHBt?=
 =?utf-8?B?SDhNNnN0djh1QS8vV3JZTmhPWmxraSthQ1ZWbVprTmlvMVdobGlpamxMbFFn?=
 =?utf-8?B?THMrdENqTVRNUWYxZXBMenBCUGt5b0pYTnc5MlJsUzdoNTd3NnNhRXFzQVl4?=
 =?utf-8?B?QjdySDlsU08zYXNMaVJqcE5pMWFsei9PdTE0SDYzUkRMa24yYndFYzdYTWdR?=
 =?utf-8?B?NHlRVFlIb3FWNVFNWlU0SjFsM3ljVUdZMjJyMkxNZ1Q4MFF4M3lYNFBtUmFH?=
 =?utf-8?B?djVmTmtxdi9EM1dQSnN3QWE5WTd0aklWQ1lvZ1BrbU9jQ09rZzBPVHRtV1FI?=
 =?utf-8?B?WnkzZDJ3UW5uOGxTRzkrcHh6RXkyZ1ZEcE1qVFlSUHlNZkE0NmRmY1VibFJj?=
 =?utf-8?B?V0twc1dGL1VJanB1WWE2OEdwYXcyZUJmQmpPV2hjN29xY1VWQzhCcCs1K0wz?=
 =?utf-8?B?aXQ4ZHQvbFN1Y2tBdGZLNGoyYVR1ZWtaY0MvM3MwRSs2dkNvMDZuZDVKcXAx?=
 =?utf-8?B?cnE1cEJPTzhLdzl2YnBtUWgyOS9zWmM4ejRTdmhXNnllaVg4Yzg2eEdTN05u?=
 =?utf-8?B?bDR3Uk9GUktZOFZGaFhlS1VuU2hHN1d0Q2pBNDZGTmthbUp4M1JmT1NWWThD?=
 =?utf-8?B?aUh5bWFKQ21SUUVHZFNycS9sZXY0L0tBcGQyZWNjR2VqL0g3YUExT3p2RU1h?=
 =?utf-8?B?ME5VMEMvNFlVS25VZURISGpLNjVORFVsYkh0Y05oRmROK0hXMnZBeU1BSFBs?=
 =?utf-8?B?WkxpMm96MURHaEhXTXJzRDM1RGpyeFBtcVlzdUxtTXN1Q09kRGh3Yng5czdK?=
 =?utf-8?B?MHVHVG9oZ2pVbWVqTHIzYjl2VGhXTWpjUTNMaC9qS1JWWHo1OWdMdXhKRlNL?=
 =?utf-8?B?QTlYUXVYcFR3U2g0TFNyWURqK1AyNXpscm1zOWRnQ1c0U1d1Rk1VamJ2enYv?=
 =?utf-8?B?U0hmOCtaWVRUWUo4SGpJeE1Tb1AzRXgvUXVVSGdaWEhCRThKQUV3a2NmS21Z?=
 =?utf-8?B?YmlxaDhqL1hEVDByci9IN1RFMTNQaHFGMG8xaDE4dUNYcS9RS1pENXpWREk3?=
 =?utf-8?B?TVZkczEwN0NRd2R3b3czMFFzc2hEVVo3UEVFNFNwYlp2WGc3QVhOeXV3Q1R5?=
 =?utf-8?B?QWk2S3FlTUlHUGFJcU1NVGlBa052OXpHeUhsQVQvNWw4UHJpNXFQVDdVN3Jv?=
 =?utf-8?B?cVNzV0JKdWNjSTVpRmlKWFVCMld3UGMybEZiZlhMQWlDSDJaTGlmR0hzcjc1?=
 =?utf-8?B?NUpScWYrSnk3NFRPa09uZEJyZGIvTXpVZXdoS1lCN2NXVEdBWHBoYlNSMXdl?=
 =?utf-8?B?M1BmWW1lSTEwWjNyUk85eXBUVnROTzFyWTVnRXpsc20yUFRGcmd3TTJZVjNE?=
 =?utf-8?B?c1N5OVE5NHg5cGdndGsyRnkrRUFNOEZSblRJRVFZdUYwYTJrVWpzcWxPV0ho?=
 =?utf-8?B?Y1dJc3dVZ2tWUGJKQWZmWExTWkROK1FCeXlDNFhjMkprZHVjWUhLelNJaEZx?=
 =?utf-8?B?THZ3NFN4aHFMK2JKamQ0YUt5YkxHcjZ1b1lHWWNCRnZhWThsQllmMmFFZEZp?=
 =?utf-8?Q?V1Yi3WXlUtF0kL7kYHetAAkhF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 881d6239-e8be-493d-5737-08dd55b470e0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 15:52:43.4390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fppCFjPogmAqS/Tejl3Vb9MZzwDvZUm7CeTXuThnCcEqEfOQRcjPBTWMqMIBmWHZhkUH5pAkzGMOM5lO5zCSCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6594
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



On 2/24/2025 6:44 PM, Danilo Krummrich wrote:
> On Mon, Feb 24, 2025 at 01:45:02PM -0500, Joel Fernandes wrote:
>> Hi Danilo,
>>
>> On Mon, Feb 24, 2025 at 01:11:17PM +0100, Danilo Krummrich wrote:
>>> On Mon, Feb 24, 2025 at 01:07:19PM +0100, Danilo Krummrich wrote:
>>>> CC: Gary
>>>>
>>>> On Mon, Feb 24, 2025 at 10:40:00AM +0900, Alexandre Courbot wrote:
>>>>> This inability to sleep while we are accessing registers seems very
>>>>> constraining to me, if not dangerous. It is pretty common to have
>>>>> functions intermingle hardware accesses with other operations that might
>>>>> sleep, and this constraint means that in such cases the caller would
>>>>> need to perform guard lifetime management manually:
>>>>>
>>>>>   let bar_guard = bar.try_access()?;
>>>>>   /* do something non-sleeping with bar_guard */
>>>>>   drop(bar_guard);
>>>>>
>>>>>   /* do something that might sleep */
>>>>>
>>>>>   let bar_guard = bar.try_access()?;
>>>>>   /* do something non-sleeping with bar_guard */
>>>>>   drop(bar_guard);
>>>>>
>>>>>   ...
>>>>>
>>>>> Failure to drop the guard potentially introduces a race condition, which
>>>>> will receive no compile-time warning and potentialy not even a runtime
>>>>> one unless lockdep is enabled. This problem does not exist with the
>>>>> equivalent C code AFAICT
>>>
>>> Without klint [1] it is exactly the same as in C, where I have to remember to
>>> not call into something that might sleep from atomic context.
>>>
>>
>> Sure, but in C, a sequence of MMIO accesses don't need to be constrained to
>> not sleeping?
> 
> It's not that MMIO needs to be constrained to not sleeping in Rust either. It's
> just that the synchronization mechanism (RCU) used for the Revocable type
> implies that.
> 
> In C we have something that is pretty similar with drm_dev_enter() /
> drm_dev_exit() even though it is using SRCU instead and is specialized to DRM.
> 
> In DRM this is used to prevent accesses to device resources after the device has
> been unplugged.

Thanks a lot for the response. Might it make more sense to use SRCU then? The
use of RCU seems overly restrictive due to the no-sleep-while-guard-held thing.

Another colleague told me RDMA also uses SRCU for a similar purpose as well.

>> I am fairly new to rust, could you help elaborate more about why these MMIO
>> accesses need to have RevocableGuard in Rust? What problem are we trying to
>> solve that C has but Rust doesn't with the aid of a RCU read-side section? I
>> vaguely understand we are trying to "wait for an MMIO access" using
>> synchronize here, but it is just a guest.
> 
> Similar to the above, in Rust it's a safety constraint to prevent MMIO accesses
> to unplugged devices.
> 
> The exact type in Rust in this case is Devres<pci::Bar>. Within Devres, the
> pci::Bar is placed in a Revocable. The Revocable is revoked when the device
> is detached from the driver (for instance because it has been unplugged).

I guess the Devres concept of revoking resources on driver detach is not a rust
thing (even for PCI)... but correct me if I'm wrong.

> By revoking the Revocable, the pci::Bar is dropped, which implies that it's also
> unmapped; a subsequent call to try_access() would fail.
> 
> But yes, if the device is unplugged while holding the RCU guard, one is on their
> own; that's also why keeping the critical sections short is desirable.

I have heard some concern around whether Rust is changing the driver model when
it comes to driver detach / driver remove.  Can you elaborate may be a bit about
how Rust changes that mechanism versus C, when it comes to that?  Ideally we
would not want Rust drivers to have races with user space accesses when they are
detached/remove. But we also don't want accesses to be non-sleepable sections
where this guard is held, it seems restrictive (though to your point the
sections are expected to be small).

thanks,

 - Joel




