Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CF543657F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 17:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695066EC8D;
	Thu, 21 Oct 2021 15:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA1B6EC6C;
 Thu, 21 Oct 2021 13:32:38 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19LCLj84038810; 
 Thu, 21 Oct 2021 09:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sgOHubR8R6J54xwngiqD0Y0ChXz2lRdk62x6cxNTnJE=;
 b=SEGLJ6Tdu+0tsmMz9qciS1Js8x8vTMy7HMDk3G62w/2cu9Oz4hPj7HDV+VNCuOpVLC6F
 9okZ+UcDwy8t+EHPzAzewPbHCX1qoh5IS5NE5Ae29BrUPw0kDxvrde2NZRoLA8unnCB3
 MQi3TD+nX5jk9WqAOwIwUi3YasOKH5eA/6WxBBA4WXV3Gh/nqw3NF5NcAQwJmOpgIp/3
 lMpq60ISc8DPqao8Ep1mygkSN0D4q/Ne8WiljhwdPDwB5xpjXDg0FWCMsQbDUaV/Dgen
 bWbLP/iZwLyTJMQigzW/9aGXL0V+BpHbAjFwrjZlw1Xw5RVovX03xGdws4qWkw83STKJ ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3btxutwmy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 09:32:29 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19LBAsSg034394;
 Thu, 21 Oct 2021 09:32:28 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3btxutwmxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 09:32:28 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19LDNKvV018457;
 Thu, 21 Oct 2021 13:32:28 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 3bqpcd5chq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 13:32:27 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19LDWQjl36831726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 13:32:27 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFEE3AC065;
 Thu, 21 Oct 2021 13:32:26 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6590DAC05B;
 Thu, 21 Oct 2021 13:32:21 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com (unknown
 [9.211.103.136]) by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 21 Oct 2021 13:32:21 +0000 (GMT)
Subject: Re: [PATCH v3 01/10] vfio/ccw: Remove unneeded GFP_DMA
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>, Christoph Hellwig <hch@lst.de>
References: <1-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <5a6016b3-2e3f-0cf6-1e7a-2cd242fe46a8@linux.ibm.com>
Date: Thu, 21 Oct 2021 09:32:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dQHjb8Ez5MbK_bJreSXQOqa-qwmcwmWa
X-Proofpoint-GUID: N6Z06c8FDqqRjq_dvqnQhuBZQucCGB3C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-21_04,2021-10-21_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 clxscore=1011 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110210072
X-Mailman-Approved-At: Thu, 21 Oct 2021 15:13:16 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/1/21 1:52 PM, Jason Gunthorpe wrote:
> Since the ccw_io_region was split out of the private the allocation no
> longer needs the GFP_DMA. Remove it.
> 
> Reported-by: Christoph Hellwig <hch@infradead.org>
> Fixes: c98e16b2fa12 ("s390/cio: Convert ccw_io_region to pointer")
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>

> ---
>   drivers/s390/cio/vfio_ccw_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
> index 76099bcb765b45..371558ec92045d 100644
> --- a/drivers/s390/cio/vfio_ccw_drv.c
> +++ b/drivers/s390/cio/vfio_ccw_drv.c
> @@ -161,7 +161,7 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
>   		return -ENODEV;
>   	}
>   
> -	private = kzalloc(sizeof(*private), GFP_KERNEL | GFP_DMA);
> +	private = kzalloc(sizeof(*private), GFP_KERNEL);
>   	if (!private)
>   		return -ENOMEM;
>   
> 

