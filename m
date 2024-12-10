Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C919EB049
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB0D10E1BD;
	Tue, 10 Dec 2024 11:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="RuEz1aVQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57CA10E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 11:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KbVJw5J4GWJ01T8kGIEWydEYZvhCAGIPzpK/iHXKbT8=; b=RuEz1aVQq20Lt9i1RM6zkuMFJP
 E7gWUPReBqKH8hpAFsniOi4v/LpHXv3Huxx0sfQy6a6Wv4J8NoiuKlL56oJ3qoVXx8FhEKY6PMtJN
 ZlEeAarE6zVUMWD2bArovq74ytqUrvtYhvxy66Wh7mwUtEnrz0Sz1Iqu5xioV064XpTb4dBa3HR2l
 LL3z9/hSMcy+0EdyOgpDFDzVLZ0qHW7r4Rn4bBa4SO0AtawcKWHheuFdCZHHYXM2p/E2Ucn2vedyZ
 C7JA5VBytM4DCLM+U8MgACvIs57uqQXQFYUli/U7BKzTLVA0bNP3xs9OQFSM8Jbttbyl1OFEz0VDU
 e+IKUKqA==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tKys5-00058v-Pm; Tue, 10 Dec 2024 12:57:45 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, Andy Yan <andy.yan@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v5 01/18] drm/rockchip: vop2: Add debugfs support
Date: Tue, 10 Dec 2024 12:57:44 +0100
Message-ID: <4471861.MSiuQNM8U4@diego>
In-Reply-To: <20241209122943.2781431-4-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
 <20241209122943.2781431-4-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Andy,

Am Montag, 9. Dezember 2024, 13:29:13 CET schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> /sys/kernel/debug/dri/vop2/summary:  dump vop display state
> /sys/kernel/debug/dri/vop2/regs: dump whole vop registers
> /sys/kernel/debug/dri/vop2/active_regs: only dump the registers of
> activated modules
> 
> Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
> Tested-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---

> +static void __vop2_regs_dump(struct seq_file *s, bool active_only)
> +{
> +	struct drm_info_node *node = s->private;
> +	struct vop2 *vop2 = node->info_ent->data;
> +	struct drm_minor *minor = node->minor;
> +	struct drm_device *drm_dev = minor->dev;
> +	const struct vop2_regs_dump *dump;
> +	unsigned int i;
> +
> +	drm_modeset_lock_all(drm_dev);
> +
> +	regcache_drop_region(vop2->map, 0, vop2_regmap_config.max_register);
> +
> +	if (vop2->enable_count) {
> +		for (i = 0; i < vop2->data->regs_dump_size; i++) {
> +			dump = &vop2->data->regs_dump[i];
> +			vop2_regs_print(vop2, s, dump, active_only);
> +		}
> +	} else {
> +		seq_printf(s, "VOP disabled\n");
> +	}
> +	drm_modeset_unlock_all(drm_dev);
> +

nit: not needed empty line at the end of the function

> +}
> +

> +static void vop2_debugfs_init(struct vop2 *vop2, struct drm_minor *minor)
> +{
> +	struct dentry *root;
> +	unsigned int i;
> +
> +	root = debugfs_create_dir("vop2", minor->debugfs_root);
> +	if (!IS_ERR(root)) {
> +		for (i = 0; i < ARRAY_SIZE(vop2_debugfs_list); i++)
> +			vop2_debugfs_list[i].data = vop2;
> +
> +		drm_debugfs_create_files(vop2_debugfs_list,
> +					 ARRAY_SIZE(vop2_debugfs_list),
> +					 root, minor);
> +	}
> +}
> +
> +static int vop2_crtc_late_register(struct drm_crtc *crtc)
> +{
> +	struct vop2_video_port *vp = to_vop2_video_port(crtc);
> +	struct vop2 *vop2 = vp->vop2;
> +
> +	if (drm_crtc_index(crtc) == 0)
> +		vop2_debugfs_init(vop2, crtc->dev->primary);
> +
> +	return 0;
> +}

I'm wondering about, shoudln't there be an unregister step too?
I.e. the late_register callback says:
"should be unregistered in the early_unregister callback" [0].

And there exists drm_debugfs_remove_files(), though it doesn't
seem t be used much - just by tegra.

I haven't managed to find drm code handling that automatically though?


Heiko


[0] https://elixir.bootlin.com/linux/v6.12.4/source/include/drm/drm_crtc.h#L737
[1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/drm_debugfs.c#L265


