Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMGHE80Ug2nihQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:43:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F28E400B
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55ED489CAC;
	Wed,  4 Feb 2026 09:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="JB+P6xSZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B6E89CAC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 09:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=UQM4V2Y5ROvl60K4yUc4W9ldK+JMvoYLneCOpa7wVaI=; b=J
 B+P6xSZkHp/HyTeLDdtRzly7VOc3Fb3bn8R1qxQkqbhE0zCV84G1b2Qiy0wamD9R
 mUtRqXAj+x/N7fvgzKVHQN+0rhGvXcKTFu82fvESFsFRZp0ZfBKlfGg6NFos7HQB
 2qEffEQQPmGO+eckHOwnlD56rNDp8rlP/+sNgoML68=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-139 (Coremail) ; Wed, 4 Feb 2026 17:42:41 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 4 Feb 2026 17:42:41 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Chen Ni" <nichen@iscas.ac.cn>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, andy.yan@rock-chips.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, luca.ceresoli@bootlin.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, rgallaispou@gmail.com,
 simona@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH v2] drm/bridge: synopsys: dw-dp: Check return value of
 devm_drm_bridge_add() in dw_dp_bind()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260204092148.2309681-1-nichen@iscas.ac.cn>
References: <3384b794.65bd.19c27b7d739.Coremail.andyshrk@163.com>
 <20260204092148.2309681-1-nichen@iscas.ac.cn>
X-CM-CTRLMSGS: CTRk7nBsdXM9MTc3MDE5ODE2MTE0NV8wMzYwNWMzY2Y5OTMzODRiMjM1NGQ4N
 mRhNjgxMzA5Ng==
X-NTES-SC: AL_Qu2cAv2St0kt5yOaZekfmUgWjuw/WsG1v/Ul1YBSP556jBHo4C0yVmFdIkDxzMWlMBiMlDaNbBx+ycVecYByUb01OJ8KWH8dg+JbLyiLhf/Z6A==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <651f6165.7bb8.19c280857b2.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: iygvCgD3v5ORFINpj3llAA--.23694W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxhFkwmmDFJEtnAAA3v
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
X-Spamd-Result: default: False [1.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:nichen@iscas.ac.cn,m:Laurent.pinchart@ideasonboard.com,m:airlied@gmail.com,m:andrzej.hajda@intel.com,m:andy.yan@rock-chips.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:rgallaispou@gmail.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[163.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,gmail.com,intel.com,rock-chips.com,kwiboo.se,bootlin.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,lists.freedesktop.org,vger.kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	HAS_X_PRIO_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,iscas.ac.cn:email]
X-Rspamd-Queue-Id: C0F28E400B
X-Rspamd-Action: no action

CgpIZWxsb++8jApBdCAyMDI2LTAyLTA0IDE3OjIxOjQ4LCAiQ2hlbiBOaSIgPG5pY2hlbkBpc2Nh
cy5hYy5jbj4gd3JvdGU6Cj5SZXR1cm4gdGhlIHZhbHVlIG9mIGRldm1fZHJtX2JyaWRnZV9hZGQo
KSBpbiBvcmRlciB0byBwcm9wYWdhdGUgdGhlCj5lcnJvciBwcm9wZXJseSwgaWYgaXQgZmFpbHMg
ZHVlIHRvIHJlc291cmNlIGFsbG9jYXRpb24gZmFpbHVyZSBvciBicmlkZ2UKPnJlZ2lzdHJhdGlv
biBmYWlsdXJlLgo+Cj5UaGlzIGVuc3VyZXMgdGhhdCB0aGUgYmluZCBmdW5jdGlvbiBmYWlscyBz
YWZlbHkgcmF0aGVyIHRoYW4gcHJvY2VlZGluZwo+d2l0aCBhIHBvdGVudGlhbGx5IGluY29tcGxl
dGUgYnJpZGdlIHNldHVwLgo+Cj5GaXhlczogYjcyNjk3MDQ4NmQ4ICgiZHJtL2JyaWRnZTogc3lu
b3BzeXM6IGR3LWRwOiBhZGQgYnJpZGdlIGJlZm9yZSBhdHRhY2hpbmciKQo+U2lnbmVkLW9mZi1i
eTogQ2hlbiBOaSA8bmljaGVuQGlzY2FzLmFjLmNuPgoKCiAgIFJldmlld2VkLWJ5OiBBbmR5IFlh
biA8YW5keXNocmtAMTYzLmNvbT4KCj4tLS0KPkNoYW5nZXMgaW4gdjI6Cj4tIFVzZSBFUlJfUFRS
KCkgaW5zdGVhZCBvZiBkZXZfZXJyX3B0cl9wcm9iZSgpLgo+LS0tCj4gZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1kcC5jIHwgNiArKysrKy0KPiAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWRwLmMKPmluZGV4IDQzMjM0MjQ1MjQ4NC4uMjlmY2JhN2E0N2QzIDEwMDY0NAo+LS0t
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1kcC5jCj4rKysgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMKPkBAIC0yMDQ5LDcgKzIwNDksMTEgQEAg
c3RydWN0IGR3X2RwICpkd19kcF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyLAo+IAlicmlkZ2UtPnR5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfRGlz
cGxheVBvcnQ7Cj4gCWJyaWRnZS0+eWNiY3JfNDIwX2FsbG93ZWQgPSB0cnVlOwo+IAo+LQlkZXZt
X2RybV9icmlkZ2VfYWRkKGRldiwgYnJpZGdlKTsKPisJcmV0ID0gZGV2bV9kcm1fYnJpZGdlX2Fk
ZChkZXYsIGJyaWRnZSk7Cj4rCWlmIChyZXQpIHsKPisJCWRldl9lcnJfcHJvYmUoZGV2LCByZXQs
ICJmYWlsZWQgdG8gYWRkIGJyaWRnZVxuIik7Cj4rCQlyZXR1cm4gRVJSX1BUUihyZXQpOwo+Kwl9
Cj4gCj4gCWRwLT5hdXguZGV2ID0gZGV2Owo+IAlkcC0+YXV4LmRybV9kZXYgPSBlbmNvZGVyLT5k
ZXY7Cj4tLSAKPjIuMjUuMQo=
