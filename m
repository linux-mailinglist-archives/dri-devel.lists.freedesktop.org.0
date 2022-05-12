Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D585244E2
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 07:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2C910F9E7;
	Thu, 12 May 2022 05:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by gabe.freedesktop.org (Postfix) with ESMTP id B86A910F9E7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 05:27:37 +0000 (UTC)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
 by 156.147.23.51 with ESMTP; 12 May 2022 14:27:35 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.126 with ESMTP; 12 May 2022 14:27:35 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Thu, 12 May 2022 14:25:57 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org, holt@sgi.com, mcgrof@kernel.org
Subject: [REPORT] syscall reboot + umh + firmware fallback
Message-ID: <20220512052557.GD18445@X58A-UD3R>
References: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 bfields@fieldses.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 airlied@linux.ie, mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 linux-mm@kvack.org, ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+cc mcgrof@kernel.org (firmware)
+cc holt@sgi.com (syscall reboot)

Hi Luis, Robin and folks,

I'm developing a tool for lockup detection, DETP(Dependency Tracker).
I got a DEPT report from Hyeonggon - Thanks, Hyeonggon!

It doesn't mean the code *definitely* has a deadlock. However, it looks
problematic to me. So I'd like to ask things to see if it is actually.

Because Hyeonggon didn't run decode_stacktrace.sh before sending it to
me, I don't have a report having a better debugging information. But I
can explain it in this mail. The problematic scenario looks like:


PROCESS A	PROCESS B	WORKER C

__do_sys_reboot()
		__do_sys_reboot()
 mutex_lock(&system_transition_mutex)
 ...		 mutex_lock(&system_transition_mutex) <- stuck
		 ...
				request_firmware_work_func()
				 _request_firmware()
				  firmware_fallback_sysfs()
				   usermodehelper_read_lock_wait()
				    down_read(&umhelper_sem)
				   ...
				   fw_load_sysfs_fallback()
				    fw_sysfs_wait_timeout()
				     wait_for_completion_killable_timeout(&fw_st->completion) <- stuck
 kernel_halt()
  __usermodehelper_disable()
   down_write(&umhelper_sem) <- stuck

--------------------------------------------------------
All the 3 contexts are stuck at this point.
--------------------------------------------------------

PROCESS A	PROCESS B	WORKER C

   ...
   up_write(&umhelper_sem)
 ...
 mutex_unlock(&system_transition_mutex) <- cannot wake up B

		 ...
		 kernel_halt()
		  notifier_call_chain()
		   hw_shutdown_notify()
		    kill_pending_fw_fallback_reqs()
		     __fw_load_abort()
		      complete_all(&fw_st->completion) <- cannot wake up C

				   ...
				   usermodeheler_read_unlock()
				    up_read(&umhelper_sem) <- cannot wake up A


So I think this scenario is problematic. Or am I missing something here?
Or do you think it's okay because the wait_for_completion_*() has a
timeout? AFAIK, timeouts are not supposed to fire in normal cases.

It'd be appreciated if you share your opinion on the report.

	Byungchul

---

[   18.136012][    T1] ===================================================
[   18.136419][    T1] DEPT: Circular dependency has been detected.
[   18.136782][    T1] 5.18.0-rc3-57979-gc2b89afca919 #2374 Tainted: G    B            
[   18.137249][    T1] ---------------------------------------------------
[   18.137649][    T1] summary
[   18.137823][    T1] ---------------------------------------------------
[   18.138222][    T1] *** DEADLOCK ***
[   18.138222][    T1] 
[   18.138569][    T1] context A
[   18.138754][    T1]     [S] __mutex_lock_common(system_transition_mutex:0)
[   18.139170][    T1]     [W] down_write(umhelper_sem:0)
[   18.139482][    T1]     [E] mutex_unlock(system_transition_mutex:0)
[   18.139865][    T1] 
[   18.140004][    T1] context B
[   18.140189][    T1]     [S] (unknown)(&fw_st->completion:0)
[   18.140527][    T1]     [W] __mutex_lock_common(system_transition_mutex:0)
[   18.140942][    T1]     [E] complete_all(&fw_st->completion:0)
[   18.141295][    T1] 
[   18.141434][    T1] context C
[   18.141618][    T1]     [S] down_read(umhelper_sem:0)
[   18.141926][    T1]     [W] wait_for_completion_killable_timeout(&fw_st->completion:0)
[   18.142402][    T1]     [E] up_read(umhelper_sem:0)
[   18.142699][    T1] 
[   18.142837][    T1] [S]: start of the event context
[   18.143134][    T1] [W]: the wait blocked
[   18.143379][    T1] [E]: the event not reachable
[   18.143661][    T1] ---------------------------------------------------
[   18.144063][    T1] context A's detail
[   18.144293][    T1] ---------------------------------------------------
[   18.144691][    T1] context A
[   18.144875][    T1]     [S] __mutex_lock_common(system_transition_mutex:0)
[   18.145290][    T1]     [W] down_write(umhelper_sem:0)
[   18.145602][    T1]     [E] mutex_unlock(system_transition_mutex:0)
[   18.145982][    T1] 
[   18.146120][    T1] [S] __mutex_lock_common(system_transition_mutex:0):
[   18.146519][    T1] [<ffffffff810ee14c>] __do_sys_reboot+0x11f/0x24f
[   18.146907][    T1] stacktrace:
[   18.147101][    T1]       __mutex_lock+0x1f3/0x3f3
[   18.147396][    T1]       __do_sys_reboot+0x11f/0x24f
[   18.147706][    T1]       do_syscall_64+0xd4/0xfb
[   18.148001][    T1]       entry_SYSCALL_64_after_hwframe+0x44/0xae
[   18.148379][    T1] 
[   18.148517][    T1] [W] down_write(umhelper_sem:0):
[   18.148815][    T1] [<ffffffff810d9c14>] __usermodehelper_disable+0x80/0x17f
[   18.149243][    T1] stacktrace:
[   18.149438][    T1]       __dept_wait+0x115/0x15b
[   18.149726][    T1]       dept_wait+0xcd/0xf3
[   18.149993][    T1]       down_write+0x4e/0x82
[   18.150266][    T1]       __usermodehelper_disable+0x80/0x17f
[   18.150615][    T1]       kernel_halt+0x33/0x5d
[   18.150893][    T1]       __do_sys_reboot+0x197/0x24f
[   18.151201][    T1]       do_syscall_64+0xd4/0xfb
[   18.151489][    T1]       entry_SYSCALL_64_after_hwframe+0x44/0xae
[   18.151866][    T1] 
[   18.152004][    T1] [E] mutex_unlock(system_transition_mutex:0):
[   18.152368][    T1] (N/A)
[   18.152532][    T1] ---------------------------------------------------
[   18.152931][    T1] context B's detail
[   18.153161][    T1] ---------------------------------------------------
[   18.153559][    T1] context B
[   18.153743][    T1]     [S] (unknown)(&fw_st->completion:0)
[   18.154082][    T1]     [W] __mutex_lock_common(system_transition_mutex:0)
[   18.154496][    T1]     [E] complete_all(&fw_st->completion:0)
[   18.154848][    T1] 
[   18.154987][    T1] [S] (unknown)(&fw_st->completion:0):
[   18.155310][    T1] (N/A)
[   18.155473][    T1] 
[   18.155612][    T1] [W] __mutex_lock_common(system_transition_mutex:0):
[   18.156014][    T1] [<ffffffff810ee14c>] __do_sys_reboot+0x11f/0x24f
[   18.156400][    T1] stacktrace:
[   18.156594][    T1]       __mutex_lock+0x1ce/0x3f3
[   18.156887][    T1]       __do_sys_reboot+0x11f/0x24f
[   18.157196][    T1]       do_syscall_64+0xd4/0xfb
[   18.157482][    T1]       entry_SYSCALL_64_after_hwframe+0x44/0xae
[   18.157856][    T1] 
[   18.157993][    T1] [E] complete_all(&fw_st->completion:0):
[   18.158330][    T1] [<ffffffff81c04230>] kill_pending_fw_fallback_reqs+0x66/0x95
[   18.158778][    T1] stacktrace:
[   18.158973][    T1]       complete_all+0x28/0x58
[   18.159256][    T1]       kill_pending_fw_fallback_reqs+0x66/0x95
[   18.159624][    T1]       fw_shutdown_notify+0x7/0xa
[   18.159929][    T1]       notifier_call_chain+0x4f/0x81
[   18.160246][    T1]       blocking_notifier_call_chain+0x4c/0x64
[   18.160611][    T1]       kernel_halt+0x13/0x5d
[   18.160889][    T1]       __do_sys_reboot+0x197/0x24f
[   18.161197][    T1]       do_syscall_64+0xd4/0xfb
[   18.161485][    T1]       entry_SYSCALL_64_after_hwframe+0x44/0xae
[   18.161861][    T1] ---------------------------------------------------
[   18.162260][    T1] context C's detail
[   18.162490][    T1] ---------------------------------------------------
[   18.162889][    T1] context C
[   18.163073][    T1]     [S] down_read(umhelper_sem:0)
[   18.163379][    T1]     [W] wait_for_completion_killable_timeout(&fw_st->completion:0)
[   18.163855][    T1]     [E] up_read(umhelper_sem:0)
[   18.164150][    T1] 
[   18.164288][    T1] [S] down_read(umhelper_sem:0):
[   18.164578][    T1] [<ffffffff810d8f99>] usermodehelper_read_lock_wait+0xad/0x139
[   18.165027][    T1] stacktrace:
[   18.165220][    T1]       down_read+0x74/0x85
[   18.165487][    T1]       usermodehelper_read_lock_wait+0xad/0x139
[   18.165860][    T1]       firmware_fallback_sysfs+0x118/0x521
[   18.166207][    T1]       _request_firmware+0x7ef/0x91b
[   18.166525][    T1]       request_firmware_work_func+0xb1/0x13b
[   18.166884][    T1]       process_one_work+0x4c3/0x771
[   18.167199][    T1]       worker_thread+0x37f/0x49e
[   18.167497][    T1]       kthread+0x122/0x131
[   18.167768][    T1]       ret_from_fork+0x1f/0x30
[   18.168055][    T1] 
[   18.168192][    T1] [W] wait_for_completion_killable_timeout(&fw_st->completion:0):
[   18.168650][    T1] [<ffffffff81c046b7>] firmware_fallback_sysfs+0x42a/0x521
[   18.169076][    T1] stacktrace:
[   18.169270][    T1]       wait_for_completion_killable_timeout+0x3c/0x58
[   18.169676][    T1]       firmware_fallback_sysfs+0x42a/0x521
[   18.170024][    T1]       _request_firmware+0x7ef/0x91b
[   18.170341][    T1]       request_firmware_work_func+0xb1/0x13b
[   18.170699][    T1]       process_one_work+0x4c3/0x771
[   18.171012][    T1]       worker_thread+0x37f/0x49e
[   18.171309][    T1]       kthread+0x122/0x131
[   18.171575][    T1]       ret_from_fork+0x1f/0x30
[   18.171863][    T1] 
[   18.172001][    T1] [E] up_read(umhelper_sem:0):
[   18.172281][    T1] (N/A)
[   18.172445][    T1] ---------------------------------------------------
[   18.172844][    T1] information that might be helpful
[   18.173151][    T1] ---------------------------------------------------
[   18.173549][    T1] CPU: 0 PID: 1 Comm: init Tainted: G    B             5.18.0-rc3-57979-gc2b89afca919 #2374
[   18.174144][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/01/2014
[   18.174687][    T1] Call Trace:
[   18.174882][    T1]  <TASK>
[   18.175056][    T1]  print_circle+0x6a2/0x6f9
[   18.175326][    T1]  ? extend_queue+0xf4/0xf4
[   18.175594][    T1]  ? __list_add_valid+0xce/0xf6
[   18.175886][    T1]  ? __list_add+0x45/0x4e
[   18.176144][    T1]  ? print_circle+0x6f9/0x6f9
[   18.176422][    T1]  cb_check_dl+0xc0/0xc7
[   18.176675][    T1]  bfs+0x1c8/0x27b
[   18.176897][    T1]  ? disconnect_class+0x24c/0x24c
[   18.177195][    T1]  ? __list_add+0x45/0x4e
[   18.177454][    T1]  add_dep+0x140/0x217
[   18.177697][    T1]  ? add_ecxt+0x33b/0x33b
[   18.177955][    T1]  ? llist_del_first+0xc/0x46
[   18.178234][    T1]  add_wait+0x58a/0x723
[   18.178482][    T1]  ? __thaw_task+0x3e/0x3e
[   18.178745][    T1]  ? add_dep+0x217/0x217
[   18.178998][    T1]  ? llist_add_batch+0x33/0x4c
[   18.179281][    T1]  ? check_new_class+0x139/0x30d
[   18.179574][    T1]  __dept_wait+0x115/0x15b
[   18.179837][    T1]  ? __usermodehelper_disable+0x80/0x17f
[   18.180170][    T1]  ? add_wait+0x723/0x723
[   18.180426][    T1]  ? lock_release+0x338/0x338
[   18.180704][    T1]  ? __usermodehelper_disable+0x80/0x17f
[   18.181037][    T1]  dept_wait+0xcd/0xf3
[   18.181280][    T1]  down_write+0x4e/0x82
[   18.181527][    T1]  ? __usermodehelper_disable+0x80/0x17f
[   18.181861][    T1]  __usermodehelper_disable+0x80/0x17f
[   18.182184][    T1]  ? __usermodehelper_set_disable_depth+0x3a/0x3a
[   18.182565][    T1]  ? dept_ecxt_exit+0x1c9/0x1f7
[   18.182854][    T1]  ? blocking_notifier_call_chain+0x57/0x64
[   18.183205][    T1]  kernel_halt+0x33/0x5d
[   18.183458][    T1]  __do_sys_reboot+0x197/0x24f
[   18.183742][    T1]  ? kernel_power_off+0x6b/0x6b
[   18.184033][    T1]  ? dept_on+0x27/0x33
[   18.184275][    T1]  ? dept_exit+0x38/0x42
[   18.184526][    T1]  ? dept_on+0x27/0x33
[   18.184767][    T1]  ? dept_on+0x27/0x33
[   18.185008][    T1]  ? dept_exit+0x38/0x42
[   18.185260][    T1]  ? dept_enirq_transition+0x25a/0x295
[   18.185582][    T1]  ? syscall_enter_from_user_mode+0x47/0x71
[   18.185930][    T1]  ? dept_aware_softirqs_disable+0x1e/0x1e
[   18.186274][    T1]  ? syscall_enter_from_user_mode+0x47/0x71
[   18.186622][    T1]  do_syscall_64+0xd4/0xfb
[   18.186883][    T1]  ? asm_exc_page_fault+0x1e/0x30
[   18.187180][    T1]  ? dept_aware_softirqs_disable+0x1e/0x1e
[   18.187526][    T1]  ? dept_kernel_enter+0x15/0x1e
[   18.187821][    T1]  ? do_syscall_64+0x13/0xfb
[   18.188094][    T1]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   18.188443][    T1] RIP: 0033:0x4485f7
[   18.188672][    T1] Code: 00 75 05 48 83 c4 28 c3 e8 26 17 00 00 66 0f 1f 44 00 00 f3 0f 1e fa 89 fa be 69 19 12 28 bf ad de e1 fe b8 a9 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8
[   18.189822][    T1] RSP: 002b:00007ffc92206f28 EFLAGS: 00000202 ORIG_RAX: 00000000000000a9
[   18.190316][    T1] RAX: ffffffffffffffda RBX: 00007ffc92207118 RCX: 00000000004485f7
[   18.190784][    T1] RDX: 000000004321fedc RSI: 0000000028121969 RDI: 00000000fee1dead
[   18.191254][    T1] RBP: 00007ffc92206f30 R08: 00000000016376a0 R09: 0000000000000000
[   18.191722][    T1] R10: 00000000004c3820 R11: 0000000000000202 R12: 0000000000000001
[   18.192194][    T1] R13: 00007ffc92207108 R14: 00000000004bf8d0 R15: 0000000000000001
[   18.192667][    T1]  </TASK>
