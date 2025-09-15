Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FE5B57BC8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761FA10E486;
	Mon, 15 Sep 2025 12:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ISt8k41q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013021.outbound.protection.outlook.com
 [40.107.201.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E3110E48E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:48:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8GBtVfoUagF2Njzxd3SzxgEei8IISyHjo/H1zzh9xBNXyPNJZslRYyf52lNgWeOTG6Gk5bZA0sCtaj5yoznSLqQ+mauKLtUnLjmrYMY52BuKwdZZiSN/3i9oJJ+lh77v/klUR06yEp1jAQspkS7yhSwWlIAR3ILTdkh4wOVIII8DggEBbAYp90D0vju7MHffBzH2nwbjwvd02AP4o93zfFRqS7D0vYoY1Aphy9y1YxjxV4u85BHp7y6WkWHuNUDafeZ2wrsVYDL++XIEivsA/uT1jglAryiLfIkVERphgrr9cmyHcsO3Dw2oNiWLESJkOtqOexlSkB07ZmvNij/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3ZkCpHKpz6igsQRK0+ZsF5g3Ig7zCztIDt2hCYn9YA=;
 b=JnYYlI6qAmSl0vViouB/igjbzo4OMDfQsMV7iHnRohaU1B3twz+7OvBVt3mKSa0/3m6SdxF1USWaZRmYg7+cOO6zAGYU8roMxq7VRmr9pooMWbuNiPk2BWSTHOYzEXHnbU5LhsxxNapDP/w06/XxiJZQtkng9WjCNRM8VG7Jutkio5vT+JFJuc8vNeoT3LAICvJXT22wFfa6p+6ELkjcJ2CX6HRQ/2paDf84/58sQAKhuRjF12FZmU7O+/LtDpNxt/pxQAdaTpn3wXr7DdRpa1YGQbyQrU/8KzvlsvsfMRxLq2X1qkopLCkUOWyDctXKBNvqhZITttcWulrlh7lWHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3ZkCpHKpz6igsQRK0+ZsF5g3Ig7zCztIDt2hCYn9YA=;
 b=ISt8k41q2jxe5GCGB1BHZXPdJTQaPPhaak60+VmVfcrZ75rYUbgNra/djo4d3brKAwPbWfMWLnhEqcw0vn1u57xj5h2whdcj2KCw5Wwkm0lW8Xk4D8mNJHGGUUxjfiTv0JDmAq/F3vpFUMnA+dMGpAv7JOtfBqJV34sFUwmsrRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9195.namprd12.prod.outlook.com (2603:10b6:610:1a3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 12:48:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 12:48:45 +0000
Message-ID: <01e2369e-1df2-446d-9f9d-59c86cc55a04@amd.com>
Date: Mon, 15 Sep 2025 14:48:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] cgroup/dmem, drm/ttm: Improve protection in contended
 cases
To: Natalie Vock <natalie.vock@gmx.de>, Maarten Lankhorst <dev@lankhorst.se>, 
 Maxime Ripard <mripard@kernel.org>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250915-dmemcg-aggressive-protect-v1-0-2f3353bfcdac@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250915-dmemcg-aggressive-protect-v1-0-2f3353bfcdac@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9195:EE_
X-MS-Office365-Filtering-Correlation-Id: e16e9fa7-ebe5-4716-99e4-08ddf4563548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0w0Y05yMThLdzdpVzNxY0hMZnBFdXRaSm1yOGMwNk40U0pTdE5zenJKQXl6?=
 =?utf-8?B?MFozUUtsUnNmdEcyK285SzJmNm5TM1NEc1dNc3RJdjJyc3F6Yko1dmgwV1dC?=
 =?utf-8?B?ZkNaUmhubWYyVTNzYUVWMXpEamhCZkltcWZLZWhSMzg3Z3VBdHNNUERiZ1R3?=
 =?utf-8?B?UGNnYjRHU2lmUUZSVlFWcDJBVEY0YjgwQzJBTTJIcWM0Ti9zQ3J5cVZkY084?=
 =?utf-8?B?WVZjejcvT0J3QVJVZ2tvL1V1eGcvc2V6a1RlNnBkWlRQdjVXdFhiaUMzWE0r?=
 =?utf-8?B?UlZGZE1hdi95MUNGTHMyZGFXZzA0WUlxeUJaK0o3SGplRGNrdXN3UllIMGJp?=
 =?utf-8?B?YWFueWhYTzZyOTN6by9IdThLKzlGSkdOdVR6aVJicW1UVmRqZ0wzUkFyVStV?=
 =?utf-8?B?TEpmN0NyZE9pZGo1ZFpwWG5BYTNwdzNHRnN5akxiTVFWM001QWg0M092WmFR?=
 =?utf-8?B?Zm82M0pJcWxMdDZDb3FHSFZuWUd1Q2ZwbzNSK05sck0vdFduaFdGc0dqQ2x4?=
 =?utf-8?B?a0MwU2NQV04vaHpmWGlzeFVERGFHS1NsODNiakFFSmNxUXFOTkNadytlZ0JP?=
 =?utf-8?B?eG9qNTlSdm5qc0FiM2YwbllzYWhDMnlNOEgxWUR2OVI4R3dyWkdJM0Fob29r?=
 =?utf-8?B?a2NtK3d6Z3plbUllSDU2K3hDM1J2ODM4WEJCamlSRkQ5R25UamRvS0JKR3Bj?=
 =?utf-8?B?WXNWVjcvbVhMSm9yb0J3eHpYRDNSeXpmZHJyTk4wQ2xqeVlHeFpGOXNyWWlr?=
 =?utf-8?B?ZHViWlZpcGwvNmZCZW1aYXlrZWFxdWlGNlZJcmdsRDFHL2JZdjJoSXYwN0Jz?=
 =?utf-8?B?cGhvWEVod2NGTlFoZVd1bE14WGlWMnQ1ZklML25ZYUdiTGd5d3dKN0o1cXpt?=
 =?utf-8?B?YkYrY2hsZGFQb0NnSjFvUVdMM3FwWlozRlVzTUM1ZTYzc2lES0dTbVg3T1Mw?=
 =?utf-8?B?eEJIOTd4NGZyaU11emU2R09mTENWTHllclcwWkovQVUwUnpwaXFHczFkQjh3?=
 =?utf-8?B?NnZpL25BQzJOeGUvRC9Od3p0U09uV3UzVklxS3FaWlM5cWVleFgrR0xRUDFs?=
 =?utf-8?B?TG53QWVpL29IQUMvM0E4NlQ1bHZLR2FMS1ZpRExNeW8xaW9SSVRCSmppaFZq?=
 =?utf-8?B?QWpIRFFIWUJRdmprVXlZUlpRVTJwWVMvTlhTb2FtMDR4VDhHSTAyMll5Wmo3?=
 =?utf-8?B?aCtJVlpzQ0hqT2w4cjJGMUs1dUdOWEs1N0J3YlFXWEx5NGVONyt0K0VzbkYy?=
 =?utf-8?B?alptcXVGck5VTVlESE1wZXROOExNV2hNc2tMSmNqeXQxWWNhTDRvRm9pbzRJ?=
 =?utf-8?B?aWxGUHk4QlNFcXNBenNyTlVLNmNxQ2cvM3R6OFlpVjJJL2tDaWwzWDVDSmlE?=
 =?utf-8?B?L2s2VGFiUlFJSmE2eGZwczB6Q2pIOFB2end6eGlraXJ2OEhDb01EQ09MZnR3?=
 =?utf-8?B?dmZqdUhWNjNCVkRFYjhmdVlVZ0I0bWVxOHlRVGRsOVpKSVNtWWVTL0tkOFJ6?=
 =?utf-8?B?eUk5Y0dOaGs3dTl4SEtmcUdpMzVZUlA1YTlUSmRsblNvNlhHMnhubVloV2tl?=
 =?utf-8?B?L1FDcTV2NG8rOWNsUUFXRlRmZzVlSTROT0tvcGkzQkJJYXhCU2hRQURwdWFB?=
 =?utf-8?B?WlhJdnQrS1NRVStHNDdSRjd6Nk54MEh6cUNiMnpwek1hbHUyang3R2dMeFBK?=
 =?utf-8?B?K04ydlVFSXNBdE1BaUtBK3pFUDRUVHFMaFdGcjlQa2VpSEdyc1h5NFlPSlZH?=
 =?utf-8?B?WktQUkJTRm15WERvNjhENFIvbjRyblJYbEp3MjlDMDFmR0N2QmV6dW9CNk9q?=
 =?utf-8?B?THpmUldhMWFwQ2hUV041eFlkOTFzdkpjYVcycTFraGxoTG13YTVpV3Nhc1BH?=
 =?utf-8?B?K2pnWWdKS0dwdHpuZm8rV1hOcnBtMjRKUUJQb1JEN1FmcW1mTW9sdDNsZk1v?=
 =?utf-8?B?Q0ZuQ3I1VlUwNUdkc2VlNkU0QXVZeWFSbXZ4aGF6SDhnNmd6YzdZRGlDWjUx?=
 =?utf-8?B?LzFWbDRLWXdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkZwd0c5bW1idGxLRWpwdVlEaXdPVExreEdLdXNqYUxvMGgzdG82aVAvaUVR?=
 =?utf-8?B?aCtXanJCU2xJRkpXYU8vUGZhazVhWXVablo1R1FJeW5kaDdOeW5LRUdyUDRw?=
 =?utf-8?B?Z1NrSDFieWxWTk9ubXlEK2liM2pEUU1GM3hnZUUzelZISi93b3hGU3RJN1Fm?=
 =?utf-8?B?TFZLU3U0VE1hRElEanpPN1ByWkFKSW1qbTlXaVJrMzQrT1A3dllyRlhWSGI1?=
 =?utf-8?B?M0FjVVNLRTRmbUxNU1FEYWp4RTVnbmRxV1lLZUtqNWtORXB3Tm9QNktDenhn?=
 =?utf-8?B?dEJ2YUc0dGRzZEhwbnNseGtaMTdhYTExdEJrOHgvVVo4YWZLbHd2NEVLaC9k?=
 =?utf-8?B?QlBqdU56REhGTTRwS29YTmdEdkNtTVdTUWNGNHFTdnFDUXBQWWJrSHF2emxu?=
 =?utf-8?B?K0NGVUFoRjVIT3ZVK2NIanJaMEI3amlKR3JkYTh4dGdOaWd6L3NxZ0NKUGFG?=
 =?utf-8?B?UWRMSkRSUkxkdGtDdTFhODgxVllpejA0cmphaFl0V1VhbHdqejJVRFZlVC9j?=
 =?utf-8?B?djZXMlBuYmFneHR1SFA1MDZPaXlYUHdvSDhIS1ZuUUp5ODl3aHBUY1pQaC9J?=
 =?utf-8?B?UUZ3cmRuMHdjTGxxaTJ1S1NzcFphdkozWW1wcE9wb2hmTVBNL2N1d2s5WnBI?=
 =?utf-8?B?UVQyTDZCSWF4dU90ZEFKZ2VPbHh5Q2s3MUQvdjNxTmExMGtRbnk5bmpXTmkr?=
 =?utf-8?B?Yk1EN3hGbUJEMmRSWFNhcjBwUFZuWjIyWUd6TlRrQ2NRTXduT25DVTc0OWZQ?=
 =?utf-8?B?ZXVKZ2tpUFF5emVnbU1yZEFTVi9rZGtQeEx2WEdaTVlRV3ZWRHo3SDZJd2JD?=
 =?utf-8?B?Q1k1UjE0M3o0aktocEdRbWxXWDB0bStyWmlrYkFSTXpQY1RBRDdWMUZyMUdP?=
 =?utf-8?B?N0orb2dOSXF0VC9qMUtQWjMya0xWbEw1WVJKMTVYMFVvR1g5UGZ2a3RZWk1r?=
 =?utf-8?B?WTVSYzJVOWJKd0NYL2hpaUxjOGVNeFZDYlRTL2Z3SmxRYno0NVE5UG8xWU5R?=
 =?utf-8?B?Q2FlckJ6NVh2LzJidWhjMzVzUVJuR2VNUHZNNHFab3lMRHZsMVFhSXNjRWoz?=
 =?utf-8?B?OEgxMWZTcDVlaDhqa3FiR0hpTnk4V0g3REFsNmtFUDlvdDU4bFVoZERMM0lK?=
 =?utf-8?B?aHo4WjBNNXlNSVo5aFNlL2s4YmxWNEYxMDViZ090UHRJcjVvUi9rUndLZCtQ?=
 =?utf-8?B?MlA5MnFnVWV6NTVQTlNCbFhnb2dzS3JLSE1mQUdHcm4vUEtvSVU0dkhvUjFE?=
 =?utf-8?B?N0IwdUgrekszaElMd3JnUTBuMUJkMkRoZUh5NHJKemZkVldYYWVDZFlJL2VM?=
 =?utf-8?B?RXVLRWs1Ynl3ejVEZ20rUnhmdU9QeUI5ZWlGUDV5Y2FmV0QrMDZUNFJlYjRr?=
 =?utf-8?B?cm5zNHpDTjJJMWgwNXY5Q1JjV2RjY0NXY3k0RUcveGVNYW1QbFo2azl1VjVh?=
 =?utf-8?B?NFFIRm9iKzRlYTJZU0hvWXBIVU5ldlBUaE1hYW5hZFEzTFl6bERDTy8vSUlQ?=
 =?utf-8?B?WWNLR0pUSHNsZFRVemxwdnBQVFFaUklJTkNWWnZXVWx5V256YWttQnQxUys0?=
 =?utf-8?B?TmZxcFVBN0V5OHR0UnVjb3hKZktUSkdjdUFsN3JCWHJRRVRER21sQ01TMmRr?=
 =?utf-8?B?MVRuTDhVbXNLSjBLQkxLSGVBek9qSndvOXM3ZEFpaUZ5WEplUGxzdWRUTktr?=
 =?utf-8?B?clBxSEs1Q3FVbjNmVXN5UzVueFBUcjFBbEZLcmRpWU90RmZXUk9TWEQrKzUw?=
 =?utf-8?B?dDJIMHg2UWxzQ1VrNTFXQS9ydlhaWDlnSUtxcFdveTZWSjR5MWlDVjBVMjRo?=
 =?utf-8?B?Wm5JeDVlZll4YVdlUG9jSHJGR3RhbnlBOCs1bEN5TlFlZWJPTEZkMFZLZFFl?=
 =?utf-8?B?YWJwd0NKcnR2bGZWL3dmbTVwZ21WNURzMXJHTmdIYlJWSzVMUFBCMWRyd0RN?=
 =?utf-8?B?RUdLWEI3eWFibHlVTGhRYWk1U3RGdGQzM2dtS1lwNm5RQndkdXRCaDVUTms2?=
 =?utf-8?B?cU9WbmF2a1YxRUtBZmdMU3lNRDQ5NXRNbzRwa3BEWXNjdlJ6N3RTdTlITHhp?=
 =?utf-8?B?RElZU1cxTjNFUkFVc0M4L05FV2tzMndXN1R2RVZaT1djL1RRTjB4dTBRZFpY?=
 =?utf-8?Q?oEwaGV7iKBGxztjF2D/9DlhPK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e16e9fa7-ebe5-4716-99e4-08ddf4563548
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 12:48:45.6338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUb1/RrDKeYY29AqNaf9Nf1i+vH1yDlE5E9p2hjHGTGlLftUCOuLcmvAIMCPFikw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9195
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

On 15.09.25 14:36, Natalie Vock wrote:
> Hi all,
> 
> I've been looking into some cases where dmem protection fails to prevent
> allocations from ending up in GTT when VRAM gets scarce and apps start
> competing hard.
> 
> In short, this is because other (unprotected) applications end up
> filling VRAM before protected applications do. This causes TTM to back
> off and try allocating in GTT before anything else, and that is where
> the allocation is placed in the end. The existing eviction protection
> cannot prevent this, because no attempt at evicting is ever made
> (although you could consider the backing-off as an immediate eviction to
> GTT).

Well depending on what you gave as GEM flags from userspace that is expected behavior.

For applications using RADV we usually give GTT|VRAM as placement which basically tells the kernel that it shouldn't evict at all and immediately fallback to GTT.

Regards,
Christian.

> 
> This series tries to alleviate this by adding a special case when the
> allocation is protected by cgroups: Instead of backing off immediately,
> TTM will try evicting unprotected buffers from the domain to make space
> for the protected one. This ensures that applications can actually use
> all the memory protection awarded to them by the system, without being
> prone to ping-ponging (only protected allocations can evict unprotected
> ones, never the other way around).
> 
> The first two patches just add a few small utilities needed to implement
> this to the dmem controller. The second two patches are the TTM
> implementation:
> 
> "drm/ttm: Be more aggressive..." decouples cgroup charging from resource
> allocation to allow us to hold on to the charge even if allocation fails
> on first try, and adds a path to call ttm_bo_evict_alloc when the
> charged allocation falls within min/low protection limits.
> 
> "drm/ttm: Use common ancestor..." is a more general improvement in
> correctly implementing cgroup protection semantics. With recursive
> protection rules, unused memory protection afforded to a parent node is
> transferred to children recursively, which helps protect entire
> subtrees from stealing each others' memory without needing to protect
> each cgroup individually. This doesn't apply when considering direct
> siblings inside the same subtree, so in order to not break
> prioritization between these siblings, we need to consider the
> relationship of evictor and evictee when calculating protection.
> In practice, this fixes cases where a protected cgroup cannot steal
> memory from unprotected siblings (which, in turn, leads to eviction
> failures and new allocations being placed in GTT).
> 
> Thanks,
> Natalie
> 
> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
> ---
> Natalie Vock (4):
>       cgroup/dmem: Add queries for protection values
>       cgroup/dmem: Add dmem_cgroup_common_ancestor helper
>       drm/ttm: Be more aggressive when allocating below protection limit
>       drm/ttm: Use common ancestor of evictor and evictee as limit pool
> 
>  drivers/gpu/drm/ttm/ttm_bo.c       | 79 ++++++++++++++++++++++++++++++++------
>  drivers/gpu/drm/ttm/ttm_resource.c | 48 ++++++++++++++++-------
>  include/drm/ttm/ttm_resource.h     |  6 ++-
>  include/linux/cgroup_dmem.h        | 25 ++++++++++++
>  kernel/cgroup/dmem.c               | 73 +++++++++++++++++++++++++++++++++++
>  5 files changed, 205 insertions(+), 26 deletions(-)
> ---
> base-commit: f3e82936857b3bd77b824ecd2fa7839dd99ec0c6
> change-id: 20250915-dmemcg-aggressive-protect-5cf37f717cdb
> 
> Best regards,

