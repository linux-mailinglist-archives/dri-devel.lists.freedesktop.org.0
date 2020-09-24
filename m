Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67844277C5E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 01:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4681E6EB5F;
	Thu, 24 Sep 2020 23:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23B96EB5F;
 Thu, 24 Sep 2020 23:43:01 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08ONZx0j085851;
 Thu, 24 Sep 2020 23:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=VvCv4Gti0LRNvu/JiuhQzqXwh4k4ms6S4iJ4yRBRgEM=;
 b=MMVLyPrv7sPtJ1/RwS7dn5G6wMF0WLG4ffVhrRrQHgdemGHrQEKGFjfZfcvc1bqEP4AN
 aHjVeVEMTc2nfLh3f3jd7D7bgCB0wPhBNJAA2DUnyUVt/WVGsksMCyTDcGpnQo+Ve0V5
 x2YWLO/6uCk0REcuKVztrcAzZ0/Mpn68GAFWjhjvWFKguSxvqjNZ+qqRO7Eq3IOA0gfw
 M2gm6L672PBJtZxbuoSJpxzvnhHurd0xQJPFSNuYIWPu4qMoIbDqoIo9UjvPaPugqqHi
 C41EQ5bVrLxxVt2MHMnZACz8qXoTqnKUKL5aajg5l1UHFQX/47Trpqczl0R+xCwGy2st 5g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 33q5rgscs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 23:42:39 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08ONZTet163174;
 Thu, 24 Sep 2020 23:42:38 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 33nux3jpbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 23:42:38 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08ONgVnu011111;
 Thu, 24 Sep 2020 23:42:31 GMT
Received: from [10.74.109.22] (/10.74.109.22)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Sep 2020 16:42:31 -0700
Subject: Re: [PATCH 09/11] xen/xenbus: use apply_to_page_range directly in
 xenbus_map_ring_pv
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
References: <20200924135853.875294-1-hch@lst.de>
 <20200924135853.875294-10-hch@lst.de>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <ab2913a6-c5ac-c067-6e55-e2549b286f36@oracle.com>
Date: Thu, 24 Sep 2020 19:42:27 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200924135853.875294-10-hch@lst.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9754
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009240170
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9754
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 impostorscore=0
 clxscore=1011 suspectscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240170
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
Cc: Juergen Gross <jgross@suse.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, x86@kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Minchan Kim <minchan@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 xen-devel@lists.xenproject.org, Nitin Gupta <ngupta@vflare.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/24/20 9:58 AM, Christoph Hellwig wrote:
> Replacing alloc_vm_area with get_vm_area_caller + apply_page_range
> allows to fill put the phys_addr values directly instead of doing
> another loop over all addresses.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


-boris

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
