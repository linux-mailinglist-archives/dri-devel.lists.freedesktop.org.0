Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7292C0EEE
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 02:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626ED6E2DE;
	Sat, 28 Sep 2019 00:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC39B6E2DE
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2019 00:07:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Sat, 28 Sep 2019 00:07:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: andrey.grodzovsky@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204181-2300-vodN9gVPWR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204181-2300@https.bugzilla.kernel.org/>
References: <bug-204181-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: mail.kernel.org; dkim=permerror (bad
 message/signature format)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxODEKCi0tLSBD
b21tZW50ICM1NyBmcm9tIEFuZHJleSBHcm9kem92c2t5IChhbmRyZXkuZ3JvZHpvdnNreUBhbWQu
Y29tKSAtLS0KU2VyZ2V5LCBpbnN0ZWFkIG9mIHRocm93aW5nIHRhbnRydW1zIHdoeSBjYW4ndCB5
b3UganVzdCBkbyB3aGF0IHlvdSBhcmUgYXNrZWQgPwpZb3UgcHJlc2VudCBhbiBleHRyZW1lbHkg
Y29udm9sdXRlZCBzZXQgb2YgZHJpdmVyIGNvbmZpZyBwYXJhbXMgYW5kIGRlbWFuZCBmcm9tCnVz
IHJlc29sdmluZyB0aGUgYnVnIHdpdGggdGhvc2UgcGFyYW1ldGVycyBpbiBwbGFjZS4gVGhpcyBp
bnRyb2R1Y2VzIHVubmVlZGVkCmNvbXBsaWNhdGlvbiBvZiB0aGUgZmFpbHVyZSBzY2VuYXJpbyB3
aGljaCBpbiB0dXJuIGludHJvZHVjZXMgYSBsb3Qgb2YKdW5rbm93bnMuIEFsZXggYXNrcyB5b3Ug
dG8gc2ltcGxpZnkgdGhlIHNldHRpbmdzIHNvIGxlc3MgdW5rbm93cyBhcmUgaW4gdGhlCnN5c3Rl
bSBzbyBpdCdzIGVhc2llciBmb3IgdXMgdG8gdHJ5IGFuZCBmaWd1cmUgb3V0IHdoYXQgZ29lcyB3
cm9uZyB3aGlsZSB3ZQppbnNwZWN0IHRoZSBjb2RlLiAKU28gcGxlYXNlLCBicmluZyB0aGUgcGFy
YW1ldGVycyBiYWNrIHRvIGRlZmF1bHQgYXMgdGhpcyBpcyB0aGUgbW9zdCB3ZWxsIHRlc3RlZApj
b25maWd1cmF0aW9uIGFuZCBnaXZlcyBhIGJhc2VsaW5lIGFuZCBhbHNvIHBsZWFzZSBwcm92aWRl
IGFkZHIybGluZSBmb3IKMDAxMDphbWRncHVfZG1fYXRvbWljX2NvbW1pdF90YWlsKzB4MmVlIHNv
IHdlIGNhbiBnZXQgYSBiZXR0ZXIgaWRlYSB3aGVyZSBpbgpjb2RlIHRoZSBOVUxMIHB0ciBoYXBw
ZW5lZC4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3
YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
