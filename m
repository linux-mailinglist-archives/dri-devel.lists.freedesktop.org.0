Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A36A873165
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 09:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34214113019;
	Wed,  6 Mar 2024 08:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id F21F210FFDA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 08:55:31 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-69-65e82f7ebc4d
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Cc: kernel_team@skhynix.com, torvalds@linux-foundation.org,
 damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org,
 adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, mingo@redhat.com,
 peterz@infradead.org, will@kernel.org, tglx@linutronix.de,
 rostedt@goodmis.org, joel@joelfernandes.org, sashal@kernel.org,
 daniel.vetter@ffwll.ch, duyuyang@gmail.com, johannes.berg@intel.com,
 tj@kernel.org, tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
 amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
 linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
 sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
 penberg@kernel.org, rientjes@google.com, vbabka@suse.cz, ngupta@vflare.org,
 linux-block@vger.kernel.org, josef@toxicpanda.com,
 linux-fsdevel@vger.kernel.org, jack@suse.cz, jlayton@kernel.org,
 dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, 42.hyeyoo@gmail.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 hdanton@sina.com, her0gyugyu@gmail.com
Subject: [PATCH v13 20/27] dept: Apply timeout consideration to
 hashed-waitqueue wait
Date: Wed,  6 Mar 2024 17:55:06 +0900
Message-Id: <20240306085513.41482-21-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240306085513.41482-1-byungchul@sk.com>
References: <20240306085513.41482-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAz2SeUiTcRjH+/3ec6PV2xR6M+hYRGF3dDxClFHUW1BIxx8lVCNfcqQmM68o
 UqcdHrNLV7pCp62hlrat25UZWrO05cQspqXZIc1p1kzTjmnUPw8fvs/3+fz1sITcSgWwqqiD
 ojpKGaGgpaS0e6xh3tEFn8SFmu8T4HTmQvB+O0GCvryMBse1UgRl1mQMXTXr4WW/G8FQ/XMC
 dDkOBIXtrQRYa9sQ2EwpNDg7x0GTt4cGe04GDZqichpefB7G4Mo9g6HUvAmenjJgqBr8SIKu
 i4Z8nQb7xicMg8YSBoxJM6HDlMfAcPsisLc1U2B7PQcuXHLRUGmzk1B7uwOD866ehray3xQ8
 rX1CguN0FgVXPQYaPvcbCTB6exhorCrAUJHqEx37+ouCx1lVGI4VX8fQ9Ooegvsn3mIwlzXT
 8MjrxmAx5xDw40oNgg5tNwNpmYMM5CdrEWSk5ZKQ6loKQwN6OjhIeOTuIYRUS7xg6y8ghToD
 L9zJa2WE1PuvGaHAHCtYTIFCUWUXFgr7vJRgLjlJC+a+M4yQ3t2EBU9DAyM8OT9ECp1NOhwS
 sFO6IkyMUMWJ6gUr90jDn2nKUbSWSeh1ZeEk1E6lIwnLc0t4Q/Od/1xa10uMMM3N4ltaBkfZ
 n5vGW7I+jHYIzi3lixvWjbAft53PSNOjdMSyJDeTH3o8ZSSWccv4uq9J+K9yKl9aUTWqkfjy
 bE82PcJybilfryn0sdTXyZbw+T8/EH8PJvEPTS3kKSQrQGNKkFwVFRepVEUsmR+eGKVKmL/3
 QKQZ+X7JeGQ49Dbqc2ytRhyLFGNlwZKPopxSxsUkRlYjniUU/rLDPzpFuSxMmXhIVB/YrY6N
 EGOq0WSWVEyULe6PD5Nz+5QHxf2iGC2q/20xKwlIQhtKFL155AbP/rPUKueX2Mp3zRdm33pR
 k9A4N3TX2pUbx8w43n419Nz53XFpHvP0gUi7ljeluHIz7TNayx07rCHPjix/ExQ8UdeqL7Ks
 sfm9z413RrfEr65/ZeskZVu03iC/8bEDdONOd7Jl847LKTem3zS8u8UVdznnLW/z32a9+EBB
 xoQrFwUS6hjlH/DytTJHAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0wTWRiGPWdmzkybrY5dohMNaipo1Cjqin663mP0xFuMuqvRTbTKuHQt
 1bTKysYLbgsKCIKmVBENVFMJRdFCTL0UCRW0uCC7VERTiSARUC7eSkSILmD88+bJ+315fr0C
 o87kRgk6wz7ZaNDqNUTJKtf+bJ56OKJVnv7ONhcyTkyH4MfjLGQXFhCouepEUFB8FENb+Qp4
 0t2OoLfqEQM2aw2C3MbnDBRXNCDw5P1NoLZ5KPiDXQR81hQC5ouFBP5904chkHkKg9O1Bh6m
 2zGU9rSwYGsjcM5mxv3RiqHHkc+DIz4cmvKyeOhrnAG+hjoOvOd9HHieTYGzFwIE7nh8LFS4
 mzDU3som0FDwlYOHFQ9YqMlI5eBKp53Am24HA45gFw//leZguGbptyV++MLB/dRSDImXrmPw
 P72NoOT4CwyugjoC3mA7hiKXlYHPl8sRNKV18JBwooeHc0fTEKQkZLJgCURC76dssnge9bZ3
 MdRS9Cf1dOewtNIu0ZtZz3lqKXnG0xzXflqUN5levNOGae77IEdd+UmEut6f4mlyhx/Tzupq
 nj4408vSZr8Nrxu9RTk/StbrYmVjxMLtyuh/zIVobxp/4G0gFcejRi4ZKQRJnCU5K98yA0zE
 iVJ9fc8gh4jjpKLUV4M/jNiulC5VLx/gH8VfpJSEbJSMBIEVw6Xe+2MGapU4W6r8EI+/KcdK
 zmulgxpFf3+y8yQZYLUYKVWZc0k6UuagIfkoRGeIjdHq9JHTTLuj4wy6A9N27olxof61OA71
 ZbjRx9oVZUgUkOYH1WJFi6zmtLGmuJgyJAmMJkR18HOzrFZFaeP+ko17thn362VTGRotsJqR
 qpWb5O1q8XftPnm3LO+Vjd+vWFCMikdbzky9d8xTFTAtm1XSOvOP1g23siISwyxJ51/Pnnhh
 0t05bl/SzmHFx6La1phvOG/8dnUV2bhLT1PGj/daF6QpRiztOG1tKQ9df3pu88w6mzqM3VFv
 DxUMw8M1P2UsWbI6/Uj1Uu8j97bHX1/u4BaNsLt/HRcaXD7SX7f19QRb2ObYObs0rClaO2My
 YzRp/wfZerU2KQMAAA==
X-CFilter-Loop: Reflected
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

Now that CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT was introduced, apply the
consideration to hashed-waitqueue wait, assuming an input 'ret' in
___wait_var_event() macro is used as a timeout value.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/wait_bit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/wait_bit.h b/include/linux/wait_bit.h
index fe89282c3e96..3ef450d9a7c5 100644
--- a/include/linux/wait_bit.h
+++ b/include/linux/wait_bit.h
@@ -247,7 +247,7 @@ extern wait_queue_head_t *__var_waitqueue(void *p);
 	struct wait_bit_queue_entry __wbq_entry;			\
 	long __ret = ret; /* explicit shadow */				\
 									\
-	sdt_might_sleep_start(NULL);					\
+	sdt_might_sleep_start_timeout(NULL, __ret);			\
 	init_wait_var_entry(&__wbq_entry, var,				\
 			    exclusive ? WQ_FLAG_EXCLUSIVE : 0);		\
 	for (;;) {							\
-- 
2.17.1

