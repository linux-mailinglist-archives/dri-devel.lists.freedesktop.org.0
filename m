Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E84C364025A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 09:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D920510E04E;
	Fri,  2 Dec 2022 08:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D39110E07C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 08:39:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKv+YCPH4pz/NuxfFEhjYZcFtqHhaFEHZRX5osd/Qsv4ZbXcKSuc6aqO9nxWcP3h5AiLT0S6MlCadDKxMyvstOx8CCkSiP0ao2/5KrX9zIgxdoFWOMQxAwVfugHnEeVoNQLDsAUiEmLDm19G3pWrKAl2kO2GW3qO12V6WsL+h8PUGLrIwJk+xX1lW1bhi2VVWVoVli0h7lbVMe2VueyHt5x14txgT3Kn4c8H3Gn39qTnY3V2Wi9gqMQOnrATiR6HjPofAB/kZIPJOmVQxypF7COGZ3hR8gRoy1DJBiFbaAhrxwOOJq47MePE8Fg1+YwNCopdIv/HAalRqI8NQbbKAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMB9SoMkbXkH0yCv746M0gLlDKEvs2MBLYCsvF2faOE=;
 b=Sy+EJTgNJCdzgJeM094FO9cjjpDSGRnV5QACKO5qb3at/wGXl4TWyEoTHTA51R279muJVvP1RGMzn/KNcvI4oQoqdqRpXFkZbXsnqrCtJEs3azhmmvUE/E5ruY5mm9AUOAEyk1FdLaMBIea9MD7pGSp23L5odM3Z0UmGda4uHDj4qdkepXqL/ItkfoCh4KckkUScbxp0dnNJgYDn5J1+IxHCOPShhvIZi7ZIWsHBycOOeneGdjWafpvbvMllw8IlrfhTCj+I/Fn3f2t6Vg1Il6YaMTHCaQIHkcKNdw53PqYCCOFpkRQxDnbdUn4tDMkBifHc6e1LcMr65BxXUne7Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMB9SoMkbXkH0yCv746M0gLlDKEvs2MBLYCsvF2faOE=;
 b=K3pHGeeq4Ku5rpsnteOuZAErxMEt4Bwpop80QQE8zaCIjwaQm/BIOF3VqKcAl7DmxsI8kjw+BCKzZVWbxbSqk/9XlEpTKWFQKLyv0K1AOEtaXvNZ8AiB2Ory7dCC+19LM2uTnORuvnmH4lX2NQKFywpUHEGpGfW3REGLGizIFmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB7560.namprd12.prod.outlook.com (2603:10b6:8:133::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 08:39:07 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 08:39:07 +0000
Message-ID: <8520b017-0d34-c358-cb8c-c5d052d3290b@amd.com>
Date: Fri, 2 Dec 2022 09:38:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC 1/3] drm: Replace DRM_DEBUG with drm_dbg_core in file and
 ioctl handling
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20221130133407.2689864-1-tvrtko.ursulin@linux.intel.com>
 <20221130133407.2689864-2-tvrtko.ursulin@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221130133407.2689864-2-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: a54e13f2-6805-48e1-3bf1-08dad440acc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q5PkndolBchlnMrO8oa5yudcdgakoWvvKOC2AFEcQAZqQy33Y6y4XKlxFbexUlzSrRtCMIDMd7NQY+irYPqfafU3+vYJsDUNA56YvGWmZRordIYmmgJfxy4lFIRMKZtOVbG9MRM8pekwvDGf8+SDT6MxDAh9bTmtBbCmIe2ETeyxesVcXNHR2D/9o3ym2EPMTOVk06wdIFlc7n4tKL6Ch5JWT7kEjhifWtaV14MmCSgORczbzG12xlbw1pP6X/OK4zPEMMZvQ8BgX89ul/msBaVxXVLIdCaNXZ+5JiKklcJNf+OYdHFLtUIMgc0gCVLHGBDaLbB5kX1V9jzq4o9xv6qDGyNm/RpKVzbnq4akBoE9t3xOyNY+bBOmGyqCRLcqgpPnC0tEUldMVDodnaAVKm+rJaBBXeFqfbnJDx8tQVpeicvr3NTNUcTQiShuFtpfOIgrjlnxBUjE792hQRJxbFpVycWjumLV50oa0dId4+Xqeiftf/XA8SywNvliidcf9vtiWM3RDt9wjnDXQ7+crooxW9N1jJZSQtfa1j1pKccsNwU76NfaPTIG7znPShBzoKCzxeKJJj9PYauHqY4w4JPBS0Zub85JTnRcpuz8X7bkFSlsTbvX2AZt1v0TgziFqAm1zX6QrBMhxZWXxExNjHm+FGLBypzhdfZ6fELo4o4CQAi8GlJ50gTRvV+LEo5CaU+NokGXb4SFdupyefC/aHoThZHTZsTZ10ZPD8lhj/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(451199015)(36756003)(38100700002)(86362001)(31696002)(316002)(31686004)(6512007)(8676002)(66476007)(66556008)(6486002)(66946007)(6666004)(478600001)(186003)(6506007)(2906002)(83380400001)(2616005)(41300700001)(4326008)(66574015)(5660300002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0thNFZQVno1ZFhCRm5uQ0pSL3N1STU2OHYvaGNvVkc1N0VhVDVvWWtIckV3?=
 =?utf-8?B?cnJLN2JHT2N5MEFSclB1RThXaWoydjJ0aUhGY0x6THNiSjJ2bUJJYkZVWCtr?=
 =?utf-8?B?RDYzRHlHOFFhajk4eTFqU1dvdWVFVWx4MENxQlZkMUZvaUpYUCtEWk1paUlM?=
 =?utf-8?B?ZnhoM2pHZFZVdDZQVXNrUUdJSG5DQ1hFVi9BTzloelNneGpTbXFKR2RsZUVT?=
 =?utf-8?B?ZmJhb01YZVAxNGlCWm9oVVBBYXhYc1U3YXE4S25GVzRLRTVuTTB2dlFFeW9L?=
 =?utf-8?B?TnMxcm5sNmM2WjRCTXo5TnZMVk9NQXpSMDlBZFF0eWtIeHdsUmtMMitwZUl3?=
 =?utf-8?B?NnlNVGtpUlI3Nzl3RkgxcWFWVFBQYjY0OUhpMXVZTkUyUllrQ2MvbDR5ZnJh?=
 =?utf-8?B?SlA0YnJGSHhHSk9wd0tqUlBNSFE2QU91U2t6a2kyT0puMVFESWlsdm1FeW8w?=
 =?utf-8?B?eUlNcFNQL2UwbUhZQjBQblJtcUs0clpiaG55aXdIYzZzMzFWWDJKSjhWWDdj?=
 =?utf-8?B?andHMlA0MWVBUmEvTHByZHk5UVNqeUZ1NW1lNHNsWHc3S2VwNjJMUTNoVWZH?=
 =?utf-8?B?em4yRk1rb3JRWmhMa2d3d2t4STIrRHFRQXhHVjY3RUxyaHZZYXM2U05OOGlp?=
 =?utf-8?B?cjZSUVl4cHBQUHJLejliQm1uN2FsUExMbzVJdC9xNVlyU2o1SHpBTTQ4RDFw?=
 =?utf-8?B?aDBwSGlJK2tYNWlpZWQ2eVJoTkJHczdJRVQxOFIrdzVTeU80aXpQZ3VkSklG?=
 =?utf-8?B?VDRQSkV0aWZYRWo3ZnlMU0hqME9Yd2pYL3JWRUNVOVRwZDBjUm0reXJPYTAw?=
 =?utf-8?B?K1NCV2YySG53UXErMkhVaHA0Zlp1VVpPV04vYzJreTgreHhudC9Xb2MvTTlB?=
 =?utf-8?B?S2ZhVmtueTkweEtBTGcxQ1Vtd3RCQUw5UFNpVSt0MWR4ME1obFd1YWxidTZD?=
 =?utf-8?B?dEhBdlRMNjJueUUzSmFLVFp4TjdRVXNlRCsraWY0amRoTTYvdTdvSnlxSmdI?=
 =?utf-8?B?QTBZSUdkSkJjSzE5Unk0TVFqejRGaGh1T1pDQXJqMzBORXRaL1B1S3gzM2lR?=
 =?utf-8?B?VnhNTjArVXlzOTVybG5IL2V4Rk9vM0hzQVFSdzN0SVNOaGF2TU5kc00xN1Rs?=
 =?utf-8?B?VmQyTkZBY2c2eS9uVjB4a2t2bWEvcW50Y1BNTkVYejdLeldzdWdEWU5mdzN0?=
 =?utf-8?B?RFRwTUZzNm9QWmdtQWVya1dLaGlQVXFDbkZkSEJROUl0VzlxL1dCQUZnRFhX?=
 =?utf-8?B?MXQxblROaWg5UlFjMEt6cUFvUWE2Z3BzeDlHS0orK1FLekxyc1RmbUI2U056?=
 =?utf-8?B?VHlaY1hqNzZVaDlQcmE4SGtSTlJpeis4eTVhaU5KN0VreHNGZDV0dDliTk9u?=
 =?utf-8?B?Wk96QXBoemZ1Tml4dXBReEtRTVJhS2VCWWo2SlRYQ1ovY2dGMEo1ZjFZeGk0?=
 =?utf-8?B?anpEZlFPTjdrc3R6Slg3S05PQWhIN1p5YWNxU1VoNlMwY1VWaEFjVEE5SFp4?=
 =?utf-8?B?L2FUN3ZrRCs1aVlobEovUXc3aEhrcDNiTGdmV1Z5cW1nTFVKYnhsWExjcXJp?=
 =?utf-8?B?YTZMQjh4MmhydmtrZ3phV3hHaEx4Q3RjbW1DaXhYcEJFT3MyLzZQWXZQZUV0?=
 =?utf-8?B?VVh6ZkxPajExcmtZeVA4NTFSVEE2eHNSMFQ1YmQzZVNyZzhTZC9qQnJjNHBJ?=
 =?utf-8?B?a01VWlllSTF5TWZHUGFJeXRUVmVsMWRibXUvT3o1WEMyMEY1UlFPV2llMzNy?=
 =?utf-8?B?TjQvcUd2RytBZWh6eUk3c3lXdnJDU0xnL1EzVC9QcXdZZTJ3eWZnYkVGdW0y?=
 =?utf-8?B?bEM4VERwWmU2M3QrUnJrUGdFUGNNcTlMV2tsZGUvUzdHR1c1YW1JZnNpR3BF?=
 =?utf-8?B?YUNJSk1naDVmbGNoRk9rdjIxdndCUnZSNXpWUEd5cm9ZYlVmZTVlWnZTU3JH?=
 =?utf-8?B?ZlJ5SWdhb0tPNUo3MWdXTlQ2b0dLaXJmcG1FWWsvclFydWF6MGNQUFJCSVhq?=
 =?utf-8?B?M1lRZ3BzRjR1NkNDY2IxUEkzOUtlbkVZTEJKcGNwaEZBaEc1ZHo3dEkxTkRR?=
 =?utf-8?B?OXhxY1RXbjlXQkFoTzVjcFRGd3hzdjdEM0Y2dXRRMTNDL1pHSTlaRWxHVHI3?=
 =?utf-8?B?MlRTenJpSHlzZm9sRVRtY0dlWmNCSDY0b3c5M2VpNXcwS3RKZm5VT0c5VVB3?=
 =?utf-8?Q?ybd41qLCobQzW8Y/woh5nYn0mK3rBJ0X22FQIjrl5c2r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a54e13f2-6805-48e1-3bf1-08dad440acc1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 08:39:06.9718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfN/dvx9GZsHyrDhWdlPyi5kDA4lDLUJy8nnZc4/wbGQPmPbTTIXB4FhpU1+j6DX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7560
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.11.22 um 14:34 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Replace the deprecated macro with the per-device one.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/drm_file.c  | 21 +++++++++++----------
>   drivers/gpu/drm/drm_ioc32.c | 13 +++++++------
>   drivers/gpu/drm/drm_ioctl.c | 25 +++++++++++++------------
>   3 files changed, 31 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 64b4a3a87fbb..b0f24cea1e1e 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -245,10 +245,10 @@ void drm_file_free(struct drm_file *file)
>   
>   	dev = file->minor->dev;
>   
> -	DRM_DEBUG("comm=\"%s\", pid=%d, dev=0x%lx, open_count=%d\n",
> -		  current->comm, task_pid_nr(current),
> -		  (long)old_encode_dev(file->minor->kdev->devt),
> -		  atomic_read(&dev->open_count));
> +	drm_dbg_core(dev, "comm=\"%s\", pid=%d, dev=0x%lx, open_count=%d\n",
> +		     current->comm, task_pid_nr(current),
> +		     (long)old_encode_dev(file->minor->kdev->devt),
> +		     atomic_read(&dev->open_count));
>   
>   #ifdef CONFIG_DRM_LEGACY
>   	if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
> @@ -340,8 +340,8 @@ int drm_open_helper(struct file *filp, struct drm_minor *minor)
>   	    dev->switch_power_state != DRM_SWITCH_POWER_DYNAMIC_OFF)
>   		return -EINVAL;
>   
> -	DRM_DEBUG("comm=\"%s\", pid=%d, minor=%d\n", current->comm,
> -		  task_pid_nr(current), minor->index);
> +	drm_dbg_core(dev, "comm=\"%s\", pid=%d, minor=%d\n",
> +		     current->comm, task_pid_nr(current), minor->index);
>   
>   	priv = drm_file_alloc(minor);
>   	if (IS_ERR(priv))
> @@ -450,11 +450,12 @@ EXPORT_SYMBOL(drm_open);
>   
>   void drm_lastclose(struct drm_device * dev)
>   {
> -	DRM_DEBUG("\n");
> +	drm_dbg_core(dev, "\n");
>   
> -	if (dev->driver->lastclose)
> +	if (dev->driver->lastclose) {
>   		dev->driver->lastclose(dev);
> -	DRM_DEBUG("driver lastclose completed\n");
> +		drm_dbg_core(dev, "driver lastclose completed\n");
> +	}
>   
>   	if (drm_core_check_feature(dev, DRIVER_LEGACY))
>   		drm_legacy_dev_reinit(dev);
> @@ -485,7 +486,7 @@ int drm_release(struct inode *inode, struct file *filp)
>   	if (drm_dev_needs_global_mutex(dev))
>   		mutex_lock(&drm_global_mutex);
>   
> -	DRM_DEBUG("open_count = %d\n", atomic_read(&dev->open_count));
> +	drm_dbg_core(dev, "open_count = %d\n", atomic_read(&dev->open_count));
>   
>   	drm_close_helper(filp);
>   
> diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
> index 5d82891c3222..49a743f62b4a 100644
> --- a/drivers/gpu/drm/drm_ioc32.c
> +++ b/drivers/gpu/drm/drm_ioc32.c
> @@ -972,6 +972,7 @@ long drm_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>   {
>   	unsigned int nr = DRM_IOCTL_NR(cmd);
>   	struct drm_file *file_priv = filp->private_data;
> +	struct drm_device *dev = file_priv->minor->dev;
>   	drm_ioctl_compat_t *fn;
>   	int ret;
>   
> @@ -986,14 +987,14 @@ long drm_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>   	if (!fn)
>   		return drm_ioctl(filp, cmd, arg);
>   
> -	DRM_DEBUG("comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, %s\n",
> -		  current->comm, task_pid_nr(current),
> -		  (long)old_encode_dev(file_priv->minor->kdev->devt),
> -		  file_priv->authenticated,
> -		  drm_compat_ioctls[nr].name);
> +	drm_dbg_core(dev, "comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, %s\n",
> +		     current->comm, task_pid_nr(current),
> +		     (long)old_encode_dev(file_priv->minor->kdev->devt),
> +		     file_priv->authenticated,
> +		     drm_compat_ioctls[nr].name);
>   	ret = (*fn)(filp, cmd, arg);
>   	if (ret)
> -		DRM_DEBUG("ret = %d\n", ret);
> +		drm_dbg_core(dev, "ret = %d\n", ret);
>   	return ret;
>   }
>   EXPORT_SYMBOL(drm_compat_ioctl);
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index ca2a6e6101dc..7c9d66ee917d 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -440,7 +440,7 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
>   int drm_noop(struct drm_device *dev, void *data,
>   	     struct drm_file *file_priv)
>   {
> -	DRM_DEBUG("\n");
> +	drm_dbg_core(dev, "\n");
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_noop);
> @@ -856,16 +856,16 @@ long drm_ioctl(struct file *filp,
>   		out_size = 0;
>   	ksize = max(max(in_size, out_size), drv_size);
>   
> -	DRM_DEBUG("comm=\"%s\" pid=%d, dev=0x%lx, auth=%d, %s\n",
> -		  current->comm, task_pid_nr(current),
> -		  (long)old_encode_dev(file_priv->minor->kdev->devt),
> -		  file_priv->authenticated, ioctl->name);
> +	drm_dbg_core(dev, "comm=\"%s\" pid=%d, dev=0x%lx, auth=%d, %s\n",
> +		     current->comm, task_pid_nr(current),
> +		     (long)old_encode_dev(file_priv->minor->kdev->devt),
> +		     file_priv->authenticated, ioctl->name);
>   
>   	/* Do not trust userspace, use our own definition */
>   	func = ioctl->func;
>   
>   	if (unlikely(!func)) {
> -		DRM_DEBUG("no function\n");
> +		drm_dbg_core(dev, "no function\n");
>   		retcode = -EINVAL;
>   		goto err_i1;
>   	}
> @@ -894,16 +894,17 @@ long drm_ioctl(struct file *filp,
>   
>         err_i1:
>   	if (!ioctl)
> -		DRM_DEBUG("invalid ioctl: comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, cmd=0x%02x, nr=0x%02x\n",
> -			  current->comm, task_pid_nr(current),
> -			  (long)old_encode_dev(file_priv->minor->kdev->devt),
> -			  file_priv->authenticated, cmd, nr);
> +		drm_dbg_core(dev,
> +			     "invalid ioctl: comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, cmd=0x%02x, nr=0x%02x\n",
> +			     current->comm, task_pid_nr(current),
> +			     (long)old_encode_dev(file_priv->minor->kdev->devt),
> +			     file_priv->authenticated, cmd, nr);
>   
>   	if (kdata != stack_kdata)
>   		kfree(kdata);
>   	if (retcode)
> -		DRM_DEBUG("comm=\"%s\", pid=%d, ret=%d\n", current->comm,
> -			  task_pid_nr(current), retcode);
> +		drm_dbg_core(dev, "comm=\"%s\", pid=%d, ret=%d\n",
> +			     current->comm, task_pid_nr(current), retcode);
>   	return retcode;
>   }
>   EXPORT_SYMBOL(drm_ioctl);

