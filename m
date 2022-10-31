Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0DC6137C9
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 14:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134C710E2A8;
	Mon, 31 Oct 2022 13:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1463A10E2B7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 13:22:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 91FB361221
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 13:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03432C433D6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 13:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667222553;
 bh=0zIh4oNttH3lCLKmwfXssICZAYPqIWS3p+hZ261z2sQ=;
 h=From:To:Subject:Date:From;
 b=QX+djgDqGraBRlxrzXZr9kqMNh2baLidXAEBHQuqz3iwO8mRovZ5cAblh/+Vf9RXf
 Z5tRulgwMxcmA4lF3SWZeFqt0KyHloSejFqrzSUXJVB8TFjR5oJigmbbGDFDFGhNwS
 +QQ0WHACPVjRctitsQ1cSP85cItzkXsK5Ch25aJTLkUuUmMC3nQbgcvP6ErRzkdlHG
 f7MY8rqgRCbQYU8I0ozRvYucZesGzXuy/8JH92xQNb6sWU/CEunQsStbC1APQ/UxhD
 tblRD39koddNFNuqh4Kdah4DreNEK5A5D8u0Yf1UE76vZ/i/YuE6iRsiLtUOUuhZbr
 X0emetR4T+b0g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D68BBC433E4; Mon, 31 Oct 2022 13:22:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216645] New: Fence fallback timer expired on ring gfx
Date: Mon, 31 Oct 2022 13:22:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ask4support@email.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216645-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D216645

            Bug ID: 216645
           Summary: Fence fallback timer expired on ring gfx
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.0-43-generic
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ask4support@email.cz
        Regression: No

Created attachment 303109
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303109&action=3Dedit
Kernel log created by the script in the menuetry

Sometimes when I run a KDE system monitor, or Chrome, my laptop freezes and
won't unfreeze until reboot (well, after a while I can move the mouse curso=
r,
but that's all I can do).=20
I'm using Dell G5 SE 5505 with AMD Ryzen 7 4800H as a CPU, Radeon RX Vega 7=
 as
iGPU and AMD Radeon RX 5600M as dGPU.=20

I've searched through existing bugs and found that it might be related to
interrupts. With that in mind, I've compiled a list of kernel parameters wh=
ich
might be related and, as well as that, I've tested all of them:=20

PW =3D Probably Working, NW =3D Not Working, NB =3D Not Booting
PW      pcie_port_pm=3Doff
PW      amdgpu.msi=3D0
NW      amd_iommu=3Dfullflush
NW      amd_iommu=3Dforce_isolation
NW      amd_iommu=3Doff
NW      amd_iommu_intr=3Dlegacy
NW      amd_iommu_intr=3Dvapic kvm-amd.avic=3D1
NW      iommu=3Doff
NW      iommu=3Dforce
NW      iommu=3Dnoforce
NW      iommu=3Dbiomerge
NW      iommu=3Dmerge
NW      iommu=3Dnomerge
NW      iommu=3Dforcesac
NW      iommu=3Dsoft
NW      iommu=3Dpt
NW      irqfixup
NW      irqpoll
NW      nointremap
NW      pcie_port_pm=3Dforce
NW      amdgpu.pcie_gen2=3D1
NW      amdgpu.pcie_gen2=3D0
NW      amdgpu.msi=3D1
NW      amdgpu.lockup_timeout=3D1000
NW      amdgpu.lockup_timeout=3D100
NW      amdgpu.aspm=3D1
NW      amdgpu.aspm=3D0
NW      amdgpu.bapm=3D1
NW      amdgpu.bapm=3D0
NW      amdgpu.ppfeaturemask=3D0xfff7bff7
NW      amdgpu.ppfeaturemask=3D0xfff7bdff
NW      amdgpu.ppfeaturemask=3D0xfff7bbff
NW      amdgpu.ppfeaturemask=3D0xfff73fff
NW      amdgpu.ppfeaturemask=3D0xfff3bfff
NW      amdgpu.exp_hw_support=3D1
NW      amdgpu.exp_hw_support=3D0
NW      amdgpu.forcelongtraining=3D0
NW      amdgpu.forcelongtraining=3D1
NW      amdgpu.cg_mask=3D0x00000000
NW      amdgpu.cg_mask=3D0xffffffff
NW      amdgpu.pg_mask=3D0xffffffff
NW      amdgpu.ngg=3D1
NW      amdgpu.ngg=3D0
NW      amdgpu.job_hang_limit=3D1000
NW      amdgpu.job_hang_limit=3D100
NW      amdgpu.lbpw=3D1
NW      amdgpu.lbpw=3D0
NW      amdgpu.gpu_recovery=3D1
NW      amdgpu.gpu_recovery=3D0
NW      amdgpu.sched_policy=3D2
NW      amdgpu.sched_policy=3D1
NW      amdgpu.sched_policy=3D0
NW      amdgpu.ignore_crat=3D0
NW      amdgpu.ignore_crat=3D1
NW      amdgpu.ras_enable=3D0
NW      amdgpu.ras_enable=3D1
NW      amdgpu.async_gfx_ring=3D0
NW      amdgpu.async_gfx_ring=3D1
NW      amdgpu.mcbp=3D1
NW      amdgpu.mcbp=3D0
NW      amdgpu.mes=3D0
NW      amdgpu.mes_kiq=3D1
NW      amdgpu.mes_kiq=3D0
NW      amdgpu.reset_method=3D0
NW      amdgpu.reset_method=3D1
NW      amdgpu.reset_method=3D2
NW      amdgpu.reset_method=3D3
NW      amdgpu.reset_method=3D4
NW      amdgpu.reset_method=3D-1
NW      idle=3Dnomwait
NB      amdgpu.pg_mask=3D0x00000000
NB      amdgpu.mes=3D1



I've developed a script and a GRUB2 menu entry for live Kubuntu that trigge=
rs
the freeze and saves the dmesg into a file called Freeze_Dell_G5_SE_5505.sh=
.log
at the root of the drive it's being booted from.
Replace the ISO variable value with the path to your iso file if it's not at
root directory of the drive and/or if it's of a different version:=20

menuentry "Start Kubuntu 22.04.1 (64 bit) without Ubiquity and with a freez=
ing
script" {
        ISO=3D/kubuntu-22.04.1-desktop-amd64.iso
        set gfxpayload=3Dkeep
        loopback loop "$ISO"
        probe -u $root --set=3Drootid
        linux   (loop)/casper/vmlinuz   iso-scan/filename=3D"$ISO"
file=3D/cdrom/preseed/kubuntu.seed maybe-ubiquity quiet splash init=3D/bin/=
sh -- -c
'for script in /home/kubuntu/Desktop/Freeze_Dell_G5_SE_5505.sh ; do for aut=
orun
in /home/kubuntu/.config/autostart/${script##*/} ; do ln -fs /dev/null
/etc/systemd/system/graphical.target.wants/ubiquity.service ; mkdir -p
${script%/*} ${autorun%/*} ; printf
\043!_/bin/sh++print\050\051_{+\tprintf_"@1"_,_seq_-s"_"_@\050\050_@\050stt=
y_size_\074_@t_?_sed_"s/^/\050/,_s/_/_-_1_\051_*_/"\051_-_@{\0431}_\051\051=
_?_sed_s/[0-9]//g+}+t\075"@\050readlink_/proc/self/fd/0\051"++d\075"@\050en=
v_LANG\075C_udisksctl_mount_-b_/dev/disk/by-uuid/$0_-o_sync_2\076_/dev/null=
_?_sed_"s/^Mounted_.*_at_//g,_s/\\.@//g"\051"+[_-d_"@d"_]_\046\046_f\075ofl=
ag\075direct_??_d\075"@{0%%/*}"+sudo_dmesg_-w_?_sudo_dd_of\075"@d/@{0\043\0=
43*/}.log"_@f_\046+i\0750+seq_28_150000_?_while_read_N_,_do+\tprint_@N+\tti=
meout_3_env_DISPLAY\075:0_plasma-systemmonitor_\076_/dev/null_2\076\0461+\t=
n\075@N_,_while_[_0_-lt_@n_]_,_do+\t\tsleep_1+\t\tn\075@\050\050_@n_-_1_\05=
1\051+\t\ti\075@\050\050_@i_^_1_\051\051+\t\t[_"@i"_\075_1_]_\046\046_print=
f_"\\33[30m\\33[47m"_??_printf_"\\33[37m\\33[40m"+\t\tprint_@n+\tdone+done+=
+echo_END!+exit+
| tr _,?@+ \40\73\174\044\n > $script ; printf
[Desktop_Entry]\nType=3DApplication\nExec=3Dkstart_--maximize_--_konsole_-e=
_  | tr
_ \40 > ${autorun%.sh}.desktop ; printf $script\n >> ${autorun%.sh}.desktop=
 ;
chmod +x $script ${autorun%.sh}.desktop ; chown -R kubuntu:kubuntu
/home/kubuntu ; exec /sbin/init maybe-ubiquity splash --- ; done ; done'
$rootid
        initrd  (loop)/casper/initrd
}



The script generated on the live Kubuntu's desktop runs KDE's System Monitor
for a three seconds and waits before running it again. With each iteration,=
 it
waits one second longer than before. The parameter passed the test if it
managed not to freeze until the script was waiting for 50 seconds (now I'd
recommend 60, as with 50 it sometimes froze after the second boot) for five
boots in a row.=20

Would someone also tell us which workaround should be used under which
performace/latency requirements? ("Maybe wrong but still an" EXAMPLE: Users=
 who
need the best performace or lowest latency should use pcie_port_pm=3Doff, u=
sers
who need the best battery life should use amdgpu.msi=3D0.)

If you fix the issue, may you please tell the users (not just developers) w=
hat
was the problem? ("Maybe wrong but still an" EXAMPLE: The driver was waiting
for an interrupt, but the bus was down, therefore the message-signalled
interrupt could not have come and the operation timed out.)

Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
