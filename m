Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586ABC417FE
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 21:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA62F10EB6E;
	Fri,  7 Nov 2025 20:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="H39ZqBg6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E41910EB6B;
 Fri,  7 Nov 2025 20:04:08 +0000 (UTC)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7HNkEL024261;
 Fri, 7 Nov 2025 20:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=2eGLYm
 e5VwHp+AJZ/CpMtGPReJuK3FwyynF7wHhYkvA=; b=H39ZqBg6ELRsBI8IqrWREp
 rhjL78rKsc96eOnL+X5Cy2rr1ljlpPFGcKy8nLRx/mcTHG0vrAXUO52e/Lha6zSk
 5FIvQoiTzXmy4DhsWEKCjb+EjadjqYG/3mbmWJU35Rc/X+P8HaeEt+G7kHqh76RS
 f63pbxQTgZUPyeIVYtUltuWwbhKaqbyl0Nm1mcn+wlQsrj4nzpgfG4ic86WIZpvf
 WNJdtDrlWEQpVD58ESxjxMl6tVOzYnIYYzYfpVn0kmLwcOMPmTa7nZ3az3W2hV99
 B7dcHjR0UD4TVMutSYrtVjIFbQ3y9cRqPxr4G8rfDosq2TyWgJcys2AyOvUBbxLw
 ==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9n4egp43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Nov 2025 20:03:57 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A7K3vMY021721;
 Fri, 7 Nov 2025 20:03:57 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9n4egp3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Nov 2025 20:03:57 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7JIojI012861;
 Fri, 7 Nov 2025 20:03:56 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5y82cbg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Nov 2025 20:03:56 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 5A7K3sHQ27853452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Nov 2025 20:03:54 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A43D58059;
 Fri,  7 Nov 2025 20:03:54 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 841DB5805E;
 Fri,  7 Nov 2025 20:03:50 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.61.62.231]) by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  7 Nov 2025 20:03:50 +0000 (GMT)
Message-ID: <8cfa84e31a275db3d85431e18836a5ed921f1cfd.camel@linux.ibm.com>
Subject: Re: [PATCH v2 18/22] vfio/ccw: Convert to get_region_info_caps
From: Eric Farman <farman@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>, Alex
 Williamson <alex.williamson@redhat.com>, Ankit Agrawal	
 <ankita@nvidia.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Giovanni Cabiddu
 <giovanni.cabiddu@intel.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko
 Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org, Kirti Wankhede
 <kwankhede@nvidia.com>, linux-s390@vger.kernel.org, Longfang Liu
 <liulongfang@huawei.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Nikhil
 Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta	 <nipun.gupta@amd.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic	 <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Sven
 Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev, Pranjal
 Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>
Date: Fri, 07 Nov 2025 15:03:49 -0500
In-Reply-To: <18-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: <18-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=fdWgCkQF c=1 sm=1 tr=0 ts=690e50ae cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=Ikd4Dj_1AAAA:8 a=VnNF1IyMAAAA:8 a=U2-HQc-8H8NLPWOta0UA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE0MyBTYWx0ZWRfX0Ed6DsP/EZpl
 R6JNco0yAlxO/SwHuhy/AjpJC4v10LGM9p9nyzzdUQU5j4P+m2gpIt8WRq5EkfPQi4qaUD6t2mb
 yOYGARGXYv1qbCcNBzEV8tQKHLI2XVtjuxmjCfvXZUDMEx2MEIXrEkLafWB0w+xu7fJS2haJjoQ
 1kqlZ9BiceN43foEgbtTh7CuM9XJr1EkxP7tiyMkMGQgRpEh8EtnFIL2QmzDNxkfO/26/8TLqRr
 tYeA6tMDk12aEbnr435o8Jy7trcOgbPIwUr1zZBmuZ8OlhIALt44KXpkjEpA2HsUu2AIZccXwxu
 4LNZur2JEcuUyxPbc5uIKJPoGccBQ61NZogNRn12XCXpfmOwJbNhxRTQTjxM55BxIJrVNx6DzTz
 781V0hJCcLUEzrQpiS0GQ1q9v5odWw==
X-Proofpoint-GUID: E27P93uknM2eSl9_5brOvfeQ8jl7TC6I
X-Proofpoint-ORIG-GUID: _2DmvAYtew7Y7XdQl82VWE9yY_26JjyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 spamscore=0 clxscore=1011 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511070143
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

On Fri, 2025-11-07 at 13:41 -0400, Jason Gunthorpe wrote:
> Remove the duplicate code and flatten the call chain.
>=20
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/s390/cio/vfio_ccw_ops.c | 55 +++++----------------------------
>  1 file changed, 7 insertions(+), 48 deletions(-)

Nice.

Reviewed-by: Eric Farman <farman@linux.ibm.com>
