Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEF5A774C1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 08:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB7A10E2A9;
	Tue,  1 Apr 2025 06:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J/Lxs/nv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4B710E2A9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 06:53:26 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id
 d9443c01a7336-2295d78b45cso9658545ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 23:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743490406; x=1744095206; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=juV0t4V1e//0+gj1OVfhRcLHZvcbuEC/YXrhy/U7qi8=;
 b=J/Lxs/nvhkrD/4zp51CkdzMNfbQbDbt2aVDMiX/a1QoUSfvlm9jbfrRX0vnPj6u2zY
 FOfRYm0FWZUoMxuY1dkCamUENwKNZ4ldnDA8t5+jdhFcw96PCc0MXz/Egn7mpUJUPKgt
 0kBTAbYTeRpGDdCEGlxcSnMcStcCXu9Di2RzyIc02hIOqwWlPawLRTKz0Z7FdAPxVx4R
 28nwKbAOnt2IUvBHGcCHYJQ8ZM66dTrdwBS17t5mtA8sClCP7A2SDaOLtwOmz/kXe6X8
 7I7u0JrfatjJxvSkoa5NMq3RGprOmMKd9sQwjzmOJgoxSPh+0BdJ6mQPns5ASIc5ljIQ
 E2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743490406; x=1744095206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=juV0t4V1e//0+gj1OVfhRcLHZvcbuEC/YXrhy/U7qi8=;
 b=tGKOHymkRPc30uug6ZC0nBq1mQvqvm/DlQmn3DJLLNVwPknihVqwZgEy6ckXhwa/k8
 FTztIeOq7jkkKzAw97NXcGwEiXRHJ7Yageht3ykN+Jtm5Q5YwqglqIzls/mntCPhVYXz
 MrVW/ReCIUumFHKAdZmEx9K979EpfBg7hztXtR5+risU1CvtsdEmkBHiAN3NynwNaSDv
 zb5jYUnQP+jDnUVsg28Vw5jiwSff33+s7x9eijEVRijYyd3ykIB0s/RltEROUr/1Ep2N
 jOfUaqeQqtE/4jNLGK74oaL/29sRbZc3cxfSkqUUutsR//G7oktHM29yr5/ceLJVgEyx
 C4fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGgmqYR9O1d1HYfVRuh+Re8xnkOCEU/yVd4J0R4P/f5LoxXDMxx3BfQAGzyNWAFXZmWjR45Bj85cA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCTRjLxYuCkYtBLKkN9JOTX9pRI9PFdG01sd2KbKhciOlMtr4E
 B20TkEdwPlODrizenLENaZyV16psWjj9zT7LtnxvJ6kAUg7pP3FI
X-Gm-Gg: ASbGnctVO4pNj1EDvePIOvNwtMHfO6w8J5POLaeGQrDbBRW8b1tsgMF6IHoLtgMBA9X
 kk+CVt7mHyXJBdaxg+DD+/Zr5WK0dbIyhuCKZvDd7ZvfrPYIsSifweAfeitOsgjLccSH3lR77Je
 XnlP0GBvtlQHXUXQyzAy2R5gPmAnYNshvJ2aY8AmMjzd7B6Ufd9Mru5phh0PJTr/FfqBv5MoaQs
 r35lfRA4b6XOxQa4GKXHyqXC8xSPWjZpFQqWx181yQ96Jcq/HDwmHdZ7XpFrZ3TSiEFrl/WL2mZ
 ySx6IUNMMHwSM3RulBytAuF3q11cahWqIGEkf01LJuEq0+H8haZXyDs+WZFvjLW7uFjeeMM=
X-Google-Smtp-Source: AGHT+IE8v+2soOjMZ/HxnufMSQX2TKoU0l9zv9vDPm095V1YC/l3ajgioV+dGEqKKpy3wthovX6FNg==
X-Received: by 2002:a17:902:da91:b0:224:191d:8a79 with SMTP id
 d9443c01a7336-2292f973a1fmr160582675ad.27.1743490406432; 
 Mon, 31 Mar 2025 23:53:26 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291f1cf882sm80743815ad.123.2025.03.31.23.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 23:53:25 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: markus@kernel.org
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] backlight: pm8941: Add NULL check in wled_configure()
Date: Tue,  1 Apr 2025 14:53:20 +0800
Message-Id: <20250401065320.20000-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d5f2aa49-27e2-4cc1-91be-4e195ed5249e@web.de>
References: <d5f2aa49-27e2-4cc1-91be-4e195ed5249e@web.de>
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

Thanks for your review. No further improvements needed for this implementation
- it already handles all error cases appropriately.

Best regards,
Henry
