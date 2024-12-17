Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3B19F53B2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 18:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D70110EA3C;
	Tue, 17 Dec 2024 17:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="MTO/Z+o6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A844710E629;
 Tue, 17 Dec 2024 17:31:39 +0000 (UTC)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHE6H87020846;
 Tue, 17 Dec 2024 17:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=pp1; bh=Qku009jdAu0Sgq06JBD3twBP+vP3Pl
 e+4ZyDkim0IzU=; b=MTO/Z+o64j+lMdlSt7lwGrgEQppRaLzv9IemetXvJVf+eQ
 cDcMHOowL34r8UPq4AkzwJy+6AWYi1tChb1UBoo4veqGiPUdkwFr8rpVFiuN71m8
 4Wx9vkdpH3EtO5Hv3GdirgS69Lcr5+qFtZbefM2/H+mmJp/+ICb8xWKAOli3haFo
 9qNOCbrE9oWnu8acOVKIDOgwMbAarQxEacZSNkXgLjhk512BYMMs29gN0AV2mmsQ
 PdhP7cGWESbpvwRlQJc8Ko7koVPBuDV/7R/r8/lqWG+jNl3AtSdaRFKqfO/+GxUQ
 UlSlIuxSuvNJlTiWhAHsT2md7A5meFzErQ9cQ+1A==
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43kas4s2rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 17:31:23 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHDwPa9014391;
 Tue, 17 Dec 2024 17:31:22 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hq21kftu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 17:31:22 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 4BHHVImO33161492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Dec 2024 17:31:18 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AC1320040;
 Tue, 17 Dec 2024 17:31:18 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AC5E20043;
 Tue, 17 Dec 2024 17:31:17 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.155.204.135])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 17 Dec 2024 17:31:17 +0000 (GMT)
Date: Tue, 17 Dec 2024 18:31:16 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Russell King <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jack Wang <jinpu.wang@cloud.ionos.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Louis Peens <louis.peens@corigine.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v3 04/19] s390: kernel: Convert timeouts to use
 secs_to_jiffies()
Message-ID: <Z2G1ZPL2cAlQOYlF@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
 <20241210-converge-secs-to-jiffies-v3-4-ddfefd7e9f2a@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-converge-secs-to-jiffies-v3-4-ddfefd7e9f2a@linux.microsoft.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FFAKPmsOF7TzSfPGY_r91-e9_TqDPMGg
X-Proofpoint-GUID: FFAKPmsOF7TzSfPGY_r91-e9_TqDPMGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1011 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170134
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

On Tue, Dec 10, 2024 at 10:02:35PM +0000, Easwar Hariharan wrote:
> Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
> secs_to_jiffies(). As the values here are a multiple of 1000, use
> secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.
> 
> This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with
> the following Coccinelle rules:
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
> ---
>  arch/s390/kernel/lgr.c      | 2 +-
>  arch/s390/kernel/time.c     | 4 ++--
>  arch/s390/kernel/topology.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/s390/kernel/lgr.c b/arch/s390/kernel/lgr.c
> index 6652e54cf3db9fbdd8cfb06f8a0dc1d4c05ae7d7..6d1ffca5f798086160112990cb947ec8deed0659 100644
> --- a/arch/s390/kernel/lgr.c
> +++ b/arch/s390/kernel/lgr.c
> @@ -166,7 +166,7 @@ static struct timer_list lgr_timer;
>   */
>  static void lgr_timer_set(void)
>  {
> -	mod_timer(&lgr_timer, jiffies + msecs_to_jiffies(LGR_TIMER_INTERVAL_SECS * MSEC_PER_SEC));
> +	mod_timer(&lgr_timer, jiffies + secs_to_jiffies(LGR_TIMER_INTERVAL_SECS));
>  }
>  
>  /*
> diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
> index 34a65c141ea076ba97b3238f1f36f077b15961df..e9f47c3a61978a45c72aee23bc44dcb128113c8c 100644
> --- a/arch/s390/kernel/time.c
> +++ b/arch/s390/kernel/time.c
> @@ -662,12 +662,12 @@ static void stp_check_leap(void)
>  		if (ret < 0)
>  			pr_err("failed to set leap second flags\n");
>  		/* arm Timer to clear leap second flags */
> -		mod_timer(&stp_timer, jiffies + msecs_to_jiffies(14400 * MSEC_PER_SEC));
> +		mod_timer(&stp_timer, jiffies + secs_to_jiffies(14400));
>  	} else {
>  		/* The day the leap second is scheduled for hasn't been reached. Retry
>  		 * in one hour.
>  		 */
> -		mod_timer(&stp_timer, jiffies + msecs_to_jiffies(3600 * MSEC_PER_SEC));
> +		mod_timer(&stp_timer, jiffies + secs_to_jiffies(3600));
>  	}
>  }
>  
> diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
> index 4f9c301a705b63f8dd0e7bc33e7206ad1222e7a7..0fd56a1cadbd4f41a9876a3a3fec7f5dc08ac2db 100644
> --- a/arch/s390/kernel/topology.c
> +++ b/arch/s390/kernel/topology.c
> @@ -371,7 +371,7 @@ static void set_topology_timer(void)
>  	if (atomic_add_unless(&topology_poll, -1, 0))
>  		mod_timer(&topology_timer, jiffies + msecs_to_jiffies(100));
>  	else
> -		mod_timer(&topology_timer, jiffies + msecs_to_jiffies(60 * MSEC_PER_SEC));
> +		mod_timer(&topology_timer, jiffies + secs_to_jiffies(60));
>  }
>  
>  void topology_expect_change(void)

With this chunk added to the patch:

diff --git a/arch/s390/mm/cmm.c b/arch/s390/mm/cmm.c
index d01724a715d0..7bf0f691827b 100644
--- a/arch/s390/mm/cmm.c
+++ b/arch/s390/mm/cmm.c
@@ -204,7 +204,7 @@ static void cmm_set_timer(void)
 			del_timer(&cmm_timer);
 		return;
 	}
-	mod_timer(&cmm_timer, jiffies + msecs_to_jiffies(cmm_timeout_seconds * MSEC_PER_SEC));
+	mod_timer(&cmm_timer, jiffies + secs_to_jiffies(cmm_timeout_seconds));
 }
 
 static void cmm_timer_fn(struct timer_list *unused)


Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>
