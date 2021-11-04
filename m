Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EE64452C9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 13:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0C86EE0A;
	Thu,  4 Nov 2021 12:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4797A6EE0A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 12:15:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 207A561244
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636028149;
 bh=qgRshXjZ2aeFVU+kPa61USCjkIFLXuVXOwcaFAnGlV0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eT8I+JJT3tnkwhYH1/ka0a5lwm6ln0AsNfDn2hTrB99mtDMTxHSah4VEtff5l4JiQ
 M9TPmJBbnJyPmjIcweLvwECN7/3Vrt2xKoJxgETnxiA7VgA200da8MasbQ4xRgA0Qx
 Zl1RrCpEZNDXyI6cs8p8ZEItCqFS3P9reEqIsRQ2piA6fZ9My9eHHy6JMv8dOdFIFC
 dUzUD0rKv8/VL20vWOUFl5+wbupxU8l+IhKrT4NTwswatdpRIb1AY/n03Si5KPDGFh
 2LZLsuxHeljEMCgT+5KHgpCzcekZTjzk4mHYAOXNbx5dPA78I+3ZiBygOhhQ+5OKOB
 Lm4Xr1gEniPww==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1DC54610F9; Thu,  4 Nov 2021 12:15:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Thu, 04 Nov 2021 12:15:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Lang.Yu@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214621-2300-znyzOkWEh9@https.bugzilla.kernel.org/>
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

--- Comment #12 from Lang Yu (Lang.Yu@amd.com) ---
(In reply to Christian K=C3=B6nig from comment #11)
> Well it's really appreciated that you are looking into this.
>=20
> One thing we might want to do is to move the warning in dma_buf_release():
>=20
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 3f63d58bf68a..6ecc01585cf4 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -75,6 +75,7 @@ static void dma_buf_release(struct dentry *dentry)
>          * dma-buf while still having pending operation to the buffer.
>          */
>         BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
> +       WARN_ON(!list_empty(&dmabuf->attachments));
>=20=20
>         dma_buf_stats_teardown(dmabuf);
>         dmabuf->ops->release(dmabuf);
> @@ -82,7 +83,6 @@ static void dma_buf_release(struct dentry *dentry)
>         if (dmabuf->resv =3D=3D (struct dma_resv *)&dmabuf[1])
>                 dma_resv_fini(dmabuf->resv);
>=20=20
> -       WARN_ON(!list_empty(&dmabuf->attachments));
>         module_put(dmabuf->owner);
>         kfree(dmabuf->name);
>         kfree(dmabuf);
>=20
> This way users get the dma-buf warning first and maybe a bit less confuse=
d.

The warning was just merged into mainline 5.15.0 on Tue Nov 2 16:47:49
2021(commit 56d33754481f). Not sure Erhard F.'s build contains this warning=
.=20

And we can also add a debug WARN() into amdgpu_dma_buf_pin() to see who pin=
ned
dma_buf.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
