Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIY2I7BUqWli5gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:02:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E6C20F3E0
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833C810EBF9;
	Thu,  5 Mar 2026 10:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dwVs+rrj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5600C10EBF9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 10:02:21 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso116816425e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 02:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772704940; x=1773309740; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
 b=dwVs+rrjPFfTTiIDxO7MRLpTf9YZKaC1K+cxdeCgVGWoEWBMGUgmkmu+gLHSma4uQf
 dDzJ6VBGCI71GMCsZijpCYJfxxw+vULPOZ0PC6Cuva5mvERAnL6u1aNU3AtkRAYcVQgs
 EJ8dN9i5TBYIzn3id8l6fReA0Y2iNihtKg4br/utawCawhBZXp9yTkitsUdkQbDcobZc
 0QWrTYcvyPMikky843vkuavno+cFzGNwMmw5UAyzGY2k2O8CWN29MoZaMa1OKDb23W+C
 6py2DvtUoVgocuTKqn0cbLvi9mmPbbBZCVc4Uf7uOHBTAl+zIicjYPDtZEIzofgPXf/O
 fBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772704940; x=1773309740;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
 b=Fnq43sQOnOkMOBVJ3ApzOKGz0BlGUv+glDcg/m2oqkFMd1Thz5/dJ596MjJD9F/v4f
 XP+tmQ2akZEkl8q+22EqjdRg4l2Gz3b+9MpFOd9T2x4IEgZMLbrrEHBxlOIFIetvQG6t
 hluXrgGercm9OBHErmaIaZqTHXV2Ld5xZIJOvLj+rewco/8Lf0D1gSQP3wtTW5X3TZvl
 ufL1uKGRDsZ3xpUhJ8Vu4e5V0gYPM0fryiZVx9b0mRCTtTHsGmxlmh1Q4iYvhjdTi/NB
 7+Sb2rUtKIanV4MapD6AA5se5LLlrylVHuqADrQNu2CmZLhx8BCK1VQiz4fT9GhTJDXr
 ccIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3h4KuSBSSq0lNlSMZ0aqkoOLPWoETcHpgK1EuAknrd2FyiFeXtvQythe/xQ9a0mgpJm7ArnuVaC4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtzrawuhpHwzZ4mDe0HIJ8y/7dDpsEqVsaes9l4IsqW8x+LN89
 9IPohQ5ruZyFVTHfKehAGiPcAFi8m+sXNgky8bqPkRx9ygeW4GpkcRKVD5pYgFVFZqk=
X-Gm-Gg: ATEYQzzVgkuOC23bGNGbHMOzThx6J/XfwzjHgBLcAH6ijJSOC9/OzvTeExNpeo5t190
 s/O53r17qb5u2WGHDUnazd8AViVahZF6NXYVyYsauxH2Rcgp+hoXkCLjI5QrzpRmCqiCwGFaXEN
 BPwGdubH2QOc45Zph3mEDEGcRl7g4TfhVI5ckKuBo6UX9ChOtWMatcU/U+xyFcQlrOcxozQS9e6
 3t4NRA38J2Q/OUQ3RHVkpgdlWDeHbzI95uX035Tf25MCQ02/2iYb3wx6GPhZJzKRQntA0XxK0PJ
 dHvhuZYoIKwK8+JWyZbCaqXMBL1hnKdZNioSyIa9uYJublD918/4DuSoRihkf2BDhTVkiwOYvOd
 ZZILkEc5mqMsu6sZ3rWqrrQKW8GlZugv9ZwrVMENFex5n1u2daW1tvPaWod8rCCHTLBQRDviAn+
 drZq8zSql6hQywPihIW2zdTugpFEzs
X-Received: by 2002:a05:600c:a07:b0:47f:b737:5ce0 with SMTP id
 5b1f17b1804b1-4851988f31dmr86977045e9.23.1772704939633; 
 Thu, 05 Mar 2026 02:02:19 -0800 (PST)
Received: from salami.lan ([212.129.84.244]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fade9fdsm59453655e9.4.2026.03.05.02.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 02:02:19 -0800 (PST)
Message-ID: <030737fd255a49288349f06e8c1217a126ea9081.camel@linaro.org>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where missing
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, 	dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 	linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, 	linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, 	spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com, Peter Griffin	 <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Heiko
 Stuebner <heiko@sntech.de>
Date: Thu, 05 Mar 2026 10:02:16 +0000
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-6-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
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
X-Rspamd-Queue-Id: 40E6C20F3E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.oltean@nxp.com,m:linux-phy@lists.infradead.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:freedreno@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-can@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-ide@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-usb@vger.kernel.org,m:netdev@vger.kernel.org,m:spacemit@lists.linux.dev,m:UNGLinuxDriver@microchip.com,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andre.draszik@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,glider.be,gmail.com,sntech.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Action: no action

On Wed, 2026-03-04 at 19:57 +0200, Vladimir Oltean wrote:
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>=20
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>=20
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

> =C2=A0drivers/phy/phy-google-usb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +

For Google:
Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
