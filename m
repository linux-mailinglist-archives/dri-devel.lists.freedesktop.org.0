Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB8215923A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 15:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAA26EE6F;
	Tue, 11 Feb 2020 14:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1566EE6F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 14:49:46 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01BEn0gd067964;
 Tue, 11 Feb 2020 14:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=9dDlhRQUDHsijG4F1K6tx2R08XvO6UhPJPs/yTBV7vo=;
 b=e+8+yhMCaEBPFrMJUm/+l0clY9Jv64WOnyEddpeb1gBIvwc7MBZGH+4OcsHXAwCip5rS
 WT1pwiGvRAVQ+7QQLgPAoLTnwImjr3XYr3lwWrGJu4D2tzk1WhvwgU8wicPz0X5SMTG3
 HFida+opMuzYZ4JFqaCHJGD/QxgIfmXiuCvWfpEkvLw2jnwtDYVxujj0qwPmlWTuSaBW
 6STGVcDk+iVq4BessNx/ewU9Z82oE1zQZPpGufMlyE1iYvQ1FW/89OyT+QLwys3+74UP
 y7yxPJOiOlnkkg7flY2Xy8MrxL86iosLKy5pR+sJcoJ6D1Q4O0IrTnjS4tviDSfMUS+l kw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2y2p3sbnnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 11 Feb 2020 14:49:41 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01BEkxXq038416;
 Tue, 11 Feb 2020 14:49:41 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2y26fhabvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Feb 2020 14:49:41 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01BEneVA012343;
 Tue, 11 Feb 2020 14:49:40 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 11 Feb 2020 06:49:39 -0800
Date: Tue, 11 Feb 2020 17:49:34 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: ramalingam.c@intel.com
Subject: [bug report] drm: revocation check at drm subsystem
Message-ID: <20200211144933.3eklbzd57yswbtl2@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9527
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=1
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=859 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002110111
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9527
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 suspectscore=1 mlxlogscore=923 priorityscore=1501 clxscore=1011
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002110111
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Ramalingam C,

The patch 6498bf5800a3: "drm: revocation check at drm subsystem" from
May 7, 2019, leads to the following static checker warning:

	drivers/gpu/drm/drm_hdcp.c:195 drm_hdcp_parse_hdcp2_srm()
	warn: mask and shift to zero

drivers/gpu/drm/drm_hdcp.c
   190                  DRM_ERROR("No vrl found\n");
   191                  return -EINVAL;
   192          }
   193  
   194          buf += DRM_HDCP_2_VRL_LENGTH_SIZE;
   195          ksv_count = (*buf << 2) | DRM_HDCP_2_KSV_COUNT_2_LSBITS(*(buf + 1));
                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This macro is always zero.

   196          if (!ksv_count) {
   197                  DRM_DEBUG("Revoked KSV count is 0\n");
   198                  return count;
   199          }
   200  

The define is:

#define DRM_HDCP_2_KSV_COUNT_2_LSBITS(byte)     (((byte) & 0xC) >> 6)

0xC >> 6 is always zero.

regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
