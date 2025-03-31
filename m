Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05784A76337
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 11:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1821410E109;
	Mon, 31 Mar 2025 09:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="LT7pimSV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D350A10E109
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 09:34:34 +0000 (UTC)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V3kIbi020935;
 Mon, 31 Mar 2025 09:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=pp1; bh=5wQUBxE/UGmNPQAgaiRvVa8WPa4Xge
 BYehEBYPdmSmo=; b=LT7pimSVcyN4ddA4HnzYiEmGFQMHtb7e/EyeCCvGl0VL/W
 02195K0IebkxiN/7oXnq7YAIS+nVZ9jzNeJ5V+rAnElrbGKVFkRbBQOEhDr9uFPN
 YhOfWFRnRTE3TUGf6jkwa2nEjZRXI4iLW82SuF89q+sKKG0gjyOeENUcgk+sNA+R
 Q7Io6Cmt6+F7rEvzmO2Yqe2QP0zKIzeyfCMFr+T/GHkSaOb4AJKaZCPN4ABTLtO5
 rhByWK+sARqG+5Mlm59QdjebqvmuBa1suhu2Fo+VMdgkKQ3nqweX0Tzd+dbSzvDA
 GV5M5WFCfbNFKfO9vCFz0F04YglJRctND20JsWYA==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45qke9h7an-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Mar 2025 09:34:04 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52V9TYTN015052;
 Mon, 31 Mar 2025 09:34:04 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45qke9h7ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Mar 2025 09:34:03 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52V8VXUm019742;
 Mon, 31 Mar 2025 09:34:02 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45pu6sweg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Mar 2025 09:34:02 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 52V9Xx2l35062476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Mar 2025 09:33:59 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F59B20115;
 Mon, 31 Mar 2025 09:33:44 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7F102010D;
 Mon, 31 Mar 2025 09:33:42 +0000 (GMT)
Received: from osiris (unknown [9.179.29.62])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 31 Mar 2025 09:33:42 +0000 (GMT)
Date: Mon, 31 Mar 2025 11:33:41 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Mickael Salaun <mic@digikod.net>, Kees Cook <kees@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-next@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH] kunit: fixes Compilation error on s390
Message-ID: <20250331093341.25223A5a-hca@linux.ibm.com>
References: <20250329150320.331018-1-acarmina@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250329150320.331018-1-acarmina@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xVW9OReMjFYQpZifK1JV2ZR4Aw07ThTv
X-Proofpoint-ORIG-GUID: EdCK-MJjGRlM6HdbJPvWvIqT9TKDY7RP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1011 spamscore=0 mlxlogscore=722 suspectscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310063
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

On Sat, Mar 29, 2025 at 03:03:20PM +0000, Alessandro Carminati wrote:
> The current implementation of suppressing warning backtraces uses __func__,
> which is a compile-time constant only for non -fPIC compilation.
> GCC's support for this situation in position-independent code varies across
> versions and architectures.
> 
> On the s390 architecture, -fPIC is required for compilation, and support
> for this scenario is available in GCC 11 and later.
> 
> Fixes:  d8b14a2 ("bug/kunit: core support for suppressing warning backtraces")
> 
> Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> ---
>  lib/kunit/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Heiko Carstens <hca@linux.ibm.com>
