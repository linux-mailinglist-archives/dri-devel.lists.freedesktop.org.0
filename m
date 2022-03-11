Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F8D4D68A2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 19:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5E210E597;
	Fri, 11 Mar 2022 18:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2502 seconds by postgrey-1.36 at gabe;
 Fri, 11 Mar 2022 18:45:29 UTC
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com
 [IPv6:2620:100:9001:583::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFA110E053;
 Fri, 11 Mar 2022 18:45:29 +0000 (UTC)
Received: from pps.filterd (m0122332.ppops.net [127.0.0.1])
 by mx0a-00190b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22BE4kqH005592;
 Fri, 11 Mar 2022 18:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=4zUSLOEHIApF4getnC8JhdtY9QouuGFkZs+Hkia8hHQ=;
 b=X/O2KxK2oW4Y0PATfyw/fi8gPNBVdsVXoPC+VDwDr22BDDWSjgkwErGVysHatzJxCm6o
 9Zy/aKWnyz9d1S3YqUZDONcK4Yf5JslbJR9vR8dJ4peF+ZSHBL1E8xEYnE+nOjIq7ijo
 o4HawdMvcsBZMS2YIDhcsxqae+wUhotWd86p+IXf39OtosSSx78KY7hkrqPUkuoils56
 yWkjXGVEEBKy6BRAhlUoA4rgrIh0dCJTuLDphHkQfwZuHlsoHQl7SwbQLU10UK/c06rG
 LSXUg25BMotdHCXlL3iCkiqxf3discLVeuiw3ZVqCtpCQPASAeF2HLquQVLfjnY7+O2g WA== 
Received: from prod-mail-ppoint7
 (a72-247-45-33.deploy.static.akamaitechnologies.com [72.247.45.33] (may be
 forged))
 by mx0a-00190b01.pphosted.com (PPS) with ESMTPS id 3er3mqa1hn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 18:03:40 +0000
Received: from pps.filterd (prod-mail-ppoint7.akamai.com [127.0.0.1])
 by prod-mail-ppoint7.akamai.com (8.16.1.2/8.16.1.2) with SMTP id
 22BHnAYv008913; Fri, 11 Mar 2022 13:03:39 -0500
Received: from prod-mail-relay19.dfw02.corp.akamai.com ([172.27.165.173])
 by prod-mail-ppoint7.akamai.com with ESMTP id 3em43442qy-1;
 Fri, 11 Mar 2022 13:03:39 -0500
Received: from [0.0.0.0] (prod-ssh-gw01.bos01.corp.akamai.com [172.27.119.138])
 by prod-mail-relay19.dfw02.corp.akamai.com (Postfix) with ESMTP id 5E5DA6009B; 
 Fri, 11 Mar 2022 18:03:38 +0000 (GMT)
Message-ID: <07aba584-ce62-ed58-29b5-0a2df78b7f1d@akamai.com>
Date: Fri, 11 Mar 2022 13:03:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/5] dyndbg: fix static_branch manipulation
Content-Language: en-US
To: Jim Cromie <jim.cromie@gmail.com>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
References: <20220311044756.425777-1-jim.cromie@gmail.com>
 <20220311044756.425777-2-jim.cromie@gmail.com>
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <20220311044756.425777-2-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-03-11_07:2022-03-11,
 2022-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203110087
X-Proofpoint-GUID: zPo83NQC2GhkaVrlXctmeZUqN0ex_B27
X-Proofpoint-ORIG-GUID: zPo83NQC2GhkaVrlXctmeZUqN0ex_B27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-11_07,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 impostorscore=0
 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0 mlxlogscore=999
 clxscore=1011 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203110089
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 vincent.whitchurch@axis.com, linux@rasmusvillemoes.dk,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 amd-gfx@lists.freedesktop.org, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/10/22 23:47, Jim Cromie wrote:
> In https://urldefense.com/v3/__https://lore.kernel.org/lkml/20211209150910.GA23668@axis.com/__;!!GjvTz_vk!HGKKoni4RVdEBgv_V0zPSNSX428bpf02zkCy2WbeQkBdVtp1QJqGX-lJYlRDGg$ 
> 
> Vincent's patch commented on, and worked around, a bug toggling
> static_branch's, when a 2nd PRINTK-ish flag was added.  The bug
> results in a premature static_branch_disable when the 1st of 2 flags
> was disabled.
> 
> The cited commit computed newflags, but then in the JUMP_LABEL block,
> failed to use that result, instead using just one of the terms in it.
> Using newflags instead made the code work properly.
> 
> This is Vincents test-case, reduced.  It needs the 2nd flag to work
> properly, but it's explanatory here.
> 
> pt_test() {
>     echo 5 > /sys/module/dynamic_debug/verbose
> 
>     site="module tcp" # just one callsite
>     echo " $site =_ " > /proc/dynamic_debug/control # clear it
> 
>     # A B ~A ~B
>     for flg in +T +p "-T #broke here" -p; do
> 	echo " $site $flg " > /proc/dynamic_debug/control
>     done;
> 
>     # A B ~B ~A
>     for flg in +T +p "-p #broke here" -T; do
> 	echo " $site $flg " > /proc/dynamic_debug/control
>     done
> }
> pt_test
> 
> Fixes: 84da83a6ffc0 dyndbg: combine flags & mask into a struct, simplify with it
> CC: vincent.whitchurch@axis.com
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> 
> --
> .drop @stable, no exposed bug.
> ---
>  lib/dynamic_debug.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index dd7f56af9aed..a56c1286ffa4 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -211,10 +211,11 @@ static int ddebug_change(const struct ddebug_query *query,
>  				continue;
>  #ifdef CONFIG_JUMP_LABEL
>  			if (dp->flags & _DPRINTK_FLAGS_PRINT) {
> -				if (!(modifiers->flags & _DPRINTK_FLAGS_PRINT))
> +				if (!(newflags & _DPRINTK_FLAGS_PRINT))
>  					static_branch_disable(&dp->key.dd_key_true);
> -			} else if (modifiers->flags & _DPRINTK_FLAGS_PRINT)
> +			} else if (newflags & _DPRINTK_FLAGS_PRINT) {
>  				static_branch_enable(&dp->key.dd_key_true);
> +			}
>  #endif
>  			dp->flags = newflags;
>  			v4pr_info("changed %s:%d [%s]%s =%s\n",



Hi Jim,

If iiuc this is currently a bug but could be if we add a second 'print' bit
such as for printing to the tracing logs. That said I agree that using 'newflags'
here makes the code more straightforward/readable. So this one is fine with
me.

Acked-by: Jason Baron <jbaron@akamai.com>

Thanks,

-Jason
