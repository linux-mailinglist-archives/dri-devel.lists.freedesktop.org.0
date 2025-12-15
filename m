Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004F5CBD972
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 12:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577D710E439;
	Mon, 15 Dec 2025 11:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MnLW/707";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF8310E439
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:48:40 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2a07f8dd9cdso19640605ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 03:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765799320; x=1766404120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JUAs+7T6aM5YvKJFQXSXqoVkTtSxZtzq470O+YaXF94=;
 b=MnLW/707+pZfq8yGM7E6UIgOsYea4pt5eUxEHm2c52T475VZJToDn2qM23PXLn8aHV
 MOdVkdeJkrBu+RBX43SOo9bcRqZ0P/4C8E8VwnQWZ/h7OPc7O/a3p8QcGrPCmNDNGTgu
 slaRUSV6569uXe2Vn5s8qIo7kpTKt5i/54rY+lZBzDgjNGEhiyNSLFNHSiR2S45wuu8Z
 ulw/94eCUoZuk/7NhM4RDywbahuwlXMfesujEB6RfZiraibDKzCVOUX8RDv5nWNbqXAB
 EX2t54vwrqzT312veBzW5RgxO6+4ByVifyPNCj/whUvMhqJKeYdLM0bFryKphUjNRZae
 XbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765799320; x=1766404120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JUAs+7T6aM5YvKJFQXSXqoVkTtSxZtzq470O+YaXF94=;
 b=tJMEpayyTg5ga6At4CdWmdKy+TkxYX4uzQP3JTLbAgKP/19SUB1T76ZECrnLyK+/45
 y8JaNijH1Ru0gVd7sbxOnYPo4MVtkxx2JIluoJiSQWZT2r5dEivfnPC+5MfcyvqOWOzP
 vdI8O1GKV9Hna2rc0dhqkEsFdgb4y0p0IUKGU0aI9hkszDNViwt+hUTnu6e7BgMA6iVy
 bQREYl6ee7awPkV+wYJMoUuATGK4M6Aak+SOE02a/zn3h8LUGNpwZiD8ZRX5w2wVvWAS
 UPmO3gYFIQEC49Z7xKUN4enKJqGjd3H6qYv6sSHYRszy21cKIGOd2rkRjG1nx7F9Bcyu
 WumA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVriWxtxjxxgC64cF7GkG5kLzkvDuu5EsvRwqJlxs/GC0Q82/0tyIxPZkEbgMidbz+qzk3GrFU8UY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywc6zD3GwizRKvFuijJ1+2DqGfKFKm8uARryCIV4EIs41+VU6pA
 AjxRjbyg1QZOGOCLp249ywAqOwgSHPKsbKp41WKmV8KXyas2r7Y2Er6d
X-Gm-Gg: AY/fxX6wodD1KwR+79SE7e+TEFSOXnRlVshJkEDuvuTkBnDscyiIUkiF7qw1guDLLEW
 GVgFj95z6pyj83R61qAmgFqHf2g1jc28+Mwr9amQKKmysLMonexSb79M8c3ApxUgVbH2lPv22Ra
 araCIXvd+3tYaWdw7W040JV0TuMSWFK1KwC9CtgJKGWPibjW6HD3p/RHguNG93xHKomMhCmo8wL
 sEjzKQFcrRGr/8rO/54j15L10IMS0wQlTzuoaba6Rq41cO4lEv1Af4uPf+CKnFnKjVE8BE0aTl5
 m4ztVu27KKSc7VvZvhYuKYM0RQBmNf3HKUqUZ2hjZ0tU5SBJqfoEZAtxxgqalqtafK43SjaTvmo
 JrndvnbS7GiuS++CjyQuchYJaWndp4PN39GDSvCEVVtY40s5UrZ2h75cOuyoRr8IOiZTJ7rdUX8
 We3IQ9Uwg0f1I=
X-Google-Smtp-Source: AGHT+IEA4ldqjntSU1IZe10aX19mQKLjoCVDqCMnCNeqo44SOanRLtLHyqhQX8MxC8RVHbAWKM2xrg==
X-Received: by 2002:a17:903:1a2e:b0:2a0:b02b:2105 with SMTP id
 d9443c01a7336-2a0b02b228amr63659225ad.56.1765799319837; 
 Mon, 15 Dec 2025 03:48:39 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a0867ebe9dsm77190525ad.40.2025.12.15.03.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:48:39 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 46E2D447330A; Mon, 15 Dec 2025 18:39:06 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Filesystems Development <linux-fsdevel@vger.kernel.org>,
 Linux Media <linux-media@vger.kernel.org>, linaro-mm-sig@lists.linaro.org,
 kasan-dev@googlegroups.com,
 Linux Virtualization <virtualization@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Network Bridge <bridge@lists.linux.dev>,
 Linux Networking <netdev@vger.kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Taimur Hassan <Syed.Hassan@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Dillon Varone <Dillon.Varone@amd.com>, George Shen <george.shen@amd.com>,
 Aric Cyr <aric.cyr@amd.com>, Cruise Hung <Cruise.Hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, David Hildenbrand <david@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Max Kellermann <max.kellermann@ionos.com>,
 "Nysal Jan K.A." <nysal@linux.ibm.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Alexey Skidanov <alexey.skidanov@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Vitaly Wool <vitaly.wool@konsulko.se>, Harry Yoo <harry.yoo@oracle.com>,
 Mateusz Guzik <mjguzik@gmail.com>, NeilBrown <neil@brown.name>,
 Amir Goldstein <amir73il@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 Ivan Lipski <ivan.lipski@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Lyude Paul <lyude@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Roopa Prabhu <roopa@cumulusnetworks.com>, Mao Zhu <zhumao001@208suo.com>,
 Shaomin Deng <dengshaomin@cdjrlc.com>,
 Charles Han <hanchunchao@inspur.com>, Jilin Yuan <yuanjilin@cdjrlc.com>,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
 George Anthony Vernon <contact@gvernon.com>
Subject: [PATCH 12/14] drm/scheduler: Describe @result in drm_sched_job_done()
Date: Mon, 15 Dec 2025 18:39:00 +0700
Message-ID: <20251215113903.46555-13-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215113903.46555-1-bagasdotme@gmail.com>
References: <20251215113903.46555-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=982; i=bagasdotme@gmail.com;
 h=from:subject; bh=kdwYayfiPuGdbX+6/rKZkI1jkonQkDY24KG3T7ZKuZA=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJn2n4Pfzvv2aMJ6/2fiW3RmVPTpTFSM/fBW4Nu0ikdP3
 J/+EMyq6ShlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBENP8y/FN2WnBW9dYhDc+y
 QzUe+4R7v/wRO/L/c0NDkJC4klf71CqG3yyrLnq/ur5px+nadXME75rW9sxVOp7eMOmL58xwZZ6
 TlnwA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Sphinx reports kernel-doc warning:

WARNING: ./drivers/gpu/drm/scheduler/sched_main.c:367 function parameter 'result' not described in 'drm_sched_job_done'

Describe @result parameter to fix it.

Fixes: 539f9ee4b52a8b ("drm/scheduler: properly forward fence errors")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 1d4f1b822e7b76..4f844087fd48eb 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -361,6 +361,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
+ * @result: job result
  *
  * Finish the job's fence and resubmit the work items.
  */
-- 
An old man doll... just what I always wanted! - Clara

