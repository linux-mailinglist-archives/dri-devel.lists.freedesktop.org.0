Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220BC652FEA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 11:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B400C10E44D;
	Wed, 21 Dec 2022 10:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C33810E44D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:54:43 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id o5so14523675wrm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 02:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aklw2jl3XnFdmw/HpIxQPuULWv8N191ETMwU6JhxxM4=;
 b=O9h5bcxY/bmV+lAR+XwSlXBv53dPlAW4s9Aq7AtMfvytWWdahsMhckktzehq0X0A02
 pH9gl/KF3vewZ7tHPnvcwgwXIJWsRC1FSdTJhW+uVwKIxYV3dPGfE3YSQ6Q/sfYmB3cI
 W4IjWOaN0di+U+sPznxUtiuOu3QrZGa1YiEaqz0EzTOC1FEuyZqKKTnX17CWLyndr8Ki
 Id/btXNqTgV2gRvXessrSH0y69tMm35wd7n5P+JSMzOY4nJEJc3ny/amFfBsiWjikRmx
 7kmoHsAyJr9gVP2kD7yirkJYKf6M7ckBp84TCG2m/7pShKaWmtbWTBhvEY1blYaO4/iM
 xjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aklw2jl3XnFdmw/HpIxQPuULWv8N191ETMwU6JhxxM4=;
 b=w9sxbv8TIXKLXD1mgZ5B3qp6Wz8XJA6Ao/oq5BZRR58+faepu6jWtXlYo2dYsjCaDm
 NqSocGTgSTmMR13AiK6qAiOQG1lHtRirGusS1saxp7vhGyn0LiQREMmuQLbA/s5Pgk7X
 p/8azyMqCYRCjUnbsNEzqRwPWNgFyPCfOARCfGdyRrOzYAQocoyawGGvcFvtjuIuUAEi
 wnEqYo56yw4ai6QLTDL5ZL86sQhEFaK7TLJcgxNtNu7nuH9uMf74k5xEhUXnLq2bYfWZ
 ah5a4J+3dhhj4ioWwwq5OYLgnWzib00Bcm+fZMm0m3B8Py8y7qqcECmOmRrjFk6HPq7z
 IC2Q==
X-Gm-Message-State: AFqh2koaHpzayPXJk80crpign/UuBJVjAEs3nuM3ZoW60liLDD6uzEXR
 vxyB4FKbA6xnK9Iy8p4VWDA=
X-Google-Smtp-Source: AMrXdXtV42q/+hey/28X9GdgHrY1kgVulkHepAG10WUtueDz0Unp9DXQRivayHT77v0FoHXtilcIzQ==
X-Received: by 2002:a5d:4a90:0:b0:26c:2061:cf11 with SMTP id
 o16-20020a5d4a90000000b0026c2061cf11mr670238wrq.1.1671620081601; 
 Wed, 21 Dec 2022 02:54:41 -0800 (PST)
Received: from localhost.localdomain ([37.55.203.63])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a056000108500b0023657e1b980sm15080156wrw.53.2022.12.21.02.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 02:54:41 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] efi: earlycon: move to video/console to prepare for
 changes
Date: Wed, 21 Dec 2022 12:53:59 +0200
Message-Id: <20221221105402.6598-3-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221105402.6598-1-markuss.broks@gmail.com>
References: <20221221105402.6598-1-markuss.broks@gmail.com>
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
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-fbdev@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 Markuss Broks <markuss.broks@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-efi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kim Phillips <kim.phillips@amd.com>,
 Jami Kettunen <jami.kettunen@protonmail.com>, linux-serial@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This would make the next patch in series with this one to
show a clear diff, instead of just removing the previous
driver and creating a new one.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/{firmware/efi => video/console}/earlycon.c | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename drivers/{firmware/efi => video/console}/earlycon.c (100%)

diff --git a/drivers/firmware/efi/earlycon.c b/drivers/video/console/earlycon.c
similarity index 100%
rename from drivers/firmware/efi/earlycon.c
rename to drivers/video/console/earlycon.c
-- 
2.39.0

