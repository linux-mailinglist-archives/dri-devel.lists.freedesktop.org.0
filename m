Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E573F8248
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 08:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552826E4F1;
	Thu, 26 Aug 2021 06:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 349 seconds by postgrey-1.36 at gabe;
 Wed, 25 Aug 2021 17:18:52 UTC
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com
 [IPv6:2620:100:9005:57f::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF3B6E3EE;
 Wed, 25 Aug 2021 17:18:51 +0000 (UTC)
Received: from pps.filterd (m0122331.ppops.net [127.0.0.1])
 by mx0b-00190b01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17PG73hK003607;
 Wed, 25 Aug 2021 18:18:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=4yn0oy8JsEetkmJH1qt8+NeoPl5RpCvCkxTeymmkeu8=;
 b=VlSK6+1hH5l2Yb77fXnQ6g4ksZO1d0TBYf1qvwgSU6kOcYivw5WUQpb1N4/JRm2EUt9G
 e3bJGL8LjDRfjN+sc1kVN7e+SJ9gnGiCCjByBjf0O61aMIJPcXtckb22/h0ysDYPbROW
 PrifL86bLPPSwczHgflnC5RQoElyVJFQHwbXP0qA7p8n6WyLapMMGk844M55b3tkq1KL
 9CGSpZvt0ClRxJQRGgz6xLTVcuwuL51DPkTee47Ox3zyiSICIIyEY+z61FsdaDQfgTfE
 vjB29jUgnqHXmZzDPcLKTSGf+Ihs3KmVDRkzb0tJPT6NwnukpDy1Upoju77GiS2lK2mZ yg== 
Received: from prod-mail-ppoint7
 (a72-247-45-33.deploy.static.akamaitechnologies.com [72.247.45.33] (may be
 forged)) by mx0b-00190b01.pphosted.com with ESMTP id 3anhh8mpsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 18:18:48 +0100
Received: from pps.filterd (prod-mail-ppoint7.akamai.com [127.0.0.1])
 by prod-mail-ppoint7.akamai.com (8.16.1.2/8.16.1.2) with SMTP id
 17PHCpZk029748; Wed, 25 Aug 2021 13:18:48 -0400
Received: from prod-mail-relay19.dfw02.corp.akamai.com ([172.27.165.173])
 by prod-mail-ppoint7.akamai.com with ESMTP id 3an3v2fbq9-1;
 Wed, 25 Aug 2021 13:18:48 -0400
Received: from [0.0.0.0] (prod-ssh-gw01.bos01.corp.akamai.com [172.27.119.138])
 by prod-mail-relay19.dfw02.corp.akamai.com (Postfix) with ESMTP id C8B9A6007A; 
 Wed, 25 Aug 2021 17:18:44 +0000 (GMT)
Subject: Re: [PATCH v6 00/11] use DYNAMIC_DEBUG to implement DRM.debug
To: Jim Cromie <jim.cromie@gmail.com>, gregkh@linuxfoundation.org,
 seanpaul@chromium.org, jeyu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20210822222009.2035788-1-jim.cromie@gmail.com>
From: Jason Baron <jbaron@akamai.com>
Message-ID: <7017599d-8e11-7bda-90df-3cbf39ef8f3b@akamai.com>
Date: Wed, 25 Aug 2021 13:18:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822222009.2035788-1-jim.cromie@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-25_06:2021-08-25,
 2021-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250101
X-Proofpoint-GUID: UoSSdnztWs5A6UFnB2lJ-dGQhhers6zK
X-Proofpoint-ORIG-GUID: UoSSdnztWs5A6UFnB2lJ-dGQhhers6zK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-25_07,2021-08-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250102
X-Agari-Authentication-Results: mx.akamai.com;
 spf=${SPFResult} (sender IP is 72.247.45.33)
 smtp.mailfrom=jbaron@akamai.com smtp.helo=prod-mail-ppoint7
X-Mailman-Approved-At: Thu, 26 Aug 2021 06:17:16 +0000
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



On 8/22/21 6:19 PM, Jim Cromie wrote:
> This patchset does 3 main things.
> 
> Adds DEFINE_DYNAMIC_DEBUG_CATEGORIES to define bitmap => category
> control of pr_debugs, and to create their sysfs entries.
> 
> Uses it in amdgpu, i915 to control existing pr_debugs according to
> their ad-hoc categorizations.
> 
> Plugs dyndbg into drm-debug framework, in a configurable manner.
> 
> v6: cleans up per v5 feedback, and adds RFC stuff:
> 
> - test_dynamic_debug.ko: uses tracer facility added in v5:8/9
> - prototype print-once & rate-limiting
> 
> Hopefully adding RFC stuff doesnt distract too much.


Hi Jim,

Yeah, I feel like the RFC patches should be in a separate series
unless there is a drm dependency for them?

Thanks,

-Jason


> 
> Jim Cromie (11):
>   moduleparam: add data member to struct kernel_param
>   dyndbg: add DEFINE_DYNAMIC_DEBUG_CATEGORIES and callbacks
>   i915/gvt: remove spaces in pr_debug "gvt: core:" etc prefixes
>   i915/gvt: use DEFINE_DYNAMIC_DEBUG_CATEGORIES to create "gvt:core:"
>     etc categories
>   amdgpu: use DEFINE_DYNAMIC_DEBUG_CATEGORIES to control categorized
>     pr_debugs
>   drm_print: add choice to use dynamic debug in drm-debug
>   drm_print: instrument drm_debug_enabled
>   amdgpu_ucode: reduce number of pr_debug calls
>   nouveau: fold multiple DRM_DEBUG_DRIVERs together
>   dyndbg: RFC add debug-trace callback, selftest with it. RFC
>   dyndbg: RFC add print-once and print-ratelimited features. RFC.
> 
>  drivers/gpu/drm/Kconfig                       |  13 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c     | 293 ++++++++-------
>  .../gpu/drm/amd/display/dc/core/dc_debug.c    |  44 ++-
>  drivers/gpu/drm/drm_print.c                   |  49 ++-
>  drivers/gpu/drm/i915/gvt/Makefile             |   4 +
>  drivers/gpu/drm/i915/gvt/debug.h              |  18 +-
>  drivers/gpu/drm/i915/i915_params.c            |  35 ++
>  drivers/gpu/drm/nouveau/nouveau_drm.c         |  36 +-
>  include/drm/drm_print.h                       | 148 ++++++--
>  include/linux/dynamic_debug.h                 |  81 ++++-
>  include/linux/moduleparam.h                   |  11 +-
>  lib/Kconfig.debug                             |  11 +
>  lib/Makefile                                  |   1 +
>  lib/dynamic_debug.c                           | 336 ++++++++++++++++--
>  lib/test_dynamic_debug.c                      | 279 +++++++++++++++
>  15 files changed, 1117 insertions(+), 242 deletions(-)
>  create mode 100644 lib/test_dynamic_debug.c
> 
