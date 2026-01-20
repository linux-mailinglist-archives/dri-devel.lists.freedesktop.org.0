Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHAeHFb1b2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 22:36:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567A44C5D8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 22:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EB410E09D;
	Tue, 20 Jan 2026 21:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kFPcCKFE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFCB10E229
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 21:36:17 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-88fe44cce7eso60921566d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 13:36:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768944977; cv=none;
 d=google.com; s=arc-20240605;
 b=jtYffJggmNPdcAnmFs7C6OpWGaVfe4uiTNIZoD0hZlORf9hOOwkDUcakepVXiQV1GF
 JMqD+AmIhEhxHR/HDU5C7mDiFzmFws2c+ft7JbMoyNZR0cO4OeSmfmNFxjIIl9J24pi7
 kqArH20rcpB06aOz9p74Jwe7ma6w4RiH/5i+e57lDu+gx6XdxldqJPl8K/IDZeI2/oew
 xQYVogKrelrb2oVx0RUfaSYLOE7Q+RuYqTCfJAa/K8eGCz2FCtBGjNhYwADN62m/SlId
 zXhOmBNmuo610pYkShRnJAATiMW54H09Kl/J6mBsMXjCKFGYHCSBY+XBfnF5nIy/6IN7
 SM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5nFujpvEPNRJznN7IV6as1miwfT5Y6L/k2KFAeS/YxM=;
 fh=d6+PF36woGP+58INXAbTTR9mUXpDjMDHTtJQWIrUROg=;
 b=JwPDAEEFcaMdmd68zTjzaUBM3U9Kfv9Q7WNy5VzPAn+9lrDAcXNJOy3ljFm9pQ3//h
 1YXf9gBRdNAU2/0o1ebTivo1di7CFEA5Y1V16/B18j9TiqMgTyQzWXbLT5uqt52tLABy
 JkbQJiEPASsNyoDjs4C86YbmyOVK1gQgrX16s/hqIKtlLL4RE5xZkAkqlzyG7RpA+J+y
 8KKMQ7JrM7rux3GMhv3CgRQV7/zqLnPTQMa28FW6ay0yiQcF78wvy2IuLQhxlEkz5/DV
 jSo8C1Es/osRHjZOFmqg9jKVdZhkCG6r3V6Gn3IvtikHqt2X8iARDznM9dov48TnlIR8
 bBcA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768944977; x=1769549777; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5nFujpvEPNRJznN7IV6as1miwfT5Y6L/k2KFAeS/YxM=;
 b=kFPcCKFEObsRI90w671a70UaZhCMjdUnQnM14cm6333O7kVPbtTQF8Tp/ttkB49kxz
 Qy9lvXIoOg1OzwPYy7gCSweEC3STRJ22Ny29PxDGpW9E246bFKRQb5aRe5O2vNpN+FKx
 noPqipepALChtO8TCc0zfeXm0d9hDlrfjDDgVDQhojwmD9NyXMqIiGz1ba6p4lUCIXlU
 TUQ/3tmta5nTdYduJpLlZnTY6lpcUfoplUG0vACKNAY5K4ph7CpoJ5JjfBUhYqZYsmFC
 unGiq4cU/8Tzj9crPBC9BWjECe3KF/qyZZHzcAHxyfUjvPd+JAuIalDAtX11p0x3lgs7
 2Bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768944977; x=1769549777;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5nFujpvEPNRJznN7IV6as1miwfT5Y6L/k2KFAeS/YxM=;
 b=KqnPocDwbsz/RhTeY8XQEmB/QjVgBDk7qA5zyCfe2wOAu4bnaEO3NMsS1DJ7NlaIsK
 n9/kxo0froyZKcJGI0XL+JttOlzUOsDnIStAgGTWML5nBdXiMDQ5nfSq79f2VXy8cl2R
 7p3ZvaaP0Or1fQ0pl756hux3eM6ogLEpgGwJE7CQ5y3ncmt+7bKAmOVWW2q1EdErklKJ
 zZo+2eoqn72R1HPLNbrXWAn46TeTYioH5iUnrmZtwgjOLCEYl2LXLPmC5cMSd/y5VNak
 Wlcfvk9dFG/143giPiLQGOhSTLMJRwyW8bJRuVeghjXP/EYalczXAxi20yckjszXe+32
 dkkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd61WrOEuXH6mAnBM7RMgxcJ5J4oGmfcg3RCpApn1xm8nojAowfKzHqt8szhihrSyU9tuPfkSXkds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+/+c8j8zG3GNOPzlmlz9ppGiDpAtJ0SlrI7NRTcmdhQVobOeL
 DmZXaQ8ZIg0txL03/4i6Qem2uI/mdF5/Q2QIQPFUkRfEM5YCuaHmSHdddMNMzL6cSKbQ2/ZP8XX
 aV1G3q3FqPSX1LwwHv99VPzes5XAcpJ0=
X-Gm-Gg: AZuq6aKUJSYYMD92JD+v0JVCSttmdYCXP2oKmA18aOaHh+vv4WfGo1BDngpsXh/RV7E
 ml9Z5DUZDHPw/zyktb4pBPzjy3s7eCYufLjyY3SsrYhk3Lu+XBqQL/tjADkAFPYMqZCrmo/XM4n
 KXXxIotWO9rLfgDrYsQOHevpTxcZ+q9Cu/VOf57F2NVD1Altb2ZnFyWbPavtuC0f6fceBNcoVOr
 u4vMM20J7Atl7bhmerfkqMLYcCulDclDLfiuUxqIq/Ud4FWzXGEsSf6hdvspi5tixMlNdfGQTW3
 zwVuYYnhjgttkEzufzlJ3I0bj8e+O3rPZV07EyquCsv5btHs2wIDDt4=
X-Received: by 2002:a05:6214:1cc5:b0:893:886:3816 with SMTP id
 6a1803df08f44-8946384ec3bmr42134286d6.6.1768944976692; Tue, 20 Jan 2026
 13:36:16 -0800 (PST)
MIME-Version: 1.0
References: <20260120121455.142960-1-me@linux.beauty>
In-Reply-To: <20260120121455.142960-1-me@linux.beauty>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 21 Jan 2026 07:36:05 +1000
X-Gm-Features: AZwV_QjLXpEQk5YXuxnS3fiq692HSHgxKn8FGedpRxe-Gcn5B8D9KpLEWZ-rRoM
Message-ID: <CAPM=9tw-Mkw95g=VDgjvqQha8KaTM7e6Qs2b3bvTaNUdz-Q7Kg@mail.gmail.com>
Subject: Re: [PATCH] nouveau: pci: quiesce GPU on shutdown
To: Li Chen <me@linux.beauty>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:me@linux.beauty,m:lyude@redhat.com,m:dakr@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 567A44C5D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 20 Jan 2026 at 22:15, Li Chen <me@linux.beauty> wrote:
>
> Kexec reboot does not reset PCI devices.
> Invoking the full DRM/TTM teardown from ->shutdown can trigger WARNs when
> userspace still holds DRM file descriptors.
>
> Quiesce the GPU through the suspend path and then power down the PCI
> function so the next kernel can re-initialize the device from a consistent
> state.
>
> WARNING: drivers/gpu/drm/drm_mode_config.c:578 at drm_mode_config_cleanup+0x2e7/0x300, CPU#2: kexec/1300
> Call Trace:
>  <TASK>
>  ? srso_return_thunk+0x5/0x5f
>  ? enable_work+0x3a/0x100
>  nouveau_display_destroy+0x39/0x70 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
>  nouveau_drm_device_fini+0x7b/0x1f0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
>  nouveau_drm_shutdown+0x52/0xc0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
>  pci_device_shutdown+0x35/0x60
>  device_shutdown+0x11c/0x1b0
>  kernel_kexec+0x13a/0x160
>  __do_sys_reboot+0x209/0x240
>  do_syscall_64+0x81/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? __rtnl_unlock+0x37/0x70
>  ? srso_return_thunk+0x5/0x5f
>  ? netdev_run_todo+0x63/0x570
>  ? netif_change_flags+0x54/0x70
>  ? srso_return_thunk+0x5/0x5f
>  ? devinet_ioctl+0x1e5/0x790
>  ? srso_return_thunk+0x5/0x5f
>  ? inet_ioctl+0x1e9/0x200
>  ? srso_return_thunk+0x5/0x5f
>  ? srso_return_thunk+0x5/0x5f
>  ? sock_do_ioctl+0x7d/0x130
>  ? srso_return_thunk+0x5/0x5f
>  ? __x64_sys_ioctl+0x97/0xe0
>  ? srso_return_thunk+0x5/0x5f
>  ? srso_return_thunk+0x5/0x5f
>  ? do_syscall_64+0x23b/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? put_user_ifreq+0x7a/0x90
>  ? srso_return_thunk+0x5/0x5f
>  ? sock_do_ioctl+0x107/0x130
>  ? srso_return_thunk+0x5/0x5f
>  ? __x64_sys_ioctl+0x97/0xe0
>  ? srso_return_thunk+0x5/0x5f
>  ? do_syscall_64+0x81/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? exc_page_fault+0x7e/0x1a0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> nouveau 0000:26:00.0: [drm] drm_WARN_ON(!list_empty(&fb->filp_head))
> WARNING: drivers/gpu/drm/drm_framebuffer.c:833 at drm_framebuffer_free+0x73/0xa0, CPU#2: kexec/1300
> Call Trace:
>  <TASK>
>  drm_mode_config_cleanup+0x248/0x300
>  ? __pfx___drm_printfn_dbg+0x10/0x10
>  ? drm_mode_config_cleanup+0x1dc/0x300
>  nouveau_display_destroy+0x39/0x70 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
>  nouveau_drm_device_fini+0x7b/0x1f0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
>  nouveau_drm_shutdown+0x52/0xc0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
>  pci_device_shutdown+0x35/0x60
>  device_shutdown+0x11c/0x1b0
>  kernel_kexec+0x13a/0x160
>  __do_sys_reboot+0x209/0x240
>  do_syscall_64+0x81/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? __rtnl_unlock+0x37/0x70
>  ? srso_return_thunk+0x5/0x5f
>  ? netdev_run_todo+0x63/0x570
>  ? netif_change_flags+0x54/0x70
>  ? srso_return_thunk+0x5/0x5f
>  ? devinet_ioctl+0x1e5/0x790
>  ? srso_return_thunk+0x5/0x5f
>  ? inet_ioctl+0x1e9/0x200
>  ? srso_return_thunk+0x5/0x5f
>  ? srso_return_thunk+0x5/0x5f
>  ? sock_do_ioctl+0x7d/0x130
>  ? srso_return_thunk+0x5/0x5f
>  ? __x64_sys_ioctl+0x97/0xe0
>  ? srso_return_thunk+0x5/0x5f
>  ? srso_return_thunk+0x5/0x5f
>  ? do_syscall_64+0x23b/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? put_user_ifreq+0x7a/0x90
>  ? srso_return_thunk+0x5/0x5f
>  ? sock_do_ioctl+0x107/0x130
>  ? srso_return_thunk+0x5/0x5f
>  ? __x64_sys_ioctl+0x97/0xe0
>  ? srso_return_thunk+0x5/0x5f
>  ? do_syscall_64+0x81/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? exc_page_fault+0x7e/0x1a0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> WARNING: include/drm/ttm/ttm_resource.h:406 at nouveau_ttm_fini+0x257/0x270 [nouveau], CPU#2: kexec/1300
> Call Trace:
>  <TASK>
>  nouveau_drm_device_fini+0x93/0x1f0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
>  nouveau_drm_shutdown+0x52/0xc0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
>  pci_device_shutdown+0x35/0x60
>  device_shutdown+0x11c/0x1b0
>  kernel_kexec+0x13a/0x160
>  __do_sys_reboot+0x209/0x240
>  do_syscall_64+0x81/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? __rtnl_unlock+0x37/0x70
>  ? srso_return_thunk+0x5/0x5f
>  ? netdev_run_todo+0x63/0x570
>  ? netif_change_flags+0x54/0x70
>  ? srso_return_thunk+0x5/0x5f
>  ? devinet_ioctl+0x1e5/0x790
>  ? srso_return_thunk+0x5/0x5f
>  ? inet_ioctl+0x1e9/0x200
>  ? srso_return_thunk+0x5/0x5f
>  ? srso_return_thunk+0x5/0x5f
>  ? sock_do_ioctl+0x7d/0x130
>  ? srso_return_thunk+0x5/0x5f
>  ? __x64_sys_ioctl+0x97/0xe0
>  ? srso_return_thunk+0x5/0x5f
>  ? srso_return_thunk+0x5/0x5f
>  ? do_syscall_64+0x23b/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? put_user_ifreq+0x7a/0x90
>  ? srso_return_thunk+0x5/0x5f
>  ? sock_do_ioctl+0x107/0x130
>  ? srso_return_thunk+0x5/0x5f
>  ? __x64_sys_ioctl+0x97/0xe0
>  ? srso_return_thunk+0x5/0x5f
>  ? do_syscall_64+0x81/0x610
>  ? srso_return_thunk+0x5/0x5f
>  ? exc_page_fault+0x7e/0x1a0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Signed-off-by: Li Chen <me@linux.beauty>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 1527b801f013..50384462723b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1079,6 +1079,29 @@ nouveau_pmops_resume(struct device *dev)
>         return ret;
>  }
>
> +static void
> +nouveau_drm_shutdown(struct pci_dev *pdev)
> +{
> +       struct nouveau_drm *drm = pci_get_drvdata(pdev);
> +       int ret;
> +
> +       if (!drm)
> +               return;
> +
> +       if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
> +           drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
> +               return;
> +
> +       ret = nouveau_do_suspend(drm, false);
> +       if (ret)
> +               NV_ERROR(drm, "shutdown suspend failed with: %d\n", ret);
> +
> +       pci_save_state(pdev);
> +       pci_disable_device(pdev);
> +       pci_set_power_state(pdev, PCI_D3hot);
> +       usleep_range(200, 400);\

Why is this needed? it at least needs a comment.

Dave.
