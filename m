Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EBC24959A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED2D6E1EC;
	Wed, 19 Aug 2020 06:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8816E110
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 20:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=3ePPQTqSgA3y882cmQuH4cZ0/NskoHX+u9okIl+XkXo=; b=VPb/jaaM5wPvJZro5z+2HSvqCX
 9gh6d9rdLjBMT+/Rzt0XAeYCE7X5QxqjNMyDF/PepxRR+45kH2aMWQW6dVxp3UafRWC0QDWIeZoZb
 yix/GbC5ffGQys759nAYh3aFm9pJ5bESz5QgrYJKbk5W4r38pYryySuHvuNi8zJADmB/s/Pn6Fyaf
 sf58HlXSYYUp3PS7jC+RUoMp9WFsqR96qQhP1O9Bg8vvOeeiezXn3369DCi1o8pqp+gIMLaz9097n
 f08h6R75VUaf6OVjySrLADNFJeWwmaemiKWHm8M6GQJfISHlfMGFB8PB+LKm0zwvOM191nSlodsRT
 3ReNkIrQ==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k88DO-0007Di-IE; Tue, 18 Aug 2020 20:28:15 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Dave Airlie <airlied@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] drm: ast: fix double __iomem sparse warning
Message-ID: <a8185578-a69a-16b0-6fdf-f4e46bc4f61f@infradead.org>
Date: Tue, 18 Aug 2020 13:28:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

sparse complains about having 2 "__iomem" attributes on the same line
where only one is needed since the first one applies to everything
up to the ending ';'.
However, to make it clear(er) that both of these pointers are
"__iomem", use separate lines for them.

../drivers/gpu/drm/ast/ast_cursor.c:256:26: CK: warning: duplicate [noderef]
../drivers/gpu/drm/ast/ast_cursor.c:256:26: CK: error: multiple address space given: __iomem & __iomem

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/ast/ast_cursor.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- lnx-59-rc1.orig/drivers/gpu/drm/ast/ast_cursor.c
+++ lnx-59-rc1/drivers/gpu/drm/ast/ast_cursor.c
@@ -253,7 +253,8 @@ void ast_cursor_show(struct ast_private
 		     unsigned int offset_x, unsigned int offset_y)
 {
 	u8 x_offset, y_offset;
-	u8 __iomem *dst, __iomem *sig;
+	u8 __iomem *dst;
+	u8 __iomem *sig;
 	u8 jreg;
 
 	dst = ast->cursor.vaddr[ast->cursor.next_index];

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
