Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566B31ACECE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 19:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFB96E32C;
	Thu, 16 Apr 2020 17:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B136E32C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 17:37:02 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03GHRgkk099966;
 Thu, 16 Apr 2020 17:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=CB7WCQ9zN/j7Rovg3dS3N+9OOy+7osLpDgnl3qGkOlo=;
 b=UsII69Sc+G7wJn4o5a0e6IzlkEEM9xK8O/qhglAMqKGK4i92NMkdMNDBhE+c3d5LWKcb
 8qAAYozAsVSr+DSpV4rbYRdLDqs50NP92MxcwgoA6oPv/lkMsF8F/n5xL1x9FZ1uyh4c
 loL2miI2XIKFtRwlQqXqJ/oGZLvVDQRvzdQm7QMedrB54fXVk0j+wafMPaRPvZ8WlCnR
 NMzrTqUXhBICRHteknxC9cNGcGmGyFMdI6IIkXWuiRrBlWBf/AUzzS/Vas0XAVIHL8+C
 g6hSU3B6eBvUDkNLFreDvekuSYCm9SRaQBmiWI+OOMH+49Q2EVYEAcVMeHsliVO/9Eqs 5A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 30e0aa8dfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Apr 2020 17:36:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03GHS9lp018895;
 Thu, 16 Apr 2020 17:36:43 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 30dn9g50nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Apr 2020 17:36:43 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03GHaTg8015958;
 Thu, 16 Apr 2020 17:36:30 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 16 Apr 2020 10:36:29 -0700
Date: Thu, 16 Apr 2020 20:36:16 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>
Subject: Re: [PATCH] staging: android: ion: Skip sync if not mapped
Message-ID: <20200416173616.GC12862@kadam>
References: <20200414134629.54567-1-orjan.eide@arm.com>
 <20200414141849.55654-1-orjan.eide@arm.com>
 <20200416094955.GM1163@kadam>
 <20200416162554.GA34684@e123356-lin.trondheim.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416162554.GA34684@e123356-lin.trondheim.arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9593
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004160123
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9593
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015
 impostorscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160123
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
Cc: devel@driverdev.osuosl.org, Laura Abbott <labbott@redhat.com>,
 Todd Kjos <tkjos@android.com>, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>, anders.pedersen@arm.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Joel Fernandes <joel@joelfernandes.org>,
 "Darren Hart \(VMware\)" <dvhart@infradead.org>, nd@arm.com,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Great!  Thanks!

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
