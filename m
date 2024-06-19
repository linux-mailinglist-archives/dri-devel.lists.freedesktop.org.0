Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DFB90F1FC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 17:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D3510ED0C;
	Wed, 19 Jun 2024 15:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E+SfKNmB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2A010ED11
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 15:21:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B0ABBCE1C5B;
 Wed, 19 Jun 2024 15:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7CEC2BBFC;
 Wed, 19 Jun 2024 15:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718810465;
 bh=KhSfJ4C9g703OX8e3GlopxaArmHVXCI9LGJLDMc19B4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E+SfKNmBu9nRoqGbUEf6dgIZyKMfBu//1hY/rxaUmxvRJ4IyHJkGKtOAk+3P540rs
 8UZWiYT1W8n527IPRo44/wMcgdHoueDlWOE8ZC+v1haXC2YHtdRYBi2ob7xHOhwrPv
 hv/MarYsZVzzsAtLruZZXeeRofecye4DIlYB7t9jlKbynl9Z4KKxxs755w91Ndr2DP
 NC7uGz+khxLPRa6hqN8D23ISJNEZbHYNIP/wv1yl73rWmYttZajya8qqz9mWyYLyOJ
 aym/OlPx/r2ORCx//hxgw8dhYjGEPp1MY9vAdBtJ3p5GaOANTsvj1KCceeB894jxvz
 4VwS1vCKGuOVQ==
Date: Wed, 19 Jun 2024 08:21:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: Andrew Lunn <andrew@lunn.ch>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "ogabbay@kernel.org"
 <ogabbay@kernel.org>, Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Message-ID: <20240619082104.2dcdcd86@kernel.org>
In-Reply-To: <45e35940-c8fc-4f6c-8429-e6681a48b889@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <10902044-fb02-4328-bf88-0b386ee51c78@lunn.ch>
 <bddb69c3-511b-4385-a67d-903e910a8b51@habana.ai>
 <621d4891-36d7-48c6-bdd8-2f3ca06a23f6@lunn.ch>
 <45e35940-c8fc-4f6c-8429-e6681a48b889@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 19 Jun 2024 07:16:20 +0000 Omer Shpigelman wrote:
> >> Are you referring to get_module_eeprom_by_page()? if so, then it is not
> >> supported by our FW, we read the entire data on device load.
> >> However, I can hide that behind the new API and return only the
> >> requested page if that's the intention.  
> > 
> > Well, if your firmware is so limited, then you might as well stick to
> > the old API, and let the core do the conversion to the legacy
> > code. But i'm surprised you don't allow access to the temperature
> > sensors, received signal strength, voltages etc, which could be
> > exported via HWMON.
> 
> I'll stick to the old API.
> Regaring the sensors, our compute driver (under accel/habanalabs) exports
> them via HWMON.

You support 400G, you really need to give the user the ability
to access higher pages.
