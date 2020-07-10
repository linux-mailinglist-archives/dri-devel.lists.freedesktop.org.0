Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB9721B44B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 13:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123FD6EBDE;
	Fri, 10 Jul 2020 11:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D3C6EBDE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 11:53:14 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06ABquBV148648;
 Fri, 10 Jul 2020 11:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=C4KOdioGID3KkINMUf3JFZXNwg5corD+Tc/xf6lh9pw=;
 b=Kqke8ZNtFmwbAe6ST3zxPECdH6KWUAhWI9m90mkZdqdRVh1oiP2BNBgHwHBA96onc1Z6
 zgaM422Jlyvr9dKinF8z+PUqA6TUSufPNZ+8jcikJl5t1iOkIITiaAcQYOzIEJoUnBVs
 WloQEJp664jcbg6UqoRz7+JxIEuD/gMq2fE9qqnd7rPAy5Z7Ze6nAwIPAE5rpLJH2ku9
 CtJKTYT6e4mzyiu2Dr7/GatSdDARQffvKrNxoVm92Q64cMeS0ieXZ1Cf3wwjVm0WnBgI
 2lxCH3Y83mIJw2d66rfW+k3p1mcMXFAyB9JB2mUOfPQEimjtAp31l7mEctFDRT3wIZza Fg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 325y0aq1ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 10 Jul 2020 11:53:01 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06ABhNtf073516;
 Fri, 10 Jul 2020 11:53:01 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 325k3k6980-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jul 2020 11:53:01 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06ABqnpH026283;
 Fri, 10 Jul 2020 11:52:49 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 10 Jul 2020 04:52:48 -0700
Date: Fri, 10 Jul 2020 14:52:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Subject: Re: KASAN: use-after-free Read in drm_gem_object_release
Message-ID: <20200710115240.GI2571@kadam>
References: <CAFcO6XO58pV+j9gu5Hha3JUW555EPQo6ELTvxRyQ5PWu_1gsUA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFcO6XO58pV+j9gu5Hha3JUW555EPQo6ELTvxRyQ5PWu_1gsUA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9677
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007100084
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9677
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 clxscore=1011
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007100085
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
Cc: robdclark@chromium.org, security@kernel.org, airlied@linux.ie,
 syzkaller-bugs@googlegroups.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, seanpaul@chromium.org, sam@ravnborg.org,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 10, 2020 at 04:24:03PM +0800, butt3rflyh4ck wrote:
> I report a bug (in linux-5.8.0-rc4) found by syzkaller.
> 
> kernel config: https://github.com/butterflyhack/syzkaller-fuzz/blob/master/v5.8.0-rc4.config
> 
> I test the reproducer and crash too.
> 
> In the drm_em_vram_t() function,  ttm_bo_init() function call
         ^^^^^^^^^^^^^
This a typo.  The function name is drm_gem_vram_init().

> ttm_bo_init_reserved(),
> the ttm_bo_init_reserved() function  call ttm_bo_put(), it will free
> gbo->bo that is struct ttm_buffer_object.
> 
> then, goto the err_drm_gem_object_release lable,
> drm_gem_object_release() function will free gbo->bo.base, so cause use
> after free.
> 

There is a third free in drm_gem_vram_create().  This is a triple free
bug.  The correct place to free this is in drm_gem_vram_create() because
that's where it was allocated.

This code is quite subtle so I'm not going to attempt to fix it because
I can't test it.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
