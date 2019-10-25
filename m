Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A59E6E10
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415D76E463;
	Mon, 28 Oct 2019 08:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F526EB41
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 18:35:45 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id y3so3813580ljj.6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 11:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Mie2Uww8VKKTzqCqiaNX8XDqO3BRPXZkD0JU35v6uIQ=;
 b=FOegTWq3otAbrrh0MRg+EHvOdnV1q2xsCEJDWOYVt2ZMdsqQXVU2DclX8JCWm6ZQFh
 J16kNZGPAUaqmv4+n8siorHo3rv9teA/jWEDiYA72mYBF/B9k7QeYUU4sKCiK6D5zfyE
 xxX+SOJGmkANgbF/hYU7MKww2uHL2Lt8g4/O7jsooasb6ObDTgF/F3DAEXMiJisAbsFZ
 8qbh+cOK58DzxGoyk68E5MiI1xPxEqS/aavGIcTOfcC23cGi6pGi3AfVv49shd/dlxiF
 I1waOa0nH5v/b4HCD+XsRlW6qYAs897IBL6Y+dA9xD10Y2lhRcr2q8j5raZh/13tPw3G
 pNTg==
X-Gm-Message-State: APjAAAXkHIrrJk9gn5OGjVyZbXW7o/8FNWd4nnLinfXOawf8PTUFTG94
 xywPzt6cxB5qbSB1Wwso8D3y6+xe/uffmei7Y8qN/wnluA==
X-Google-Smtp-Source: APXvYqyRCP2xQ/6kTPK3fpA/eVDCrBPMSwtYsStqytL9ddgJv/kxzOv2k2sU1yuG4yW0sqnlq9IuaGJwQ6gZ4BUbKik=
X-Received: by 2002:a2e:5b82:: with SMTP id m2mr3507680lje.184.1572028543662; 
 Fri, 25 Oct 2019 11:35:43 -0700 (PDT)
MIME-Version: 1.0
From: Yiwei Zhang <zzyiwei@google.com>
Date: Fri, 25 Oct 2019 11:35:32 -0700
Message-ID: <CAKT=dDk0sNAXxz-angd5WvQXXLF8p3sPLEzOt=wVSLhuaP8dkQ@mail.gmail.com>
Subject: Proposal to report GPU private memory allocations with sysfs nodes
 [plain text version]
To: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Mie2Uww8VKKTzqCqiaNX8XDqO3BRPXZkD0JU35v6uIQ=;
 b=UiTJ1zZcletvJRcxi1QXZ3reyXkpucOtDxoq1uAeP+nNencHw62BCYNqVjbOhmDj/N
 +L5J/SMiVwvau8M6Dt/n9WMnuIHqbLZHg8oES+uQKRWGMWx+RBwOWeellX4yjkq/Gl4n
 SdfvvOyo8Q4VCBu/C3HwSvetYTZsF2x34GjzggyJBarrtFpDAxNPU3U8Ng4S9TCXvAEP
 M7fhGpRC6qqUZjb2EFDVflntHnPIvX6w1fHAg8QXRvlo0aX5nwCqlf2g6sv5Yoqkxr2g
 yLk8C6uxcM3QjBJx29Pzsy6swTIZwe1kzt7Sm/kOcfCip5qhMAhHbZtlfNJD2N9fwVC3
 Zmdw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Alistair Delva <adelva@google.com>, Prahlad Kilambi <prahladk@google.com>,
 Sean Paul <seanpaul@chromium.org>, kraxel@redhat.com,
 Chris Forbes <chrisforbes@google.com>, kernel-team@android.com
Content-Type: multipart/mixed; boundary="===============1396659780=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1396659780==
Content-Type: multipart/alternative; boundary="000000000000ec4fd50595c06a50"

--000000000000ec4fd50595c06a50
Content-Type: text/plain; charset="UTF-8"

Hi folks,

This is the plain text version of the previous email in case that was
considered as spam.

--- Background ---
On the downstream Android, vendors used to report GPU private memory
allocations with debugfs nodes in their own formats. However, debugfs nodes
are getting deprecated in the next Android release.

--- Proposal ---
We are taking the chance to unify all the vendors to migrate their existing
debugfs nodes into a standardized sysfs node structure. Then the platform
is able to do a bunch of useful things: memory profiling, system health
coverage, field metrics, local shell dump, in-app api, etc. This proposal
is better served upstream as all GPU vendors can standardize a gpu memory
structure and reduce fragmentation across Android and Linux that clients
can rely on.

--- Detailed design ---
The sysfs node structure looks like below:
/sys/devices/<ro.gfx.sysfs.0>/<pid>/<type_name>
e.g. "/sys/devices/mali0/gpu_mem/606/gl_buffer" and the gl_buffer is a node
having the comma separated size values: "4096,81920,...,4096".

For the top level root, vendors can choose their own names based on the
value of ro.gfx.sysfs.0 the vendors set. (1) For the multiple gpu driver
cases, we can use ro.gfx.sysfs.1, ro.gfx.sysfs.2 for the 2nd and 3rd KMDs.
(2) It's also allowed to put some sub-dir for example "kgsl/gpu_mem" or
"mali0/gpu_mem" in the ro.gfx.sysfs.<channel> property if the root name
under /sys/devices/ is already created and used for other purposes.

For the 2nd level "pid", there are usually just a couple of them per
snapshot, since we only takes snapshot for the active ones.

For the 3rd level "type_name", the type name will be one of the GPU memory
object types in lower case, and the value will be a comma separated
sequence of size values for all the allocations under that specific type.

We especially would like some comments on this part. For the GPU memory
object types, we defined 9 different types for Android:
(1) UNKNOWN // not accounted for in any other category
(2) SHADER // shader binaries
(3) COMMAND // allocations which have a lifetime similar to a
VkCommandBuffer
(4) VULKAN // backing for VkDeviceMemory
(5) GL_TEXTURE // GL Texture and RenderBuffer
(6) GL_BUFFER // GL Buffer
(7) QUERY // backing for query
(8) DESCRIPTOR // allocations which have a lifetime similar to a
VkDescriptorSet
(9) TRANSIENT // random transient things that the driver needs

We are wondering if those type enumerations make sense to the upstream side
as well, or maybe we just deal with our own different type sets. Cuz on the
Android side, we'll just read those nodes named after the types we defined
in the sysfs node structure.

Looking forward to any concerns/comments/suggestions!

Best regards,
Yiwei

--000000000000ec4fd50595c06a50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi folks,<div><br></div><div>This is the plain text versio=
n of the previous email in case that was considered as spam.</div><div><br>=
</div><div>--- Background ---</div><div>On the downstream Android, vendors =
used to report GPU private memory allocations with debugfs nodes in their o=
wn formats. However, debugfs nodes are getting deprecated in the next Andro=
id release.</div><div><br></div><div>--- Proposal ---</div><div>We are taki=
ng the chance to unify all the vendors to migrate their existing debugfs no=
des into a standardized sysfs node structure. Then the platform is able to =
do a bunch of useful things: memory profiling, system health coverage, fiel=
d metrics, local shell dump, in-app api, etc.=C2=A0This proposal is better =
served upstream as all GPU vendors can standardize a gpu memory structure a=
nd reduce fragmentation across Android and Linux that clients can rely on.<=
/div><div><br></div><div>--- Detailed design ---</div><div>The sysfs node=
=C2=A0structure=C2=A0looks like below:</div><div>/sys/devices/&lt;ro.gfx.sy=
sfs.0&gt;/&lt;pid&gt;/&lt;type_name&gt;</div><div>e.g. &quot;/sys/devices/m=
ali0/gpu_mem/606/gl_buffer&quot; and the gl_buffer is a node having the com=
ma separated size values: &quot;4096,81920,...,4096&quot;.</div><div><br></=
div><div>For the top level root, vendors can choose their own names based o=
n the value of ro.gfx.sysfs.0 the vendors set. (1) For the multiple gpu dri=
ver cases, we can use ro.gfx.sysfs.1, ro.gfx.sysfs.2 for the 2nd and 3rd KM=
Ds. (2) It&#39;s also allowed to put some sub-dir for example &quot;kgsl/gp=
u_mem&quot; or &quot;mali0/gpu_mem&quot; in the ro.gfx.sysfs.&lt;channel&gt=
; property if the root name under /sys/devices/ is already created and used=
 for other purposes.<br></div><div><br></div><div>For the 2nd level &quot;p=
id&quot;, there are usually just a couple of them per snapshot, since we on=
ly takes snapshot for the active ones.<br></div><div><br></div><div>For the=
 3rd level &quot;type_name&quot;, the type name will be one of the GPU memo=
ry object types in lower case, and the value will be a comma separated sequ=
ence of size values for all the allocations under that specific type.<br></=
div><div><br></div><div>We especially would like some comments on this part=
. For the GPU memory object types, we defined 9 different types for Android=
:</div><div>(1) UNKNOWN // not accounted for in any other category<br></div=
><div>(2)=C2=A0SHADER=C2=A0// shader binaries</div><div>(3)=C2=A0COMMAND=C2=
=A0// allocations which have a lifetime similar to a VkCommandBuffer</div><=
div>(4)=C2=A0VULKAN=C2=A0// backing for VkDeviceMemory</div><div>(5)=C2=A0G=
L_TEXTURE=C2=A0// GL Texture and RenderBuffer</div><div>(6)=C2=A0GL_BUFFER=
=C2=A0// GL Buffer</div><div>(7)=C2=A0QUERY=C2=A0// backing for query</div>=
<div>(8)=C2=A0DESCRIPTOR=C2=A0// allocations which have a lifetime similar =
to a VkDescriptorSet</div><div>(9)=C2=A0TRANSIENT // random transient thing=
s that the driver needs</div><div><br></div><div>We are wondering if those =
type enumerations make sense to the upstream side as well, or maybe we just=
 deal with our own different type sets. Cuz on the Android side, we&#39;ll =
just read those nodes named after the types we defined in the sysfs node st=
ructure.<br></div><div><br></div><div>Looking forward to any concerns/comme=
nts/suggestions!<br></div><div><br></div><div>Best regards,</div><div>Yiwei=
</div><div><br></div></div>

--000000000000ec4fd50595c06a50--

--===============1396659780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1396659780==--
