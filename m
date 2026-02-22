Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJiIOMwgnGkZ/wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:41:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A0E174126
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B7210E2CE;
	Mon, 23 Feb 2026 09:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ggrorTE3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B384A10E12C
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 21:53:23 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-5fa26e497feso1163353137.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 13:53:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771797202; cv=none;
 d=google.com; s=arc-20240605;
 b=T25yTFZrFtwJsxrZUeSKVVQy2BVoaI+uAI0BG4jZ0u/2G/A3+LERBPponXZgIxcFzQ
 x9ziCgt8UVf4YTYrLpVF9AKA5Mugpu6ZKrJS+sksWfmDHjB0RE5Z3nSnqVVg3mMZn4Az
 f+30n+79lJ2mpd2XqAPdAk4BjTi9b2pGmZwZuCqQ1DSbrT2D+AWG61kgSEyZj2p78WaR
 gXUfR2z3gYbRGOGFvfSMruw8ulpQWHVU/fKTAUsrPlMbXDwLTeq8QtNE1OTAe5o0qSZX
 rSjPv+Ofbe3ZvM4V7X7bphjVWciTAwRge62w+w4XDJdUG8cPgJnYqINYwCFZ0HsdUxnY
 n4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=MNeGMhAb3TmH7KVHq/DigEL+n2cB/alR7oOTtMkE/zY=;
 fh=KiAtJHOS4Dli/KUudnYa1qCtO2cipqDqQU2rvrggc2A=;
 b=OsdSoJFxQqiX/+R5SAz/0AQvp7/FTEP9sXZjSFep0WuFO7/+huTo8uH17cfXTowiLz
 btvUr27CC66HMN0E7YTChaXAfCm9Al7pOGsGtkH2OFkyBOifbP57HNKnMF1JdO6KhmY7
 RDLPIoZEtvTOjSQX1Np27UE37dM1HRqifsM8jbH5rGnOUELxQelTDDAvDFfvJ+njAwFk
 2SFi+G8p0IKG3dz9IupeNJR0xTod2N2y9qYzuw1ThjJLsauB7PRucK++hNmrqNOMCBJI
 EFHMyhp0Wx6hq0e8kRAX8MdKvVXF7a/x/4EyxT62OH16nPoE4vLutFROD4/wfYa8crnG
 BSTA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771797202; x=1772402002; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MNeGMhAb3TmH7KVHq/DigEL+n2cB/alR7oOTtMkE/zY=;
 b=ggrorTE3FKrRrREnyYykRAxJSIo8zHwzpnrNb7GMKdXLtsA0KYHDtcyYAPN0Vt/quB
 3v78DTzfRyU+u9locrMXRZ2iQ1ZqOWgp5f9ksXbKjvcw7VqSkL8akuyk1l0g1Xy3e8lz
 eqIQ4fzy3yR27vRUbxd8z1yf7AcX3rfpBB3+Ij1Go3EttRFpNjgCVzAADKqTFF1xR45l
 kvUxLTM6zYgUWW8GkmjS2JvKqZ4lckyUEfDzLMt+Fs1VB7GoM7+oBQKbB7Jg/z4jgkkN
 wMrkVD+IgThwIvdpqD6LQ/k9zU2qW5euj2xH2tK2GNWs2GFu+qE4BaMF9wMe1L4/Ma4H
 8IJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771797202; x=1772402002;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MNeGMhAb3TmH7KVHq/DigEL+n2cB/alR7oOTtMkE/zY=;
 b=W3XyNAV5TzTWsQLtescwGZ/btMlHwLqWMVdYXtgtSg5OTBRnPAdS/Edy0LBgUQG+Cg
 HFtnsQq1vXFvr7XPQm+DVp6YhC8yaknvi+gRYaGCK5o4kF0b8qxgNEmScbZkqv4avzA1
 BbCf5F++7mVso70r50L381XV9RjUC3yxxaZkzJbL1lFEhZuRCqqQyjyj9bVBzNa/WhR/
 4sV2yj7rigOvZFOU3ubC9A4Zza4PWaKHOBTgdIFV4VgP4SS6cut7oOktE01KR34UaRC5
 9ViXqwskPHWkL9gwz2Ssc1ZaWbC2njBjCzTKlSfgcq/pftllzpWp4FlcCrvQqNHi53+L
 IOpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1wFn6qVXFF6RVNIxPzkNHDs+DeCVZrtKY9Vwm6Abxg6tE+1/u9rzlALqCjfabEFRaFqkFB+8wlf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXpBVk8Ma5CYvDLS5AZsApEFYdxETjilzAbGQq1D8w6MUb90GF
 wKxdfxZhRYy3mvLUqLxut1+O2tSF7l5AYfjDMxpDugQ1ZOq0UfDfPkKaP+MXZctfEdWaVD+7JmI
 WsuFofZDJ2H8zNFfPfxA0Ju4Zm2xe2Nc=
X-Gm-Gg: AZuq6aI/DHUbqb0WClN1Ro4Is+yTICOhVTBI7om2aXYpqiCPuaQPH+eqm/tsQBF41PC
 Me+70Kq99aIIfQDl0AHsCxlBZfsKZwAJzc13nS2eYKT/x9AtBhabA/4t2ISSs1MVvWN7sfQ+eyZ
 wwVDErMTrKYC3AVmxo/IyTHNnpmyWpeXfA2H90la1AeUCDqLetotErMOy2fZp6h2vl6sRGTa4o6
 NKP/ScRmzLGCpoqzkXUBprymVtiA8EjyLFXrXF9YdRvEOFsJ5eBKsO+2dyKdSCPmNFuj+TnhgPL
 ic8uvE++0tcLtuHLsBmGEz25J/76qwP2uisjdRGHafxF6Z6Skfe18Jp7VgFwJrpfjOhcX94NMqd
 sE+NxsIxyF3uI+AZoii4b
X-Received: by 2002:a05:6102:c4e:b0:5ef:b3b7:6e3f with SMTP id
 ada2fe7eead31-5feb2e88fe4mr2402295137.3.1771797202335; Sun, 22 Feb 2026
 13:53:22 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
Date: Sun, 22 Feb 2026 21:53:02 +0000
X-Gm-Features: AaiRm50IWhxla8T7yEDMx81GClupXU0m2trQyK_dBcW8HtLqcMb9UhSaFMoA9w8
Message-ID: <CAD0gVBtsG5Gfpq6hNDnCXMPzKw_o4nXLsY_GqftckfHaVPmC7A@mail.gmail.com>
Subject: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: stable@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: multipart/alternative; boundary="000000000000dbfd0b064b70ae9f"
X-Mailman-Approved-At: Mon, 23 Feb 2026 09:41:15 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.60 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andresfperez@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[vger.kernel.org,ideasonboard.com,kernel.org,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andresfperez@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 58A0E174126
X-Rspamd-Action: no action

--000000000000dbfd0b064b70ae9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

# OVERVIEW

Since kernel v6.16.1, switching from an X11 session to a text VT and back
freezes the display on a ThinkPad P15 Gen 2. The system remains responsive
over SSH; only the display is frozen. Bisecting identified commit
d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
ioctls") as the trigger. Reverting the logic change in that commit fixes VT
switching
on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution.
Wayland
compositors (e.g., river and sway) are not affected.

Last good:  v6.15.9
First bad:  v6.16.1
Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the camera
for some ioctls

## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
CPU:        Intel Core i7-11800H (Tiger Lake-H)
iGPU:        Intel UHD Graphics (TGL GT1)
dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-open)
Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
Firmware:   LENOVO N37ET61W (1.97)
OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display manager

## Symptoms and reproduction steps:
1. Boot, start X11 on tty1 (startx).
2. Switch to tty2 (Ctrl+Alt+F2): works.
3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
   - Frozen on the last frame shown before switching away.
   - System is fully responsive over SSH.
   - Other VTs switch normally between each other as long as X11 is not
active on them.
   - Killing X does not recover the display. A reboot is required.

# DEBUG ANALYSIS

On v6.16.1, the VT switch back to X triggers a full modeset due to pipe
configuration mismatches detected by intel_pipe_config_compare:

[drm:intel_pipe_config_compare] fastset requirement not met in pipe_bpp
  (expected 30, found 24)
[drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
  (expected link 269484/524288, found link 336855/524288)
[drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw_stat=
e
  (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
[drm:intel_pipe_config_compare] fastset requirement not met in port_clock
  (expected 270000, found 216000)
[drm:intel_atomic_check] forcing full modeset

On v6.15.9, the same VT switch shows no such messages.
no pipe_config_compare runs, no modeset, no freeze.

# BISECT AND VERIFICATION

The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
certain V4L2 IOCTLS to call video_ioctl2 directly without first calling
uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_get
before video_ioctl2.

## VT switching verification across kernel versions:

  v6.12.74 arch pkg:   WORKS
  v6.15.9 arch pkg:    WORKS
  v6.15.9 from source: WORKS
  v6.16.1 with d1b618e reverted:     WORKS
  v6.17.9 with PM wrapping restored: WORKS
  v6.18.9 with PM wrapping restored: WORKS

  v6.16.1 from source:  FREEZES
  v6.16.1 arch pkg:     FREEZES
  v6.17.9 arch pkg:     FREEZES
  v6.18.9 from source:  FREEZES
  v6.18.9 arch pkg:     FREEZES

## Things that do not eliminate the freeze

  - module_blacklist=3Duvcvideo on boot
  - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)
  - i915.enable_psr=3D0
  - Bypassing intel_vrr_transcoder_enable/disable (no-op)
  - xrandr --output eDP-1 --set "max bpc" 10
  - Xorg config FBDepth 30 (No effect on pipe_bpp)

## Workaround patch

Reverting the optimization from d1b618e to restore the unconditional
uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c
b/drivers/media/usb/uvc/uvc_v4l2.c
index 9e4a251eca88..15057b47ec4f 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct file
*file,
  unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);
  int ret;

- /* The following IOCTLs need to turn on the camera. */
- switch (converted_cmd) {
- case UVCIOC_CTRL_MAP:
- case UVCIOC_CTRL_QUERY:
- case VIDIOC_G_CTRL:
- case VIDIOC_G_EXT_CTRLS:
- case VIDIOC_G_INPUT:
- case VIDIOC_QUERYCTRL:
- case VIDIOC_QUERYMENU:
- case VIDIOC_QUERY_EXT_CTRL:
- case VIDIOC_S_CTRL:
- case VIDIOC_S_EXT_CTRLS:
- case VIDIOC_S_FMT:
- case VIDIOC_S_INPUT:
- case VIDIOC_S_PARM:
- case VIDIOC_TRY_EXT_CTRLS:
- case VIDIOC_TRY_FMT:
- ret =3D uvc_pm_get(handle->stream->dev);
- if (ret)
- return ret;
- ret =3D video_ioctl2(file, cmd, arg);
- uvc_pm_put(handle->stream->dev);
+ ret =3D uvc_pm_get(handle->stream->dev);
+ if (ret)
  return ret;
- }
-
- /* The other IOCTLs can run with the camera off. */
- return video_ioctl2(file, cmd, arg);
+ ret =3D video_ioctl2(file, cmd, arg);
+ uvc_pm_put(handle->stream->dev);
+ return ret;
 }

 const struct v4l2_ioctl_ops uvc_ioctl_ops =3D {

Andr=C3=A9s

--000000000000dbfd0b064b70ae9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div># OVERVIEW<br><br>Since kernel v6.16.1, switching fro=
m an X11 session to a text VT and back<br>freezes the display on a ThinkPad=
 P15 Gen 2. The system remains responsive<br>over SSH; only the display is =
frozen. Bisecting identified commit<br>d1b618e7954802fe (&quot;media: uvcvi=
deo: Do not turn on the camera for some<br>ioctls&quot;) as the trigger. Re=
verting the logic change in that commit fixes VT switching<br>on v6.16.1, v=
6.17.9, and v6.18.9, but that is not an actual solution. Wayland=C2=A0</div=
><div>compositors (e.g., river and sway) are not affected.<br><br>Last good=
: =C2=A0v6.15.9<br>First bad: =C2=A0v6.16.1<br>Bisect result: d1b618e795480=
2fe media: uvcvideo: Do not turn on the camera for some ioctls<br><br>## Ha=
rdware: =C2=A0 Lenovo ThinkPad P15 Gen 2i (20YQ0031US)<br>CPU: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Intel Core i7-11800H (Tiger Lake-H)<br>iGPU: =C2=A0 =C2=A0=
 =C2=A0 =C2=A0Intel UHD Graphics (TGL GT1)</div><div>dGPU:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0NVIDIA T1200 (not involved in eDP output; driver: nvidia-open)<br=
>Display: =C2=A0 =C2=A015.6&quot; 1920x1080 eDP, 10 bpc capable (EDID 1.4)<=
br>Webcam: =C2=A0 =C2=A0 Integrated Camera on PCH xHCI (Bus 003 Port 004)<b=
r>Firmware: =C2=A0 LENOVO N37ET61W (1.97)<br>OS: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Arch Linux, Nix home-manager, X11 + xmonad, no display manager<br><br>#=
# Symptoms and reproduction steps:<br>1. Boot, start X11 on tty1 (startx).<=
br>2. Switch to tty2 (Ctrl+Alt+F2): works.<br>3. Switch back to tty1 (Ctrl+=
Alt+F1): display freezes.<br>=C2=A0 =C2=A0- Frozen on the last frame shown =
before switching away.<br>=C2=A0 =C2=A0- System is fully responsive over SS=
H.<br>=C2=A0 =C2=A0- Other VTs switch normally between each other as long a=
s X11 is not active on them.<br>=C2=A0 =C2=A0- Killing X does not recover t=
he display. A reboot is required.<br><br># DEBUG ANALYSIS<br><br>On v6.16.1=
, the VT switch back to X triggers a full modeset due to pipe<br>configurat=
ion mismatches detected by intel_pipe_config_compare:<br><br>[drm:intel_pip=
e_config_compare] fastset requirement not met in pipe_bpp<br>=C2=A0 (expect=
ed 30, found 24)<br>[drm:intel_pipe_config_compare] fastset requirement not=
 met in dp_m_n<br>=C2=A0 (expected link 269484/524288, found link 336855/52=
4288)<br>[drm:intel_pipe_config_compare] fastset requirement not met in dpl=
l_hw_state<br>=C2=A0 (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)<br>[d=
rm:intel_pipe_config_compare] fastset requirement not met in port_clock<br>=
=C2=A0 (expected 270000, found 216000)<br>[drm:intel_atomic_check] forcing =
full modeset<br><br>On v6.15.9, the same VT switch shows no such messages.<=
br>no pipe_config_compare runs, no modeset, no freeze.<br><br># BISECT AND =
VERIFICATION<br><br>The bisect converged on d1b618e7954802fe in the uvcvide=
o driver. This<br>commit adds a switch statement to uvc_v4l2_unlocked_ioctl=
 that allows<br>certain V4L2 IOCTLS to call video_ioctl2 directly without f=
irst calling<br>uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls cal=
led uvc_pm_get<br>before video_ioctl2.<br><br>## VT switching verification =
across kernel versions:<br><br>=C2=A0 v6.12.74 arch pkg: =C2=A0 WORKS<br>=
=C2=A0 v6.15.9 arch pkg: =C2=A0 =C2=A0WORKS<br>=C2=A0 v6.15.9 from source: =
WORKS<br>=C2=A0 v6.16.1 with d1b618e reverted: =C2=A0 =C2=A0 WORKS<br>=C2=
=A0 v6.17.9 with PM wrapping restored: WORKS<br>=C2=A0 v6.18.9 with PM wrap=
ping restored: WORKS<br><br>=C2=A0 v6.16.1 from source: =C2=A0FREEZES<br>=
=C2=A0 v6.16.1 arch pkg: =C2=A0 =C2=A0 FREEZES<br>=C2=A0 v6.17.9 arch pkg: =
=C2=A0 =C2=A0 FREEZES<br>=C2=A0 v6.18.9 from source:=C2=A0 FREEZES</div><di=
v>=C2=A0 v6.18.9 arch pkg: =C2=A0 =C2=A0 FREEZES<br><br>## Things that do n=
ot eliminate the freeze<br><br>=C2=A0 - module_blacklist=3Duvcvideo on boot=
<br>=C2=A0 - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)<br>=C2=A0 - i915.ena=
ble_psr=3D0<br>=C2=A0 - Bypassing intel_vrr_transcoder_enable/disable (no-o=
p)<br>=C2=A0 - xrandr --output eDP-1 --set &quot;max bpc&quot; 10<br>=C2=A0=
 - Xorg config FBDepth 30 (No effect on pipe_bpp)<br><br>## Workaround patc=
h<br><br>Reverting the optimization from d1b618e to restore the uncondition=
al<br>uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.<br>=
<br>diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/u=
vc_v4l2.c<br>index 9e4a251eca88..15057b47ec4f 100644<br>--- a/drivers/media=
/usb/uvc/uvc_v4l2.c<br>+++ b/drivers/media/usb/uvc/uvc_v4l2.c<br>@@ -1199,3=
3 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,<br>=C2=
=A0	unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);<br>=C2=A0	int r=
et;<br>=C2=A0<br>-	/* The following IOCTLs need to turn on the camera. */<b=
r>-	switch (converted_cmd) {<br>-	case UVCIOC_CTRL_MAP:<br>-	case UVCIOC_CT=
RL_QUERY:<br>-	case VIDIOC_G_CTRL:<br>-	case VIDIOC_G_EXT_CTRLS:<br>-	case =
VIDIOC_G_INPUT:<br>-	case VIDIOC_QUERYCTRL:<br>-	case VIDIOC_QUERYMENU:<br>=
-	case VIDIOC_QUERY_EXT_CTRL:<br>-	case VIDIOC_S_CTRL:<br>-	case VIDIOC_S_E=
XT_CTRLS:<br>-	case VIDIOC_S_FMT:<br>-	case VIDIOC_S_INPUT:<br>-	case VIDIO=
C_S_PARM:<br>-	case VIDIOC_TRY_EXT_CTRLS:<br>-	case VIDIOC_TRY_FMT:<br>-		r=
et =3D uvc_pm_get(handle-&gt;stream-&gt;dev);<br>-		if (ret)<br>-			return =
ret;<br>-		ret =3D video_ioctl2(file, cmd, arg);<br>-		uvc_pm_put(handle-&g=
t;stream-&gt;dev);<br>+	ret =3D uvc_pm_get(handle-&gt;stream-&gt;dev);<br>+=
	if (ret)<br>=C2=A0		return ret;<br>-	}<br>-<br>-	/* The other IOCTLs can r=
un with the camera off. */<br>-	return video_ioctl2(file, cmd, arg);<br>+	r=
et =3D video_ioctl2(file, cmd, arg);<br>+	uvc_pm_put(handle-&gt;stream-&gt;=
dev);<br>+	return ret;<br>=C2=A0}<br>=C2=A0<br>=C2=A0const struct v4l2_ioct=
l_ops uvc_ioctl_ops =3D {</div><div><div dir=3D"ltr" class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature"><br>Andr=C3=A9s</div></div></div>

--000000000000dbfd0b064b70ae9f--
