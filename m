Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE67DABCDB9
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 05:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A250510E3F5;
	Tue, 20 May 2025 03:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="Kj3oEG8Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85D210E3F5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 03:17:03 +0000 (UTC)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JIpEfs014715;
 Tue, 20 May 2025 03:16:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:reply-to:subject:to; s=pp1; bh=xRNW2qW1smiQezb5Sx/OQ
 7BYDGOGl6a7HMDvHs1fpoc=; b=Kj3oEG8QwNHzI2wrvLGFwQGMSRvyD4YyqZpEx
 7qepJ1xBOaBWr6MxzKizw9iryEcFbjOpNdbx613YsHdTgJkVcWZ9ni6OReI8poFk
 qIk+Sz/vU1qKiFHUn4MeaD9DXDI3Er/bc60n8SH/jNP1yWXd6kyhPW6aCFI8yTS1
 dLaG3Z/LBaPMmuTorWVRFFIxd2Nd2GZzEtGM8RSBy+1T03PqZKBqYU/w3T64yjQX
 IPBSzQ4QExCwqiCkJue/IZgmTAjoDNcfUT2x5YT9kgLQM/dPb97XH6LR3yegugl0
 N4i5q5cxgSV2S2ldgj6qS8kSu2W+m26duLTfWuiVeRLxpPbEA==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ra99hq57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 May 2025 03:16:43 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54K3GMYb014854;
 Tue, 20 May 2025 03:16:42 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ra99hq54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 May 2025 03:16:42 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54JN6uQp007225;
 Tue, 20 May 2025 03:16:41 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46q70k9jq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 May 2025 03:16:41 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 54K3GdVH56689032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 May 2025 03:16:39 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C16882037A;
 Tue, 20 May 2025 03:16:39 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE21C20382;
 Tue, 20 May 2025 03:16:34 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.124.218.163])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 20 May 2025 03:16:34 +0000 (GMT)
Date: Tue, 20 May 2025 08:46:32 +0530
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
Subject: Re: [PATCH v4 5/6] powerpc/eeh: fix potential OoB
Message-ID: <6wwxc7nnl5avjcxelmzzkmae47fyzl7jo33u72ulyne5mgqn2j@wtgtd7vr26zy>
References: <20250508130612.82270-1-markus.burri@mt.com>
 <20250508130612.82270-6-markus.burri@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508130612.82270-6-markus.burri@mt.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=J/mq7BnS c=1 sm=1 tr=0 ts=682bf41b cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=02EIq6OHAAAA:8 a=VnNF1IyMAAAA:8
 a=HUMLOfCe0dNcxKgz96gA:9 a=CjuIK1q_8ugA:10
 a=vbqWBO59iwVkzqU4rnh-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDAyNCBTYWx0ZWRfXyVWn3DE4DIfT
 8not9p+kUmqSzfk1Hw7leidvumDjj7RHQvXVaWP/ZZ/kBLTeiP8kyCv67mxhphMZ7avI7yRWX+j
 pv7ilFFGgHGc/kaVh1yiGBOQ5gFvzj9vM/OrXWpZgLMCkqIsjWdqwx4K2Nk6Rl7QuqwOwfREiS6
 o2pCYikMOMyko4p73dNFgcKJk0q6tS7YN/IKcq2MJRihYUB6DvQOnmQRS02zzhHUoVkWNs2R2u2
 t5ofHtkSJp8jvMW0Ia0DLf38KF4Ne6qBpBoL0+vS+Fs27XVfTk+cO/toI4FQ2nDGYO/cCn2Sfwa
 uo4mJttZiOpMbQMlGb1kSeUhMWkMVwK1qQqpSpFRByCHdi61rpERHJNEAaU2jCCL8lB+L63yuNb
 l9/X6Gx66s6ApzWaKvijhgqc9ZIpt5YDJJWr8/pLZuQN5xGGSWNe8St+p6KDrTJg7Fi0oB22
X-Proofpoint-ORIG-GUID: JbfiaSV11r8h2-OmHVfSkNOv6PDWC8sy
X-Proofpoint-GUID: GzZO1AaHhALGF7ZvY8skL4oPIShzbuFR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1011 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
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

On 2025-05-08 15:06:11 Thu, Markus Burri wrote:
> The buffer is set to 20 characters. If a caller write more characters,
> count is truncated to the max available space in "simple_write_to_buffer".
> To protect from OoB access, check that the input size fit into buffer and
> add a zero terminator after copy to the end of the copied data.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>

Thanks for the fix.

Acked-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.

> ---
>  arch/powerpc/kernel/eeh.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 83fe99861eb1..92ef05d3678d 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1734,10 +1734,15 @@ static ssize_t eeh_force_recover_write(struct file *filp,
>  	char buf[20];
>  	int ret;
>  
> -	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
> +	if (count >= sizeof(buf))
> +		return -EINVAL;
> +
> +	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
>  	if (!ret)
>  		return -EFAULT;
>  
> +	buf[ret] = '\0';
> +
>  	/*
>  	 * When PE is NULL the event is a "special" event. Rather than
>  	 * recovering a specific PE it forces the EEH core to scan for failed
> -- 
> 2.39.5
> 
> 

-- 
Mahesh J Salgaonkar
