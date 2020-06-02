Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A7A1EBF2A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 17:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9936E41B;
	Tue,  2 Jun 2020 15:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A5A6E41B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 15:39:15 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052FW32Q105146;
 Tue, 2 Jun 2020 15:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=DSbMhSk8SwxhpgAbU8esEvoZolFH3pziYxtelXV4q54=;
 b=zMUNe/3wVc2t0iNS0FHrcOZneeoox1E76XhWQ0SxVThFK9zD02pbVo+mIylWmRF/7lx3
 Ct3IhpYmvEK7KhiAgJVShmkgJVkE9fldJVQHVuE6shhBGucp5ZQXksuGU37sBloc4h7w
 3yYyq63lrrQOuQ7yA74jSpzQUv5lIFOec4j3db9mOqPJKKLNXAY16LqI6FtAvqjJ2Pu0
 Ryt/cdtemq7uKVKpj4vOa6b47tQPWR1n7A2PbS2Us1tVJU/BemmCP3U5St/wJksnZBkV
 FpalnxmW4FTe2nfXybQAN/qHdTs956D1ant0TZROQAaEGxxJkF/7Q1J8IZGXBmfTAtOM ig== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 31dkruhrxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 02 Jun 2020 15:39:14 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052FY0Fc104603;
 Tue, 2 Jun 2020 15:39:14 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 31dju1phrx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jun 2020 15:39:14 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 052Fd8SF030859;
 Tue, 2 Jun 2020 15:39:08 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Jun 2020 08:39:08 -0700
Date: Tue, 2 Jun 2020 18:39:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new()
Message-ID: <20200602153900.GW22511@kadam>
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <20200602102955.GZ30374@kadam>
 <65e3d2b7-b0ad-f387-b8fe-d83ea816a0f6@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65e3d2b7-b0ad-f387-b8fe-d83ea816a0f6@web.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=18 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020111
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 suspectscore=18 malwarescore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 cotscore=-2147483648 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020111
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>, Kangjie Lu <kjlu@umn.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 02, 2020 at 01:10:34PM +0200, Markus Elfring wrote:
> > The original patch was basically fine.
> 
> I propose to reconsider the interpretation of the software situation once more.
> 
> * Should the allocated clock object be kept usable even after
>   a successful return from this function?

Heh.  You're right.  The patch is freeing "clk" on the success path so
that doesn't work.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
