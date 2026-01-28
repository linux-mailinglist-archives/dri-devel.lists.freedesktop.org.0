Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IAvMmzBeWl/ywEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 08:57:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6A89DE8A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 08:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C9510E271;
	Wed, 28 Jan 2026 07:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UvJ0Hx6f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DE410E271;
 Wed, 28 Jan 2026 07:57:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 37154438DF;
 Wed, 28 Jan 2026 07:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF4AC4CEF1;
 Wed, 28 Jan 2026 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769587048;
 bh=Edxazn8QS4dzQlUgaoJvS2lJwVXq0yRqauGtKDHAMGc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UvJ0Hx6fEVhv2jb1LSVkEQLToIpw9cNVss0Rnqo1n3hSjVuN5KgSN9s/95Ut7EIou
 bFD2BKZjRl9MmGNDLIL81X+rwLYoaTU2zOC0EJGmUNLCh/DYFlZusV0S5d4zhdx8jf
 rS4JVEjsHlAJ93oLeXNseazRIp0vQkzkQw0nRr32ZLGFzjjs/QJ17apYUgf0I2QY22
 /aTvbu7/qdiBjOepoXE+V7ndBmBNFJmlA29n7j7rZmCw1lBeN9niSuuv9LhrYPlfIY
 OcOALjnZuHyTnBp7SN3wWT6Zi6Vmiad/N9Ux23JF3KFsnN8iClXPFlcILqKjM8skmG
 ix5wDgU9Hc4CA==
Date: Wed, 28 Jan 2026 13:27:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 2/7] pci: pwrctrl: add PCI pwrctrl driver for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Message-ID: <ppe6w2h32vx2jh73bcv7ip7ubr2wgwjsz4ooruplpx7gx5s4rv@qfasjbocku4r>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-2-c55ec1b5d8bf@linaro.org>
 <llbnkm72mgcsrucnp7pdkwbgyzenvhe4kudxkdixplgaoirdem@3q3me34o5drf>
 <0104896e-44d0-485a-a44e-694864c819b7@linaro.org>
 <33bbb3ec-5659-4d50-a5ff-dafa44e291dd@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33bbb3ec-5659-4d50-a5ff-dafa44e291dd@rock-chips.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9E6A89DE8A
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 02:22:50PM +0800, Shawn Lin wrote:
> 在 2026/01/28 星期三 5:53, Neil Armstrong 写道:
> > On 1/27/26 16:53, Manivannan Sadhasivam wrote:
> > > On Tue, Jan 27, 2026 at 10:57:29AM +0100, Neil Armstrong wrote:
> > > > Add support fo the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host
> > > > Controller
> > > > power control which connects over PCIe and requires specific
> > > > power supplies
> > > > to start up.
> > > > 
> > > 
> > > This driver only handles the supplies. So why can't you use the existing
> > > pwrctrl-slot driver as a fallback?
> > 
> > It would fit with no change, but the name "slot" doesn't match the goal
> > here,
> > it's not a slot at all, it's an actual pcie IC.
> > 
> 
> How about renaming slot.cto something like pci-pwrctrl-simple.c, especially
> if most power sequences fit into this category? This would follow the naming
> example seen in other subsystems, such as drivers/mmc/core/pwrseq_simple.c.
> 

Yes. There is no point in duplicating the drivers just for a different name.
Slot driver is relatively new. So I don't think there would be issues in
renaming the module name.

I'd prefer for 'pci-pwrctrl-generic.ko' for module name and 'generic.c' for
driver name.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
