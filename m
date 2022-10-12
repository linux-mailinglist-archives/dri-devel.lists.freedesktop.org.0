Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93E55FCB63
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 21:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA9010E071;
	Wed, 12 Oct 2022 19:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com
 [216.40.44.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E871610E071
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 19:17:15 +0000 (UTC)
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay01.hostedemail.com (Postfix) with ESMTP id 2096E1C6C41;
 Wed, 12 Oct 2022 19:17:09 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf12.hostedemail.com (Postfix) with ESMTPA id AB9FC17; 
 Wed, 12 Oct 2022 19:16:43 +0000 (UTC)
Message-ID: <f8ad3ba44d28dec1a5f7626b82c5e9c2aeefa729.camel@perches.com>
Subject: Re: [PATCH v1 3/5] treewide: use get_random_u32() when possible
From: Joe Perches <joe@perches.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org
Date: Wed, 12 Oct 2022 12:16:53 -0700
In-Reply-To: <20221005214844.2699-4-Jason@zx2c4.com>
References: <20221005214844.2699-1-Jason@zx2c4.com>
 <20221005214844.2699-4-Jason@zx2c4.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=1.40
X-Stat-Signature: c3d78nppyrywoyngway5d943fw3wwtdu
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: AB9FC17
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/Qw27OeRP8/mQW0Su38d7rwhSo1NO9QCw=
X-HE-Tag: 1665602203-428634
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
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-wireless@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 drbd-dev@lists.linbit.com, dev@openvswitch.org, rds-devel@oss.oracle.com,
 linux-scsi@vger.kernel.org, dccp@vger.kernel.org, linux-rdma@vger.kernel.org,
 kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org,
 SHA-cyfmac-dev-list@infineon.com, coreteam@netfilter.org,
 tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 linux-media@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, cake@lists.bufferbloat.net,
 brcm80211-dev-list.pdl@broadcom.com, linux-raid@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-10-05 at 23:48 +0200, Jason A. Donenfeld wrote:
> The prandom_u32() function has been a deprecated inline wrapper around
> get_random_u32() for several releases now, and compiles down to the
> exact same code. Replace the deprecated wrapper with a direct call to
> the real function.
[]
> diff --git a/drivers/infiniband/hw/cxgb4/cm.c b/drivers/infiniband/hw/cxg=
b4/cm.c
[]
> @@ -734,7 +734,7 @@ static int send_connect(struct c4iw_ep *ep)
>  				   &ep->com.remote_addr;
>  	int ret;
>  	enum chip_type adapter_type =3D ep->com.dev->rdev.lldi.adapter_type;
> -	u32 isn =3D (prandom_u32() & ~7UL) - 1;
> +	u32 isn =3D (get_random_u32() & ~7UL) - 1;

trivia:

There are somewhat odd size mismatches here.

I had to think a tiny bit if random() returned a value from 0 to 7
and was promoted to a 64 bit value then truncated to 32 bit.

Perhaps these would be clearer as ~7U and not ~7UL

>  	struct net_device *netdev;
>  	u64 params;
> =20
> @@ -2469,7 +2469,7 @@ static int accept_cr(struct c4iw_ep *ep, struct sk_=
buff *skb,
>  	}
> =20
>  	if (!is_t4(adapter_type)) {
> -		u32 isn =3D (prandom_u32() & ~7UL) - 1;
> +		u32 isn =3D (get_random_u32() & ~7UL) - 1;

etc...

drivers/infiniband/hw/cxgb4/cm.c:	u32 isn =3D (prandom_u32() & ~7UL) - 1;
drivers/infiniband/hw/cxgb4/cm.c:		u32 isn =3D (prandom_u32() & ~7UL) - 1;
drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c:	rpl5->iss =3D =
cpu_to_be32((prandom_u32() & ~7UL) - 1);
drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:		u32 isn =3D (prandom_u32() & ~7UL) - 1=
;
drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:		u32 isn =3D (prandom_u32() & ~7UL) - 1=
;
drivers/target/iscsi/cxgbit/cxgbit_cm.c:	rpl5->iss =3D cpu_to_be32((prandom=
_u32() & ~7UL) - 1);

