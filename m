Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC52544517D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 11:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416E06E822;
	Thu,  4 Nov 2021 10:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BDD6E822
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 10:16:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 552BA61216
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636020977;
 bh=v63x1fWchQ7kqn4wEuAIvWhF2o9BTqAyPxLsj8Ei/zo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jnP80OCH+pbw/LwwEjOIickyq0r9GKdPmGf8/rJONnJ/gLvGLLjVKdo/RaW8HzSLj
 lN6Y/lEKd+C4ih9fWOl4nvnSI4PzbIaaxq/FYG80lp8DvkeJ1vmg5OE0tIMt5KasrU
 QocQnVAp+2yD8XFhj96EPAQeTGFIkRDimZ7Cjjdc9t7z9KRt2WmSVlaXuTQIuDi9rm
 hVTxVQYuPSZyV4MiGTu5z01NlOBdVxl2+1+hWbFjJ+KfJT+0Vv0CTubx1mtSBlpY3V
 3gDP1f86Fb4/nvQA+HvTFKcUETM1Nbs+UZBpgJ646w2vvRBJxjNVvIXHbfpMdkTALN
 UpJKJPjLwx9oA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 521CD60F48; Thu,  4 Nov 2021 10:16:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Thu, 04 Nov 2021 10:16:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christian.koenig@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214621-2300-ldjFUft4Cr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214621-2300@https.bugzilla.kernel.org/>
References: <bug-214621-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214621

--- Comment #11 from Christian K=C3=B6nig (christian.koenig@amd.com) ---
Well it's really appreciated that you are looking into this.

One thing we might want to do is to move the warning in dma_buf_release():

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 3f63d58bf68a..6ecc01585cf4 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -75,6 +75,7 @@ static void dma_buf_release(struct dentry *dentry)
         * dma-buf while still having pending operation to the buffer.
         */
        BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
+       WARN_ON(!list_empty(&dmabuf->attachments));

        dma_buf_stats_teardown(dmabuf);
        dmabuf->ops->release(dmabuf);
@@ -82,7 +83,6 @@ static void dma_buf_release(struct dentry *dentry)
        if (dmabuf->resv =3D=3D (struct dma_resv *)&dmabuf[1])
                dma_resv_fini(dmabuf->resv);

-       WARN_ON(!list_empty(&dmabuf->attachments));
        module_put(dmabuf->owner);
        kfree(dmabuf->name);
        kfree(dmabuf);

This way users get the dma-buf warning first and maybe a bit less confused.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
