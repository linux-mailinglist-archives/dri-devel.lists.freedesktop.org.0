Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDC295F8C1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 20:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF18610E27D;
	Mon, 26 Aug 2024 18:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fY6vZiDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A5310E271;
 Mon, 26 Aug 2024 18:07:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rh1l/Lr5Vt/bit6btSm3ttPgaQr7RN0d7J8yZqNzrrXByZoviX7PEikBtQeQKtABRT4h5LmddTphz6N+So5qALeQ1NNZoxiStpRihvYcMHOQ1kiqu8yhN+h/R4vRcNmtcSrFeZf2lYVj+IVcteoe6hCVcGzRDyjKbjKLxfi0uvOan3npSWm0w9g5ttEX41hZ7Yk9FE/yN1mlJOTxSB4tg4qMRfABg37wEF+Wpa2XIoqvSIsMcL+X4cOBDtbj710j6HYCKzFgfhXqa8eB89XCtKkOMxLkdStC769FKAAkmZLYB4DhPKdtTHgZDiIzjZj1cjb6fq4LiK0Zx7D7vMk5gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/FN28BU8D3H9dUZu4TBtpMAmMm3JpsMFYcQxamGq7Q=;
 b=Wc2aP+9pAW2OfvL9I9KJQLTyWj6AfB8Mc2LDwpbLGXCqhi8IzbV6/Ki8rHjQXVBy3Jf+XJYXUimqRfJe2Bi3QAE6V2EcHXAd6QaH98RhDhvTGUDpB32H4G6LXGLJ4fAysYIwQItxlxgTUtVbCirdR9r9bX2CrE3Bed0jD4yg8yH+lMwF1PfYDhLfdLSiJfOeq/OLqe7SSvJeG+esltnOz3v580ZZs5sxhFUm2lIPMUD4zIUjuI7N3fDsrRo2ToB25PSIPTGvxjrY0yumnpZpRHMJjCKjhRU4bwQKIcitGK/kC8kzKUNqfUTOofrF0DBY/9shiXrHfmvKaU7BB5O91Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/FN28BU8D3H9dUZu4TBtpMAmMm3JpsMFYcQxamGq7Q=;
 b=fY6vZiDcOlS5ltX96mPlqTwAAm8jRdOvo/JnWPJdJIJWnBoRJja8bsw23cf+viLVyzyu6OU+Piz/0Is2WnDHViPkvJqan3MUNLaxq2kEXeFzbF3fa4/dAqVtSgiyFRHMZIrzaHTX+cJBGGZoZPkHATmdKJsppDG86eUKW5H4UC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8271.namprd12.prod.outlook.com (2603:10b6:8:fb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.24; Mon, 26 Aug 2024 18:07:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 18:07:50 +0000
Message-ID: <b313a6f7-a857-4ec9-bc98-0480cd64bc20@amd.com>
Date: Mon, 26 Aug 2024 20:07:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] drm: Use full allocated minor range for DRM
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simon Ser <contact@emersion.fr>, Matthew Wilcox <willy@infradead.org>,
 Oded Gabbay <ogabbay@kernel.org>, James Zhu <James.Zhu@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20240823163048.2676257-1-michal.winiarski@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240823163048.2676257-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0385.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 24073cca-7dd2-400c-60d8-08dcc5f9ff3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1VZMmV3RWNtWnkzc0I3T29SZXBycWM5RlJVaGZwcmpjR0FqaHlET050enhW?=
 =?utf-8?B?aVRuUkNSK2lRRVZhK2g0QkNneUZjdXpxREdHSHR3dXpUbitDWmk3TUtYekJR?=
 =?utf-8?B?dHdWL1FZLzAxV242WGphWERNVis4ZmhKR05iamducW0zZDJSMDViODlhTmoy?=
 =?utf-8?B?VmNtelpXUEVUTkJLa1g3UGFiZmpCeG9ubzVncmEzOVUwY3N6SHRmY1EvaVU1?=
 =?utf-8?B?R2E3amZ3akpMdCt2VUYrdklFQXBQTjhuOFdlditIK0RRY09zWlpyN2p5eGxI?=
 =?utf-8?B?RFM5WUplaFBGeGM2bUNwQ3dlaWFKTG5aWU1UY0dRK3hCV0VOQ0ZaYk9NS1VR?=
 =?utf-8?B?U2s3REFnSy9rSy9HdW1CYTFBYjdzU2J6QjJYSzE1d1ZFOVpOM3plSnRxWUtB?=
 =?utf-8?B?Z091ZkRXdjFBbjREamMrc3kraWxwNENuQStrWXpmRDhLNXJnb0ttL0dtNzNE?=
 =?utf-8?B?L1o3YisvWmx4OVljM2U4RElYYW5oMEM0UVFJSzZRSUhnK0VtZ21qSjJ3NElD?=
 =?utf-8?B?NzVNQjhEYlpuSVFneEdlcFRCckVjeVlTWmkxYjBTWkh2bFFaWGp6eENlRVlS?=
 =?utf-8?B?OFFBT0VsWm5iK2JTb056Witsanp6TEFJaWo1QmtWUFl0YXpHd0Y5aHJEbHJU?=
 =?utf-8?B?OVFFOGlXOUNMaEpIakVGTUd0OEpjcC9HY2cwVXNpd1l0MzNOMVBaVEsvNk9j?=
 =?utf-8?B?WTFSYmFBR0ZsZWJyNUdXOS9EUGFNaEdxNjlQSGV0RERLU1p1ZUJBaUFlOGw4?=
 =?utf-8?B?VDgxOHN3WnRNd1ZTMVZiL0wzd0lISjZzeFRLYlh1a01La1lpb3JLTEVJZ2NP?=
 =?utf-8?B?aFdLN0UrenJEUGZNZWQrd0RhTEtEL29mc1BhQ2FRbGZaL1Z1aXA1eHRDd3VM?=
 =?utf-8?B?WG5wS0sybldzeTl6eGpRdG12Nis2RDhmdXdFTjN0bC9maFg4KzE3aWlBb2pj?=
 =?utf-8?B?YkVHTE5nclBpdVFVTnowNG93akFmemZPWEt4MmpuazlkbkNNUXp5TWN3NlIx?=
 =?utf-8?B?R2VYQ05kclR5SFlCY0NTbVhObGw4TWZQdDA3RzNhRHBwdlhRQkM5cmJPaUJT?=
 =?utf-8?B?SFFrUnhQRHM1dFIxTEdmL1h1ZDRIZ1dqNHQxdTdCRVVGOWtLbzZXTmhWT3VE?=
 =?utf-8?B?MU5lTlRDYVBJUm8rU0NkYWNrWVZOVXE2MW1YT1lRMHR0b2l5aUovQldrK3Z2?=
 =?utf-8?B?VkVaaXF5Y0luUzhXRkhzOVRMQXYrYnVic3JNVnhwOFhPV25LbXNBdmpCZFlK?=
 =?utf-8?B?dVIyVTNvcW85ZTBqK1dLOWJDVWl2c0ZUVnJIdkZZZTE5MjlzdVhxcnVueisv?=
 =?utf-8?B?eXoycEErTjFDWk9QUitDMVJaMHUzNEV0QmJrZnZ6YW4rU01lZTdFQ1d0V1Bn?=
 =?utf-8?B?a3ZEZENmWjVVZDlGdCtsa1JieHNYRjZsL1BpVlpoTlJaVm9XMWVKZHYrMmpt?=
 =?utf-8?B?bTJLdVdXYjJ4UWRQVFB3a1RoaFc1eWt4VVhuVXptSmZjcjZwTzhlV0NpNVlt?=
 =?utf-8?B?bmNoVWlRVGNnZ00rYjVDU21XditJU3gwWjFKWHVIQjVtZFBZU3JzNndDWVRV?=
 =?utf-8?B?REw0VllRUGJNZXZaTldUdUhKOWduTEYrM3BSaktSZHBwdTE4a2dMMTFYVlJM?=
 =?utf-8?B?aGNJWFU0UXFOaFI4ZE5ZSHRVejNsYUg5aWNLcmRVTEY5S1h3ZzIzTy80bjZQ?=
 =?utf-8?B?Tkxpb0lqVGlER25PbG02TnlBREF2NUxTU3YyMU9WOTN1L3FPbDNweDJKRWNq?=
 =?utf-8?Q?TAURDPcJjMnr5ej8Dg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHo3Wit3R3FjMStWNmRwTTVGV05mSUtYTGxKa1M0d0ZnYm5pNXJMeWxvK2pq?=
 =?utf-8?B?dlBsVjdpVlgyVmt5ejdBT0Nhb3MrNUpRVGdBb3dZUjcxdzllUEFpa0FucmVQ?=
 =?utf-8?B?aWFndzdGYzA2eWJIcjJucWxmb2hSdnZMSjV2bU8veUg0Wi94Tm1iTHF1UC82?=
 =?utf-8?B?U1loOTlhRVRzRWdweXo5TmI2NHo5SWRrQ1ZpaFVkZGVJMWZ2WnB4R1Z0MkpR?=
 =?utf-8?B?MGZheXJWTUZOWUJ5OFBsU0xGdk40M1N4aGtHUzZHbVlkNXlOak1udEU1OVN3?=
 =?utf-8?B?QzhDb0lrQzUvQUhBTUJ1UytqV1d1cXlLWm1wWmN5R3h0bi9uMXVadEhDbmNy?=
 =?utf-8?B?MGtheDlNMjQrOTljckRJWE1oZU84dVFyalJaQ3grSGNNVGNCdkZuVVE1aHR2?=
 =?utf-8?B?bXlpY2F4NlpjcEpybU9YaytFQzgvUnRob1gwNmYxNExJbWVjbkVQbW5RSTV3?=
 =?utf-8?B?TkdnN0F2K283SU1nNkZjakRlbzY4WDc3VHBTOCtjT3A0TzNyRVhZSnQyaURD?=
 =?utf-8?B?TUFIZWs0elpyUFN0V2gveGV1UzhoRUtwOGxwZXZsN1pYWk5UdGJHVGlaamxD?=
 =?utf-8?B?T09yN2svM29zTXRNcGpvZ3B5cllKVWZ5MGdBbUZYU0lVMTFHQXJwd2NpcEtp?=
 =?utf-8?B?MXJxUzRtWDd5NUdjMURIK1JSZVk4cVExYzZQRDBrN1dhNXVlMHV4b0dMbW9S?=
 =?utf-8?B?c3N1SlBVN3dtYVJYU3FXNmtVTHM5RnpoaGV0LzJVbE15RkRrWTh5bnVEV05K?=
 =?utf-8?B?OW5GWlVaUXFlK2JlVGZEYWJLK3ZxQmtHeXZaN1ZWbnZjOUxibVZ1dlpGekRQ?=
 =?utf-8?B?dXoxdFpzSlZjcXUzalZOYWdnTVpYUENUUks5a01ZVEo5di8rSlduT255LzZS?=
 =?utf-8?B?aDcra3hrVGlERG9ET0NrRlhINEFjOEZSeU9GSzRKUTQ2L1loTkJ2czE4dmVD?=
 =?utf-8?B?N1ZsUlRMYURhUUl2YUFOSDdKcVBLcXJkUGI0TDZKM0VLdWlwRXByaEY3RmJP?=
 =?utf-8?B?YVJrN0p6b1o2emYzNVk5VUpBZmFhNk9aVktqeWJtNGExQ3N1M0JlTmtrU1Bt?=
 =?utf-8?B?cHZXTERYb3NWNzM2bDFvVUFuS2NrUnNkSnBIanpmNDc0NUsvU3BuZGNkV2tH?=
 =?utf-8?B?dGtjQnVTUDVrQVJTVHZuR2ErYUVobFlqRVFmckpBcHVMT3ZpN09RK3NXSEFy?=
 =?utf-8?B?Rys2dXQzUkowNUVtTXJ3OHYxcDRLYk8yME9qVzA3ZTFGRWFLQmhZZWk1d3E4?=
 =?utf-8?B?QTNEdStpTDdLMlRWSjYrd2lyMEZreCtxNno3b29sK1BSYWh5dzkvbkJXVEVJ?=
 =?utf-8?B?b1lTdjBWNDcwSFB3RlRWTDlPQUw5aHh6bTZWRFA1NnRqRW8wakxrY1lLSDdB?=
 =?utf-8?B?V28zcWpwalpldDlrUmhESXpQVld0NDJLaFp0dmt0MFltNHJtTjRnbmdDZDNl?=
 =?utf-8?B?bDFkUjlUcnd4aWNURDRRc285VEdQVjVUWDdBL0NtUjV4WTE3SE8xYjlGYTV1?=
 =?utf-8?B?SllqUHZOcWxUSzFZQjJzeFJ1MVdVa2lKeGl5TUI2ZW1IL2Nla0Y4cWlMcW0z?=
 =?utf-8?B?aUlwYW16QzRMOGdzMWQvMUVlcEVMZ0pmbUR4MVhWRmR2R0tlZnhHbUdFemdO?=
 =?utf-8?B?aUlkSFE0b2Uxcjlqcnc5MkhqMndvZUZ3Z3liWTdIV0M5SVFUUzdZdk5ERXNB?=
 =?utf-8?B?WVFwejc2OWJYR3JrUXlpMjBOdi9Pc1liTGdNZWFkWUtPWEpGRkUxSGRRRDRY?=
 =?utf-8?B?YUIraTQ0cjhESy8veUJmR2p4ZEhFS2NBZ1RZOTNkWlBGdG1CVk1keTFmQVF2?=
 =?utf-8?B?aFBGeElJZHM3eFo2ai8xTmxwSUFOUi9UMHYzVGdUeEtSbUdiTzMrcU11cFVX?=
 =?utf-8?B?RHRmVnlFMHVxMjJYZC9jSTJwa1dFSWFGdHA5OUQyLzFxOW0va1Fva2dsVVVJ?=
 =?utf-8?B?cDljWmtWanBsNm53MHZvMVlzeXNzK3Ruci9XRjZ2ZEd5WVFHYXNLT2pCajlD?=
 =?utf-8?B?RUhOdTNZL1hKTjNtNjh6K1V5OTNmN2hONHBKWUhnNnowSkpudE4rQy9ZeC9w?=
 =?utf-8?B?RFZEb3dIcWFuQTNXSGFoUUdKNWREc0U4L2pnSUNudEhQTEZmNDcySmdiTXlX?=
 =?utf-8?Q?JMo0td0x4IYG//A0swCsI+Kqz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24073cca-7dd2-400c-60d8-08dcc5f9ff3f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 18:07:50.1373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhOw5oJIjiK5l/oAMTI9W3mVMV8jO5NOATY4hZIYNtMQvYoyv4mlZUkOM8hEnl/i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8271
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

Am 23.08.24 um 18:30 schrieb Michał Winiarski:
> 64 DRM device nodes is not enough for everyone.
> Upgrade it to ~512K (which definitely is more than enough).
>
> Additionally, convert minors to use XArray instead of IDR to simplify
> the locking.
>
> Corresponding libdrm changes were merged in:
> https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/305

Added my Acked-by and pushed the result to drm-misc-next.

Regards,
Christian.

>
> v1 -> v2:
> Don't touch DRM_MINOR_CONTROL and its range (Simon Ser)
>
> v2 -> v3:
> Don't use legacy scheme for >=192 minor range (Dave Airlie)
> Add modparam for testing (Dave Airlie)
> Add lockdep annotation for IDR (Daniel Vetter)
>
> v3 -> v4:
> Convert from IDR to XArray (Matthew Wilcox)
>
> v4 -> v5:
> Fixup IDR to XArray conversion (Matthew Wilcox)
>
> v5 -> v6:
> Also convert Accel to XArray
> Rename skip_legacy_minors to force_extended_minors
>
> v6 -> v7:
> Drop the force_extended_minors patch intended for debug
> Rebase on latest drm-tip
> Update the cover letter, pointing out libdrm changes
>
> Michał Winiarski (3):
>    drm: Use XArray instead of IDR for minors
>    accel: Use XArray instead of IDR for minors
>    drm: Expand max DRM device number to full MINORBITS
>
>   drivers/accel/drm_accel.c      | 110 +++------------------------------
>   drivers/gpu/drm/drm_drv.c      |  97 ++++++++++++++---------------
>   drivers/gpu/drm/drm_file.c     |   2 +-
>   drivers/gpu/drm/drm_internal.h |   4 --
>   include/drm/drm_accel.h        |  18 +-----
>   include/drm/drm_file.h         |   5 ++
>   6 files changed, 62 insertions(+), 174 deletions(-)
>

