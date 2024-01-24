Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728A583A96E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA8D10F710;
	Wed, 24 Jan 2024 12:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id AE79710EE58
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:24 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-d3-65b0fbb8fd1e
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 26/26] locking/lockdep,
 fs/jbd2: Use a weaker annotation in journal handling
Date: Wed, 24 Jan 2024 20:59:37 +0900
Message-Id: <20240124115938.80132-27-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUyTZxiF9zzvZzu6vOsIvIrJli5mDhQURe8ZZ1hitmfLjDNmf1wiNvYN
 NBYkLZ9LNICoyJdKhPqBs6CptRSLBQ0KJQwjgsSCQqAiNEAIA6RA0DbryqaUbX/uXDnn5OT+
 cXhK+ZBZy2vTMiR9mlqnYuW03BtWs6k52CBtrvdEwIXSzeB7W0RDtd3GQt+dOgS2pnwMM4+/
 gyH/HILgs14KjJV9CGrGRylo6vQgcFoKWOif/AgGfAssdFeWsHDyhp2F56+XMYxUVWCoc+yF
 nvO1GNoDf9BgnGHhqvEkXjnTGAJmKwfmvPUwYbnCwfL4Fuj2DDLgHI6By7+NsNDq7Kahs3kC
 Q//DahY8tncM9HR20dB3oYyB+vlaFl77zRSYfQscvGg3YWgoXCk6/eYfBp6UtWM4ffMuhoGX
 LQjaisYwOGyDLDzyzWFodFRS8Netxwgmyr0cnCoNcHA1vxxByakqGnr/fsJA4UgCBP+sZhN3
 kkdzCxQpbMwmTr+JJk9rRfLgyihHCtuGOWJyZJJGSzS50TqDSc2SjyEO61mWOJYqOFLsHcBk
 3uXiSNelIE0mB4z4p6iD8l0aSafNkvRxuw/LUxY902z6XVlOgfkBk4eCXDGS8aKwTSy4OUkX
 I36VrV5NSGaFL0S3O0CFOFz4TGwsm2KKkZynhDMfipbFZ2zI+EQ4LHa+WVgN0cJ60V10G4dY
 IWwXL5Y/Z/7t/1Ssa2hfzchW9PrLw3SIlUKCOGY9x4VKRaFEJp6ZafrvoTXi7xY3fR4pTOgD
 K1Jq07JS1VrdttiU3DRtTuyRY6kOtLIo8/HlX5rRUt+BDiTwSBWmSLTaJSWjzjLkpnYgkadU
 4Qr3mjuSUqFR5/4q6Y8l6TN1kqEDRfG0KlIR78/WKIVkdYZ0VJLSJf3/LuZla/NQTOnUgQBq
 8R/cYZg12dsyut++WjxxfVPuZHxYzvzHO69H5Rza802+K+t74muuvkfG9zdEbK1K32Bftjm4
 +8lDvovGlri4a4mxR/r3HL205CuPKLrlCki28J7MrumMH0brX83mxciTvv6yav+6jb37fvw8
 Mvlbj9NQsU7X+pWm5+dsl4o2pKi3RFN6g/o93sw5bE0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0hTcRzF+/3u09XitsRu2UMWURS9SONb9vorL0FR/2hFD1deckxnbGrZ
 g6YzM01T0ZnOQq2WTVObPazUlqJpkY80M7OV2kNRW2gTbfZwQv8cPpxzOH8dlpDlUPNYpTpc
 1KgVIXJaQkp2+epXPnSWimu6JjZC6qU14PgZT0JOSRENzcWFCIruRWPor/WDt6ODCJyvmgjI
 zGhGkNf9gYB7dTYElQUxNLR+ngltDjsNDRmJNOivl9DQMjCBocuQhqHQshNepuRjsI5/IyGz
 nwZjph5PSh+GcZOZAZNuCfQUZDMw0b0WGmztFNRcbaCgsnMFZF3roqGisoGEuvIeDK2Pc2iw
 Ff2l4GVdPQnNqUkU3PmeT8PAqIkAk8POwGtrLobS2Mm1uJE/FDxPsmKIu3EXQ9u7Jwiq4j9h
 sBS101DjGMRQZskg4NetWgQ9yUMMnL80zoAxOhlB4nkDCU2/n1MQ2+UDzrEcepuvUDNoJ4TY
 shNC5WguKbzI54VH2R8YIbaqkxFyLRFCWcFy4XpFPxbyhh2UYDFfpAXLcBojJAy1YeF7YyMj
 1F9xksLntky8e/5+yaYgMUQZKWpWbwmUBP+w9dHH77qdjDE9onTIySQgluU5b948FJSA3Fia
 W8p3dIwTLnbnvPiypK9UApKwBHdhOl/w4xXtCmZzgXzdiH2qRHJL+I7429jFUm49n57cQrmY
 5xbxhaXWqY7bpH8nq5N0sYzz4T+ZLzMpSJKLppmRu1IdGapQhvis0qqCo9TKk6uOhoVa0ORn
 TGcnUsvRz1a/asSxSD5Dus1cIsooRaQ2KrQa8Swhd5d2zC0WZdIgRdQpURN2WBMRImqrkSdL
 yudIdwSIgTLumCJcVInicVHzP8Ws2zwdWl/V5GkI9M+b9WDgo7rl97oFuw3LSus773v5djc9
 8JHNaXltVJ027NFlmw8Vp2+3Ru+znzD4Z5T3Rg3n92/9ZrRdO6f3YFQHjBEevX2bA/QjGxYe
 OfzeviHduj15bHXS2N4YXYD/DG+vo/V4MfO0N/Qg7KutULU/DvsSf7P1zLM3TjmpDVasXU5o
 tIp/akcm2y8DAAA=
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
Cc: hamohammed.sa@gmail.com, hdanton@sina.com, jack@suse.cz,
 peterz@infradead.org, daniel.vetter@ffwll.ch, amir73il@gmail.com,
 david@fromorbit.com, dri-devel@lists.freedesktop.org, mhocko@kernel.org,
 linux-mm@kvack.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 chris.p.wilson@intel.com, joel@joelfernandes.org, 42.hyeyoo@gmail.com,
 cl@linux.com, will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 her0gyugyu@gmail.com, kernel_team@skhynix.com,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, boqun.feng@gmail.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 gwan-gyeong.mun@intel.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 longman@redhat.com, tglx@linutronix.de, vbabka@suse.cz, melissa.srw@gmail.com,
 sj@kernel.org, tytso@mit.edu, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 penberg@kernel.org, minchan@kernel.org, max.byungchul.park@gmail.com,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

jbd2 journal handling code doesn't want any jbd2_might_wait_for_commit()
to be between start_this_handle() and stop_this_handle(). So it marks
the region with rwsem_acquire_read() and rwsem_release().

However, the annotation is too strong for that purpose. We don't have to
use more than try lock annotation for that.

Furthermore, now that Dept was introduced, false positive alarms was
reported by that. Replaced it with try lock annotation.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 fs/jbd2/transaction.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jbd2/transaction.c b/fs/jbd2/transaction.c
index 5f08b5fd105a..2c159a547e15 100644
--- a/fs/jbd2/transaction.c
+++ b/fs/jbd2/transaction.c
@@ -460,7 +460,7 @@ static int start_this_handle(journal_t *journal, handle_t *handle,
 	read_unlock(&journal->j_state_lock);
 	current->journal_info = handle;
 
-	rwsem_acquire_read(&journal->j_trans_commit_map, 0, 0, _THIS_IP_);
+	rwsem_acquire_read(&journal->j_trans_commit_map, 0, 1, _THIS_IP_);
 	jbd2_journal_free_transaction(new_transaction);
 	/*
 	 * Ensure that no allocations done while the transaction is open are
-- 
2.17.1

