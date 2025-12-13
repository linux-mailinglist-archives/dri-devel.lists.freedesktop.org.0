Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C95ACBA831
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 11:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536B010E3CA;
	Sat, 13 Dec 2025 10:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fmQQpUNM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2DE10E094
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 10:20:13 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2a09d981507so1152445ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 02:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765621212; x=1766226012; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vDk2RYtju5qtTpUCS+SSH/qPrCY50aSULuux/1/O0pk=;
 b=fmQQpUNMrH74HPCUB8uJvvz1n1cSHCpYLNeg7KLbaChP/PRTlmweVGOy20Ksx+OrTB
 NswZJ5OVSiJdr9e9cU6sIV2y+6TWFFS0+miJjx44sExbC4TZSs3GYiqsvczJpj1e1TaY
 lfZAZr4yQnrXouwcq7HIktWEuOPySLt4nM0mhE/FyNN+mGHyxc5580cnClMA2cV4Act/
 SRkMxhDFKSsRnf4IjoE0N0MejOpNRg4/6fgsZ5GZeK+qQE4h9QBV2lRezW7ASW1DM432
 63s9jujXmTHxxIk7w/6cPMgoQvikEeZT+npR8dbNtQx4HhDYni8vBRq3GXsD47jSeSPw
 t1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765621212; x=1766226012;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vDk2RYtju5qtTpUCS+SSH/qPrCY50aSULuux/1/O0pk=;
 b=OB3Vw5xJVdmJkTSGfTJqp5k4I9+vQMNjNYQRuvTnbIrg9xyP+aUWyod2jP8NninFOx
 x5rwTYc+gUBz2/oYGrC2CWSxatSj0c+o2eQmX6hBbW4j9JC7K/twXyzJsoQUnodozwq1
 1XRHlidRs/tX/wRNTkgpsfdouGBrPNU23AFEXh3C4r/i54DfRDdDxqxfuM7XqelRH9Pu
 /d46PmBUf+9GZtZloXATJBbJky2QvX1Ey7LSrzL7Sw8ffw82Zx2CakgbDh4XzcEArf7G
 JRXJDfvVC1GpK1F/YoqnGi5UioM9cxFvKkeBAYeH9UwpJmfGz2Ga/EEJ57p+VuWsO+3h
 0qxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOtayXUUfUAhzZFff8fx7ftjHmq3Zehm12UgG/W4aqNwSUaBGuylAsr7J4n6CfpPfiX0Pdg++xyQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfZ0vBn/3rx3UFXbTqjA8+81fChuAO445WNaoU3A5eLNxv1KjQ
 2BbCHhp0lHk43LjPVrLpSEQynyDowzNYV1shFXAZuty8OJDVYdEjRA7X
X-Gm-Gg: AY/fxX6vYZsjTEPecHjuvTxh9ue3C1kegC91OAVnmjev0wepAYnZAP8peKOXBTmGN1E
 IjYJONR1AQS3Y42QfNAGI7CLMA3TlZ6gWj8LbZ2zqdUu0TmIYPpQWEQeZ7dnxpjFeaFCJt2leod
 ILeotroHCC+NJHLc6/Bi9lJ01T6RSVATSFW8uyEZLkljr4LspGdwf2qEVfw9YJLlZXK7TZ9WQKE
 eb4XPbRahxSnTkIkDj4RALLuPzoCthy/+hZ1Qxe9MwHUP7mMBTprLtTA0gK10chDIoRfrl/VmE9
 NKq3dVqDVbptNupt7KNkOWPvq1rreTrPMtqXYbWh9fw0rmeKyqFy0qTlpR5nDscPRZWGu/TQtka
 +4NblkXPVBg07bUqet45BcDLGnhpOvHIQJST2DzHTwTw1xsPYBdaH+c/pCjXokPDwZn/pXgrJeo
 DM9vY1n9nWfseS0EoKEXM=
X-Google-Smtp-Source: AGHT+IFu9zPL+mIphNboykWtLWGEbFoexbc06Rx6KFOEt6W1rTUNLE0jEqrLOWhn7Hq+MEnNrC1oTg==
X-Received: by 2002:a17:902:db11:b0:295:50f5:c0e3 with SMTP id
 d9443c01a7336-29f24e6fd04mr52687645ad.14.1765621212431; 
 Sat, 13 Dec 2025 02:20:12 -0800 (PST)
Received: from LilGuy ([2409:40c2:105b:dc88:1107:395c:23c0:2b1b])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-29eea016c6esm79041905ad.59.2025.12.13.02.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Dec 2025 02:20:11 -0800 (PST)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: Helge Deller <deller@gmx.de>, Andrew Morton <akpm@linux-foundation.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Frank Li <Frank.Li@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Kees Cook <kees@kernel.org>,
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
 linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Subject: [PATCH] fbdev: arkfb: Request legacy VGA I/O region
Date: Sat, 13 Dec 2025 15:49:32 +0000
Message-ID: <20251213154937.104301-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 10:37:27 +0000
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

The arkfb driver uses the legacy VGA I/O range (0x3c0+) but does not
request it. This can cause conflicts with other drivers that try to
reserve these ports.

Fix this by using devm_request_region() during the probe function.
This ensures the region is properly reserved and automatically released
on driver detach.

Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---
Compile-tested only on x86_64.

 drivers/video/fbdev/arkfb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index ec084323115f..24e4c20d1a32 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -1018,6 +1018,12 @@ static int ark_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)

 	pcibios_bus_to_resource(dev->bus, &vga_res, &bus_reg);

+	if (!devm_request_region(&dev->dev, vga_res.start, 64 * 1024, "arkfb-vga")) {
+		dev_err(info->device, "cannot reserve legacy VGA ports\n");
+		rc = -EBUSY;
+		goto err_find_mode;
+	}
+
 	par->state.vgabase = (void __iomem *) (unsigned long) vga_res.start;

 	/* FIXME get memsize */

base-commit: a859eca0e4cc96f63ff125dbe5388d961558b0e9
--
2.52.0

