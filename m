Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5496E089C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A81D10E11A;
	Thu, 13 Apr 2023 08:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2053.outbound.protection.outlook.com [40.107.212.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDF810E030;
 Thu, 13 Apr 2023 08:07:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEQfOzW/ekgWqtRSzTUzdF7HjAoZcVQU002y0r8mF0KX+T7sOL0ixEoUaDminMkBYUlKGnxbn8t2y5jm8w5E3JV1lsx6/0gxoeqeLeKa+jyo0kxDbhYDkQRXMOLMxnK8vAkdtfyVi8koVpwxAGsoodBzXw0rjfLZ4qqz3dlXNXV+VC+YViXqXnO0WgJEtooeoGmnLbtFP1UTFAaTCUVAadkBeddKdH4EIvexb9cHLnyPpMviZ0T+N035Ni/wqscuoMV+FsJSnvUDOXzQQKjAd50cWD9lt4eFL+YghFnH/jP82iXl+IU2kOz19P+rZTuxyT9LtCJLwZDsvfvHJnRjvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmYPGX7a3DVg773g9dEOwSKlcNsxuADMeZDyFmu/1Bg=;
 b=GMx9NhZpE7ByDRMby6E3/fKIasu22ZqiYgsLy3RRLly1ES8ygnofyFDlw3h8aqvXjNxCPDIYeBdqBhv90JebiM2k6ItbUQtWKre0VlLoqmH1fIG2/u9+T0OCBm1dpox/cL6BJbT2HF0m6LpcLQJq8ZWwXJU20BbU5lexGE7pmIXIE0V4GdR61L1ReYQcSEw7vae5xakdLwGkYujOuUhHmMT+dRZmaUSVS0Tu5ZhTMonGaoratJCLjDMvtbxnA4QhhQ5loHv32TPpFlyJRaXW6RY6V90ilzHWWf7gOLyeG1zRwc9mubbSAMTW/2YLJEL/ipIYue273jCMxqvtOQbi7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmYPGX7a3DVg773g9dEOwSKlcNsxuADMeZDyFmu/1Bg=;
 b=HEHnPgiueAMbCeHxnqxPYNK3QYK1tS0pVQdDXcJXhFeytSaWBx/AagqdpTIWTzIGgURzENKrH8KO4xCtq7Gl2r8M/HFR5YKhYzpeLBTxWlf2hlDKrhYq8myf0d4R+lInkh9WQw/DbCBuNzOZC07+d7srtpO/Xtnlp2xMpyqUqxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB6859.namprd12.prod.outlook.com (2603:10b6:510:1b5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 08:07:18 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6277.036; Thu, 13 Apr 2023
 08:07:18 +0000
Message-ID: <ce87917c-6cf1-b1e7-4782-61a7e47aa92d@amd.com>
Date: Thu, 13 Apr 2023 10:07:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/6] drm: Add common fdinfo helper
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230412224311.23511-1-robdclark@gmail.com>
 <20230412224311.23511-2-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230412224311.23511-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0002.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: b4004af5-0e6b-4d9b-3a9d-08db3bf619e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0CePvwG8FqyKJ8xoZ6OVaFvBD+fbrq16HA/vp+12dqDrbvDGVNg3SF2Vf/Q3nFcbX5qPiF+KzlrQO5KhtWO7UFgptxTAJSnt7v1ul9d4fUkOiUGEaxL7mhueKN1YLvJ3VocUaNswEaSOp1V/8c9PoDvVOmIn02ckzlC3QqzG1I7RENuvgYg9gFOs/+CUSV4OwHLkPl8WrBUNRBOtsZICJ1e67Uerq4WDeennR2PI4pzQeYvM0B6xFX4lhs64D+0+KXM1qkfApdVBqBy5QXWErhAb+Gj+uWCM3hPY3A17P9iabh6DmdzmE+icXP5mRFioXduLVPENmQYFN3Sc1yOCju6CeqhYPlmzsGrP3lff6VqKeYxP7a8adg9RSbUuvY7gOB+HCHyBTNKyq7orRxBK8e6Tffz13eQthQ/Ad8HmKSLqhCiJGYWiIkMs4BYtLb3Ig+yqqRxEX5e+iKu9WYQvStJmefA00GZi4iYy3k+hay0M/h3id427x96neJTKUPx0M9GmtU8fE5N9ZsW7XkPE5H/SNckJnuJiwJwkkrRoiiUy4K8DgrFwrhfHxqaWxRhSWn4PZlI2P4QElu4CUHLPrLM6l3geH7UYpgLkEbVEyROqJ9yDlM/Sz95PaRo7ruVLLZXF02WAVQf1XiEKQqDZOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(54906003)(478600001)(316002)(2616005)(186003)(6512007)(26005)(31686004)(6506007)(6666004)(6486002)(83380400001)(66556008)(66946007)(66476007)(4326008)(41300700001)(5660300002)(7416002)(8676002)(8936002)(2906002)(38100700002)(86362001)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGFmeDVjWmNjME9MWG9UY2ZvcU9id2ZEU083VXEwQWhQc1huNTUzTzUyb3ht?=
 =?utf-8?B?anM1Y092bjdNSFBxRnp1c3pweFRaUkJ6TGpNZzZtQk1BaW5mZlhiWmw0NW9R?=
 =?utf-8?B?SDVwVGtlYmNUeW05QTVxNXNPdVh5L01oanNCQmVWa2c5SXV2bjJRcnV4NFo1?=
 =?utf-8?B?dVh0bXVGTGlFd0lTeTJQNFhtWUhrRWNabmJXV21HeHdZMjY2YS83WmNFcGw0?=
 =?utf-8?B?cmRQZzNNZDYyYm14SVhzOGlmMnliNUZlSVhjWTFGa1Q0NXdPSDdpODU1Y1VF?=
 =?utf-8?B?cnF3aXdjZUVxeStOcE1hMzk5aUE5WlQ4d3d4blBKM1R0Uko4WmpaNjE0K3Zw?=
 =?utf-8?B?TjM1dXhMWHlpT1dnbVNkT2h5c3pEVzU1NHVxYTFtVTJzeFp5TkdnMW5Vb3lO?=
 =?utf-8?B?STRaS0JLTlhnU3RjVjhzNG52cGJNUGdoQUJOSGlxb1dUWFpnNHhhTFMyNEh2?=
 =?utf-8?B?RmFmNXpkZWVoSUhNbmRsOTRkS1paeG1uR3k4S0hPM1I4RWMvQjVyQ0tIaVkr?=
 =?utf-8?B?K0dOUzQwQWdYa25sTnNVUUE5dWUwVVgrRXhaaXk2OERMTi83MSt1OG93cEor?=
 =?utf-8?B?ZkRpcFlHTlRZT1BBQWYzWCsrYTcxbXZwOFREUEVaU050eTZudHRLcTZXSzBS?=
 =?utf-8?B?N0hFcTRJS25vZzk4eTQ3YWUvS2Q3WktPU1hqY1dsd2tnVk1Nd1RrcnkzSFVq?=
 =?utf-8?B?QjlHRldTUitSSTFhaGFHdlhCeDBxRnRwQXBaanRqOWNsMjlOaDlvUFRHc3lW?=
 =?utf-8?B?Wko2UGJhczAvamtCeHpRdThRelZnVVQvQ3NKWW9wZjdPaHNNYitHOHpIM0FM?=
 =?utf-8?B?RHBrOTBsaHFkalJ4aW1FR0hKNEVZbU9pMDVvV0NOcWU5Z05Ta3k3T0lyWDAx?=
 =?utf-8?B?S1htaGlXOWF5eHpPVFZja0lhd0JOR2JlMi9HUDhSeE0zYTBWNVpPdXdoanUw?=
 =?utf-8?B?S3VsV2hNMUVseEVPbllrWFJUc2hoSjdxTFZUUm9RSGhLOC9pdUNRd2FBVW9C?=
 =?utf-8?B?VUVqMUhISi8zZm4vaGsxSWFmZlp0WEhVOEpPdVFpUDZCV2ovWTE2Q3luUVVt?=
 =?utf-8?B?SWRKbk9vampEMlVPMVhFZFU2OFRUd0pNK1FQT2lMRFdFUzQ4dWo1VjRvR3BE?=
 =?utf-8?B?cVFORkhBbVZJQVZESU5UNGs0U1N4NDE4WVJxc1lLUzBoRXVTRkpSMjY0L2tI?=
 =?utf-8?B?TDB1QlJROWorZGtFZHh0K0RwbWwxYllmU1hzMWJSUkNOV0tiMFJxdVYrWjNl?=
 =?utf-8?B?TC9QMllxMDZBdS8wcXBFS2dPZXhSOWtwd011VHZmRjhTSWRhbWhOZFV3eTkz?=
 =?utf-8?B?SVd4VThVVmNLMFpMdGNDYTBGN2NZQXMrekUyaEFWVDhLRW9mak1USTZEK0pS?=
 =?utf-8?B?UTcxVmpGbG1hZzhXWkJUU3BOcGEwQkRFblBKT1VZaDlOcTk4S2QyaGh2Nzl3?=
 =?utf-8?B?aVU1MEUwQWhyZWVIdWtOb0tNVXBwYmVndDZSYTJwVDJ0aC9Rb2tzTkZ5VXFj?=
 =?utf-8?B?NHIvc0Zhc0FvWC9PZTd2RDIxaFN6NEM0VjErMldreWVpelF3c3Jia2NlNW8z?=
 =?utf-8?B?V3hxdGJYMWg2SWQvZmltU0VSSXdkV3BDazhYckFUZmR4OFBMcXRBRmdnV0J0?=
 =?utf-8?B?dkdUVTBDT1Mya0JrdUhabTFISVJDcFgxeGdac2ZZR3R3S0VqV3BHcURsZ0ZC?=
 =?utf-8?B?SXYyL2lydE1qdUVmcUxvQy9lVkltaFZSVXJrMDFsbit5V2dHRWg1UVUxcmgx?=
 =?utf-8?B?eFRyeU8zRzZIMGEwRkxFdGNCNjlZWlpFVmdFYkpiUmdCdXZYTXVqYTFjWDZj?=
 =?utf-8?B?a0VKeUliTjNoTGhpUFZ0Z0lqSDMwV2ppaWUzcENOT1V2b1NWRUdXVk1yRzly?=
 =?utf-8?B?dDVNRGVYWUhFZzB6N3QrTkdpaXFMRE1heWtrcTJweUw5dW9VcGFsTk5oaXI3?=
 =?utf-8?B?N2JjbTZsUnpCUDBRNmgzS0ltWTY5RWhjckp6VEsxL3FMSzhTVmxheFF5aXRW?=
 =?utf-8?B?M01DVS9tVDQ4TjhTbFZtbmdBdTVHdWo3RUdwcUtrajZZQyt0RDZwS1hEQnVl?=
 =?utf-8?B?RWtNaldpcHBHSkhsTXg5NkQrMlBONDloTUZzZ3pQTGtmQlp0emR3NjJuZVQy?=
 =?utf-8?Q?rpZM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4004af5-0e6b-4d9b-3a9d-08db3bf619e4
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 08:07:18.7561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ulLoPqh0nNbh8bpQB3d/ndLIhPyjYUuJOwXOmhPjLD6Bo8WAiIdpIg/UVAXQzOND
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6859
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-arm-msm@vger.kernel.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.04.23 um 00:42 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Handle a bit of the boiler-plate in a single case, and make it easier to
> add some core tracked stats.
>
> v2: Update drm-usage-stats.rst, 64b client-id, rename drm_show_fdinfo
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   Documentation/gpu/drm-usage-stats.rst | 10 +++++++-
>   drivers/gpu/drm/drm_file.c            | 35 +++++++++++++++++++++++++++
>   include/drm/drm_drv.h                 |  7 ++++++
>   include/drm/drm_file.h                |  4 +++
>   4 files changed, 55 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index b46327356e80..2ab32c40e93c 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -126,7 +126,15 @@ percentage utilization of the engine, whereas drm-engine-<str> only reflects
>   time active without considering what frequency the engine is operating as a
>   percentage of it's maximum frequency.
>   
> +Implementation Details
> +======================
> +
> +Drivers should use drm_show_fdinfo() in their `struct file_operations`, and
> +implement &drm_driver.show_fdinfo if they wish to provide any stats which
> +are not provided by drm_show_fdinfo().  But even driver specific stats should
> +be documented above and where possible, aligned with other drivers.

I'm really wondering if it wouldn't be less mid-layering if we let the 
drivers call the drm function to print the common values instead of the 
other way around?

Apart from that question the patch looks good to me.

Christian.

> +
>   Driver specific implementations
> -===============================
> +-------------------------------
>   
>   :ref:`i915-usage-stats`
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index a51ff8cee049..6d5bdd684ae2 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -148,6 +148,7 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev)
>    */
>   struct drm_file *drm_file_alloc(struct drm_minor *minor)
>   {
> +	static atomic64_t ident = ATOMIC_INIT(0);
>   	struct drm_device *dev = minor->dev;
>   	struct drm_file *file;
>   	int ret;
> @@ -156,6 +157,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>   	if (!file)
>   		return ERR_PTR(-ENOMEM);
>   
> +	/* Get a unique identifier for fdinfo: */
> +	file->client_id = atomic64_inc_return(&ident);
>   	file->pid = get_pid(task_pid(current));
>   	file->minor = minor;
>   
> @@ -868,6 +871,38 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>   }
>   EXPORT_SYMBOL(drm_send_event);
>   
> +/**
> + * drm_show_fdinfo - helper for drm file fops
> + * @seq_file: output stream
> + * @f: the device file instance
> + *
> + * Helper to implement fdinfo, for userspace to query usage stats, etc, of a
> + * process using the GPU.  See also &drm_driver.show_fdinfo.
> + *
> + * For text output format description please see Documentation/gpu/drm-usage-stats.rst
> + */
> +void drm_show_fdinfo(struct seq_file *m, struct file *f)
> +{
> +	struct drm_file *file = f->private_data;
> +	struct drm_device *dev = file->minor->dev;
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
> +	drm_printf(&p, "drm-client-id:\t%llu\n", file->client_id);
> +
> +	if (dev_is_pci(dev->dev)) {
> +		struct pci_dev *pdev = to_pci_dev(dev->dev);
> +
> +		drm_printf(&p, "drm-pdev:\t%04x:%02x:%02x.%d\n",
> +			   pci_domain_nr(pdev->bus), pdev->bus->number,
> +			   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> +	}
> +
> +	if (dev->driver->show_fdinfo)
> +		dev->driver->show_fdinfo(&p, file);
> +}
> +EXPORT_SYMBOL(drm_show_fdinfo);
> +
>   /**
>    * mock_drm_getfile - Create a new struct file for the drm device
>    * @minor: drm minor to wrap (e.g. #drm_device.primary)
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 5b86bb7603e7..5edf2a13733b 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -401,6 +401,13 @@ struct drm_driver {
>   			       struct drm_device *dev, uint32_t handle,
>   			       uint64_t *offset);
>   
> +	/**
> +	 * @show_fdinfo:
> +	 *
> +	 * Print device specific fdinfo.  See Documentation/gpu/drm-usage-stats.rst.
> +	 */
> +	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
> +
>   	/** @major: driver major number */
>   	int major;
>   	/** @minor: driver minor number */
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 0d1f853092ab..6de6d0e9c634 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -258,6 +258,9 @@ struct drm_file {
>   	/** @pid: Process that opened this file. */
>   	struct pid *pid;
>   
> +	/** @client_id: A unique id for fdinfo */
> +	u64 client_id;
> +
>   	/** @magic: Authentication magic, see @authenticated. */
>   	drm_magic_t magic;
>   
> @@ -437,6 +440,7 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e);
>   void drm_send_event_timestamp_locked(struct drm_device *dev,
>   				     struct drm_pending_event *e,
>   				     ktime_t timestamp);
> +void drm_show_fdinfo(struct seq_file *m, struct file *f);
>   
>   struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
>   

