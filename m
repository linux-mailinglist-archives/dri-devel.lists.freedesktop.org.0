Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E444B49821
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 20:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFB310E5A6;
	Mon,  8 Sep 2025 18:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZLPjW9l4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F73910E5A6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 18:19:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMImVgui98o6ThbgU+O1GhZ6uBUZsRIOB+PAR6mBbhcpsnyfxXfThjtDnqyZgyev0nW90Vo7rmaCFUh71s9sWhauNZT35TZA44Nj+eJOyefQbMPjsJY5QwLhsE+jZaJAnXi6uGpj644f/XH9KKXkVRGKf8qnYoKxqStOM7HFxLVUMcuQ1mt6VeE69aYaRCPNsJoq/hlNACse9DAeelX9wSA3Y7E9Qaft4ffnV+GQKWua8srQ+DYQBks7bycljCT49VQO3k0hLISTfRT+B2hfGz5+rGL68lrPdNF+7Nnk3RQPaFDy9ZWgRpW4i6H4jCAlXtz08tP7hdMBQG00YTlMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfSG7i+wSoREv0ObIn/EYAlQNJFfGQ9Pvh0rVNq7734=;
 b=XQXmO9sPzVQuFbkuefJ6ObB0Wh7RkOkWWjmteFVeCiC+8WfWLUypItLCxKIds7ZC5B/4mucwZl15zWz0OxIotxl/01vs3yt8YVE6e7nQa7RlxGWxZFbIPYsoGeVzuE3Yy/s5EhSh2oVzIkmp8DHMZFSUfb7cT3qD+gAIshzF74Pks0KGNWrffEm1l2UT8WX9LdL+ZvdobrcwBhDmRmSU5YS9fRKyZ78s+j+svCM7QpOVYizpCZhPAA+N9ECNVqydM35MrTro9s0KK2DU9kJTzygBG2P4vggQL+T8fNU/HaV5KaIzBtefZCd3Dx81UeGFZAhRmo6JNyXXKbUaZCaUkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfSG7i+wSoREv0ObIn/EYAlQNJFfGQ9Pvh0rVNq7734=;
 b=ZLPjW9l4V5iK+pt8DZe0a+HGt3qMs04/AUZtYTNOL92uABphKyWcjH0MIjWtXVYefQK2SjSyzA7gHu9KuQXVOLTn65cDtkvzATWPoSHoiBvo5lthGE6vAW1IMtdouMdkGSr1fxCzoPPKLDOAYddItAl6Jy1TmLFlaYLY8vhKalI=
Received: from SJ0PR05CA0018.namprd05.prod.outlook.com (2603:10b6:a03:33b::23)
 by LV8PR12MB9205.namprd12.prod.outlook.com (2603:10b6:408:191::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 18:19:35 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::fc) by SJ0PR05CA0018.outlook.office365.com
 (2603:10b6:a03:33b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13 via Frontend Transport; Mon,
 8 Sep 2025 18:19:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 18:19:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 8 Sep
 2025 11:19:34 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Sep
 2025 13:19:34 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Sep 2025 11:19:33 -0700
Message-ID: <3a4cf9a7-d2ec-2c4d-fb9b-5beac251e86f@amd.com>
Date: Mon, 8 Sep 2025 11:19:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [bug report] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <dri-devel@lists.freedesktop.org>
References: <aL56ZCLyl3tLQM1e@stanley.mountain>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <aL56ZCLyl3tLQM1e@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|LV8PR12MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: b96b9091-8597-48e5-8d5c-08ddef04437b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjJzV3B3TGdzRWp5TlhDTnBJZ29jSGtyQmpZdGxWNVBQMjF5LzNLa1UrWHVy?=
 =?utf-8?B?ZENMK1pjOEdFdGcwUzl1R2dLaE9mdDF3dy9iOURYbnY0SjhUZ0R6cW94UE9H?=
 =?utf-8?B?QkFZeVJLVDdjaVV6VUQ1RnUxSThOZnJUc1ZIQVlCUHovRjlkQzQ0b09JS3V6?=
 =?utf-8?B?cVZ5OVNQTjRwUlBOYlJ3bURCWmQ5K1o3SmNWS0lQUmdOZkcvNUE5Q2xXNnFY?=
 =?utf-8?B?MGxSQVhlb29YRkJDV1FjMS9yaVlVT1k1dFF1SHgxVXFmcUhHMmsrSnV5SVlT?=
 =?utf-8?B?ckFsVnZHVjNXSytsQW9MemhXQmFraThUd1FmSWZmVkpBSDlrajhrOWVhTk5V?=
 =?utf-8?B?UFNTdHM4bDRPTldXYkpjWWU1WC91bEJCTlJjaklsRHlpcTRqeWpMb3dFb2li?=
 =?utf-8?B?MUNKT0lsT2tHV2hZaUFQYXFBQW5vaStGNzJkdWxQT09FZ2xiT1ZzOUduUTBp?=
 =?utf-8?B?bjhhamxEc1c2Q0RpcW8zRWY2SCs2a2R6REsvdHIvZUVJbUMrMEFQRXhFOVo4?=
 =?utf-8?B?WjJYOG5SVWtqNzJacFo1cHl3QUtsRmhKWGtXd1lxTGNTWnN6dk5FZU9HSVBI?=
 =?utf-8?B?ZjBhbGhPR05hbXlqTTRUSHVKa1M4OTliUFcrMGVBM1dRUXQrVWk1VXdWdDlG?=
 =?utf-8?B?Q1ZLM1RVZ3pqMkhaZkVYL1ZkMkJ2dDBvKzhUMlJ6aW4rYXFvakpPcmJteklu?=
 =?utf-8?B?elAzQVdFUW82YWJYMFpOSVNIYmNBUXpTeVBLamtkZ0ZHcHpUYUdtS0p0QjFk?=
 =?utf-8?B?alBCTXpFM2lqcm0wZ3prdmZBdDVoUDk4K01SbEVSSllPNllwQ3BuR3dCYlFE?=
 =?utf-8?B?WFVwNVBqUTVsSHdUMlRuWUFSZVpmOS9BelhKYysvdEZDdXMvb21raUlReDJT?=
 =?utf-8?B?M2pVbG9wVVF6bm9GNmoyaUZyMEt0Mkw3aEhQeXphN0pPU3NmQU4yRUhFcWp2?=
 =?utf-8?B?TTJPRG5VWWJCTWtyeDY0ZktEaXp4RWRpTXNzbTlBOVpIcm9GbjdYL2dKdk5Z?=
 =?utf-8?B?VWZOdVlNV2tLSTl5MmowUFY5anZ0Sm5hRDk0NlduTEVnYStNTlRrQmNMZWov?=
 =?utf-8?B?eVdDME42MWt4TG5Nb2ZSeVdjMnBFa0VLWjhHenIwVkdVbUtpT1loZnRNZEpC?=
 =?utf-8?B?ZVEvd0NOdnJPeGlOKzI0OG9OcysxYnlpTDJmZGllMXFhSFl6ZVJobkdidEZ0?=
 =?utf-8?B?MzNteVROMExMQmRiSC84MTBtbGtscURLWWNSYkYrVzk3cVVsOFBIcDhiYUxy?=
 =?utf-8?B?TFBoYklXRXYzMXpuRS9ueGViN1hJT2RVNzJIaDhpc1JzdnlHUWphWDVUZzJO?=
 =?utf-8?B?cE5ENmI3NjdWS1lzQ1U1dXZ3a0dacEVZL1RMTkNQbjdza1l5NW4ybkgvOXhM?=
 =?utf-8?B?Szd1Z0J3U1ZBWk9EWFJNcGxtMllnOXNmZEFXN3BscjFTWDhQQUU4OUp3R0Fm?=
 =?utf-8?B?a2VBSmRFZTljRlpxYzRxSm5DSFdITWpSbFAxeCtyRGcxUFpTc3FzK3Nobytx?=
 =?utf-8?B?NVp2c01ieEpDcTJ0YkNJd2dRdFNrdGxKZzVibTRDS2F4RXpRb0p3c1lYM2o2?=
 =?utf-8?B?WXNZQ21MMDAwakJwbjQwb09rcXRUa2NTeUgzL0RmbGxvNWg1T1dGN1g5bjBD?=
 =?utf-8?B?MjIwZTVwZjZ6a29UQlBQRVRzelNkNERHa0hNRndhWTI2MlhIOENwSXlwRENW?=
 =?utf-8?B?UW9uT1l3S2JoWnZ2elEyNnVtNGhiZ3NJWDNaa3lJZ2tlY0tYS3R4ZGRWcm5N?=
 =?utf-8?B?RjBqK3B3M0xKSTYxbFpsNGdoUGRVZTdJN2ZaVzhzUkZrUExMTk1vSjRtU0l1?=
 =?utf-8?B?RGVkalR1cVRFN3pWTFc5ZzlTT2NMaXAxTHMzMm9pV2VPVHlDQnd2QkR0TUxZ?=
 =?utf-8?B?anlwNFJndzRQV0JCRkZyT1NBRi9helNVRDE3aGlHYVcyMXJGVllkOHprNVZz?=
 =?utf-8?B?RlNOU29yRnRxK2pwK2p0dURNN1hUNUMrMy9ZVlZaRHZUZkhSZzYvVGFSQksy?=
 =?utf-8?B?aFVTUTBoQzRHMDVrU1c3TTFxb25RMUJDb2hZa201djNoVFI3cTlaeWt1dGx0?=
 =?utf-8?Q?qSPWqs?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 18:19:34.6903 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b96b9091-8597-48e5-8d5c-08ddef04437b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9205
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


On 9/7/25 23:40, Dan Carpenter wrote:
> Hello Lizhi Hou,
>
> Commit 2f509fe6a42c ("accel/amdxdna: Add ioctl
> DRM_IOCTL_AMDXDNA_GET_ARRAY") from Sep 2, 2025 (linux-next), leads to
> the following (UNPUBLISHED) Smatch static checker warning:
>
> 	drivers/accel/amdxdna/aie2_pci.c:904 aie2_query_ctx_status_array()
> 	warn: potential user controlled sizeof overflow
> 	'args->num_element * args->element_size' '1-u32max(user) * 1-u32max(user)'
>
> drivers/accel/amdxdna/aie2_pci.c
>      891 static int aie2_query_ctx_status_array(struct amdxdna_client *client,
>      892                                        struct amdxdna_drm_get_array *args)
>      893 {
>      894         struct amdxdna_drm_get_array array_args;
>      895         struct amdxdna_dev *xdna = client->xdna;
>      896         struct amdxdna_client *tmp_client;
>      897         int ret;
>      898
>      899         drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>      900
>      901         array_args.element_size = min(args->element_size,
>      902                                       sizeof(struct amdxdna_drm_hwctx_entry));
>
> Instead of min() here we should just return -EINVAL if they are !=.

The request element_size from runtime tools can be smaller or bigger 
than sizeof(struct amdxdna_drm_hwctx_entry).

If element_size is smaller, element_size bytes will be copied to user space.

If it is bigger, sizeof(struct amdxdna_drm_hwctx_entry) bytes will be 
copied.

And the actual element size and number of element will be returned to 
userspace.

>
>
>      903         array_args.buffer = args->buffer;
> --> 904         array_args.num_element = args->num_element * args->element_size /
>                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> These are both u32 values controlled by the user so this is an integer
> overflow bug.  Security bug.

This will not cause an issue. array_args.num_element is considered as 
user control as well.

If it is too big, the actual number of active hwctx will be returned.

It is better to put a reasonable limitation. I would add a check 
(args->num_element < 1K && args->element_size < 4K). Will this fix the 
smatch warning?


Thanks,

Lizhi

>
>      905                                 array_args.element_size;
>      906         list_for_each_entry(tmp_client, &xdna->client_list, node) {
>      907                 ret = amdxdna_hwctx_walk(tmp_client, &array_args,
>      908                                          aie2_hwctx_status_cb);
>      909                 if (ret)
>      910                         break;
>      911         }
>      912
>      913         args->element_size = array_args.element_size;
>      914         args->num_element = (u32)((array_args.buffer - args->buffer) /
>      915                                   args->element_size);
>      916
>      917         return ret;
>      918 }
>
> regards,
> dan carpenter
