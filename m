Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4804A52427
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EED89EB7;
	Tue, 25 Jun 2019 07:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E5489EB7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 07:15:28 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5P7E6fe172871;
 Tue, 25 Jun 2019 07:14:08 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t9brt2cvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 07:14:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5P7DUmE166958;
 Tue, 25 Jun 2019 07:14:07 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2t9acbxgyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 07:14:07 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5P7E3pl020338;
 Tue, 25 Jun 2019 07:14:03 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 25 Jun 2019 00:14:02 -0700
Date: Tue, 25 Jun 2019 10:13:54 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] drm/mcde: Fix uninitialized variable
Message-ID: <20190625071354.GW18776@kadam>
References: <20190618115245.13915-1-linus.walleij@linaro.org>
 <20190618123045.GF18776@kadam>
 <CACRpkdaqKzF=WaRiDPi6XmV_=30=A2rigWLSjuFw=PdG=cG4OQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdaqKzF=WaRiDPi6XmV_=30=A2rigWLSjuFw=PdG=cG4OQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9298
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906250059
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9298
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250059
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=VCtVIFADiY591Ti848vdlTegsKNuKrSqC2k/Krpp26k=;
 b=DD0xLV84I6n5ZDF5ebW5z589+jSDJbReNSdhgGpo7N2z3w7uEGPwRjb1a7h2PQKx1/1L
 k2hAEwyAlpik9HIjp7i/XMxmw/887gX4qpeyJAhf8Fan/tp76QIEzpf3QQrsfGTSmvmo
 ePlyQiDzj88vxxg30KC5TA/nxCW2SpKy3BCoBgT9D47iJkSG3ZuKF/gFGunJMuH5vM6/
 GyXWTptBwrKyHuC1J0VPWvrV52ZVMx0VHtdfvVyOliWBUXeC+5cSgzWrUNK9MfS3HZe4
 76jh6NIevXpXwhvlRsxx5llxmD0FNT4LZCgSIR7ZaAJMO8ZbNrwHpyl4MCoueQpOykZq Qw== 
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTI6MDk6NTRBTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBUdWUsIEp1biAxOCwgMjAxOSBhdCAyOjMxIFBNIERhbiBDYXJwZW50ZXIgPGRh
bi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gCj4gPiBUaGFua3MhCj4gCj4gUmVjb3Jk
aW5nIHRoaXMgYXMgQWNrZWQtYnk6IHdoZW4gYXBwbHlpbmcuCj4gCgpUaGF0J3MgaXMgYW4gaG9u
b3VyIGZvciBtZS4gIEkgZmlndXJlZCB0aGF0IHlvdXIgU2lnbmVkLW9mZi1ieSBkd2FyZmVkCm15
IEFjay4gIDpQCgpyZWdhcmRzLApkYW4gY2FycGVudGVyCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
