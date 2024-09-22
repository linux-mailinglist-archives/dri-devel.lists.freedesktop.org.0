Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE66997E0FA
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 12:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D49D10E339;
	Sun, 22 Sep 2024 10:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A2ZwnT8s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B1810E339
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 10:51:12 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7198de684a7so2639803b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 03:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727002271; x=1727607071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfaKNPUCoZktFoxA7ex47D6NTps/yVQORN1Hk0vnOKM=;
 b=A2ZwnT8s4XSzTKq4mkkeqgtDjQmUppVPfCGVyvp0qiVML5ac6I3sbzWwcNFZ3sdL6M
 QDq6Tkrm1AqtjuaQy14/5wtKjVXsNlsViSOCCiZBwTAqzg5i/e5biMQ8DiSDfa0NliGl
 Znn5t7rAUodVi4Mm3m6Cfy77jLDuVx0PLz1d+6kOv2PITOtj8P5fNXtW8fE0r2Q68PwI
 YpkH1GO5Sl2vhN21Ka/z4alDOkS0IxOsdRng51jsMHbuOqvO279w7xqo3CeQZfIoRt32
 PHdVpTB9+la79Ij/3DiBjn+A4T0B4/y/Ar1c40rzYhw9VUR2JCpdMlJEiaRI0/DY67n9
 +tqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727002271; x=1727607071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VfaKNPUCoZktFoxA7ex47D6NTps/yVQORN1Hk0vnOKM=;
 b=nfdpAIo+N+MwGDa9I3PdVxvAY0jNhGDDXMOz2/irbm0Hmc4Ya4/7cMq2x1z5lZoObp
 qjFsq1OcIJNRrLHfOvXpbBBMRbUV2Wf/Q4yo94floJUpCyRGQQu9Gt4K7qcfu7bRp7oa
 2xrOqiyS9XEMOplgEVa1364Rg1S3+/SRMx5F1lhElHgUU1ZBStHUmMZRUwWASviYZPuL
 HOWUTNEuu9WLaw8V5jElZF4BKrG9knsTwIC24eLxTij2KWbMLknJta8wHknYrWQFt9eC
 wb/S2nd7s3oglVB3iVj28EPRHAV4aZVVqddvKbMitjYlAk30CEKIZCNIWXxPoypRbsyk
 7koQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPN37dVc/OZZKxxcFZDjMnBxfb/GgSVwyCzfGwT4h+ketS0ddfQpAtC1l1MAT0IQF8V9iCP+tRvUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIaCKmUs2aDXBPJb+nP1fRjcRL7SUSKb+cXG4JpUjf//5PwUYD
 UTN8gBD68Pynh7m/tQOwQzwR4nnNXufqbgQM76NLmGrSyHDvy6s2
X-Google-Smtp-Source: AGHT+IGRjH0l99ssN+QztozL46uT4nQHpNyyqkPhdTF07mheLJ1v7yxUTrAsF65SBGlcz3QAtmY5qg==
X-Received: by 2002:a05:6a00:1818:b0:717:81b3:4c7a with SMTP id
 d2e1a72fcca58-7199cebcaa9mr13621819b3a.24.1727002271429; 
 Sun, 22 Sep 2024 03:51:11 -0700 (PDT)
Received: from localhost.localdomain (42-73-147-23.emome-ip.hinet.net.
 [42.73.147.23]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944b7afaesm12300497b3a.130.2024.09.22.03.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 03:51:11 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: didi.debian@cknow.org
Cc: andy.yan@rock-chips.com, andyshrk@163.com, conor+dt@kernel.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, minhuadotchen@gmail.com,
 robh@kernel.org, s.hauer@pengutronix.de
Subject: Re: [PATCH v3 06/15] drm/rockchip: vop2: include rockchip_drm_drv.h
Date: Sun, 22 Sep 2024 18:50:45 +0800
Message-ID: <20240922105045.157612-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <D4CQTRYUPQHL.1Y42CT0P8ZOWQ@cknow.org>
References: <D4CQTRYUPQHL.1Y42CT0P8ZOWQ@cknow.org>
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

Hi,

> Maybe ``From: Min-Hua Chen <minhuadotchen@gmail.com>``?
> 
> It's very minor and Min-Hua gave their 'Reviewed-by' tag to your patch,
> but they found the problem and I thought it was just for practical
> reasons you made it part of this patch set.

Yes, you're right. The reason I reply this patch is that I am not
sure if I have to do this.

Please ignore my mail and sorry about the noise.

thanks,
Min-Hua
