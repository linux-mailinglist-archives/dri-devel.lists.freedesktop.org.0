Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC68314A05
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 09:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C2F6EB44;
	Tue,  9 Feb 2021 07:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FFA6E2C8;
 Tue,  9 Feb 2021 01:14:25 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6021e0c40001>; Mon, 08 Feb 2021 17:09:24 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 01:09:24 +0000
Received: from localhost (172.20.145.6) by DRHQMAIL107.nvidia.com (10.27.9.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 9 Feb 2021 01:09:23 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH 1/9] mm/migrate.c: Always allow device private pages to migrate
Date: Tue, 9 Feb 2021 12:07:14 +1100
Message-ID: <20210209010722.13839-2-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209010722.13839-1-apopple@nvidia.com>
References: <20210209010722.13839-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612832964; bh=oZ4IzPZ4J9LSuy9imywhNP9s/LgdHZ4boj/cGLUh0kU=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=DultRc8vIMKcdwumpL2sx++22sXnXh0sI0HuZ45Lo/JxDXE5k6o+YyL/GYNTz+m64
 0QqP3bGnpUovgMWODtNvQk/Izmx8iCPIZR7ecIGqzwuXcQA+QyEQgBRUYmxy3ns5Ho
 A8qCRn6N37XpK8elbFaFAuEbob8gwqIL0x0fK+wmzTEfEcydL3w4TJ+qSPV9Clp84s
 JMx6UviPU/Np/Sb4Vn7B8D3YTl72TMvNDsMCT0oxNWMqn4O1KJaiiXDb/4uND82fQ/
 0HvciJTVMbFEXXIe2sS/THs6zm/8m6Qa6crwneJ9KwZthtQ7c2jmyHPzsZPA0trSS6
 dUawZWcQlMgjg==
X-Mailman-Approved-At: Tue, 09 Feb 2021 07:56:28 +0000
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device private pages are used to represent device memory that is not
directly accessible from the CPU. Extra references to a device private
page are only used to ensure the struct page itself remains valid whilst
waiting for migration entries. Therefore extra references should not
prevent device private page migration as this can lead to failures to
migrate pages back to the CPU which are fatal to the user process.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 mm/migrate.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 20ca887ea769..053228559fd3 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -405,8 +405,13 @@ int migrate_page_move_mapping(struct address_space *mapping,
 	int nr = thp_nr_pages(page);
 
 	if (!mapping) {
-		/* Anonymous page without mapping */
-		if (page_count(page) != expected_count)
+		/*
+		 * Anonymous page without mapping. Device private pages should
+		 * never have extra references except during migration, but it
+		 * is safe to ignore these.
+		 */
+		if (!is_device_private_page(page) &&
+			page_count(page) != expected_count)
 			return -EAGAIN;
 
 		/* No turning back from here */
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
