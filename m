Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F67613CAC
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 18:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B240C10E11B;
	Mon, 31 Oct 2022 17:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FCC10E119
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 17:56:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE9386130B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 17:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 235C4C433D7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 17:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667238970;
 bh=JgIn0pAhL9U39HVvUAZh+TgTu/OI+g0K30eJHhIAztI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aVEtrin40MFe7bcvVbEDT7HBNLW6YMbBNl7rluFuybgjs3xyJBCpuzHzFLfRaIVJx
 gF+vuKqPc1GgKe7diiIVFdbeUf+708FscdDliTQ8vqwqUrqLuhJrr4CMALY09gpXcN
 he/NTL0xAV1pdSUlXa/nOcmUwqGtwfu0vW9DBhfg8LCYdZOfifG77Xoqol1IVqAjHZ
 /csomAFxWo99BubJdvKyMSRICrG/1vEtC5YTEyj9tNvnNsilNYlmy2juNWoEehYmB3
 Hrx19W5O31AHx13i3h0e43ZdDD/YUMrc1lMHRnLn4tzepav9wyAILwQfjXJHT3V1c1
 BMy2Nme8FqdWw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 03382C433E9; Mon, 31 Oct 2022 17:56:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216645] Fence fallback timer expired on ring gfx
Date: Mon, 31 Oct 2022 17:56:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216645-2300-CTaqLX0phh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216645-2300@https.bugzilla.kernel.org/>
References: <bug-216645-2300@https.bugzilla.kernel.org/>
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

--- Comment #4 from Martin =C5=A0u=C5=A1la (ask4support@email.cz) ---
Created attachment 303110
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303110&action=3Dedit
Kernel log interlaced with contents of /proc/interrupts polled every second

#! /bin/sh

print() {
        printf "$1" ; seq -s" " $(( $(stty size < $t | sed "s/^/(/; s/ / - =
1 )
* /") - ${#1} )) | sed s/[0-9]//g
}
t=3D"$(readlink /proc/self/fd/0)"

d=3D"$(env LANG=3DC udisksctl mount -b /dev/disk/by-uuid/$1 -o sync 2> /dev=
/null |
sed "s/^Mounted .* at //g; s/\.$//g")"
[ -d "$d" ] && f=3Doflag=3Ddirect || d=3D"${0%/*}" f=3Doflag=3Ddirect

(sudo dmesg -w & while sleep 1 ; do cat /proc/interrupts ; done) | sudo dd
of=3D"$d/${0##*/}.log" $f &
i=3D0
seq 28 150000 | while read N ; do
        print $N
        timeout 3 env DISPLAY=3D:0 plasma-systemmonitor > /dev/null 2>&1
        n=3D$N ; while [ 0 -lt $n ] ; do
                sleep 1
                n=3D$(( $n - 1 ))
                i=3D$(( $i ^ 1 ))
                [ "$i" =3D 1 ] && printf "\33[30m\33[47m" || printf
"\33[37m\33[40m"
                print $n
        done
done

echo END!
exit

# This script was used to generate it

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
