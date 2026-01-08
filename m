Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D09D01C41
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E6610E6BA;
	Thu,  8 Jan 2026 09:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="Yi+XAAks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0D510E6BA
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:12:57 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-47d1d8a49f5so19584355e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 01:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1767863576; x=1768468376; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qcvzzJMrh0MsjpTIZP7Mzs3g/YqR5+Qi1rSgpNg9db0=;
 b=Yi+XAAksL/QPnjdOgxVvCmJDK5WGfjTAiRphimu05m7pCSTwNQiThx+9bRfCZ7x5L1
 CRjdO+/J6vhm2IbKZxnn6+4jlI0AJhbRzMdZrTCH+Np7D0iHK9LDb8zpkwh+Cv2ttdFR
 02przloUf4F+qCuzKwnAvJ8TOP7OpMVFOPpAjrdTz1KH6g8R49VP1Hl2i81qVfHe2u5m
 5iiMblOcNYC3Vtv60aor18p9NAFzHykeqD14h6/UOMoXyX5GWGCmMgf7ZO1V3WvI5Eqg
 VXd7c6K6CpeEebJzd2w1PJAwG3njTsrUuOrPZwZ0aW2wYP/puPK4Hq6E/XBNIWvtdYyI
 0hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767863576; x=1768468376;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qcvzzJMrh0MsjpTIZP7Mzs3g/YqR5+Qi1rSgpNg9db0=;
 b=E9u5uwdPVtoO3Po3rVR2uWHv48bNh+v3JNa1HhFv+qF+kmCmOpcfkibZ+fqya425xA
 EjIi1Xu/NECDWQXuUWELTH1Nds0fVX6Iv8s3NbjzmVQ8PBMm0RVmOvzLfmpdkXxJ8Y+b
 FxesVluRaI0TZJYSkTCfrdwnMZ5W4exzvarMgw13okyRFvhpu3xDI+vNcIHV/1wS92/s
 u3takzEvT3B/9yUnO4b93FUz7+wH1WnWZiHkvStwRJpQAf9bUjOwKqvDpZq2IPZB9NVM
 KP0eWesgpIh0hUsuyMczeJrGKfoHXDsFr+RQHIh2/mo2BW7HUrG/PsdGBOijGuCJxKCc
 7T6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVWC1abaSvG90snMkFWrzX1FXr8bjC/6rTl1f2B4aa9+JKwMvgVMXC1hH3m1YH8Dz37K8v3mO71uA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjCOo3D4j0QuTQqpMl+NoeVHIH3EzTbs1FeXhgl79oRBU0rcdg
 cCbufwILb5W3QRJoqKbrvk7fGaFaF2MF5JYNI0gYyZKGPVl/1rCmy+ZSNVc/AnWbObM=
X-Gm-Gg: AY/fxX6OILD08grlQdLdoFMdgFmvF0Kut56j/1+a82lH5qSi3wLvEKK9V6gspUKZWti
 MzKzo3GWRGVK2BGsHWNpAQco87P+3HixqbDPylsxGRvqHKe6DQs30aSl0oKdoJcOEsXx+gC4kr7
 3de7HtYRbpkCzHwbMC9+GTWTe6vfn5lz6ALuC0h5JBBgt1OSBIsTWHtgzRDEKuuOENMR6ARd5TQ
 z2MHFao7Q+hqsgnpfZ1k/CWj9DQhT/RV9huy+cJTHDjHCwMPKn41zEMBQkq8WzhW4cG+fhjBYTU
 TfjUZANyVNs4COoBP2ZRteGvwrQZl5Ul8WqwiVjq2MQIRBjtaUy/P5BgB3x969feYdHGfMexmZ5
 vnflqFLPDosPtuWoxm4mqHSJQuTknSrdB8BL2zDcf82JTTIOcppOXPOUXjNCsg1NyGp+gnR9I/L
 gLeVhfHgNaRwLITcIY9A==
X-Google-Smtp-Source: AGHT+IEP9/Gf0jNEPP/nIaOJ3PVVTz+nOM75oWhn7OGPLdOsoh+kDwG2RY2j3+SjdUgMnPGB8cg9XA==
X-Received: by 2002:a05:600c:470c:b0:46e:53cb:9e7f with SMTP id
 5b1f17b1804b1-47d84b3b4ccmr57983425e9.18.1767863576326; 
 Thu, 08 Jan 2026 01:12:56 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.17])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f4184cbsm151578795e9.6.2026.01.08.01.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 01:12:55 -0800 (PST)
Message-ID: <f2aaa95a-fb69-46d8-ba0b-fdc793273455@tuxon.dev>
Date: Thu, 8 Jan 2026 11:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic on reboot
To: Hugo Villeneuve <hugo@hugovil.com>, dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Biju Das Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Brandt <Chris.Brandt@renesas.com>
References: <20260107164839.a490a194d975edc399d72d01@hugovil.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260107164839.a490a194d975edc399d72d01@hugovil.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi, Hugo,

On 1/7/26 23:48, Hugo Villeneuve wrote:
> Hi,
> when issuing a reboot command, I encounter the following kernel panic:
> 
> [   36.183478] SError Interrupt on CPU1, code 0x00000000be000011 -- SError
> [   36.183492] CPU: 1 UID: 0 PID: 1 Comm: systemd-shutdow Tainted: G   M                6.19.0-rc4-arm64-renesas-00019-g067a81578add #62 NONE
> [   36.183504] Tainted: [M]=MACHINE_CHECK
> [   36.183507] Hardware name: Gecko ECO2 nxtpad (DT)
> [   36.183512] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   36.183519] pc : rzg2l_mipi_dsi_host_transfer+0x114/0x458
> [   36.183538] lr : rzg2l_mipi_dsi_host_transfer+0x98/0x458
> [   36.183547] sp : ffff8000813db860
> [   36.183550] x29: ffff8000813db890 x28: ffff800080c602c0 x27: ffff000009dd7450
> [   36.183563] x26: ffff800080c5fcc0 x25: ffff000009dd7450 x24: ffff800080e1f7a8
> [   36.183573] x23: ffff000009dd7400 x22: 0000000000000000 x21: ffff000009dd7430
> [   36.183582] x20: ffff8000813db8e8 x19: 0000000002050028 x18: 00000000ffffffff
> [   36.183592] x17: 0000000000000000 x16: 0000000000000000 x15: ffff8000813db220
> [   36.183602] x14: 0000000000000000 x13: ffff800081255bc0 x12: 00000000000009a2
> [   36.183611] x11: 0000000000000336 x10: ffff8000812b28d0 x9 : ffff800081255bc0
> [   36.183621] x8 : ffff800081399000 x7 : ffff00000a042600 x6 : 0000000000000000
> [   36.183631] x5 : 0000000000000805 x4 : 0000000002000000 x3 : 0000000000000028
> [   36.183640] x2 : 0000000049627000 x1 : ffff800080c60b40 x0 : ffff800081780000
> [   36.183652] Kernel panic - not syncing: Asynchronous SError Interrupt
> [   36.183657] CPU: 1 UID: 0 PID: 1 Comm: systemd-shutdow Tainted: G   M                6.19.0-rc4-arm64-renesas-00019-g067a81578add #62 NONE
> [   36.183665] Tainted: [M]=MACHINE_CHECK
> [   36.183668] Hardware name: devboard1 (DT)
> [   36.183672] Call trace:
> [   36.183675]  show_stack+0x18/0x24 (C)
> [   36.183692]  dump_stack_lvl+0x34/0x8c
> [   36.183702]  dump_stack+0x18/0x24
> [   36.183708]  vpanic+0x314/0x35c
> [   36.183716]  nmi_panic+0x0/0x64
> [   36.183722]  add_taint+0x0/0xbc
> [   36.183728]  arm64_serror_panic+0x70/0x80
> [   36.183735]  do_serror+0x28/0x68
> [   36.183742]  el1h_64_error_handler+0x34/0x50
> [   36.183751]  el1h_64_error+0x6c/0x70
> [   36.183758]  rzg2l_mipi_dsi_host_transfer+0x114/0x458 (P)
> [   36.183770]  mipi_dsi_device_transfer+0x44/0x58
> [   36.183781]  mipi_dsi_dcs_set_display_off_multi+0x9c/0xc4
> [   36.183792]  ili9881c_unprepare+0x38/0x88
> [   36.183802]  drm_panel_unprepare+0xbc/0x108
> [   36.183814]  panel_bridge_atomic_post_disable+0x50/0x60
> [   36.183823]  drm_atomic_bridge_call_post_disable+0x24/0x4c
> [   36.183835]  drm_atomic_bridge_chain_post_disable+0xa8/0x100
> [   36.183845]  drm_atomic_helper_commit_modeset_disables+0x2fc/0x5f8
> [   36.183856]  drm_atomic_helper_commit_tail_rpm+0x24/0x7c
> [   36.183865]  commit_tail+0xa4/0x18c
> [   36.183874]  drm_atomic_helper_commit+0x17c/0x194
> [   36.183884]  drm_atomic_commit+0x8c/0xcc
> [   36.183892]  drm_atomic_helper_disable_all+0x200/0x210
> [   36.183901]  drm_atomic_helper_shutdown+0xa8/0x150
> [   36.183911]  rzg2l_du_shutdown+0x18/0x24
> [   36.183920]  platform_shutdown+0x24/0x34
> [   36.183931]  device_shutdown+0x128/0x284
> [   36.183938]  kernel_restart+0x44/0xa4
> [   36.183950]  __do_sys_reboot+0x178/0x270
> [   36.183959]  __arm64_sys_reboot+0x24/0x30
> [   36.183968]  invoke_syscall.constprop.0+0x50/0xe4
> [   36.183979]  do_el0_svc+0x40/0xc0
> [   36.183988]  el0_svc+0x3c/0x164
> [   36.183995]  el0t_64_sync_handler+0xa0/0xe4
> [   36.184002]  el0t_64_sync+0x198/0x19c
> [   36.184020] Kernel Offset: disabled
> [   36.184022] CPU features: 0x200000,00020001,4000c501,0400720b
> [   36.184028] Memory Limit: none
> [   36.495305] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---
> 
> The problem is present since linux-6.18-rc1, but not in linux-6.17. I also confirm the bug is present in linux-6.19-rc4.
> 
> The bug seems to be happening in rzg2l_mipi_dsi_host_transfer().
> 
> After bisecting, here is the first bad commit:
> 
>      commit 56de5e305d4b ("clk: renesas: r9a07g044: Add MSTOP for RZ/G2L")
> 
> Reverting this change makes the bug disappear.
> 
> My limited understanding seems to indicate that the MIPI/DSI host may
> no longer be available/on when the panel tries to send MIPI/DSI
> commands in ili9881c_unprepare(), maybe because the MIPI/DSI clock has been stopped...
> 
> The exact same board with two other panels (jd9365da and st7703) doesn't have the bug.

Could you please provide the output of command:

cat /sys/kernel/debug/mstop

for both cases?

Also, could you please check if the following diff solves your problem:

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c 
b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 5edd45424562..62957632a96f 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -1282,6 +1282,10 @@ static ssize_t 
rzg2l_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
                 value |= SQCH0DSC0AR_FMT_SHORT;
         }

+       ret = pm_runtime_resume_and_get(dsi->dev);
+       if (ret)
+               return ret;
+
         rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0AR, value);

         /*
@@ -1322,6 +1326,8 @@ static ssize_t rzg2l_mipi_dsi_host_transfer(struct 
mipi_dsi_host *host,
                         ret = packet.payload_length;
         }

+       pm_runtime_put(dsi->dev);
+
         return ret;
  }

Thank you,
Claudiu


