Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3037B1DC8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 15:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E0510E64C;
	Thu, 28 Sep 2023 13:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313CA10E64F;
 Thu, 28 Sep 2023 13:20:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 116A061CD2;
 Thu, 28 Sep 2023 13:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59697C4E761;
 Thu, 28 Sep 2023 13:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695907237;
 bh=fWtGC2peWHoKZ6N8AA50X9AIZEedAkuMckI2hu3M+U8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=HIAjbYFv4yxMx+1blkLH7800NvQbuHe67EKLPcXMMpt8ZVc/GFy+MaZ1kf2teY1qs
 KFuESLa7oGw6nZPYsv4OpMFTn5MxUK5Rp92mDTL4BDCt3MR8X7/KPccR3rwlFpdf+b
 UIbxgYyL3XBIYzWeR7cbfa6S2k6h2N7xXqv39yha+rd8fqa6WdLyWNcOpqJmjZ6RfJ
 ko0frpUTijee8fGpA3VLtsgOjQjXg7iXO66WGuwHnjSmUGSUsT3Gr1lekS+rvE9+Pp
 mMhIwQStpiSvi2lr3yShM/tIwIvbrGWup26dfEIEr8kG6EFZgtScPTFy7fKpKf+MX9
 tijo/7GE3LdRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 3C47FE732D5;
 Thu, 28 Sep 2023 13:20:37 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Thu, 28 Sep 2023 15:21:38 +0200
Subject: [PATCH 13/15] raid: Remove now superfluous sentinel element from
 ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: =?utf-8?q?=3C20230928-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=
 =?utf-8?q?rs-v1-13-e59120fca9f9=40samsung=2Ecom=3E?=
References: <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
In-Reply-To: <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
To: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org, 
 josh@joshtriplett.org, Kees Cook <keescook@chromium.org>, 
 Phillip Potter <phil@philpotter.co.uk>, 
 Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Doug Gilbert <dgilbert@interlog.com>, 
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Corey Minyard <minyard@acm.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, David Ahern <dsahern@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Robin Holt <robinmholt@gmail.com>, Steve Wahl <steve.wahl@hpe.com>, 
 Russ Weight <russell.h.weight@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Song Liu <song@kernel.org>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=881; i=j.granados@samsung.com; 
 h=from:subject:message-id;
 bh=hLoUxHXjHICsfJhbjVPlPY534xjBTCrGFUyV0qQFO8k=; 
 b=owEB7AET/pANAwAKAbqXzVK3lkFPAcsmYgBlFX3fSmb3JiEBomhDsQ0pRhV92J1BiKariV8CH
 I/W/L1q3F+JAbIEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRV93wAKCRC6l81St5ZB
 T8aLC/jP8MCZa3PEhuvknQGR+TNEMb9/sNQf49cF1k/BAyzDsFzY66dheGN5WfDfw9gFPH1BAGC
 mYDHGZ/Ef83bVTjOKxWIr5FY1xZPPiq8Lj0IOUY885EE0Vqta+zhznwJy48L+DavP+QTdcdzNGr
 /SjfAg1wQH7UoWdImUsYYFEZwFYdTasgOIq+kHYD1dVl5/7YQ48ksc/ZBUPKcOZTnbASa2XLJ6U
 8eZSJDcHZNJFf40edYxbXObiufbuPYN7qxohVYR8Dss/si8enpUhlp2t4KSgpZoXixNFVdhqTfc
 lXP1vgHjnT6dLILhSOYJBI/nvGtjo2UiIbRio9vQ1bdy6IbVkv3oytkBjNrblyOcP2EGiM2SbL2
 xiSaTb8iKFmbrr4OP5Ub4xjOTfInkaQjhKuLLcsfJFTqkEpjbjT88xxGZiSKrJnKK5n4vj2tTgw
 CYz/Ud2OnEk44McFYHvFQhN+Kfn87BbWv6vLXMouD4AmlbqVVp4Ri7xfLqVqEIVrBvjg==
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with
 auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
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
Reply-To: j.granados@samsung.com
Cc: Joel Granados <j.granados@samsung.com>, linux-hyperv@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-raid@vger.kernel.org,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 openipmi-developer@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joel Granados <j.granados@samsung.com>

This commit comes at the tail end of a greater effort to remove the
empty elements at the end of the ctl_table arrays (sentinels) which
will reduce the overall build time size of the kernel and run time
memory bloat by ~64 bytes per sentinel (further information Link :
https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)

Remove sentinel from raid_table

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/md/md.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index a104a025084d..3866d8f754a0 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -304,8 +304,7 @@ static struct ctl_table raid_table[] = {
 		.maxlen		= sizeof(int),
 		.mode		= S_IRUGO|S_IWUSR,
 		.proc_handler	= proc_dointvec,
-	},
-	{ }
+	}
 };
 
 static int start_readonly;

-- 
2.30.2

