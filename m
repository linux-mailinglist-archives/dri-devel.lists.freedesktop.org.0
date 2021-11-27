Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D8045FC9C
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 05:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3786EA6D;
	Sat, 27 Nov 2021 04:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B246EA6D
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 04:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=JpoOMJMYMW9tcxE94X859etox3VfwYCZQ0qurO9ustY=; b=OZhmPpKbgrBkifLt3TmctHJAkT
 MYxfgYb4vh0t6xBSidvR1uRJ/aHJfKctwweU/JE3b7Njoiq1ELqJASzSgk7ySc8tqFsQOtzUv0LBR
 ktkGOrXxWvkSJz/dUzUhmV87VZNz45IQascPNqOQxz+ZCgopKBlsZI2UtH6LVWhBUdMQ/BVi6J+Is
 Gq9oAmSb2AdjANfBingZIfp0OdZsEsVUI8uyA08pimu5OqxgXP3STwnTJMVeAttyAo2WswyFDimZr
 Vc3txUIU1Gi4cYnF2PF4zDwxTmKMGokKGi3NG6igPkFdjsz+IlIyHpni4MqkJY2Y+xFCtWSq6e91h
 JVVOG+1w==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqpmg-00CwhV-AM; Sat, 27 Nov 2021 04:57:58 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] agp: parisc-agp: fix section mismatch warning
Date: Fri, 26 Nov 2021 20:57:57 -0800
Message-Id: <20211127045757.27908-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 kernel test robot <lkp@intel.com>, linux-parisc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>, Kyle McMartin <kyle@mcmartin.ca>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix section mismatch warning in parisc-agp:

WARNING: modpost: drivers/char/agp/parisc-agp.o(.text+0x7a0): Section mismatch in reference from the function init_module() to the function .init.text:parisc_agp_setup.isra.0()
The function init_module() references
the function __init parisc_agp_setup.isra.0().
This is often because init_module lacks a __init 
annotation or the annotation of parisc_agp_setup.isra.0 is wrong.

Fixes: 08a6436816f7 ("[PARISC] Add support for Quicksilver AGPGART")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: David Airlie <airlied@linux.ie>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
 drivers/char/agp/parisc-agp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20211126.orig/drivers/char/agp/parisc-agp.c
+++ linux-next-20211126/drivers/char/agp/parisc-agp.c
@@ -378,7 +378,7 @@ find_quicksilver(struct device *dev, voi
 	return 0;
 }
 
-static int
+static int __init
 parisc_agp_init(void)
 {
 	extern struct sba_device *sba_list;
