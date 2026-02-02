Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLfCIdHggGleCAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 18:37:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A11CFAC2
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 18:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1616810E537;
	Mon,  2 Feb 2026 17:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.b="nZtT4SNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net
 [129.150.39.64])
 by gabe.freedesktop.org (Postfix) with ESMTP id 12F1C10E2AA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 13:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stu.xidian.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Disposition-Notification-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID; bh=YcLf+yWC9UvG7zg7z37PxxC
 Det93gO37mpamgYAR9uE=; b=nZtT4SNhkmjZMRRCzQClIa16+3RZLWtiaZfX/c0
 lVYxPPay9fzkoTGkV4IcgzoiW/VETvDULBAXGtIezfdRQnYqBr1TysF6qDiuB8JA
 Kim9m4EBtPtslOftTPg/Gna9nU0mHTQmvvgUdNUZKJBhmMcby/HAE3HV6ZytVVSw
 scws=
Received: from 25181214217$stu.xidian.edu.cn ( [115.53.140.163] ) by
 ajax-webmail-hzbj-edu-front-4.icoremail.net (Coremail) ; Mon, 2 Feb 2026
 21:31:26 +0800 (GMT+08:00)
X-Originating-IP: [115.53.140.163]
Date: Mon, 2 Feb 2026 21:31:26 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?546L5piO54Wc?= <25181214217@stu.xidian.edu.cn>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [BUG] drm/gem: WARN in drm_gem_object_handle_put_unlocked on
 close/exit path (syzkaller, QEMU custom device)
X-Priority: 1
X-Mailer: Coremail Webmail Server Version 2024.3-cmXT6 build
 20250410(2f5ccd7f) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-8dfce572-2f24-404d-b59d-0dd2e304114c-icoremail.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3922f838.c0f.19c1e8d0e5d.Coremail.25181214217@stu.xidian.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: BrQMCkAmzrkvp4Bp7qALAA--.1342W
X-CM-SenderInfo: qsvrmiqsrujiux6v33wo0lvxldqovvfxof0/1tbiAgUMEWl-jxR1+
	QAAsb
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-Mailman-Approved-At: Mon, 02 Feb 2026 17:37:09 +0000
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
X-Spamd-Result: default: False [2.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[xidian.edu.cn : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[25181214217@stu.xidian.edu.cn,dri-devel-bounces@lists.freedesktop.org];
	R_DKIM_PERMFAIL(0.00)[stu.xidian.edu.cn:s=dkim];
	DKIM_TRACE(0.00)[stu.xidian.edu.cn:~];
	NEURAL_SPAM(0.00)[0.519];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	HAS_X_PRIO_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[25181214217@stu.xidian.edu.cn,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 04A11CFAC2
X-Rspamd-Action: no action

RGVhciBEUk0gbWFpbnRhaW5lcnMsCldoZW4gZnV6emluZyB0aGUgdXBzdHJlYW0gTGludXgga2Vy
bmVsIHdpdGggb3VyIGN1c3RvbWl6ZWQgU3l6a2FsbGVyLCB3ZSBoaXQgdGhlIGZvbGxvd2luZyB3
YXJuaW5nIGluIGRybS9nZW0uCkhFQUQgY29tbWl0OiA3ZDBhNjZlNGJiOTA4MWQ3NWM4MmVjNDk1
N2M1MDAzNGNiMGVhNDQ5CkdpdCB0cmVlOiB1cHN0cmVhbQpLZXJuZWw6IDYuMTguMCAjMSBQUkVF
TVBUKGZ1bGwpCkhhcmR3YXJlOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2
KSArIGN1c3RvbS1tb2RlbGVkIFFFTVUgZGV2aWNlCmN1c3RvbS1tb2RlbGVkIFFFTVUgZGV2aWNl
Omh0dHBzOi8vZ2l0aHViLmNvbS9XbWluZ3l1L0NyYXNoZXMvYmxvYi9tYWluL2IwMmI3MTdkMGFm
MDBkNWFjOTY0ODZmOGNmNzcwNjkyMzZjZmQ0ZDEvYm9jaHNfZHJtX3BjaS5jClN5emJvdCBrZXJu
ZWwgY29uZmlnOiBodHRwczovL2dpdGh1Yi5jb20vV21pbmd5dS9DcmFzaGVzL2Jsb2IvbWFpbi82
LjE4X3N5emJvdC5jb25maWcgCk91dHB1dCAvIGZ1bGwgcmVwb3J0OiBodHRwczovL2dpdGh1Yi5j
b20vV21pbmd5dS9DcmFzaGVzL2Jsb2IvbWFpbi9iMDJiNzE3ZDBhZjAwZDVhYzk2NDg2ZjhjZjc3
MDY5MjM2Y2ZkNGQxL3JlcG9ydCAKV2UgaGF2ZSB0d28gQyByZXByb2R1Y2VyczogaHR0cHM6Ly9n
aXRodWIuY29tL1dtaW5neXUvQ3Jhc2hlcy9ibG9iL21haW4vYjAyYjcxN2QwYWYwMGQ1YWM5NjQ4
NmY4Y2Y3NzA2OTIzNmNmZDRkMS9yZXBybzEuYyAmIGh0dHBzOi8vZ2l0aHViLmNvbS9XbWluZ3l1
L0NyYXNoZXMvYmxvYi9tYWluL2IwMmI3MTdkMGFmMDBkNWFjOTY0ODZmOGNmNzcwNjkyMzZjZmQ0
ZDEvcmVwcm8yLmMgClN5eiByZXByb2R1Y2VyOmh0dHBzOi8vZ2l0aHViLmNvbS9XbWluZ3l1L0Ny
YXNoZXMvYmxvYi9tYWluL2IwMmI3MTdkMGFmMDBkNWFjOTY0ODZmOGNmNzcwNjkyMzZjZmQ0ZDEv
cmVwcm8uc3l6Cj09IFN1bW1hcnkgPT0KVGhlIHdhcm5pbmcgaXMgdHJpZ2dlcmVkIGluOgpkcm1f
Z2VtX29iamVjdF9oYW5kbGVfcHV0X3VubG9ja2VkIHdpdGhpbiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbS5jIHdoaWNoIHdhcyBpZGVudGlmaWVkIGR1cmluZyBmdXp6aW5nIG9uIGEgTGludXggNi4x
OCBrZXJuZWwuIFRoaXMgd2FybmluZyBpbmRpY2F0ZXMgYSByZWZlcmVuY2UgY291bnRpbmcgaW5j
b25zaXN0ZW5jeSB3aGVuIHJlbGVhc2luZyBhIEdFTSBvYmplY3QgaGFuZGxlIGR1cmluZyB0aGUg
cHJvY2VzcyBleGl0IHBhdGguVGhlIGlzc3VlIGNvbnNpc3RlbnRseSBvY2N1cnMgZHVyaW5nIHRo
ZSByZXNvdXJjZSBjbGVhbnVwIHNlcXVlbmNlIHdoZXJlIGRybV9yZWxlYXNlIGNhbGxzIGRybV9m
aWxlX2ZyZWUgYW5kIHN1YnNlcXVlbnRseSBkcm1fZ2VtX3JlbGVhc2UsIHdoaWNoIHRoZW4gaXRl
cmF0ZXMgdGhyb3VnaCBHRU0gaGFuZGxlcyB2aWEgaWRyX2Zvcl9lYWNoLiBXZSBub3RpY2VkIHRo
YXQgc3l6Ym90IGhhcyBwcmV2aW91c2x5IHJlcG9ydGVkIGEgc2ltaWxhciB3YXJuaW5nIGluIGRy
bV9nZW1fb2JqZWN0X2hhbmRsZV9wdXRfdW5sb2NrZWQgdW5kZXIgZXh0aWQgZWYzMjU2YTM2MGMw
MjIwN2E0Y2IsIGJ1dCBvdXIgZmluZGluZyBpcyBkaXN0aW5jdCBiZWNhdXNlIHRoZSBzeXpib3Qg
cmVwb3J0IGlzIHRyaWdnZXJlZCBkdXJpbmcgdGhlIGNyZWF0aW9uIHBhdGggdmlhIGRybV9tb2Rl
X2NyZWF0ZV9kdW1iX2lvY3RsIHdoZXJlYXMgb3VyIHRyYWNlIHByb3ZlcyB0aGUgaXNzdWUgcGVy
c2lzdHMgaW4gdGhlIGNsZWFudXAgcGF0aCBldmVuIG9uIHRoZSBuZXdlciA2LjE4LjAgdXBzdHJl
YW0gdHJlZS4gV2UgaGF2ZSBzZWFyY2hlZCBmb3IgZXhpc3RpbmcgcGF0Y2hlcyBidXQgZm91bmQg
bm9uZSB0aGF0IGFkZHJlc3MgdGhpcyBzcGVjaWZpYyByZWxlYXNlLXNpZGUgaW5jb25zaXN0ZW5j
eS4gVGhpcyBidWcgd2FzIHJlcHJvZHVjZWQgaW4gYSBzcGVjaWFsaXplZCBlbnZpcm9ubWVudCB1
c2luZyBhIGN1c3RvbS1tb2RlbGVkIGRldmljZSBhZGRlZCB0byBRRU1VIHRvIHNpbXVsYXRlIHNw
ZWNpZmljIGhhcmR3YXJlLWRyaXZlciBpbnRlcmFjdGlvbnMuIFRvIGFzc2lzdCBpbiB5b3VyIGFu
YWx5c2lzLCB3ZSBoYXZlIHByb3ZpZGVkIG91ciBRRU1VIGRldmljZSBtb2RlbGluZyBmaWxlIGlu
IHRoZSBhcHBlbmRpeCBhcyB0aGUgYnVnIG1heSBub3QgYmUgdHJpZ2dlcmFibGUgb24gc3RhbmRh
cmQgZW11bGF0ZWQgaGFyZHdhcmUuCj09IFdhcm5pbmcgdHJhY2UgPT0KV0FSTklORzogQ1BVOiAx
IFBJRDogMTA4ODA2IGF0IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmM6MzAwIGRybV9nZW1fb2Jq
ZWN0X2hhbmRsZV9wdXRfdW5sb2NrZWQrMHgzMGUvMHgzZTAKTW9kdWxlcyBsaW5rZWQgaW46CkNQ
VTogMSBVSUQ6IDAgUElEOiAxMDg4MDYgQ29tbTogc3l6LjEuMzE5NzggTm90IHRhaW50ZWQgNi4x
OC4wICMxIFBSRUVNUFQoZnVsbCkKSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0
MEZYICsgUElJWCwgMTk5NiksIEJJT1MgcmVsLTEuMTYuMy0wLWdhNmVkNmI3MDFmMGEtcHJlYnVp
bHQucWVtdS5vcmcgMDQvMDEvMjAxNApSSVA6IDAwMTA6ZHJtX2dlbV9vYmplY3RfaGFuZGxlX3B1
dF91bmxvY2tlZCsweDMwZS8weDNlMApDb2RlOiBlZCA3NCA2MSBlOCA3NCBhOCA4NCBmYyA0YyA4
OSBlNyBlOCAyYyA5ZSA5NCAwMCA0OCBjNyBjMSA2MCAwOSBlYSA4YiA0YyA4OSBlYSA0OCBjNyBj
NyA0MCAwNSBlYSA4YiA0OCA4OSBjNiBlOCBlMyAzYiA0NCBmYyA5MCA8MGY+IDBiIDkwIDkwIDVi
IDVkIDQxIDVjIDQxIDVkIDQxIDVlIDQxIDVmIGU5IDNmIGE4IDg0IGZjIDRjIDg5IGZmClJTUDog
MDAxODpmZmZmYzkwMDAyZDI3YjgwIEVGTEFHUzogMDAwMTAyODYKUkFYOiAwMDAwMDAwMDAwMDAw
MDAwIFJCWDogZmZmZjg4ODExYWMwZmJlMCBSQ1g6IGZmZmZmZmZmODE3OWVkMDkKUkRYOiBmZmZm
ODg4MTI0YTJiYTAwIFJTSTogZmZmZmZmZmY4MTc5ZWQxNiBSREk6IDAwMDAwMDAwMDAwMDAwMDEK
UkJQOiBmZmZmODg4MTA3ZGYxMDAwIFIwODogMDAwMDAwMDAwMDAwMDAwMSBSMDk6IGZmZmZlZDEw
MjZiYzQ4NDEKUjEwOiAwMDAwMDAwMDAwMDAwMDAxIFIxMTogMDAwMDAwMDAwMDEzOWZjMCBSMTI6
IGZmZmY4ODgxMDAxZWMwYzgKUjEzOiBmZmZmODg4MDFjNzFiZDYwIFIxNDogMDAwMDAwMDAwMDAw
MDAwMCBSMTU6IGZmZmY4ODgxMDdkZjEwMDQKRlM6IDAwMDA1NTU1N2NlZDE1MDAoMDAwMCkgR1M6
ZmZmZjg4ODFhMjYwMTAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCkNTOiAwMDEwIERT
OiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwpDUjI6IDAwMDA3ZmZlNTY0NmZm
MDAgQ1IzOiAwMDAwMDAwMTJmYmEyMDAwIENSNDogMDAwMDAwMDAwMDAwMDZmMApDYWxsIFRyYWNl
Ogpkcm1fZ2VtX29iamVjdF9yZWxlYXNlX2hhbmRsZSsweGM3LzB4MjAwCmlkcl9mb3JfZWFjaCsw
eDExOS8weDIzMCBob21lL3dteS9GdXp6ZXIvdGhpcmRfdG9vbC9saW51eC02LjE4L2xpYi9pZHIu
YzoyMDgKZHJtX2dlbV9yZWxlYXNlKzB4MjkvMHg0MApkcm1fZmlsZV9mcmVlLnBhcnQuMCsweDcy
NC8weGNmMApkcm1fY2xvc2VfaGVscGVyLmlzcmEuMCsweDE4My8weDFmMApkcm1fcmVsZWFzZSsw
eDFhYi8weDM2MApfX2ZwdXQrMHg0MDIvMHhiNTAgaG9tZS93bXkvRnV6emVyL3RoaXJkX3Rvb2wv
bGludXgtNi4xOC9mcy9maWxlX3RhYmxlLmM6NDY4CnRhc2tfd29ya19ydW4rMHgxNmIvMHgyNjAg
aG9tZS93bXkvRnV6emVyL3RoaXJkX3Rvb2wvbGludXgtNi4xOC9rZXJuZWwvdGFza193b3JrLmM6
MjI3CmV4aXRfdG9fdXNlcl9tb2RlX2xvb3ArMHhmOS8weDEzMApkb19zeXNjYWxsXzY0KzB4NDI0
LzB4ZmEwIGhvbWUvd215L0Z1enplci90aGlyZF90b29sL2xpbnV4LTYuMTgvYXJjaC94ODYvZW50
cnkvc3lzY2FsbF8zMi5jOjMwOAplbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg3Ny8w
eDdmClJJUDogMDAzMzoweDdmNWY5ZDNiMDU5ZApDb2RlOiAwMiBiOCBmZiBmZiBmZiBmZiBjMyA2
NiAwZiAxZiA0NCAwMCAwMCBmMyAwZiAxZSBmYSA0OCA4OSBmOCA0OCA4OSBmNyA0OCA4OSBkNiA0
OCA4OSBjYSA0ZCA4OSBjMiA0ZCA4OSBjOCA0YyA4YiA0YyAyNCAwOCAwZiAwNSA8NDg+IDNkIDAx
IGYwIGZmIGZmIDczIDAxIGMzIDQ4IGM3IGMxIGE4IGZmIGZmIGZmIGY3IGQ4IDY0IDg5IDAxIDQ4
ClJTUDogMDAyYjowMDAwN2ZmZWI4NWZjNmQ4IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6IDAw
MDAwMDAwMDAwMDAxYjQKUkFYOiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogMDAwMDdmNWY5ZDYyN2Rh
MCBSQ1g6IDAwMDA3ZjVmOWQzYjA1OWQKUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAw
MDAwMDAwMDAxZSBSREk6IDAwMDAwMDAwMDAwMDAwMDMKUkJQOiAwMDAwN2ZmZWI4NWZjNzc4IFIw
ODogMDAwMDAwMWIzMjkyMDE2YSBSMDk6IDAwMDAwMDAwMDAwMDAwMDAKUjEwOiAwMDAwMDAxYjMy
ZDIwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IGZmZmZmZmZmZmZmZmZmZmYKUjEzOiAw
MDAwN2Y1ZjlkNjI2MDljIFIxNDogMDAwMDdmNWY5ZDYyN2RhMCBSMTU6IDAwMDA3ZmZlYjg1ZmM3
YTAKPT0gUmVxdWVzdGVkIHRhZ3MgPT0KVGhhbmsgeW91IGZvciB5b3VyIHRpbWUuIFBsZWFzZSBs
ZXQgdXMga25vdyBpZiB5b3UgbmVlZCBhZGRpdGlvbmFsIGxvZ3MsIGluc3RydW1lbnRhdGlvbiwg
b3IgaWYgeW91IHdvdWxkIGxpa2UgdGhlIHJlcHJvZHVjZXIgaW4gYW5vdGhlciBmb3JtYXQuCkJl
c3QgcmVnYXJkcywKTWluZ3l1IFdhbmcK
