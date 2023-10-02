Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2982A7B4E1A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 10:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE96D10E254;
	Mon,  2 Oct 2023 08:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB5F10E243;
 Mon,  2 Oct 2023 08:53:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 38C0260CBB;
 Mon,  2 Oct 2023 08:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DA0CC116C9;
 Mon,  2 Oct 2023 08:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696236795;
 bh=Z66CnIwS9V2Vqt1u5P+8e0+LhRmcv6hD7Hd8rNzQAts=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=FfXQ3JOVk1tvf4snBGbIYUt7cC8t2/VKZpNPl4jEoAhstHH1gU38xQcPcL0xMKtDO
 FcJA+8XoYViss7jxu5hXH6/sywvcmYNyNhuXce15Yoll2wXw/QIPsqlT5EokBnGZ9+
 7FFEV1Ca41aas3PCZKT26D8T9Wmcl0R/e3Ab84/+X5kKJgcdIe2GKk3NrqolXQkDz1
 z+zFTa9JCsSpc18W0aIH7G8yYeRNygleTrpvlohi0rYBtGH9PnAGE5qXhzXsNAOMr5
 IGQBWPcP/q4f8s/7dZVXUexQStJ2MV5DZxJ3qopwYcfFBKYzBzY4JLsZUfxyexqedC
 4AOrRWFAq3SWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 163D8E784A5;
 Mon,  2 Oct 2023 08:53:15 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Mon, 02 Oct 2023 10:55:22 +0200
Subject: [PATCH v2 05/15] scsi: Remove now superfluous sentinel element
 from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-5-02dd0d46f71e@samsung.com>
References: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
In-Reply-To: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=oNupD2h3b6zB7gVtrnkT38EloH2PCHXEzMgi8iB28Z0=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGoV9bakHas2ZtL0/2ymaNUaT4ifb9b2axOuon
 88g/ZRNm5WJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqFfQAKCRC6l81St5ZB
 T9hGC/9BxGOk4yKvzEwHz7zhjWcMLWEMYBXIdwPBdJabd4q2HJEJDibrwMhDsBvWrF4cxPPQzS+
 NlyI9mEcGM/vbiQoSRC7ZFAAdSZ3y5OFTZUOZq7D0FglyIaDIIcphFJ0iR89tM2b4/pLUyWAlUv
 1/C649YV4KMxAx15oN3BIj6ZEEQ5GpZkROyKu6viWH7RcVvs37SL3gmNH54KSyvXNOf5JhXPO/g
 IwNAFEirUi7RoZdqvNbMuTDadvPA7F4bI1UAepsn3FNcxBMBWji4SxQSkFCjMHgLwvtlmJ1fm2d
 kC6apagB6wAeAVsPU4S8zoXak6uWuIvQSo8XLq4Qw02x0SHYJeij6Nrvb9zxicB3tROtWoVqeHH
 PoZYHaMM6RN4gSn5AJs8MZHfW/9wz+OBklxtmlWscGzvNFrbTffPKLwxfPOxCPRKTy0372aDB3d
 j2MXs6cmfFsm7eFF4lBFqmKhXNmrawahKg3MaYg8+88oh4G6w0L4jip6dRcf9CJug/Imw=
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

Remove sentinel from scsi_table and sg_sysctls.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/scsi/scsi_sysctl.c | 1 -
 drivers/scsi/sg.c          | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/scsi/scsi_sysctl.c b/drivers/scsi/scsi_sysctl.c
index 7f0914ea168f..093774d77534 100644
--- a/drivers/scsi/scsi_sysctl.c
+++ b/drivers/scsi/scsi_sysctl.c
@@ -18,7 +18,6 @@ static struct ctl_table scsi_table[] = {
 	  .maxlen	= sizeof(scsi_logging_level),
 	  .mode		= 0644,
 	  .proc_handler	= proc_dointvec },
-	{ }
 };
 
 static struct ctl_table_header *scsi_table_header;
diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index 0d8afffd1683..86210e4dd0d3 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -1650,7 +1650,6 @@ static struct ctl_table sg_sysctls[] = {
 		.mode		= 0444,
 		.proc_handler	= proc_dointvec,
 	},
-	{}
 };
 
 static struct ctl_table_header *hdr;

-- 
2.30.2

