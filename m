Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D191B59B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 05:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B51510EBBB;
	Fri, 28 Jun 2024 03:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jookia.org header.i=@jookia.org header.b="N8Xu6dE+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5244C10EBBB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 03:55:58 +0000 (UTC)
X-Envelope-To: dri-devel@lists.freedesktop.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1719546955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=0wLuOfRqTRaguKs78irb8o6VdBfz2hGUI0GOzcpUVw8=;
 b=N8Xu6dE+cfBI/EY/A8QQtmxbhhj4CH6EbhEHF6iRAoZkGsedGvAs4/wvAOh7gp9QJmMI/4
 4YqEk0FAtnUVN79iiLfSke1W2AFPKOdxRgcbmYAKWt8gg2lc1P5h36AzLzqN0Li7F0nh/I
 eFdsUVEDsTOygVcRSPSdJ3wClqxyzHaKfPp8wDMGq3POYC43pYVSnR8aIntn4OiVaQFB27
 ddQNCCC0cMqOrq3Td5lk0UpuwxNWrsVg4q6hxEyd5jrrx7vsfL7DiuaIObnrHOf6s+x9FS
 4KpyYxNAtHCut2G8Ce2IQs24gRF4NcQ3a3rXusyzjqIZzPMo4Prw/J18F7l84Q==
Date: Fri, 28 Jun 2024 13:54:36 +1000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: dri-devel@lists.freedesktop.org
Subject: How to specify panel bit order in driver?
Message-ID: <Zn4z_OJJ07xg_xmh@titan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
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

Hello there,

A while ago I added support for the FS035VG158 panel to the kernel, with its
use case being on a Allwinner T113 board.

While troubleshooting some other issue (I will be posting about that this
weekend) I found that I need to tell the panel controller to use a bit depth of
18-bit in order for the panel to work correctly.

I plan to add another panel to the kernel that also requires setting the bit
depth, but has more configurations than just 24, 18, 16, it also supports
packing 18 of the bits together.

How all of this is configured depends on how the board and panel are wired
together, it can't be determined at runtime based on pixel formats or anything
like that. It seems to me that this needs to be specified in the device tree.

My question is: How would I represent this? A property like 'bit-depth'?
'color-mapping'? Or is there already some subsystem or convention designed for
this?

John.
