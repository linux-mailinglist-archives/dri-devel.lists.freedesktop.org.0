Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D607FCBB6B3
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 06:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B52E10E0AC;
	Sun, 14 Dec 2025 05:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TL2yn7BN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5A810E0AC
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 05:49:34 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2a0ac29fca1so4367765ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 21:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765691374; x=1766296174; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+hDgRCphZ8iRo09ep5SU5olQTYl13jEHMw2TZJC3PDk=;
 b=TL2yn7BN48E0RQa89CVh4Qbi8JK9H/5ITRfgNZVI67T/SloOvn5agN9VPDOfZtFlIT
 8UM1iWZ7G95g/qJtzJ9qNIXPnTeLTNa+HcvGoJOzHIla9+E1T0NwoFLlkDSgAekSTvUG
 7zaT7rtrLNoNKs5s0wRn29FDovbpigQj163A6cOy0Z6kpu5eHmR0IxOeB7m1NjIHZ92q
 Yahm4ySDi98t1RHQJquUsmE8pto1La2qzJgIz5TTVnrhgvKgwUHDadJEd6EIyOckA3cA
 wUAch39mrmWd62g1HHU7SCwDEIv2LHcKI4lCkLJfAspSY2TIsXoD/YYYo92/OGCxIWKH
 u++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765691374; x=1766296174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+hDgRCphZ8iRo09ep5SU5olQTYl13jEHMw2TZJC3PDk=;
 b=fPZWWokkP2ZRZGYrkWI0TNcHu9EyR73DaOmGJ6JjjpTxW2qfAMTx3RKFCLWHnhOOf2
 +I/+kDpvQ5r6/Z5KcGfWbZneNsHXwPYSe+ncwMZCRYBMsYrNoonAH0ozr7HJQ5hzeyQm
 jdkFv6jV3YKG3A7yP/DH5uGbv7z8zvT6Sl/jG24HoC1TnkBZTN42/reFHG5/3xRmul2o
 5hU5O04WgJTHhincU01QAY2G1LQVKHKePuiznUq00B3geJeaIvrHR+5sI8ulEV+24iDi
 GViTwiTqjtT/fSH9BXcL+OGiE/HFASp5YbVTDWvXehDJjveXrOQzf6zeL5HnnfL63t32
 AJJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1GOowjb1bL1dtmsamhHj8uN2umDkfDTRzFlLYCAz5kRzn0QUiUImUU2BBV/5hIT5OxpAKzhyc0ps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoBnLm7wGkomts+w0rQYyypVgkotJTtdtvLRMn9Iw5a8bY/CcB
 rtdEJ/qK87kisHLJbVawP1psd4oGqrMatN5JDKYJki1rtfPATpGl/q8G
X-Gm-Gg: AY/fxX63ilCXmTZZD99QlvbPiOvB3Bxr6g0RCHMg2YqtPvr15zALsehNodxx3kYfCSd
 tMFL6Xlob2ibxIhabev4yOvBmp7YGdVDRN1O+YpOljIoGqLvw5cLJjVuBvw/Fnfcm9HxmHshORD
 pnmVKfmOykYNG9lQgGUoJ5Pz85LJ25fVOdQBobqe+nox0WaDFH8u+ZKvAX2Hoiw6AVbt63nCV4q
 GB2duy5g8+vSNtNmOyrZgypo12WBN/TryZEgohiT2zxFlqoL6ZgFjVu12AIJvQf77I3dXJYAEzO
 WGfHQrC9vutjHgqHW5hT9EHqih3GejuwjCtjqB/HpvHdL5tnfYhPB44N5YV+Fwklm8PeKeX53EL
 o/RHUQHiu9GP05CFt5fubaez/h9UlrpSi/2ZaVN/dOPTjjkMkTdsUwxF2TEf7jhK/wvwuZXbJt3
 VMUNBQM53yMdRovvvIL5o=
X-Google-Smtp-Source: AGHT+IHbBmMzxC9eOq1PBy6WNwWJgWsq6/i6rrCnGtJaL5axAS1lDM+WDsS6C+/2vxsP07EACEoEbg==
X-Received: by 2002:a17:903:120e:b0:295:24ab:fb06 with SMTP id
 d9443c01a7336-29f23b7620amr74234765ad.22.1765691373802; 
 Sat, 13 Dec 2025 21:49:33 -0800 (PST)
Received: from LilGuy ([2409:40c2:105b:dc88:1107:395c:23c0:2b1b])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-29ee9d38adcsm97224455ad.30.2025.12.13.21.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Dec 2025 21:49:33 -0800 (PST)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: sam@ravnborg.org
Cc: Frank.Li@nxp.com, akpm@linux-foundation.org, david.hunter.linux@gmail.com,
 deller@gmx.de, donettom@linux.ibm.com, dri-devel@lists.freedesktop.org,
 hverkuil+cisco@kernel.org, kees@kernel.org, konrad.dybcio@oss.qualcomm.com,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 nicolas.dufresne@collabora.com, rongqianfeng@vivo.com,
 skhan@linuxfoundation.org, swarajgaikwad1925@gmail.com,
 vivek.kasireddy@intel.com, ydirson@free.fr, ziy@nvidia.com
Subject: Re: [PATCH v2] fbdev: arkfb: Request legacy VGA I/O region
Date: Sun, 14 Dec 2025 11:19:14 +0000
Message-ID: <20251214111914.4976-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213223850.GA419250@ravnborg.org>
References: <20251213223850.GA419250@ravnborg.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thanks for the review.

You are right that the cast to (void __iomem *) makes it look like memory,
but the resource is explicitly initialized as I/O ports a few lines earlier:

    vga_res.flags = IORESOURCE_IO;

Since the resource flag is IORESOURCE_IO (targeting the legacy VGA ports),
I used devm_request_region() instead of devm_request_mem_region().

Best regards,
Swaraj
