Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB9F5F73AC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 06:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E25010E921;
	Fri,  7 Oct 2022 04:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C39310E3A7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 12:47:53 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id mg6so1070347qvb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 05:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=eLAvQxPTrW61bFz1sANG5Y81u18aSgNqwRKiQkasIrQ=;
 b=Mjk55TEbLntyF5lT9fSI68nVndM1Msdjat/gJGZygPgfzU+WkmD3YJi9WXVGaCzM6v
 GxLLpAA6PXTqzjvO06yw50CV42lW4n/vIEByFS591YiP94BQoBhbbWQVP56HTGxk5Zgr
 BOk05yP29axd7oq4HdYwQK9SI5EUWt7gxVDMFJ+wkOreCPIVeriBrHDtpGfIe2ngJppN
 JQryL8z0uIEMfGv9GgcIhdNpUKCWmtH1vAJbOQzYFsOAjpmcoQIxgv9D+phyeqT1BAZz
 6oBo+rhyLIIlr94eqFOQOrHm5nD105nysrFzzWFdbvZC9hK7I+vgzgKfrpoAG3/bFvxl
 ry9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=eLAvQxPTrW61bFz1sANG5Y81u18aSgNqwRKiQkasIrQ=;
 b=Jecae86IJST4NvMo+wipEhJb0w1qrnzAAmw0EAd/e0zSqO1HshkxLSLJrOgzUi6ACH
 ZN3IpYc0aNsyJsUPPaCXaBxMlIDEliNWuNjlRph9hdTSvj19aDoGZUeEETqmTIpM5yhY
 LfCVR9kwD/gHuQh04LFpGnqyIKqaeBHrAOLoenz22xlWMzM3hpWEHX3q6RhS2reCLId+
 1XGIWxeL1Tt6lm4a78GuaFRE21J5MJIiKlDKY4ih7qZ0fJmR68DY+xnUL/w0EBbDnqmH
 IdPjBPiBU/nkCyqe5tFQhTWgu2Yx9KgtXcr/b++weMtkq2vlZ3JtMlQjPLr3IaxVqzvy
 +Rnw==
X-Gm-Message-State: ACrzQf0zjeGewUX459b6BL9I37RL/EhOVW/m4GQE9IT5i509Z6+NnmGL
 /v9My/v/+7mVpBisjtODb2z5DA==
X-Google-Smtp-Source: AMsMyM6E3yRYr1dTGqd6nAazsF/RtsoaWoD6R93kcYIR9nUQ6R8mMrLb2v1joGjgdIDD15O6MaD6sg==
X-Received: by 2002:a05:6214:d06:b0:4ad:1fe1:9b49 with SMTP id
 6-20020a0562140d0600b004ad1fe19b49mr3536957qvh.57.1665060472470; 
 Thu, 06 Oct 2022 05:47:52 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 j3-20020a05620a410300b006b5bf5d45casm20676675qko.27.2022.10.06.05.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 05:47:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1ogQI1-00A0xr-QZ;
 Thu, 06 Oct 2022 09:47:49 -0300
Date: Thu, 6 Oct 2022 09:47:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v1 3/5] treewide: use get_random_u32() when possible
Message-ID: <Yz7OdfKZeGkpZSKb@ziepe.ca>
References: <20221005214844.2699-1-Jason@zx2c4.com>
 <20221005214844.2699-4-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005214844.2699-4-Jason@zx2c4.com>
X-Mailman-Approved-At: Fri, 07 Oct 2022 04:54:02 +0000
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
Cc: Andrew Lunn <andrew@lunn.ch>, "Darrick J . Wong" <djwong@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org,
 Andrii Nakryiko <andrii@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-sctp@vger.kernel.org, "Md . Haris Iqbal" <haris.iqbal@ionos.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Christoph Hellwig <hch@lst.de>,
 Andy Gospodarek <andy@greyhouse.net>, Sergey Matyukevich <geomatsi@gmail.com>,
 Rohit Maheshwari <rohitm@chelsio.com>, Michael Ellerman <mpe@ellerman.id.au>,
 ceph-devel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Nilesh Javali <njavali@marvell.com>,
 Jean-Paul Roubelat <jpr@f6fbb.org>, Dick Kennedy <dick.kennedy@broadcom.com>,
 Jay Vosburgh <j.vosburgh@gmail.com>, Potnuri Bharat Teja <bharat@chelsio.com>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>, linux-nfs@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Andy Lutomirski <luto@kernel.org>, linux-hams@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-raid@vger.kernel.org,
 Neil Horman <nhorman@tuxdriver.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Michael Chan <michael.chan@broadcom.com>, linux-kernel@vger.kernel.org,
 Varun Prakash <varun@chelsio.com>, Chuck Lever <chuck.lever@oracle.com>,
 netfilter-devel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
 linux-media@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org,
 John Stultz <jstultz@google.com>, Stanislav Fomichev <sdf@google.com>,
 Gregory Greenman <gregory.greenman@intel.com>, drbd-dev@lists.linbit.com,
 dev@openvswitch.org, Leon Romanovsky <leon@kernel.org>,
 Helge Deller <deller@gmx.de>, Hugh Dickins <hughd@google.com>,
 James Smart <james.smart@broadcom.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Pravin B Shelar <pshelar@ovn.org>, Julian Anastasov <ja@ssi.bg>,
 coreteam@netfilter.org, Veaceslav Falico <vfalico@gmail.com>,
 Yonghong Song <yhs@fb.com>, Namjae Jeon <linkinjeon@kernel.org>,
 linux-crypto@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 Ganapathi Bhat <ganapathi017@gmail.com>, linux-actions@lists.infradead.org,
 Simon Horman <horms@verge.net.au>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>,
 Theodore Ts'o <tytso@mit.edu>, Stephen Boyd <sboyd@kernel.org>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Florian Westphal <fw@strlen.de>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Jon Maloy <jmaloy@redhat.com>, Vlad Yasevich <vyasevich@gmail.com>,
 Anna Schumaker <anna@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Haoyue Xu <xuhaoyue1@hisilicon.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-wireless@vger.kernel.org,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-nvme@lists.infradead.org,
 Michal Januszewski <spock@gentoo.org>, linux-mtd@lists.infradead.org,
 kasan-dev@googlegroups.com, Cong Wang <xiyou.wangcong@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>,
 Ajay Singh <ajay.kathat@microchip.com>, Xiubo Li <xiubli@redhat.com>,
 Sagi Grimberg <sagi@grimberg.me>, Daniel Borkmann <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 lvs-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, Yury Norov <yury.norov@gmail.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Jamal Hadi Salim <jhs@mojatatu.com>, KP Singh <kpsingh@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Keith Busch <kbusch@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Franky Lin <franky.lin@broadcom.com>, Arend van Spriel <aspriel@gmail.com>,
 linux-ext4@vger.kernel.org, Wenpeng Liang <liangwenpeng@huawei.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Xinming Hu <huxinming820@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jeff Layton <jlayton@kernel.org>, linux-xfs@vger.kernel.org,
 netdev@vger.kernel.org, Ying Xue <ying.xue@windriver.com>,
 Manish Rangankar <mrangankar@marvell.com>,
 "David S . Miller" <davem@davemloft.net>,
 Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 Vignesh Raghavendra <vigneshr@ti.com>, Peter Zijlstra <peterz@infradead.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Amitkumar Karwar <amitkarwar@gmail.com>, linux-mm@kvack.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Ayush Sawal <ayush.sawal@chelsio.com>,
 Andreas Noever <andreas.noever@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 linux-f2fs-devel@lists.sourceforge.net, Jack Wang <jinpu.wang@ionos.com>,
 Steffen Klassert <steffen.klassert@secunet.com>, rds-devel@oss.oracle.com,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 dccp@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Jaehoon Chung <jh80.chung@samsung.com>,
 SHA-cyfmac-dev-list@infineon.com, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Jamet <michael.jamet@intel.com>, Kalle Valo <kvalo@kernel.org>,
 Chao Yu <chao@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>,
 linux-block@vger.kernel.org, dmaengine@vger.kernel.org,
 Hannes Reinecke <hare@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Jens Axboe <axboe@kernel.dk>,
 cake@lists.bufferbloat.net, brcm80211-dev-list.pdl@broadcom.com,
 Yishai Hadas <yishaih@nvidia.com>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 linuxppc-dev@lists.ozlabs.org, David Ahern <dsahern@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Vinod Koul <vkoul@kernel.org>, tipc-discussion@lists.sourceforge.net,
 Thomas Graf <tgraf@suug.ch>, Johannes Berg <johannes@sipsolutions.net>,
 Sungjong Seo <sj1557.seo@samsung.com>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 05, 2022 at 11:48:42PM +0200, Jason A. Donenfeld wrote:

> index 14392c942f49..499a425a3379 100644
> --- a/drivers/infiniband/hw/cxgb4/cm.c
> +++ b/drivers/infiniband/hw/cxgb4/cm.c
> @@ -734,7 +734,7 @@ static int send_connect(struct c4iw_ep *ep)
>  				   &ep->com.remote_addr;
>  	int ret;
>  	enum chip_type adapter_type = ep->com.dev->rdev.lldi.adapter_type;
> -	u32 isn = (prandom_u32() & ~7UL) - 1;
> +	u32 isn = (get_random_u32() & ~7UL) - 1;

Maybe this wants to be written as

(prandom_max(U32_MAX >> 7) << 7) | 7

?

> diff --git a/drivers/infiniband/ulp/ipoib/ipoib_cm.c b/drivers/infiniband/ulp/ipoib/ipoib_cm.c
> index fd9d7f2c4d64..a605cf66b83e 100644
> --- a/drivers/infiniband/ulp/ipoib/ipoib_cm.c
> +++ b/drivers/infiniband/ulp/ipoib/ipoib_cm.c
> @@ -465,7 +465,7 @@ static int ipoib_cm_req_handler(struct ib_cm_id *cm_id,
>  		goto err_qp;
>  	}
>  
> -	psn = prandom_u32() & 0xffffff;
> +	psn = get_random_u32() & 0xffffff;

 prandom_max(0xffffff + 1) 

?

Jason
