Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3CA18F428
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 13:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515A0891FF;
	Mon, 23 Mar 2020 12:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440B5891FF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 12:13:55 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02NC93o0189136;
 Mon, 23 Mar 2020 12:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=W9jjKlQAG2k83s+alWeFfDXYHk89uSOQ24dLS8wPCME=;
 b=sUfY4cgHMN8JN/m0Dykz70xWJD2LciCrJIvCmOEW+jMyUl0nSPDOkC2iQ8FhX66KqI4/
 2n/vcZx5EKCcufISZn1ihBMnN2ytm0SXqMe/9VZpY8+cmcWVyVrBpiEVC0Ngwy2fcxjj
 ck9IhlzJ93VRoOrrka89y9IiUeIeKDf7mk9+MFNZcuskyxO3V5sIYIMo74yAFycDVxr3
 AI6CzIE7iZWcLnHRsyhs2B6JfSiDArpwo+dbQCaUKPifURZ0sm24/idZ+xeNUfdMuUEI
 rPdIW6rSKvuCsPdX8HXAq6cAN3dBOr/sJbP4xHdSYFKXmwIAo++IiZrxoQoJt0sKcjLS hQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2ywavkx5sb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 12:13:47 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02NCBM8i193405;
 Mon, 23 Mar 2020 12:13:46 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2ywvdbymne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 12:13:46 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02NCDhEG004849;
 Mon, 23 Mar 2020 12:13:43 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 23 Mar 2020 05:13:43 -0700
Date: Mon, 23 Mar 2020 15:13:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm/gem: Fix a leak in drm_gem_objects_lookup()
Message-ID: <20200323121333.GF26299@kadam>
References: <20200320132334.GC95012@mwanda>
 <CACvgo51xwgF2hJPOESWGpJ16WittQSVixdd+62KwFsZaHO-Dpg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo51xwgF2hJPOESWGpJ16WittQSVixdd+62KwFsZaHO-Dpg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9568
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003230071
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9568
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003230071
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 23, 2020 at 11:13:22AM +0000, Emil Velikov wrote:
> Hi Dan,
> 
> On Fri, 20 Mar 2020 at 13:23, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > If the "handles" allocation or the copy_from_user() fails then we leak
> > "objs".  It's supposed to be freed in panfrost_job_cleanup().
> >
> > Fixes: c117aa4d8701 ("drm: Add a drm_gem_objects_lookup helper")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/drm_gem.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index a9e4a610445a..f28724f2eb69 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -710,6 +710,8 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> >         if (!objs)
> >                 return -ENOMEM;
> >
> > +       *objs_out = objs;
> > +
> >         handles = kvmalloc_array(count, sizeof(u32), GFP_KERNEL);
> >         if (!handles) {
> >                 ret = -ENOMEM;
> > @@ -723,8 +725,6 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> >         }
> >
> >         ret = objects_lookup(filp, handles, count, objs);
> > -       *objs_out = objs;
> > -
> >  out:
> >         kvfree(handles);
> >         return ret;
> 
> It seems that this will return error to the caller, mangle the output
> pointer and effectively still leak the objs.

The patch works.

This is "one function frees everything" style error handling.  It gets
passed back to panfrost_ioctl_submit() which calls panfrost_job_put()
which calls panfrost_job_cleanup() which frees it.

It's a horrible way to do error handling but this was the only actual
bug I could see with the approach.

> Better option IMHO is to:
> - move the __user/copy_from_user into the caller
> Removes a silly kvmalloc_array(1,...) in ~90+ users and drops the "out" label.
> Extra bonus, this is the only instance in drm_gem with __user -
> consistency is nice.
> - add "err" or similar label, where the objs is freed before returning an error.

Those sound like good ideas.  Also we could use kvcalloc() instead of
kvmalloc_array() with __GFP_ZERO.  But it's too much for me to do...
I'm mostly focused on static analysis warnings.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
