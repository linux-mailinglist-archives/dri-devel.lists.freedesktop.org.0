Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8C7AFDCF4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 03:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825CE10E702;
	Wed,  9 Jul 2025 01:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gs33wVg3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2056.outbound.protection.outlook.com [40.107.100.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C158910E6F6;
 Wed,  9 Jul 2025 01:31:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXTk2DZ8BVcmoWkasLvlFYwVx+ksbEtyzHvI4EnfvGDGGaA5KJy9tbM6k+OH0PcQTpszGbnaMdjXe5eCGP861hPnjc+c2ZQacYXC/nfZCduAV/zR3vo3RcbD11mU3DFRYfImrm4YmivMlIQAbaM1hGhAbHi376+sd6yqEpj6DEF97KFCty59lHj4Csy4q/lcAoKsJIjCR5cWr7wDOA3GvuGSPwdVUkoC7mAC67LF8nkU/p0HWG9QzQQDUOHQYfivF7jxLI6BY3f7SYM4JIXLHlXYvYl268UsPaHHwdXL/f5aHGeaIXICmuV7jmcTjqAD3Nb92ac5hcnn7nHQ0PVV/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3uDIEASyYJ2w+eVFRHp1ZmJkC2bYpcprj3cMlosmfQ=;
 b=oYdlhpW8GHcKxg55oYwPGBteQahYWSnYxUpNNKzA+Pklg2VOhxeDxlLtTwBssQIil3cQ4KUFTVHXSW8F2I2wnwZe/KoYb7lETrNftwnotIBrI9GlJgY62bvhXJzn6u9flt++8JxsClZTj0tlHmt9vaqg2deIgzi8d9EiPTU6wipXRjagLa69n/RAQQs8gGNI3x8DcZOCxq0SjIXYPTQMoHt2nj+V/F0U+vPMuaFLBCZ9VzlkLgDeMNwhCaOTbN0R1utkTTLCNZU9LgOavuEK9vy2rerMy0P3dR1n7by1mMHn1vxohUOl9JCC6xr7KyCUb+qJiijfifZhB7TtEqFeGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3uDIEASyYJ2w+eVFRHp1ZmJkC2bYpcprj3cMlosmfQ=;
 b=gs33wVg3FE9tzJyEBqO+FUg4KgiVbTmXaka4Pe5Ad+y1rLwFh3n7ws5e5zeHoqD86huloKmG9ixomDNcZd1pIfgiT4fzSfMscrpB+gGPLhR7uotZlwJ5jNtZGBxpCf6QhFQZrezYaCu0HsBDI0CyjXzaC9jjM+qFIhMsGjkmYJKyqkUjH06GABYWollnd3/ahigXqfqN8VXcMem2e6PP8WS8iqhv+znHvjys8fYgKdSbuDsdzRbbsOJJ3tvvKZsnNo7U6g7MGaNaAy12TkdwAI5IjCCO0HVrCb9SkaJOmS//86GJPT7ZLXEQ3Cg+3C+Yj8EGoyYFlmatga/4Z1Y2bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW4PR12MB7167.namprd12.prod.outlook.com (2603:10b6:303:225::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 9 Jul
 2025 01:31:51 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Wed, 9 Jul 2025
 01:31:51 +0000
Message-ID: <c1fb6737-9027-4e7f-a45d-f081eab9f30a@nvidia.com>
Date: Tue, 8 Jul 2025 21:31:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] Documentation for nova-core
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Bagas Sanjaya <bagasdotme@gmail.com>
References: <20250708-nova-docs-v4-0-9d188772c4c7@nvidia.com>
 <aG2dcwDOVlh3ePGa@cassiopeiae>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aG2dcwDOVlh3ePGa@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:208:32a::30) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW4PR12MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: 730f517b-46a9-4ba1-a75e-08ddbe886114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEVwQ2QwQ3UvbkNadWhYbis2eE1aK21iaC8zSkc3NDY5TnoxbER3bGptRG5S?=
 =?utf-8?B?T3lUZFEyVDRPTCttYm44MytKTU9NVUkxeGN3L1RRdXpqY0xuN1ZXWEZHU2NB?=
 =?utf-8?B?ajBUa2tQUnZGek5jYW56RUxpSUhlNmFNSWZwc0Z4cXdDbkV2NnBZR3M3WE9L?=
 =?utf-8?B?N2RlQmxKR3RnK3RJaUhjcVZ3ajFQTHdLdDV0b2VWb1VReFJhUUpVekNaTEF6?=
 =?utf-8?B?a1lVcW9KNzBjOGNxcEhiQVVJU2tYVkE2bUhuUEJDMzdMcXVHemNwMjlYQTZx?=
 =?utf-8?B?aDcwVy8zVUR2U3hxTHJQT3krK0hqSlZIZXZFVC9abXNESkFMZk1LYzQ4OTBV?=
 =?utf-8?B?UmVweGZHM1VMcDBTWHdGSXErUEJCbENtVlBPK0swTUZnenByekVwTU9tdjlu?=
 =?utf-8?B?ek9EKytmeHRic1BNU1FqK2VsOFdnRU5ML0hpbVI0NFkwVGFDTzAzYVFBaUVJ?=
 =?utf-8?B?VjJsOU5QcFVKb3JmNUlrK0phSUpqa1lYelpzcnZMY0JjdkhtZXhmVXNNYWRM?=
 =?utf-8?B?VTJkZkgwcWlGVFdzNGVZOGNaK3JsNjZzTURpTlFPQ3JXQURMTkJ2dWNsRytC?=
 =?utf-8?B?aHhPa29NWldoOU8rWUEvS3NsbEJKTG8wM09DTy9JWHBvNEoybUJ1cTNTS2NY?=
 =?utf-8?B?MEcvdnBScDgzWVpQTDJ1Q0lVNE9CNmpxRGxpaGdJMzVwK1p5NmF4NnlXV0U3?=
 =?utf-8?B?TnI2SlUzQi9sOC9BYnZiVDdxTkZGQk5VaWlSa1dsREhEbjlabk9WVkE4alcy?=
 =?utf-8?B?WEZUMDRoeHBmaE52WGVXTEdJV0dMc2hYc09KQU8wSnRZaVMvSzVzR3dhdTh3?=
 =?utf-8?B?NnlqUVI4TXFJVy9pQzcxVzVPYXhYMjdOcDFUYnhjNWlmSWk1YnZYdDBnTjMz?=
 =?utf-8?B?TUtMSHRFd2tLMkhyVDYwYVZ3TU1ydXFKRkVtMEg5amlHQU9uZjcvNG96UE0x?=
 =?utf-8?B?ektzOExSbFJjQmp3N2RuOE9YT1BkL2pHa0IveENWN1VsV3I0ZHN3OWdtNFBx?=
 =?utf-8?B?Qk50TlVseDh3V1piZ2Z4MExOcy9xOXcrYmpaNnZlVVBtbWhueGFqSXNBNlRw?=
 =?utf-8?B?czEvRVcwenhIRXpBc0g4citTcWtPQXRqRFpQeEpzWjJrR2gwYlEwZncrenJz?=
 =?utf-8?B?MVN5Qi85TVBsS1hTNUZ3Zm5mV04zVDViS0QvOHZyRkVYMFl4MFNkSkZ4NXE0?=
 =?utf-8?B?bWtZb0pvQkl0eW5RQ2F4TGhWSFNJdk1HcytTU2o0QWNkWVpYaGJoVitwSmFV?=
 =?utf-8?B?dWJjbURtdEVnWkFnSlB0ZmVpZXBuaGxBamZkS1hRZmtXa2xTUnpGRGxyZW1p?=
 =?utf-8?B?WFJjRk9UcEFyQWdzeWhVRDNkK0dObFhMZW1FL2QvRG5WTkRRcmt0elF5MHIv?=
 =?utf-8?B?a251a2tEelZpb0VjZm1qMzBnb1dabGo2L0pMdlV1SzVmSFRXZmRuOWkrbXo3?=
 =?utf-8?B?SXo2a2tEdE1QS003UHBNYWlzRjRHb2t3dHlaWWFlSEc0cTJUcFR4MFc0SXRF?=
 =?utf-8?B?cTBoNlhkQ3R2enJqeHVIZVh0K0gzK2tTUkEwRGJOaEhZcStwR3NwZDJHK1J0?=
 =?utf-8?B?ejl2SFpMVnZ0Wk94aldBckNFVW5PV3MrMy9sK3I5a1p0Z3VsRnowT3FZdysx?=
 =?utf-8?B?a2tZMFlWa05rWmNscUM1ZFdEOXlMVVBjdzJpS2hmYnlxeFdBaDlMYmZaOW55?=
 =?utf-8?B?SUdqdlV6SjlKT1U4KzhMY1VsQ2lpK1RtcmFYY2E4VVlLN2ljZ0MvNWlQNWY5?=
 =?utf-8?B?cEpRUk5VcEhrU3FvOXhNb0RwNUsrMWZtUm0zZ1A3RXhQelpvTkVSQ3lPK3du?=
 =?utf-8?B?VS96Z0NPYmRtNk0wZGxGNHFubi9sbjBWelVtaWhVUzRNQytOMjJEeWdzbnBT?=
 =?utf-8?B?YnMrK3B2MlRkakh4TCtENHJEbjNzbTRTbVlkUmhpL2lPWnY1aDhnbW5lVkFr?=
 =?utf-8?Q?E9cihIG/DhQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3h0VUlJZmRBOWdxYnZKbU9UVnNCUWhWWFBFLzJlOWJ0N05hczNRMWhJNWg2?=
 =?utf-8?B?K1BWSEV2YmlLdmNPd2J6eE14a0RoQ3UwVXk0REpMVlEvTE9YYTFyS2U3YWlj?=
 =?utf-8?B?OEVaR09HRFJDVVJFTUp1MnlCZFpJdG5UWUQ2WnlmNUJ1d2ovSUEyWUVqcEp0?=
 =?utf-8?B?NlI3MWZ2OGVUWG9CQ2xXYklKYjFIV1FJZlpDVUFTYzhxYVo5YWVJdXNkeGd3?=
 =?utf-8?B?MUVaTzQzNThHa0RwTzR5SkRsWnVyR0JqWldpV1hjVjRPY1VISWhMVGExS2Ex?=
 =?utf-8?B?RnJDeVNXZXByVFFnQ0xpUndkYkZLQWI5ajFSOVUzL1RDMVVpcktsdHRybFdj?=
 =?utf-8?B?bzRoY0U3cU5wbmVMN2hOVzhuTXUzWjREbXJtemZpY3FNem52eDVkSnp4NmhG?=
 =?utf-8?B?Ly9ySEZVR09MSmFwUkJGMHlJSnJKTElraVAvRGNBNmFWTVZheW54bWdBVVEx?=
 =?utf-8?B?L3FoLzkwUDlGY0pQeXVmc2d2Z1VlcFUwaGRpcGhobzN0Q2Nhd3dTZkJBYnZw?=
 =?utf-8?B?ZE9zZHh6ZU90ZkEzMzFvTFUva1E5Ly9laWczU01KYnZEOExTblM1SlBmNjlq?=
 =?utf-8?B?TVFEYWNHTW9rcEE0MHhUWVRONVRqUCtzejRRK2pOM0tIeUh4ZW9vV0IvanYx?=
 =?utf-8?B?aEw4b1hONHVMTDY5YjE2bDdkTzJPY0lreDRkZFBEdGpTZS9pTzFVeDd0WUxr?=
 =?utf-8?B?LzM5eCt0WmQxRFBKQTBZVFl6THdmV3RVV0NvTTg2eWpEL0tqc21oekxqOFlS?=
 =?utf-8?B?ekVrZXh4RUpVaHM4dU9yeG83dXVIQ21ubngwZHRQOXN2eTNLcUMzQy9QaXV0?=
 =?utf-8?B?cDc1VVcyMVM2QUZ0UVV3Rmhady9FN3NIUFhuUzJPeG9oS2ptL2NidTZjejNa?=
 =?utf-8?B?WGFFK0x3WjRXemVlNnJaaTU5S0JiN1hqeWtuaEwxc3pDbVBiVTFnQnBrak9n?=
 =?utf-8?B?TWdjeGxPZk9TZWtYWmZiRnpFekVVNnl1VkJiZnF2bnR1YzNlelFCQS95ZGZ6?=
 =?utf-8?B?M2RMUG5oYzdNWE5JUGxDZVNSRy9ybG1meGdlbDNDWUdmUkc1L0lHWUhzSkZK?=
 =?utf-8?B?TElac2JOQ2Y1eEpmQnI0eWdpOXZxYUJzeFgvL0VscDlhS2NjaC9nbmZvbWN6?=
 =?utf-8?B?YzE3aGRPTmtlbG50WEU3Wkl4Q0RDcVlaNjkxNFlIaWx2cGdGSkhNdkwxcFNZ?=
 =?utf-8?B?TmJ0L05xSDVvNlpZMG5GaXdxdERQQmlJMSt3d21kMVpwZGFLUWNDY0hTcFNa?=
 =?utf-8?B?TE80VkIvWkZJdkEzWW9pTU8rVlgvNlByMFRXcUwyMWtaVk56NlhHcnN3ekQ3?=
 =?utf-8?B?TlFIaEhGSnQwZ0xkeGRXYUUrNThoS0U4VXZWYlJsYzlHbUUxNUE3RWpMNUJ4?=
 =?utf-8?B?YTFmRFlPNnBqU0pXZVJRajJJUDU1YnM2djFabi9hR05uOURpUXJmWjZHbHlM?=
 =?utf-8?B?VkcrMnFwWXBYZlpZazBVSlhCOHBXaHpiVUFPekNmREhpQzVFUEtOT0FRYVBV?=
 =?utf-8?B?VkxydTVsWk5aTTdmb293d1plVWRwYVBOVE5pTSt3ZGhtaE1QbjZKVUwyb3NF?=
 =?utf-8?B?aGdGT21xUmlqRmtKN0lrUk5kdkdNRWtaUk9NZmQwQ0p2Q0pSZStJVTF4bkU0?=
 =?utf-8?B?b3ZPNkxXL040VTlMd0UyaUQwbGh2TWkwTW15Mno3NVhuT1h2VTNxQ2NYS1py?=
 =?utf-8?B?ejA3RXFBYTNyY2dnckd5MUJmZzdPR0JJRyszMkY5K0JFTDMwcVpMUmwxcEZW?=
 =?utf-8?B?b2FGTnQvd0U1Y0tmRmh5OWtXcjNKY1ptUTNvMmx3VkpwRlNBK3QrVVBRVHBU?=
 =?utf-8?B?UmZnYk9EaGkyMTBUUFZ0YlVGVnh2WXVWc0FJTm01V2poeGd2VTE3L1prWmRr?=
 =?utf-8?B?a3ozaTkyb1RJQ0lQVHFxWmlVMm9OcFZhTm9MQkxPV2wyTDFGOHFCZmxub1RS?=
 =?utf-8?B?cUlKYi9XdXNvSG1UZkFidk43KzB2Z3hTTExpa2JqWCtXQnhZN0VncnBCZGFZ?=
 =?utf-8?B?MGFOaGZoZFBKZS9EUWVHZnpkblhGWUl5b3dSNnpacjY5b3V0RUR0VkZrcUVJ?=
 =?utf-8?B?aDQwRko5dEZXMjI0ZmM3S01rT0RpaVVSMzRxSkdSZm1HZkVLOEZTcDJlZlBz?=
 =?utf-8?Q?/6gUZiooet2NOs3J5pm3EeDcG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730f517b-46a9-4ba1-a75e-08ddbe886114
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 01:31:51.2001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H16U9PPJmhqIzuiULF4anbe5RswMTyWSwGoeL8GQR8VDfZzMrDPAReREnqsAih9jwP/n3+gciiGAUWuot8eiWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7167
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



On 7/8/2025 6:36 PM, Danilo Krummrich wrote:
> On Tue, Jul 08, 2025 at 03:49:40PM +0900, Alexandre Courbot wrote:
>> This series adds some documentation that was relevant to the FWSEC-FRTS
>> [1] series, but wasn't sent alongside it as it was worked on in
>> parallel.
> 
> Joel, thanks a lot for this series. It's great to have this documentation --
> very much appreciated.

My pleasure! Thanks! Looking forward to many more. And thanks a lot Alex for
fixing these up and posting.

cheers,

 - Joel

> 
> Applied to nova-next, thanks!

