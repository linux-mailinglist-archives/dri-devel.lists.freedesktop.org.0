Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EVsAXx0eGnEpwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:17:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E3B90FC5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AE110E4CF;
	Tue, 27 Jan 2026 08:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="BsUqOQ6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C2810E4CF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 08:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1769501806; x=1770106606; i=deller@gmx.de;
 bh=t3xEStzE0KDcLKbL4GTxGQ8BQMuutDQmhKrNhNjqOv8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=BsUqOQ6B8ZAy7/MPhX+WFiy+1JfG70QaS9/8JO8OB+a0FZfcPQz1xkl3UZSU19wh
 yXFDmR3OvK15zD/YBrv0WW7pPA4EUNllDFzE4VjjyyCL5pC09Cby4jQBXjJIX8g8B
 E8vXZsamRKiRy8SjOpoHcqUlYEfpVm+UQKjFl1Vje6il9dqc9vBNrktGZfmYk6TBR
 ZfwpBhljqBl3adwmanCBdqqo6YPW+jL8HI9MW45J9XowZ2vOw5kJjgMBdz+OuwAaw
 fi81jMYe65y8gH11RjMrLnu2XdnWtIEnYOegzPTuSWKRFK1KaXj75VeuxsjJ9bRrM
 Id4qqgKd7I2AQNKRhg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.214]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfNf-1w234k40GF-00sWPf; Tue, 27
 Jan 2026 09:16:46 +0100
Message-ID: <578209b5-6d22-4255-a2e6-256d3f5afa72@gmx.de>
Date: Tue, 27 Jan 2026 09:16:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 v1 0/4] [RUST] Framebuffer driver support
To: pengfuyuan <pengfuyuan@kylinos.cn>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
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
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260127080419.GA965382@peng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:72JYuftO3cKHjhfTFUOFcAaSFo1REZhebbnA9N/0fGBYXEamCIK
 71I5zulWae1JpBdunCWTVewbwu/TfsGyXuNLZvNgWSUhco7O5l2czYnYkTMsbhmDLSR4vaj
 M5vRxHPrwGEf+fUIUuOcpz9oVH9T7rnZ4LNBANXowb0UDVITyxJWr5xHAw4mkb9H8L3U3+k
 14aOc17h7TNAGP0tm2S4Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1ih1TJGAzUo=;t1Bm7o3pg8YriNo1D5OslcdAcdR
 +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
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
	FREEMAIL_CC(0.00)[suse.de,kernel.org,google.com,collabora.com,gmail.com,garyguo.net,protonmail.com,umich.edu,linuxfoundation.org,ffwll.ch,ravnborg.org,c64.rulez.org,linux.intel.com,vger.kernel.org,lists.freedesktop.org];
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
X-Rspamd-Queue-Id: 21E3B90FC5
X-Rspamd-Action: no action

On 1/27/26 09:04, pengfuyuan wrote:
> On Mon, Jan 26, 2026 at 07:28:21PM +0900, Alexandre Courbot wrote:
>> On Mon Jan 26, 2026 at 7:01 PM JST, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 26.01.26 um 09:17 schrieb pengfuyuan:
>>>> This patch series adds Rust bindings and safe abstractions for the Li=
nux
>>>> framebuffer subsystem, enabling framebuffer drivers to be implemented=
 in Rust.
>>>
>>> The framebuffer subsystem is obsolete and has been deprecated for a
>>> decade. No new drivers accepted. Anything that really wants fbdev
>>> already has a driver. Can we please let it die?
>>
>> This, and the patchset is also obviously AI-generated.
>=20
> Hi,
> Thank you for the feedback.
> I=E2=80=99d like to be clear about how I used AI in this work:
>=20
> 1.Cover letter =E2=80=93 Yes, I used AI to help summarize and phrase the=
 cover letter.
> 2.Comments in the code =E2=80=93 Some comments were written or refined w=
ith AI assistance.
> 3.Learning the codebase =E2=80=93 When reading and understanding existin=
g Rust-for-Linux code (including DRM and other abstractions), I used AI as=
 a helper to analyze and explain structure and patterns.
> 4.Writing the code =E2=80=93 The implementation was not fully generated =
by AI.  I wrote the code myself and used AI mainly to look up existing abs=
tractions, traits, and APIs (e.g. =E2=80=9Chow does X work? =E2=80=9D, =E2=
=80=9Cwhat=E2=80=99s the right trait for Y?=E2=80=9D)  while I was coding.
>=20
> So: AI was used for summaries, comments, learning, and looking
> things up;  the logic and structure of the code are mine, and I take
> responsibility for them.
> If you have concerns about specific parts (e.g. wording, style, or
> design), I=E2=80=99m happy to rework those patches or to adjust how I
> describe tool use in future submissions.

No.
Please don't resend any patches for the fbdev layer.
There is no need to provide rust bindings for fbdev, as new
graphics drivers should use DRM.

Helge
