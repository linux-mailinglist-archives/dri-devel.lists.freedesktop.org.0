Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287281831BC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 14:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87C56EABE;
	Thu, 12 Mar 2020 13:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669366EABB;
 Thu, 12 Mar 2020 13:39:08 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02CDE0s4158349;
 Thu, 12 Mar 2020 13:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=7iLVrV7AP0thjT8x8OkA4+ouxS7s/jxo7fgh9+ubWsY=;
 b=CiWLzRyI5RgydfyMrSLmJQV+vFsSQYfLwiwagRd1FIxq210dT7JkJBhh9Z/GLQXAy5x7
 EuZpoZHZE/4EcWEqTrQQ6TnWsqq4F2fTgb1E+sQs4Tyfgerk5txEFiLYsanMvM910e08
 Dq4LKfSj+nPvc6vU5BRTAlOAwcA3kk1Q2pZf3nrPNdciphgRmk/QFVE7aE/saVrv2Fte
 KerJzepInzNJ9E9OVzC1ySvSAA1lTaPbjiUJLtOC20PjbhiaNtAYLo08OzErWVK3l9t7
 jFZol+R+eF4G9HobM+T/Fv+9kHC1vKjqy3Aw0P/cawQenwVYBdn1j8py6oMIP9tFFFEI Ng== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2yqkg88tfs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Mar 2020 13:38:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02CDcFkn005506;
 Thu, 12 Mar 2020 13:38:58 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2yqkvmpx8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Mar 2020 13:38:58 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02CDcogX008791;
 Thu, 12 Mar 2020 13:38:51 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Mar 2020 06:38:50 -0700
Date: Thu, 12 Mar 2020 16:38:42 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Walter Harms <wharms@bfs.de>
Subject: Re: [PATCH] drm/amdgpu/display: Fix an error handling path in
 'dm_update_crtc_state()'
Message-ID: <20200312133842.GI11561@kadam>
References: <20200308092637.8194-1-christophe.jaillet@wanadoo.fr>
 <97d88948e2ab4ec19c5a0c6d064df08b@bfs.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <97d88948e2ab4ec19c5a0c6d064df08b@bfs.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9557
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003120073
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9557
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003120072
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
Cc: "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "Bhawanpreet.Lakha@amd.com" <Bhawanpreet.Lakha@amd.com>,
 "David.Francis@amd.com" <David.Francis@amd.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 09, 2020 at 08:24:04AM +0000, Walter Harms wrote:
> =

> ________________________________________
> Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.ke=
rnel.org> im Auftrag von Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Gesendet: Sonntag, 8. M=E4rz 2020 10:26
> An: harry.wentland@amd.com; sunpeng.li@amd.com; alexander.deucher@amd.com=
; christian.koenig@amd.com; David1.Zhou@amd.com; airlied@linux.ie; daniel@f=
fwll.ch; nicholas.kazlauskas@amd.com; Bhawanpreet.Lakha@amd.com; mario.klei=
ner.de@gmail.com; David.Francis@amd.com
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux=
-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org; Christophe JAILLET
> Betreff: [PATCH] drm/amdgpu/display: Fix an error handling path in 'dm_up=
date_crtc_state()'
> =

> 'dc_stream_release()' may be called twice. Once here, and once below in t=
he
> error handling path if we branch to the 'fail' label.
> =

> Set 'new_stream' to NULL, once released to avoid the duplicated release
> function call.
> =

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Maybe the 'goto fail' at line 7745 should be turned into a 'return ret'
> instead. Could be clearer.
> =

> No Fixes tag provided because I've not been able to dig deep enough in the
> git history.
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 97c1b01c0fc1..9d7773a77c4f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7704,8 +7704,10 @@ static int dm_update_crtc_state(struct amdgpu_disp=
lay_manager *dm,
> =

>  skip_modeset:
>         /* Release extra reference */
> -       if (new_stream)
> -                dc_stream_release(new_stream);
> +       if (new_stream) {
> +               dc_stream_release(new_stream);
> +               new_stream =3D NULL;
> +       }
> =

> =

> dc_stream_release() is NULL-checked, so the if can be dropped.
> =

> re,
>  wh

Walter, it's really hard to separate your reply from the quoted email.
What's going on with that?  Could you configure your email client to
use "> " for the quoted bit?

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
