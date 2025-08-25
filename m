Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EF1B33816
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 09:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F1D10E3F1;
	Mon, 25 Aug 2025 07:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="F+CZpcEH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60DF10E3F1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:48:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756108093; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Mif53jBa6MJhiFA3/aeaKEpanFEPOgAIH7H2ZuUdsrAtRPu/MgbOT3DP6FBY2rj6ePbMjSECj12yIiQqzo9EC3onYNcemMOPA7kexfcK9xKDYPuR6j4sRJVelnLZBLEQG0X38Apa47eBKSzmFFuNz9vrZ2uFGldXO/K346zQY/c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756108093;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=80dzrh8aYZfGg2XUHBNmSgUetz0wp59La7rrflIHLYk=; 
 b=hTrQDB+vFRUoh2TzCLNct7ZH6mA+ZiLxyi08MHJ278n9kJefJSS8W0fZv6yV5vnJvzDAcQZhLzydoq1k/A5PczB6y4tbslyaC/qdgSZhpG/4L25+svqU468G3JXb+BZHKPSOMfmr/+kta3MYdiQArODPHxGvpuzc+7VGFRmUwYk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756108093; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=80dzrh8aYZfGg2XUHBNmSgUetz0wp59La7rrflIHLYk=;
 b=F+CZpcEHNCcVVD5E2eusUhfW3VOUS/ZWUIpDXxI5z5QeKjtOV9RCcGxyZ/bOxE14
 x+XVoB1b6xaPLKM4peUQofBqgx8GIHy0CMMo5WJvpvX22tuJAS78545/+5x34SM4fh0
 HU9zR45BRWmSNqHl8sXRyIGwQroD2o9wsHxVH/9U=
Received: by mx.zohomail.com with SMTPS id 1756108090913704.2939268893988;
 Mon, 25 Aug 2025 00:48:10 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 19/20] clk: sp7021: switch to FIELD_PREP_WM16 macro
Date: Mon, 25 Aug 2025 09:48:05 +0200
Message-ID: <2795210.mvXUDI8C0e@workhorse>
In-Reply-To: <175340605069.3513.18204498860033427106@lazor>
References: <20250623-byeword-update-v2-0-cf1fc08a2e1f@collabora.com>
 <20250623-byeword-update-v2-19-cf1fc08a2e1f@collabora.com>
 <175340605069.3513.18204498860033427106@lazor>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Friday, 25 July 2025 03:14:10 Central European Summer Time Stephen Boyd wrote:
> Quoting Nicolas Frattaroli (2025-06-23 09:05:47)
> > The sp7021 clock driver has its own shifted high word mask macro,
> > similar to the ones many Rockchip drivers have.
> > 
> > Remove it, and replace instances of it with hw_bitfield.h's
> > FIELD_PREP_WM16 macro, which does the same thing except in a common
> > macro that also does compile-time error checking.
> > 
> > This was compile-tested with 32-bit ARM with Clang, no runtime tests
> > were performed as I lack the hardware. However, I verified that fix
> > commit 5c667d5a5a3e ("clk: sp7021: Adjust width of _m in HWM_FIELD_PREP()")
> > is not regressed. No warning is produced.
> 
> Does it generate the same code before and after?
> 

Yes, the generated machine code is exactly the same, at least with
clang, and I'll assume it'll be the same for gcc.

Kind regards,
Nicolas Frattaroli


