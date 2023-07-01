Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B84F74458A
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 02:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF64C10E500;
	Sat,  1 Jul 2023 00:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDCB10E500;
 Sat,  1 Jul 2023 00:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=2owrJhl/53WVtJVgmJGKRqOuXZ4S6pDn+bb6mrtUzX8=; b=iXIac+Icw9//iMR+dKqntn68Ys
 3WjdD0oasj+rLfco8DYyXIqQBQZvsx5eVG2e5Z1tblnlctWFnWV14lQkggQTMJzkVGloV8SpaDQ30
 j125QMDSEsfvXbeY9hDlaBWN/qh3yhZG36D/+PoEXAkd2qr7Y51ew23f/7lB81H6Z5J0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qFOQP-000LNE-R0; Sat, 01 Jul 2023 02:25:17 +0200
Date: Sat, 1 Jul 2023 02:25:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
 mitigations
Message-ID: <0f18f4bf-dc38-49e3-a484-ca2456549f0b@lunn.ch>
References: <20230630103240.1557100-1-evan.quan@amd.com>
 <20230630103240.1557100-2-evan.quan@amd.com>
 <3e095621-d7dc-9069-45dc-498c8f3bb4f4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e095621-d7dc-9069-45dc-498c8f3bb4f4@amd.com>
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
Cc: jingyuwang_vip@163.com, bellosilicio@gmail.com, rafael@kernel.org,
 trix@redhat.com, Lijo.Lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, Evan Quan <evan.quan@amd.com>, netdev@vger.kernel.org,
 Xinhui.Pan@amd.com, linux-wireless@vger.kernel.org, edumazet@google.com,
 Christian.Koenig@amd.com, tzimmermann@suse.de, Alexander.Deucher@amd.com,
 johannes@sipsolutions.net, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Right now there are stubs for non CONFIG_WBRF as well as other patches are
> using #ifdef CONFIG_WBRF or having their own stubs.  Like mac80211 patch
> looks for #ifdef CONFIG_WBRF.
> 
> I think we should pick one or the other.
> 
> Having other subsystems #ifdef CONFIG_WBRF will make the series easier to
> land through multiple trees; so I have a slight leaning in that direction.

#ifdef in C files is generally not liked because it makes build
testing harder. There are more permutations to build. It is better to use

if (IS_ENABLED(CONFIG_WBTR)) {
}

so that the code is compiled, and them throw away because
IS_ENABLED(CONFIG_WBTR) evaluates to false.

However, if the stubs are done correctly, the driver should not
care. I doubt this is used in any sort of hot path where every
instruction counts.

	Andrew
