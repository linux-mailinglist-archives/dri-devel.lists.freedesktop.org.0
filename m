Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB3644A46D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 03:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57216E201;
	Tue,  9 Nov 2021 02:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C656E201
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 02:06:43 +0000 (UTC)
Received: from dggeme756-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HpBB44NCcz1DDCd;
 Tue,  9 Nov 2021 10:04:28 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 dggeme756-chm.china.huawei.com (10.3.19.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Tue, 9 Nov 2021 10:06:40 +0800
Subject: Re: [PATCH] drm: Fix possible memleak in drm_client_modeset_probe
From: He Ying <heying24@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>
References: <20211022012623.97631-1-heying24@huawei.com>
Message-ID: <e082f0fa-d524-ae4f-053d-48d817d2c7d4@huawei.com>
Date: Tue, 9 Nov 2021 10:06:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211022012623.97631-1-heying24@huawei.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.136]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
X-CFilter-Loop: Reflected
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kindly ping...

ÔÚ 2021/10/22 9:26, He Ying Ð´µÀ:
> I got memory leak as follows when doing fault injection test:
>
> WARNING: CPU: 0 PID: 1214 at drm_mode_config_cleanup+0x689/0x890 [drm]
> RIP: 0010:drm_mode_config_cleanup+0x689/0x890 [drm]
> Call Trace:
>   ? tracer_hardirqs_on+0x33/0x520
>   ? drm_mode_config_reset+0x3f0/0x3f0 [drm]
>   ? trace_event_raw_event_rcu_torture_read+0x2c0/0x2c0
>   ? __sanitizer_cov_trace_pc+0x1d/0x50
>   ? call_rcu+0x489/0x15e0
>   ? trace_hardirqs_on+0x63/0x2d0
>   ? write_comp_data+0x2a/0x90
>   ? drm_mode_config_cleanup+0x890/0x890 [drm]
>   drm_managed_release+0x1fa/0x4f0 [drm]
>   drm_dev_release+0x72/0xb0 [drm]
>   devm_drm_dev_init_release+0x81/0xa0 [drm]
>   release_nodes+0xba/0x3b0
>   ...
>   entry_SYSCALL_64_after_hwframe+0x44/0xae
>
> and then an error message:
>
> [drm:drm_mode_config_cleanup [drm]] *ERROR* connector SPI-1 leaked!
>
> When krealloc() in drm_client_modeset_probe() fails, it
> goes to the label 'free_connectors'. However, krealloc()
> is between drm_connector_list_iter_begin() and *_end().
> Going to the label directly is not a good idea. Because
> iter->conn is not cleaned up if so. Fix the problem by
> going to the label outside drm_connector_list_iter_end().
>
> Signed-off-by: He Ying <heying24@huawei.com>
> ---
>   drivers/gpu/drm/drm_client_modeset.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index ced09c7c06f9..7ac88ae93f38 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -789,7 +789,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>   		tmp = krealloc(connectors, (connector_count + 1) * sizeof(*connectors), GFP_KERNEL);
>   		if (!tmp) {
>   			ret = -ENOMEM;
> -			goto free_connectors;
> +			break;
>   		}
>   
>   		connectors = tmp;
> @@ -798,6 +798,9 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>   	}
>   	drm_connector_list_iter_end(&conn_iter);
>   
> +	if (ret)
> +		goto free_connectors;
> +
>   	if (!connector_count)
>   		return 0;
>   
