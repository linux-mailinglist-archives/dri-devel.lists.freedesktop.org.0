Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34EDCDD9CD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 10:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1409411B160;
	Thu, 25 Dec 2025 09:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SAmq4z5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FFD11B160
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 09:46:44 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2a0ac29fca1so56362365ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 01:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766656004; x=1767260804; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XU0H9X7fZm1Z3gPJ02BRt6tSCJ4tBeuL3gl1Fsub/EI=;
 b=SAmq4z5LRRs6dpa9jHIRd49Sh5kAOf9dqxikSP4DYH0rqQ2sy5i5Y+0OH8/4+/cTre
 OgBySxD0VB9VtYFqfVa+Yfm0fQvW2hT2qnu4NZih8c6B32QXJSOA25lxWiKJSsnSp4KA
 nnAfaVQn4h0yZsw93tYRl+rhTQKBRfl1LIw0dNfYbCUsRxjmIZbW9xUSqJ3ceHtxqVPU
 vh1nw7/QzOOF7A0KW/aPbKENx3r7aBI6WIbttPOIksCwq+0GW1VY5C3xJZxRqhuNMSQX
 mq79wOtXXH/N7xMhIsc7nQdjH2i13f15DFqryl6rylHni/cAQ0e2W+wbYfQgXazpSdY+
 fjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766656004; x=1767260804;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XU0H9X7fZm1Z3gPJ02BRt6tSCJ4tBeuL3gl1Fsub/EI=;
 b=kk9NWrmieEzMDV7q2/aApokKl02lsSicJouoLCtB5HBed9mpm6RFKVkmlRlB03RKHr
 Lj+GGOyObuhvHZxef2lWA+1Kq8amvXxOSvSSo6dipcAHRrFMSH+WKaQFPkBDFoCXtCS7
 1hi7uurBVkG263LxFh2oJIel4tnyJWbwKAsjSFnc/JIXNGFdyCHQOwAXZHXY83Mcwsve
 NJjSKMBd0Z1O/Rv5D53EzV+9QLIzlBTjHt0k5rNULIDqNq59CgKoicENOPhkGAp4Qeph
 O8yJ3i08e+jBobHdHScGBWssXprKW6f/J2TmdTnVDAWHOEnMi9kkJqQj1LP9DX3MMI7d
 NIvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWNiNNDaVj537cyY05HM8gR7fJ1zsjav/RF66j+uv8wNSLaxZqtn7pwf42sSE/IrWXlxNITDYcBxI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzN1lhK5Dx+4DvxgKaYeqPtvXwcGPUueMkPVEREzTRiXQtYuiBg
 WaRzPJMDMjIU662+7z4qicbSkvG0AOV6+0iHjoCqwO1u18muIvxKb7NB
X-Gm-Gg: AY/fxX7xhZ9/iCkXG/XEk8hU8Wy7xfAngSK95ny6JqKlu78kEfnwkFPvDcH+e/HciWa
 NKgsMGhT1/zq/ZbZebt0Sqlx/RnB14zRCyinFN8vGwzbyoIA/amBaKo8LBTKSPd09mDwl1dDUEn
 sEwq1ViVZg7UZj2TUQgtHWaAVDYS8x8YBwku79CanUXHEYNtLytdISFDrZciqBAe3jsmjQjmCi8
 YlvUl5RpWWS7eG/yAeY4Uni9W6qK0ksSjBLro9b70U/WnOsVYLCCeIKpcopp34cySpZrBT0k/7e
 430A1j72YReURKBpfCDrG+6m4vBSMmhHpHbnokSdU0PKm5oYQinzVO5hWOmTD2TQqQ6Uf5YQvMi
 QikJLpdXzSX16sc0sHxMxTIMYqmnnynDbbSPcnpNt3wA87FSmis6tzKL7kuw8eL7XUyS0xk9XYG
 4M8EZkAZl/MgSkwr0DQVRn0q8KtbUACQETStEfKzJ1dlDVe6BkY8agFOnl62/991X/w/fq8SWBR
 NBNe2iqZaV0aGNZLw==
X-Google-Smtp-Source: AGHT+IG8UD9LuX6bsFFbxzl3hXjRr3x95AGwXzFTFfSvdKzK3Y/lf0Ri78tyAb/BhqSaTEFBEEtJng==
X-Received: by 2002:a17:902:d2c5:b0:2a1:4c31:333 with SMTP id
 d9443c01a7336-2a2f2222cf4mr208327455ad.19.1766656003365; 
 Thu, 25 Dec 2025 01:46:43 -0800 (PST)
Received: from smtpclient.apple (125x103x213x40.ap125.ftth.ucom.ne.jp.
 [125.103.213.40]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c83961sm177814725ad.38.2025.12.25.01.46.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Dec 2025 01:46:43 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v4 6/9] riscv: dts: thead: add DPU and HDMI device tree
 nodes
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20251224161205.1132149-7-zhengxingda@iscas.ac.cn>
Date: Thu, 25 Dec 2025 17:46:26 +0800
Cc: "Han Gao (Revy)" <rabenda.cn@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8A7BC047-96F9-4067-976F-282FA2AE8393@gmail.com>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-7-zhengxingda@iscas.ac.cn>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
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



> On Dec 25, 2025, at 00:12, Icenowy Zheng <zhengxingda@iscas.ac.cn> =
wrote:
>=20
> From: Icenowy Zheng <uwu@icenowy.me>
>=20
> T-Head TH1520 SoC contains a Verisilicon DC8200 display controller
> (called DPU in manual) and a Synopsys DesignWare HDMI TX controller.
>=20
> Add device tree nodes to them.
>=20
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> No changes in v4.
>=20
> Changes in v3:
> - Adapting to the changed binding.
>=20
> No changes in v2.
>=20
> arch/riscv/boot/dts/thead/th1520.dtsi | 70 +++++++++++++++++++++++++++
> 1 file changed, 70 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi =
b/arch/riscv/boot/dts/thead/th1520.dtsi
> index bd5d33840884e..5c0a7072f253a 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -585,6 +585,76 @@ clk_vo: clock-controller@ffef528050 {
> #clock-cells =3D <1>;
> };
>=20
> + hdmi: hdmi@ffef540000 {
> + compatible =3D "thead,th1520-dw-hdmi";
> + reg =3D <0xff 0xef540000 0x0 0x40000>;
> + reg-io-width =3D <4>;
> + interrupts =3D <111 IRQ_TYPE_LEVEL_HIGH>;
> + clocks =3D <&clk_vo CLK_HDMI_PCLK>,
> + <&clk_vo CLK_HDMI_SFR>,
> + <&clk_vo CLK_HDMI_CEC>,
> + <&clk_vo CLK_HDMI_PIXCLK>;
> + clock-names =3D "iahb", "isfr", "cec", "pix";
> + resets =3D <&rst TH1520_RESET_ID_HDMI>,
> + <&rst TH1520_RESET_ID_HDMI_APB>;
> + reset-names =3D "main", "apb";
> + status =3D "disabled";
> +
> + ports {
> + #address-cells =3D <1>;
> + #size-cells =3D <0>;
> +
> + port@0 {
> + reg =3D <0>;
> +
> + hdmi_in: endpoint {
> + remote-endpoint =3D <&dpu_out_dp1>;
> + };
> + };
> +
> + hdmi_out_port: port@1 {
> + reg =3D <1>;
> + };
> + };
> + };
> +
> + dpu: display@ffef600000 {
> + compatible =3D "thead,th1520-dc8200", "verisilicon,dc";
> + reg =3D <0xff 0xef600000 0x0 0x100000>;
> + interrupts =3D <93 IRQ_TYPE_LEVEL_HIGH>;
> + clocks =3D <&clk_vo CLK_DPU_CCLK>,
> + <&clk_vo CLK_DPU_ACLK>,
> + <&clk_vo CLK_DPU_HCLK>,
> + <&clk_vo CLK_DPU_PIXELCLK0>,
> + <&clk_vo CLK_DPU_PIXELCLK1>;
> + clock-names =3D "core", "axi", "ahb", "pix0", "pix1";
> + resets =3D <&rst TH1520_RESET_ID_DPU_CORE>,
> + <&rst TH1520_RESET_ID_DPU_AXI>,
> + <&rst TH1520_RESET_ID_DPU_AHB>;
> + reset-names =3D "core", "axi", "ahb";
> + status =3D "disabled";
> +
> + ports {
> + #address-cells =3D <1>;
> + #size-cells =3D <0>;
> +
> + dpu_port0: port@0 {
> + reg =3D <0>;
> + };
> +
> + dpu_port1: port@1 {
> + reg =3D <1>;
> + #address-cells =3D <1>;
> + #size-cells =3D <0>;
> +
> + dpu_out_dp1: endpoint@1 {
> + reg =3D <1>;
> + remote-endpoint =3D <&hdmi_in>;
> + };
> + };
> + };
> + };
> +
> dmac0: dma-controller@ffefc00000 {
> compatible =3D "snps,axi-dma-1.01a";
> reg =3D <0xff 0xefc00000 0x0 0x1000>;
> --=20
> 2.52.0
>=20
Tested-by: Han Gao <gaohan@iscas.ac.cn>=
