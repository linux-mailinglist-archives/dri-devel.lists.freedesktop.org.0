Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Sz3xNz0Ag2keggMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 09:15:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621FAE3014
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 09:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C5910E492;
	Wed,  4 Feb 2026 08:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="m1jLudVI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7864B10E492
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 08:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=KV51xe6QyQH37ZZNXbeCn8z/4b7r2Zc56mGk9VwcrAk=; b=m
 1jLudVIEv7KFNWJN+hSBtliSTqCVHns3Mpkd0bBLk3injX3T1ysvPlJalZECVs/j
 BRgEBm8MOQvjBBfHe30UT+RPRCNBvl4Bc3BY20GljAeOywCDGzCTFSQpJ/p4ctJA
 Ymt3grUd11vGdRQwuh9moaNuBpdjZeIgdle5st+GTk=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-139 (Coremail) ; Wed, 4 Feb 2026 16:14:45 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 4 Feb 2026 16:14:45 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Chen Ni" <nichen@iscas.ac.cn>
Cc: andy.yan@rock-chips.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, rgallaispou@gmail.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH] drm/bridge: synopsys: dw-dp: Check return value of
 devm_drm_bridge_add() in dw_dp_bind()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260204075319.1994814-1-nichen@iscas.ac.cn>
References: <20260204075319.1994814-1-nichen@iscas.ac.cn>
X-CM-CTRLMSGS: oE+qe3BsdXM9MTc3MDE5Mjg4NTM3N19mOWJhNzllOTdlYmM4MmE5MmNiZmRlO
 WI1MDIzMjdlNw==
X-NTES-SC: AL_Qu2cAv2SvUAj4yWcbOkfmUgWjuw/WsG1v/Ul1YBSP556jBHo4C0yVmFdIkDxzMWlMBiMlDaNbBx+ycVecYByUb011cbfsTN5nhUmgbrDQYBcNg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3384b794.65bd.19c27b7d739.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: iygvCgD335T1_4JpkFplAA--.23474W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7RU4lmmC--VedgAA3f
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:nichen@iscas.ac.cn,m:andy.yan@rock-chips.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:rgallaispou@gmail.com,m:luca.ceresoli@bootlin.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_SENDER(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[rock-chips.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	HAS_X_PRIO_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 621FAE3014
X-Rspamd-Action: no action

CgoKCgoKCgpIZWxsbywKQXQgMjAyNi0wMi0wNCAxNTo1MzoxOSwgIkNoZW4gTmkiIDxuaWNoZW5A
aXNjYXMuYWMuY24+IHdyb3RlOgo+UmV0dXJuIHRoZSB2YWx1ZSBvZiBkZXZtX2RybV9icmlkZ2Vf
YWRkKCkgaW4gb3JkZXIgdG8gcHJvcGFnYXRlIHRoZQo+ZXJyb3IgcHJvcGVybHksIGlmIGl0IGZh
aWxzIGR1ZSB0byByZXNvdXJjZSBhbGxvY2F0aW9uIGZhaWx1cmUgb3IgYnJpZGdlCj5yZWdpc3Ry
YXRpb24gZmFpbHVyZS4KPgo+VGhpcyBlbnN1cmVzIHRoYXQgdGhlIGJpbmQgZnVuY3Rpb24gZmFp
bHMgc2FmZWx5IHJhdGhlciB0aGFuIHByb2NlZWRpbmcKPndpdGggYSBwb3RlbnRpYWxseSBpbmNv
bXBsZXRlIGJyaWRnZSBzZXR1cC4KPgo+Rml4ZXM6IGI3MjY5NzA0ODZkOCAoImRybS9icmlkZ2U6
IHN5bm9wc3lzOiBkdy1kcDogYWRkIGJyaWRnZSBiZWZvcmUgYXR0YWNoaW5nIikKPlNpZ25lZC1v
ZmYtYnk6IENoZW4gTmkgPG5pY2hlbkBpc2Nhcy5hYy5jbj4KPi0tLQo+IGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYyB8IDQgKysrLQo+IDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctZHAuYwo+aW5kZXggNDMyMzQyNDUyNDg0Li5iMDAwNzgwNWYyODMgMTAwNjQ0Cj4tLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMKPisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYwo+QEAgLTIwNDksNyArMjA0OSw5IEBAIHN0
cnVjdCBkd19kcCAqZHdfZHBfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jb2RlciwKPiAJYnJpZGdlLT50eXBlID0gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3Bs
YXlQb3J0Owo+IAlicmlkZ2UtPnljYmNyXzQyMF9hbGxvd2VkID0gdHJ1ZTsKPiAKPi0JZGV2bV9k
cm1fYnJpZGdlX2FkZChkZXYsIGJyaWRnZSk7Cj4rCXJldCA9IGRldm1fZHJtX2JyaWRnZV9hZGQo
ZGV2LCBicmlkZ2UpOwo+KwlpZiAocmV0KQoKPisJCXJldHVybiBkZXZfZXJyX3B0cl9wcm9iZShk
ZXYsIHJldCwgIkZhaWxlZCB0byBhZGQgYnJpZGdlXG4iKTsKCgogICAgICAgICAgVGhlIHJldHVy
biB2YWx1ZSBvZiB0aGlzIGZ1bmNpb250IGlzIHN0cnVjdCBkd19kcCosIHNvIHlvdSBzaG91bGQg
cmV0dXJuICBFUlJfUFRSKHJldCkgaGVyZS4+IAoKCj4gCWRwLT5hdXguZGV2ID0gZGV2Owo+IAlk
cC0+YXV4LmRybV9kZXYgPSBlbmNvZGVyLT5kZXY7Cj4tLSAKPjIuMjUuMQo=
