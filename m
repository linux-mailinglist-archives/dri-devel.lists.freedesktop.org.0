Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B78E47C14
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 10:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B4F8915B;
	Mon, 17 Jun 2019 08:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903B689151;
 Mon, 17 Jun 2019 08:22:39 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5H8EDPq036975;
 Mon, 17 Jun 2019 08:22:24 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2t4r3td2pj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 08:22:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5H8LV8W126648;
 Mon, 17 Jun 2019 08:22:24 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2t59gd3q66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 08:22:24 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5H8M5I4026605;
 Mon, 17 Jun 2019 08:22:05 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 Jun 2019 01:22:05 -0700
Date: Mon, 17 Jun 2019 11:21:48 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: use exact allocation for dma coherent memory
Message-ID: <20190617082148.GF28859@kadam>
References: <20190614134726.3827-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614134726.3827-1-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9290
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=782
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906170078
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9290
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=820 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906170078
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=FGXkU7eOmJXcfpTdOS3rFhVnp4//dWioBuU5JvbAozk=;
 b=HoOGFZ6IDRsf/WaCfXo2ZTPgY5pwDJWXjo1xX+qTvLOMlZocWpKu1Sf00Bmkx3VFzyma
 10WCt0cIJkIFz7mHW+wD9GUOEQ0ivHG8jDJ0t4TRvpEWC+TsmSyquhiRY045QRVvKMqd
 BIDabSi8xq4vX0L9MhRibAwTnUvf3DfPIk//8VY7MahBLoeLEZ2KraHUQ39ijiOHMNDT
 8ndBBvPX7iRqpB2l3z33gYX+RiPyyzfIf8yD1/MNNifpDFIZvAldxXl3FHTYVYXdGTMe
 /6jx2aoi8UlUxIMQRg+jUh/JipGQ+5QpEWrsTOM8x9vyDm7cYa5WG5PQ0L40CVIPJPpn iA== 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 linux-rdma@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-media@vger.kernel.org, Intel Linux Wireless <linuxwifi@intel.com>,
 intel-gfx@lists.freedesktop.org, Ian Abbott <abbotti@mev.co.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBvbmNlIHdyb3RlIGEgU21hdGNoIGNoZWNrIGJhc2VkIG9uIGEgY29tbWl0IG1lc3NhZ2UgdGhh
dCBzYWlkIHdlIGNhbid0CnBhc3MgZG1hX2FsbG9jX2NvaGVyZW50KCkgcG9pbnRlcnMgdG8gdmly
dF90b19waHlzKCkuICBCdXQgdGhlbiBJIG5ldmVyCmZlbHQgbGlrZSBJIHVuZGVyc3Rvb2QgdGhl
IHJ1bGVzIGVub3VnaCB0byBhY3R1YWxseSByZXBvcnQgdGhlIHdhcm5pbmdzCmFzIGJ1Z3MuCgpk
cml2ZXJzL3BsYXRmb3JtL3g4Ni9kY2RiYXMuYzoxMDggc21pX2RhdGFfYnVmX3JlYWxsb2MoKSBl
cnJvcjogJ2J1ZicgY2FtZSBmcm9tIGRtYV9hbGxvY19jb2hlcmVudCgpIHNvIHdlIGNhbid0IGRv
IHZpcnRfdG9fcGh5cygpCmRyaXZlcnMvbmV0L2NhaWYvY2FpZl92aXJ0aW8uYzo0MTQgY2Z2X2Ny
ZWF0ZV9nZW5wb29sKCkgZXJyb3I6ICdjZnYtPmFsbG9jX2FkZHInIGNhbWUgZnJvbSBkbWFfYWxs
b2NfY29oZXJlbnQoKSBzbyB3ZSBjYW4ndCBkbyB2aXJ0X3RvX3BoeXMoKQpkcml2ZXJzL2luZmlu
aWJhbmQvaHcvY3hnYjQvcXAuYzoxMzUgYWxsb2NfaG9zdF9zcSgpIGVycm9yOiAnc3EtPnF1ZXVl
JyBjYW1lIGZyb20gZG1hX2FsbG9jX2NvaGVyZW50KCkgc28gd2UgY2FuJ3QgZG8gdmlydF90b19w
aHlzKCkKZHJpdmVycy9pbmZpbmliYW5kL2h3L2N4Z2I0L3FwLmM6MjcyIGNyZWF0ZV9xcCgpIGVy
cm9yOiAnd3EtPnJxLnF1ZXVlJyBjYW1lIGZyb20gZG1hX2FsbG9jX2NvaGVyZW50KCkgc28gd2Ug
Y2FuJ3QgZG8gdmlydF90b19waHlzKCkKZHJpdmVycy9pbmZpbmliYW5kL2h3L2N4Z2I0L3FwLmM6
MjYyOCBhbGxvY19zcnFfcXVldWUoKSBlcnJvcjogJ3dxLT5xdWV1ZScgY2FtZSBmcm9tIGRtYV9h
bGxvY19jb2hlcmVudCgpIHNvIHdlIGNhbid0IGRvIHZpcnRfdG9fcGh5cygpCmRyaXZlcnMvaW5m
aW5pYmFuZC9ody9vY3JkbWEvb2NyZG1hX3ZlcmJzLmM6NDk0IG9jcmRtYV9hbGxvY191Y29udGV4
dCgpIGVycm9yOiAnY3R4LT5haF90YmwudmEnIGNhbWUgZnJvbSBkbWFfYWxsb2NfY29oZXJlbnQo
KSBzbyB3ZSBjYW4ndCBkbyB2aXJ0X3RvX3BoeXMoKQoKZHJpdmVycy9pbmZpbmliYW5kL2h3L2N4
Z2I0L3FwLmMKICAgMTI5ICBzdGF0aWMgaW50IGFsbG9jX2hvc3Rfc3Eoc3RydWN0IGM0aXdfcmRl
diAqcmRldiwgc3RydWN0IHQ0X3NxICpzcSkKICAgMTMwICB7CiAgIDEzMSAgICAgICAgICBzcS0+
cXVldWUgPSBkbWFfYWxsb2NfY29oZXJlbnQoJihyZGV2LT5sbGRpLnBkZXYtPmRldiksIHNxLT5t
ZW1zaXplLAogICAxMzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICYo
c3EtPmRtYV9hZGRyKSwgR0ZQX0tFUk5FTCk7CiAgIDEzMyAgICAgICAgICBpZiAoIXNxLT5xdWV1
ZSkKICAgMTM0ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07CiAgIDEzNSAgICAgICAg
ICBzcS0+cGh5c19hZGRyID0gdmlydF90b19waHlzKHNxLT5xdWV1ZSk7CiAgIDEzNiAgICAgICAg
ICBkbWFfdW5tYXBfYWRkcl9zZXQoc3EsIG1hcHBpbmcsIHNxLT5kbWFfYWRkcik7CiAgIDEzNyAg
ICAgICAgICByZXR1cm4gMDsKICAgMTM4ICB9CgpJcyB0aGlzIGEgYnVnPwoKcmVnYXJkcywKZGFu
IGNhcnBlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
