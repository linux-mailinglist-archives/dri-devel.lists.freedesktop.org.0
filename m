Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE0F16167C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 16:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DE789BD2;
	Mon, 17 Feb 2020 15:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B46E89BD2;
 Mon, 17 Feb 2020 15:45:14 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id t14so18963150wmi.5;
 Mon, 17 Feb 2020 07:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bk8Dl3EQzDBZc3sM1wqRJRPyzqsxBh5vDspKM3eX+so=;
 b=WNljljO+oZOXHPT7G8/wHmDUc7eXCeRSjJN8mxEjNsMl+i0BlqXbfsBXehXwW8ZRhg
 rdjDOipfVokQakn64+MAv8N/06JhT6QG37nbzXo3AZqFBVcFdrVdOSpBFx4MclIowRkC
 zCHJMXoAa+Z+cLcFx0xVXSHQWu1eBtX1ryb4a2IaEKCUJshNH4aMNPHIisVqV83gcmz+
 yYNHQpGdltRdpnxkrld/kOSYBw2HgWC8+GOBvC5myqitz4rr7o81oPlP458v13dHoFCL
 rP5KGvBVt0UUYY/PfAPy/pGhKSnuRWTPWID83uqc69GI2+V5EzuihwhO4XR90FPr2rvt
 8DCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bk8Dl3EQzDBZc3sM1wqRJRPyzqsxBh5vDspKM3eX+so=;
 b=ktkXV1Y8ti9dTBvlTGkmgBk5jYp00RGJLNuvib9WqoBngpYVu+R6j5lhRslFcGXuXZ
 fzSSxGtIGNgBjDb9pad7RoKYFlJPixZIC4An/d0X0xLXQ2TW0qMMJ4WU8SRpeocWm088
 TtqQoMPAhQCI6Aq+yudPg+nTPipJVdR0Eb32R5HQnRVYTH3mjl2IXXFElF1S1B/Y/iZS
 /z4l3L/gwQYebKKQHPR19uMi6DF7j0oJlrkGfo93vMX+tCbSskasfXTjHYUNeK6pZChL
 9AUYeXnEzWFp0PtXgBhMUCoocigdl1U4tc3tgIhtp/Cv8iTBWg7gPUIxf8aN5VJn+qRa
 PL9Q==
X-Gm-Message-State: APjAAAWQj24L3AoWyTqV7qtEfBbZtz9jN3hOs/CGosF1WA5IUBTu1VUW
 cCFIyCgooSnTArnGHOKdych9L9DU
X-Google-Smtp-Source: APXvYqxsNPkGShSg1gX/ncCQ6dLNr0YQg7ZPft5wm9SohggaPkW0AhZe8qWm+XdqGRvs6lUVE4JxwQ==
X-Received: by 2002:a1c:4008:: with SMTP id n8mr22840668wma.121.1581954312699; 
 Mon, 17 Feb 2020 07:45:12 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:180d:d2d6:6ff9:a6cb])
 by smtp.gmail.com with ESMTPSA id r6sm1372658wrq.92.2020.02.17.07.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 07:45:12 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: RFC: Unpinned DMA-buf handling
Date: Mon, 17 Feb 2020 16:45:04 +0100
Message-Id: <20200217154509.2265-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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

Hi everyone,

hopefully the last iteration of those patches.

For now I've addressed the issue of unmapping imported BOs from the amdgpu page tables immediately by locking the page tables in place.

For HMM handling we are getting the ability to invalidate BOs without locking the VM anyway, so this last TODO will probably go away rather soon.

Place comment,
Christian.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
