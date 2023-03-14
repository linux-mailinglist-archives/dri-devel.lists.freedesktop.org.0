Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7635B6B9957
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0B810E83E;
	Tue, 14 Mar 2023 15:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDB210E14E;
 Tue, 14 Mar 2023 15:33:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pz/bzjD8swLWOCByB4iQorrAj8yDbJUIPSx/qov7C/cDjV1xS7BwxV4ZS2tq7tNBJ1IKfRTvK6b1hiaTt9quQfj7Xz2xbWROKPs1QzXLyfuTzDytUmIkIngQvTmyKJJH40i3UAcai2m5wYMJm+4yGEfLOdGaLtUKOlGjev9hlHo3gxdzKTtGSaGcl31B4n2qZL9qBwwWsm+lELJpdm4L3pz8ipAANdVKI8WILGjhzTsIYAMFEYdKVWTYMeOM0UBdtaToEtZ9QhDXhD4Xf9DPcKBPL97b8W4FFIOuay5dHxo+L/OhZlusm857/rmPT39s+j/Ig0eDDbEzy4AWK2+4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=td0zIlqL7ArQhsgOdbcIqzBidI++4ILPzBAytnV8TOc=;
 b=UIp1hNyjDR7xDXzZ+rvtggvmTrUn08t+1sWKSDUHQYw6Nv8LnEmXyoTDCYTAo6EsISm4Ndy1SwUZyCsngGOL2wg0UgFKMCTcy+PqQojIiKMpV1RxktH4EsJo+NTxKnMrMWTkxh6XOwJr+xRPY29/5c8oO6hoSZ1Zs79IqQRCFs3PiR1O5BPzhJnMEcRPa7fI3M+BLTsoVQiE1MhofI7Lss98vOQQEGVaBr1+tO+mYMKNCuZlBk8IA1IE825BUS1aft4BHarkr62X0lymoS4fQON0nWyD/vsKzO8ZgaST7dxcibo2HXp5NU5VupKqmYuZm+V9k1+RuKRUOYHyl+TmcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=td0zIlqL7ArQhsgOdbcIqzBidI++4ILPzBAytnV8TOc=;
 b=1z0i0oNUdcPVdbFO4PArgcVLHe/nF7S6UDpx/WPfuy/s5mkKqNSj7Yw0HuGXetXtBLS8ub6ashw1YY4bthpW17uipnSQ8lRBEqByk1fNuNRhrVJDhU3z+ISd4hLJ84TZlNgSSkLFSRyHkglh6DB36VSwhEdmeM3ExNEJUgjyPeo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5106.namprd12.prod.outlook.com (2603:10b6:610:bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 15:33:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 15:33:11 +0000
Message-ID: <2d4c10c7-6406-7458-4f52-4260b415874e@amd.com>
Date: Tue, 14 Mar 2023 16:33:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC 01/10] drm: Track clients by tgid and not tid
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230314141904.1210824-1-tvrtko.ursulin@linux.intel.com>
 <20230314141904.1210824-2-tvrtko.ursulin@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230314141904.1210824-2-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH0PR12MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: db5a78d4-2da1-49ad-5983-08db24a16b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UHj9diJ4o82q+sjutEV80+S2+JjXlzYnXJdJBtUympYZLtW5AuYphtZJ0MQYuMox5E6jzxIp7/vpZoxQ/O4dCBj3lAjo95PMcunmERv+5b7hmu/VVzGWb+q91eDjxSeAarkFtH6GdpQv5+ltWDTdOQskzu4JD7bTSkB1Ke4e4GY3va9bv7pN+rsao23Qq8HYqaH8Hfv++Lx+KKQApQzBaH8c3NafZiZtDdqTs6vALe+zPh/p3m2EtFeafFplV3kzZj563DvPhiOSPXsBtYjDne/IwvwX/8rrz9KaFh2O1WvJlW1Y2rMzIXeYjC3wn9Gmcklnqe197+/O4KjVm41x95p02cZNFQGo1r3kMHAlEWTHzdK9dQJsFGnCvUhh4DQ6kmMYIGLDE7vRUs+V7n+01HGARtw4dhjsab4gBdtVE3K+hcCaZagWSwo0bQ/6tQAvJ6J42bK154e/R9s2UTsamRvcMuLOKyWKuqN55x+wxD2ENwcwZRJaEVPpbVOJb8c5IUo9VVvrpOHJ9D9cVgotLOYpWErvRP8A9LR6gct0Q5AKCAYys5yy6rXyy7h0iym223QjWLNyJ1naFLIJ0QLExaUn1Rtx+f0g5x7iTgqNkO1sjGcQbRx3/8AviT6w/hRiVzbfuqcxniKh9/N3ohLj6luK5UJs02jMg01oW0jhZtTgCg+UuN6TELBJwaviYp9XDuGRF0paKBestA8xEK3rcJFo7ZSMK4TSs9FNfYf/HYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199018)(86362001)(66556008)(8676002)(66476007)(41300700001)(4326008)(66946007)(5660300002)(7416002)(83380400001)(8936002)(6486002)(186003)(66574015)(6666004)(6506007)(6512007)(54906003)(2616005)(316002)(478600001)(36756003)(2906002)(38100700002)(31686004)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVR1NW85clp1LzJqUGVCcWpZamt6OXNWejFMbGVkYjdySFViTFdGK0N5Ty90?=
 =?utf-8?B?a055dGNNaVpHQ1FFa0xicTR3dENUeGRMSm5sWmY1ckprZUg1M1B4aUU5L1Rr?=
 =?utf-8?B?YmoyN3FLSzFrT0wyKzFCU3B5WkxVYU82U3JPNUhVZFc1S2tmMnZ2V3RqTDBR?=
 =?utf-8?B?Z0w2Y1VNLzFqWnlLY253bnF0ZW9vR2lOTG80M253OGdTWDdIQU5FWHpVWEUr?=
 =?utf-8?B?Z1dhSUYyVytDZDNLWmhpTDhvakRWWjhmRVc4SHdZOGQ2QzdCMy9yMC9nMjJx?=
 =?utf-8?B?SVZTK01NNzgrVzZvVEhmS0c3Z2NGZnphNWtibXI3Z0tYYzVzTjVrYTVHWlRu?=
 =?utf-8?B?a1NGR24zeU9WaEVCRHdqNkRuWTJXd1F3SFlkWlhER0NBRHZoNE9CVlJDL0gx?=
 =?utf-8?B?Y0htUlVlZk5IeVp6NGphNGV3SHp3eVo1eHllU3U4WkFIR3ZWY2l2bGRXbThk?=
 =?utf-8?B?cnlpYm9MRFowNDlKYllxVlE0K012MmxhUHVmNFp2dnNMWDNxOU1NUTNUSFhK?=
 =?utf-8?B?Q3I2N2xDbVREaTk2MTVvTGIvK1B6K0dCWm14MGw3VURINUpHdnRPQnE1WUZL?=
 =?utf-8?B?YWpQL212dzhlT3czd05BeEllRkJhM05ZMWEvMUZLSFpFSmN5ckhFaVhSa3Rl?=
 =?utf-8?B?MjRobElvd1d3U2JLbmp2cTc2YjVXcXpUOWtpQW1vakwwNnAwNFFPVkN2RUFB?=
 =?utf-8?B?WkRCSHUyc09hV2dqcVg1ZUtVckNka3NhRWpnNnR1WU5zWmhNeklBeDZodnc4?=
 =?utf-8?B?SExXcU1iazkvNnJzRFJXa0Rwb09Yc2FicHplZy8wT3hpSTV2b0ZZYndRY2dp?=
 =?utf-8?B?SGJTOTRocXdoeElZaG8xb01UTkE0cjJVTDdZeHZwTENlS1NNOURoUTdyRks3?=
 =?utf-8?B?UEpEV3QwTm9hRjZrblhNVzRyN1F0enBWazduendMV0VkQVFmcitkOHEwUThx?=
 =?utf-8?B?Rld1OWhFYXJhVENBV1B1TUtWVW1wSGFmbGhJWWNXTzBiLzdmQlM2WXcvRGk1?=
 =?utf-8?B?Qzk4cWpoN2RUT2ZoMGZ1UVFoc1FmMGZEMGJ3QUJmd1pQS3hKS0MzMWk0QUov?=
 =?utf-8?B?QUhOZjY5Y2VpWWFSSjd6MFVyU2JZVUh5SmxoVDdMSzQ2RStIQmFkWGx2eHAy?=
 =?utf-8?B?SFJrcmZEVGRaRUt3ZlQxTVlLZXIzMVBFcklmbDdMNk1nQlJuWVhNQWdVRlVW?=
 =?utf-8?B?QWpzMVBQKzhZd05BS2RyVC8zc1RtdmwxMXlCZUFQMTFxNStpaE5BUnBrTUZ5?=
 =?utf-8?B?cHJ2RFVwOE0zV29Yc3JteG0vb21jd3U1dFlxeFh0VzVvRzNxeUQ5OGppbW44?=
 =?utf-8?B?WGVJNkxPSjY2aWMwUFN6d041eUpWS0JZZWlhN0JGMTNpdlU1QWFrSHM0dzBD?=
 =?utf-8?B?cno0b0cwdEQza3dsSHJlTlNLcExkaHdRelJkOFNVaVpMSTBpSHI3YTUwYVFy?=
 =?utf-8?B?MmdVcEFISStKdFdBREFKakZxNDZnWmp0UWc1TmtyL1NtWGdHRlF5aHlsenJT?=
 =?utf-8?B?QkhYOWdhRjA1V3RUSTlPRERKNWh4Nm1FcHlHa045YzhXcmFpSmFNcE9KL1dF?=
 =?utf-8?B?UmJqQTl2VkFISFdwcGF1Q1ovdGJwcU5tZ3l2Z08wN2NZV2dVTWhhR2tzbWRw?=
 =?utf-8?B?V3VMaU1YR0NIOTNQUWdPNDZZSzlKcUxpV3ErMjNWdHZMRlJqdVlhME1zU1JC?=
 =?utf-8?B?eDVjMER3eVZlbUJ6cU5DOWkyQyt0Y2RWWlBtcGZOWjdVR1NNQnF6WXA1c0xF?=
 =?utf-8?B?WTgyc1ZJY0VZSlhFbWdJQVN5eHJNM2E3SE9rN2RkNFZGQlQ3ZzR0bGJ2ZzF3?=
 =?utf-8?B?RytZNnk1NDgvZWt6Qysxczl0RmxtVzRBR3A1RDlKNXN3cUtHMmxOeEFNWm8r?=
 =?utf-8?B?L3VEeGJ0dmJaYnVUdnBQU2xibTVmazdiOVVpVGNLVS9XeWtHbU0vYWpFYjds?=
 =?utf-8?B?ejZPVCtYRzhjQm1iMmdmM29LS1JKbXhZWnlVNlRzRUdxQkcwNVM5NDd2eWhp?=
 =?utf-8?B?ajB4T08yWFlvNFhvU09mUnF3bVN6TWRyVWhoaE53RklrcXRFZU54YTE4RGdn?=
 =?utf-8?B?aUxkSElrcWRNS1oveEdFNXdDN0Z6cU5PeEU3SGVkVDZaQXRTUCtOcW1LcGdK?=
 =?utf-8?B?WU1sNUxsUS9zdGdVTitkSFBOWm5XWXJ5ajNYcW1oa0FJWWtqc1ZkRnc1clY1?=
 =?utf-8?Q?Bxe0YMjGfrTTig2sBoFLTexLgke5yvz/PT+VMs2LAY2c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5a78d4-2da1-49ad-5983-08db24a16b04
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 15:33:10.8401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6yZO23EDwmO7yosF4U+c17SuMPqOeU/zDnBidR/hq+hbOdsnem/mYSQION+Xo0M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5106
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
Cc: Rob Clark <robdclark@chromium.org>, Brian Welty <brian.welty@intel.com>,
 Kenny.Ho@amd.com, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>, linux-graphics-maintainer@vmware.com,
 Zefan Li <lizefan.x@bytedance.com>, Dave Airlie <airlied@redhat.com>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.03.23 um 15:18 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Thread group id (aka pid from userspace point of view) is a more
> interesting thing to show as an owner of a DRM fd, so track and show that
> instead of the thread id.
>
> In the next patch we will make the owner updated post file descriptor
> handover, which will also be tgid based to avoid ping-pong when multiple
> threads access the fd.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Zack Rusin <zackr@vmware.com>
> Cc: linux-graphics-maintainer@vmware.com
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Reviewed-by: Zack Rusin <zackr@vmware.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Should we push the already reviewed cleanups like this one to 
drm-misc-next? That makes sense even without the rest of the 
functionality and reduce the amount of patches re-send.

Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 2 +-
>   drivers/gpu/drm/drm_debugfs.c           | 4 ++--
>   drivers/gpu/drm/drm_file.c              | 2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     | 2 +-
>   4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index d8e683688daa..863cb668e000 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -969,7 +969,7 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>   		 * Therefore, we need to protect this ->comm access using RCU.
>   		 */
>   		rcu_read_lock();
> -		task = pid_task(file->pid, PIDTYPE_PID);
> +		task = pid_task(file->pid, PIDTYPE_TGID);
>   		seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
>   			   task ? task->comm : "<unknown>");
>   		rcu_read_unlock();
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 4f643a490dc3..4855230ba2c6 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -80,7 +80,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
>   	seq_printf(m,
>   		   "%20s %5s %3s master a %5s %10s\n",
>   		   "command",
> -		   "pid",
> +		   "tgid",
>   		   "dev",
>   		   "uid",
>   		   "magic");
> @@ -94,7 +94,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
>   		bool is_current_master = drm_is_current_master(priv);
>   
>   		rcu_read_lock(); /* locks pid_task()->comm */
> -		task = pid_task(priv->pid, PIDTYPE_PID);
> +		task = pid_task(priv->pid, PIDTYPE_TGID);
>   		uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
>   		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
>   			   task ? task->comm : "<unknown>",
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index a51ff8cee049..c1018c470047 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -156,7 +156,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>   	if (!file)
>   		return ERR_PTR(-ENOMEM);
>   
> -	file->pid = get_pid(task_pid(current));
> +	file->pid = get_pid(task_tgid(current));
>   	file->minor = minor;
>   
>   	/* for compatibility root is always authenticated */
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index d6baf73a6458..c0da89e16e6f 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -241,7 +241,7 @@ static int vmw_debugfs_gem_info_show(struct seq_file *m, void *unused)
>   		 * Therefore, we need to protect this ->comm access using RCU.
>   		 */
>   		rcu_read_lock();
> -		task = pid_task(file->pid, PIDTYPE_PID);
> +		task = pid_task(file->pid, PIDTYPE_TGID);
>   		seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
>   			   task ? task->comm : "<unknown>");
>   		rcu_read_unlock();

