Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F0034A376
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 09:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38316EF33;
	Fri, 26 Mar 2021 08:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C14B6EF33
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 08:57:56 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12Q8t9RM094198;
 Fri, 26 Mar 2021 08:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=WjhOVKUC8REblOi978N8SMuPwZdNnG/6fpyZcwsvfjk=;
 b=eQ9wAwgZL/OsedhwtFyZ2HuKNxE4ZbK2c3U0+BmwlVV8HxhyOkxcgvyfIFy7s5N1nDne
 NFxrVGURJ4XEIo0rafitD/igO9Rkjag0ABRFVYcO+Xy3U/TNCCq9oKNESOtvLAtNqxu5
 uGCwChDz6hiIQ14Pymb2L7aFQRDDsEbD23rGejnZYup/wz1JjzVyHiyVtRYP0cMcB8OA
 oQwqn4S8N/+2VLIOlQPPqPXtfcWDGKeSFRPXItfdbDtkWcSoelcuWqDeD59DgtYtCbNg
 P7dY7lNKOh5zosQbHdAqWRM2LBhstrj+mwaB/lVbUw6y5m17dXnpL07vSYrCBEyVeSjm tg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 37h13hscvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 08:57:53 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12Q8pLQc146544;
 Fri, 26 Mar 2021 08:57:51 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 37h14158jm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 08:57:51 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12Q8vmZ2029247;
 Fri, 26 Mar 2021 08:57:49 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 26 Mar 2021 08:57:48 +0000
Date: Fri, 26 Mar 2021 11:57:42 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: christian.koenig@amd.com
Subject: [bug report] drm/ttm: switch to per device LRU lock
Message-ID: <YF2iBm5KR+q0IWuQ@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260065
X-Proofpoint-GUID: QoE1tIGO7PCLCI_gftOhDib3kn7mqJ7K
X-Proofpoint-ORIG-GUID: QoE1tIGO7PCLCI_gftOhDib3kn7mqJ7K
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=987
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260065
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

This is a semi-automatic email about new static checker warnings.

The patch a1f091f8ef2b: "drm/ttm: switch to per device LRU lock" from
Oct 6, 2020, leads to the following Smatch complaint:

    drivers/gpu/drm/ttm/ttm_bo.c:665 ttm_mem_evict_first()
    error: we previously assumed 'bo' could be null (see line 662)

drivers/gpu/drm/ttm/ttm_bo.c
   661	=

   662		if (!bo) {
                     ^^
"bo" is NULL

   663			if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
   664				busy_bo =3D NULL;
   665			spin_unlock(&bo->bdev->lru_lock);
                                     ^^^^^^^^^^^^^^^^^^
Dereference

   666			ret =3D ttm_mem_evict_wait_busy(busy_bo, ctx, ticket);
   667			if (busy_bo)

regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
