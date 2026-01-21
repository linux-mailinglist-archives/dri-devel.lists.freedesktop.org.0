Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WH1+C/YicGlRVwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 01:51:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B8B4EB66
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 01:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0525F10E1D7;
	Wed, 21 Jan 2026 00:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.beauty header.i=me@linux.beauty header.b="GqSrtII4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30C910E049;
 Wed, 21 Jan 2026 00:50:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768956649; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UhlxBe/J2Z/bcL7hclRgQZ5Uv7gnODhsa7jn2XfEYYkV7LFPWYigyVs7SzhGpC3SzPDKmV/GAsV8hTDG8Oa+IoqPdm5VgzBceCEz6kLTF/EITXvN0nhjE0IGkSwGzKPJ25Pn36vCWyDL168qS56Hz8H4hpUz7G+FrUlvd9aUZOo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768956649;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=++eBhOruQFXOJWskOWmj8yG3wl5x8pOh2Zh3olKdyDA=; 
 b=a5Izvt7jXHHFUIy8lxxFkXguQ1IJ+BZPi1IGMMfNqNWnHsAbFMMKR9EXyQfiUtKdwx1y3OeE67Yap9B3bJxxUycUUvVKZaiTcQu7VSDW3X5owBByuJaBGMjnmUu6smmef//YKKKwcOxIV92wVt7mM/I4jKv/U6TuIkl3kdIiHjg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=linux.beauty;
 spf=pass  smtp.mailfrom=me@linux.beauty;
 dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768956649; 
 s=zmail; d=linux.beauty; i=me@linux.beauty;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=++eBhOruQFXOJWskOWmj8yG3wl5x8pOh2Zh3olKdyDA=;
 b=GqSrtII4nIvbqgUlbvhJQwOCvVZ9WFNPGZDmft/md1jj7qW4KPSavxBesXwrKZPX
 VNkcyhuqfbkS15heaKkvi4lfsTQhjGuUcbr3ZB1sQY9QSNlX5ujJ8fW6sN0bpb0OarA
 pwx+OqbIM4Yc5ssJvmJ/w4xhwY6eFbmLQpv4KxLY=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1768956646808787.7509660608574;
 Tue, 20 Jan 2026 16:50:46 -0800 (PST)
Date: Wed, 21 Jan 2026 08:50:46 +0800
From: Li Chen <me@linux.beauty>
To: "Dave Airlie" <airlied@gmail.com>
Cc: "Lyude Paul" <lyude@redhat.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Simona Vetter" <simona@ffwll.ch>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "nouveau" <nouveau@lists.freedesktop.org>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <19bde085588.1b451560725069.154128025837198067@linux.beauty>
In-Reply-To: <CAPM=9tw-Mkw95g=VDgjvqQha8KaTM7e6Qs2b3bvTaNUdz-Q7Kg@mail.gmail.com>
References: <20260120121455.142960-1-me@linux.beauty>
 <CAPM=9tw-Mkw95g=VDgjvqQha8KaTM7e6Qs2b3bvTaNUdz-Q7Kg@mail.gmail.com>
Subject: Re: [PATCH] nouveau: pci: quiesce GPU on shutdown
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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
X-Spamd-Result: default: False [-1.80 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[linux.beauty:s=zmail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux.beauty];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.beauty:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@linux.beauty,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.beauty:email,linux.beauty:dkim,linux.beauty:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 67B8B4EB66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dave,

 > On Tue, 20 Jan 2026 at 22:15, Li Chen <me@linux.beauty> wrote:
 > >
 > > Kexec reboot does not reset PCI devices.
 > > Invoking the full DRM/TTM teardown from ->shutdown can trigger WARNs w=
hen
 > > userspace still holds DRM file descriptors.
 > >
 > > Quiesce the GPU through the suspend path and then power down the PCI
 > > function so the next kernel can re-initialize the device from a consis=
tent
 > > state.
 > >
 > > WARNING: drivers/gpu/drm/drm_mode_config.c:578 at drm_mode_config_clea=
nup+0x2e7/0x300, CPU#2: kexec/1300
 > > Call Trace:
 > >  <TASK>
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? enable_work+0x3a/0x100
 > >  nouveau_display_destroy+0x39/0x70 [nouveau c19e0da7fd83583a023f855c51=
0d9a3903808734]
 > >  nouveau_drm_device_fini+0x7b/0x1f0 [nouveau c19e0da7fd83583a023f855c5=
10d9a3903808734]
 > >  nouveau_drm_shutdown+0x52/0xc0 [nouveau c19e0da7fd83583a023f855c510d9=
a3903808734]
 > >  pci_device_shutdown+0x35/0x60
 > >  device_shutdown+0x11c/0x1b0
 > >  kernel_kexec+0x13a/0x160
 > >  __do_sys_reboot+0x209/0x240
 > >  do_syscall_64+0x81/0x610
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? __rtnl_unlock+0x37/0x70
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? netdev_run_todo+0x63/0x570
 > >  ? netif_change_flags+0x54/0x70
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? devinet_ioctl+0x1e5/0x790
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? inet_ioctl+0x1e9/0x200
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? sock_do_ioctl+0x7d/0x130
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? __x64_sys_ioctl+0x97/0xe0
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? do_syscall_64+0x23b/0x610
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? put_user_ifreq+0x7a/0x90
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? sock_do_ioctl+0x107/0x130
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? __x64_sys_ioctl+0x97/0xe0
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? do_syscall_64+0x81/0x610
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? exc_page_fault+0x7e/0x1a0
 > >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
 > >
 > > nouveau 0000:26:00.0: [drm] drm_WARN_ON(!list_empty(&fb->filp_head))
 > > WARNING: drivers/gpu/drm/drm_framebuffer.c:833 at drm_framebuffer_free=
+0x73/0xa0, CPU#2: kexec/1300
 > > Call Trace:
 > >  <TASK>
 > >  drm_mode_config_cleanup+0x248/0x300
 > >  ? __pfx___drm_printfn_dbg+0x10/0x10
 > >  ? drm_mode_config_cleanup+0x1dc/0x300
 > >  nouveau_display_destroy+0x39/0x70 [nouveau c19e0da7fd83583a023f855c51=
0d9a3903808734]
 > >  nouveau_drm_device_fini+0x7b/0x1f0 [nouveau c19e0da7fd83583a023f855c5=
10d9a3903808734]
 > >  nouveau_drm_shutdown+0x52/0xc0 [nouveau c19e0da7fd83583a023f855c510d9=
a3903808734]
 > >  pci_device_shutdown+0x35/0x60
 > >  device_shutdown+0x11c/0x1b0
 > >  kernel_kexec+0x13a/0x160
 > >  __do_sys_reboot+0x209/0x240
 > >  do_syscall_64+0x81/0x610
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? __rtnl_unlock+0x37/0x70
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? netdev_run_todo+0x63/0x570
 > >  ? netif_change_flags+0x54/0x70
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? devinet_ioctl+0x1e5/0x790
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? inet_ioctl+0x1e9/0x200
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? sock_do_ioctl+0x7d/0x130
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? __x64_sys_ioctl+0x97/0xe0
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? do_syscall_64+0x23b/0x610
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? put_user_ifreq+0x7a/0x90
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? sock_do_ioctl+0x107/0x130
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? __x64_sys_ioctl+0x97/0xe0
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? do_syscall_64+0x81/0x610
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? exc_page_fault+0x7e/0x1a0
 > >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
 > >
 > > WARNING: include/drm/ttm/ttm_resource.h:406 at nouveau_ttm_fini+0x257/=
0x270 [nouveau], CPU#2: kexec/1300
 > > Call Trace:
 > >  <TASK>
 > >  nouveau_drm_device_fini+0x93/0x1f0 [nouveau c19e0da7fd83583a023f855c5=
10d9a3903808734]
 > >  nouveau_drm_shutdown+0x52/0xc0 [nouveau c19e0da7fd83583a023f855c510d9=
a3903808734]
 > >  pci_device_shutdown+0x35/0x60
 > >  device_shutdown+0x11c/0x1b0
 > >  kernel_kexec+0x13a/0x160
 > >  __do_sys_reboot+0x209/0x240
 > >  do_syscall_64+0x81/0x610
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? __rtnl_unlock+0x37/0x70
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? netdev_run_todo+0x63/0x570
 > >  ? netif_change_flags+0x54/0x70
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? devinet_ioctl+0x1e5/0x790
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? inet_ioctl+0x1e9/0x200
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? sock_do_ioctl+0x7d/0x130
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? __x64_sys_ioctl+0x97/0xe0
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? do_syscall_64+0x23b/0x610
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? put_user_ifreq+0x7a/0x90
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? sock_do_ioctl+0x107/0x130
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? __x64_sys_ioctl+0x97/0xe0
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? do_syscall_64+0x81/0x610
 > >  ? srso_return_thunk+0x5/0x5f
 > >  ? exc_page_fault+0x7e/0x1a0
 > >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
 > >
 > > Signed-off-by: Li Chen <me@linux.beauty>
 > > ---
 > >  drivers/gpu/drm/nouveau/nouveau_drm.c | 24 ++++++++++++++++++++++++
 > >  1 file changed, 24 insertions(+)
 > >
 > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/n=
ouveau/nouveau_drm.c
 > > index 1527b801f013..50384462723b 100644
 > > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
 > > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
 > > @@ -1079,6 +1079,29 @@ nouveau_pmops_resume(struct device *dev)
 > >         return ret;
 > >  }
 > >
 > > +static void
 > > +nouveau_drm_shutdown(struct pci_dev *pdev)
 > > +{
 > > +       struct nouveau_drm *drm =3D pci_get_drvdata(pdev);
 > > +       int ret;
 > > +
 > > +       if (!drm)
 > > +               return;
 > > +
 > > +       if (drm->dev->switch_power_state =3D=3D DRM_SWITCH_POWER_OFF |=
|
 > > +           drm->dev->switch_power_state =3D=3D DRM_SWITCH_POWER_DYNAM=
IC_OFF)
 > > +               return;
 > > +
 > > +       ret =3D nouveau_do_suspend(drm, false);
 > > +       if (ret)
 > > +               NV_ERROR(drm, "shutdown suspend failed with: %d\n", re=
t);
 > > +
 > > +       pci_save_state(pdev);
 > > +       pci_disable_device(pdev);
 > > +       pci_set_power_state(pdev, PCI_D3hot);
 > > +       usleep_range(200, 400);\
 >=20
 > Why is this needed? it at least needs a comment.

This patch is needed for kexec/KHO/LUO reboot: firmware reset is skipped, s=
o the GPU may remain in an active/DMA=20
state and the next kernel can fail to re-init nouveau. We can=E2=80=99t cal=
l the full DRM/TTM teardown from ->shutdown() because
userspace may still hold DRM fds during shutdown, which triggers WARNs.

So the shutdown hook reuses the suspend/quiesce path (safe with open fds) a=
nd then powers down the PCI function (D3hot)
to leave the device in a consistent state for the next kernel.

Regards,
Li=E2=80=8B

