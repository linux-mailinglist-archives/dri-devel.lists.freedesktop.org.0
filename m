Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BADA1C15A
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C6E10EA5F;
	Sat, 25 Jan 2025 06:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BEeArEZn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94B110E120;
 Sat, 25 Jan 2025 06:46:53 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3a8146a8ddaso7563675ab.1; 
 Fri, 24 Jan 2025 22:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787613; x=1738392413; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NIDfNAZd/Jw4pBIb/8+H7rZ6KNLM9vcRA8qjI/u0xH0=;
 b=BEeArEZnhlzqbiouSjWmZxZI/9Z9h1Xmzn4Qol9LgET0xOvtAlQaLBoSim8tlwyeU9
 DnhwZQr22MPvNA9O7ML3EQjUjTNEbwZ4j/DbTrV980X7NJWPmbdmp13gzaFI4Fwphuiz
 C26ejwMrGtxQ9JoBrkcY6xqPQ6GG/al86CxwEAqPRa3maIXETjOzYSj7MpQc0+iY7Y55
 lRIIYT0y33wH6eip/XY9vfRFrDiVaAZRfkA0pH2V0zagpl15o4orRJdOEyjePe2JAHYx
 vJvGMwEU5Z/jdbW5u0ATqttweeQ99EN7rYrp4hgyg2//poSm/fTtQ+FpppW8SZRvXJOT
 vT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787613; x=1738392413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NIDfNAZd/Jw4pBIb/8+H7rZ6KNLM9vcRA8qjI/u0xH0=;
 b=xJOcjiCLXZI/JhwD4XDiAhHjJZPrzBt71UoOAcSF4xRzZPo3AjtfKwOEu79OW0F1KU
 5fjlOqVAxPASjz2tmqNlFVtjxD3N0+YI7h4Tp84v8N47xxw0C05UuuqjZUA/tmGprMx5
 OJgdE163V9ZpYhLZi1d/ajH7gc6ywJYdPd7ouU9t4A2f52Jdi0K8YHcuBDJsdhD0sv7w
 Rq4b9AIU02kOXaoqplig53GChhZRBXvEOsxuNp+JlsCEVrni4vpHIcu8Li0AaitiXWzv
 V2bK9xS5d3kyGVXA6RJ7Qo8ULZP4dOtaqVNZ7Z+anq5PbcqDJ4BSlPBb/NLQNh4rqjik
 FlLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvbOczE7eDmLW/Y4ftAWP0n5DitDDTATfbVjPTH8gU87A08XD3vSZEUmeidUfMK+NKfs+3VRX0lAhR@lists.freedesktop.org,
 AJvYcCW4x9VYgXfgrGjmsHwTfVZNoLh8n80PJczdHhpbl3nY2cc2WNl/xAn77szAkdqNlcVlGThEa7Ea@lists.freedesktop.org,
 AJvYcCWGC3UbrGzyaLbp559ARvB1PVgqk94xxmi9HhzEy5DaZpJP6rqdQ6watMzfN97d5A0wsuQyfPMp/i7INWbmjw==@lists.freedesktop.org,
 AJvYcCXvZZD0raBjGKTQUKDns/ZcNc11dAS03pqJPrc3n4HEC7VcSChb/tn9RTQmtsTq3L09sn+es881eCXW@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7Y6W7N3zIrqkJxHJMZcjG4lX44213fLhlw+jpBqWq1XOV+NaT
 LNlEZp688P5afD4wJJLgU8ROI27j4wM6+MfGcTvXN4Jy/xAXBQxn
X-Gm-Gg: ASbGncsYPQIOvSWFDqHI++X0m8y6zmYgXDnysK0v+deGhdJUeWks8VDhaMpSXybcqVh
 cjEd87er5TBozXCisyH7vBIGYJdi6uVcAZtUvP5dzBOUKBTS7U5/hQOC4nEvikrNjjfZt9Q1trn
 D+1y/9nRhrfGtlJMY/4qlc6vjh/I9O9JOnTDU3kfzPFmtlcymEsWjpJnpCUdo6Si/zARJJis1c3
 +g1ZsA0nrl0bBU093vhH/VNtc1Xr1GLUsYPeYs3WRvBbeaFYwLaLWmcqXN3g/PtSyCd6l/nVzaG
 O0vzGdXfr+R7xR72BW/URXG9J5nRNplz+SamjQ==
X-Google-Smtp-Source: AGHT+IFnBc5L69q2w2UCaGc8rKGCQ73xwiQltSLOxSH0uqSvy0LUY+8SurgBk2ydmGJTEx6YzSwjXA==
X-Received: by 2002:a05:6602:2b8a:b0:844:bd90:d45c with SMTP id
 ca18e2360f4ac-851b65227a0mr2635707139f.13.1737787612867; 
 Fri, 24 Jan 2025 22:46:52 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:52 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>,
 Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 15/63] checkpatch: add an exception to the do-while wrapper
 advice
Date: Fri, 24 Jan 2025 23:45:29 -0700
Message-ID: <20250125064619.8305-16-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

Several new DYNDBG_CLASSMAP_* macros (added in following commits)
expand to multi-statement declarations, like module_param_named does.
They are invoked in file-scope, not in function scope, and cannot be
wrapped by a do-while, so add an exception by name for them.

cc: Andy Whitcroft <apw@canonical.com>
cc: Joe Perches <joe@perches.com>
cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9eed3683ad76..4a93b2ede8cd 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5963,6 +5963,7 @@ sub process {
 				MODULE_PARM_DESC|
 				DECLARE_PER_CPU|
 				DEFINE_PER_CPU|
+				DYNDBG_CLASSMAP|
 				__typeof__\(|
 				union|
 				struct|
-- 
2.48.1

