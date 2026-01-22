Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IPVHKjjcWk+MgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 09:45:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B07635F0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 09:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E75010E942;
	Thu, 22 Jan 2026 08:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="kg/vJ0TP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 8017 seconds by postgrey-1.36 at gabe;
 Thu, 22 Jan 2026 08:45:24 UTC
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F6810E942;
 Thu, 22 Jan 2026 08:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=bTQS2Ub48cluoF04AksxVAcZz1dPPLXQ7ZO9ToPloD8=; b=k
 g/vJ0TPJyGvaf2ouh7+ZkgLUAP8nvM10am5Erku9m7bIbDckHfw0bURZa0D/VQb4
 nX7Sf5y4c+Eqiu8X38rRqxwoeOJXcn3ThpWJfObzkfeaAc8S9/n6PdA45lsFq3q3
 L1SiiNyCptSK+e3S0ohSaxovyeMZr1hT3qdJdBa8QY=
Received: from andyshrk$163.com ( [110.83.51.2] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Thu, 22 Jan 2026 16:44:24 +0800
 (CST)
X-Originating-IP: [110.83.51.2]
Date: Thu, 22 Jan 2026 16:44:24 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: "Harry Wentland" <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>, 
 "Rodrigo Siqueira" <siqueira@igalia.com>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Sandy Huang" <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>,
 "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>,
 "Dmitry Baryshkov" <lumag@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Rob Herring" <robh@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re:[PATCH v7 13/22] drm/rockchip: vop2: Set correct output format
 for RK3576 YUV422
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260121-color-format-v7-13-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-13-ef790dae780c@collabora.com>
X-CM-CTRLMSGS: RtNQZnBsdXM9MTc2OTA3MTQ2MzM1NV8yNGY3NzZiM2I2YjU1M2E3ZjVjMWNiM
 GY5NjQzYTBhNw==
X-NTES-SC: AL_Qu2dC/ycvkwt4iOcYukfmUgWjuw/WsG1v/Ul1YBSP556jCHp1zA+YHtOI0XuzsGkOiqykTu2XSVH2/VTe6BkepsbYkh+3JfXd1VE6LuMWmOAAQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <27c44445.7a56.19be4e04fa9.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aygvCgDnDxRo43FpXbFcAA--.14910W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxgjJKGlx42hHoQAA3a
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
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	HAS_X_PRIO_THREE(0.00)[3];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D5B07635F0
X-Rspamd-Action: no action

CgpIZWxsbyBOaWNvbGFzLAoKQXQgMjAyNi0wMS0yMSAyMjo0NToyMCwgIk5pY29sYXMgRnJhdHRh
cm9saSIgPG5pY29sYXMuZnJhdHRhcm9saUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPkZvciBSSzM1
NzYgdG8gYmUgYWJsZSB0byBvdXRwdXQgWVVWNDIyIHNpZ25hbHMsIGl0IGZpcnN0IG5lZWRzIHRv
IGJlCj5hYmxlIHRvIHBpY2sgdGhlIHJpZ2h0IG91dHB1dCBtb2RlIGluIHRoZSBkaXNwbGF5IGNv
bnRyb2xsZXIgdG8gZG8gc28uCj4KPlRoZSBSSzM1NzYgaGFyZHdhcmUgc3BlY2lmaWVzIGRpZmZl
cmVudCBvdXRwdXQgZm9ybWF0cyBkZXBlbmRpbmcgb24gdGhlCj51c2VkIGRpc3BsYXkgcHJvdG9j
b2wuCj4KPkFkanVzdCB0aGUgd3JpdHRlbiByZWdpc3RlciB2YWx1ZSBiYXNlZCBvbiB0aGUgU29D
IGFuZCBjb25uZWN0b3IsIHNvCj5vdGhlciB1c2VycyBvZiB2Y3N0YXRlLT5vdXRwdXRfbW9kZSBk
b24ndCBoYXZlIHRvIGNhcmUgYWJvdXQgdGhpcy4KPgo+U2lnbmVkLW9mZi1ieTogTmljb2xhcyBG
cmF0dGFyb2xpIDxuaWNvbGFzLmZyYXR0YXJvbGlAY29sbGFib3JhLmNvbT4KCgogICAgUmV2aWV3
ZWQtYnk6IEFuZHkgWWFuIDxhbmR5c2hya0AxNjMuY29tPgo+LS0tCj4gZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMgfCAxNiArKysrKysrKysrKysrKysrCj4gMSBm
aWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPmluZGV4IDNkZDdiNzU3MTQ4Ny4uZDkzYzY3NzkyODZl
IDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3Ay
LmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj5A
QCAtMTcwNiw2ICsxNzA2LDIyIEBAIHN0YXRpYyB2b2lkIHZvcDJfY3J0Y19hdG9taWNfZW5hYmxl
KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAJaWYgKHZjc3RhdGUtPm91dHB1dF9tb2RlID09IFJP
Q0tDSElQX09VVF9NT0RFX0FBQUEgJiYKPiAJICAgICEodnBfZGF0YS0+ZmVhdHVyZSAmIFZPUDJf
VlBfRkVBVFVSRV9PVVRQVVRfMTBCSVQpKQo+IAkJb3V0X21vZGUgPSBST0NLQ0hJUF9PVVRfTU9E
RV9QODg4Owo+KwllbHNlIGlmICh2Y3N0YXRlLT5vdXRwdXRfbW9kZSA9PSBST0NLQ0hJUF9PVVRf
TU9ERV9ZVVY0MjIgJiYKPisJCSB2b3AyLT52ZXJzaW9uID09IFZPUF9WRVJTSU9OX1JLMzU3NikK
PisJCXN3aXRjaCAodmNzdGF0ZS0+b3V0cHV0X3R5cGUpIHsKPisJCWNhc2UgRFJNX01PREVfQ09O
TkVDVE9SX0Rpc3BsYXlQb3J0Ogo+KwkJY2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfZURQOgo+KwkJ
CW91dF9tb2RlID0gUk9DS0NISVBfT1VUX01PREVfWVVWNDIyX1JLMzU3Nl9EUDsKPisJCQlicmVh
azsKPisJCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBOgo+KwkJCW91dF9tb2RlID0gUk9D
S0NISVBfT1VUX01PREVfWVVWNDIyX1JLMzU3Nl9IRE1JOwo+KwkJCWJyZWFrOwo+KwkJZGVmYXVs
dDoKPisJCQlkcm1fZXJyKHZvcDItPmRybSwgIlVua25vd24gRFJNX01PREVfQ09OTkVDVE9SICVk
XG4iLAo+KwkJCQl2Y3N0YXRlLT5vdXRwdXRfdHlwZSk7Cj4rCQkJdm9wMl91bmxvY2sodm9wMik7
Cj4rCQkJcmV0dXJuOwo+KwkJfQo+IAllbHNlCj4gCQlvdXRfbW9kZSA9IHZjc3RhdGUtPm91dHB1
dF9tb2RlOwo+IAo+Cj4tLSAKPjIuNTIuMAo+Cg==
