Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60695495B07
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 08:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE6110E935;
	Fri, 21 Jan 2022 07:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BD610E916;
 Fri, 21 Jan 2022 07:45:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHBeOo6p7m0C+4JMGG/XcV1ijWehs3hLBCwPTSuwkHFSVP/ZGsRjrzSLmUxH6tFylxZrcXDxbJ5nTECYzy68HhLyTenWpHl9BUwghRo2G2GcrTvp8PkXAKTxA1lGOEKa17oseu+FICb5Jy7yMdU8+7VnmRnFxRJcQpzmXZgGz4JkcnxxivJC5L/Yb4iJ6kmyKxKavrXuTfgHJjpOPkr4DflNQxthOizl4wVuivwr/2U10vdMhJbgx6lZKhYJZQAqJLdBP5ts3Ovgddp6R9XZODiEWh2WIYkDz6jj1aW+EYckmd4xMLfokViZUyei5G7xQSeZAmz0x1GBbhP1oN12pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUBtkZ2BcghzFyZ2PjNQeXYgfAPdDWVDgSO3Kyl2Scg=;
 b=eU9tx2gZkMBtN+n1c8Gm2CmMnHF8tH9VqB50o6mFk5XAY2UMsQMKUxZAIUpo/2WMGR7OFA5cH4g6jw8a/WWr8vLcQm+VUlfjFN6sCIpN9NoQgJXGkJsx7DOZAGu1+WOlcasqMD1A3JJ3oRqBp9z/fdEm9+8k6jYhe6+9QbTvxJfaTFxgcgsNEXi2yp3XM73cVyILbZlt267QQuBcWepl2PyVe9CEgTXMCqy2Eh46Mbgo/pQ26zlgjhU/J392/vBA7W9eAtCp4zSbJD+EyjetZUOjIZMNeaZ9PZi4Ndybm9RnYRfDCzxdkbkTCAksrcv5wfJwc/5Fkf+3VSFNwMGZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUBtkZ2BcghzFyZ2PjNQeXYgfAPdDWVDgSO3Kyl2Scg=;
 b=gUOLOrnurNOg/MXy+5h+OumMecrzGrFfhZg3JS2FxrFzd0jU67rAxzJJFfUNn1S7niqXyJNJ1E+/Gn7CP3hZTi7CEwOCb6bAk8nIo0RAJV3WZyjFTsU/etwxJKFj36OSQxEn5qxZ+w+ub5EsSwowpcHvCV0VzwsJd+ZJZZdLYTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1201.namprd12.prod.outlook.com (2603:10b6:404:20::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 07:45:12 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21%5]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 07:45:12 +0000
Subject: Re: [PATCH] drm/amd/amdgpu/amdgpu_cs: fix refcount leak of a
 dma_fence obj
To: Xin Xiong <xiongx18@fudan.edu.cn>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20220121052827.4384-1-xiongx18@fudan.edu.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <23d5251f-c910-aed3-5d9e-07d6e5e5add2@amd.com>
Date: Fri, 21 Jan 2022 08:45:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220121052827.4384-1-xiongx18@fudan.edu.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS8PR05CA0019.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0dd3f7ab-8835-461b-7aa6-08d9dcb1f4ef
X-MS-TrafficTypeDiagnostic: BN6PR12MB1201:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB120199D47557364B1B0D586A835B9@BN6PR12MB1201.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8YhGhWqwPmejYbYSrWO7Q8yI+MRGRId79SEj+PXCGsqJoyjeBQ+GFbo8DlCu6C9DZD28NQXWjQfnax1uRx9f6QM8MqnYDGuoGhdQmP3plUDqALVk0hxMDS2ksAqG0OEaist4DGRvUI+jDassTXw7+c5xlvDFMpVlbSmktwOX4dp7iJQ7H6kZJPyFjkxA13Ebw3M87aNSbEIBo5gjWOo+qF+p7lPC+rjiu+zRbEKojEwMPwsxtVgugTdDdisO47a3WMEPXd611NWrJsaoJUW22CeI26ob2EyhZWZxMJtTkdQIextXXX5jg95xA9sb5lR2M8WbfldFORqsGe1b9i01kAbGlLo6/sG0ij3HmsKudngvC1pWk+KQNnBSN9DKytHq5bzqmjWTN4qrCdK2rqOQY8HXBm7285cyjB/RqwhU+uISKLzrFzHApxiRGDavumEhayG0YiT+Iqir3spzqVepNLTzwh9QMhn/8TLzZ9oy7zZuLLunDfPqXVmNH9L1ceB63EiS6/sWY7oZO5vQ0qt6m8QPbVnyLTX7p9Nfa9Kxo+RSDFswRAoBwH5ELcVb1Im0Vi2GMet3Sm8EtMx7A07Lryq1A9TLOj6v14Hd2JOrqHXTkQgKAoP/ypDXxVLJIX40jHchG0O66mGpB+McUYTxlgKnghqzZpnCb9DBxs9/IRyTv1XHHxmnjNA1mj4zJofjKy2DJZ0NjGfiRnTQSNmrv+aV61CdHeuKOZbDRDc7nHbkdCuw7Vpoj0eCkxlJyBC0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(8936002)(110136005)(7416002)(6512007)(186003)(6666004)(4326008)(8676002)(6486002)(5660300002)(2906002)(921005)(66556008)(66476007)(36756003)(31696002)(2616005)(38100700002)(31686004)(6506007)(86362001)(508600001)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2FEZnFPUDVybTNZRDVIMTU3NTgxc2UzbWFrSjJqR2N4K3h2c0FyS1FseU1w?=
 =?utf-8?B?WS9teEhISyt3c09DUDFyL0ZSWjdiYXZuc1VHYmNUYjl5cWVPL1JsTi9leFlJ?=
 =?utf-8?B?TXU0Mk4xMTBhUmIvZ0lJUmJkYXVBZFc0ZVlndDhlKzQ3eHFOL1poQm05eUdW?=
 =?utf-8?B?dFdjWXlFV21LK3B5Y0NybkhNK0YyaGZseTVIanhQRmY0N3I5bkRXVEtIMUQr?=
 =?utf-8?B?Znl1bDZBVHhidGxNMC81RGo0M3pzd3B5V0w0MldlZE4yMStpUGErY0crbXUz?=
 =?utf-8?B?dG91UHExUDY2cFIyV1JGME5KQmVHSU5obXR2V3YyWDFkejBrNlNuNk1iUHFx?=
 =?utf-8?B?SjRGRExUWlVUMDIySUNmdENrYzRIY2taZDcyYWh4aXA0Q1BPREhnRGowaGF0?=
 =?utf-8?B?QnQ0Y1oybng5WHJ0MXo3WE4yRTlKQitOYlJ5azYvQ1J0dzNBL3VURy9IVzdJ?=
 =?utf-8?B?UmR2RnYxQ3MrRitNSFdEdVd5K28yWXUwVnVBOVM4Uis0SlVpUVFUcmlTZFVU?=
 =?utf-8?B?T1RVUzQ3T3d6djVqUWU4QXlGK0ZuWGNmOVIyT3RVMmlQemxJT0dHZGZjOEc4?=
 =?utf-8?B?bGpyM1M5ZzNrNjh1MHBucWM0YXhhbUp3Wko3dkNMQy9xeGFnY0pwbXV6Tmsz?=
 =?utf-8?B?R0Z2VWlWa1VHdUdETUFnajUyUTlHb09scDg2djlpcW1zcDRZS3hmbHpjRHVy?=
 =?utf-8?B?YlM0c1pKMDJmVVJ2RDB3U1lRYnFoM3FJOW55ZFlhOGl3OXJ1RE85bk9hN3N5?=
 =?utf-8?B?UGFmTnpCSG9HMlpqZ3J1eGdGc1cxTHFyVjdwRWhybHAvdzFLNGtRaVI0NG1v?=
 =?utf-8?B?QmtmMjRwMWh5dmgzakJhVXBrWGY2STh4emZpcVNMakNlNHVsZlBQZms2KzFs?=
 =?utf-8?B?UnJFOFcxa3MyWjh4cGxlSWpYWE1mZFlVME5lV1FMNWwra21ITW1zK25ISEc4?=
 =?utf-8?B?TURKYVpRKzhjTUJLMGxzNkpselAxSVJrakFRekhKdGJobmpmYmpzNGdYZUNG?=
 =?utf-8?B?RnpUSlArRHVjajIvR2Y5SFAraXA0UHIvN21PSFhBV1RVOGMwVmo5eGdRdU13?=
 =?utf-8?B?RUpBQk1CS09yd05sMzJuZC9kaU1uVStiL0QvQzdwdW5VVERiR2pvTnVXK3RG?=
 =?utf-8?B?aUFwUjhVeDlnaUZoUHVDTTRpVGM2dnJTV05LWjZsbS82eWJUUXUxVDIrb3Nm?=
 =?utf-8?B?ekN0SS9tL3d2Z2V6Nm9YUVhsSnJmVkNEMUw2dUtlbFJtUElBcXZlSVVjM3VY?=
 =?utf-8?B?d3IvaEY3WTAyTnhWRXAvaUFVVXcwSzBlME14M0ZkWEFtbDcxby9RdnMwelJF?=
 =?utf-8?B?bVg4QU95VkxLZ21UTzV2SHVrOFZIQzNsc0dQOS9WMjlITEVwbU1QVjJNcDhy?=
 =?utf-8?B?UmhEYlVsYm5UUkJOZHNsVkhYNHNTUkoxakhDYkIrWm8rWXJtRzhsMksyTGI3?=
 =?utf-8?B?RnpyYjA3MVlqWEI2VTFjYitXNi9rbXZjWHJzNlhpeDZDbGJNYW85NjdNRGNU?=
 =?utf-8?B?ektEdGdJSHl5ZHhLa3FxUHRCRzBhaGxkNkpVZkpnRlFOdzBxSE0zWFpaSk8x?=
 =?utf-8?B?S3RqODNQcGQ4THdDbzhxY2JuODRabzJzQ3lTai9oZVBDVmlkbGV3UGVnUzR2?=
 =?utf-8?B?WHhrNDFzUTFxU2lrckI4WUZYdWZjcmszcExiTkhLLzV4aTZtbVVNYldxRjk2?=
 =?utf-8?B?ZEVqNDVpNHMvTW9WNnh6ZmF6clZjRzdkRTVYTjhlYlU1YlN4dGxHYjZVQ3dn?=
 =?utf-8?B?WWl6MEpDK3NmY0pRNkM2N2hCZ3hINE9ua1YybHEvdHpnU1k1N05hNXR2TnVS?=
 =?utf-8?B?ekdoNjN4WHFCcXhWZnNXSFZKTm1pUldKWllFZXJ2WGVsNUk1T2lSTVYrRHJn?=
 =?utf-8?B?anpZMFBKanljdGxQK3kzZTljT0NmWTFxU0dnNWh2Vi9NVmtOVFd0VXIyYjBY?=
 =?utf-8?B?NlE5SExYR1ZyT3k5aXI2QS9Fd1BzSlN1dldNQlpXaUR6Y0p4VE8yODRtTVpD?=
 =?utf-8?B?bkUvNEluOVNvTTVEV2ErVVBDd2h4d0N5ampVbnpPNnc2ZlltTXFzQ2pOVkEy?=
 =?utf-8?B?dHNoT2w0QitodkpUa0luNmVTZWswNmRSSXhXc2pZNDNONDg4R2UxWXZnWXF6?=
 =?utf-8?B?NS9WdEZiTTJqY0o3TUp0cVI3NmNwYS8wWkxMTnV4TzI4UWxjcmVWVTR1c0Ni?=
 =?utf-8?Q?+O5kZsvxWVbIxh+6gqRTwRs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd3f7ab-8835-461b-7aa6-08d9dcb1f4ef
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 07:45:12.7230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4u5/H12HeZEwGqRLdbVBruYKfinZXtGyrEpRcMiybUXET7aSRVRoykhV5ZAwGYAY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1201
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.01.22 um 06:28 schrieb Xin Xiong:
> This issue takes place in an error path in
> amdgpu_cs_fence_to_handle_ioctl(). When `info->in.what` falls into
> default case, the function simply returns -EINVAL, forgetting to
> decrement the reference count of a dma_fence obj, which is bumped
> earlier by amdgpu_cs_get_fence(). This may result in reference count
> leaks.
>
> Fix it by decreasing the refcount of specific object before returning
> the error code.
>
> Signed-off-by: Xin Xiong <xiongx18@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>

Good catch. Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 0311d799a..894869789 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1510,6 +1510,7 @@ int amdgpu_cs_fence_to_handle_ioctl(struct drm_device *dev, void *data,
>   		return 0;
>   
>   	default:
> +		dma_fence_put(fence);
>   		return -EINVAL;
>   	}
>   }

