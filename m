Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SM7PD3zKhGk45QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 17:51:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E009F57E8
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 17:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01F310E92E;
	Thu,  5 Feb 2026 16:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.b="uf9eldlh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net
 (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1BDE810E87E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 11:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stu.xidian.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Disposition-Notification-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID; bh=tWEKNdu4vbo7WjdhuWCE6ML
 u93pnfGnX4aaJXn20PaM=; b=uf9eldlh00JHSAOMPK+tgQ3QGxv+iPUzXtjKsmm
 OBrLdx4GpKlSlGNeyFEsINC7TAV6FmCYtqCzEd5eo6Fs+SCkNTu9YABcunp/zpuY
 qvjaCpMshMpWTCQLCtAfWWF4kTYt+cc9YbBgP1HdTLjWZifuBb1XRZe4S1DBwAKD
 D9+c=
Received: from 25181214217$stu.xidian.edu.cn ( [115.53.180.70] ) by
 ajax-webmail-hzbj-edu-front-2.icoremail.net (Coremail) ; Thu, 5 Feb 2026
 19:36:42 +0800 (GMT+08:00)
X-Originating-IP: [115.53.180.70]
Date: Thu, 5 Feb 2026 19:36:42 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?546L5piO54Wc?= <25181214217@stu.xidian.edu.cn>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [BUG] rcu_ rcu_preempt detected stalls (starved for 10498 jiffies)
 in drm_vblank_disable_and_save
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.3-cmXT6 build
 20250410(2f5ccd7f) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-8dfce572-2f24-404d-b59d-0dd2e304114c-icoremail.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <52b02148.14e7.19c2d9716c2.Coremail.25181214217@stu.xidian.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: BLQMCkD23r7KgIRpXtQYAA--.2524W
X-CM-SenderInfo: qsvrmiqsrujiux6v33wo0lvxldqovvfxof0/1tbiAQUPEWmDgxBpO
	gAAsw
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWDJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-Mailman-Approved-At: Thu, 05 Feb 2026 16:50:57 +0000
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
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_X_PRIO_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	R_DKIM_PERMFAIL(0.00)[stu.xidian.edu.cn:s=dkim];
	FORGED_SENDER(0.00)[25181214217@stu.xidian.edu.cn,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[25181214217@stu.xidian.edu.cn,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[stu.xidian.edu.cn:~];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7E009F57E8
X-Rspamd-Action: no action

RGVhciBNYWludGFpbmVycywKCldoZW4gdXNpbmcgb3VyIGN1c3RvbWl6ZWQgU3l6a2FsbGVyIHRv
IGZ1enogdGhlIGxhdGVzdCBMaW51eCBrZXJuZWwsIHRoZSBmb2xsb3dpbmcgY3Jhc2ggd2FzIHRy
aWdnZXJlZC4KCkhFQUQgY29tbWl0OiA3ZDBhNjZlNGJiOTA4MWQ3NWM4MmVjNDk1N2M1MDAzNGNi
MGVhNDQ5IApnaXQgdHJlZTogdXBzdHJlYW0gCk91dHB1dDogaHR0cHM6Ly9naXRodWIuY29tL21h
bnVhbDAvY3Jhc2gvYmxvYi9tYWluL3JlcG9ydDIudHh0IApLZXJuZWwgY29uZmlnOiBodHRwczov
L2dpdGh1Yi5jb20vbWFudWFsMC9jcmFzaC9ibG9iL21haW4vY29uZmlnLnR4dCAKQyByZXByb2R1
Y2VyOiBodHRwczovL2dpdGh1Yi5jb20vbWFudWFsMC9jcmFzaC9ibG9iL21haW4vcmVwcm8yLmMg
ClN5eiByZXByb2R1Y2VyOiBodHRwczovL2dpdGh1Yi5jb20vbWFudWFsMC9jcmFzaC9ibG9iL21h
aW4vcmVwcm8yLnN5egoKQnJpZWYgSW50cm9kdWN0aW9uOiBUaGUga2VybmVsIHJlcG9ydHMgYW4g
UkNVIENQVSBzdGFsbCAocmN1X3ByZWVtcHQgZGV0ZWN0ZWQgc3RhbGxzKS4gVGhlIHJjdV9wcmVl
bXB0IGt0aHJlYWQgd2FzIHN0YXJ2ZWQgZm9yIDEwLDQ5OCBqaWZmaWVzLCB3aGljaCB1c3VhbGx5
IGxlYWRzIHRvIGFuIGV4cGVjdGVkIE9PTS4KClRoZSBOTUkgYmFja3RyYWNlIHNob3dzIENQVSAz
IGlzIHNwaW5uaW5nIGluIHRoZSBsb2NrZGVwL2xvY2tpbmcgY29kZSB3aGlsZSBhdHRlbXB0aW5n
IHRvIGNhbmNlbCBhbiBocnRpbWVyIGR1cmluZyBhIHRpbWVyIHNvZnRpcnEuIFRoZSBjYWxsIHBh
dGggb3JpZ2luYXRlcyBmcm9tIGRybV92YmxhbmtfZGlzYWJsZV9hbmRfc2F2ZSBhbmQgcmVhY2hl
cyBocnRpbWVyX2NhbmNlbF93YWl0X3J1bm5pbmcuIFRoaXMgc3VnZ2VzdHMgYSBwb3RlbnRpYWwg
ZGVhZGxvY2sgb3IgYW4gZXhjZXNzaXZlbHkgbG9uZyBjcml0aWNhbCBzZWN0aW9uIGluIHRoZSBE
Uk0gdmJsYW5rL3RpbWVyIGhhbmRsaW5nIHBhdGggdGhhdCBwcmV2ZW50cyB0aGUgUkNVIGdyYWNl
LXBlcmlvZCBrdGhyZWFkIGZyb20gYmVpbmcgc2NoZWR1bGVkIG9uIHRoYXQgQ1BVLgoKUmVsZXZh
bnQgTG9nOiAKcmN1OiBJTkZPOiByY3VfcHJlZW1wdCBkZXRlY3RlZCBzdGFsbHMgb24gQ1BVcy90
YXNrczoKcmN1OiAJKGRldGVjdGVkIGJ5IDAsIHQ9MTA1MDIgamlmZmllcywgZz02NDYyNSwgcT0y
MTIgbmNwdXM9NCkKcmN1OiBBbGwgUVNlcyBzZWVuLCBsYXN0IHJjdV9wcmVlbXB0IGt0aHJlYWQg
YWN0aXZpdHkgMTA0OTggKDQyOTUwMDY3NzctNDI5NDk5NjI3OSksIGppZmZpZXNfdGlsbF9uZXh0
X2Zxcz0xLCByb290IC0+cXNtYXNrIDB4MApyY3U6IHJjdV9wcmVlbXB0IGt0aHJlYWQgdGltZXIg
d2FrZXVwIGRpZG4ndCBoYXBwZW4gZm9yIDEwNDk3IGppZmZpZXMhIGc2NDYyNSBmMHgyIFJDVV9H
UF9XQUlUX0ZRUyg1KSAtPnN0YXRlPTB4MjAwCnJjdTogCVBvc3NpYmxlIHRpbWVyIGhhbmRsaW5n
IGlzc3VlIG9uIGNwdT0zIHRpbWVyLXNvZnRpcnE9MjQ2NDEKcmN1OiByY3VfcHJlZW1wdCBrdGhy
ZWFkIHN0YXJ2ZWQgZm9yIDEwNDk4IGppZmZpZXMhIGc2NDYyNSBmMHgyIFJDVV9HUF9XQUlUX0ZR
Uyg1KSAtPnN0YXRlPTB4MjAwIC0+Y3B1PTMKcmN1OiAJVW5sZXNzIHJjdV9wcmVlbXB0IGt0aHJl
YWQgZ2V0cyBzdWZmaWNpZW50IENQVSB0aW1lLCBPT00gaXMgbm93IGV4cGVjdGVkIGJlaGF2aW9y
LgpyY3U6IFJDVSBncmFjZS1wZXJpb2Qga3RocmVhZCBzdGFjayBkdW1wOgp0YXNrOnJjdV9wcmVl
bXB0ICAgICBzdGF0ZTpSIHN0YWNrOjI4OTIwIHBpZDoxNiAgICB0Z2lkOjE2ICAgIHBwaWQ6MiAg
ICAgIHRhc2tfZmxhZ3M6MHgyMDgwNDAgZmxhZ3M6MHgwMDA4MDAwMApDYWxsIFRyYWNlOgogPFRB
U0s+CiBzY2hlZF9pbmZvX2Fycml2ZSBob21lL2xpbnV4LTYuMTgva2VybmVsL3NjaGVkL3N0YXRz
Lmg6MjY3IFtpbmxpbmVdCiBzY2hlZF9pbmZvX3N3aXRjaCBob21lL2xpbnV4LTYuMTgva2VybmVs
L3NjaGVkL3N0YXRzLmg6MzMwIFtpbmxpbmVdCiBwcmVwYXJlX3Rhc2tfc3dpdGNoIGhvbWUvbGlu
dXgtNi4xOC9rZXJuZWwvc2NoZWQvY29yZS5jOjUxMjIgW2lubGluZV0KIGNvbnRleHRfc3dpdGNo
IGhvbWUvaW51eC02LjE4L2tlcm5lbC9zY2hlZC9jb3JlLmM6NTI3MiBbaW5saW5lXQogX19zY2hl
ZHVsZSsweDEwNDQvMHg1YmIwIGhvbWUvbGludXgtNi4xOC9rZXJuZWwvc2NoZWQvY29yZS5jOjY5
MjkKIF9fc2NoZWR1bGVfbG9vcCBob21lL2xpbnV4LTYuMTgva2VybmVsL3NjaGVkL2NvcmUuYzo3
MDExIFtpbmxpbmVdCiBzY2hlZHVsZSsweGU3LzB4M2EwIGhvbWUvbGludXgtNi4xOC9rZXJuZWwv
c2NoZWQvY29yZS5jOjcwMjYKIHNjaGVkdWxlX3RpbWVvdXQrMHgxMTMvMHgyODAgaG9tZS9saW51
eC02LjE4L2tlcm5lbC90aW1lL3NsZWVwX3RpbWVvdXQuYzo5OAogcmN1X2dwX2Zxc19jaGVja193
YWtlIGhvbWUvbGludXgtNi4xOC9rZXJuZWwvcmN1L3RyZWUuYzoyMDA3IFtpbmxpbmVdCiByY3Vf
Z3BfZnFzX2xvb3ArMHgxOGMvMHhhMDAgaG9tZS9saW51eC02LjE4L2tlcm5lbC9yY3UvdHJlZS5j
OjIwODMKIHJjdV9ncF9rdGhyZWFkKzB4MjZmLzB4MzcwIGhvbWUvbGludXgtNi4xOC9rZXJuZWwv
cmN1L3RyZWUuYzoyMjgwCiBrdGhyZWFkKzB4M2QwLzB4NzgwIGhvbWUvbGludXgtNi4xOC9rZXJu
ZWwva3RocmVhZC5jOjQ2MwogcmV0X2Zyb21fZm9yaysweDY3Ni8weDdkMCBob21lL2xpbnV4LTYu
MTgvYXJjaC94ODYva2VybmVsL3Byb2Nlc3MuYzoxOTUKIHJldF9mcm9tX2ZvcmtfYXNtKzB4MWEv
MHgzMCBob21lL2xpbnV4LTYuMTgvYXJjaC94ODYvZW50cnkvZW50cnlfNjQuUzoyNDUKIDwvVEFT
Sz4KClRoYW5rcywgCk1pbmd5dSBXYW5n
