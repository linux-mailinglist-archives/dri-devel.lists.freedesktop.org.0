Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA9EDHzKhGk45QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 17:51:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F08DF57E9
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 17:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B005410E92C;
	Thu,  5 Feb 2026 16:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.b="kMNmtIVa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1530 seconds by postgrey-1.36 at gabe;
 Thu, 05 Feb 2026 09:12:27 UTC
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net
 (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1916B10E817
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stu.xidian.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Disposition-Notification-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID; bh=O/Z+1kiLfQ6mcEjTnYTJdsA
 CyWsc8AEm7apD3x8r5Zc=; b=kMNmtIValaH/0zpQjgPaR3toXN8AD+8GekT9VUZ
 zHsKoCvdM4r4chCixuuaIFay8+llmcOGeprKcWITjZ9d8n6oaaKzCKsq1DrXZL/8
 wQafG9EHxMiLNhKEk10kw6DMDMEi+AgYp29c6uNdgLdaK5Pxlaa5yqPPHRpU7N2u
 As38=
Received: from 25181214217$stu.xidian.edu.cn ( [115.53.180.70] ) by
 ajax-webmail-hzbj-edu-front-2.icoremail.net (Coremail) ; Thu, 5 Feb 2026
 17:12:16 +0800 (GMT+08:00)
X-Originating-IP: [115.53.180.70]
Date: Thu, 5 Feb 2026 17:12:16 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?546L5piO54Wc?= <25181214217@stu.xidian.edu.cn>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [BUG] drm/vkms: RCU stall with CPUs spinning in
 native_queued_spin_lock_slowpath during vblank + drm_ioctl under
 PREEMPT(full) (syzkaller-style fuzzing)
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.3-cmXT6 build
 20250410(2f5ccd7f) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-8dfce572-2f24-404d-b59d-0dd2e304114c-icoremail.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <129b1ef4.1458.19c2d12db12.Coremail.25181214217@stu.xidian.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: BLQMCkDmzb3wXoRpmXsYAA--.2450W
X-CM-SenderInfo: qsvrmiqsrujiux6v33wo0lvxldqovvfxof0/1tbiAQUPEWmDgxBQ+
	gAGsP
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW3Jw
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
X-Rspamd-Queue-Id: 9F08DF57E9
X-Rspamd-Action: no action

VG86IDxmaWxsLWZyb20tcGVybCBzY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIC0tYnVnIC1mIC4u
LiBvdXRwdXQ+CkNjOiBbZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZ10obWFpbHRvOmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcpLCBbbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZ10obWFpbHRvOmxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcpCgpIZWxsbyBEUk0vdmtt
cyBtYWludGFpbmVycywKCldlIG9ic2VydmVkIHJlcGVhdGVkIFJDVSBzdGFsbHMgZHVyaW5nIHN5
emthbGxlci1zdHlsZSBmdXp6IHRlc3Rpbmcgb24gYW4gdXBzdHJlYW0gTGludXgga2VybmVsLiBX
aXRoIFBSRUVNUFQoZnVsbCkgZW5hYmxlZCwgdGhlIGtlcm5lbCByZXBvcnRzIHRoYXQgdGhlIHJj
dV9wcmVlbXB0IGdyYWNlLXBlcmlvZCBrdGhyZWFkIGlzIHN0YXJ2ZWQgZm9yID4xMCBzZWNvbmRz
IHdoaWxlIG11bHRpcGxlIENQVXMgc3BpbiBpbiBuYXRpdmVfcXVldWVkX3NwaW5fbG9ja19zbG93
cGF0aCgpIGluIERSTS1yZWxhdGVkIHBhdGhzICh2YmxhbmsgaGFuZGxpbmcsIGRybV9pb2N0bCwg
YW5kIERSTSBmaWxlIHRlYXJkb3duKS4gVGhpcyBhcHBlYXJzIHRvIGJlIGxvY2sgY29udGVudGlv
bi9saXZlbG9jayB1bmRlciBhZHZlcnNhcmlhbCB3b3JrbG9hZHMgdGhhdCBwcmV2ZW50cyBSQ1Ug
R1AgcHJvZ3Jlc3MuCgpFbnZpcm9ubWVudDoKCiogS2VybmVsOiA2LjE4LjAgKGxvY2FsbHkgYnVp
bHQgZnJvbSB1cHN0cmVhbSkKKiBDb25maWc6IFBSRUVNUFQoZnVsbCkKKiBBcmNoOiB4ODZfNjQK
KiBIYXJkd2FyZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCkKKiBXb3JrbG9hZDog
c3l6LWV4ZWN1dG9yIChzeXprYWxsZXItc3R5bGUgZnV6emluZykKCk9ic2VydmVkIHN5bXB0b206
CgoqICJJTkZPOiByY3VfcHJlZW1wdCBkZXRlY3RlZCBzdGFsbHMgb24gQ1BVcy90YXNrcyIKKiAi
cmN1X3ByZWVtcHQga3RocmVhZCB0aW1lciB3YWtldXAgZGlkbid0IGhhcHBlbiBmb3IgfjEwayBq
aWZmaWVzIgoqICJyY3VfcHJlZW1wdCBrdGhyZWFkIHN0YXJ2ZWQgZm9yIG92ZXIgfjEwayBqaWZm
aWVzIgoKVHJpZ2dlcmluZyBjb250ZXh0IChyZXByZXNlbnRhdGl2ZSk6ClRhc2sgY29udGV4dCAo
aW9jdGwgcGF0aCk6CmRybV9pb2N0bApkcm1faW9jdGxfa2VybmVsCmRybV9tb2RlX2NyZWF0ZWJs
b2JfaW9jdGwKZHJtX3Byb3BlcnR5X2NyZWF0ZV9ibG9iCl9fa3ZtYWxsb2Nfbm9kZV9ub3Byb2Yg
LyBfX3ZtYWxsb2Nfbm9kZV9yYW5nZV9ub3Byb2YKSVJRIGNvbnRleHQgKHZrbXMgdmJsYW5rIHNp
bXVsYXRpb24pOgpuYXRpdmVfcXVldWVkX3NwaW5fbG9ja19zbG93cGF0aApkcm1faGFuZGxlX3Zi
bGFuawp2a21zX3ZibGFua19zaW11bGF0ZQpocnRpbWVyX2ludGVycnVwdApzeXN2ZWNfYXBpY190
aW1lcl9pbnRlcnJ1cHQKVGFzayBjb250ZXh0IChmaWxlIHRlYXJkb3duIHBhdGggb24gc29tZSBy
dW5zKToKbmF0aXZlX3F1ZXVlZF9zcGluX2xvY2tfc2xvd3BhdGgKZHJtX2ZpbGVfZnJlZQpkcm1f
Y2xvc2VfaGVscGVyCmRybV9yZWxlYXNlCl9fZnB1dAp0YXNrX3dvcmtfcnVuClJDVSBHUCBrdGhy
ZWFkOgpyY3VfZ3BfZnFzX2xvb3AKcmN1X2dwX2t0aHJlYWQKClJlcHJvZHVjZXI6Ck5vIHJlbGlh
YmxlIHN0YW5kYWxvbmUgcmVwcm9kdWNlciB5ZXQ7IHRoZSBpc3N1ZSB3YXMgb2JzZXJ2ZWQgbXVs
dGlwbGUgdGltZXMgdW5kZXIgZnV6emluZyB3b3JrbG9hZHMuIFdlIGNhbiBwcm92aWRlIGZ1bGwg
ZG1lc2cgbG9ncyAoaW5jbHVkaW5nIE5NSSBiYWNrdHJhY2VzKSwga2VybmVsIGNvbmZpZywgYW5k
IHRoZSBmdXp6aW5nIHByb2dyYW1zL2V4ZWN1dG9yIGxvZ3MgdXBvbiByZXF1ZXN0LgoKRXhwZWN0
ZWQgYmVoYXZpb3I6CkRSTSBpb2N0bHMsIHZibGFuayBoYW5kbGluZywgYW5kIGZpbGUgdGVhcmRv
d24gc2hvdWxkIG5vdCBsZWFkIHRvIHByb2xvbmdlZCBSQ1Ugc3RhbGxzIGV2ZW4gdW5kZXIgYWR2
ZXJzYXJpYWwgdXNlcnNwYWNlIHdvcmtsb2FkczsgdGhlIHJjdV9wcmVlbXB0IEdQIGt0aHJlYWQg
c2hvdWxkIGJlIGFibGUgdG8gbWFrZSBwcm9ncmVzcy4KCkFjdHVhbCBiZWhhdmlvcjoKUkNVIHJl
cG9ydHMgcHJvbG9uZ2VkIHN0YWxscywgQ1BVcyBzcGluIGluIG5hdGl2ZV9xdWV1ZWRfc3Bpbl9s
b2NrX3Nsb3dwYXRoKCksIGFuZCB0aGUgcmN1X3ByZWVtcHQgZ3JhY2UgcGVyaW9kIGRvZXMgbm90
IGNvbXBsZXRlIGZvciA+MTAgc2Vjb25kcy4KCgpUaGFua3MsCk1pbmd5dSBXYW5nCg==
