Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4F04445F4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 17:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D4F73950;
	Wed,  3 Nov 2021 16:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1951 seconds by postgrey-1.36 at gabe;
 Wed, 03 Nov 2021 16:30:50 UTC
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com
 [IPv6:2620:100:9001:583::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AE773950;
 Wed,  3 Nov 2021 16:30:50 +0000 (UTC)
Received: from pps.filterd (m0122332.ppops.net [127.0.0.1])
 by mx0a-00190b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A3EFwAM004710;
 Wed, 3 Nov 2021 15:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=K5MB/afSy0GjtB5qyrUWeIQGAcQDhFtW4eDszHTa6tY=;
 b=fQu/eDLXkxof7l6jV9tpylDxn6MmJ1jx9fH6syLPFjfsnnBJTNEUzulHhB0ZHGjmtvWp
 NyGAWtR2AFR46DYveuJUohDKb1gTE4j3EmZNHWS1dAUtlcz9Xyc/Qv3sP50Ghda7dUJO
 ErdNEYLj758LBwpLNR1lUlg3ccoRtqb7h7y6Khd3MTNu4xHtHqIBEt4+Ga9TaLJAR+Le
 UFrhsAVgb95meWrCfkXBj0x/xQ6n/32ZOZnT1bh2DjMLpIPAnvQjpLHnCQ9xQ/Cy0CML
 YTwJgilx+TnnyHmzWXcVYbW8yGCiiavU+ZVqcbGqfGI9zdrsedEi2W0IFGBzbgPZXgLz 1g== 
Received: from prod-mail-ppoint8
 (a72-247-45-34.deploy.static.akamaitechnologies.com [72.247.45.34] (may be
 forged))
 by mx0a-00190b01.pphosted.com (PPS) with ESMTPS id 3c3dchdntc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 15:58:12 +0000
Received: from pps.filterd (prod-mail-ppoint8.akamai.com [127.0.0.1])
 by prod-mail-ppoint8.akamai.com (8.16.1.2/8.16.1.2) with SMTP id
 1A3FoKtI012361; Wed, 3 Nov 2021 11:58:11 -0400
Received: from prod-mail-relay18.dfw02.corp.akamai.com ([172.27.165.172])
 by prod-mail-ppoint8.akamai.com with ESMTP id 3c39aux7e9-1;
 Wed, 03 Nov 2021 11:58:11 -0400
Received: from [0.0.0.0] (unknown [172.27.119.138])
 by prod-mail-relay18.dfw02.corp.akamai.com (Postfix) with ESMTP id 7D857168;
 Wed,  3 Nov 2021 15:58:10 +0000 (GMT)
Subject: Re: [PATCH v9 10/10] drm: use DEFINE_DYNAMIC_DEBUG_TRACE_CATEGORIES
 bitmap to tracefs
To: Jim Cromie <jim.cromie@gmail.com>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20211027043645.153133-1-jim.cromie@gmail.com>
 <20211027043645.153133-11-jim.cromie@gmail.com>
From: Jason Baron <jbaron@akamai.com>
Message-ID: <3a55ab9c-8109-8025-21e3-e3635bd891b2@akamai.com>
Date: Wed, 3 Nov 2021 11:58:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211027043645.153133-11-jim.cromie@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-11-03_05:2021-11-03,
 2021-11-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111030090
X-Proofpoint-GUID: LdcoH8ebA5GhSST3D52LB7GgMum2xmNl
X-Proofpoint-ORIG-GUID: LdcoH8ebA5GhSST3D52LB7GgMum2xmNl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_05,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111030090
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



On 10/27/21 12:36 AM, Jim Cromie wrote:
> Use new macro to create a sysfs control bitmap knob to control
> print-to-trace in: /sys/module/drm/parameters/trace
> 
> todo: reconsider this api, ie a single macro expecting both debug &
> trace terms (2 each), followed by a single description and the
> bitmap-spec::
> 
> Good: declares bitmap once for both interfaces
> 
> Bad: arg-type/count handling (expecting 4 args) is ugly,
>      especially preceding the bitmap-init var-args.
> 

Hi Jim,

I agree having the bitmap declared twice seems redundant. But I like having fewer args and not necessarily combining the trace/log variants of
DEBUG_CATEGORIES. hmmm...what if the DEFINE_DYNAMIC_DEBUG_CATEGORIES() took a pointer to the array of struct dyndbg_bitdesc map[] directly as the
final argument instead of the __VA_ARGS__? Then, we could just declare the map once?

Thanks,

-Jason

> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  drivers/gpu/drm/drm_print.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index ce662d0f339b..7b49fbc5e21d 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -73,6 +73,25 @@ DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug, __drm_debug,
>  				[7] = { DRM_DBG_CAT_LEASE },
>  				[8] = { DRM_DBG_CAT_DP },
>  				[9] = { DRM_DBG_CAT_DRMRES });
> +
> +#ifdef CONFIG_TRACING
> +unsigned long __drm_trace;
> +EXPORT_SYMBOL(__drm_trace);
> +DEFINE_DYNAMIC_DEBUG_TRACE_CATEGORIES(trace, __drm_trace,
> +				      DRM_DEBUG_DESC,
> +				      [0] = { DRM_DBG_CAT_CORE },
> +				      [1] = { DRM_DBG_CAT_DRIVER },
> +				      [2] = { DRM_DBG_CAT_KMS },
> +				      [3] = { DRM_DBG_CAT_PRIME },
> +				      [4] = { DRM_DBG_CAT_ATOMIC },
> +				      [5] = { DRM_DBG_CAT_VBL },
> +				      [6] = { DRM_DBG_CAT_STATE },
> +				      [7] = { DRM_DBG_CAT_LEASE },
> +				      [8] = { DRM_DBG_CAT_DP },
> +				      [9] = { DRM_DBG_CAT_DRMRES });
> +
> +struct trace_array *trace_arr;
> +#endif
>  #endif
>  
>  void __drm_puts_coredump(struct drm_printer *p, const char *str)
> 
