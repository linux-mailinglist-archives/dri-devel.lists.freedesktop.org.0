Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32014ABCDBF
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 05:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2179310E04D;
	Tue, 20 May 2025 03:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="CACJp3Z5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0CD10E04D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 03:19:27 +0000 (UTC)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JIoIxV013642;
 Tue, 20 May 2025 03:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:reply-to:subject:to; s=pp1; bh=m2gIUYyBgS95RQQMEUcdY
 sXFWdcdNysYXDQqt/Nv5io=; b=CACJp3Z5Y0fiO7Go3tsxcty5zwhM28b7C1Wzs
 Fgot7rSQ16RLhP/EG9M7P3TZOigY6R5oZWeDeI2peDNH8GK3hOGGIfpk4fEcbOAN
 iiOEYfvaN3d/BR5bjZIJ1pbyyDtqL1Ozc4woAoL/gUAOT0px9f1RHhB6IfZuMbrm
 UiATARsuIiEuE7z44Z++9AdNMLuB87ozmT8PqgnYL7eSyV3xF85qdSiltVxAmU1+
 hiaS3tPEUUmYIWhvUbkZBJ99vvQ9lzZ04XlmsHM1jiD6b5ZQz3JKesNJ50trt0qz
 NAEL6WROp8snwfYoDtm6ggPe6dgfh5wLYw3QZqVO22XhDp1YA==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ra99hq9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 May 2025 03:19:08 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54K3J73Y019225;
 Tue, 20 May 2025 03:19:07 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ra99hq9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 May 2025 03:19:07 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54JN6uRm007225;
 Tue, 20 May 2025 03:19:06 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46q70k9k2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 May 2025 03:19:06 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 54K3J4wt34341582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 May 2025 03:19:04 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D04C620040;
 Tue, 20 May 2025 03:19:04 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4899D20043;
 Tue, 20 May 2025 03:19:00 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.124.218.163])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 20 May 2025 03:19:00 +0000 (GMT)
Date: Tue, 20 May 2025 08:48:57 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, "Oliver O'Halloran" <oohall@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Nuno Sa <nuno.sa@analog.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-iio@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>
Subject: Re: [PATCH v4 6/6] powerpc/eeh-powernv: fix potential OoB
Message-ID: <3wfa4z2uozeg4bhu47uipn7mqjuaspxxvjsb7gfpwxbgjfivat@lr6lh5gpht7m>
References: <20250508130612.82270-1-markus.burri@mt.com>
 <20250508130612.82270-7-markus.burri@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508130612.82270-7-markus.burri@mt.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=J/mq7BnS c=1 sm=1 tr=0 ts=682bf4ac cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=02EIq6OHAAAA:8 a=VnNF1IyMAAAA:8
 a=uC_ZhKPKdcj-b1_MkeYA:9 a=CjuIK1q_8ugA:10
 a=vbqWBO59iwVkzqU4rnh-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDAyNCBTYWx0ZWRfX+JFPH1t1qErO
 yq1THqtaDHBTugOHb5q8YHF3TI7HXvDNNqKKBtHRsgq3oqIyZpyB3MVeFusPJ/JeV2USGFok5jl
 a+r8UyHCAqx9AKwKeKigFVL5xjuNonDdak9cl7T3TjKm38Sn3afEMQT07+lGkuzf0nd+BWmANDq
 9hK6qUxgOqjMnJzLhUfL8AI7AObqoljSL2w77nNZfUNUZJlxvuPgn/iPeV7LYjdCGK6rxqQ4+H2
 iC3HK4pSSsrd67bg+d4pxbFe81nMv8BJr6DY+/lXx+QiZvpRqTROqkTIXo1u8UdXFfjFie9QUKx
 HtbPrngZHtAbkCSYnz/yXH9B0xToyhBGOh6qtwrPYfa7L4FD1IF9ksKzqjd6xaDggmHw0DtfX2r
 /D8pdTl5dEvvwMHH2l6fk8tvUToL5idCNlLRpS2wZJ4yfXeV5DP1eZAjWBnSavQXUdJBpk5g
X-Proofpoint-ORIG-GUID: lPEI4Yq43fuJeUhtFgRjRhA4gLGAQBSA
X-Proofpoint-GUID: Udv_LAj6XDkTY2t_olBZEJaLHOagX977
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200024
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
Reply-To: mahesh@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2025-05-08 15:06:12 Thu, Markus Burri wrote:
> The buffer is set to 50 characters. If a caller write more characters,
> count is truncated to the max available space in "simple_write_to_buffer".
> To protect from OoB access, check that the input size fit into buffer and
> add a zero terminator after copy to the end of the copied data.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>

Looks perfect to me.

Acked-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.

> ---
>  arch/powerpc/platforms/powernv/eeh-powernv.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> index db3370d1673c..3abee21fdd05 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -73,14 +73,19 @@ static ssize_t pnv_eeh_ei_write(struct file *filp,
>  	char buf[50];
>  	int ret;
>  
> +	if (count >= sizeof(buf))
> +		return -EINVAL;
> +
>  	if (!eeh_ops || !eeh_ops->err_inject)
>  		return -ENXIO;
>  
>  	/* Copy over argument buffer */
> -	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
> +	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
>  	if (!ret)
>  		return -EFAULT;
>  
> +	buf[ret] = '\0';
> +
>  	/* Retrieve parameters */
>  	ret = sscanf(buf, "%x:%x:%x:%lx:%lx",
>  		     &pe_no, &type, &func, &addr, &mask);
> -- 
> 2.39.5
> 
> 

-- 
Mahesh J Salgaonkar
