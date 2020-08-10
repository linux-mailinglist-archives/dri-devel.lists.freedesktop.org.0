Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E30B240AB5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 17:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CE46E25E;
	Mon, 10 Aug 2020 15:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C7C6E25E;
 Mon, 10 Aug 2020 15:44:39 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07AFhXtJ153655;
 Mon, 10 Aug 2020 15:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=JvLiuuU3UgGUfrDifIj6lXvZMS7W5udsSPkBUIuvbkM=;
 b=o99keg9qf1qCDxOhoorD6MCLSCgG2oiYfCjODzVYEfkaELoMgwnwZ4iv8hQ9KEaneAda
 iiZsUsiNkXMJfMXxW+3gLZ2PW7raHV/Kq4Z/OpNKyBQH7DNsIOPntyB9k4UjdF00IIa+
 XBwbI6vHtVrPx2WuehFw/AG/dtsTgxnd+H+hjN5w6bXUes3s51e09EgqtC7Yl4MpRAKl
 eQrbhKPWAdiOe9r2eCsf8YkrrOsPemAZdBKucdRfYA5KUkBGCzPkVcV07irNbBwO5Ipb
 YsQG5z8AtbiO1F8Rl4JrhU9vkxqeJcuG/48hNkNhXFzjwZ0HcapCSuNxr7FW8iF/14xa fQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 32smpn79q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Aug 2020 15:44:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07AFJEiH003551;
 Mon, 10 Aug 2020 15:42:34 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 32t5y16wbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Aug 2020 15:42:34 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07AFgNSI016391;
 Mon, 10 Aug 2020 15:42:23 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 10 Aug 2020 15:42:22 +0000
Date: Mon, 10 Aug 2020 18:42:13 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] drm: amdgpu: Use the correct size when allocating memory
Message-ID: <20200810154213.GM1793@kadam>
References: <20200809203406.751971-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200809203406.751971-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9709
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 suspectscore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008100115
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9709
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011 spamscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008100116
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
Cc: Ori.Messinger@amd.com, airlied@linux.ie, bernard@vivo.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, colton.w.lewis@protonmail.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 09, 2020 at 10:34:06PM +0200, Christophe JAILLET wrote:
> When '*sgt' is allocated, we must allocated 'sizeof(**sgt)' bytes instead
> of 'sizeof(*sg)'. 'sg' (i.e. struct scatterlist) is smaller than
> 'sgt' (i.e struct sg_table), so this could lead to memory corruption.

The sizeof(*sg) is bigger than sizeof(**sgt) so this wastes memory but
it won't lead to corruption.

    11  struct scatterlist {
    12          unsigned long   page_link;
    13          unsigned int    offset;
    14          unsigned int    length;
    15          dma_addr_t      dma_address;
    16  #ifdef CONFIG_NEED_SG_DMA_LENGTH
    17          unsigned int    dma_length;
    18  #endif
    19  };

    42  struct sg_table {
    43          struct scatterlist *sgl;        /* the list */
    44          unsigned int nents;             /* number of mapped entries */
    45          unsigned int orig_nents;        /* original size of list */
    46  };

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
