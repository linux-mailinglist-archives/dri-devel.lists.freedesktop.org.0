Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 957445F73AF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 06:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D384410E927;
	Fri,  7 Oct 2022 04:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854EE10E3BA
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 12:55:23 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id gb14so889180qtb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 05:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=Tn+sqw4/yCgRf+qJVvhcwv0+F43hCZc6SWcnJkISat8=;
 b=fRB9gEBBoKCu8DvmgrE5jsT6iQulOo1Wq07FJ4Am2X2qPDPghUCGIGqelzq6LtOhav
 Q3ch36mdptG+4DDNPe7LXRCCqOYd+swKkjl9ojx7+DaHms2Ps8ZhIK036brGZcmpW/UJ
 S9x30Eavu5Tk31fMMwn3nSkBSD8/Tghiz9zSBMFnjKzScWXJY3JUjmENpKuorArjMkg6
 rQNb/QJQWH453Lx7yVByUvRWnmkZMXKg6u7yi6uAEcrODzXacr1TQUVtDk0Ogg7EUu2A
 PX8hy4jr/Qi4/DXYjmQMgPSxylmXfgjJuV6SX/HkBNz1t9W02fkJr+gOlTe0wIrhjOHu
 XfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=Tn+sqw4/yCgRf+qJVvhcwv0+F43hCZc6SWcnJkISat8=;
 b=EFVIo0PiWXSeX7e6uOLmsilC5arqIljn4rLnKoi9JV8V7kiRQMRQLo5Ay6RHZqJSxo
 kifZyHUJtkTEwLXDuy6xUDVzBjWHHzDNZy0SiOjPCwfoM4q8aBs3hZd5NC4AQ6kRMF5Z
 2oFygXQ9lBHW48Y3pPBOIZDNlKfmG8WjeaE3XH8M5FHl6w2m5XZ0lvC56U8bigF3SBe0
 1lfnuVWnGD7K64uuoTRlNMKZMgh1Lfsy21HHcQ6iSLJZGOYTGaNdT/dEirqg5cyJQ5NT
 aCynqHBFD6yirHg4XNSrri0V3d2kw9fwf+Zh7HOjlYhRXL8daLV9MjlwuTwl6d4bx+KY
 t5lw==
X-Gm-Message-State: ACrzQf3vJBylcv91MBAkLRaJoXMpaF0ubnSJfaGPy3lhZeOac8eAy/YB
 0N0rtVpp74vwa6hEhMUNfDaUFQ==
X-Google-Smtp-Source: AMsMyM6DY4Mi45rJXGQRcvjS/Cgf2XLFtfLp/9bVtPvTrZ0iTBUQxQv19mmgtcwcA6rTIK+j1eJYjA==
X-Received: by 2002:ac8:5a05:0:b0:35b:bac9:d3ff with SMTP id
 n5-20020ac85a05000000b0035bbac9d3ffmr3176264qta.374.1665060922186; 
 Thu, 06 Oct 2022 05:55:22 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 a16-20020a05620a16d000b006b58d8f6181sm18923537qkn.72.2022.10.06.05.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 05:55:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1ogQPH-00A172-Pm;
 Thu, 06 Oct 2022 09:55:19 -0300
Date: Thu, 6 Oct 2022 09:55:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v1 1/5] treewide: use prandom_u32_max() when possible
Message-ID: <Yz7QN3cbKABexzoB@ziepe.ca>
References: <20221005214844.2699-1-Jason@zx2c4.com>
 <20221005214844.2699-2-Jason@zx2c4.com>
 <202210052035.A1020E3@keescook> <Yz7N5WsqmKiUl+6b@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yz7N5WsqmKiUl+6b@zx2c4.com>
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

On Thu, Oct 06, 2022 at 06:45:25AM -0600, Jason A. Donenfeld wrote:
> Hi Kees,
> 
> On Wed, Oct 05, 2022 at 09:16:50PM -0700, Kees Cook wrote:
> > On Wed, Oct 05, 2022 at 11:48:40PM +0200, Jason A. Donenfeld wrote:
> > > Rather than incurring a division or requesting too many random bytes for
> > > the given range, use the prandom_u32_max() function, which only takes
> > > the minimum required bytes from the RNG and avoids divisions.
> > 
> > Yes please!
> > 
> > Since this is a treewide patch, it's helpful for (me at least) doing
> > reviews to detail the mechanism of the transformation.
> 
> This is hand done. There were also various wrong seds done. And then I'd
> edit the .diff manually, and then reapply it, as an iterative process.
> No internet on the airplane, and oddly no spatch already on my laptop (I
> think I had some Gentoo ocaml issues at some point and removed it?).
> 
> > e.g. I imagine this could be done with something like Coccinelle and
> 
> Feel free to check the work here by using Coccinelle if you're into
> that.

Generally these series are a lot easier to review if it is structured
as a patches doing all the unusual stuff that had to be by hand
followed by an unmodified Coccinelle/sed/etc handling the simple
stuff.

Especially stuff that is reworking the logic beyond simple
substitution should be one patch per subsystem not rolled into a giant
one patch conversion.

This makes the whole workflow better because the hand-done stuff can
have a chance to flow through subsystem trees.

Thanks,
Jason
