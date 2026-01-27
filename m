Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICEuBLGHeGk/qwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:38:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E98591D61
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1630010E4FD;
	Tue, 27 Jan 2026 09:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="gktGD4Zd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915D410E4FD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 09:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1769506707; x=1770111507; i=deller@gmx.de;
 bh=W1E97dDYfBOXC9dZ0T3jhjF1s2/O32HtJZClVNuvrTQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=gktGD4ZdA+Y8LqZS8CJozM7rXHc+sBKX9L9vvDtQ9WBwWQLG9AEums2yE4W/0KqJ
 DrWOAb4x7SUv/0mst5rD7gHjBV16oqBpukj0rEYk4NyKwMFL+Iw5PMPwN/UMv+MGX
 C0MtHWN3B7SalQnp1cd//a4+I8bNwuCZ6tglrR0ANJUn380TMfo330/iXcqnFanWg
 PVyJceMxC5Iv8SoQPmA6qyDq/dmT2nu14rmdN715YOpWEMSXU6R+KXnY/vzxvSI1G
 iLDClM7Njxu4wl/9GSAyX8OGQGfGefkAH+VehwgSSuEA+tHRun0zlDndOsmgRlaxL
 av2SHqWjsYSSOh11vA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.214]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8ygY-1vhvhV0lcc-008gAC; Tue, 27
 Jan 2026 10:38:27 +0100
Message-ID: <492c3720-138c-475d-a792-36a3f0ad62f1@gmx.de>
Date: Tue, 27 Jan 2026 10:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 v1 0/4] [RUST] Framebuffer driver support
To: pengfuyuan <pengfuyuan@kylinos.cn>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hansg@kernel.org>,
 Lee Jones <lee@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Zsolt Kajtar <soci@c64.rulez.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
 <ed48e82a-cb94-477f-83c4-b2d87ae3cde6@suse.de>
 <DFYG7MT5JINY.1T8ZZ4ASIWXU@nvidia.com> <20260127080419.GA965382@peng>
 <578209b5-6d22-4255-a2e6-256d3f5afa72@gmx.de> <20260127085826.GA970322@peng>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260127085826.GA970322@peng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v9ukpmEW1U8YJbxwM9jPh7Cbn3RPIfsFmnKN7k20GTRLEG+IXnA
 RJ7aYykucqsF8WYs8CkTpRO3tIK4oDGTw2VDf/hgb8OemiYXxyGPeVBD2pQE/+mP9ebdtEy
 4OiGLYG3yHZ5oJRtjRQYNQ++YVdjf6qcrsPjZ4lqSHVIfTrG+fXWY2sYInaYFxYrfXDegkp
 QVquMV/R3dzGFJ1MpHkmw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ctOidQKSzek=;jBzBWpK7IaGIMQl85Ml3avjSopN
 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
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengfuyuan@kylinos.cn,m:acourbot@nvidia.com,m:tzimmermann@suse.de,m:dakr@kernel.org,m:aliceryhl@google.com,m:daniel.almeida@collabora.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:hansg@kernel.org,m:lee@kernel.org,m:sam@ravnborg.org,m:soci@c64.rulez.org,m:ville.syrjala@linux.intel.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nvidia.com,suse.de,kernel.org,google.com,collabora.com,gmail.com,garyguo.net,protonmail.com,umich.edu,linuxfoundation.org,ffwll.ch,ravnborg.org,c64.rulez.org,linux.intel.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gmx.de:mid,gmx.de:dkim]
X-Rspamd-Queue-Id: 6E98591D61
X-Rspamd-Action: no action

On 1/27/26 09:58, pengfuyuan wrote:
> On Tue, Jan 27, 2026 at 09:16:35AM +0100, Helge Deller wrote:
>> On 1/27/26 09:04, pengfuyuan wrote:
>>> On Mon, Jan 26, 2026 at 07:28:21PM +0900, Alexandre Courbot wrote:
>>>> On Mon Jan 26, 2026 at 7:01 PM JST, Thomas Zimmermann wrote:
>>>>> Hi
>>>>>
>>>>> Am 26.01.26 um 09:17 schrieb pengfuyuan:
>>>>>> This patch series adds Rust bindings and safe abstractions for the =
Linux
>>>>>> framebuffer subsystem, enabling framebuffer drivers to be implement=
ed in Rust.
>>>>>
>>>>> The framebuffer subsystem is obsolete and has been deprecated for a
>>>>> decade. No new drivers accepted. Anything that really wants fbdev
>>>>> already has a driver. Can we please let it die?
>>>>
>>>> This, and the patchset is also obviously AI-generated.
>>>
>>> Hi,
>>> Thank you for the feedback.
>>> I=E2=80=99d like to be clear about how I used AI in this work:
>>>
>>> 1.Cover letter =E2=80=93 Yes, I used AI to help summarize and phrase t=
he cover letter.
>>> 2.Comments in the code =E2=80=93 Some comments were written or refined=
 with AI assistance.
>>> 3.Learning the codebase =E2=80=93 When reading and understanding exist=
ing Rust-for-Linux code (including DRM and other abstractions), I used AI =
as a helper to analyze and explain structure and patterns.
>>> 4.Writing the code =E2=80=93 The implementation was not fully generate=
d by AI.  I wrote the code myself and used AI mainly to look up existing a=
bstractions, traits, and APIs (e.g. =E2=80=9Chow does X work? =E2=80=9D, =
=E2=80=9Cwhat=E2=80=99s the right trait for Y?=E2=80=9D)  while I was codi=
ng.
>>>
>>> So: AI was used for summaries, comments, learning, and looking
>>> things up;  the logic and structure of the code are mine, and I take
>>> responsibility for them.
>>> If you have concerns about specific parts (e.g. wording, style, or
>>> design), I=E2=80=99m happy to rework those patches or to adjust how I
>>> describe tool use in future submissions.
>>
>> No.
>> Please don't resend any patches for the fbdev layer.
>> There is no need to provide rust bindings for fbdev, as new
>> graphics drivers should use DRM.
>>
>> Helge
>=20
> Hi Helge,
>=20
> Thank you for the clarification, I understand. I will not resend any fbd=
ev
> patches.
>=20
> Just to give some background on why I started with Rust framebuffer bind=
ings:
> our company has a new graphics card, and the plan is to gradually implem=
ent
> the display controller (DC) driver using the Rust-for-Linux DRM framewor=
k.
> My goal is to bring up the display step by step on an ARM64 system with =
this
> new GPU.
>=20
> Since it looks like the current Rust DRM support does not yet include KM=
S
> abstractions (CRTC/plane/connector etc.), my initial idea was to first u=
se a
> simple framebuffer-based approach to light up the display, and then late=
r
> migrate the DC driver to DRM and eventually to KMS abstractions in Rust.
>=20
> Given your feedback, I will drop the fbdev approach and focus on DRM ins=
tead.
>=20
> I would like to ask about the current status and plans for Rust DRM KMS
> support:
>=20
> - Is there any active work or a design for KMS abstractions in Rust?
> - Is there a WIP tree or an RFC that I could look at?
> - Are there specific areas where I could help (e.g. prototyping KMS bind=
ings,
>    writing tests, or working on smaller pieces under guidance)?
>=20
> My goal is to eventually run the DC driver for this new GPU using the Ru=
st
> DRM stack on that ARM64 system, so I would be happy to help where it is =
most
> useful for the project.
>=20
> Thank you again for your time and guidance.

Since you asked me directly, here is my very personal opinion:
Rust might be the best and most secure programming language on earth.
Nevertheless, *I* would write a standard DRM driver in C, based on
existing C APIs and drivers, as this seems to be the most fastest and
easiest way to get a functional driver that behaves as existing drivers.

I'm sure someone here on this list will provide you with
better answers to your Rust and DRM questions above.

Helge
