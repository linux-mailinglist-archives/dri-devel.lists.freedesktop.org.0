Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61E0CBD878
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 12:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225EC10E443;
	Mon, 15 Dec 2025 11:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LqNbMNcQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A473410E43E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:39:12 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2a0bb2f093aso13323885ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 03:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765798752; x=1766403552; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TWXueLrhDneeDmCGizpSHzMSgAg8yMgxTmeT/qXEn+I=;
 b=LqNbMNcQKsragaPgBw/EoMHq3lSEpzmBnTfUvr2A2jaOowLlKgKAZ3Dwj/KXHWcbYt
 kK8Uh6md1AlSihptP7ky1maUEqyqFpScA03IHnoyh3LVjMaMERaKWJw8Pwxow6OdTlN8
 dw3+CTpRGdHMKHJYCVCT++M17dlPWXm45MWWn9tNvwJsROHOMJBJCKMFuWs6VCZrD/y8
 7ErMt4gifwO/iEHes1gSXzXSmSYSAmkLW1rMKLSCeh7Rm9UYT7lZtaIQDyjkdYW0ou93
 fXHPbVpwbNfHZhTe4HEXJd719pq2LHLECR209IV8nXRA3HsnaUg8kaOYn40prWquKWGU
 zlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765798752; x=1766403552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TWXueLrhDneeDmCGizpSHzMSgAg8yMgxTmeT/qXEn+I=;
 b=NFWee6/LVelTM4k1ruG5Mhv0qx23ryE/50B9xu1pjtqWGjgOeSTQq9QJlFCAe7LYTR
 M/O+R/jIOyvC/JTuK0Kl9oJcL3QsuTzhCI98hMlbxrDcemb2m3uNwKmdmTTz74dR2A3T
 UQeif4dOnT0Y+f45SkJWtQy0h51nHJHWYFd87ZgTfM5tz2N9viOiRO71zwGmqK5agDc2
 jnFnOZkZOBBDmCEeX8S0WnlzwE0J1GWHGorzB/fIHOc5zXuxr1aN4iHNuWVci+V9kOg5
 8qNzmDXJockTi7byzxxbWUMd7P/LH0bvAJNhVWBr9ZxOwPBmSctMXxTIb80nFUsxXAwS
 uYMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx3Oy8umZwsGu9UcN/Y4C7Y3G6/I32TMUSS3O0LcvmI3qWSSxUzvSfDb8/1ayo2Zak4FafkC8T8PU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzjnz29ZjfGp+0PozqZe9CI2hHwCBPIM4dauKTBb61emRgxjbPC
 t86A9kKUKNsD8VBmrDGPHp/5Zlfe5WSx8amSJIn62YBfzQNr9EOgZJWF
X-Gm-Gg: AY/fxX6/vdO6r7C2ukkZVN64iJbYqYel1y63ps6bL0AryyJrWEFTbLF+OpJ+grZxb+y
 kq6IxH8m3kz5L/4N6IWFaYtVNebVzJEfBjxEaNemfFZeaihxRRcbVoBhMdQnJv6mY52PSTHiCUp
 ms/ap6aR80PX+Ga90i924pF1EGre+y/xOsUiNt5Coujkmc5sxJMNgYSU8iVc7tS800Y+6XbmILo
 H7mfzrtLF2PCsUSKlkHUkD9vrCcveNGghvXHnJeh+vm40CS7BPxqB6U+E/CgUyp2luPFw1XszRJ
 yR/r83lh5t9DUPi2iua+xnxcOFIroQCLKuQrwGLywIY1cAqQLwsnQ2G4MPS43XTk4acxUVuaexl
 IgRF7z/SkxJ5WReciiv7A08H6CWrdm4ABcbFkZGOV2sGBK64JFR3vBOkq+CogWrFE2ivpQzMhU+
 qP2A+9sRFdy28=
X-Google-Smtp-Source: AGHT+IHBwyvn37cMWft6XaLu78i521F3TitB1ZgZCjrLkgz/dWJXwkRq1mT1+qz6m/LgaTgF4rxTDQ==
X-Received: by 2002:a17:903:3d10:b0:2a0:a4b7:44af with SMTP id
 d9443c01a7336-2a0a4b74893mr49683665ad.26.1765798752075; 
 Mon, 15 Dec 2025 03:39:12 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29ee9d36ddcsm132733715ad.32.2025.12.15.03.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:39:11 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 504F3444B392; Mon, 15 Dec 2025 18:39:05 +0700 (WIB)
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
 George Anthony Vernon <contact@gvernon.com>, Thomas Graf <tgraf@suug.ch>
Subject: [PATCH 03/14] textsearch: Describe @list member in ts_ops search
Date: Mon, 15 Dec 2025 18:38:51 +0700
Message-ID: <20251215113903.46555-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215113903.46555-1-bagasdotme@gmail.com>
References: <20251215113903.46555-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=896; i=bagasdotme@gmail.com;
 h=from:subject; bh=1tOY86lhWOCbSHsqmK/tuDEilXGPwKXl/15tM3wSixs=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJn2n4Mqzx7cbGl2s1Xb5iYDm7bLkws+2881173X3pa/f
 UbeT2+PjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEzk0hqGfzoRZw50iXbWS+pV
 RRyxzVGfNT/eQV3w9+MclUw9PumMlYwMO5cdc7i131P/rrG85octa1tun66WP3rW6W/Ropnr7E6
 G8AIA
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

WARNING: ./include/linux/textsearch.h:49 struct member 'list' not described in 'ts_ops'

Describe @list member to fix it.

Cc: Thomas Graf <tgraf@suug.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Fixes: 2de4ff7bd658c9 ("[LIB]: Textsearch infrastructure.")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 include/linux/textsearch.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/textsearch.h b/include/linux/textsearch.h
index 6673e4d4ac2e1b..4933777404d618 100644
--- a/include/linux/textsearch.h
+++ b/include/linux/textsearch.h
@@ -35,6 +35,7 @@ struct ts_state
  * @get_pattern: return head of pattern
  * @get_pattern_len: return length of pattern
  * @owner: module reference to algorithm
+ * @list: list to search
  */
 struct ts_ops
 {
-- 
An old man doll... just what I always wanted! - Clara

