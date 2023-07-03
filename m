Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34612745910
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 11:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D3310E203;
	Mon,  3 Jul 2023 09:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id B28D610E1F9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 09:49:44 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-0b-64a299b42e6c
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 rebased on v6.4 19/25] dept: Apply timeout consideration
 to swait
Date: Mon,  3 Jul 2023 18:47:46 +0900
Message-Id: <20230703094752.79269-20-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230703094752.79269-1-byungchul@sk.com>
References: <20230703094752.79269-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5/L/8zl6rQunooujKIosowubxIVfajzoUKICKyo0Q65nFO2
 XJlFmlt201Iwr9S2ai1dWZuEXRRTNHV5KUeusKXSzbzFbKM5u0yjLy8Pv+d5n0+PiJQ+oeeI
 lOpjgkYtV8mwmBIPhptWVBSaFas6G+dDzuVV4PtxnoKSchuG9vtlCGwV6QT01W+HTv8AgmBL
 Gwn5ee0ITD3vSaho8CCosp7F0PFxCrh8wxia8i5hyLhZjuFV/xgBXddyCSiz7wTnVTMBNYEv
 FOT3YSjOzyBC5ysBAUspA5a0xdBrLWJgrCcKmjxvaKh6txwKr3dheFbVREFDZS8BHU9KMHhs
 f2hwNjRS0J6TRcO9ITOGfr+FBItvmIHXNUYCHuhDRedGftPwIquGgHO3HhLgevsUQfX5bgLs
 tjcY6nwDBDjseSSM3qlH0Js9yIDhcoCB4vRsBJcM1yho+/WCBn3XWgj+LMFbovm6gWGS1zuO
 81V+I8U3mzn+cdF7htdXv2N4oz2Zd1iX8Tef9RG8yeujeXvpBczbvbkMf3HQRfBDra0M31gQ
 pPiPrnwiZm6seKNCUCl1gmblpkPiuK/dO5NG8In06u9UGmqmL6IwEceu4Rwlt8n/2tk/MsEx
 u4RzuwMTfAa7kHNkfQ5xsYhkMydz1u8teNyYzu7hOoOZEyGKXcyNGIuZcS1h13G+Nj31r3QB
 V/agZiITFuKffmajcS1l13JdhR48XsqxV8K4zG/dzL+H2dxzq5u6iiRGNKkUSZVqXYJcqVoT
 GZeiVp6IPJyYYEehRVlOj+2rRN723bWIFSFZuMSdalJIablOm5JQizgRKZshyei5oZBKFPKU
 k4Im8aAmWSVoa9FcESWLkKz2H1dI2SPyY0K8ICQJmv8uIQqbk4aS/NHpfY3r21arClKHyNSg
 OifStXU09/UHw5mB5s2q7gj3/tScu/Uxs3SSe/GBDebwmK0mr011Zku2yTndM5o875f4pXKW
 NiHx1I7YukXRR7dVTlp6INNbuGHRh2JdvDZt+/qKiJiZBUX7DI+iY/frfVF7DYFpU10dd3fl
 NpvLFzpllDZOHrWM1GjlfwG8LgDSTQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxiGed9zzntKtebYsXimJmoT48fiB3G4J9EYoz98o4H4xxH3Rxt7
 HJ2laCsM1EWwFUWEiAYrH85STUdKVTwlmXOWMIhIqUKVCswgAvGLgaKUVrH4UTD+eXLlvu9c
 vx4Fo67kZiv0xv2Syag1aIiSVaassSyrK3PoVgZGCJScXAnhseMsVF51EwhcqUHgrsvDMHhr
 E3RFhhFE77YzYCsNIKjqf8RAXXMvAm/1EQIdT2ZAMBxT+EoLCVguXiVwb2gCQ8/Z0xhq5GTw
 n3JgaBh/zoJtkECFzYJj5wWGcaeLB2fuQhioLudhoj8RfL2dHDSd93Hgffg9lP3RQ+Cm18dC
 8/UBDB03Kgn0uj9x4G9uYSFQUsTB5VcOAkMRJwPO8AgP9xvsGGqtMVt+6CMHt4saMORfuoYh
 +N8/COqP92GQ3Z0EmsLDGDxyKQPv/7yFYKD4JQ9HT47zUJFXjKDw6FkW2j/c5sDakwTRd5Vk
 /RraNDzCUKvnN+qN2Fna6hDp3+WPeGqtf8hTu5xJPdVL6cWbg5hWjYY5KrsKCJVHT/P0xMsg
 pq/a2njaci7K0idBG94692flWp1k0GdJphXrdirTXvQl7w2R7Lz612wuauVOoHiFKPwg+odC
 U0yERWJ39zgzyQnCfNFT9CyWKxWMcGyaWP36LpksvhG2iV3RY1MjVlgohuwV/CSrhNViuN3K
 fpHOE2tqG6Y28bH86btiNMlqIUnsKeslp5DSjuJcKEFvzErX6g1Jy8170nKM+uzluzLSZRT7
 GefvEyXX0VjHpkYkKJBmuqr7YJVOzWmzzDnpjUhUMJoElaX/gk6t0mlzDkimjB2mTINkbkRz
 FKxmlmpzqrRTLfyi3S/tkaS9kulrixXxs3PR7ju1HxKWuf6yrQvc6zx86H3J+u1zpxe6C8rO
 7LtiWZUv290RHKno8jQt2P3WZ1hM/PRB0v+LzwxuPKL/7ttZvz5bknkw23u+ZXvKqDG1IIUU
 /dh3//CiaNyWunzHjA3FGQUzbcn/hqIGZ7zc6nrTtqH8bdzET8FyP3shPLzixtjjRA1rTtMm
 LmVMZu1n8BLdTi8DAAA=
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

Now that CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT was introduced, apply the
consideration to swait, assuming an input 'ret' in ___swait_event()
macro is used as a timeout value.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/swait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/swait.h b/include/linux/swait.h
index 02848211cef5..def1e47bb678 100644
--- a/include/linux/swait.h
+++ b/include/linux/swait.h
@@ -162,7 +162,7 @@ extern void finish_swait(struct swait_queue_head *q, struct swait_queue *wait);
 	struct swait_queue __wait;					\
 	long __ret = ret;						\
 									\
-	sdt_might_sleep_start(NULL);					\
+	sdt_might_sleep_start_timeout(NULL, __ret);			\
 	INIT_LIST_HEAD(&__wait.task_list);				\
 	for (;;) {							\
 		long __int = prepare_to_swait_event(&wq, &__wait, state);\
-- 
2.17.1

