Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDEEC99C9C
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 02:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4BF10E4FE;
	Tue,  2 Dec 2025 01:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A0Z2XvB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013001.outbound.protection.outlook.com
 [40.93.201.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3BE10E4FE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 01:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TO3y0aJShLJ2E4XwMDo826bk7qqBjahadIPOXdgKfUZ5K+PJElQSCepQp6tGtGmgrsn2ElzjYy+yFDIoTm6LZPkhls0DICty7yj6A9ixx4/QM9XTSN4ZZbHWpOQwb3p/tJ8S4lAm/oyrQXuMP4cYRN3LkH5X6qWVkpTtHQsfljNjI0/IJfAo5sAMpfdgqK+lEf9k3V6tBX2tY+h80XVLcG8rsiVnyK4TwdWFvj+tEIqyUiMBuIKcQZLwxTyCGEmQS7kTf6tTeIK55zgMyf55890WJAQk7tXaODAl8+P9t1JTvf1Obm7mA6hdUUFv0LnNqDZ8Vj+LEnJGCMqvSWIUWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdoApyJAi1oRXRit5MaA8TInd47rTm1nGr3tqsxnwJo=;
 b=EP+xR+0dr2BkiGhUtm9S033+Yk17gxsKx0sfh50ZAFvRt9g9rHw22r8gIqtzALhB6JupUi4GNQ6a2tPXnhE9dYg+GaT4HzgIJLI4sNXXf2Mur0lsN5/xh0NdDm3B9Dox/FGTtBi3yNH9que1c5e0zZK5zW/oHDHrRlhvLIWPTYrAnl40dOIoGwPhwR+Z0IK7CYmDdvf4RaCHSLAwKcri7ZeSQchJhRbzvKQ+E1QIuNVf1e/4ouh++u5/e/9MD/F/KbdrqdTBkGkv4e3vIT4Yd8CXRu6WuuDRHI7DFG+XZQSBgIuE8enxhmjbBkltZ55qaswJhRWr5PEybZ+Q5LGaoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdoApyJAi1oRXRit5MaA8TInd47rTm1nGr3tqsxnwJo=;
 b=A0Z2XvB/4G6XOCS2Mr3QCLOyA1QCcW9hSHzL/dwYC1LQuhOt2GbtcuU0zVdnjk8PvSQS4HPM0VmPxu8U6vB9P3TE0QnrQ9b3J4L+xVOysOJbwiFNS0e2ufALuko7N0PI2uygsQk2/DPCiqT9jXLw6w1FEZDMyiuG6sk+HlWRGn0+mCPBhyDLwMIhxGo8F5PPYISYj4xHpFZD7vkOH/QlhW1hBSozY6YzhKHj1xpMVDn+RgV3ik16HBEp/FGToYlA3q5IGoKNi52ofHvvg344+q4rlxi5NY9tYX6Pnu7Oz/OnT91oAVbg/V8IG2qiwAy9F/EJLA3KrHb4K/cu60N6Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 01:43:04 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%3]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 01:43:04 +0000
Message-ID: <c7771281-5593-4068-99ce-1fab3608cf82@nvidia.com>
Date: Tue, 2 Dec 2025 12:42:57 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/6] mm: Add a new swap type for migration entries
 with device private PFNs
To: Chih-En Lin <shiyn.lin@gmail.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, ziy@nvidia.com,
 apopple@nvidia.com, lorenzo.stoakes@oracle.com, lyude@redhat.com,
 dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org
References: <20251128044146.80050-1-jniethe@nvidia.com>
 <20251128044146.80050-5-jniethe@nvidia.com> <20251201024343.GA9270@laptop01>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <20251201024343.GA9270@laptop01>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::7) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|SJ2PR12MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e827935-4b7f-44a6-d405-08de314422e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFFKSytyYTNNSGNnUFlEclVhMENKSDVxU0pRSVROL2FZWkNFOThRMVF2LzR0?=
 =?utf-8?B?UHRBREVWNnhOdG1VTUVUOFF1VnhLTElyN1RuSEU2OFRGMXRWTDdDd1BicVlm?=
 =?utf-8?B?eW9iS0wrQS9USGFTVEdTZWNOV2dSL1BDNVZ6d0pvYytoemtJTE9YbHpaajJ2?=
 =?utf-8?B?NkNIdjdhNXI2blRzM3RtSkpLSWthWWJ0cEkyY2xMVlRkRERSTlh2V0llMFhG?=
 =?utf-8?B?cUorVlgyUjZVcXRLSG55TkZTRzdRdzdiWTFUVCtKZnpUa2ZzYmJna0dsSGRM?=
 =?utf-8?B?TGpUazR2aHVkK3hibFNNeVo0dDlLZ2pzdUczdGNnUU5oY3RMSzlramg4VGpD?=
 =?utf-8?B?QVRRLzNUTDlqTzZuL3BGZHVnT2hpOHFhVm5IUGk5UFU2V2xKRUFNUmRueC8z?=
 =?utf-8?B?SzkrUHVjeHE4ZThQS0NnMmVwbTFPTVNZOHIwOFc4QU9pWGxjUVVSWGlJMDVR?=
 =?utf-8?B?QmxvUExKbGNYVHY1SktFSTdZR3JmSlRzNWs1Y2JMelladVJoalVZLzhKSUpx?=
 =?utf-8?B?ZUxmMzFCaFRhdUJEWURlR0hCYUZCcFdURFFmRXNmZVVvalo5Z2JMNlZwbmFm?=
 =?utf-8?B?RDJPS3pWK2Y1RHFNclJadXJQUmY5MFRWYlNOY1NlNWEwRmdPMU52OWxEWlEv?=
 =?utf-8?B?QlJ0RVdRZEdlTXRNWi9naGlZcUQzVVN1WHl5K2ZneFFPWmQvbDF3RkUyVyth?=
 =?utf-8?B?UWw4MVdka0c5SUlUK0FuUENyM01TVjNXSEVjM2pDUXV6NEtyaWt3dldCeFpO?=
 =?utf-8?B?TEM2SVdhSlZnbGpWV29DTTNNODFQc01BMTYweUJoNjhXVXlsdk53VWFpQXN5?=
 =?utf-8?B?Yjd0WnBDekFVeHZXQUxiWnRaREkrNGF3MCswM1gyMk1ka3BSbUl1SG0zeDNn?=
 =?utf-8?B?c1dPWlZSSlh0bW9jNlgzOVV2ZExRVmtISGZrdkdhNGFxVVVUQ0NKVTJvdnZQ?=
 =?utf-8?B?b0xidng3QVhzcWlVckZ6M3dRaEg3ZkJKZGVnUGY3R3FKQllyRFBMMVBURUsz?=
 =?utf-8?B?ZFNQZjRDN1dnSnJuTEY5TWI5MGk0U01uMjBUWTQ2NjR6YUZVODBtcDlUQkNn?=
 =?utf-8?B?V2gvRGt5UFJ0ZkRmU29TdVZWeWM0bDZvYnNRZExpNVErTTJ1WjNEN09VdlAr?=
 =?utf-8?B?Y3ViRXFnMTBxcHZIalhQTXIwbWFFNkxNUEIzNXVrQ29nKzNqdnlEbTZYV2Zw?=
 =?utf-8?B?TkRERUxab25jeDd1ZXJhZWVSWTRyUVdyMXFYdnp6bG1KYkJCVURBYzdZcmJx?=
 =?utf-8?B?UmF3a29BMkJBMkhlbFhCbnl6Tml4N3UyV2ZTYnVTc0NHZEpzbHZUdmFYajZh?=
 =?utf-8?B?NC9GQzA5UTM0OThrTmkxOCtUcVFQRStrWG1wdVRQVG9rbHM3WU90dmJ4L2xw?=
 =?utf-8?B?NHNLeWoybnh1UnRwN1VsYnFxMy81dEdTbVBJanY3bjVZTWJ1RHlaU1FFWGNO?=
 =?utf-8?B?dEhadGlld3k5QjUrWk9mQkJhQ1JBQWEzTGJlQk9VWmJ0cDNkUm04RzNJakpQ?=
 =?utf-8?B?a0szUEwyRkUyYk1jLy9vL1djV0hMeGptaDh5eW45RVpFRGhmeTZyd0NhcWYx?=
 =?utf-8?B?WXZzN1BoTFdBOGYrYjEwL2VRZDB4SXVMa0xIM2VrNmhCemRLSlpxRWZ5RXVw?=
 =?utf-8?B?c3kvQU81NzJESnNrS0hDZzFmaDhZTmx0TTZwWitnZkVuc1FDbVUyOC9OUFBi?=
 =?utf-8?B?MmpQQ2VSMzJYNGRMMFhvbXN0TithRjBlUVZJcHhNMnFXWUtacDk3aGxFZWFj?=
 =?utf-8?B?RkRnMEFOZGg3QUVsaEJrTloweHN3N2k5NjBUNDk0bEFkamYvYmZ6cWswSFJV?=
 =?utf-8?B?OWlwRXcwWnpXMUZTVUtyV20rMkdVbW1qWHM2eVcrb2JJZkF5VzNuWHdJRVdW?=
 =?utf-8?B?SnZkNUo2ZTROZnlzeDhVb29SN0RHQWY1N3JRUzRoK2hTcS9zRFNkSzRoc3Aw?=
 =?utf-8?Q?R2UF/nNFZwi1ZK9GCcke5uY7le5st1iS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEZ4czZkQXB3VXV2UHU5Q3BkaEZyRkpXVFFnNVRKQ2FDT0R4djFhODNWWXU4?=
 =?utf-8?B?eXFGbFN5Zkk0NnJLdUJsSmQ2T2dGMzYxS0orbHQyQVg2Ry9jZjZFKzUzVFhF?=
 =?utf-8?B?TW5RemYrdFlnWjBDTWtBSzdaUVFQbVMwell1cGJ1dFVBRDh5V0gveHFad3ZX?=
 =?utf-8?B?ei9DdmIwd2VwSmJmb2lIRDhiaEt4N2djVlpGaWd1QTFOeVpNb3hWMDA1dlpT?=
 =?utf-8?B?WHMwUkZ2WXZxdUZjbm1kTkp1Q2tJNVE2N1NZSC9sQWtNaGRmTXd3Smp3cS93?=
 =?utf-8?B?MGQrS3M0M0IwbXJsdjJyb0hhOE5kaFJPaWh5RU4wa1dTeEhBTGdUeXBuVUpp?=
 =?utf-8?B?andJMmVwblQ1aWowZTFkRnZERHVudUg4OVFUcDBIQUIweXNtK1h2TTFDVTlU?=
 =?utf-8?B?NFI5c25NbVJwbXRBeXRuTnJDcDhsQ1locG1uRnpObmJXT2V0U0ZKQUs0Tnpn?=
 =?utf-8?B?azRqS2RhODlzVmJrZW8wUzBOTjNlMnpwdTNYVE1DWFdQWENuQmVvaUtlbU5Y?=
 =?utf-8?B?T1J1cCt3NGNQZDFxZ3VkczNWRkNZVjNSbS9JSDAyYXJhRndNQktDZU4zTHN0?=
 =?utf-8?B?R2VmOUxIZys5cThabEc2V0N2dlYzVUYyZ0FVQ05FNWZUazdmUW1PNWNvSWR0?=
 =?utf-8?B?S2dpcm5JaDJZcmNjcC9iR2RyNlF1dWhlYVlDZ1g1Q1NDcHZDUURNbUR3Vm9Y?=
 =?utf-8?B?TCttdkRpT3c1cTJ4d0wyc3J1ak1VK1VzOHp0ME83czlraHNzNTFlbmJ4YU5Q?=
 =?utf-8?B?UnFKSWFtbnB2NHpLWk1RKzNZQVRrN3NUc0tUNFB3TjBDOC9MZ3A0eGkwQ2pR?=
 =?utf-8?B?cmxwd0RZQ3pNTTJraHh2Zm9HVmdrMWVBQWhSOTlZa0ZiTkVXWGd1L2V3MENr?=
 =?utf-8?B?WWdRa1hPc093bWpVY1FtUDBFNVdkTEVlekFBcmtVeVFlSDNjRG9UQ0pWbHEy?=
 =?utf-8?B?K3FTcW5IUkhvdkJnU1BZYS9pOHZnWFRsNkpxVFliSDU3SHY4RGorZ1JDVGsv?=
 =?utf-8?B?TXJBd0F4RDZWWmIyc0F5dDUyaVNnbFNQTFZoSWxIRi91KzNmWmtSRXAvTmZR?=
 =?utf-8?B?UEowa0EyWGN1Tld1N0IxdjdyazA5VHBIOUNaUStvNEdHTmtHOFlETFhleFFS?=
 =?utf-8?B?UHA1N0k5T0g2T3VJVHZwTXJzcXZnREdZa1hkUDBSQUVzUmNIRDZiVEpXTGVU?=
 =?utf-8?B?RGFRVXoyWUFUN29nMDVCeEI0SUFwWjVFN1g1LzloNWQrUG15bzlYL3VsdDdX?=
 =?utf-8?B?bHdYeFd4dGFmUmI0UnRteTF4dXByZ2lmTFdiRVJWVHRTZGd6azRrUnVqbVVX?=
 =?utf-8?B?eHFqNWRlT0hpcmlNVEFuSW1xTTM3eS9nWk1rdlNqWm4zb0xxQWEya2xQQndk?=
 =?utf-8?B?ek1NaWl3bVpCaWdWZ2J0YWJxb2VpYUNQSjJsNUpOcUxqWnM0NmNDaGhUbU1i?=
 =?utf-8?B?R2x0eng1YS9mc2dBbjFIbkpxL09kUkx4UVlQSUZiaFU0VDl6QjhtTE9UN2hi?=
 =?utf-8?B?aUZFbm40MDhtVUpxWDljNHJpNlhHOXg4bXdvcUd1OGhGcEp4czdwYkkraG9T?=
 =?utf-8?B?Y0hqL1M1S0RkWmhocm5VRFNkTzhORGdvVXRPVURrejNHM09wSi9XalQyOWtG?=
 =?utf-8?B?Ym9mTzVmVnhKOFBFQkdMU0huZFhSSUxTZWYrVmFCUFh5WUw3YnpHYzdlKzhX?=
 =?utf-8?B?aXZEWFZ3aWpweHZtOS9HSmN5NFZYMndiNXNVWkpDVFVWQU5WYTY5MDdsL0Uw?=
 =?utf-8?B?V1V0dkhSZStkc1M1YW1YRzJHRWhhZHRpK2hEbnZIdlphellqdnF1Y2FURGdX?=
 =?utf-8?B?L3JEVmlWejJ1R25ITk5UWnVqb1A1WldZeUVCODVmOStpeTdXYS9nZWJIaEN4?=
 =?utf-8?B?eWczOXNya1VvQXY4WWRCR1RPUG4vY2NhU0RRMURNWHcrV2JpM05NWHhnUnpZ?=
 =?utf-8?B?OVE5RExOZUZITmNKaUx4K012Mm1uY3lkVEYwVldodmgzSWpaZVEwSTRLVGh3?=
 =?utf-8?B?cjFxdTFOZ3BZeDRuNzRvUlpBMWx5YTVnSGZqYk5PZlduS2UzcU5xRENvSTNE?=
 =?utf-8?B?dkovbkhtSENCUzk2bXVmdUpIZTNmandXTDViMVg2NlBIUUYvRGEzb3ZqcHVV?=
 =?utf-8?Q?zdQqw35fhdWtye4QJorQEaAIi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e827935-4b7f-44a6-d405-08de314422e9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 01:43:04.7764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTGWAEOXGouROfx7EadCsrl5U16F9mF2yHM/QZsTLG60zUB7uAfsngfs6y1EwoNvKvSPjcvWj4cfbPraYxkYvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961
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

Hi,

On 1/12/25 13:43, Chih-En Lin wrote:
> On Fri, Nov 28, 2025 at 03:41:44PM +1100, Jordan Niethe wrote:
>> A future change will remove device private pages from the physical
>> address space. This will mean that device private pages no longer have
>> normal PFN and must be handled separately.
>>
>> When migrating a device private page a migration entry is created for
>> that page - this includes the PFN for that page. Once device private
>> PFNs exist in a different address space to regular PFNs we need to be
>> able to determine which kind of PFN is in the entry so we can associate
>> it with the correct page.
>>
>> Introduce new swap types:
>>
>>    - SWP_MIGRATION_DEVICE_READ
>>    - SWP_MIGRATION_DEVICE_WRITE
>>    - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE
>>
>> These correspond to
>>
>>    - SWP_MIGRATION_READ
>>    - SWP_MIGRATION_WRITE
>>    - SWP_MIGRATION_READ_EXCLUSIVE
>>
>> except the swap entry contains a device private PFN.
>>
>> The existing helpers such as is_writable_migration_entry() will still
>> return true for a SWP_MIGRATION_DEVICE_WRITE entry.
>>
>> Introduce new helpers such as
>> is_writable_device_migration_private_entry() to disambiguate between a
>> SWP_MIGRATION_WRITE and a SWP_MIGRATION_DEVICE_WRITE entry.
>>
>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> ---
>>   include/linux/swap.h    |  8 +++-
>>   include/linux/swapops.h | 87 ++++++++++++++++++++++++++++++++++++++---
>>   mm/memory.c             |  9 ++++-
>>   mm/migrate.c            |  2 +-
>>   mm/migrate_device.c     | 31 ++++++++++-----
>>   mm/mprotect.c           | 21 +++++++---
>>   mm/page_vma_mapped.c    |  2 +-
>>   mm/pagewalk.c           |  3 +-
>>   mm/rmap.c               | 32 ++++++++++-----
>>   9 files changed, 161 insertions(+), 34 deletions(-)
>>
>> diff --git a/include/linux/swap.h b/include/linux/swap.h
>> index e818fbade1e2..87f14d673979 100644
>> --- a/include/linux/swap.h
>> +++ b/include/linux/swap.h
>> @@ -74,12 +74,18 @@ static inline int current_is_kswapd(void)
>>    *
>>    * When a page is mapped by the device for exclusive access we set the CPU page
>>    * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
>> + *
>> + * Because device private pages do not use regular PFNs, special migration
>> + * entries are also needed.
>>    */
>>   #ifdef CONFIG_DEVICE_PRIVATE
>> -#define SWP_DEVICE_NUM 3
>> +#define SWP_DEVICE_NUM 6
>>   #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
>>   #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
>>   #define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
>> +#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
>> +#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
>> +#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
>>   #else
>>   #define SWP_DEVICE_NUM 0
>>   #endif
>> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
>> index 64ea151a7ae3..7aa3f00e304a 100644
>> --- a/include/linux/swapops.h
>> +++ b/include/linux/swapops.h
>> @@ -196,6 +196,43 @@ static inline bool is_device_exclusive_entry(swp_entry_t entry)
>>   	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE;
>>   }
>>   
>> +static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
>> +{
>> +	return swp_entry(SWP_MIGRATION_DEVICE_READ, offset);
>> +}
>> +
>> +static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
>> +{
>> +	return swp_entry(SWP_MIGRATION_DEVICE_WRITE, offset);
>> +}
>> +
>> +static inline bool is_device_private_migration_entry(swp_entry_t entry)
>> +{
>> +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ ||
>> +			swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE ||
>> +			swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
>> +}
>> +
>> +static inline bool is_readable_device_migration_private_entry(swp_entry_t entry)
>> +{
>> +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ);
>> +}
>> +
>> +static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
>> +{
>> +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
>> +}
>> +
>> +static inline swp_entry_t make_device_migration_readable_exclusive_migration_entry(pgoff_t offset)
>> +{
>> +	return swp_entry(SWP_MIGRATION_DEVICE_READ_EXCLUSIVE, offset);
>> +}
>> +
>> +static inline bool is_device_migration_readable_exclusive_entry(swp_entry_t entry)
>> +{
>> +	return swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE;
>> +}
> 
> The names are inconsistent.
> 
> Maybe make_device_migration_readable_exclusive_migration_entry to
> make_readable_exclusive_migration_device_private_entry, and
> is_device_migration_readable_exclusive_entry to
> is_readable_exclusive_device_private_migration_entry?

I agree - I'll change it.

Thanks,
Jordan.

> 
> 
>>   #else /* CONFIG_DEVICE_PRIVATE */
>>   static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
>>   {
>> @@ -217,6 +254,11 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
>>   	return false;
>>   }
>>   
>> +static inline bool is_readable_device_migration_private_entry(swp_entry_t entry)
>> +{
>> +	return false;
>> +}
>> +
>>   static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
>>   {
>>   	return swp_entry(0, 0);
>> @@ -227,6 +269,36 @@ static inline bool is_device_exclusive_entry(swp_entry_t entry)
>>   	return false;
>>   }
>>   
>> +static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
>> +{
>> +	return swp_entry(0, 0);
>> +}
>> +
>> +static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
>> +{
>> +	return swp_entry(0, 0);
>> +}
>> +
>> +static inline bool is_device_private_migration_entry(swp_entry_t entry)
>> +{
>> +	return false;
>> +}
>> +
>> +static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
>> +{
>> +	return false;
>> +}
>> +
>> +static inline swp_entry_t make_device_migration_readable_exclusive_migration_entry(pgoff_t offset)
>> +{
>> +	return swp_entry(0, 0);
>> +}
>> +
>> +static inline bool is_device_migration_readable_exclusive_entry(swp_entry_t entry)
>> +{
>> +	return false;
>> +}
>> +
>>   #endif /* CONFIG_DEVICE_PRIVATE */
>>   
>>   #ifdef CONFIG_MIGRATION
>> @@ -234,22 +306,26 @@ static inline int is_migration_entry(swp_entry_t entry)
>>   {
>>   	return unlikely(swp_type(entry) == SWP_MIGRATION_READ ||
>>   			swp_type(entry) == SWP_MIGRATION_READ_EXCLUSIVE ||
>> -			swp_type(entry) == SWP_MIGRATION_WRITE);
>> +			swp_type(entry) == SWP_MIGRATION_WRITE ||
>> +			is_device_private_migration_entry(entry));
>>   }
>>   
>>   static inline int is_writable_migration_entry(swp_entry_t entry)
>>   {
>> -	return unlikely(swp_type(entry) == SWP_MIGRATION_WRITE);
>> +	return unlikely(swp_type(entry) == SWP_MIGRATION_WRITE ||
>> +			is_writable_device_migration_private_entry(entry));
>>   }
>>   
>>   static inline int is_readable_migration_entry(swp_entry_t entry)
>>   {
>> -	return unlikely(swp_type(entry) == SWP_MIGRATION_READ);
>> +	return unlikely(swp_type(entry) == SWP_MIGRATION_READ ||
>> +			is_readable_device_migration_private_entry(entry));
>>   }
>>   
>>   static inline int is_readable_exclusive_migration_entry(swp_entry_t entry)
>>   {
>> -	return unlikely(swp_type(entry) == SWP_MIGRATION_READ_EXCLUSIVE);
>> +	return unlikely(swp_type(entry) == SWP_MIGRATION_READ_EXCLUSIVE ||
>> +			is_device_migration_readable_exclusive_entry(entry));
>>   }
>>   
>>   static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
>> @@ -525,7 +601,8 @@ static inline bool is_pfn_swap_entry(swp_entry_t entry)
>>   	BUILD_BUG_ON(SWP_TYPE_SHIFT < SWP_PFN_BITS);
>>   
>>   	return is_migration_entry(entry) || is_device_private_entry(entry) ||
>> -	       is_device_exclusive_entry(entry) || is_hwpoison_entry(entry);
>> +	       is_device_exclusive_entry(entry) || is_hwpoison_entry(entry) ||
>> +	       is_device_private_migration_entry(entry);
>>   }
>>   
>>   struct page_vma_mapped_walk;
>> diff --git a/mm/memory.c b/mm/memory.c
>> index b59ae7ce42eb..f1ed361434ff 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -962,8 +962,13 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>>   			 * to be set to read. A previously exclusive entry is
>>   			 * now shared.
>>   			 */
>> -			entry = make_readable_migration_entry(
>> -							swp_offset(entry));
>> +			if (is_device_private_migration_entry(entry))
>> +				entry = make_readable_migration_device_private_entry(
>> +								swp_offset(entry));
>> +			else
>> +				entry = make_readable_migration_entry(
>> +								swp_offset(entry));
>> +
>>   			pte = swp_entry_to_pte(entry);
>>   			if (pte_swp_soft_dirty(orig_pte))
>>   				pte = pte_swp_mksoft_dirty(pte);
>> diff --git a/mm/migrate.c b/mm/migrate.c
>> index c0e9f15be2a2..3c561d61afba 100644
>> --- a/mm/migrate.c
>> +++ b/mm/migrate.c
>> @@ -495,7 +495,7 @@ void migration_entry_wait(struct mm_struct *mm, pmd_t *pmd,
>>   		goto out;
>>   
>>   	entry = pte_to_swp_entry(pte);
>> -	if (!is_migration_entry(entry))
>> +	if (!(is_migration_entry(entry)))
>>   		goto out;
>>   
>>   	migration_entry_wait_on_locked(entry, ptl);
>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index 82f09b24d913..458b5114bb2b 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -235,15 +235,28 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>   				folio_mark_dirty(folio);
>>   
>>   			/* Setup special migration page table entry */
>> -			if (mpfn & MIGRATE_PFN_WRITE)
>> -				entry = make_writable_migration_entry(
>> -							page_to_pfn(page));
>> -			else if (anon_exclusive)
>> -				entry = make_readable_exclusive_migration_entry(
>> -							page_to_pfn(page));
>> -			else
>> -				entry = make_readable_migration_entry(
>> -							page_to_pfn(page));
>> +			if (mpfn & MIGRATE_PFN_WRITE) {
>> +				if (is_device_private_page(page))
>> +					entry = make_writable_migration_device_private_entry(
>> +								page_to_pfn(page));
>> +				else
>> +					entry = make_writable_migration_entry(
>> +								page_to_pfn(page));
>> +			} else if (anon_exclusive) {
>> +				if (is_device_private_page(page))
>> +					entry = make_device_migration_readable_exclusive_migration_entry(
>> +								page_to_pfn(page));
>> +				else
>> +					entry = make_readable_exclusive_migration_entry(
>> +								page_to_pfn(page));
>> +			} else {
>> +				if (is_device_private_page(page))
>> +					entry = make_readable_migration_device_private_entry(
>> +								page_to_pfn(page));
>> +				else
>> +					entry = make_readable_migration_entry(
>> +								page_to_pfn(page));
>> +			}
>>   			if (pte_present(pte)) {
>>   				if (pte_young(pte))
>>   					entry = make_migration_entry_young(entry);
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 113b48985834..7d79a0f53bf5 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -365,11 +365,22 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   				 * A protection check is difficult so
>>   				 * just be safe and disable write
>>   				 */
>> -				if (folio_test_anon(folio))
>> -					entry = make_readable_exclusive_migration_entry(
>> -							     swp_offset(entry));
>> -				else
>> -					entry = make_readable_migration_entry(swp_offset(entry));
>> +				if (!is_writable_device_migration_private_entry(entry)) {
>> +					if (folio_test_anon(folio))
>> +						entry = make_readable_exclusive_migration_entry(
>> +								swp_offset(entry));
>> +					else
>> +						entry = make_readable_migration_entry(
>> +								swp_offset(entry));
>> +				} else {
>> +					if (folio_test_anon(folio))
>> +						entry = make_device_migration_readable_exclusive_migration_entry(
>> +								swp_offset(entry));
>> +					else
>> +						entry = make_readable_migration_device_private_entry(
>> +								swp_offset(entry));
>> +				}
>> +
>>   				newpte = swp_entry_to_pte(entry);
>>   				if (pte_swp_soft_dirty(oldpte))
>>   					newpte = pte_swp_mksoft_dirty(newpte);
>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>> index 9146bd084435..e9fe747d3df3 100644
>> --- a/mm/page_vma_mapped.c
>> +++ b/mm/page_vma_mapped.c
>> @@ -112,7 +112,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>   			return false;
>>   		entry = pte_to_swp_entry(ptent);
>>   
>> -		if (!is_migration_entry(entry))
>> +		if (!(is_migration_entry(entry)))
>>   			return false;
>>   
>>   		pfn = swp_offset_pfn(entry);
>> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
>> index 9f91cf85a5be..f5c77dda3359 100644
>> --- a/mm/pagewalk.c
>> +++ b/mm/pagewalk.c
>> @@ -1003,7 +1003,8 @@ struct folio *folio_walk_start(struct folio_walk *fw,
>>   		swp_entry_t entry = pte_to_swp_entry(pte);
>>   
>>   		if ((flags & FW_MIGRATION) &&
>> -		    is_migration_entry(entry)) {
>> +		    (is_migration_entry(entry) ||
>> +		     is_device_private_migration_entry(entry))) {
>>   			page = pfn_swap_entry_to_page(entry);
>>   			expose_page = false;
>>   			goto found;
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index e94500318f92..9642a79cbdb4 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -2535,15 +2535,29 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>>   			 * pte. do_swap_page() will wait until the migration
>>   			 * pte is removed and then restart fault handling.
>>   			 */
>> -			if (writable)
>> -				entry = make_writable_migration_entry(
>> -							page_to_pfn(subpage));
>> -			else if (anon_exclusive)
>> -				entry = make_readable_exclusive_migration_entry(
>> -							page_to_pfn(subpage));
>> -			else
>> -				entry = make_readable_migration_entry(
>> -							page_to_pfn(subpage));
>> +			if (writable) {
>> +				if (is_device_private_page(subpage))
>> +					entry = make_writable_migration_device_private_entry(
>> +								page_to_pfn(subpage));
>> +				else
>> +					entry = make_writable_migration_entry(
>> +								page_to_pfn(subpage));
>> +			} else if (anon_exclusive) {
>> +				if (is_device_private_page(subpage))
>> +					entry = make_device_migration_readable_exclusive_migration_entry(
>> +								page_to_pfn(subpage));
>> +				else
>> +					entry = make_readable_exclusive_migration_entry(
>> +								page_to_pfn(subpage));
>> +			} else {
>> +				if (is_device_private_page(subpage))
>> +					entry = make_readable_migration_device_private_entry(
>> +								page_to_pfn(subpage));
>> +				else
>> +					entry = make_readable_migration_entry(
>> +								page_to_pfn(subpage));
>> +			}
>> +
>>   			if (likely(pte_present(pteval))) {
>>   				if (pte_young(pteval))
>>   					entry = make_migration_entry_young(entry);
>> -- 
>> 2.34.1
>>
> 
> Thanks,
> Chih-En Lin

