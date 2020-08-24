Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D9625098B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 21:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CF96E0BA;
	Mon, 24 Aug 2020 19:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1B46E0BA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 19:42:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209019] [drm:dpcd_set_source_specific_data [amdgpu]] *ERROR*
 Error in DP aux read transaction, not writing source specific data
Date: Mon, 24 Aug 2020 19:42:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rtmasura+kernel@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209019-2300-512h6fjXlf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209019-2300@https.bugzilla.kernel.org/>
References: <bug-209019-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
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

https://bugzilla.kernel.org/show_bug.cgi?id=209019

--- Comment #2 from rtmasura+kernel@hotmail.com ---
Hmm I don't appear to have an up to date Xorg log, unless I'm misunderstanding
where it should be:

head /var/log/Xorg.0.log                                                        
[1105825.601] (--) Log file renamed from "/var/log/Xorg.pid-1681661.log" to
"/var/log/Xorg.0.log"
[1105825.603] 
X.Org X Server 1.20.8
X Protocol Version 11, Revision 0
[1105825.603] Build Operating System: Linux Arch Linux
[1105825.603] Current Operating System: Linux abiggun 5.6.11-arch1-1 #1 SMP
PREEMPT Wed, 06 May 2020 17:32:37 +0000 x86_64
[1105825.603] Kernel command line: BOOT_IMAGE=/vmlinuz-linux
root=UUID=ef7e3964-346a-44d8-b5e9-ee81e59833b9 rw
cryptdevice=UUID=64e88839-e390-4431-bbe9-9f25b41860aa:cryptroot
root=/dev/mapper/cryptroot usb-storage.quirks=0bc2:ab44:u
usb-storage.quirks=0bc2:ab38:u usb-storage.quirks=0bc2:ab45:u amd_iommu=on
iommu=pt apparmor=1 security=apparmor vfio-pci.ids=10de:1bb1,10de:10f0
[1105825.603] Build Date: 05 May 2020  05:08:17AM
[1105825.603]  
[1105825.603] Current version of pixman: 0.40.0

tail /var/log/Xorg.0.log                                                        
[1105827.133] (II) UnloadModule: "libinput"
[1105827.133] (II) UnloadModule: "libinput"
[1105827.133] (II) UnloadModule: "libinput"
[1105827.133] (II) UnloadModule: "libinput"
[1105827.133] (II) UnloadModule: "libinput"
[1105827.133] (II) UnloadModule: "libinput"
[1105827.133] (II) UnloadModule: "libinput"
[1105827.133] (II) UnloadModule: "libinput"
[1105827.134] (II) UnloadModule: "libinput"
[1105827.188] (II) Server terminated successfully (0). Closing log file.


I have no dmesg other than the one I provided, there were no other errors in
dmesg. 


So journal is probably the best bet. I can attach it all if you like:
sudo journalctl -b -1 -p 3 
-- Logs begin at Wed 2020-07-22 10:17:18 PDT, end at Mon 2020-08-24 12:40:41
PDT. --
Aug 23 11:56:00 abiggun systemd-modules-load[391]: Failed to find module
'vboxdrv'
Aug 23 11:56:00 abiggun systemd-modules-load[391]: Failed to find module
'vboxnetflt'
Aug 23 11:56:00 abiggun systemd-modules-load[391]: Failed to find module
'vboxnetadp'
Aug 23 11:56:00 abiggun systemd-modules-load[391]: Failed to find module
'vboxpci'
Aug 23 11:56:00 abiggun systemd-udevd[421]:
/etc/udev/rules.d/40-libsane.rules:26: GOTO="libsane_rules_end" has no matching
label, ignoring
Aug 23 11:56:01 abiggun systemd-udevd[421]:
/etc/udev/rules.d/S99-2000S1.rules:26: GOTO="libsane_rules_end" has no matching
label, ignoring
Aug 23 11:56:13 abiggun systemd[1367]: pam_systemd_home(systemd-user:account):
Failed to query user record: Unit dbus-org.freedesktop.home1.service not found.
Aug 23 11:56:13 abiggun smbd[1229]: [2020/08/23 11:56:13.018977,  0]
../../lib/util/become_daemon.c:135(daemon_ready)
Aug 23 11:56:13 abiggun smbd[1229]:   daemon_ready: daemon 'smbd' finished
starting up and ready to serve connections
Aug 23 11:56:19 abiggun gdm-password][1994]: PAM unable to
dlopen(/usr/lib/security/pam_gnome_keyring.so):
/usr/lib/security/pam_gnome_keyring.so: cannot open shared object file: No such
file or directory
Aug 23 11:56:19 abiggun gdm-password][1994]: PAM adding faulty module:
/usr/lib/security/pam_gnome_keyring.so
Aug 23 11:56:22 abiggun gdm-password][1994]:
pam_systemd_home(gdm-password:account): Failed to query user record: Unit
dbus-org.freedesktop.home1.service not found.
Aug 23 11:56:22 abiggun systemd[2024]: pam_systemd_home(systemd-user:account):
Failed to query user record: Unit dbus-org.freedesktop.home1.service not found.
Aug 23 11:56:24 abiggun systemd-resolved[1181]: Failed to send hostname reply:
Invalid argument
Aug 23 19:13:45 abiggun kernel: [drm:dpcd_set_source_specific_data [amdgpu]]
*ERROR* Error in DP aux read transaction, not writing source specific data
Aug 23 19:13:52 abiggun xscreensaver[2469]:
pam_systemd_home(xscreensaver:auth): Failed to query user record: Unit
dbus-org.freedesktop.home1.service not found.
Aug 23 19:13:53 abiggun kernel: ata3: softreset failed (1st FIS failed)
Aug 23 19:13:53 abiggun kernel: ata4: softreset failed (device not ready)
Aug 23 19:13:53 abiggun kernel: ata2: softreset failed (device not ready)
Aug 23 19:13:53 abiggun kernel: ata1: softreset failed (device not ready)
Aug 23 19:13:53 abiggun kernel: ata6: softreset failed (device not ready)
Aug 23 19:13:53 abiggun kernel: ata5: softreset failed (device not ready)
Aug 23 19:46:38 abiggun kernel: [drm:dpcd_set_source_specific_data [amdgpu]]
*ERROR* Error in DP aux read transaction, not writing source specific data
Aug 23 19:46:48 abiggun kernel: [drm:dpcd_set_source_specific_data [amdgpu]]
*ERROR* Error in DP aux read transaction, not writing source specific data
Aug 23 19:46:58 abiggun kernel: [drm:dpcd_set_source_specific_data [amdgpu]]
*ERROR* Error in DP aux read transaction, not writing source specific data
Aug 23 19:46:59 abiggun kernel: [drm:dm_restore_drm_connector_state [amdgpu]]
*ERROR* Restoring old state failed with -12
Aug 23 19:47:12 abiggun kernel: [drm:dm_restore_drm_connector_state [amdgpu]]
*ERROR* Restoring old state failed with -12
Aug 23 19:47:22 abiggun kernel: [drm:dpcd_set_source_specific_data [amdgpu]]
*ERROR* Error in DP aux read transaction, not writing source specific data
Aug 23 19:47:51 abiggun kernel: [drm:dpcd_set_source_specific_data [amdgpu]]
*ERROR* Error in DP aux read transaction, not writing source specific data
Aug 23 19:47:51 abiggun kernel: [drm:dc_link_detect_helper [amdgpu]] *ERROR* No
EDID read.
Aug 23 19:47:52 abiggun kernel: [drm:dm_restore_drm_connector_state [amdgpu]]
*ERROR* Restoring old state failed with -12
Aug 23 19:47:54 abiggun kernel: [drm:retrieve_link_cap [amdgpu]] *ERROR*
retrieve_link_cap: Read dpcd data failed.
Aug 23 19:48:15 abiggun kernel: [drm:dpcd_set_source_specific_data [amdgpu]]
*ERROR* Error in DP aux read transaction, not writing source specific data
Aug 23 19:48:25 abiggun kernel: [drm:dpcd_set_source_specific_data [amdgpu]]
*ERROR* Error in DP aux read transaction, not writing source specific data
Aug 23 19:48:28 abiggun kernel: [drm:dpcd_set_source_specific_data [amdgpu]]
*ERROR* Error in DP aux read transaction, not writing source specific data
Aug 23 19:48:28 abiggun kernel: [drm:dc_link_detect_helper [amdgpu]] *ERROR* No
EDID read.
Aug 23 19:48:29 abiggun kernel: [drm:dm_restore_drm_connector_state [amdgpu]]
*ERROR* Restoring old state failed with -12
Aug 23 19:48:32 abiggun kernel: [drm:dm_restore_drm_connector_state [amdgpu]]
*ERROR* Restoring old state failed with -12
Aug 23 21:04:05 abiggun sudo[37251]: pam_systemd_home(sudo:account): Failed to
query user record: Unit dbus-org.freedesktop.home1.service not found.
Aug 23 22:29:22 abiggun sudo[48011]: pam_systemd_home(sudo:account): Failed to
query user record: Unit dbus-org.freedesktop.home1.service not found.
Aug 23 22:29:30 abiggun sudo[48099]: pam_systemd_home(sudo:account): Failed to
query user record: Unit dbus-org.freedesktop.home1.service not found.
Aug 23 22:29:34 abiggun sudo[48131]: pam_systemd_home(sudo:account): Failed to
query user record: Unit dbus-org.freedesktop.home1.service not found.
Aug 23 22:29:44 abiggun sudo[48157]: pam_systemd_home(sudo:account): Failed to
query user record: Unit dbus-org.freedesktop.home1.service not found.
Aug 23 22:29:45 abiggun systemd-udevd[421]:
/etc/udev/rules.d/40-libsane.rules:26: GOTO="libsane_rules_end" has no matching
label, ignoring
Aug 23 22:29:45 abiggun systemd-udevd[421]:
/etc/udev/rules.d/S99-2000S1.rules:26: GOTO="libsane_rules_end" has no matching
label, ignoring
Aug 23 22:29:45 abiggun gdm[1234]: GLib: g_hash_table_foreach: assertion
'version == hash_table->version' failed
Aug 23 22:29:48 abiggun kernel: watchdog: watchdog0: watchdog did not stop!

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
