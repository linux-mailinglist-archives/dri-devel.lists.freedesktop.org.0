Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5CEC7E45C
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 17:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF51610E054;
	Sun, 23 Nov 2025 16:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SGW4Feee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A0110E054
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 16:42:43 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-bd1ce1b35e7so2358432a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 08:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763916163; x=1764520963; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=d0j1F7QCP+4D9igowWdEVkA8R7gqxJbBFhGcJ/oVN5w=;
 b=SGW4Feee0bABAR8t8qD7bl4w/SAMNHmEh4VLLErhy0RHyh8LLRQe4N3OlJi7Wew2yv
 2+VA1vJFYNuSQ5NsiiubRflS1aMEBuyDTlcKFSrciY+llaurDUBVnPduaoIFG/rIfzb8
 dejLYcgoUVtueWBlarr+zdPjIcg1DvQgoz3CbzN+xFg6JOuCmZZHfRiWEhLjtOUjWxfL
 QMB+s00dDZDyjAwg1QYfer0uZORAK+JBbXASKEbCjDgnbf1F5uaObPQPuvq8pW5WM8hT
 RcY7CbNIcFN6QiJrjFw+wIOdmQKxeIpZA/3hxfjh/lcufxY1rTy2dcPwVadKJ2b3Y9xZ
 cmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763916163; x=1764520963;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=d0j1F7QCP+4D9igowWdEVkA8R7gqxJbBFhGcJ/oVN5w=;
 b=AtDsYpYVLGPeoXvyfd22X7kVeq8WmtRjV7rI3mXQHSAvCKdWPvk1F5XOZ5jB6xsLXF
 WXr3reGohvyVa8pfKo5RIeat2ZvzKMZocm/qcOwc2kp8mCmwW/yXdJECTZOJDJ0Vzuf0
 wc3tjnxnUqKMa+fDaEk+fw6KY1Q3v54taqXEfcYsyU2DqsticeCEBpEeIIR5uwkbBCWD
 OOCNKRBBTvSp/44HJQ1wDzebS+ATtUjoqZ7UTBzcmaKoNO54EIJn5ZC+bsT4xToHugnO
 GEaf7Amhpuo3NO5SYThr5x6mVIFtxYXJZwaGWynnks9Q4ndZrNGynFr1+pzotVXmr3Qx
 eZMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6kA0XCg60cQKi1AHyOjmnaUKdu4r3xcd1Vfl/VJgdT2Wjva1eNA3g07ZTgIBkIiM+nTRYv2DXmCg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9xtcofmTZXkZ7CN8AfdmpKRrYfasfNOTMed9WdQ5SpOtiZass
 7wuQFuFeSW3zDIkrRHEUFI2zZG/398mlCneCEeUtslPLMrI6aX8VFiww
X-Gm-Gg: ASbGncuoup1F7B/HlnGv22AontUP0XSEkpIL3BMBJ6idqdXHv/I5+s1GvTRfpzz6eLG
 UxwX9O38RDxf2QkRLKhCxTWVgyF4p524mDKUxkeD6Buaq4T6nacIT4xSz8/Cakk+7P9DE5Gij5I
 HVwtPlMjgd4jFW50K/27j8FcJp1XGiQWCuxmWbgqd2+uW31888v4V2SE3YGVhnWSpATkLNYiaMs
 SFvUvIhzjDwvzZH6wqeoVnrE0UQE+p0vYBXEpZA3H76eGIdb+d3l7m3gACMMqeycSTXn8eDwIa2
 VIe5jkA6HCykLXIhcUVdHHmKwydexUEO5QTNoSzx/3W+dcvZ9eS2Nr5Qy7dVQTxXbea024qQYDy
 mCfaTnu3twKSztMCGjVPzZD7vc/GZX2ZxAQUJVWTb4Oshky3ent5me8m2olYc8HTLsBqJJD+upf
 C7HmuQxECCYTrdJIl9MWrJ7As=
X-Google-Smtp-Source: AGHT+IE13jqQnGMBUZ2qpPc1TDhmtseXk7/7dxNiq5aM2ZmAaTpjpGFXTOpMGpzVp9MUYxu7Pd26Pg==
X-Received: by 2002:a05:7022:2509:b0:119:e56c:18a1 with SMTP id
 a92af1059eb24-11c9d60f0a7mr5105569c88.9.1763916162816; 
 Sun, 23 Nov 2025 08:42:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11c93cd457dsm56769583c88.0.2025.11.23.08.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 08:42:41 -0800 (PST)
Date: Sun, 23 Nov 2025 08:42:39 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v9 02/13] PCI: Add devres helpers for iomap table
 [resulting in backtraces on HPPA]
Message-ID: <16cd212f-6ea0-471d-bf32-34f55d7292fe@roeck-us.net>
References: <20240613115032.29098-1-pstanner@redhat.com>
 <20240613115032.29098-3-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613115032.29098-3-pstanner@redhat.com>
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

Hi,

On Thu, Jun 13, 2024 at 01:50:15PM +0200, Philipp Stanner wrote:
> The pcim_iomap_devres.table administrated by pcim_iomap_table() has its
> entries set and unset at several places throughout devres.c using manual
> iterations which are effectively code duplications.
> 
> Add pcim_add_mapping_to_legacy_table() and
> pcim_remove_mapping_from_legacy_table() helper functions and use them where
> possible.
> 
> Link: https://lore.kernel.org/r/20240605081605.18769-4-pstanner@redhat.com
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> [bhelgaas: s/short bar/int bar/ for consistency]
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/devres.c | 77 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 58 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> index f13edd4a3873..845d6fab0ce7 100644
> --- a/drivers/pci/devres.c
> +++ b/drivers/pci/devres.c
> @@ -297,6 +297,52 @@ void __iomem * const *pcim_iomap_table(struct pci_dev *pdev)
>  }
>  EXPORT_SYMBOL(pcim_iomap_table);
>  
> +/*
> + * Fill the legacy mapping-table, so that drivers using the old API can
> + * still get a BAR's mapping address through pcim_iomap_table().
> + */
> +static int pcim_add_mapping_to_legacy_table(struct pci_dev *pdev,
> +					    void __iomem *mapping, int bar)
> +{
> +	void __iomem **legacy_iomap_table;
> +
> +	if (bar >= PCI_STD_NUM_BARS)
> +		return -EINVAL;
> +
> +	legacy_iomap_table = (void __iomem **)pcim_iomap_table(pdev);
> +	if (!legacy_iomap_table)
> +		return -ENOMEM;
> +
> +	/* The legacy mechanism doesn't allow for duplicate mappings. */
> +	WARN_ON(legacy_iomap_table[bar]);
> +

Ever since this patch has been applied, I see this warning on all hppa
(parisc) systems.

[    0.978177] WARNING: CPU: 0 PID: 1 at drivers/pci/devres.c:473 pcim_add_mapping_to_legacy_table.part.0+0x54/0x80
[    0.978850] Modules linked in:
[    0.979277] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc6-64bit+ #1 NONE
[    0.979519] Hardware name: 9000/785/C3700
[    0.979715]
[    0.979768]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[    0.979886] PSW: 00001000000001000000000000001111 Not tainted
[    0.980006] r00-03  000000000804000f 00000000414e10a0 0000000040acb300 00000000434b1440
[    0.980167] r04-07  00000000414a78a0 0000000000029000 0000000000000000 0000000043522000
[    0.980314] r08-11  0000000000000000 0000000000000008 0000000000000000 00000000434b0de8
[    0.980461] r12-15  00000000434b11b0 000000004156a8a0 0000000043c655a0 0000000000000000
[    0.980608] r16-19  000000004016e080 000000004019e7d8 0000000000000030 0000000043549780
[    0.981106] r20-23  0000000020000000 0000000000000000 000000000800000e 0000000000000000
[    0.981317] r24-27  0000000000000000 000000000800000f 0000000043522260 00000000414a78a0
[    0.981480] r28-31  00000000436af480 00000000434b1680 00000000434b14d0 0000000000027000
[    0.981641] sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.981805] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.981972]
[    0.982024] IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040acb31c 0000000040acb320
[    0.982185]  IIR: 03ffe01f    ISR: 0000000000000000  IOR: 00000000436af410
[    0.982322]  CPU:        0   CR30: 0000000043549780 CR31: 0000000000000000
[    0.982458]  ORIG_R28: 00000000434b16b0
[    0.982548]  IAOQ[0]: pcim_add_mapping_to_legacy_table.part.0+0x54/0x80
[    0.982733]  IAOQ[1]: pcim_add_mapping_to_legacy_table.part.0+0x58/0x80
[    0.982871]  RP(r2): pcim_add_mapping_to_legacy_table.part.0+0x38/0x80
[    0.983100] Backtrace:
[    0.983439]  [<0000000040acba1c>] pcim_iomap+0xc4/0x170
[    0.983577]  [<0000000040ba3e4c>] serial8250_pci_setup_port+0x8c/0x168
[    0.983725]  [<0000000040ba7588>] setup_port+0x38/0x50
[    0.983837]  [<0000000040ba7d94>] pci_hp_diva_setup+0x8c/0xd8
[    0.983957]  [<0000000040baa47c>] pciserial_init_ports+0x2c4/0x358
[    0.984088]  [<0000000040baa8bc>] pciserial_init_one+0x31c/0x330
[    0.984214]  [<0000000040abfab4>] pci_device_probe+0x194/0x270

Looking into serial8250_pci_setup_port():

        if (pci_resource_flags(dev, bar) & IORESOURCE_MEM) {
                if (!pcim_iomap(dev, bar, 0) && !pcim_iomap_table(dev))
                        return -ENOMEM;

This suggests that the failure is expected. I can see that pcim_iomap_table()
is deprecated, and that one is supposed to use pcim_iomap() instead. However,
pcim_iomap() _is_ alrady used, and I don't see a function which lets the
caller replicate what is done above (attach multiple serial ports to the
same PCI bar).

How would you suggest to fix the problem ?

Thanks,
Guenter
