Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AF5A06C92
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 04:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071F510E093;
	Thu,  9 Jan 2025 03:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ohmBxtaK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C1410E093;
 Thu,  9 Jan 2025 03:57:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Npo5B0Q+ytLtF+f+MeMzHC7ciNN0YM1NzHSkO/ZZrm2Y2UKMkBzOG90xivg3M/XPAqE1BwSm3U9buin7YT0yAQnP6hIlo6JwUhqLc3BP80I8AEhf120RK71nEZ9Oo8wBBfSxU/giujsEEl5b8Bt05g+aXlubpnNG39Kx1XYRvqCTBHI6peBAz/IIa9C48uc7HXlqLoWENbEdF4mniG/WT1ZcXEKqPt7iCbRAwr3BH4qExlGRfW25HreeV3Aq+3+ZpoiGqlwIBM2rO4tefsf9Ac/TlH1V0o5DVt6DB1soRYZqZuliemjIdIGszJGchvRrI/5SZYNxVLXcd/sH0SLyTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlt2qHKNCc56uxoORas+WAcbeEO+wlNPEMQGDmOCgnk=;
 b=gW4itH3ug8bNxZIIhAUMBoCb32topEzuPZIar2DgQmm6N/CYztBC/gG0kSUDg0YbqJI9Sr6m7kFbPkjxTKm2CK1WSjtbf67Tx3taTD58NQ56TEaxa7/udyqHM6j/fThpm5Fbjke5+C23QhodXM0zGC48ueUpnq8k7QSAdgjr4cVziNkJEHNDC3rjccWENl4VUxcA79g704ru3RIIhh3vtJqK7x9/SjoNQur6FZHTYJMbR+2fJy2bV7gavuqQiRgh6cMjdJNaTvT1Wsen0uR41AWdRNkyHGbLI5g0N6/qHFjquwMY3+CpHyJw3oR/ZqAY4bR6NsAKIgCiEAN1G6lweA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlt2qHKNCc56uxoORas+WAcbeEO+wlNPEMQGDmOCgnk=;
 b=ohmBxtaKyMP2S1aIjD00UgJxO+nFUMhS7uOS0fzlBtJWbZxzGFuxDTC2GjKCyo0LFn4ARyoODLxCd6CkoKLywQ2LmKh5dVM0b4XOVF2BkXBtCufqRdoKeM+Yficmbsgq0HyhBRwf60W5zJKx+JhCT/jehDjTlGGue58RIWp1cscarQrfQOsrm7FaYYpkMscmfWfG7dceDmhDRXHOxIVN/0TJDw14JoDsg5BYJlI4Zxo3A42c0MfhnXluokVw3E1DCgHlklP4ZFv35eo2S9uP3PtnNuiF/QlzQgZC85kKMAEKWOL5NTWvTFlU4+jZq0S3gYNyxj034S2FmHQuQpzKew==
Received: from MW4PR04CA0057.namprd04.prod.outlook.com (2603:10b6:303:6a::32)
 by DS7PR12MB5792.namprd12.prod.outlook.com (2603:10b6:8:77::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 03:43:14 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:303:6a:cafe::ed) by MW4PR04CA0057.outlook.office365.com
 (2603:10b6:303:6a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Thu,
 9 Jan 2025 03:43:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Thu, 9 Jan 2025 03:43:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 Jan 2025
 19:43:04 -0800
Received: from [172.23.93.240] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 Jan 2025
 19:43:02 -0800
Message-ID: <64e2c9d9-17e7-4607-87e0-eb9c4005ee1c@nvidia.com>
Date: Thu, 9 Jan 2025 13:42:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/fence: handle cross device fences properly. (v3)
To: Dave Airlie <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>
CC: <nouveau@lists.freedesktop.org>
References: <20250109005553.623947-1-airlied@gmail.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20250109005553.623947-1-airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|DS7PR12MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: e71a1798-cd56-4f29-a4f3-08dd305fbed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWkzV0lMbG5RSk93QXltZWZWQlcweHUvaVN4VkpLUmNzTmo5SnkxSkp6NThn?=
 =?utf-8?B?aGIxUS9IRUFBY09HZ0h2azZubzQvbnBQUXdpTS9EWVdDTWJMSFRZcFFtQ0k5?=
 =?utf-8?B?K2xpU2t4TGg0TEc0WEk4RjArVlIvd3UxblJIaEp4MVJzb24xRy9YSXpWUTRJ?=
 =?utf-8?B?aDlDQmlLQjYrcUpXbnU5YkJQMzAxUUREQnU1anQ3U21FcGhlSFo2LzB1V29Z?=
 =?utf-8?B?cWI5WnRVc0JQMnlwSTBBdkhtVU1lcEdwNlFwUEFTcDlYcEo0N1pqaUkwSGFt?=
 =?utf-8?B?RFhCYTk2eFRuaDU4TkFnaUFiQUE0RnRmV0U3Z0V5WS81eSttZDRZcWh4NnFn?=
 =?utf-8?B?WDhoWUwvaU1GWUVoU0U0WVdTYS8yK1RNbmx6LzI3L0V0dmlqbnQ3L0lBVkVn?=
 =?utf-8?B?Y3NlMkZ6S2dJTFo4dUkwWXJNME9vQnpkRlJFcjEyR1JVT1g0SksvRFhrdzZq?=
 =?utf-8?B?U2J1SFRWVU5TMzIybEpMSmJiblBKM1lBSWFiRjFPRlhJdDY0anpLUGpuZnVm?=
 =?utf-8?B?RlA5cTJNQjZUZUY2QmQvS1ZHQ01OOW9aVGdmOVdYb1p4Qi94THptYTVwSjAz?=
 =?utf-8?B?eU1PczdLdUZ0SHlRd3hiSjFVNklaZGZOdk5MWnNyN1hKUmxHaG1UdHVHS01Q?=
 =?utf-8?B?MXZiKzBpdmJlWEFJdUJpdjZIQkpHT2owVkpxSWhPUGFHZ29MOXVLZEp4ZW03?=
 =?utf-8?B?VHZna1NId09wdzZBdVhuUHcrQXRFWm5vYURyNEkyN2MxbDNMNmlNeW5XQ0Zq?=
 =?utf-8?B?TzJ6d3lDV0NLWTJkZ0tPTUJhRElKK3NLU0tDR1ZvZDZPT1JMVFlaRFo0SjZT?=
 =?utf-8?B?bFAzN1p5eHpWUnBqZGdZTlFsS1FUVWJDU0NrbmNmVmZEdTlENER5SVpLTUpo?=
 =?utf-8?B?NGN1QVV0V2RnRWpRbWpFb2lzS2hNdk9Xb2tWQXA2RnBDUDZManh0SUJqVEZX?=
 =?utf-8?B?cFhnWWJnYzJyeTlvNjV0WmVLclVzc1RPTGFkRGd5d0QyTGFjWTdkd29iaDRT?=
 =?utf-8?B?dUpmd002QU1kZEg2cFBYcTlSbE9WRzRxNzJMYWFaZkwwK1pRbjk2TUQydDIv?=
 =?utf-8?B?WFQ3eVNHcE8xc3hWUmRoOHRYWldGak9DSHB2WWhjU2htZENrYXl3MEJ4dkhq?=
 =?utf-8?B?dGg3VU9jeStUUFdEdkdOMDNYSVdrUG5IM3ZEK1ViRzhtNEJuSnpVSDJXUlRS?=
 =?utf-8?B?dUhwRStHTTVBZlFaZFAxSVcrakN4d045eXphVytnakdybGh5THYwZ3FDSnFl?=
 =?utf-8?B?UVB3UmczUmcydWNQdUU1ZVM3QmYybGM2OE9MSVZZd3lVWWwybjlqZ3BDL2th?=
 =?utf-8?B?c2l0VjV5UXdtU2Z6Q05Kd3Y5RGZlYTNvUmh4eXE5VElJMmtPTFIxLzlSK2xa?=
 =?utf-8?B?QXZya245SzlWRlpERG44NlNoQ01jeUp1NSswYjVzMkNmNVFmTnlGdjQ4Ym1t?=
 =?utf-8?B?WjkrQmlBUVhIUTFnR1p1T3JkR25mZVRBWG5UZ1FoVUlSZW0wcEptRlo3Qzd1?=
 =?utf-8?B?Ulh5eDc2TTllM3FOSTM0bGVieE5PQ0FHVXVtb3VxZmlZbzJQUHVoSGRBanl4?=
 =?utf-8?B?V2lIbmFJSGJhVk16YmJVSmN6enBuWkJQcWl1ZDEwbUs5SDMxZ3FrNFNnQ0Ry?=
 =?utf-8?B?TkcvbWRDWE52TFEyUURHNmdHbXE1dmFwQkpFTHFrUVF4eldabEdWNFlmRm9I?=
 =?utf-8?B?RzNlQ2ZleXBsN0ErVHpqSWJJZW5rdVZZMFZkclRaeGo4Y0htVmpVL3FtcjZQ?=
 =?utf-8?B?NW5jdnNRRk44d05kZnlWUVQrN2N4dHh1b2RZU2luaTF4VjltcjRRTDUvVGl1?=
 =?utf-8?B?QjdlWDcvanlFVHFweTloUU83TzhDUDNjbEs3MkR5NlNsQ2R3U1RSM0FCWkNE?=
 =?utf-8?B?azN0a3N4ZDNMY2xxR2h5T25mdEJ2RHRvaUZNRFRsam1WTlpLSnB5eGV6NHRs?=
 =?utf-8?B?ck5QYXhudUF2ZFI0WGxyMEFYTFl4aHYxMStjZ0EwRTJlb1Rqa3JsN0V4QmVB?=
 =?utf-8?Q?t/QJrTrdAy+U8B+jv9MSruOO/fQ04U=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 03:43:13.8242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e71a1798-cd56-4f29-a4f3-08dd305fbed6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5792
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

On 9/1/25 10:55, Dave Airlie wrote:

> From: Dave Airlie <airlied@redhat.com>
>
> This is the 3rd iteration of this after talking to Ben and
> Danilo, I think this makes sense now.
>
> The fence sync logic doesn't handle a fence sync across devices
> as it tries to write to a channel offset from one device into
> the fence bo from a different device, which won't work so well.
>
> This patch fixes that to avoid using the sync path in the case
> where the fences come from different nouveau drm devices.
>
> This works fine on a single device as the fence bo is shared
> across the devices, and mapped into each channels vma space,
> the channel offsets are therefore okay to pass between sides,
> so one channel can sync on the seqnos from the other by using
> the offset into it's vma.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> Cc: stable@vger.kernel.org
> ---
>   drivers/gpu/drm/nouveau/nouveau_fence.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index ee5e9d40c166..a3eb1f447a29 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -367,11 +367,13 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
>   			if (f) {
>   				struct nouveau_channel *prev;
>   				bool must_wait = true;
> +				bool local;
>   
>   				rcu_read_lock();
>   				prev = rcu_dereference(f->channel);
> -				if (prev && (prev == chan ||
> -					     fctx->sync(f, prev, chan) == 0))
> +				local = prev && prev->drm == chan->drm;
> +				if (local && (prev == chan ||
> +					      fctx->sync(f, prev, chan) == 0))
>   					must_wait = false;
>   				rcu_read_unlock();
>   				if (!must_wait)
