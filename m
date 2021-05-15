Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B3D381796
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 12:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28996E0A5;
	Sat, 15 May 2021 10:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1555 seconds by postgrey-1.36 at gabe;
 Sat, 15 May 2021 10:19:28 UTC
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D616E0A5
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 10:19:28 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14F9gIg8165199;
 Sat, 15 May 2021 09:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=cC0VbieU0fURlMvLGTqBnhPm6Ssy7wNrIv5JnQEAHeg=;
 b=vxykoURWVMrBd6CgsCNSbw8+imcpJY3wsXCDq6CCKkt+Pqk90ekJhE5t8IsRAEGr45Ar
 YvLNySRPlgD77inPK+uXpXxSXli+CviW/xthS1RcFeVu+cQxWRWqrVhJul9YCQ1c1nsZ
 djg8SFlcpoKZIYUzaC0qRPgkU/+MZOyYgOuAPZl37Lw7w8pHWKbJDqL7wMYuntilrfTv
 rRYOTxAMVvm9Z7JlOpvH+nkI3wzU3rKzFGvmVWJBceaSYJMjjo0Kz6WXky+0VukswuAX
 KIJrTr6qk/Ntc0uj/7wxeni5pNgK2D5p6Y75W73C10CAoRF0E7cP+dOxabpysXJj/A6v aw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 38j68m8aau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 May 2021 09:53:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14F9e25S031443;
 Sat, 15 May 2021 09:53:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38j4b9qpfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 May 2021 09:53:26 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14F9rP9b049643;
 Sat, 15 May 2021 09:53:25 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 38j4b9qpfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 May 2021 09:53:25 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14F9rL58019846;
 Sat, 15 May 2021 09:53:21 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 15 May 2021 02:53:21 -0700
Date: Sat, 15 May 2021 12:53:15 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Airlie <airlied@linux.ie>
Subject: [PATCH] drm: simpledrm: fix a potential NULL dereference
Message-ID: <YJ+aC47XX58ICXax@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: oGI5P2fvJQkTrjOdeqVUQI_jF7Wv3Shl
X-Proofpoint-GUID: oGI5P2fvJQkTrjOdeqVUQI_jF7Wv3Shl
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9984
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105150068
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
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_format_info() function returns NULL if the format is
unsupported, but the simplefb_get_validated_format() is expected to
return error pointers.  If we propagate teh NULL return then it will
lead to a NULL dereference in the callers.  Swap the NULL and trade it
in for an ERR_PTR(-EINVAL).

Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index f72ca3a1c2d4..4f605c5fe856 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -72,6 +72,7 @@ simplefb_get_validated_format(struct drm_device *dev, const char *format_name)
 	static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
 	const struct simplefb_format *fmt = formats;
 	const struct simplefb_format *end = fmt + ARRAY_SIZE(formats);
+	const struct drm_format_info *info;
 
 	if (!format_name) {
 		drm_err(dev, "simplefb: missing framebuffer format\n");
@@ -79,8 +80,12 @@ simplefb_get_validated_format(struct drm_device *dev, const char *format_name)
 	}
 
 	while (fmt < end) {
-		if (!strcmp(format_name, fmt->name))
-			return drm_format_info(fmt->fourcc);
+		if (!strcmp(format_name, fmt->name)) {
+			info = drm_format_info(fmt->fourcc);
+			if (!info)
+				return ERR_PTR(-EINVAL);
+			return info;
+		}
 		++fmt;
 	}
 
-- 
2.30.2

