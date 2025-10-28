Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2784AC17030
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B31610E66B;
	Tue, 28 Oct 2025 21:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H8pOS6nn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDA410E66B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:32:14 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-273a0aeed57so3808345ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761687134; x=1762291934; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9vpfTkEJJrwc2xX0C5BeWmIVVR7tw4/2cwqiSLgDVd4=;
 b=H8pOS6nn8RPe7rQrCKx/KPyMzAeO9K99YUhVyegEMQcsNRHcV+VMeIphcECZuUPtZp
 XTf13/XrKyAlCjaZ0x3nvmiWA5Rv/gbx0sqUdVir6HnabrezkxY9JrW7DM9b0wQ3YRBY
 s7pgqg1ptJereqZaiETZRDYO6dqJmcpjhaOf7H0J/3DU5rCN2i5hD0ONAm+WtYyEe4HR
 MjwIxY7Uz8WSM7S/dO5EZh1fDU/CFNvuNEl2yjg+JEYrGUHAZUCabMWdFWsXn9QxX/0F
 41ZfhnZQ+eRpnO1In/AnOUA3gBm5PePQo4D1ccZphNJfcniNkZMQjKCK23mXPkHDbxrA
 yLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761687134; x=1762291934;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9vpfTkEJJrwc2xX0C5BeWmIVVR7tw4/2cwqiSLgDVd4=;
 b=RnNWT3PLOG2FwiyRepn87DQPi4MvoZV+IRB5U0HXYEi3mhxQ/3CcteXvAIhxpEmwQl
 /GS3KOnyWvxA20sGxEko6jsB/RQ6hy9HdqwCxC57Abm6eq+h9kuMKHQWIkkXqrvVXgS1
 7VYkxYYqfk0qgJ26b+JOR1cZE9k6TCEVGugFmM80KSvHsyI2Ctr+WzCWI9PJl6IlvjCj
 tHxg0iMiWkUa6Tzq9eJrlc+ARviRZ6/PXlr1vKnCzKiTloyKN1P8Y2cVJcejPcxwsCss
 1AYaWyFaoiGFD/K26bgmbMbjE8QBJ1ujMpNsgKx2JrDSxs+dVoFrYVT0knOdOfmdZ5Ah
 gCkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeBivVH5D+pJIaVv03pyHBvIngzAwLdDSQX+GLrIY+7bULBb8ACxARVBs8afSwYsH2j+yrzWX+Nr4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyOFG2DVgqWDRfy0g/pJrptq8rOWFnVUzZG8e93qwbl6fi1gdx
 +QUqu0VqORIlDLA6/zGn4ZAQqr/WUbZLnFAmzqYP8WtwYIGTM7u1RhQhhcfbyW9Qxht/0QgU5y7
 X6YbAGDZ7LGHf6liKhRgZVTQxYm4fihE=
X-Gm-Gg: ASbGncvEn39bVEtQr0gOV27NzrToZCC2B9gbjwzH6wluxY6urjXWhad0Y+l30nXLuea
 AAVABqLFUN2KD5dzvcf1Vhf6xzoNpS1UsqJjlCQbqplYinRi77cUb1oPeWr82afgd6NssnyzlTg
 RUa7Rq/uMrtz8tXOdh78qa7PAbwbwdv3qzoSxUO5t0Ks/qRsToyG2+qQtYYhiF2ioaw70eW/fYI
 6VBYE5+/qTnQb3HVaIq7mAdIWzH1vc8NH1WVB/dDemmPz05UjO6xYNhIPUeW3EJx0XNpsoUinN0
 frE6klQkxfv3+3UwI1c=
X-Google-Smtp-Source: AGHT+IHjLNlpaTYUOIRUXC6meT0JPw5Ib+pllKlsw5/dzxPSuR51dLvavDFGQDjTAQyPmnsEM71DKc76gd+1NNSGYyM=
X-Received: by 2002:a17:903:1a67:b0:294:9132:75d2 with SMTP id
 d9443c01a7336-294deb2656amr7680145ad.25.1761687133918; Tue, 28 Oct 2025
 14:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLBDxfOVtfGGqiKQ@mail.gmail.com>
 <CAPM=9twtwNGjEXBv1Yj6vNLfEMPxuMgepOkhBKQYYtm0cmc45Q@mail.gmail.com>
 <54375f5e6c5290aa218812c489ffe88e594217bd@intel.com>
 <CACRbrPHM=8DmTD2Wg__fBDpawuugA9C+CNr8-W8BJOnZfmobdA@mail.gmail.com>
 <a7d53f43e0c9d4c697946ecec31c9441df540a47@intel.com>
 <CACRbrPEDJa_mMTrB3aGtEsmF4+_XZCrpmRj2TgA2hnhUhroNNw@mail.gmail.com>
 <64f7c8cae1b49f1626fddc536b3a41bf52621e65@intel.com>
In-Reply-To: <64f7c8cae1b49f1626fddc536b3a41bf52621e65@intel.com>
From: =?UTF-8?Q?Tiago_Martins_Ara=C3=BAjo?= <tiago.martins.araujo@gmail.com>
Date: Tue, 28 Oct 2025 22:32:02 +0100
X-Gm-Features: AWmQ_bmrBkUkOuuXcMRkZLx-rz6_Q_oxbLP8EakA9-ApjkjL-GZcIT-NoGCAflU
Message-ID: <CACRbrPEkT5bqRG_z8C17wNe_nHbDD3+w70iqvRcnmasrTzqxoQ@mail.gmail.com>
Subject: Re: DisplayID checksum validation blocking hardware capabilities -
 CSO T3 panel
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 simona@ffwll.ch, mpearson-lenovo@squebb.ca
Content-Type: multipart/alternative; boundary="000000000000d297d706423ebf8f"
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

--000000000000d297d706423ebf8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 9:10=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com>
wrote:
> I just sent a patch series [1] that might help. Please try. It's
> untested, I hope I didn't botch up anything... I was also getting too
> tired to double check the quirk against your EDID in patch 3. Fingers
> crossed.

Hi Jani,

I've tested your DisplayID quirk patch series [1] and can confirm it works
perfectly!

Test Results:
- DisplayID checksum errors now properly ignored (kernel logs show
"ignoring")
- 120Hz mode working: 2880x1800@120.000+vrr
- System stable, no display artifacts
- No issues after reboot and testing

Some log from my terminal:

=E2=9E=9C  ~ sudo dmesg | grep -i displayid
[    4.673483] [drm] DisplayID checksum invalid, remainder is 248 (ignoring=
)
[    4.673489] [drm] DisplayID checksum invalid, remainder is 248 (ignoring=
)
[    4.673492] [drm] DisplayID checksum invalid, remainder is 248 (ignoring=
)
[    4.673494] [drm] DisplayID checksum invalid, remainder is 248 (ignoring=
)
[    4.673496] [drm] DisplayID checksum invalid, remainder is 248 (ignoring=
)
[    4.673503] [drm] DisplayID checksum invalid, remainder is 248 (ignoring=
)
[    4.674242] [drm] DisplayID checksum invalid, remainder is 248 (ignoring=
)
[    4.674245] [drm] DisplayID checksum invalid, remainder is 248 (ignoring=
)
...

=E2=9E=9C  ~ gnome-monitor-config list 2>/dev/null || gsettings get
org.gnome.desktop.interface scaling-factor
Monitor [ eDP-1 ] ON
  display-name: Built-in display
  2880x1800@120 [id: '2880x1800@120.000+vrr'] [preferred scale =3D 1.74757 =
(1
1.25 1.5 1.74757 2 2.25 2.5 2.74809 3 3.24324 3.49515)] CURRENT
...

Perhaps I should just buy a Thinkpad next time :)
Jokes aside, thanks for your work on this patch!

Regards,
Tiago

[1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14703

--=20
Tiago Martins Ara=C3=BAjo

--000000000000d297d706423ebf8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Oct 28, 2025 at 9:10=E2=80=AFPM J=
ani Nikula &lt;<a href=3D"mailto:jani.nikula@linux.intel.com">jani.nikula@l=
inux.intel.com</a>&gt; wrote:</div><div>&gt; I just sent a patch series [1]=
 that might help. Please try. It&#39;s<br>&gt; untested, I hope I didn&#39;=
t botch up anything... I was also getting too<br>&gt; tired to double check=
 the quirk against your EDID in patch 3. Fingers<br>&gt; crossed.</div><div=
><br></div><div>Hi Jani,<br><br>I&#39;ve tested your DisplayID quirk patch =
series [1] and can confirm it works perfectly!<br><br>Test Results:<br>- Di=
splayID checksum errors now properly ignored (kernel logs show &quot;ignori=
ng&quot;)<br>- 120Hz mode working: 2880x1800@120.000+vrr<br>- System stable=
, no display artifacts<br><div>- No issues after reboot and testing</div><d=
iv><br></div><div>Some log from my terminal:</div><br><div>=E2=9E=9C =C2=A0=
~ sudo dmesg | grep -i displayid<br>[ =C2=A0 =C2=A04.673483] [drm] DisplayI=
D checksum invalid, remainder is 248 (ignoring)<br>[ =C2=A0 =C2=A04.673489]=
 [drm] DisplayID checksum invalid, remainder is 248 (ignoring)<br>[ =C2=A0 =
=C2=A04.673492] [drm] DisplayID checksum invalid, remainder is 248 (ignorin=
g)<br>[ =C2=A0 =C2=A04.673494] [drm] DisplayID checksum invalid, remainder =
is 248 (ignoring)<br>[ =C2=A0 =C2=A04.673496] [drm] DisplayID checksum inva=
lid, remainder is 248 (ignoring)<br>[ =C2=A0 =C2=A04.673503] [drm] DisplayI=
D checksum invalid, remainder is 248 (ignoring)<br>[ =C2=A0 =C2=A04.674242]=
 [drm] DisplayID checksum invalid, remainder is 248 (ignoring)<br>[ =C2=A0 =
=C2=A04.674245] [drm] DisplayID checksum invalid, remainder is 248 (ignorin=
g)<br>...<br><br>=E2=9E=9C =C2=A0~ gnome-monitor-config list 2&gt;/dev/null=
 || gsettings get org.gnome.desktop.interface scaling-factor<br>Monitor [ e=
DP-1 ] ON<br>=C2=A0 display-name: Built-in display<br>=C2=A0
 2880x1800@120 [id: &#39;2880x1800@120.000+vrr&#39;] [preferred scale =3D 1=
.74757=20
(1 1.25 1.5 1.74757 2 2.25 2.5 2.74809 3 3.24324 3.49515)] CURRENT<br>...</=
div><div><br></div>Perhaps I should just buy a Thinkpad=C2=A0next time :)</=
div><div><div>Jokes aside, thanks for your work on this patch!</div><div><b=
r></div><div>Regards,</div><div>Tiago</div><br></div><div>[1] <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14703">https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14703</a></div><br><span class=3D=
"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_sign=
ature">Tiago Martins Ara=C3=BAjo<br></div></div>

--000000000000d297d706423ebf8f--
