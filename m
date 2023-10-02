Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7C37B4E26
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 10:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3530610E25D;
	Mon,  2 Oct 2023 08:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E6810E241;
 Mon,  2 Oct 2023 08:53:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B6F7FCE0EAA;
 Mon,  2 Oct 2023 08:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E058EC433CA;
 Mon,  2 Oct 2023 08:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696236795;
 bh=t9nUnlsUSGSA6KXDG9eIUL8NkaKGhkaZ+k9zMU/msOg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=aZC8ob0hBMVk/wW7CrMfHJAbHgX2r4sD/N1pYyMgeZPSD986C/6LQvjoHrLdt9uo/
 AvWc8ItdH5zANDM/BWHExhTO0vMgN4wZUbYWLFbxL0fLqvO3sdGIen+rLKCRM7HalK
 WdxkvK2kIchZghqnMFEV1uotHf/kI6qDyNQo5vyOcl9EPWFRLmXc30qj8QCOU00u/K
 a5COzI0S1cShOdJCYZILXR2eqvaAir/yUVEohOvIFqlLF0kSv9ZkZ5rthTWWEaobE/
 2xOp01TTELGSZ87Lfr38Nudyjn+xoH5tZ2P7iKWsnwLFrEJLkYT90+yOhMifOOt3CP
 9rey/67aYTa8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C92CBE784A4;
 Mon,  2 Oct 2023 08:53:14 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Mon, 02 Oct 2023 10:55:18 +0200
Subject: [PATCH v2 01/15] cdrom: Remove now superfluous sentinel element
 from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-1-02dd0d46f71e@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=892; i=j.granados@samsung.com; 
 h=from:subject:message-id;
 bh=HP9sX3Yq6no3LIGS7gxj0QQAPjl1kSKLH9YGL6vsrCg=; 
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGoV7aj+83oYeqb6g5LqMcPrlSYA/sw3XNVtGi
 Tcihv7W1e6JAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqFewAKCRC6l81St5ZB
 T11zC/4isu/2elcU5kFo1V5OSm37bxnkesh8BXCmqaU8pLDmABQPsaVAjhuaMiVbkWywdosML0J
 eP1RbZREtG8tHA6hHvcQsiGPfV9VY7ZBY1izxZ80Omx6lGmNThQ7JKoH4eUk+fXenQGzJg0YCEg
 uQ2ICUEUTlPKK4WMlEPkh3fpxrqROwTV+otJdR6avKiRPLM97uCNupakiOCqOcB/6BG7kOTc28W
 OAeIilC+3jn3ceUirFEqPijJ1Yqs0aSvHBRf+OWKgMo9rakMo0He0gazX1Q9tfIeInipcs/syO3
 HiRA8VyEZDMGLd2lcOxrko1eA04kSPUHzQSOTNTnId65w/EiSv9j0FKxPT4p5qwslYQOxp096rZ
 AKmZAryXj/h7R9EAQxxgUpLxsuEpRs8NFX9A4t/zM/kyoNJGM92xl/pFHdARq3GMzxTYav4Gl30
 ydelfjzMw2s6dE2Vc3Qy88S86774JSBNoouXG9eJuxHPAZlvzjhxjH+oXYvGmyGX71VrY=
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

Remove sentinel element from cdrom_table

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/cdrom/cdrom.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
index cc2839805983..a5e07270e0d4 100644
--- a/drivers/cdrom/cdrom.c
+++ b/drivers/cdrom/cdrom.c
@@ -3655,7 +3655,6 @@ static struct ctl_table cdrom_table[] = {
 		.mode		= 0644,
 		.proc_handler	= cdrom_sysctl_handler
 	},
-	{ }
 };
 static struct ctl_table_header *cdrom_sysctl_header;
 

-- 
2.30.2

