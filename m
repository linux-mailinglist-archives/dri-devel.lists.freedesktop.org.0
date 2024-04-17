Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6FC8A8802
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 17:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DB111363D;
	Wed, 17 Apr 2024 15:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="eSeXQ/2W";
	dkim=pass (2048-bit key; unprotected) header.d=asem.it header.i=@asem.it header.b="dKnn8c04";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Wed, 17 Apr 2024 15:46:19 UTC
Received: from e3i51.smtp2go.com (e3i51.smtp2go.com [158.120.84.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBCF11363D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 15:46:19 +0000 (UTC)
Received: from [10.86.249.198] (helo=asas054.asem.intra)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <f.suligoi@asem.it>) id 1rx7Fg-g2w585-0j
 for dri-devel@lists.freedesktop.org; Wed, 17 Apr 2024 15:31:12 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Wed, 17 Apr 2024 17:31:10 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH v1 0/1] backlight: mp3309c: fix leds flickering in pwm mode
Date: Wed, 17 Apr 2024 17:31:04 +0200
Message-Id: <20240417153105.1794134-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 Apr 2024 15:31:10.0467 (UTC)
 FILETIME=[4621B530:01DA90DC]
X-smtpcorp-track: 1rx7Fgg2w5850M.HztUDgdIVRjKa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1713367874; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=krcOgqXsGe7x+1M7PzgJWjOituJS8hooQQYOs5GAeeo=;
 b=eSeXQ/2Wmck1NpS88BM4fOtUsGzHEaegOZfk1LK14X4z05BUxtoaaIovukQPjwAZF8HAn
 146JN5Asxr0b6j7l5XvHhx+g7vjm24ThYnsAey+dogkNs/VEuB9doV2wgGBwlusALF6jwMc
 bPGUv3dYDn8/l293dZrzDsyT9nZYF6K5ovkrrDdzOp21VQei2mIHawfbTQcEwveYZUKMpje
 h/beFnI9/hSkil0WFL17jsB66VgmPFfiKDTIqBFvjJtJlM++U4zCGScSDdfE/NVvrAvSSup
 YllSusF6gCE2Pi6oUnSSwjHq7RW/iV5rnN9kmRuwdnGkWB6fu+Qb62KTB9ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1713367874; h=from : subject : to
 : message-id : date; bh=krcOgqXsGe7x+1M7PzgJWjOituJS8hooQQYOs5GAeeo=;
 b=dKnn8c04Pb0OQdeecLKZQxnnthStE8ighfdrx+VQ6GaNf1BEY4eIbgfXEH0vtKcwVtRSI
 1EKUIcTSZCyitv2ds1QeOhhKEmGgxtRAxCe7MZy8EPD3tInMtKpu34AArfoqk3W0ZzRv4PG
 EYn75vewSDpNRyZ6uMo5ZFBx0v9qalaO1ks9ZZr+WdJYN5tZqIjC9vxJ5gbJ50c45Nn736h
 cRvEhjDdwa9H7CR1p7gLc2TzUZJvjH2ou3AIlcF3+qdEytDO2U0afGjfP9dQ7HIPEQXx9bk
 HlFmKAVAhXBnBdsdSYQIZLNdrsoB7cnR92cc+nEQ17+sqvtxjp8an3mEzGpg==
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

The mp3309 has two configuration registers, named according to their
address (0x00 and 0x01).
In the second register (0x01), the bit DIMS (Dimming Mode Select) must
be always 0 (zero), in both analog (via i2c commands) and pwm dimming
mode.

In the initial driver version, the DIMS bit was set in pwm mode and
reset in analog mode.
But if the DIMS bit is set in pwm dimming mode and other devices are
connected on the same i2c bus, every i2c commands on the bus generates a
flickering on the LEDs powered by the mp3309c.

This change concerns the chip initialization and does not impact any
existing device-tree configuration.

I created this device driver for one of our boards, where both dimming
modes (pwm and analog by i2c commands) can be used.
This board uses the same i2c bus for the mp3309c and for an at24cs32
eeprom.
During further tests, I realized that, when the mp3309c is used in pwm
mode, every read operation on the eeprom caused a backlight flickering.
This is why I made this device driver modification.

Flavio Suligoi (1):
  backlight: mp3309c: fix leds flickering in pwm mode

 drivers/video/backlight/mp3309c.c | 5 -----
 1 file changed, 5 deletions(-)

-- 
2.34.1

