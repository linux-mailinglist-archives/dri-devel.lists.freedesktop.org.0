Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983B4AD6867
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 09:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB23C10E785;
	Thu, 12 Jun 2025 07:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1SI8YYzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64AC10E722;
 Thu, 12 Jun 2025 07:00:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndrakzWUV8w5g6icwcW7DlxykYoE/P3/nmnYHNMtlQZFY7bZM4h+sMpu0UqGwuVk5GV7hBSOc2UEGdzscFoV5nVLfUGAGDgG+6QgzlYRG5sdu/QhhNoG0MxQNGVkDWDOqWF3dY+3qPXjgRsbgBBWF5MGWj2RGCDWLmHHvS7kXMlho1iAyEQ7JUBZgFClzDfr4vR0zbdyPee1d8mKVVvTm12NjvVCqr+ohAwQgZCkhUCeiT1o7a2RPtfS77Bf7uXKNHlDrTbYtOhfbMS+IFnciEg5uZCG24E+zX4T+Tef9dEFAYyLvJ+Ge7RvgHB493S3Hdj7OQXYk18D35wAuBtzeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0Gp0HJLHz+lH09sju9yFcY/wTv6VnG+SbKffu+orKw=;
 b=G887SAq8YMKqtmU0VCrgyiffrwJB8VF0nwyzJRcHX6/wIhiTuiV1Znoch0qZ+acbSOEHsGd/0R+g9glYyBBLRrVW/K3p0xEGiD6Cz4NL9P1u+lyVD+s0RpeLuo5piy1We2//v1g5E4TLP9t1CkLnAwTzndE4uKiRlEEKOAMvHkaC3YJgK+idCc8FLnqI9hInASojrxl9FhgXTwlxkTVJYLQUCsKnG6wc0J+W8x/JLuEdejLV4/p7MYNLSJ7oJ0OMA+R23VwwcMn+yH93q8NxfuSOyGr0g9PsyFv4CDyTVG/LXgdqOghVgtMHCD+ZDu4ovqdhrNrKJDSLeq/yeY1SAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0Gp0HJLHz+lH09sju9yFcY/wTv6VnG+SbKffu+orKw=;
 b=1SI8YYzHR/5eSaME8sMKj09KNCuXjKQ3cA9bixC7WUrNVC5cs+7FIcV5KwrJgIRIPgqq2v7EYhtuzEe8YH7+AwWNG0K/fDVDueoQ/EI3iIfplVaUV1b9QBUltRghAtHlijd3jhHV54wD6MEzymzEUf2LG+iud7sKvo57xFCCQ4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7188.namprd12.prod.outlook.com (2603:10b6:510:204::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 07:00:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 12 Jun 2025
 07:00:38 +0000
Message-ID: <5f71cfd0-fd38-491c-8255-bdd3e0fb19dc@amd.com>
Date: Thu, 12 Jun 2025 09:00:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/amdgpu: give each kernel job a unique id
To: Danilo Krummrich <dakr@kernel.org>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>, dri-devel@lists.freedesktop.org
References: <aEmR9420vj-ISz-W@cassiopeiae>
 <dc661205-1e5b-4697-863b-36a299365219@amd.com> <aEmcpsXwS8dLNGUg@cassiopeiae>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aEmcpsXwS8dLNGUg@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0313.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: f2514db6-b123-477f-ae05-08dda97ed620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1pUeXVUT3VCcDlHenhvTnVtbkdUMWdpRzkweW0zSmRtK0hBblJDalZuKzFk?=
 =?utf-8?B?TjRBUXYxbzhxUGd4cy9yVForMG1RZjdMSVNWWmxJKzNLaTkvdFJxVFhrSmFV?=
 =?utf-8?B?MVoxaTZ2M0h6WkZybUxnN3FqVlg1YTdMeUlEcDlEZzloMTUzOWJwd1NMOUp0?=
 =?utf-8?B?UmtMZWtSK1E2WGpTRXFKZ3NaQVZpUGdYTkh5VndMb01jNmg5YldWMDBmVmZT?=
 =?utf-8?B?YUgrWlJQRERaUjdqTkYrbmxRV2JpV2ZSWkJ0MWtCZnY2VzNOVXZLTno4bFcy?=
 =?utf-8?B?ZHZUcHpzRU0rWnFDUG1NZVo5RkMyVUZYNERGVDZNaTNHSGdaaGhuK2ZGbUVH?=
 =?utf-8?B?R1Nscm44ZENLQmdNU2taTmdXdUpqK2lKb2x1WisvV2dnek5IeHpIVGdVK1pq?=
 =?utf-8?B?OUJuN0phQnlWTWxtOUU3SzlSU3hsdllZUG9mUWphSlFlZ0w3Qkw3dE5BNVBi?=
 =?utf-8?B?LzA2emdGbG5LMzhsbXNwd2dmMzhMTHFhZEw3ci9BREpQNTVONmt1WDBGdXVH?=
 =?utf-8?B?Zk9mRDYvTDNjR2VTVUJZNjZNL05WMVg0UTlqbnQzd1RrSVErRkxZLzd1eEZN?=
 =?utf-8?B?d0h2YmpHY1FDaTdUZjQvNS9oMjhXZXo5QlJrelJJNG03Q0RsVjVBeks0UGd4?=
 =?utf-8?B?WlgrV1ppQUFmQ2ViM2d0REZ0NTlsN2ZTZHJWUmo3OXhLQ2RmTXF5MHNhSUlL?=
 =?utf-8?B?Q0VkdHpTMHVNalRINTJkV2srTG1sckhDSzI3QjRPUEVDMUpXQXh1OGJIT1Q5?=
 =?utf-8?B?MFBBQ3d5TDR6Z2JsdlpMV3lJVnhEZTZSd0NZNzRKTWppUDFVcVo3WGpkREtF?=
 =?utf-8?B?WTQ0OE5icitxZm9ueFNLMks4bDhvNnFsRWNPMXVIdlRsVFV3NDVBYzlEZ2pU?=
 =?utf-8?B?VSs3UXFyVCtWREZ1cG9wdUYvY1JkWm5WVklwWkhVOW5lWDRXdnZEeWhYdTJm?=
 =?utf-8?B?MGlKUW5XMzBzcEc2bndHSjRVSDFJcUVuei82aTViWlhYd2FVWFJ3VDJTZkNp?=
 =?utf-8?B?VWllRnFkTGQrZXhCUTZIcXFNQm5odXcyU0RSYldIWXlSK3JwbkhCM1huQ25q?=
 =?utf-8?B?cmxZOFdUcjU5UGZpMEx0c3NEc0d0NHdDTHlkZnRiUWIwajhMK0J4MjlsWk4z?=
 =?utf-8?B?R1pDV1pidFZmNVdiZGMzRldseEdlU2xxb2hzNm9WNFR4ZmZlNlhJa3NpYUZp?=
 =?utf-8?B?YUlmZVdZSW91QjErK3JkRjh0L3lzdWVXM0ZwYnBBRVJ1YW1ORzkrZ3paSzZO?=
 =?utf-8?B?S3JvSkJEY0VIZldPK29LL2NaSXVoK2tBZzU1WnIzaGIxYUlYU3Fia1dZWVIx?=
 =?utf-8?B?OUEzelk2V2ZIYVVVVTArMXNueFZ1bzAvRHp3THRSRGtMbnpwL3BkMWlJN0po?=
 =?utf-8?B?RS9Hc0RNT290SXBpbTM0QW1YYkZqL0RnYityS1l1VmhSOCt6RnNORDlUVTNN?=
 =?utf-8?B?ZEQxcm5uNnFaRnptVGI1N3VnNURoWmtpR3lxcnhqSWdjR1ZHUzVzMWxndGJS?=
 =?utf-8?B?Z1hqTVZoRFQvSVlNdjlISlFzS3l0Nm1CRmNqUXZOdDVzTmd1M21UU0xFR3Za?=
 =?utf-8?B?djJveVpGaXBpZS9FUHpUNVNia3FmUnZtVjdKQzdTQnVxSFpKbmdBMVBKY2kw?=
 =?utf-8?B?MkR6TGxxeGo3NGZubkF1elFMTzJ2WVl3bW5lVEhEMmNyeGxySm0ySzlIeWIx?=
 =?utf-8?B?WUNvRnZ5QzNvQ2xCQ09takw0SGMxZkJkTERob1FpbHFpUUxOR1pBNWNxZEJN?=
 =?utf-8?B?c25HOG85M29lRy80NTlub1NvRkFGTkFaUG1GZHZmaVdsOUxGWWF6VHpIYTBw?=
 =?utf-8?B?My9xMnkwNXV2RWZSck0yV2pma2VwNjNWV1pUdlQ1T0pVRXYrNnMvdVZ5ZUZr?=
 =?utf-8?B?UFZSVWxMd2ZmaVRKRGZIa1VlaDA2Z1B1K0dRMHNSSGM3ZzZjUEZZL2lyRksv?=
 =?utf-8?Q?V3U+alry314=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dy9wU1NwclVTd28venpjVUJzVDYzSTJrVEE0dmNSL3o5WmhDTHhTT0gxU1Yz?=
 =?utf-8?B?YjBycHhtbnBsWDN3TUFXOTE4STM2dlJPeUhXZXB5Vmg1MGpBV0NhZFQ0ckZY?=
 =?utf-8?B?SFByNFVaNDdTZ1dmVGczcjBnVEhjTEk3L1dLTlVEZHpxRmVmSzJ0Y2lrRXJD?=
 =?utf-8?B?Zm5ycTZBNWNlTGRmaHZ4Wk1UQnl5ZmVFaVV3MkFMNDRtVHZhQ1NTdTBPeWhn?=
 =?utf-8?B?N1JuTWJkaHN0V1ZGLzNQRzcwRW56VWFhWVZlV3ZKMUcxa3pBSkhrcHZXZmNB?=
 =?utf-8?B?eGpnbndBTFdRQmdHYUx3eEgzN1hIRlFXdjN0OEpLYVhOR1lXSFF0bEc3ckhG?=
 =?utf-8?B?MUMzSmhXYWxKK05xanlGdTh1YUpaOE5paldFRGdMa3UwNlpnMjR5QkpUQ2h5?=
 =?utf-8?B?MjRJdmlwRGZMS2NhVTEzekdqKy83QnVtczFxYmV2cDU4M0tNRVpNQ2RVMExw?=
 =?utf-8?B?K3d3czQ1dXVuRTVTVVJXSmhJbnh3M3R4a3lKVTRtdkRuVTZucTJKcG81TGVo?=
 =?utf-8?B?alI2K0IzSXlQZTZPbUpNU0FpTVMxVGRYbWE2SnNCZkd5NHdRcHU1b3VoUUs0?=
 =?utf-8?B?WktsZXlvMmtDdWhLbmErN3oyOHVKVm45TTgxL1VVTW1TYjhZSGVMMnpLTDNm?=
 =?utf-8?B?VmxXZHZUUEQxMVpkbnlEY05YajFWNEp4UG9qcHlERkM3Z3UwTSsvN25mVTJK?=
 =?utf-8?B?bXJrUnFOdloyeWpXNUlHcnV1N0s3Q2g1U0I4VERWMDZYM3l6b2dJaHRUdHVr?=
 =?utf-8?B?RkJRcVVnVVdDbzltTWx2UTlxaUZzaGdQbFRveGovTEhkY0JDYks2Mkp3S3FD?=
 =?utf-8?B?ZjV1Ry9UZUZySEZCTXpUZVZEZjd5SE81Qi8yWGdXbTRIQWVPb1ZsTWxUNERE?=
 =?utf-8?B?QmIvWUhPcXFBd3lkVGc4ZEg4Sm5SRmJsWW5vdmFOeEEzQjBycmxwc011aSsv?=
 =?utf-8?B?VEEveDZMcFhSOFVvUDNwMDk5cXhLOHQrU0dpemNXMEtoMG93Zzc0NFIwN2c4?=
 =?utf-8?B?UG1yc1E0Z0ZLSzVSdy8yOFU4ZWdxa25ZUkIyRGRlS2Z2VmNQM2pGWjhUU1Ft?=
 =?utf-8?B?bnVmbXMwUHpNcTNWb01VQ3owblFPUCtlMkc3L3dWTno0eWVjNEF5aktDaWc1?=
 =?utf-8?B?a0hQRXJKdUNOQ2w1c1JIME1WWHh6WDRaWnA3NXE1bVcwazJTTWx0aS9qeDlj?=
 =?utf-8?B?Z2tvaHlNcG81SHZBYkVTU1FpbUdiT0VNQ05sUDRZT3lNSHlhSHVZcGtxbGpZ?=
 =?utf-8?B?Mi9mb0M2b2pzQjF0Qk5DMTVqQUY5eVUzZDg2SmtFemVDM3JyUi9xai93dU1Z?=
 =?utf-8?B?TVM4WTVpeU4xZ3RHWXdRSjJtNDZFbmg4QWFYSUxDbW5sV255N2kwaTN3aG52?=
 =?utf-8?B?d3lmMlFWYXZvMXJFZVhBY1RYc3FDdEtINHBOY0JlMEJyWDRFYXN3aXJBamI2?=
 =?utf-8?B?ZEUzWEp5eHcySTJZcGhqS2ZIQXpHbzc3RU5jY1B3eTZrdHphOEtHNXFyZitt?=
 =?utf-8?B?citTVUFNOUpyOTBwcXRpeUJDZjc2NmE2WmVxMk9BTHRVVitvOXp6Z1I5M2ZX?=
 =?utf-8?B?djBQcnlhdHdqR2NzMWRxZDVwSXdwN0pFNlo4Nk1oVm1EYmduWGluL0Vqd1ho?=
 =?utf-8?B?eWduc1ZHSU8vbHNxdDYxNVNOT21lelJDUG5JemtTdzVqR0JEWFlFazdwaHM2?=
 =?utf-8?B?MXl6TXZNQnBVQ3RoNGNiTFJ4WUtXTHdJb3lIMExaUk9ySmE2RVFaTncxSVFx?=
 =?utf-8?B?R1M5cnpsSkRGbnM3T0dLR2tzMUdMTHJUakRkV2sxczliMlFDTDI0QUg0ZTln?=
 =?utf-8?B?cWN5dU9qV1RBeWJDclhrak1jRXBvenZaR3grRlgxODFmQSs1Q1ZsMXFsL2NC?=
 =?utf-8?B?cmp0a0R1VWRUdWlRY2JTNGV4dUhUc29CYkY2bjJWUlI4T0g5aXhRajFTZmIx?=
 =?utf-8?B?cHpYbGlTSER0eTkySDhEaG5tTTZrelVvek8zYnF2K1lzWXQ5TEZWclYxUEx2?=
 =?utf-8?B?bUZUcWlMZmN5ckUyQ1ZTakIyUUs1NXpoSDRCOUduWEFHUHVtQ01LVTVCMEsv?=
 =?utf-8?B?N1RrQktXNFR3bS93UkF2Q1NhZXM4RkVCQVJQOTd5UDJnWGFyaGRHdHNmTys1?=
 =?utf-8?Q?4goAvcKrGSe3t83RsPUiYbHIE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2514db6-b123-477f-ae05-08dda97ed620
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 07:00:38.3128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GF2D0AbV4VpQguod35jONgN2TwE/aE7+zGfKoHkclsR0txaXOu9Z98McZuM+Zu9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7188
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

On 6/11/25 17:11, Danilo Krummrich wrote:
>>>> Mhm, reiterating our internal discussion on the mailing list.
>>>>
>>>> I think it would be nicer if we could use negative values for the kernel submissions and positive for userspace. But as discussed internally we would need to adjust the scheduler trace points for that once more.
>>>>
>>>> @Philip and @Danilo any opinion on that?
>>>
>>> Both, the U64_MAX and the positive-negative approach, are a bit hacky. I wonder
>>> why we need client_id to be a u64, wouldn't a u32 not be enough?
>>
>> That can trivially overflow on long running boxes.
> 
> I don't know if "trivially" is the word of choice given that the number is
> 4,294,967,295.
> 
> But I did indeed miss that this is a for ever increasing atomic. Why is it an
> atomic? Why is it not an IDA?

Well IDA has some extra overhead compared to an ever increasing atomic, additional to that it might not be the best choice to re-use numbers for clients in a trace log.

On the other hand using smaller numbers is usually nicer for manual inspection.

Regards,
Christian.
