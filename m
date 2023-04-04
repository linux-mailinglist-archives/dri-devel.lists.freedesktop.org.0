Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 456026D5FF4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D1510E1FA;
	Tue,  4 Apr 2023 12:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA4C10E1DD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 12:14:54 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id t10so129549517edd.12
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 05:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680610493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b0o7Z7K9+zrlNWZtJcWxuL9uISamg1eDlEvrGhyuFPQ=;
 b=j8aGR4529Q/B7L4FFuUUpKd+oOGe7+MvJQicsEc3iRB0Y+Ci/+aJzCvW9lC12qHkjQ
 sLEDkBnhECal797TjMIs8owp/9eRyIDsXIcK2uUJT2XOiLsqj4Ip1VvHoGxDMExHSSgL
 pKUGPTmoAResXnsnOEzQgH9kJpmRwQSkrlfBG3kL5zN/ASl3HKBOk9TKl4917gj97DuI
 VzC7ybHo2XchlVoAOaxlF8i+YnFk1qR+4QXumsC3RHrwvGaMPTl+NJ3a4HGiEAfZzxfi
 fuQRXqMWmGLnyP7QzNmwwGJl1XxI3ZnQJv19OLwK9eZahlvnIdZ5NAtW4LXsOMLnLY8N
 qOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680610493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b0o7Z7K9+zrlNWZtJcWxuL9uISamg1eDlEvrGhyuFPQ=;
 b=4cklB8bSpNNC1poQ/PsQ0ATMsGNa24QrVT1E0h3NxEutlRLhJSorujbQTLjwan1V8W
 NRqQ6+mhtl2USj2txHy9WKBnwOMorGlzqdyNhm8nI4PnH6wKhm7BUeelf4pFqdsDwyTG
 O6aTpGMBUYC0wLebqFI+QI2VPruTZTb5r/XDUzY3R88G5wVEjivzBEF/ZNNihXPBhmw2
 jLrtPIKiyxragENo3ZiiYckUadgyJZEKpJEyW05z5JTHvCkbmLbaSCTbK4UilJ5ehyL7
 uV9wuhWWHYBYkGYKFFzo8yw3UtT1m7vXn4DtyFqzRKiJlNknFu6G68/HrWR3ELiBFRnG
 92aw==
X-Gm-Message-State: AAQBX9fGw0mMlbhMtXxc7FIrVZjrPZGOzXKdgeN1LNX71a+64d+5ho6O
 +YVdeEwgq3S2SiY4r2uhcGQCUVEySnI=
X-Google-Smtp-Source: AKy350YFK7F0DLt6YErpTfaHQEO00hBV8b2vOZwYR5f+6B8U4Uhqq41gp2ng7E+uH9YtMu5/Ybu/lQ==
X-Received: by 2002:a17:906:4bc4:b0:8af:2107:6ce5 with SMTP id
 x4-20020a1709064bc400b008af21076ce5mr1707412ejv.35.1680610492673; 
 Tue, 04 Apr 2023 05:14:52 -0700 (PDT)
Received: from localhost
 (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 me6-20020a170906aec600b008d173604d72sm5974504ejb.174.2023.04.04.05.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 05:14:52 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH] drm/tegra: plane: Improve use of dev_err_probe()
Date: Tue,  4 Apr 2023 14:14:43 +0200
Message-Id: <168061024450.2054665.10437080527226574613.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20210916073722.9110-1-caihuoqing@baidu.com>
References: <20210916073722.9110-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

On Thu, 16 Sep 2021 15:37:21 +0800, Cai Huoqing wrote:
> Return dev_err_probe() directly, because the return value of
> dev_err_probe() is the appropriate error code, and it can
> reduce code size, simplify the code.
> 
> 

Applied, thanks!

[1/1] drm/tegra: plane: Improve use of dev_err_probe()
      commit: d94e2de7bdb19ae76d9deb541999cff171e14931

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
