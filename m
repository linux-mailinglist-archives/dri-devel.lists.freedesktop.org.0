Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D03C8A9AE46
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 15:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD47510E7FA;
	Thu, 24 Apr 2025 13:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e6LA3L88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E1310E7F8;
 Thu, 24 Apr 2025 13:03:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQsS9YBGxTHBNFDeDZLK3xxP4tcbP8yUXACtNAk6qGcyy3Fa+mwyZBaemao54V8kubWJAc2QzdA6ezgrbNXUF8O94XxdJb6WlYBfJf2AwIwNHJzf4luCMw2lTrR1NvlsYh8JwejHBsbs5f/JovHtH7JyydatFFCwX6VzmkdXAIXhhiiHwAIyfkgUC5pT5Pdgy5CAdgCGemMEhytxBBdychmP2dmgEqrBYdiQbPMS+xPFGRwEjwheXJqnJV7xBcmIgEA9NJOgUeIMJQpkdBAPwvhoJFwRxbxrFMSKmHtND49daZgnEtZDn8htO1LD6VOEvyjXKl1ZBiUw1UVaFRTznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyclWrV/ixVEzrmOPMVf1lJsQZwc0AoBPyPdINDlSqk=;
 b=nT8Vq1dOOu6bompaergkEfsO2QiAxcBmoeBIFOgRW/ELA6CCfqbgYFNlC7mMUmYzZhKH3gyVfKNv1h5sy72V1UJluiDu3HLFXFdw4Ck980UCn5pJ9fUSuGucYjwFqUpj6C1OCdzA8E75F5cA8Wkx53dBevr81YDlA4m+Ao98Szoi2lsjVv9N+3sG62r1Cj+NKZXxz0a1hT5sNNxVMhWAmJ/ompxqAhxGph1BUe+NZydDju5N+ZMtbrKdAhBIwVnouI7DCKcQGfjmsc5/iGR37tu82hZ4CJZp5+m3kBRl9tWgEry3MiqwccJ8n1FvQBw9f08ZWgKR9jHE3QEza0leCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyclWrV/ixVEzrmOPMVf1lJsQZwc0AoBPyPdINDlSqk=;
 b=e6LA3L88O+cb75iwFJkYtyM8yDsYWYdcMKgdUNXCETumSUqil8Xhi/03+OuJRtgl0uWXwU35UEaLAH9vaIgkrhJEhzfo8ms/RItC9Rv1vLr/mVgL7vq1zyA+iK8KMuM0BUDmE8qm00qPvgDs86b9CIIntoYjy/Rij4q4MujsHmvwAzz8bEPeWToV+L07LRIpYap81gOVQtJGhE8ag2kThfT/NrkWwPwQzal8ymwpa/3biIIJ3gt4Vevz7j/d1lvLdkyJtfQqMSHruVtcWstnd35GTajHY7MR6bET2tb8t0XVY9jJ95lFasp06xQw44SzZhSQMbEuL4pp8i/8NAhZPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MN2PR12MB4286.namprd12.prod.outlook.com (2603:10b6:208:199::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 13:03:10 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 13:03:09 +0000
Message-ID: <f3635ec8-7d1a-4265-8131-249567858013@nvidia.com>
Date: Thu, 24 Apr 2025 09:03:05 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [5/6] gpu: nova-core: Clarify fields in FalconAppifHdrV1
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 John Hubbard <jhubbard@nvidia.com>, Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>
References: <D9EH1WXQOIO7.3RHFKYSFPBXE4@nvidia.com>
 <174546399398.876.3516508778193165894@patchwork.local>
 <D9EPABWOVVYD.2H8WXZNM0BE60@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <D9EPABWOVVYD.2H8WXZNM0BE60@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::30) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MN2PR12MB4286:EE_
X-MS-Office365-Filtering-Correlation-Id: cd274f72-9a7b-4c08-4659-08dd83305cb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVhtVWZ2cC9YU2lzNzBhRkZvd1BvM3pmZmhGUm5IbnVGMGdpRlgwckJNNS9o?=
 =?utf-8?B?dVljUlFxQjAxUVR1dndYZnFoVmxlWFVFMVlaTWp0YkxiL1NieklUZitNWjhm?=
 =?utf-8?B?aHF4empKWStKZ2JFOFQ5djJ2QlVFdXRaLzF3R1hicERMdTdpZVREZFQxVjZ5?=
 =?utf-8?B?TDBSTzlzczlWd0U2allhaVFXYlNudzBuKzYrWW5pcG80VmlzRzN3QTdmUmRG?=
 =?utf-8?B?bENOeFEzV3NLL0s5cHdQSGpheWhGSnJIZnA0c3FLU2k2Y0MxUE5MMm9sdFox?=
 =?utf-8?B?Zm1IbXpsQUlrRFdGQ0gza3E5WEpyb3BkamlraUJRTTNCQkpqVlNqSXB0MVZC?=
 =?utf-8?B?QUtsblNOUENUUHFmU0JpWnRVQlVOcy85WlZFNDN4VGtqYUZYc2FQS01rSjVY?=
 =?utf-8?B?NWk0RUk0YWRUTU1YMmhKeDY0US9TWmswelorYm1DcHR3aEU3bkhZNWNlejZ5?=
 =?utf-8?B?MmRVQWkzajRRUEdvWUJJRktkamh5Z1V0bndzZHpFb3lvUHkzV2ZvMmNCUVJM?=
 =?utf-8?B?WWhVdFlBRlhBYkZKYkZzbStUOFZFTU5mMm1KcUxERTRtWEQ2a0wxUzdEdWpS?=
 =?utf-8?B?eUdJMDVUZUE2SVAwQkVBVEtldEIrUXpRWFFSdFlFUXJRcnlYRlEybFdyZGpS?=
 =?utf-8?B?V0N0UWJkZVczMjhlUnhqUUpUS1hObVFNd0prMzhleC93Sk5sNFhjOHliRGZt?=
 =?utf-8?B?T2lNbnhYMjRCazVVZ0s1M3B5K1IwQTI3TW80QWk2Zmcvb21SWEJMeStnbk1p?=
 =?utf-8?B?M2ZqWmVmZnQydGZJUHlhQXFTRTNGN1g0LzQrSHpqTlVTVU4yYWRrZHhURVlG?=
 =?utf-8?B?Zm1EOW45NUNUVzB3S0YzMFlxdTZmVnp1ZThabzNvOFd3L0lHMTFUOXowSkZp?=
 =?utf-8?B?RjlkWU8xQ3lFSVNQS3NEWCtkYVViekczUTJvVWZaZ2hPSlhPOW9nRVVidlhF?=
 =?utf-8?B?UDdkRzFkeExYOE52cVpBaVovSEVQNEx4dFNBOVUrcThKZE9pS2Y3K0l6T1FX?=
 =?utf-8?B?RVo2bDlxT0lMZjdQQmxZdEdUb2NkTWloS3NzRC9xWjNzMnZDU0Z0bmIyVjhw?=
 =?utf-8?B?REx5N1hnRDdNT05WazJQT1RmTEhRd0VwcFVrblRUa0xDRnV5U0xMQjBJTUFi?=
 =?utf-8?B?K05rUDBGTG1Wb2ZTM3BaMnZ6U1QrSHVERVB0M0FwNXFiNmxlVks4aUVXQVk0?=
 =?utf-8?B?VlZsSWlTSXF0SEY1bllTSXpwMHFCZHpkV2krV3pCeTRsbFdIaTFNOHhYN0Jv?=
 =?utf-8?B?dW0vZDN4VFc3enQ0d0h3V0J5TU03U1ZGWXJYQUFZdEphZWpsT3R2R2NNMFo2?=
 =?utf-8?B?eVJKNDNYOHdodDR5YVZGMDMya3p6U2JQd1VpWDlTcGRlK2UzT2w1N3dCTTc2?=
 =?utf-8?B?MFkxYXk3bnVtZjFKMVNibUMvS2xFTGxTY0ZmU3A4R2QyZWhLQlMwNzA1Nnhy?=
 =?utf-8?B?T3ZsR0MvQnJnZm9YRjZXTHVoVFprenJ3UEFHWVNkN21ydU15NEN4WXJmNWNE?=
 =?utf-8?B?VW1Gc1RJS1A3dFpqUUU2N1owZ0dCdmk2bDBnWk9Ua09tUUtsTmNNZkhxVGRs?=
 =?utf-8?B?S1RnNjJkOGlsUmFiT3VMVm40UHFrZnEvbWI5aXFsWnQ1bHhaUld6MlF2QVU3?=
 =?utf-8?B?RVNYbS85QnlGUzNtWTZVdlc1bHo1dDd2ZForaEtWSXBLcE9TNVlUa25MODhC?=
 =?utf-8?B?cmNCSFZiQnJLaXZyRnBXejFWcVJaV3FRVG5Cb28rY0Zmd2FzMTdZcjRIZ2Nq?=
 =?utf-8?B?RUpJWkJXSWRhdlJodU44SHBNTEpvaTFrUGRrRUNTazF0aE4vdzNmblVMOTBm?=
 =?utf-8?B?QTdLQ1BzcFBHbDRFVmV2TENrQ0ZTN0w4NSt2VXg1TjE5ZXI4d0R5bUt5cito?=
 =?utf-8?B?S0VqRmVDaVNhRmcxUi90VXJ1MUVrdVhydlRaZGhXRXZXMHNCSTNFdDlsTnJV?=
 =?utf-8?Q?XuAFwS6jGp0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2RjbVlzam54YXgwOWYvNUlTOUtkR1JOamhkNjRhS3VkQzZITzg3SklxZG9k?=
 =?utf-8?B?aW1XVWRGeXd3MnNWMDVhTnVLemNjSVF5OVIrMXJFbWx5UXlBZWNucHp4ZURh?=
 =?utf-8?B?aHNpNjFrQUQrc2RocStDRVBtSU9wVWoxRWtFZHNBRlY1dG9FVTJ2TWFMYWtm?=
 =?utf-8?B?emRUU0tUU3VidlMrTEY0bENqV2F6bTJ2VHFzWUZDWUpKY0J1UUJTSjMzZ3ZW?=
 =?utf-8?B?MkVSVjlIeE5RMjBzRmEvTVo0ZDJ1d0lzVENwbUhuQzQrbWhpMnRuQytlRzFZ?=
 =?utf-8?B?U1dscVU3MEZJcDRCajZwOFBUczQvN2RmYXUyL1MwOFFnM2tzQ2h0MHZjdXZ0?=
 =?utf-8?B?U0M2RGxZQmd0d09GMWJKUnljTkNsSHFFaUROdGVIbHhJN2RNbnNnRjBqcDdr?=
 =?utf-8?B?WnBRejhVd3NUQzNMQkdFSmVKc1hzRllwR20wUjlJUjFwMVUyaEdnNXlXQmxi?=
 =?utf-8?B?d3hTK2dpSmJpeEViSHZTOHJ6YndkcnhIdDE2R3BrSE5icytRRWxKQ2RnbFFJ?=
 =?utf-8?B?NUxQL05MaXEyeEMxOEFBSkNibEgzZzM4WG9DdDh4VE9vbzlmeDhPUHFJREpP?=
 =?utf-8?B?NWNDTEFDbWV3ZlRZSmE2N3NkRGZGU1FpdnF2aFA2TTA3UzdKNFdWbDNqa01p?=
 =?utf-8?B?bzVqY01xS1MwQkxuQUN3RXcrUFAzUzJ4ZmFNUFlCTTNrWnZlcGZKVllEaXV6?=
 =?utf-8?B?SHZVcGRlWmRFMUIwbmEveHowMW9BNGNWb002dll6YnhUNktUV0thbE14blVx?=
 =?utf-8?B?UGpBU2NYRW1JOUNXTjBKVHhranl5VEVqMjRDRXVBNjZjY2kzZ3BnZ3c5L05Y?=
 =?utf-8?B?NlNOTEg1SDdBcHREUURmVG53bmozVmpraC9BVlR3MEpncDVJWTViVmdENFFj?=
 =?utf-8?B?Uys1ZnNyT0NhTTZrOG1IZUJzSHBNRjRwY3FwY1pSTVZSSHVXdTVwaFBqejc3?=
 =?utf-8?B?R3FGcVhkMHJqUEFtSHQxOEx5TzBKWHFSWStxYlpUeUxZV0FXZ2tPNTVzblFm?=
 =?utf-8?B?aWluSllTUkpJYzQxbEdEVHhzYjk3MlRJRmtUYzNZUVdrN2tIQXFmSWhlVlkz?=
 =?utf-8?B?NXZwWCtlKy9zTllYRmxOYlZFVFRQVEVrU2hPdzVFNmgxd1hVQUFTa0lvWWFM?=
 =?utf-8?B?ZGpKWmVzODdDWTdpbXRPK0RjMzI0K0g0NHNET0FlaWVENEcrMGl1ZDYrblla?=
 =?utf-8?B?enJoZ05KdXRoVFV4Ym50cWhlZ29RZlVSSTNmK09lVCtiWTNEU2VSbFN3cHN0?=
 =?utf-8?B?bzNGc0RLSUVKbTJ5ZHdkUGlRbzFqaTFvYTBwQjJVb1JuVzdUZmhZTXFQQ2lm?=
 =?utf-8?B?Zlc2Rysvbll3QUQyMzY0a3g4WFAvQVFXWkhybGhibldKbjlSRXN5M2xzelVs?=
 =?utf-8?B?TUdYRHFsUGwyWmFTN1VXdjZPeWJ5Zm1yL01WSXZsTlo1VzdrY3BuaU1vL3Z4?=
 =?utf-8?B?M3Z2YUtDWENCV3B2Z3dzRzBxaUlDbkw2UGExT0huQ2VzRnNESi90YjdsRlJH?=
 =?utf-8?B?STNkaG5ka2Y5Z21PYlBnSUh0YXQralVKZ2FaR2VRNTB6TG12T1RRdnVVM05u?=
 =?utf-8?B?c3N5ejNSUFhwd1FIamNIMkZUQ3RoSE9oam1IQmdPSTdBU01yTTZTdDU5eExG?=
 =?utf-8?B?bGxTUXhjdE50a1J0em9EaHZWeXNQMStaVXY4Z1Zib1paVGZLTkM3OGxsdUZu?=
 =?utf-8?B?eFJIZlRqTVdYdGJoVzAxdnR5ZVlUNTVYUkpDUW4vWlVqeDkxNGVPSTdoaTgy?=
 =?utf-8?B?YkVNM2Z1K3dzcWJYK0NNK3htY3JJS2k1RDlRUzBUK015REtEbDlMRm8vZnRk?=
 =?utf-8?B?Rk4xSi8yK25xWTRSVnJzazh2UGF0WUVSNG5mUmdTK3hlMGlOYkdhQnYrWW5G?=
 =?utf-8?B?U3AyUmljV2Yyeks3Zkgwdmw5RlU3OGJZV3pRcDBacEdRcnBPbjYrM09LWHB6?=
 =?utf-8?B?QWNzYS9GM2ZMOGwxdzVUaWVPMHNueE9PTS9rcTB1MUFLWEViU1dUb0Y1TDBO?=
 =?utf-8?B?Nzc2ZnIrREwvb21BOUpuaUVtdUkwa3phWUFTTXJ3VlJVL0p4c2RPVFYvaTZa?=
 =?utf-8?B?OXh3VllETGlyc3hKM0RHUW9YWmtldk5sdnFJSmpsUUVkOXgvZS8rOExycmx5?=
 =?utf-8?B?clA1YVZmNVpMZkhBSkljcThNYjZxbDNzazhpR2s0QUZXSStnRERXN0YvaTc5?=
 =?utf-8?B?U3c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd274f72-9a7b-4c08-4659-08dd83305cb4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 13:03:09.6217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Jl5Gvu1g7C2ckX/UBpCxUpc45ZWy0KB1MyyL9GKVMme7Yv+x1gmrmhaUpEkVzhetr2Usac4vsJUWiWwrwMg5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4286
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



On 4/24/2025 3:45 AM, Alexandre Courbot wrote:
> On Thu Apr 24, 2025 at 12:06 PM JST, Joel Fernandes wrote:
>> On April 24, 2025, 1:18 a.m. UTC 
>> Alexandre Courbot wrote:
>>> Since this just renames fields, would you be ok if I squashed this one
>>> into the relevant patch of my series, alongside a
>>>
>>> [joelagnelf@nvidia.com: give better names to FalconAppifHdrV1's fields]
>>>
>>> ?
>>
>> Yes, sounds good to me. Thanks!
> 
> Ah, but since the documentation for FalconAppifHdrV1 references
> fwsec.rst, which won't exist in my branch, I will only squash the new
> fields names - please make sure to carry the FalconAppifHdrV1's
> doccomment into another patch!

Sure, that works for me. Thanks,

 - Joel

