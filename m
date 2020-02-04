Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A05151AE1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 13:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895176E81F;
	Tue,  4 Feb 2020 12:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA78B6E81F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 12:57:55 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 014CmnDD091846;
 Tue, 4 Feb 2020 12:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2019-08-05;
 bh=ZCETIb+rny2siDsoaTsK25NryhTFq0qvZOIaUa16wPE=;
 b=DSuOCMmESlMI4e54g0d7puieXuzEdb+H3Ziwl30pJeg4ruHo8K0sNQmF9E2mDJFpzWDS
 nyWrV9s0sDj1yFkUK5GQM9RbSNTMF2gQnWjP53Opm+NPA6jo9LFOdFjoDCBkZZUi/yVw
 bPdsHoeInzxumFx229GaaFCDMve8mJJkHKJS2YKUNRBRGu9Cx8U5TR3V6nNGcsoKfjbp
 xuOyB4N6GuvIWwlrMn43jnYwgsfXmLO44+q7KiBRR23p4iXiIF7mQ/b35884eQ32VT40
 X0We/8dTWoT12KNH8YFnO8oh+RkqgUjOV48SpgLYVJcdQuQyqvfHBjfsuAGB5vJpMOgY Vw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2xwyg9jpcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Feb 2020 12:57:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 014CnxKv116401;
 Tue, 4 Feb 2020 12:57:49 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2xxsbp7spb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Feb 2020 12:57:49 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 014Cvmml024326;
 Tue, 4 Feb 2020 12:57:48 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 04 Feb 2020 04:57:47 -0800
Date: Tue, 4 Feb 2020 15:57:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: christian.koenig@amd.com
Subject: [bug report] drm/ttm: fix re-init of global structures
Message-ID: <20200204125741.lwg526qxwn5gn5ux@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=784
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002040091
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=847 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002040091
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

Hello Christian K=F6nig,

The patch bd4264112f93: "drm/ttm: fix re-init of global structures"
from Apr 16, 2019, leads to the following static checker warning:

	drivers/gpu/drm/ttm/ttm_bo.c:1610 ttm_bo_global_release()
	warn: passing freed memory 'glob'

drivers/gpu/drm/ttm/ttm_bo.c
  1591  static void ttm_bo_global_kobj_release(struct kobject *kobj)
  1592  {
  1593          struct ttm_bo_global *glob =3D
  1594                  container_of(kobj, struct ttm_bo_global, kobj);
  1595  =

  1596          __free_page(glob->dummy_read_page);
  1597  }
  1598  =

  1599  static void ttm_bo_global_release(void)
  1600  {
  1601          struct ttm_bo_global *glob =3D &ttm_bo_glob;
  1602  =

  1603          mutex_lock(&ttm_global_mutex);
  1604          if (--ttm_bo_glob_use_count > 0)
  1605                  goto out;
  1606  =

  1607          kobject_del(&glob->kobj);
  1608          kobject_put(&glob->kobj);
  1609          ttm_mem_global_release(&ttm_mem_glob);
  1610          memset(glob, 0, sizeof(*glob));
                       ^^^^^^^^^^^^^^^^^^^^^^
Depending on the config kobject_release() might call ttm_bo_global_kobj_rel=
ease()
a few seconds after this memset.  Maybe put the memset into
ttm_bo_global_kobj_release()?

  1611  out:
  1612          mutex_unlock(&ttm_global_mutex);
  1613  }


regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
