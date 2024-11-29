Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F6A9CFA9A
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 00:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5139C10E050;
	Fri, 15 Nov 2024 23:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="XgPHjXXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B709410E050;
 Fri, 15 Nov 2024 23:00:26 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFGrkEN010333;
 Fri, 15 Nov 2024 22:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qNk0UpPCfP9jVOvfKBxvQukY6QfemQfuOfHWSW3FEps=; b=XgPHjXXU5/THf7Zv
 KSmEXbUKuVLvM2dvj9amuR/JpE4K7+0IZR+xH9KidBF9+O9FKfr4/RUa/5gBJ298
 8bu5+Pifed2F8BrM6Oj34ss7B6Y5ixfwwTCGx3ktfPO3tYNyIm+GzJX1Har9+TZ4
 4wo2SothME4kGgPVm+iavuzfNOA1bUUjgotBOhuR+MSwdpD83jTCA42dW+fTyNsK
 0Y7MINWD+oYbpCz6GaMvi+6nMNjQF5NolpB3yUFR7K5UpAeriFXlTu2nWQWaBMqt
 XRR46sptjfsXIH4xCJQEeuBlwiD0DiBQ6ykoF2SjYaU/c5KX5zmumxMdD4uA+akh
 YLxA7A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xa7ngs0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2024 22:59:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AFMxttC025526
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2024 22:59:55 GMT
Received: from [10.111.176.23] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 15 Nov
 2024 14:59:51 -0800
Message-ID: <d2d2c07b-666d-4b37-a428-2d73ce8aeb5b@quicinc.com>
Date: Fri, 15 Nov 2024 14:59:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/21] wifi: ath11k: Convert timeouts to
 secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>, Pablo Neira Ayuso
 <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix
 <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Russell King <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>, Oded Gabbay
 <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, Shailend Chand
 <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, James Smart
 <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Jack
 Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li
 <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, Miroslav Benes
 <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Louis Peens <louis.peens@corigine.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
CC: <netfilter-devel@vger.kernel.org>, <coreteam@netfilter.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <cocci@inria.fr>, <linux-arm-kernel@lists.infradead.org>,
 <linux-s390@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-scsi@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
 <linux-mm@kvack.org>, <linux-bluetooth@vger.kernel.org>,
 <linux-staging@lists.linux.dev>,
 <linux-rpi-kernel@lists.infradead.org>, <ceph-devel@vger.kernel.org>,
 <live-patching@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <etnaviv@lists.freedesktop.org>, <oss-drivers@corigine.com>,
 <linuxppc-dev@lists.ozlabs.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-15-911fb7595e79@linux.microsoft.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-15-911fb7595e79@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 9NJi18BY7F7RS1ijvJie2T9SzXH5WHC4
X-Proofpoint-GUID: 9NJi18BY7F7RS1ijvJie2T9SzXH5WHC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411150193
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

On 11/15/2024 1:26 PM, Easwar Hariharan wrote:
> Changes made with the following Coccinelle rules:
> 
> @@ constant C; @@
> 
> - msecs_to_jiffies(C * 1000)
> + secs_to_jiffies(C)
> 
> @@ constant C; @@
> 
> - msecs_to_jiffies(C * MSEC_PER_SEC)
> + secs_to_jiffies(C)
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>  drivers/net/wireless/ath/ath11k/debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
> index 57281a135dd7fa6b8610636f47873c8bba21053c..bf192529e3fe26a91e72105a77b4c6f849b905ec 100644
> --- a/drivers/net/wireless/ath/ath11k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath11k/debugfs.c
> @@ -178,7 +178,7 @@ static int ath11k_debugfs_fw_stats_request(struct ath11k *ar,
>  	 * received 'update stats' event, we keep a 3 seconds timeout in case,
>  	 * fw_stats_done is not marked yet
>  	 */
> -	timeout = jiffies + msecs_to_jiffies(3 * 1000);
> +	timeout = jiffies + secs_to_jiffies(3);
>  
>  	ath11k_debugfs_fw_stats_reset(ar);
>  
> 

