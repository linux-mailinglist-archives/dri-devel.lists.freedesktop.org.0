Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28499BBDD59
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 13:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDC610E313;
	Mon,  6 Oct 2025 11:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pFQCWmkb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012055.outbound.protection.outlook.com
 [40.93.195.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B38310E313
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 11:10:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQvKwTjwe2CZ1kfiVf5NK3VH3IVmaHnaMdBqerBPqu9hGp3VhzVFCOX/byKUnWNBZlBN1Ds3NvJi1mXjNSORR3ohQk+Fi1TgiDGmDyeX3Ue26SFOX4feYkboGsjJja+bEDCBzC4iqDMOqD5Oq3tbplAGDw7ZkPECS/hGdl+d+jBltj6sEv51bwErQxClItL+QNhsHpRFIOY8ciscybCfU2OmQz4/rpuUcMlZicZd4cmZS01ZJW/0gFiiBrWAPFhm1m9CWVo7Vjl82Hd1sfsPES5YYsLWYQSMYsqsSnn6tTyWAWCu43gdvKAKPnCRm8l5cwVxpdPHw9hhpFqefB1vdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faw1pyE2/hPfb6qbl0ZUMM6n3sxU0WZRLSInBPtNROA=;
 b=m5KbBbpZaZ9o1zNbNgQV2Jj2Ncncd/Nl9Buw1xDusK0JML4SH0Uliyhs9heBIJGhVgbEyDJ1iY+rOcUxafujhkG0Qsz47XTpNAM4UmeAROZAqDSiBHXKzmwvVvh3UT2Pebdiu3F4kOjlp0wcRBpMZnXm7z9GCpfPjjeZyBf0nlO67gRdc/TXvEib263sqWm5P1mR9tt9p/S35t8O/XoL6YNSANvDzvXNQWb19khUie/3S0v/3SbS/gsLgL95faLs4mrEM4HgbwhtsZr/xb17ylpOZzkCeohaC7Q5j7Qn/fe36qG4K2gxJMpnVKFsSFMzHBIxV+BymItKFh7FSaY91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=collabora.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faw1pyE2/hPfb6qbl0ZUMM6n3sxU0WZRLSInBPtNROA=;
 b=pFQCWmkb/zgT/OCvmlCFzaU80VT5nQFj1f29FNy3Uea3afx4rlleF8yTa3/o1Y3MiQLsJAagtB/HsPc7eRUR4yikOhX/sS4px2Ga+F+lMMHhLZfA7WhWE9kMb2C5HhC25Tv7HLNqve3kPpRpwHNBSgA1i5F/jC3M4L1ETvwAbOSz53zl1mpcMBaZD+1zt9TKjHwPi5zi9rZgaBR/Nu8XHR2VGuS1YwGJM+TrS9UKrv9TDBffYzH2HfUwkvVjKpYtQowm8zffYloQF+To2NDByb7zr1D3mVQAMYacEuEsYxQwITt1yHuOKfr/zv0uKA1Fl1XwdcgY7pVDGWqAwDwjsQ==
Received: from BY5PR03CA0025.namprd03.prod.outlook.com (2603:10b6:a03:1e0::35)
 by IA0PR12MB8376.namprd12.prod.outlook.com (2603:10b6:208:40b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 11:10:00 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::b7) by BY5PR03CA0025.outlook.office365.com
 (2603:10b6:a03:1e0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 11:09:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 11:09:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 6 Oct
 2025 04:09:47 -0700
Received: from [10.221.129.102] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Oct
 2025 04:09:46 -0700
Message-ID: <47d1cebf-710b-4799-ae2c-f586b52177c3@nvidia.com>
Date: Mon, 6 Oct 2025 13:08:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, <dongwon.kim@intel.com>, 
 <dri-devel@lists.freedesktop.org>
References: <20251003053402.732218-1-dongwon.kim@intel.com>
 <20251003053402.732218-3-dongwon.kim@intel.com>
 <e1310d88-af63-4beb-9a82-6f04b00b6f3e@collabora.com>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <e1310d88-af63-4beb-9a82-6f04b00b6f3e@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|IA0PR12MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: c474015e-ba61-4833-9901-08de04c8e402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWs0dGg2emVPREhMc2x4ZDVTNVdIemtQN21nc2JqdTJWRWV6Y0ZnWkpldERJ?=
 =?utf-8?B?RUh4S2kvL2RnWEJIdWVRdHNMcnA1WjJ3WURRbEFhTUpjRTBrUHZEQ3hLZElx?=
 =?utf-8?B?QVFkV21xbTRsVm5qOGEzUlI2eVV1NDFqTGdqUXhMQnl5MkxLTVNOZlgwSFJC?=
 =?utf-8?B?cWxhVlJjTjkzNEpaZVhqRVBBY09VWG5CTGxxdFRyckJPUnBpK213bDdrV2Jm?=
 =?utf-8?B?VTU0SDk1MGxTVzNGelF2eTIyYzhBZWcycjNqNGFyZlUrUEJHaE5udEZkNUJG?=
 =?utf-8?B?OVdKS0VQcjJpTlRMZGc3cUVWa2d1WUZpOWs2cFg5YnRTdDZ5TGxpZWsyZUZs?=
 =?utf-8?B?SlY5NXgzV2lCeUpXNFlKalNqSmFzQkZSYVJtaWp0Y1FYa040M082cXhNa3VV?=
 =?utf-8?B?TVVySUpKZ0ZhOXdSMmpLSS95Vjk2a3hXUXc3VWRvNWxoc2J0eDZjTFMxc0E2?=
 =?utf-8?B?Q2J0L2JuVWJWdm5ONUNHREszUVEvRkppdkplWHpqSG45a0NoN3o0ZTdxN2w4?=
 =?utf-8?B?MWlReFR3ZEFyVmVtVGNtNTBvMmp3R3Q5dmFBT2piTDZoSEp1dStYTzQwZWtu?=
 =?utf-8?B?VDF4OUR4U21Rc1oxOUdOUjNkTUgrTTRQMHdtcXdXbndyWVZtTkZlVTVnY2ZV?=
 =?utf-8?B?TzVSNmRKcmZCRjV4K2QyNXk5NDdxTElaKzhHVFdDYkFkcHBDQUM4d0xtZyt5?=
 =?utf-8?B?QzdQa3ovODJaSmNFdEVuVXhrYUF5WTBOZ29FZEtYbzQ4dm9wckRpeS9mUFBs?=
 =?utf-8?B?ZU01dSsxL2ZGL2tzZXZvbnVWZytBZkhEZERJNDNZVGNjOFpTeW5kZ3ZBamlF?=
 =?utf-8?B?UWVHQnp3bk0wY01LYlpWRlA1OU9ScU5hd1Y2VWhreGZnMnMrUWdPNm5XSVlF?=
 =?utf-8?B?TWhNbEJ1SVl6ZFF3ZlQweVdTcXkrTm9sVHBDZUtRVGRDV3dCRFdvUGlsdjdL?=
 =?utf-8?B?Zk1sK0gwYzc3dmJSbXBWYldGQjZQcGJLbWVsTEJ6Lzl0Tjl5NkMrU2pFdnpi?=
 =?utf-8?B?b1pTWThjQ0trdE5HeFlEOUhQNjJmUWNZWGR1SlJ1SjNrOWJZbUNZRlhYYmMz?=
 =?utf-8?B?YmVsQjJLdXJFNWdyWm0yTE9yQWxyYmRHQUZ4NzFtbUdBVU15RUcwc3hoZUZN?=
 =?utf-8?B?a0JhWXRHZTEycVRuYktkeWlVc1lzWnBoWmIzeTNSUUVBMUZoZnh5aUhBR1hi?=
 =?utf-8?B?aUtOWks4R0gyZ1R5S0I1MnBZaXFwWDJNNWFBbHBQcUdPTVU2alF4dWlZZURs?=
 =?utf-8?B?dFIyMnJYdnZlUmEzV25jRkJ6U0RPbjdaTHhNeHBESHdBcjJ4K1VqdzQzaGtv?=
 =?utf-8?B?OEtUSGIrY3NQaUp5NEh0VUdPdTg4dFV1WlhhaWxaSnY0WFQ3eHY0bGN2N1Ri?=
 =?utf-8?B?TVdkcEdlTlZ1UC90cHhtQXJSNy9CYVlXYUg5MDJGYnVQdGtLZVZMK05ycWls?=
 =?utf-8?B?bzFjMWU4NU40TnFjMlIzS2ZHZXN2NHZISFlWc2liMldtZUZCL3hWLzcwZlVT?=
 =?utf-8?B?NWdndlUxYXhLMXBzL1Z5VFZkcko1OWkrNXpHZCtFK2xCZ2hzQXByN1p6b3Fk?=
 =?utf-8?B?bzRVcFlJWUxiQUdXRWxYNmY4OEZmK0Rqb0hlZ3k0Uk16Rnl2ZGNLK1lDSU5j?=
 =?utf-8?B?WEFIMndwZ0d5aUUrSjNINHhPaS93WXdBQkVpOGJ4dFpTUnRhRHZSd0JmdktU?=
 =?utf-8?B?dlNERk15SjNGTytwQ3d2U3NIc08yNFBkdEVQVmg3SHN3dlBFdGhmRE5mUWJx?=
 =?utf-8?B?blFSYXh4dEZTN2ZDM2ZOWEJWUXhtYU03T1FEY3VzNkZUSVZTVlZmb3dMUTBV?=
 =?utf-8?B?NlFEdUYyLzQvVjhnbHZPTnZRc1ZFVXBoUFd4dXkxdmUxbkl0RS9vLzlrRU9m?=
 =?utf-8?B?ejFTQ2tya2VXVzhTNkZWM1BtTTVXellkRlNrcFBFOW1Td0RsMVIwNTlFM29o?=
 =?utf-8?B?Z0NjdDFwVjBhZUtYWlZXVjVVeklsclpja3N5T1l3ZElvSVdWUWQ5VGV1M1FZ?=
 =?utf-8?B?SW1ndml0K3N4V2c3VHQva0pydk5acU9LaXJsTnl1RGphTFhVRkdQUHNxVEtm?=
 =?utf-8?B?Z1hNRGlaTzZNRFRseDdsMFFzd1A5b0pra25Cb1ZMRlhGdUdxMkdaNUZNakRL?=
 =?utf-8?Q?iry8=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 11:09:59.8109 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c474015e-ba61-4833-9901-08de04c8e402
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8376
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


On 03.10.25 16:54, Dmitry Osipenko wrote:
> On 10/3/25 08:34, dongwon.kim@intel.com wrote:
>> +	/* for restoration of objects after hibernation */
>> +	struct virtio_gpu_object_params params;
>> +	struct list_head list;
> These are bit too generic names for struct members that are supposed to
> be used for hibernation-restore only.
>
> what about this variant:
>
> struct virtio_gpu_object {
> 	...
>
> 	struct virtio_gpu_object_params params;
> 	struct list_head restore_node;
> };
>
>> +static void virtio_gpu_object_del_restore_list(struct virtio_gpu_device *vgdev,
>> +					       struct virtio_gpu_object *bo)
>> +{
>> +	struct virtio_gpu_object *curr, *tmp;
>> +
>> +	list_for_each_entry_safe(curr, tmp, &vgdev->obj_restore_list, list) {
>> +		if (bo == curr) {
>> +			spin_lock(&vgdev->obj_restore_lock);
>> +			list_del(&curr->list);
>> +			spin_unlock(&vgdev->obj_restore_lock);
>> +			break;
>> +		}
>> +	}
> 1. The whole list_for_each_entry_safe() needs to be protected with a
> lock. But you don't need this iteration at all. Instead of using
> cleanup_object(), unconditionally remove object from list in
> virtio_gpu_free_object(), since we care only about shmem objects.
>
> 2. Use mutex instead of spinlock, we don't want problems with mem
> reclaim situations
>
> static void virtio_gpu_free_object(struct drm_gem_object *obj)
> {
> +	mutex_lock(&vgdev->obj_restore_lock);
> +	list_del(&bo->restore_node);
> +	mutex_unlock(&vgdev->obj_restore_lock);
>
> 	if (bo->created) {
> 		virtio_gpu_cmd_unref_resource(vgdev, bo);
> 		virtio_gpu_notify(vgdev);
> 		/* completion handler calls virtio_gpu_cleanup_object() */
> 		return;
> 	}
> 	virtio_gpu_cleanup_object(bo);
> }
>
+1 I have exactly same comments regarding the locks here.
