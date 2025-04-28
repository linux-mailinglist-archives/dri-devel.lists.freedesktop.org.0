Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E80D7A9F3DE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 16:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E354110E50E;
	Mon, 28 Apr 2025 14:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ELyt86T9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2267C10E3D9;
 Mon, 28 Apr 2025 14:53:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWpt7rgPb38fS+0lJiYALRqmbfip+cYB2VG4/mdIavKjD8ynM1ADpGQi8528GwVNOrNHcJ5j40P6Ohr/klTyzvXpZYCwPYRhoxfYaoGI9ODUQ9cELt4kqaMN1r231pANvPAH5Hz7B7VszSuSUcKgGj5xHqZnW2wY4nWajrIZqqVrix7EmYpb7ZBANTcMGPSB8LoPeZBkEqX9f2O7oycP/z0aNLKFW0baOX+6+HQ5sUdxIS3ZOxuEDQhHFSlnrS85qEimRiMMvRwSbXy/yTlzPVKhEsGYFy0Nfbp8xYXc42d1l4315rTDzI1WwsCqUku73Z3234BmgeAFfOZ1qCSwgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUiyxrKkvQ7Gg8yEyny3ulrqFmzUfmcrgu4qvqeNdnw=;
 b=fyOMuvfqz9hV07lv7FCnMmAbtOAQ57KG9p4vLGTLfYlOknIX2gNca7FWgK6jylSnkSb3Vty7GOLKM9bSsYeQN0QgQziiTnwOd5XcqA81BTG51IV+a2x18OKohvQNjqZjFobKhErwxh9qVv6aNa9bKajZjvIb/f/N9CXJZsScAmxJJcY5SSbs/NokCssH30fjG0aTs2NYkDwU9NYa1S+U39sFRVZN92v4HKDdvAEaxp2eGSjpJ3FRashdpOUedgrhh7p43EGN6jjGKl/RfoJacHTpBw2EdnH9K6oSg87kkg+o1GcmDtNEf5Za0VKrVYUDRYhxMsDymXVF+zWtYc9X7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUiyxrKkvQ7Gg8yEyny3ulrqFmzUfmcrgu4qvqeNdnw=;
 b=ELyt86T9eBfbHb2M6cAsyyfTKpY+FlHg6qJ72UU+lHxj76YbaTAhcrp3v6QVc4MrRgGdR4aQvb0Cm1lWOmnIuJ8+YZIcrFcwfBj93e06BBwC7lyNHHZPN8KoPQ2DHANVCdq/mu7YV/Ty9uLPwbiOTxeJ0Df7BOCFkhyBM74u2+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS4PR12MB9708.namprd12.prod.outlook.com (2603:10b6:8:278::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 14:53:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 14:53:41 +0000
Message-ID: <9d7392ed-20fd-4237-89bf-483f9930e09e@amd.com>
Date: Mon, 28 Apr 2025 16:53:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: check a user-provided number of BOs in list
To: Alex Deucher <alexdeucher@gmail.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Denis Arefev <arefev@swemel.ru>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Chunming Zhou <david1.zhou@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20250418083129.9739-1-arefev@swemel.ru>
 <PH7PR12MB56852EECD78C11BD15157AF383BB2@PH7PR12MB5685.namprd12.prod.outlook.com>
 <CADnq5_NLEUZget2naQm9bYH1EsrvbhJCGd7yPN+=9Z_kKmUOCw@mail.gmail.com>
 <BL1PR12MB5144467CB7C017E030A4C3E3F7BB2@BL1PR12MB5144.namprd12.prod.outlook.com>
 <9e4700f6-df58-4685-b4fe-6b53fc1c5222@amd.com>
 <CADnq5_O-tqQ4y7sNx0nMD_0aTFO0H7_vVg=umaPXUbBLFmwnJg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_O-tqQ4y7sNx0nMD_0aTFO0H7_vVg=umaPXUbBLFmwnJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS4PR12MB9708:EE_
X-MS-Office365-Filtering-Correlation-Id: 123c718f-b3cc-4347-15a9-08dd8664773c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXQ3RnRyUmw1SXNERklwUVNJOG5Qb0pwQWs2eXRRSHdid1FEL2pSNUV1NFl4?=
 =?utf-8?B?K3hjeXIrR2hNd2d6RDNRMWx1c0QrS2Q4VXVQU0F4MjhXNWhxZmZIazNSNVFm?=
 =?utf-8?B?R3FJS0dRaG02RVlyMVByNU1QMGVJL0ErNFlralRIZ2lMWkJUOEEyaGhYa1lO?=
 =?utf-8?B?bExNajlTTEt6clZRUkh3SllEN3ltc1VIYVphYVhPbFBiNFMyd2NndEdVYy9G?=
 =?utf-8?B?Qy96dFJZVzZHSFZtSXVxRitDMFVpaXFkT1p6V1FQUFJWNWd6bCt4Y3FEc2N5?=
 =?utf-8?B?Wm9JN2FjdnZJdjhPTzF2WFp0SnNlanFYTjZyOWV1b242aG9KQnVzWThRTHc2?=
 =?utf-8?B?RGsxRU9zYWc0ZzBQSmxUdEd5eExyQW5vb3FaNlNBSUc4ZXk1MVJmM3lYZWow?=
 =?utf-8?B?NUZkaXpDQUJxYjdNenBJeGQ0U3hVZnBGR1BadmsyM2ZkVjN0M2IvdTJkWkhn?=
 =?utf-8?B?aFJZd2h3TUlObFUrcDh3ZGlLSlByVHVGVGl0RHE2ME1QNzdFTWFzbUc3elNw?=
 =?utf-8?B?ZGVkUGtrRElvazdTeGpDNEFtQStwTFpQSjE2NVdFUk1nbVJsVGZvYTRnOWls?=
 =?utf-8?B?cWVzbDNsQU5CQUZSSEg3Vm9QcW55ajB4T1l2UnNyNTZFUnRGN2E0cjVVaER5?=
 =?utf-8?B?anpkeXNMTDltNm41eUREVUFaNDZubjhGcjdObkQ5UzFMaHRkRVJ2RkpHYUZp?=
 =?utf-8?B?RzF6NWJLZklqMUV1V3Q4NDVPSHNqbHNtQ2NNSXFDbnA3aDVaeVl0TUI2OXFT?=
 =?utf-8?B?N1UvVU12TkhhNHNKU2JaSGhraHNzcEdEK1ZHbGVVQW10L3ZSSjhNSE9IVHAv?=
 =?utf-8?B?ODlwQTcrR1QvLy9OQ1RYNW9oQWJKNWEwcTliOE9sWFI2aHl5ZC95ckhVUVlG?=
 =?utf-8?B?c1NGVXUyT2NOeFdZRHhvWUZYVTY2K0tTZ3RrNmJDcHlpYnRkMGNQd00wUFVU?=
 =?utf-8?B?VUdMRzM0OFBmbi9xUjE5OEpaTzNxNEE1WnRuQzl4aUFJS24xK21ZRVdCUUJi?=
 =?utf-8?B?NWJoWGRXL0xoZ0Q5dEZ3OUNmNm1YVWxPL3pPcFNVbitIR2k0bkVBWDgrUlR4?=
 =?utf-8?B?OTY4d0lqZEZyWGtiUGhlZEk0SDI2TFJRRXUvZUF1SGJ1TEdpSkpldWxuSTlJ?=
 =?utf-8?B?VzZkMmxPRkM5QXJMNFc2bnpzSWlNTVVUVk5EclFBV21MdW5lU2trZXJaSGhs?=
 =?utf-8?B?V094amJaTDhCbTVZT2dPSWs3ZVdqQnprTE1FcGpQVjFOY0h3RUN4K1RZV25G?=
 =?utf-8?B?NFlIcUd1a3hWWWRrK3R3NzVZKzgwbFZqMXJpbCtWb2FzY2NQYVhPVDlOSThp?=
 =?utf-8?B?VlcwV2V5NUJMbmIxMlpQTjNKTXhXaTM4Z2hsQmZ2NGJuNEhkZGR6MmtBR1V3?=
 =?utf-8?B?ajNCZ1pncllQbXpTWjhjY1hmVlR1WjQ0RHZPY1NMQVkxUTFqbzFrVUdEN3VN?=
 =?utf-8?B?d0VUWG5GdXA1ei90ODFyZmRJNU1BNHNKQ0VTVU9VcnBxT043bytzdWw3Wjgz?=
 =?utf-8?B?WGhNcHVZREZ6WHFEZGJzM3ZDYmlNVGpxVTJYaEE5UHRvZGVVWVFXekNVRncx?=
 =?utf-8?B?a0VqUldjTmU2aXlWU0QzcFNORjNaaGFSbkJCakQxR29YTkg0WWJCOXh2dFl1?=
 =?utf-8?B?OURna2p0b1FnWkpKTjZPV1h4Ti9ZUTVqeGdWWitjRGdVUFpkeWZKc2VremRx?=
 =?utf-8?B?UlJxYnBlTVNVTEZFd3ZTRHFCRUxZb0pKU0s5aWJhVDdtNmdBOUxidWJTVWFB?=
 =?utf-8?B?TUhyUlUwQjVWYTVaaGZlN0lFa1cvR0xtZVlXWlRzQVZHbHlEak1PNVpzUHNC?=
 =?utf-8?B?KzFRNlM1NGZabzhoZVV4Nkk5TUJkSzN2SWtITWFyazdILzN1b2pYRXp2YTFI?=
 =?utf-8?B?R1EwQzBGb1YzMzNud255QllQNnVYQkdVQ2FJUG02THpUYWlpVXlvL0wrc2Vt?=
 =?utf-8?Q?Ka/FBxjxHk4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEVWeURJeXhldnN1UkRGZjRaaTVaemg3NkpyeTNtT0MrOW0vWnlqMkk3dUho?=
 =?utf-8?B?S2Z6Ym02eGUrVVJUUEpMK0MzZWt3MVJTcFhCZklkVmZxWWVpSE5uZ2pWcFlK?=
 =?utf-8?B?SlVqSFR0eHdvRHJhTnViRFVHK0tMM0laZmcrbVhZL2xUU1IrQTZ0UFkzZ21X?=
 =?utf-8?B?bWFORFlNS20yY2kzbWdqTVZMS3FaQ3hDa0dtK3JrM1FGTE95T0E5cjFsV3hu?=
 =?utf-8?B?SGhzYmtWVFppcDdCem9KSW9xQU9sQ1FJL0RqNTV6cWtkNjhUajJTQmRhOEdD?=
 =?utf-8?B?Qk1CU0hMUlhqdzlhT0FZM1lTMldPMk5BZW5hY0kxUFVuUkQxRGphWVpsUFRo?=
 =?utf-8?B?UExNUVM1SFZRcXlYejhrcEVqQ0pJVnE4U2lpRlBIMmhMSFNrVHYwa1lWaXpr?=
 =?utf-8?B?RUVnaWVEcHNFSjIrUk0xWVNXdkVqTUZseXE4cUNvRWI3enNGTWlYZnhFbldo?=
 =?utf-8?B?Wm5xWXlxYU1PYStIRmZZNG9haTR5bU02SDZMaDcvNjhlcmE0dFh5NUNjeXFh?=
 =?utf-8?B?UTFBRWdyTUxjWmRPaFhOWm00Z1ZVcXB2NnVBWi9zbFdST2h6YVVZeDB5dEJQ?=
 =?utf-8?B?Q1NuRjVOMTNHZWd6SFRhT085K2t3Zmd6blE2VmNPWCtpcXM1QXQyNmlyOWRH?=
 =?utf-8?B?TmF5MkVJZWsrYXB1bjAydjVlRnZURTBsckhiNjFDYng1WjNsRVlNejdqc0hQ?=
 =?utf-8?B?VVJXL0U0MlNQYXEweCtMMlExc1hUU09jMDlWUGg1bjRlLy93TEhMcko1SDNQ?=
 =?utf-8?B?cmg2S1RNdml0S2JkdENyNzR2MWhxNUQvWVVBbnBIeEd5QSt1OFF6S0F1VUly?=
 =?utf-8?B?dytJTHBxNVVCMEp5M0liQjJycTZEVGxSN2E1UURaNXdYVndkd1JYdmpPa2pP?=
 =?utf-8?B?Z3ZBN1hocUJBY2QzeFZtK0JQd214RjZhT0NzaW53ajBRRXlyRVNRYk9WTnJn?=
 =?utf-8?B?eUhCenNiRERMcGlQSXZ4OUovb2QrUG9mMEppUngwY3MzV3hnTXVPR1hMNlZZ?=
 =?utf-8?B?YXk3amFGSUlWYkFTS1NGYlVLcDNNb3YwS0xFUVJKT3JqN3NGcjNXdjZDMlFV?=
 =?utf-8?B?d0NkeUZRdUl1ckpKbCtDSGRkdlhGZ3lQZUxzOXpNZ29JZmNYbDE4QXhhVkIr?=
 =?utf-8?B?TTZuMFRDQ3BjZGZDenVNWFp0dW4vVE9XOVBwNU13aER6eUpWczNlSTlNc1Jv?=
 =?utf-8?B?bitab0RKSUo2MFhLT09iU3pqbEEyeTFUWlErczIydzZTMFpNUS81eklwRk5W?=
 =?utf-8?B?d24rejFGdTdZS25xdUhid3d2K3BGUzFuWnlWODlqOElMeDQ5Um4yUHBkN1or?=
 =?utf-8?B?WHlYZ2YrcWVmWXdiU2NHcnQ0YjFtaTJTRWJYZ2h3VXcybG04VFF4UDZsdEJ4?=
 =?utf-8?B?VCtSYUFydUdlT0R1c3Vzd0FQUFNlbXhrSkNMQ2daM3hCckFYbmhPMlRENm1w?=
 =?utf-8?B?VytLc1JIYmVBdWJyVVlselVSenJZeXNTZlpyeEdidWpxd2dETkdtRk1XQkF1?=
 =?utf-8?B?blBmSi94TUQweTdhWVBRTkpmbWZ2cnVuZ0NWQkZIWEt1YnVhV3FzVWYwOXFR?=
 =?utf-8?B?VFdTNTZBVGtzVnpPSUNCcEtIMUZvNnV3WDRaZGFiOHgrWlZTbnlJdkozRS9u?=
 =?utf-8?B?L0RwVjNKMG4zQllxZUlidnlzam9VK09obTBqb0l2SDI5Q08yc3VaMEhiSmZJ?=
 =?utf-8?B?TFZRNlpIV0wvdTZJb0xKMld4aElvd0xWelRaM2tWNWVrZzhDbENnVk5vcWxI?=
 =?utf-8?B?MEYvTUt3UjFnTGRVcXAvSmRMVWhuTkZCRHhWMG5jRGRSblRGTzVGTVdvcEEz?=
 =?utf-8?B?VlRCVkcrUDJKUE9FRUM1amZ6OWNQandzemNncmkzbDZzN0NvUVlqTFNua2Zz?=
 =?utf-8?B?VjdJY3ZyaTI1TzVhb0xGMFMwUHV4d20wL28ydmViZlNKbkJXdzg0TldlQ1Js?=
 =?utf-8?B?UjhZL0xibFJMUEg4RC85QzZFYnVTTWkxeG56QXllYkU1cWF6STZBNGpVam9E?=
 =?utf-8?B?UGRha3JkOVNVd1lCTm9pMldwVnRPd1FPTWhCdllmWmhualB3a00wbWdUdXlx?=
 =?utf-8?B?SVAxY21pWkQxQUJlL2Zsenl2REJkNVdQbE80c0dGQ0xyZ21qU3dLN2wwSG9P?=
 =?utf-8?Q?EKRAT5xGN3wUDI3C8V8Ochr4+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 123c718f-b3cc-4347-15a9-08dd8664773c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 14:53:41.4926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNDw6DSa2bxi+SRCdmQmigDvt9c+uABk6NpoybhgX/lRgnV2eg6VGJtHE9+/cx3o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9708
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

On 4/24/25 15:40, Alex Deucher wrote:
> On Wed, Apr 23, 2025 at 10:29 AM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> On 4/22/25 18:26, Deucher, Alexander wrote:
>>> [Public]
>>>
>>>> -----Original Message-----
>>>> From: Alex Deucher <alexdeucher@gmail.com>
>>>> Sent: Tuesday, April 22, 2025 9:46 AM
>>>> To: Koenig, Christian <Christian.Koenig@amd.com>
>>>> Cc: Denis Arefev <arefev@swemel.ru>; Deucher, Alexander
>>>> <Alexander.Deucher@amd.com>; David Airlie <airlied@gmail.com>; Simona Vetter
>>>> <simona@ffwll.ch>; Andrey Grodzovsky <andrey.grodzovsky@amd.com>;
>>>> Chunming Zhou <david1.zhou@amd.com>; amd-gfx@lists.freedesktop.org; dri-
>>>> devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; lvc-
>>>> project@linuxtesting.org; stable@vger.kernel.org
>>>> Subject: Re: [PATCH v2] drm/amdgpu: check a user-provided number of BOs in list
>>>>
>>>> Applied.  Thanks!
>>>
>>> This change beaks the following IGT tests:
>>>
>>> igt@amdgpu/amd_vcn@vcn-decoder-create-decode-destroy@vcn-decoder-create
>>> igt@amdgpu/amd_vcn@vcn-decoder-create-decode-destroy@vcn-decoder-decode
>>> igt@amdgpu/amd_vcn@vcn-decoder-create-decode-destroy@vcn-decoder-destroy
>>> igt@amdgpu/amd_jpeg_dec@amdgpu_cs_jpeg_decode
>>> igt@amdgpu/amd_cs_nop@cs-nops-with-nop-compute0@cs-nop-with-nop-compute0
>>> igt@amdgpu/amd_cs_nop@cs-nops-with-sync-compute0@cs-nop-with-sync-compute0
>>> igt@amdgpu/amd_cs_nop@cs-nops-with-fork-compute0@cs-nop-with-fork-compute0
>>> igt@amdgpu/amd_cs_nop@cs-nops-with-sync-fork-compute0@cs-nop-with-sync-fork-compute0
>>> igt@amdgpu/amd_basic@userptr-with-ip-dma@userptr
>>> igt@amdgpu/amd_basic@cs-compute-with-ip-compute@cs-compute
>>> igt@amdgpu/amd_basic@cs-sdma-with-ip-dma@cs-sdma
>>> igt@amdgpu/amd_basic@eviction-test-with-ip-dma@eviction_test
>>> igt@amdgpu/amd_cp_dma_misc@gtt_to_vram-amdgpu_hw_ip_compute0
>>> igt@amdgpu/amd_cp_dma_misc@vram_to_gtt-amdgpu_hw_ip_compute0
>>> igt@amdgpu/amd_cp_dma_misc@vram_to_vram-amdgpu_hw_ip_compute0
>>
>>
>> Could it be that we used BO list with zero entries for those?
> 
> Yes.  Dropping the 0 check fixed them.  E.g.,
> 
> +       if (in->bo_number > USHRT_MAX)
> +               return -EINVAL;


Feel free to keep my rb on that version as well.

Christian.

> 
> Alex
> 
>>
>> Christian.
>>
>>>
>>> Alex
>>>
>>>>
>>>> On Tue, Apr 22, 2025 at 5:13 AM Koenig, Christian <Christian.Koenig@amd.com>
>>>> wrote:
>>>>>
>>>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>>>
>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>>
>>>>> ________________________________________
>>>>> Von: Denis Arefev <arefev@swemel.ru>
>>>>> Gesendet: Freitag, 18. April 2025 10:31
>>>>> An: Deucher, Alexander
>>>>> Cc: Koenig, Christian; David Airlie; Simona Vetter; Andrey Grodzovsky;
>>>>> Chunming Zhou; amd-gfx@lists.freedesktop.org;
>>>>> dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org;
>>>>> lvc-project@linuxtesting.org; stable@vger.kernel.org
>>>>> Betreff: [PATCH v2] drm/amdgpu: check a user-provided number of BOs in
>>>>> list
>>>>>
>>>>> The user can set any value to the variable ‘bo_number’, via the ioctl
>>>>> command DRM_IOCTL_AMDGPU_BO_LIST. This will affect the arithmetic
>>>>> expression ‘in->bo_number * in->bo_info_size’, which is prone to
>>>>> overflow. Add a valid value check.
>>>>>
>>>>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>>>>
>>>>> Fixes: 964d0fbf6301 ("drm/amdgpu: Allow to create BO lists in CS ioctl
>>>>> v3")
>>>>> Cc: stable@vger.kernel.org
>>>>> Signed-off-by: Denis Arefev <arefev@swemel.ru>
>>>>> ---
>>>>> V1 -> V2:
>>>>> Set a reasonable limit 'USHRT_MAX' for 'bo_number' it as Christian
>>>>> König <christian.koenig@amd.com> suggested
>>>>>
>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 3 +++
>>>>>  1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
>>>>> index 702f6610d024..85f7ee1e085d 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
>>>>> @@ -189,6 +189,9 @@ int amdgpu_bo_create_list_entry_array(struct
>>>> drm_amdgpu_bo_list_in *in,
>>>>>         struct drm_amdgpu_bo_list_entry *info;
>>>>>         int r;
>>>>>
>>>>> +       if (!in->bo_number || in->bo_number > USHRT_MAX)
>>>>> +               return -EINVAL;
>>>>> +
>>>>>         info = kvmalloc_array(in->bo_number, info_size, GFP_KERNEL);
>>>>>         if (!info)
>>>>>                 return -ENOMEM;
>>>>> --
>>>>> 2.43.0
>>>>>
>>

