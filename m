Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D559660AEEA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A990C10E850;
	Mon, 24 Oct 2022 15:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9273A10E855
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 15:21:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29OF0Qlh031384;
 Mon, 24 Oct 2022 15:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xPfZHWn5BjNX1+I617jnln0xrq+61Y5jHhnLZ2Rzmfg=;
 b=W8zlbKxmPYvi7eUIKlWUTINrJJz4acVoGER7mu4MtWqKXZVIXEw436qVUAQfcokjoQLt
 xDCX86jdJvBbEKz4vBcBERH9zPOsj/VXwrBGIJT+F0kAlNxHWGUn1hBUtVL4+VMdPlUH
 Y8vYEuu4rOkk7Y4w8hiSvS3wctGoASXvFTblMa4sBFYz2o1QkYVtQyCkiWtfZVm8LlYN
 cWCyvyq4ILR+SoWhqE/da6p2ytkUEtXYFKyxTxHY80EsDYxSQJv/YKivaFcSyshDCtWU
 6d4iSZpc4caAsr3Zghk0Tgom3IMPED62MvAunKepc9LJioNO0f8Ae+cnvfwZv0uTEwCt /A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kc67pmjng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 15:21:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29OFLMBl018414
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 15:21:22 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 24 Oct
 2022 08:21:20 -0700
Message-ID: <bf8df463-3413-3027-0f4b-3977e6860404@quicinc.com>
Date: Mon, 24 Oct 2022 09:21:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH 3/3] drm: add dedicated minor for accelerator devices
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <20221022214622.18042-4-ogabbay@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20221022214622.18042-4-ogabbay@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lBShfejFmUYvNpYyNQpcmxDz9QS-iVwR
X-Proofpoint-ORIG-GUID: lBShfejFmUYvNpYyNQpcmxDz9QS-iVwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210240093
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jiho Chu <jiho.chu@samsung.com>, Christoph Hellwig <hch@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kevin Hilman <khilman@baylibre.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/22/2022 3:46 PM, Oded Gabbay wrote:
> The accelerator devices are exposed to user-space using a dedicated
> major. In addition, they are represented in /dev with new, dedicated
> device char names: /dev/accel/accel*. This is done to make sure any
> user-space software that tries to open a graphic card won't open
> the accelerator device by mistake.
> 
> The above implies that the minor numbering should be separated from
> the rest of the drm devices. However, to avoid code duplication, we
> want the drm_minor structure to be able to represent the accelerator
> device.
> 
> To achieve this, we add a new drm_minor* to drm_device that represents
> the accelerator device. This pointer is initialized for drivers that
> declare they handle compute accelerator, using a new driver feature
> flag called DRIVER_COMPUTE_ACCEL. It is important to note that this
> driver feature is mutually exclusive with DRIVER_RENDER. Devices that
> want to expose both graphics and compute device char files should be
> handled by two drivers that are connected using the auxiliary bus
> framework.
> 
> In addition, we define a different idr to handle the accelerators
> minors. This is done to make the minor's index be identical to the
> device index in /dev/. In most places, this is hidden inside the drm
> core functions except when calling drm_minor_acquire(), where I had to
> add an extra parameter to specify the idr to use (because the
> accelerators minors index and the drm primary minor index both begin
> at 0).
> 
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
> ---
>   drivers/gpu/drm/drm_drv.c      | 171 +++++++++++++++++++++++++--------
>   drivers/gpu/drm/drm_file.c     |  69 +++++++++----
>   drivers/gpu/drm/drm_internal.h |   2 +-
>   drivers/gpu/drm/drm_sysfs.c    |  29 ++++--
>   include/drm/drm_device.h       |   3 +
>   include/drm/drm_drv.h          |   8 ++
>   include/drm/drm_file.h         |  21 +++-
>   7 files changed, 235 insertions(+), 68 deletions(-)

Can we please add something to Documentation?  I know this leverages DRM 
a lot, but I believe that a new subsystem should not be introduced 
without documentation.  A lot of the info in the commit message is very 
good, but should not be buried in the git log.

Besides, imagine this has been in mainline for N years, and someone 
completely new to the kernel wants to write an accel driver.  They 
should be able to get started with something from Documentation that 
at-least gives that person some insight into what to grep the code for.

> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index b58ffb1433d6..c13701a8d4be 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -56,6 +56,9 @@ MODULE_LICENSE("GPL and additional rights");
>   static DEFINE_SPINLOCK(drm_minor_lock);
>   static struct idr drm_minors_idr;
>   
> +static DEFINE_SPINLOCK(accel_minor_lock);
> +static struct idr accel_minors_idr;

IDR is deprecated.  XArray is the preferred mechanism.
Yes, there already is IDR here, but I believe we should not be adding 
new uses.  Maybe at some point, the current IDR will be converted.  Also 
with XArray, I think you don't need the spinlock since XArray has 
internal locking already.
