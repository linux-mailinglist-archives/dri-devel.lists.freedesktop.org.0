Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9B6144D63
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCCC6FAEF;
	Wed, 22 Jan 2020 08:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA8A6EDED
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 23:39:58 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id i7so4728797ioo.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 15:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=+0w0WKBbwoy+XHZlM6lmViUu1mqZ/+HAGtiGqaTaIuI=;
 b=vQaOL5ypyYqibKrxTRJ1DIlI3ObFeunrEHK6faoQWsn2oc7jQEb/2lMjtDXyPTlKts
 HmdaRAunY6FbLVwcHL/W2GWYIeAMsP1sC2fbiyu3CRyc3wImiJANJTIhmaX8CC+lIJiL
 xvqzpynHPUt6mR5Woquv9//SSHs31nDKwkVVE4SPW2fGYSPAU9IaWT2FOkNQLwYYCL6h
 n+mkgvoiMcHKjTPK+wJbbsMgCdXhdmoX0efhZr3orQEdGxf8dFGgHtGTXdVrGsYW5KPQ
 HtWMYXJ4CSHlAZ358TPDGSoPh1P0b4gFehISZcAekgFi/XCzzl7fG1yYDSq+1tu3q5J/
 iV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=+0w0WKBbwoy+XHZlM6lmViUu1mqZ/+HAGtiGqaTaIuI=;
 b=prBq0AWwIm+CtO+WRJl4C2P/ioP1QKSCkGGFfEg0EQtjEDRes4UdWs0rHrBXOSIRZh
 hjntpk0xQUabK0QSwJKuS9giFGakMQOkw1GhULuH9Pp0gJTPFUB6RQf2Hfg8THP6xCOi
 vWbWMpaErDo9pJ3U+MgrvaYEa+GVWrdL1XA2gLqiQGYTmZ4Rol0o6dGV4TniG4RI1++9
 38YlQ/W4lUx04fXUkdHeSulbJGIqeFcibkrF6QzYCSQDJtXTWr4dtxFoB32FX+TFzgL7
 jpfuoYiM/X3Lpb2qaETou0QRjyrjnNbBpwfhqD2Nt3RVEMEPyf/hlX8sbdyFFgKYZMz6
 7f8A==
X-Gm-Message-State: APjAAAWv6Xax+yx/E2LYQxN1M5m2wGCdb5N6xLRocZQX+gJZoQJKivEI
 qKZdELbuYur9Va7DdUmiPRqktdD3fOjIGA3mvv0=
X-Google-Smtp-Source: APXvYqxMwm+o6kpQ7E3FtGM/j1tZv6HR59Iykl/uIbyim1ncw2zYMANSJKLNwGvJJtRTCF+vcbp9SEeyDdHxsRwstno=
X-Received: by 2002:a5e:8e4c:: with SMTP id r12mr4835156ioo.119.1579649998005; 
 Tue, 21 Jan 2020 15:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20200121200011.32296-1-kdasu.kdev@gmail.com>
 <20200121200011.32296-2-kdasu.kdev@gmail.com>
In-Reply-To: <20200121200011.32296-2-kdasu.kdev@gmail.com>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Tue, 21 Jan 2020 18:39:46 -0500
Message-ID: <CAC=U0a3DN748sO+Ea51ak=KZG3xQPtNr=4fiWNDLs8PoPMSqXQ@mail.gmail.com>
Subject: [PATCH V2 2/3] arch: mips: brcm: Add 7425 flash-edu support
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, 
 Paul Burton <paulburton@kernel.org>, James Hogan <jhogan@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nand controller v5.0 and v6.0 have nand edu blocks that enable
dma nand flash transfers. This allows for faster read and write
access.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm7425.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi
b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index 410e61ebaf9e..aa0b2d39c902 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -403,8 +403,8 @@
                        compatible = "brcm,brcmnand-v5.0", "brcm,brcmnand";
                        #address-cells = <1>;
                        #size-cells = <0>;
-                       reg-names = "nand";
-                       reg = <0x41b800 0x400>;
+                       reg-names = "nand", "flash-edu";
+                       reg = <0x41b800 0x400>, <0x41bc00 0x24>;
                        interrupt-parent = <&hif_l2_intc>;
                        interrupts = <24>;
                        status = "disabled";
--
2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
