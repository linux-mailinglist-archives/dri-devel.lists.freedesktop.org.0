Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE7151C16
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 15:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97FA6E831;
	Tue,  4 Feb 2020 14:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA496E831
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 14:25:09 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 014ENBmn174690;
 Tue, 4 Feb 2020 14:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2019-08-05;
 bh=GbQTCyVdlnKW8gqe/lplcRNTR3wgolWgH9HN9BHKhlc=;
 b=JKG3ZmkOgtIGqReiXNLloVNM1/F/dkbhJaFcdn6Jc7iQWxtznsVsGHdX1bvpQ6L3qAMA
 YPSciqjpfYPEAWLkr+7VpE6kJDFvrS7UnGdbZMPgGpdKn4NkIcHBf1vS/TBuXHkWeHlu
 9mtR/SwggKlfXpZwuNczf/M2/ZGI1QY39e7MRtwf0+jqxuFiRk+35O4MPmVasTafXT1C
 CXk1KozuF/cGPTEkivC1yzQic/QQwvwXYhA4CzkxoF5cXLnY7mxCzh3KWt0EAX21bgwq
 /xjANincJ8IdU0qgAc/U0ml+/u61zt2m04GipPGRgD1so6XiY3GFfx5J1I0WJuoCRnOz kw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2xwyg9k68n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Feb 2020 14:25:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 014ENd6c126217;
 Tue, 4 Feb 2020 14:25:05 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2xxvy32jw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Feb 2020 14:25:05 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 014EP4Jj023821;
 Tue, 4 Feb 2020 14:25:04 GMT
Received: from kadam (/129.205.23.165) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 04 Feb 2020 06:25:03 -0800
Date: Tue, 4 Feb 2020 17:24:58 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [bug report] drm/ttm: fix re-init of global structures
Message-ID: <20200204142457.GP11068@kadam>
References: <20200204125741.lwg526qxwn5gn5ux@kili.mountain>
 <c83eb759-3ca9-64a6-d40c-32786304d82c@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c83eb759-3ca9-64a6-d40c-32786304d82c@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002040102
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002040102
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 04, 2020 at 03:03:43PM +0100, Christian K=F6nig wrote:
> Am 04.02.20 um 13:57 schrieb Dan Carpenter:
> > Hello Christian K=F6nig,
> > =

> > The patch bd4264112f93: "drm/ttm: fix re-init of global structures"
> > from Apr 16, 2019, leads to the following static checker warning:
> > =

> > 	drivers/gpu/drm/ttm/ttm_bo.c:1610 ttm_bo_global_release()
> > 	warn: passing freed memory 'glob'
> > =

> > drivers/gpu/drm/ttm/ttm_bo.c
> >    1591  static void ttm_bo_global_kobj_release(struct kobject *kobj)
> >    1592  {
> >    1593          struct ttm_bo_global *glob =3D
> >    1594                  container_of(kobj, struct ttm_bo_global, kobj);
> >    1595
> >    1596          __free_page(glob->dummy_read_page);
> >    1597  }
> >    1598
> >    1599  static void ttm_bo_global_release(void)
> >    1600  {
> >    1601          struct ttm_bo_global *glob =3D &ttm_bo_glob;
> >    1602
> >    1603          mutex_lock(&ttm_global_mutex);
> >    1604          if (--ttm_bo_glob_use_count > 0)
> >    1605                  goto out;
> >    1606
> >    1607          kobject_del(&glob->kobj);
> >    1608          kobject_put(&glob->kobj);
> >    1609          ttm_mem_global_release(&ttm_mem_glob);
> >    1610          memset(glob, 0, sizeof(*glob));
> >                         ^^^^^^^^^^^^^^^^^^^^^^
> > Depending on the config kobject_release() might call ttm_bo_global_kobj=
_release()
> > a few seconds after this memset.  Maybe put the memset into
> > ttm_bo_global_kobj_release()?
> =

> That's not possible. The object might be re-used directly after we drop t=
he
> ttm_global_mutex.
> =


Hm...  That sucks.  If we reallocate glob->dummy_read_page before the
ttm_bo_global_kobj_release() gets called then we're toasted.

> How can we wait for the ttm_mem_global_release() to have finished?
> =


A bunch of these release functions use a completion.  But you probably
don't want a four second delay before we can re-use the struct.

regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
