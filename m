Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPQ2OibPcmnKpgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 02:30:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF4C6F150
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 02:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A84910EBF5;
	Fri, 23 Jan 2026 01:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="MVaTSDPr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3B310E18B;
 Fri, 23 Jan 2026 01:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=IDmrmzU8GVAsBx6kHbOqrg6J/n9UwtIw2vmbYCZkFc0=; b=M
 VaTSDPrQkR/we+uXwlBU1ShlJicqfekYMpbp1gn3mqVmFmd0ncRUt+BPM7JGQSF+
 T0jctEvBSqdNjlKhka/TerLrndvh5njXHO5gnRzE7Q7B1YIuMKItLGYJkz2mJ9Xx
 LTc0XBbO8H+tYC48szF3tKIzO1nvSy0Hhsf+KX6odc=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Fri, 23 Jan 2026 09:29:02 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 23 Jan 2026 09:29:02 +0800 (CST)
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
Subject: Re:Re: [PATCH v7 10/22] drm/rockchip: vop2: Fix YUV444 output
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <6631107.DvuYhMxLoT@workhorse>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-10-ef790dae780c@collabora.com>
 <7ab32c86.7542.19be4d21f69.Coremail.andyshrk@163.com>
 <6631107.DvuYhMxLoT@workhorse>
X-CM-CTRLMSGS: z+OV+nBsdXM9MTc2OTEzMTczOTgxOF80MzRmZWVkYTljZjY4Yzg1OTEzZTE4Y
 WQ1MmEzMjA4OQ==
X-NTES-SC: AL_Qu2dC/2Yvk8v5COQZekfmUgWjuw/WsG1v/Ul1YBSP556jCHp1zA+YHtOI0XuzsGkOiqykTu2XSVH2/VTe6Bkepsb0K/+WIoMtVQodWYZZdLbNQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4c9ce287.fbb.19be87814b8.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aygvCgCHr1LeznJpeANdAA--.16157W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxR7hQGlyzt4OBgAA35
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	HAS_XOIP(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,collabora.com:email]
X-Rspamd-Queue-Id: 9CF4C6F150
X-Rspamd-Action: no action

CgpIZWxsbyBOaWNvbGFzLAoK5ZyoIDIwMjYtMDEtMjIgMjA6NTk6NDHvvIwiTmljb2xhcyBGcmF0
dGFyb2xpIiA8bmljb2xhcy5mcmF0dGFyb2xpQGNvbGxhYm9yYS5jb20+IOWGmemBk++8mgo+T24g
VGh1cnNkYXksIDIyIEphbnVhcnkgMjAyNiAwOToyODo1NCBDZW50cmFsIEV1cm9wZWFuIFN0YW5k
YXJkIFRpbWUgQW5keSBZYW4gd3JvdGU6Cj4+IAo+PiBIZWxsbyBOaWNvbGFz77yMCj4+IAo+PiBB
dCAyMDI2LTAxLTIxIDIyOjQ1OjE3LCAiTmljb2xhcyBGcmF0dGFyb2xpIiA8bmljb2xhcy5mcmF0
dGFyb2xpQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+PiA+WVVWNDQ0IChha2EgWUNiQ3I0NDQpIG91
dHB1dCBpc24ndCB3b3JraW5nIHF1aXRlIHJpZ2h0IG9uIFJLMzU4OC4gVGhlCj4+ID5yZXN1bHRp
bmcgaW1hZ2Ugb24gdGhlIGRpc3BsYXksIHdoaWxlIGlkZW50aWZ5aW5nIGl0c2VsZiBhcyBZVVY0
NDQsIGhhcwo+PiA+c29tZSBjb21wb25lbnRzIHN3YXBwZWQsIGV2ZW4gYWZ0ZXIgYWRkaW5nIHRo
ZSBuZWNlc3NhcnkgRFJNIGZvcm1hdHMgdG8KPj4gPnRoZSBjb252ZXJzaW9uIGZ1bmN0aW9ucy4K
Pj4gPgo+PiA+SnVkZ2luZyBieSBkb3duc3RyZWFtLCB0aGlzIGlzIGJlY2F1c2UgWVVWNDQ0IGFs
c28gbmVlZHMgYW4gcmIgc3dhcAo+PiA+cGVyZm9ybWVkIGluIHRoZSBBRkJDIGNhc2UuCj4+ID4K
Pj4gPkFkZCB0aGUgRFJNIGZvcm1hdHMgdG8gdGhlIGFwcHJvcHJpYXRlIHN3aXRjaCBzdGF0ZW1l
bnRzLCBhbmQgYWRkIGEKPj4gPmZ1bmN0aW9uIGZvciBjaGVja2luZyB3aGV0aGVyIGFuIHJiIHN3
YXAgbmVlZHMgdG8gYmUgcGVyZm9ybWVkIGluIHRoZQo+PiA+QUZCQyBjYXNlLgo+PiA+Cj4+ID5G
aXhlczogNjA0YmU4NTU0N2NlICgiZHJtL3JvY2tjaGlwOiBBZGQgVk9QMiBkcml2ZXIiKQo+PiA+
U2lnbmVkLW9mZi1ieTogTmljb2xhcyBGcmF0dGFyb2xpIDxuaWNvbGFzLmZyYXR0YXJvbGlAY29s
bGFib3JhLmNvbT4KPj4gPi0tLQo+PiA+IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9kcm1fdm9wMi5jIHwgMTkgKysrKysrKysrKysrKysrKysrKwo+PiA+IDEgZmlsZSBjaGFuZ2Vk
LCAxOSBpbnNlcnRpb25zKCspCj4+ID4KPj4gPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF9kcm1fdm9wMi5jCj4+ID5pbmRleCBlYzNiNGZkZTEwZGIuLjQ2OWM2M2RkOTdkNSAx
MDA2NDQKPj4gPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9w
Mi5jCj4+ID4rKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIu
Ywo+PiA+QEAgLTE3Niw2ICsxNzYsNyBAQCBzdGF0aWMgZW51bSB2b3AyX2RhdGFfZm9ybWF0IHZv
cDJfY29udmVydF9mb3JtYXQodTMyIGZvcm1hdCkKPj4gPiAJY2FzZSBEUk1fRk9STUFUX0FSR0Iy
MTAxMDEwOgo+PiA+IAljYXNlIERSTV9GT1JNQVRfWEJHUjIxMDEwMTA6Cj4+ID4gCWNhc2UgRFJN
X0ZPUk1BVF9BQkdSMjEwMTAxMDoKPj4gPisJY2FzZSBEUk1fRk9STUFUX1ZVWTEwMTAxMDoKPj4g
PiAJCXJldHVybiBWT1AyX0ZNVF9YUkdCMTAxMDEwOwo+PiA+IAljYXNlIERSTV9GT1JNQVRfWFJH
Qjg4ODg6Cj4+ID4gCWNhc2UgRFJNX0ZPUk1BVF9BUkdCODg4ODoKPj4gPkBAIC0xODQsNiArMTg1
LDcgQEAgc3RhdGljIGVudW0gdm9wMl9kYXRhX2Zvcm1hdCB2b3AyX2NvbnZlcnRfZm9ybWF0KHUz
MiBmb3JtYXQpCj4+ID4gCQlyZXR1cm4gVk9QMl9GTVRfQVJHQjg4ODg7Cj4+ID4gCWNhc2UgRFJN
X0ZPUk1BVF9SR0I4ODg6Cj4+ID4gCWNhc2UgRFJNX0ZPUk1BVF9CR1I4ODg6Cj4+ID4rCWNhc2Ug
RFJNX0ZPUk1BVF9WVVk4ODg6Cj4+ID4gCQlyZXR1cm4gVk9QMl9GTVRfUkdCODg4Owo+PiA+IAlj
YXNlIERSTV9GT1JNQVRfUkdCNTY1Ogo+PiA+IAljYXNlIERSTV9GT1JNQVRfQkdSNTY1Ogo+PiA+
QEAgLTIyNSw2ICsyMjcsNyBAQCBzdGF0aWMgZW51bSB2b3AyX2FmYmNfZm9ybWF0IHZvcDJfY29u
dmVydF9hZmJjX2Zvcm1hdCh1MzIgZm9ybWF0KQo+PiA+IAljYXNlIERSTV9GT1JNQVRfQVJHQjIx
MDEwMTA6Cj4+ID4gCWNhc2UgRFJNX0ZPUk1BVF9YQkdSMjEwMTAxMDoKPj4gPiAJY2FzZSBEUk1f
Rk9STUFUX0FCR1IyMTAxMDEwOgo+PiA+KwljYXNlIERSTV9GT1JNQVRfVlVZMTAxMDEwOgo+PiA+
IAkJcmV0dXJuIFZPUDJfQUZCQ19GTVRfQVJHQjIxMDEwMTA7Cj4+ID4gCWNhc2UgRFJNX0ZPUk1B
VF9YUkdCODg4ODoKPj4gPiAJY2FzZSBEUk1fRk9STUFUX0FSR0I4ODg4Ogo+PiA+QEAgLTIzMyw2
ICsyMzYsNyBAQCBzdGF0aWMgZW51bSB2b3AyX2FmYmNfZm9ybWF0IHZvcDJfY29udmVydF9hZmJj
X2Zvcm1hdCh1MzIgZm9ybWF0KQo+PiA+IAkJcmV0dXJuIFZPUDJfQUZCQ19GTVRfQVJHQjg4ODg7
Cj4+ID4gCWNhc2UgRFJNX0ZPUk1BVF9SR0I4ODg6Cj4+ID4gCWNhc2UgRFJNX0ZPUk1BVF9CR1I4
ODg6Cj4+ID4rCWNhc2UgRFJNX0ZPUk1BVF9WVVk4ODg6Cj4+IAo+PiBIb3cgZGlkIHlvdSB0ZXN0
IHRoaXMgZm9ybWF0PyBJdCBzZWVtcyB0b29scyBsaWtlIG1vZGV0ZXN0IGRvbuKAmXQgc3VwcG9y
dCB0ZXN0aW5nIHRoaXMgcGF0dGVybi4KPj4gCj4KPkhpIEFuZHksCj4KPnVzaW5nIHRoZSByZXN0
IG9mIHRoaXMgc2VyaWVzLCB3aGljaCBpbXBsZW1lbnRzIHRoZSAiY29sb3IgZm9ybWF0Igo+RFJN
IHByb3BlcnR5LCBhbmQgdGhlIGNvcnJlc3BvbmRpbmcgd2VzdG9uIE1SIHRoYXQgbWFrZXMgdXNl
IG9mIGl0WzFdLgo+Cj5JIGNyZWF0ZSBhIH4vLmNvbmZpZy93ZXN0b24uaW5pIHdpdGggdGhlIGZv
bGxvd2luZyBjb250ZW50czoKPgo+ICAgIFtvdXRwdXRdCj4gICAgbmFtZT1IRE1JLUEtMQo+ICAg
IGNvbG9yLWZvcm1hdD15dXY0NDQKPgo+VGhpcyB3aWxsIG1ha2UgV2VzdG9uIHRyeSB0byBzZXQg
dGhlIG91dHB1dCBmb3JtYXQgdG8gMTAtYml0IFlVVjQ0NC4gVG8KPmxpbWl0IGl0IHRvIDgtYml0
LCB5b3UgY2FuIGFkZCBgbWF4LWJwYz04YC4gVGhlIG1vbml0b3IncyBFRElEIG5lZWRzIHRvCj5y
ZXBvcnQgWVVWNDQ0IHN1cHBvcnQsIG90aGVyd2lzZSB0aGF0IFdlc3RvbiB2ZXJzaW9uIHdvbid0
IGxldCB5b3Ugc2V0Cj50aGlzIHByb3BlcnR5Lgo+CgoKVGhpcyBsb29rcyBhIGJpdCBzdHJhbmdl
LiBZb3VyIGNvbW1pdCBtZXNzYWdlIGFuZCB0aGUgV2VzdG9uIGNvbmZpZ3VyYXRpb24gaGVyZSBi
b3RoIHRhcmdldCB0aGUgb3V0cHV0IGZvcm1hdCwgCmJ1dCB0aGUgcGF0Y2ggbW9kaWZpZXMgdGhl
IGZ1bmN0aW9ucyB2b3AyX2NvbnZlcnRfZm9ybWF0IGFuZCB2b3AyX2NvbnZlcnRfYWZiY19mb3Jt
YXQsIHdoaWNoIGFyZSByZXNwb25zaWJsZSBmb3IKY29udmVydGluZyB0aGUgZGF0YSBmb3JtYXRz
IG9mIHBsYW5lcy9mcmFtZWJ1ZmZlcnMgKGZiKeKAlHRoZXNlIGhhdmUgbm90aGluZyB0byBkbyB3
aXRoIHRoZSBvdXRwdXQgZm9ybWF0LgoKCj5MaW5rOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvd2F5bGFuZC93ZXN0b24vLS9tZXJnZV9yZXF1ZXN0cy8xODU5IFsxXQo+Cj5LaW5kIHJl
Z2FyZHMsCj5OaWNvbGFzIEZyYXR0YXJvbGkKPgo+PiAKPj4gCj4+ID4gCQlyZXR1cm4gVk9QMl9B
RkJDX0ZNVF9SR0I4ODg7Cj4+ID4gCWNhc2UgRFJNX0ZPUk1BVF9SR0I1NjU6Cj4+ID4gCWNhc2Ug
RFJNX0ZPUk1BVF9CR1I1NjU6Cj4+ID5AQCAtMjcwLDYgKzI3NCwxOSBAQCBzdGF0aWMgYm9vbCB2
b3AyX3dpbl9yYl9zd2FwKHUzMiBmb3JtYXQpCj4+ID4gCX0KPj4gPiB9Cj4+ID4gCj4+ID4rc3Rh
dGljIGJvb2wgdm9wMl9hZmJjX3JiX3N3YXAodTMyIGZvcm1hdCkKPj4gPit7Cj4+ID4rCXN3aXRj
aCAoZm9ybWF0KSB7Cj4+ID4rCWNhc2UgRFJNX0ZPUk1BVF9OVjI0Ogo+PiA+KwljYXNlIERSTV9G
T1JNQVRfTlYzMDoKPj4gPisJY2FzZSBEUk1fRk9STUFUX1ZVWTg4ODoKPj4gPisJY2FzZSBEUk1f
Rk9STUFUX1ZVWTEwMTAxMDoKPj4gPisJCXJldHVybiB0cnVlOwo+PiA+KwlkZWZhdWx0Ogo+PiA+
KwkJcmV0dXJuIGZhbHNlOwo+PiA+Kwl9Cj4+ID4rfQo+PiA+Kwo+PiA+IHN0YXRpYyBib29sIHZv
cDJfYWZiY191dl9zd2FwKHUzMiBmb3JtYXQpCj4+ID4gewo+PiA+IAlzd2l0Y2ggKGZvcm1hdCkg
ewo+PiA+QEAgLTEyOTEsNiArMTMwOCw3IEBAIHN0YXRpYyB2b2lkIHZvcDJfcGxhbmVfYXRvbWlj
X3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPj4gPiAJCSAvKiBJdCdzIGZvciBoZWFk
IHN0cmlkZSwgZWFjaCBoZWFkIHNpemUgaXMgMTYgYnl0ZSAqLwo+PiA+IAkJc3RyaWRlID0gQUxJ
R04oc3RyaWRlLCBibG9ja193KSAvIGJsb2NrX3cgKiAxNjsKPj4gPiAKPj4gPisJCXJiX3N3YXAg
PSB2b3AyX2FmYmNfcmJfc3dhcChmYi0+Zm9ybWF0LT5mb3JtYXQpOwo+PiA+IAkJdXZfc3dhcCA9
IHZvcDJfYWZiY191dl9zd2FwKGZiLT5mb3JtYXQtPmZvcm1hdCk7Cj4+ID4gCQkvKgo+PiA+IAkJ
ICogVGhpcyBpcyBhIHdvcmthcm91bmQgZm9yIGNyYXp5IElDIGRlc2lnbiwgQ2x1c3Rlcgo+PiA+
QEAgLTEzMDgsNiArMTMyNiw3IEBAIHN0YXRpYyB2b2lkIHZvcDJfcGxhbmVfYXRvbWljX3VwZGF0
ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPj4gPiAJCQl2b3AyX3dpbl93cml0ZSh3aW4sIFZP
UDJfV0lOX0FGQkNfRU5BQkxFLCAxKTsKPj4gPiAJCXZvcDJfd2luX3dyaXRlKHdpbiwgVk9QMl9X
SU5fQUZCQ19GT1JNQVQsIGFmYmNfZm9ybWF0KTsKPj4gPiAJCXZvcDJfd2luX3dyaXRlKHdpbiwg
Vk9QMl9XSU5fQUZCQ19VVl9TV0FQLCB1dl9zd2FwKTsKPj4gPisJCXZvcDJfd2luX3dyaXRlKHdp
biwgVk9QMl9XSU5fQUZCQ19SQl9TV0FQLCByYl9zd2FwKTsKPj4gPiAJCS8qCj4+ID4gCQkgKiBP
biByazM1NjYvOCwgdGhpcyBiaXQgaXMgYXV0byBnYXRpbmcgZW5hYmxlLAo+PiA+IAkJICogYnV0
IHRoaXMgZnVuY3Rpb24gaXMgbm90IHdvcmsgd2VsbCBzbyB3ZSBuZWVkCj4+ID4KPj4gCj4KPgo+
Cj4K
