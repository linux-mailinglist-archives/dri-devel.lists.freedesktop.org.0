Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E519648D2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 16:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491BC10E6C4;
	Thu, 29 Aug 2024 14:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nFylAEUi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628FD10E6C6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 14:43:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+72y3bVR3Nh4w7X2gBCOHQUSBvFUCdVt2dD3EAKtgmDf6GKy4SJfOiSbGYSdDDK9YxSHyG8Ie2w/U7TFc96u64sdS9rRJW+0EaXhjot5SiJSrAB0FK5Rfn20sqg0KECSYHDKHF7JZJ9U7eZz/j4igAN8UdFxYF2A0nLBUJrU1G1d738j3vAdyiAYwQ0+3toJfjcds4+W4/yEPqVnqfFNF+snzfdGYcCySo+BU2gR1dzOeZeXK29vImCxpk1B+RRbrUO9CzvlVHqIjiokUoeTePYvlTxkErnJ1XSWNLXk9PuMiAneFgF7B//H7H1B6FZuAOU9o5iFDdDpEIfGRrpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyvtcrNu2lp60mCteSXVKNVkTP8Kjdv2X8I/SWKEaeU=;
 b=a+PEI33sPqZwSA/7OlpGUOiXEfEQW+LsoQBbBPXjCQssV3vRQVg729SQfWvDqxpAzHVsoU4zJ/MpUOwvMhfk4qXC6ibonYI5QH783i1bCD5yC8szVkib21ujhQ1x7aIaCjOIgv+Zqum1p8CY2LtHLFeuDo6qZA/GWup/MF7a7odfvkWoti1xaz/esl8mT7m1Z5y1ENpCUPzORDen2aXMdQ8Z2uVPX2dOb+BzBsvl2Cdm00MIZgehn0m8021JfZBu/6MPY5q9FqFI2WWMOgpQ4RXxUU2AL2mKxYaiA7JMw4V+QdFTd1LNh+9Gqnqmi30qzkhgWJKOGQQ+FheK+k0O+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyvtcrNu2lp60mCteSXVKNVkTP8Kjdv2X8I/SWKEaeU=;
 b=nFylAEUiIYBGgokb2vXH3OLJxcoU/HLeX0tu+qtOkVVHm85ioqNX4Qmi30/JKVNrimOMAPubyqDx2wcXLWAvD5nyTp5puagSNlSv+zo6hZ4sZwJmnTOw34Xkfz3fRXEEqK51aA1m1U4CtoNtX1NkCnXoJZolttbU3fIhTxUFgcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW3PR12MB4425.namprd12.prod.outlook.com (2603:10b6:303:5e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.29; Thu, 29 Aug
 2024 14:43:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.019; Thu, 29 Aug 2024
 14:43:19 +0000
Message-ID: <7cd6dc81-9c56-40e3-990c-67526565bba5@amd.com>
Date: Thu, 29 Aug 2024 16:43:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: TTM pinning and LRU lists
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
References: <3f972c4bc236cb5b960ff02a33309f9cbea6cba5.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3f972c4bc236cb5b960ff02a33309f9cbea6cba5.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW3PR12MB4425:EE_
X-MS-Office365-Filtering-Correlation-Id: 366b936c-1d17-47b6-12a9-08dcc838ecaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWZ2L0xydjBmczlDMmp3aHEwR05IQjB2R0NTTkplOXd4bGJWV0FZNVNucUR5?=
 =?utf-8?B?dWNjVDZ6WmdTbnhqOTdJKzUzRHUzaHk3TVc1R3RyOHJnRWFZTTFJQS9RSVZM?=
 =?utf-8?B?aldYUDFhVzJ1QnUrOG05d1NXUythaWN4TmVRWjVGczF5MVI0M2NQUnlVNThO?=
 =?utf-8?B?REsyZXVJMzNrSlJiMWJENFJ4blJ4SzM2VDhYK3RObGZVcTcyLzRjaFJUaXhM?=
 =?utf-8?B?aHl2aHdHV0dyaFp2bG1ZSG9BSTFlaTFtNk9veWRhS1pVRzJOamRZVUE3b1hM?=
 =?utf-8?B?Nm8yUWdiQlVpZ2Q2VDBMZTlmZlk0aVB0aUh4UmxRVFltczhTVklydXd5TE5a?=
 =?utf-8?B?NWRrNXNJTWRDV1VFcERNNWNhVkdjTGRuWUpPNXFkRWppTjZaMUp4WTFoY0Ft?=
 =?utf-8?B?aGpBdmJiV3R5SzJXMHZ2OHk4aHB6WFhIakdIQXduZ2RrMWlNRUVhelRXVU5u?=
 =?utf-8?B?MWlWMHcwMEVKY1podXBWck1TNnZyL1NZUmJXbC9IZ2I3aGNZKzNES0Raczhp?=
 =?utf-8?B?L1htRlJ0TytveUVoRGpZTVE3Q0o3dmwrRFNCanhZSVhYZHh6VXZwOHdsYWlQ?=
 =?utf-8?B?ZFJ0Y0NFM3R4ZkJwcXU1WXFKWFg1Umt6UmIwd2VqN1cwd0lTMTFDL3B5U0xa?=
 =?utf-8?B?RzcrcDFSalQra25sZEQzNng3SWNEZ0ZtWVRDbWZhTEZidkRFNjNZZkdncnZS?=
 =?utf-8?B?SEI2dWtMLzVnUTlDYlo4RWw5bS9pNFQxaUc4bXF6UUNRYk0rZTJQL3VqNHdw?=
 =?utf-8?B?QnVab1BUTk9sanRnZnE4NnJpQWNyaE44OThhSVcyb3RWeWlIMytrQWxHdHpi?=
 =?utf-8?B?UytQVWQza1JGOXNZaFBKNjdJNVE4U0I0TjlSU3RhOU1OZ2hHajF2VjlPck9F?=
 =?utf-8?B?LythTnZCUXp3MlpIaDZseXB4a3ZTOU1pWnZkV2xVN1hLVlJ5VDNIWW1EZGkw?=
 =?utf-8?B?TDRpR1RRbk5IWUJhQlBMekd1ZCswSHNxSFkzS2RrRnVtYkVQVjY5ZHZiU3k4?=
 =?utf-8?B?TE9PdHR2YmYrS0EyWWpJUUsrTFdyY21sN2g0cFdKdzlwQzZUTG01Q3hFU2lC?=
 =?utf-8?B?Q3Y5SFMvbTBMQml3cnAya2RHcjZUd1RWSDV3enVwMmJRNDdBMU5Zb1RYU1Bi?=
 =?utf-8?B?V05pYjFZMC84Zmx5ODlMVWtqRS9qUnI3Z1FCV1ZNUlNZYjhIRzRwNTUvZHRS?=
 =?utf-8?B?MWhabXBESEpIWCtJRm5QbmdHKzNTNGFiQzJUbnhFRmpxQlYvQ0MzVC80ZXRy?=
 =?utf-8?B?d3Y4NElFUnJPREF0d0UrK3dxTVlkSng4eU1VYjdqKzBMWWJiN2lodTEzaGRi?=
 =?utf-8?B?NzZvUW5PZVl4dHBqeGhaekF6Ky84YjY3YUd4MTlRZ3pmdDdBbWQ5MlliNGto?=
 =?utf-8?B?Q1g4Slhwa004dXRGMlo0N0RwVlEreHF3c0pJdGRnT1N4dk0wbC9IMk1BMkFx?=
 =?utf-8?B?SS9ySnVrWEpwSGx0SGgyNkNDV000VVdMc0RKS2RpUzV0LytzeGRrQmVWSC9Q?=
 =?utf-8?B?RTJpdjdhZGZIdFo5SG5YN2tEUWhRZW91QjdLSFB0Qzk0WXBoTHJYMU1CVXNN?=
 =?utf-8?B?R28wZ2NZUXZaSVBya0hBd2dyZy9JMFZ2THI5enp0TVlWbHFaRE8vVE9TZkwy?=
 =?utf-8?B?TCs3aEM5V2ZoVkhjVEhCbmtLVk5kOFNjOGl5ZU1GamlsYkptcHpHUitqYmhH?=
 =?utf-8?B?QU1HVm4vZDB4QWx4RHVKZUswSUJqR3JqWUtJSWhZbHM3TzlmZmZjNGlWQUR5?=
 =?utf-8?B?WGk0Uno5c2F1WWhIeE12b0JmcS8wcnVxaEsrTlZsaTdKRDhiLzB5Y1JCOW16?=
 =?utf-8?B?MHg2WS9jWEs4WnBueUVrdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aiswRGZrQ0NtUEl5TGlXcmg2L05YVEF5QUxIUFhaSDRJcVNKRHl6MmVzemFp?=
 =?utf-8?B?djgxazdkTHk2ak95QXA5dlpDUzFLOVlVTjdETkxIWW0vSWxiTXQyQjVNb1pL?=
 =?utf-8?B?SkpUbkY4M2dBQ21TR1hkM3FjWmdGbW9QQXBQbU9Jc3lYMDZZdU8wWW9JV3Ju?=
 =?utf-8?B?dVo5MmlKTThBak9sNDU1Y2FYTmZXS3dhemR0dnE4a0dGWXdPMUcwUnQ3NXdV?=
 =?utf-8?B?bCtUVm1DM2EzM3BOcTg3SDNNdDRDNTdWRzJIUXJ0RTBzV3lBaFNia3dPdTVG?=
 =?utf-8?B?TXY4aGZqSFpMWHpXeUVDbWR0MENwU0NUZjYzRE41ZDgrc0g2NndETUQ4TUcz?=
 =?utf-8?B?QlVQWjQ2b0c2alo4MHNLL3ExbDJRSkIxd3ZZUXN2R1NQMXdmTDQ0ZExtV0lt?=
 =?utf-8?B?ZUJkWE9LK0cyQVBKcUdDK0lHL21Cc1A0NC9lZGowdVRaQVBEeDYwalhDdmM2?=
 =?utf-8?B?eTM2MEk2S3ZvUDhSNnE2MzhvUVNTNkpoWStiY2xpRjY3Q0RBUnpMeWJZbndO?=
 =?utf-8?B?eHBzZGViZU56ZE9HOC9NMUg3S2Fnems3NzhqejBWa0lGZklUQWNGUTJyK2NU?=
 =?utf-8?B?QW9pNFpNL25hY0VnM2VWT0htalpCVnByNVJZb0pqTFZtQ0g1WkxhOVlGbW5B?=
 =?utf-8?B?QlZwYTludndQR2lla2M0U2VPL2tXeHV0ZFYxelRkVENxdGdocVBZcUZBSzJn?=
 =?utf-8?B?ZEtTSVRpSjNKSGVSdlFMNkx6dUgrbzk3WlZaTERNMGViSy8rNk9uek9kOXor?=
 =?utf-8?B?RWxqcEtHUHE4Z3VYNS80aXJ3cmhKTm9pZGN2Y2pLVzBxNlJ6S3lhNk1Kb1JN?=
 =?utf-8?B?TUpKYzZDbzVaL2hrRmxuRlZBaFphaXJ3MGo0b3FzLzhHRGdKYnBtcnpHZWhQ?=
 =?utf-8?B?eWh3aUg4eFo5YUNrblJjZWVxVnN5KzJTZzJiZHh1bFZPdTJrNkFLZW5ReVBt?=
 =?utf-8?B?ak9iQUxMaGgyVlEvTVFjcUlMdGNWc0hYUTBMTkFhTGFNMnc4TEVRKzBJbkQ3?=
 =?utf-8?B?M3RaUTNPMTZ0NEJRZk9YYXBPKzV4dWVxYUhwWE8zbDFBd3kzbmVKbVFhSkFk?=
 =?utf-8?B?ODlVWjluNWZXa1JOU1JBb1p2YTBoMGxsblByeVExUkQvZ1JWTDBaR1ZOVWhz?=
 =?utf-8?B?eHJJdTBKR2lCMnZ2WkpHVGw0VHpPZDB5alh4OWE2MlB0WDhoQXJpMndJNlJQ?=
 =?utf-8?B?TW0vdEtURmJ6ZHRmMjI2TnZSWnFsNnpxaW8rcjRwelNVOFV1VlVyem5QM3p1?=
 =?utf-8?B?SXVoM1VFcHU1Z2R4aDNpbmlrYXNXTlRTUzZ1c0k0MnhNUW1iNzIwVVI3eTZ0?=
 =?utf-8?B?SDZKRUpxblpxK1R2MUdNR09DeGtvZ3JTMUJoaUdCV2xkQitFellOQzEweUcy?=
 =?utf-8?B?TURYNytzWU96NHJ4YUpuUEczRWxuNkY2ZHMvVlBtNEFnbFVxbFB0UFJqK3pG?=
 =?utf-8?B?dFBPNldNeUNRcUpuWEM3MDMxN0s1blJmcVVlNUs2UThuNEFGSEY3LzRWbVZ2?=
 =?utf-8?B?dWhlWEM3dGJNRXhaeXNpUGlva3d6b1BKU0xPNUNsS1B5UFF3aFdFd1d4NGRy?=
 =?utf-8?B?cWhSWE84d284dU4xc1daSUN5V3REOXp4T3ZDMUZiclhZbGp2azljQzIvS3FB?=
 =?utf-8?B?aWpiUGRYd1A4Y2c0cTdqZUtScWxHZW0wcE5zM21rbDl4bnFHa3N2K3M5REZT?=
 =?utf-8?B?bDMxTHQ3WlJMZ0Q5a3BPZFlCa1FRMzhyRWxhWnRvR1gvd055YlNueEZQOUZh?=
 =?utf-8?B?dHh0VE0rSjlweEg1TDBpVFk1c21Vay93ZTBwcTN0ZzJraUFCQVFIS2x2KzhZ?=
 =?utf-8?B?ejlYTlJaV0pQM1ZpUnhMYTh3VnM3dlpiay8vcDZYM0NGUDNSelpCeEZyVnlm?=
 =?utf-8?B?eDBKbTZkU2dIUEdsVVlDY3h0L3loL3VsYUFuTFJtcHp5UWs5QlZhQkhSL05F?=
 =?utf-8?B?bzFjMVg1VnhzYjhOZ0RlcmxDMGkyMTh2TGFMbFMwK1RaaGVkS0xRaGk2TFNy?=
 =?utf-8?B?dGJzejVDV2FxWVM5ZUkvbkxJNE8rMW5UODJBM2pBYXU0Y21NbnV0cUZIMkp1?=
 =?utf-8?B?amFuZytldU1IWkFONlc5RWFBeE1VMXM3YWtnN2FqVklkL2lpVG9DcHV5ZDRJ?=
 =?utf-8?Q?+GCKadLwI4n6ONLHWpbRpYJjP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366b936c-1d17-47b6-12a9-08dcc838ecaf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 14:43:19.7278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8phP59evVpIdjoPED1ihQOmCVX3f6lWi/mF54pQkG3U4u3XNvZGYC1e9lRtm2HH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4425
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

Hi Thomas,

that got removed at some point because it cause a problem, but I really 
can't remember what it was. Need to dig through the git logs and mailing 
list.

I wouldn't mind adding it back, IIRC removing it was one of those 
temporary workarounds which became a long term solution because of lack 
of time.

Regards,
Christian.

Am 29.08.24 um 12:30 schrieb Thomas Hellström:
> Hi, Christian,
>
> I noticed that calling ttm_bo_pin() doesn't seem to move the resource
> to the pinned list, but keeping it on its manager's LRU.
>
> Is it the driver's responsibility to call ttm_bo_move_to_lru_tail() to
> move it to the pinned list after pinning?
>
> /Thomas
>

