Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ8EJUPjcWk+MgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 09:43:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E306358D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 09:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DBE10E945;
	Thu, 22 Jan 2026 08:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="EXxVLKR4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A2A10E944;
 Thu, 22 Jan 2026 08:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=fTA80FuqYhWOuMXsi1m55riPj78ukM7kbnYx2MFukug=; b=E
 XxVLKR4JFoLFd4tAIFASWJYld+cUVz83lO658BVm3W046UVIQAKtz3wbssJG1PBx
 qeybRO4NxGiXAaFrm4KPM9F40TBO7+8iYJlYKFm+U1aoqqlUzrvwMSVa4JXZiaEt
 oaIUWJCX8t5g+8SmxBxe5EYEakz+D22bplz0HrqscA=
Received: from andyshrk$163.com ( [110.83.51.2] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Thu, 22 Jan 2026 16:42:32 +0800
 (CST)
X-Originating-IP: [110.83.51.2]
Date: Thu, 22 Jan 2026 16:42:32 +0800 (CST)
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
Subject: Re:[PATCH v7 12/22] drm/rockchip: vop2: Recognise 10/12-bit YUV422
 as YUV formats
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260121-color-format-v7-12-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-12-ef790dae780c@collabora.com>
X-CM-CTRLMSGS: JAf/VHBsdXM9MTc2OTA3MTM1MTA2N185NzcxMDNkMTY1YzkwNTg0MDdmOWY0M
 zliMmZkZDZhZQ==
X-NTES-SC: AL_Qu2dC/ycvksu5CCdZukfmUgWjuw/WsG1v/Ul1YBSP556jCHp1zA+YHtOI0XuzsGkOiqykTu2XSVH2/VTe6BkepsbgpnbONL2klcdDdTogoXoxQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3e736769.79ad.19be4de9900.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aygvCgDHlU_44nFpZLBcAA--.14934W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7hitDGlx4vgiFwAA3g
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F2E306358D
X-Rspamd-Action: no action

CgpIZWxsbyBOaWNvbGFz77yMCkF0IDIwMjYtMDEtMjEgMjI6NDU6MTksICJOaWNvbGFzIEZyYXR0
YXJvbGkiIDxuaWNvbGFzLmZyYXR0YXJvbGlAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj5UaGUgUm9j
a2NoaXAgVk9QMiB2aWRlbyBvdXRwdXQgZHJpdmVyIGhhcyBhICJpc195dXZfb3V0cHV0IiBmdW5j
dGlvbiwKPndoaWNoIHJldHVybnMgdHJ1ZSB3aGVuIGEgZ2l2ZW4gYnVzIGZvcm1hdCBpcyBhIFlV
ViBmb3JtYXQsIGFuZCBmYWxzZQo+b3RoZXJ3aXNlLgo+Cj5UaGlzIHN3aXRjaCBzdGF0ZW1lbnQg
aXMgbGFja2luZyB0aGUgYnVzIGZvcm1hdCB1c2VkIGZvciBZVVY0MjIgMTAtYml0LAo+YXMgd2Vs
bCBhcyB0aGUgYnVzIGZvcm1hdCB1c2VkIGZvciBZVVY0MjIgMTItYml0Lgo+Cj5BZGQgTUVESUFf
QlVTX0ZNVF9ZVVlWMTBfMVgyMCBhbmQgTUVESUFfQlVTX0ZNVF9ZVVlWMTJfMVgyNCB0bwo+aXNf
eXV2X291dHB1dCdzIHN3aXRjaCBjYXNlcyB0byByZXNvbHZlIHRoaXMuCj4KPkZpeGVzOiA2MDRi
ZTg1NTQ3Y2UgKCJkcm0vcm9ja2NoaXA6IEFkZCBWT1AyIGRyaXZlciIpCj5TaWduZWQtb2ZmLWJ5
OiBOaWNvbGFzIEZyYXR0YXJvbGkgPG5pY29sYXMuZnJhdHRhcm9saUBjb2xsYWJvcmEuY29tPgo+
LS0tCj4gZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMgfCAzICsr
Kwo+IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+ZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIGIvZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPmluZGV4IGYyMWVmYmNhNDJlNi4uM2RkN2I3
NTcxNDg3IDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV92b3AyLmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9w
Mi5jCj5AQCAtMzY5LDYgKzM2OSw5IEBAIHN0YXRpYyBib29sIGlzX3l1dl9vdXRwdXQodTMyIGJ1
c19mb3JtYXQpCj4gCXN3aXRjaCAoYnVzX2Zvcm1hdCkgewo+IAljYXNlIE1FRElBX0JVU19GTVRf
WVVWOF8xWDI0Ogo+IAljYXNlIE1FRElBX0JVU19GTVRfWVVWMTBfMVgzMDoKPisJY2FzZSBNRURJ
QV9CVVNfRk1UX1lVWVYxMF8xWDIwOgo+KwljYXNlIE1FRElBX0JVU19GTVRfVVlWWTEwXzFYMjA6
Cgo+KwljYXNlIE1FRElBX0JVU19GTVRfWVVZVjEyXzFYMjQ6CgogICAgICAgICBNRURJQV9CVVNf
Rk1UX1lVWVYxMl8xWDI0IGlzIG5vdCBzdXBwb3J0ZWQgYnkgVk9QLCAgdGhlIG1heCBvdXRwdXQg
ZGVwdGggb2YgVk9QIGlzIDEwCgoKCgo+IAljYXNlIE1FRElBX0JVU19GTVRfVVlZVllZOF8wXzVY
MjQ6Cj4gCWNhc2UgTUVESUFfQlVTX0ZNVF9VWVlWWVkxMF8wXzVYMzA6Cj4gCWNhc2UgTUVESUFf
QlVTX0ZNVF9ZVVlWOF8yWDg6Cj4KPi0tIAo+Mi41Mi4wCj4K
