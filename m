Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB377F3232
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 16:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDEB10E4E2;
	Tue, 21 Nov 2023 15:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 573 seconds by postgrey-1.36 at gabe;
 Tue, 21 Nov 2023 15:19:02 UTC
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4AC10E4E2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 15:19:02 +0000 (UTC)
Received: from [10.0.3.168] (unknown [93.240.169.83])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5A56061E5FE01;
 Tue, 21 Nov 2023 16:08:56 +0100 (CET)
Message-ID: <c9e3a8f1-d053-4203-a364-0d0703fafd19@molgen.mpg.de>
Date: Tue, 21 Nov 2023 16:08:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Powered off Philips TV sends corrupt EDID causing flickering
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Linux folks,


Connecting a USB Type-C port replicator [1] to the only USB Type-C port 
of the Dell XPS 13 9360 with Debian sid/unstable and Debian’s Linux 
kernel 6.10.5, and then connecting a Philips 40PFL5206H/12 TV device, 
that is powered off or in standby, to the HDMI port, Linux logs:

```
[    0.000000] Linux version 6.5.0-4-amd64 
(debian-kernel@lists.debian.org) (gcc-13 (Debian 13.2.0-6) 13.2.0, GNU 
ld (GNU Binutils for Debian) 2.41) #1 SMP PREEMPT_DYNAMIC Debian 
6.5.10-1 (2023-11-03)
[…]
[    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
[…]
[  160.004836] EDID has corrupt header
[  160.004866] 	[00] BAD  00 00 00 00 00 00 00 00 00 7f ff ff ff ff ff ff
[  160.004875] 	[00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  160.004881] 	[00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  160.004886] 	[00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  160.004905] 	[00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  160.004911] 	[00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  160.004917] 	[00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  160.004921] 	[00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[  160.013662] Registered IR keymap rc-cec
[  160.014001] rc rc0: DP-1 as /devices/pci0000:00/0000:00:02.0/rc/rc0
[  160.014305] input: DP-1 as 
/devices/pci0000:00/0000:00:02.0/rc/rc0/input33
[  160.228342] EDID has corrupt header
[  160.408917] EDID has corrupt header
```

The internal display of the laptop also switches off shortly, but comes 
back after two or three seconds. This is very likely due to me 
configuring the internal display to turn off once an external display is 
used.

No idea, why the TV is able to transmit anything at all, when it is 
turned/powered off. To avoid the flickering, would it be possible to 
ignore events from displays sending such incorrect EDID?


Kind regards,

Paul
