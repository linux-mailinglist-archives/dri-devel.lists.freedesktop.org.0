Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 348255F60A5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 07:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AEC10E7DB;
	Thu,  6 Oct 2022 05:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F3210E1F4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 04:22:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CAD0E61825
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 04:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1057CC43152
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 04:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665030161;
 bh=HB4K7E86nsfwh8pjE5w4FJpZB/dXbKFz0OtI2RFCH+s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sovw+cMG1PqLu3BzWeR5UstVr29Ayo36LHZjAiDcfG20hbLu76k5LKE18tIq5krU9
 2IlB4duW8vX1hOnpq03B41LTEc7Wa5d0AGgAs71PAR/M4iDr/bTeeDH1FloO1irXn2
 qyxMF4VVts5BCRediQoi+Safq01SOpOrcKX0H3I19tPcIWSCoK5Dyb0UKru6HoTuR1
 vlK/vQjlJBmjjMMWBLASnCnLuMi6HFCToTu24EHP4xItpTqpQuqDPRook7owBtQJZ9
 IPIHGEfoZ/tk2tw3ErCHQAkeB5/XSwS75qAaOVQYfkwmkURMi6cycxAciQq4oGw2vv
 f2vjWVjZrIETg==
Received: by mail-ed1-f45.google.com with SMTP id u21so1098433edi.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 21:22:40 -0700 (PDT)
X-Gm-Message-State: ACrzQf2YHuEaCAEgIlOyrcvvqNhjSZXMBN64Y54b5XHxfN2+Qrjf5wGI
 +CaGiV2CIecC6uIaoQ/9Kx2Yp8mAJxFK4nccL17oCg==
X-Google-Smtp-Source: AMsMyM4buFniz46ZSiVKh/+EZ3E6CrEv7WC+W0XWrOZd99wlz7Q68ThxnzcjqPbpKa49LlF82wYrc2S5syRYJ4jy1zU=
X-Received: by 2002:a2e:7318:0:b0:26d:fdd9:6b2 with SMTP id
 o24-20020a2e7318000000b0026dfdd906b2mr1076019ljc.156.1665030148829; Wed, 05
 Oct 2022 21:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221005214844.2699-1-Jason@zx2c4.com>
 <20221005214844.2699-2-Jason@zx2c4.com>
 <202210052035.A1020E3@keescook>
In-Reply-To: <202210052035.A1020E3@keescook>
From: KP Singh <kpsingh@kernel.org>
Date: Wed, 5 Oct 2022 21:22:17 -0700
X-Gmail-Original-Message-ID: <CACYkzJ6w6DitDk9uoEyyNeg+HmNHZx_tckJ_=EroqmT=CN3VBA@mail.gmail.com>
Message-ID: <CACYkzJ6w6DitDk9uoEyyNeg+HmNHZx_tckJ_=EroqmT=CN3VBA@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] treewide: use prandom_u32_max() when possible
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 06 Oct 2022 05:33:08 +0000
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
 Sharvari Harisangam <sharvari.harisangam@nxp.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-doc@vger.kernel.org,
 linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>,
 target-devel@vger.kernel.org, John Stultz <jstultz@google.com>,
 Stanislav Fomichev <sdf@google.com>,
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
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Jon Maloy <jmaloy@redhat.com>, Vlad Yasevich <vyasevich@gmail.com>,
 Anna Schumaker <anna@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Haoyue Xu <xuhaoyue1@hisilicon.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-wireless@vger.kernel.org,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-fbdev@vger.kernel.org,
 linux-nvme@lists.infradead.org, Michal Januszewski <spock@gentoo.org>,
 linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com,
 Cong Wang <xiyou.wangcong@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>,
 Ajay Singh <ajay.kathat@microchip.com>, Xiubo Li <xiubli@redhat.com>,
 Sagi Grimberg <sagi@grimberg.me>, Daniel Borkmann <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 lvs-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Marco Elver <elver@google.com>,
 Yury Norov <yury.norov@gmail.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Borislav Petkov <bp@alien8.de>,
 Keith Busch <kbusch@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Franky Lin <franky.lin@broadcom.com>, Arend van Spriel <aspriel@gmail.com>,
 linux-ext4@vger.kernel.org, Wenpeng Liang <liangwenpeng@huawei.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Xinming Hu <huxinming820@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jeff Layton <jlayton@kernel.org>, linux-xfs@vger.kernel.org,
 netdev@vger.kernel.org, Ying Xue <ying.xue@windriver.com>,
 Manish Rangankar <mrangankar@marvell.com>,
 "David S . Miller" <davem@davemloft.net>,
 =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>,
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
 Jason Gunthorpe <jgg@ziepe.ca>, SHA-cyfmac-dev-list@infineon.com,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
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
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Vinod Koul <vkoul@kernel.org>, tipc-discussion@lists.sourceforge.net,
 Thomas Graf <tgraf@suug.ch>, Johannes Berg <johannes@sipsolutions.net>,
 Sungjong Seo <sj1557.seo@samsung.com>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 5, 2022 at 9:16 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Oct 05, 2022 at 11:48:40PM +0200, Jason A. Donenfeld wrote:
> > Rather than incurring a division or requesting too many random bytes for
> > the given range, use the prandom_u32_max() function, which only takes
> > the minimum required bytes from the RNG and avoids divisions.
>
> Yes please!
>
> Since this is a treewide patch, it's helpful for (me at least) doing
> reviews to detail the mechanism of the transformation.
>
> e.g. I imagine this could be done with something like Coccinelle and
>
> @no_modulo@
> expression E;
> @@
>
> -       (prandom_u32() % (E))
> +       prandom_u32_max(E)
>
> > diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
> > index 118248a5d7d4..4236c799a47c 100644
> > --- a/drivers/mtd/ubi/debug.h
> > +++ b/drivers/mtd/ubi/debug.h
> > @@ -73,7 +73,7 @@ static inline int ubi_dbg_is_bgt_disabled(const struct ubi_device *ubi)
> >  static inline int ubi_dbg_is_bitflip(const struct ubi_device *ubi)
> >  {
> >       if (ubi->dbg.emulate_bitflips)
> > -             return !(prandom_u32() % 200);
> > +             return !(prandom_u32_max(200));
> >       return 0;
> >  }
> >
>
> Because some looks automated (why the parens?)
>
> > @@ -393,14 +387,11 @@ static struct test_driver {
> >
> >  static void shuffle_array(int *arr, int n)
> >  {
> > -     unsigned int rnd;
> >       int i, j;
> >
> >       for (i = n - 1; i > 0; i--)  {
> > -             rnd = prandom_u32();
> > -
> >               /* Cut the range. */
> > -             j = rnd % i;
> > +             j = prandom_u32_max(i);
> >
> >               /* Swap indexes. */
> >               swap(arr[i], arr[j]);
>
> And some by hand. :)
>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks!

Reviewed-by: KP Singh <kpsingh@kernel.org>


>
> --
> Kees Cook
