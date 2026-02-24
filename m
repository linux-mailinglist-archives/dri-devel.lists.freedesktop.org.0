Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMifEODYnWk0SQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:59:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D541118A333
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AFB10E5EA;
	Tue, 24 Feb 2026 16:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="lnzJEWV5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J7lyvhNv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B97810E5E8;
 Tue, 24 Feb 2026 16:59:06 +0000 (UTC)
Date: Tue, 24 Feb 2026 17:59:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1771952344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Iy7ZEO55Jhhl31ZvbYVjantUPH52WNb/3cgiUFVx5I=;
 b=lnzJEWV5mu7cDRXITe5q4AvyphtfzSvJwT/0379YgIYtVOvqpoqd7Drhqi3PJJKkeK9r9p
 FtGyKAlqeE7Dpv6Xo2LvTPY0BwjWYaao4ydd78DQiJsEafcbG+4pi5pxVcFwjrDUmA4T4B
 EVIYGp5Vt68qmKUbXupmVdss2frhTQwu52Becc+agtFWApgYqjhlX0EVJTZ3VzLn+a8MES
 dgJCQMGyWiILwHz9xdxfJnJsW0jTGSqKtKP8WVHM/VqwQXlmJE1I+wNV7CxTw+GcNF7XK1
 xnRIr+HKgxjdmPkmwpWRN/wnEF2QiW8TWNs3ty5UlhhLY+c6bKeqA3qk0a9Smg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1771952344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Iy7ZEO55Jhhl31ZvbYVjantUPH52WNb/3cgiUFVx5I=;
 b=J7lyvhNvXOl1NGoA1Ee/0QYdZ0Coz4zSeS0uPmrfAKFwb+apDoDo8nxc/z1RpKhqRODlf2
 +qM+3vQ7i/Dp9+Dg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [i915-rt v6 00/24] drm/i915/display: All patches to make
 PREEMPT_RT work on i915 + xe.
Message-ID: <20260224165903.2mn24oQy@linutronix.de>
References: <20260220083657.28815-26-dev@lankhorst.se>
 <20260224162703.Q_taYjEC@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260224162703.Q_taYjEC@linutronix.de>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Queue-Id: D541118A333
X-Rspamd-Action: no action

On 2026-02-24 17:27:03 [+0100], To Maarten Lankhorst wrote:
>=20
> There is nothing else, that popped up. So far no objections from my side
> ;) Thank you.

different HW.

|  i915 0000:00:02.0: [drm] *ERROR* [CRTC:170:pipe A] flip_done timed out
|  rcu: INFO: rcu_preempt self-detected stall on CPU
|  rcu: 	7-....: (1 GPs behind) idle=3Dbc04/1/0x4000000000000000 softirq=3D=
0/0 fqs=3D3084 rcuc=3D6502 jiffies(starved)
|  rcu: 	(t=3D6500 jiffies g=3D46813 q=3D13322 ncpus=3D8)
|  CPU: 7 UID: 0 PID: 12616 Comm: irq/182-i915 Tainted: G     U      E     =
  7.0.0-rc1-lockdep+ #2 PREEMPT_{RT,(lazy)}
|  Tainted: [U]=3DUSER, [E]=3DUNSIGNED_MODULE
|  Hardware name: LENOVO 20TD00GLGE/20TD00GLGE, BIOS R1EET64W(1.64 ) 03/18/=
2025
|  RIP: 0010:intel_context_remove_breadcrumbs+0x14a/0x1a0 [i915]
|  Code: 00 00 48 8b 50 70 b8 ff ff ff ff f0 41 0f c1 06 83 f8 01 74 58 85 =
c0 7f 11 be 03 00 00 00 4c 89 f7 e8 fa 65 db e7 eb 02 f3 90 <41> 8b 84 24 a=
0 00 00 00 85 c0 75 f2 48 83 c4 08 5b 5d 41 5c 41 5d
|  RSP: 0018:ffffd2aa007d7c48 EFLAGS: 00000202
|  RAX: 0000000000000001 RBX: 0000000000000001 RCX: 0000000000000001
|  RDX: ffffffffc282ab20 RSI: ffffffffab33e33f RDI: 00000000ffffffff
|  RBP: ffff8f1247401680 R08: 0000000000000001 R09: 0000000000000000
|  R10: 0000000000000000 R11: 0000000000000000 R12: ffff8f104f3b6200
|  R13: ffff8f12474017e0 R14: ffff8f1247401798 R15: ffff8f119e89e3a8
|  FS:  0000000000000000(0000) GS:ffff8f140318b000(0000) knlGS:000000000000=
0000
|  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
|  CR2: 00007f5409dc6000 CR3: 000000029ea56006 CR4: 0000000000f72ef0
|  PKRU: 55555554
|  Call Trace:
|   <TASK>
|   __execlists_schedule_out+0x1a6/0x340 [i915]
|   execlists_submission_tasklet+0x178/0x1bb0 [i915]
|   tasklet_action_common+0x1e9/0x410
|   handle_softirqs.isra.0+0xbd/0x3f0
|   __local_bh_enable_ip+0xe0/0x170
|   irq_forced_thread_fn+0x41/0x50
|   irq_thread+0x20d/0x360
|   kthread+0x103/0x140
|   ret_from_fork+0x34d/0x480
|   ret_from_fork_asm+0x1a/0x30
|   </TASK>

It seems to be always stuck in intel_context_remove_breadcrumbs.

and top shows
|     42 root      20   0       0      0      0 R 100,0   0,0   3:21.62 kso=
ftirqd/2
|  12616 root     -51   0       0      0      0 R 100,0   0,0   3:34.61 irq=
/182-i915

seems busy. The NMI backtrace reports always
intel_context_remove_breadcrumbs() on CPU, don't see the irq handler.

This one I can reproduce while opening a browser and surfing a bit. Let
me try step by step without lockdep, without RT and maybe just play
v7.0-rc1 to figure out where this is from=E2=80=A6

Sebastian
