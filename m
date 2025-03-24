Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A132A6D88F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 11:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F153210E041;
	Mon, 24 Mar 2025 10:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="DqSoWvn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC52910E297
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 10:47:42 +0000 (UTC)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9ptko016767;
 Mon, 24 Mar 2025 10:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=pp1; bh=VIga+xvQk4RxwLl37s8roD8US+RxZH
 6wgAnN7cz6dUM=; b=DqSoWvn2hNYTALQxMlD7ZFoi+4zq0N1yWuxe53qPbwlofS
 11EDXetv8BM4utLmdlLw0MYgxwUAi5gSGHNoREjNHy90tDmAWBicdY3u5OsLqFNm
 FswP8lh4U8KL0Z+kmbDMnrfazqs0pMLjoe8sYQPDDhg+bESIKfnjQkeT2J5kZ8gZ
 uTpBQo4JY573uCvrEvB6/7EY+71e5v7MwS2GmtATqmPLrQY+OFUtee+p4N29MFed
 yMLrXbyFZsn7mGVDVNB3gW9NBCAPa3n7ktStYlAB993VUD+ET9ZqifqLhNy/ADTm
 3QJgYd+LcjsIPnDPueY9NsSPBS5ASB0qja99r70Q==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45jkqp44qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Mar 2025 10:47:11 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52OAlA92022659;
 Mon, 24 Mar 2025 10:47:10 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45jkqp44qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Mar 2025 10:47:10 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52O77iAg025489;
 Mon, 24 Mar 2025 10:47:09 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45j7wywy1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Mar 2025 10:47:09 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 52OAl5LT16187800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Mar 2025 10:47:05 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 694862004B;
 Mon, 24 Mar 2025 10:47:05 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD8DB20040;
 Mon, 24 Mar 2025 10:47:03 +0000 (GMT)
Received: from osiris (unknown [9.179.14.66])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 24 Mar 2025 10:47:03 +0000 (GMT)
Date: Mon, 24 Mar 2025 11:47:02 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-kselftest@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH v4 10/14] s390: Add support for suppressing warning
 backtraces
Message-ID: <20250324104702.12139E73-hca@linux.ibm.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-11-acarmina@redhat.com>
 <b6bb68f0-7e93-4db2-9fe6-f615f06ddeb1@roeck-us.net>
 <CAGegRW4GinPmsav5=VBfjXBKy4cUEs5FWv-ixXODk7ajZ69vYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGegRW4GinPmsav5=VBfjXBKy4cUEs5FWv-ixXODk7ajZ69vYg@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -BXK6qMXWLef6jiJ2R9hHCsaI_IjDOmx
X-Proofpoint-ORIG-GUID: 40o9NRITvQhnDK-iPsw_sUFfSwFPyp4T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 mlxscore=0 mlxlogscore=810 clxscore=1011 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240076
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

On Fri, Mar 21, 2025 at 10:05:42PM +0100, Alessandro Carminati wrote:
> > > +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> > > +# define HAVE_BUG_FUNCTION
> > > +# define __BUG_FUNC_PTR      "       .long   %0-.\n"
> > > +# define __BUG_FUNC  __func__
> >
> > gcc 7.5.0 on s390 barfs; it doesn't like the use of "__func__" with "%0-."

...

> GCC makes significant efforts to handle this, and for several
> architectures, it manages to solve the problem.
> However, this is not universally the case.
> Additionally, -fPIC is not widely used in kernel code... I have only
> seen it used for VDSO, the x86 boot piggyback decompressor, PowerPC
> boot, and the s390x architecture.
> 
> That said, GCC has been mitigating this issue, allowing us to treat a
> non-compile-time constant as if it were one.
> A proof of this is that, at least since GCC 11, the s390x version of
> GCC is able to build this code.
> Before that... certainly in GCC 7.5 it couldn't.
> 
> A simple fix would be to restrict usage to GCC versions greater than
> 11 for s390.

But please add that dependency only for this new feature for the time
being. Right now I would not like to see that s390 is the only architecture
(besides parisc) which requires a much higher minimum gcc level than every
other architecture. Unless there are specific reasons.
