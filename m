Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0C4497F55
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 13:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD48310E675;
	Mon, 24 Jan 2022 12:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B7C10E675
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 12:25:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id n8so22760396wmk.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 04:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PxtKyiqaXFh26Wz0s9IN+SEP9I7x6X3DPG37cs2r+vs=;
 b=pkwCIakv/xkH1MHG+GpRK9Rc4Cj94MLn6Y/S40iBDfkOKBWPyB9g2dM8mrKAO5GOfV
 oRbig5WUWFOAlFyFGxpM5q7yBtQQuwL7dMAAr8sE/mn7krB7yv2+m2X+Bc8WiS98B+B6
 Dy078aPEDJmDgj1QHYYub0TkPkncoDtgBMKKMxIzA91jY2lOPNNh2qUuJcfaML92EF+x
 Z9XRX1P7u8q+RpFbf761DAJ2dkcySUv299QyAfwEVydrC37bRZgs2FOmj2QOfPHVEoE7
 7Axzlhz1VMTNYa6ZPf7s/y0UMKnsMqbVB4M7ItjgJs4ZzdQpHTGOVybqtBiOv+IBl+0K
 U26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PxtKyiqaXFh26Wz0s9IN+SEP9I7x6X3DPG37cs2r+vs=;
 b=qEjGAqIoGWOjvt+M+tPQ5BKnwnoWLesF8ORGOWQSMNwSINO3LrcWum+YcGmZcky+cs
 4HjJ5mhg8QxUR2UrOt2luJRft151583PRj5e3yPf6NbOy9k4rNLwyTHs3zFCJuIFMDnA
 wsf6Yn2EXqAFDnjwUwo0pUakot0A7TFAdlVvPX03X9gwDoCwclQWKFdTzSj4cN8N2llZ
 QjRSF+hMPWoUXoMjVk3siuU+l8HNEQ45k/+ZncAERCNZA2TGtFtELn9lmYx0AVgsFn5Z
 W99wLCbyZk3NbDXA2LYlle4BL8C6xNyqX4B9X/k+1u5M7hG/bcV6UGPpyqZ36ydNszVt
 pYIA==
X-Gm-Message-State: AOAM533APIEFp5JtPGaTL016GoORZYDUGURmiJTh8SRKIkYjUPoM4af3
 4ViUy/xL5VwvJ5NjRhKgHl3XV7sJYeA=
X-Google-Smtp-Source: ABdhPJxzZDWVxYm4luRytdzQqXzgR0O9GXZkSoVBoJx8gv+YiFaw7owhBmreB75NN2N2+iAWhgm+4w==
X-Received: by 2002:a7b:c3c5:: with SMTP id t5mr1655723wmj.182.1643027116273; 
 Mon, 24 Jan 2022 04:25:16 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id 1sm12830516wmo.37.2022.01.24.04.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 04:25:15 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ray.huang@amd.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, bas@basnieuwenhuizen.nl
Subject: drm/ttm: moving the LRU into the resource
Date: Mon, 24 Jan 2022 13:25:02 +0100
Message-Id: <20220124122514.1832-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi guys,

let's hope that I have fixed and documented everything now.

This fixes the fundamental problem in TTM that during a move a buffer
has resources allocated from two different domains at the same time.

Additional to that it's a prerequisite to remove ghost objects and
allow to allocate multiple resources per BO.

Based on this set I've added an optimization for RADV which Bas pointed
out as valuable.

Please review, test and/or comment,
Christian.


