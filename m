Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFcMD4vlhGlf6QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 19:46:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E597F68CB
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 19:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFB010E3B1;
	Thu,  5 Feb 2026 18:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="QWJUCqoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9312A10E3AD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 18:46:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770317175; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YkR+wT+X4Rb4vcb6yiBeFLUcErrR6ceCQQyiaUZkr+9bDVkzPXysW3A2PzfkEF2LSlsUjC4h7gHxuDXcYgs8j4bUmG8Kf3w9jRo6h04qlx6Z69VzGpS/X5rcNx3iJKCtYfqH5VCgr48o5b67YwGNXglEHj0LUsALaLaxL5/B37A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770317175;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=bVipZHTtEtAsUZ0knGXyLSrIQWXOrOHoviVlDOj8xh8=; 
 b=hjJkx1m+Pm4TLqPHv0+mDvAvVayHHcgxpHC8jga5gE0ilhflM4wnahbRwRozqBacvqEE4p8X0KalHb5UxAM+zaWWZiiLm/BsjeSuM16zkPF1/yseSVZC5igoDZ/PTgJBA5PZWz1/vwLgys9hrO9iO4J4cgg8OYZV1MhFDiCka6Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770317175; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=bVipZHTtEtAsUZ0knGXyLSrIQWXOrOHoviVlDOj8xh8=;
 b=QWJUCqoKL7iv7EqGpna37OO8Es2mDtSViHfd7pgg3eOcxCrLjR8FbIqhIjeP1+Ge
 cfz6iM6qr2WhG1fyZGJkhqZfCOVuGY767AWSSHG2Rb/HE9Qq1ctVqQHY48jYuPb5hRk
 PC7oGq8e8jfL8ofirQxKV0HYbKFK5mKh1eeLogKA=
Received: by mx.zohomail.com with SMTPS id 1770317174175743.7903155764141;
 Thu, 5 Feb 2026 10:46:14 -0800 (PST)
Message-ID: <02b19b310070df99e13aac97f1034299fa9652a2.camel@collabora.com>
Subject: Re: [PATCH RFC 3/6] drm/mediatek: ovl: Fix misaligned layer source
 size on AFBC mode
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?=
 <ck.hu@mediatek.com>,  "chunkuang.hu@kernel.org"	
 <chunkuang.hu@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "airlied@gmail.com" <airlied@gmail.com>,  "greenjustin@chromium.org"	
 <greenjustin@chromium.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>,  "matthias.bgg@gmail.com"	
 <matthias.bgg@gmail.com>
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, 
 "dri-devel@lists.freedesktop.org"	 <dri-devel@lists.freedesktop.org>, Nancy
 Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?=	
 <Nancy.Lin@mediatek.com>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, Jason-JH Lin
 =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=	 <Jason-JH.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, Daniel Stone
 <daniels@collabora.com>,  "linux-mediatek@lists.infradead.org"	
 <linux-mediatek@lists.infradead.org>, "kernel@collabora.com"	
 <kernel@collabora.com>
Date: Thu, 05 Feb 2026 13:46:12 -0500
In-Reply-To: <b640f9839f16980b6e9582815ce8588180237977.camel@mediatek.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
 <20251230-mtk-afbc-fixes-v1-3-6c0247b66e32@collabora.com>
 <b640f9839f16980b6e9582815ce8588180237977.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-ZohoMailClient: External
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
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,ffwll.ch,collabora.com,gmail.com,chromium.org,pengutronix.de];
	FORGED_SENDER(0.00)[nfraprado@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:ck.hu@mediatek.com,m:chunkuang.hu@kernel.org,m:simona@ffwll.ch,m:angelogioacchino.delregno@collabora.com,m:airlied@gmail.com,m:greenjustin@chromium.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:ariel.dalessandro@collabora.com,m:Nancy.Lin@mediatek.com,m:linux-kernel@vger.kernel.org,m:Jason-JH.Lin@mediatek.com,m:linux-arm-kernel@lists.infradead.org,m:daniels@collabora.com,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[nfraprado@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7E597F68CB
X-Rspamd-Action: no action

T24gTW9uLCAyMDI2LTAyLTAyIGF0IDA4OjQ2ICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToKPiBPbiBUdWUsIDIwMjUtMTItMzAgYXQgMTE6MDMgLTAzMDAsIE7DrWNvbGFzIEYuIFIuIEEu
IFByYWRvIHdyb3RlOgo+ID4gRnJvbTogQXJpZWwgRCdBbGVzc2FuZHJvIDxhcmllbC5kYWxlc3Nh
bmRyb0Bjb2xsYWJvcmEuY29tPgo+ID4gCj4gPiBJbiBBRkJDIG1vZGUsIE9WTF9TUkNfU0laRSBt
dXN0IGJlIGJsb2NrIGFsaWduZWQuIER1ZSB0byB0aGlzCj4gPiBsaW1pdGF0aW9uCj4gPiBvZiB0
aGUgQUZCQyBmb3JtYXQsIE9WTF9DTElQIG5lZWRzIHRvIGJlIHVzZWQgdG8gYWNoaWV2ZSB0aGUK
PiA+IGRlc2lyZWQKPiA+IG91dHB1dCBzaXplIG9mIHRoZSBsYXllciB3aGlsZSBzdGlsbCBtZWV0
aW5nIHRoZSBhbGlnbm1lbnQKPiA+IGNvbnN0cmFpbnRzLgo+ID4gRmFpbHVyZSB0byBkbyB0aGlz
IHdpbGwgcmVzdWx0IGluIHZibGFuayB0aW1lb3V0cyBhbmQgbm8gcmVuZGVyZWQKPiA+IG91dHB1
dAo+ID4gd2hlbiB0aGUgQUZCQyBkYXRhIHNvdXJjZSBpc24ndCBhbGlnbmVkIHRvIHRoZSBBRkJD
IGJsb2NrICgzMng4KS4KPiA+IAo+ID4gQ29uZmlndXJlIE9WTF9DTElQIHNvIHVuYWxpZ25lZCBB
RkJDIGxheWVycyBjYW4gYmUgZGlzcGxheWVkLgo+ID4gCj4gPiBUaGUgZm9sbG93aW5nIGlsbHVz
dHJhdGVzIGhvdyB0aGUgYWxpZ25tZW50IGlzIGFjaGlldmVkIHRocm91Z2ggdGhlCj4gPiBjbGlw
Cj4gPiBzZXR0aW5ncyBmb3IgdGhlIGhvcml6b250YWwgY29vcmRpbmF0ZXMsIHRoZSB2ZXJ0aWNh
bCBjb29yZGluYXRlcwo+ID4gYXJlCj4gPiBhbmFsb2dvdXM6Cj4gPiAKPiA+IC8tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1cCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPiA+IFwtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0vCj4gPiDCoMKgwqDCoCB8wqDCoMKgwqDCoMKg
IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDC
oCB8Cj4gPiDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHNyYy54McKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNyYy54MsKgIHwKPiA+IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgfMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHwKPiA+
IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgfDwtLS0tLS0tLS0tLS0tLS0tLS0tLT58wqDCoMKgwqDC
oMKgIHwKPiA+IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcmNfd2lkdGjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPiAKPiBUaGlzIHBhdGNoIGxvb2tzIHRvIG1l
Lgo+IEJ1dCAiSW4gQUZCQyBtb2RlLCBPVkxfU1JDX1NJWkUgbXVzdCBiZSBibG9jayBhbGlnbmVk
Iiwgc28gdGhpcyBncmFwaAo+IHNob3VsZCBzaG93IGFzOgo+IAo+IMKgwqDCoMKgIHzCoMKgwqDC
oMKgwqAgc3JjLngxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3JjLngywqAgfAo+
IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHwKPiDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgIHzCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoCB8Cj4g
wqDCoMKgwqAgTiAqIEFGQkNfREFUQV9CTE9DS19XSURUSMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDC
oCBNICogQUZCQ19EQVRBX0JMT0NLX1dJRFRICj4gwqDCoMKgwqAgfMKgwqDCoMKgwqDCoCB8wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgfAo+
IMKgwqDCoMKgIHw8LS0tLS0+fMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8PC0tLS0tPnwKPiDCoMKgwqDCoCB8Y2xpcF9sZWZ0wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsaXBfcmlnaHQKPiDCoMKgwqDCoCB8wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfAo+IMKgwqDCoMKgIHw8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
PnwKPiDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3JjX3dpZHRowqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8CgpBaCB5ZXMgaW5kZWVkLCB0aGFua3MgZm9yIHNwb3R0
aW5nIHRoYXQhCgotLSAKVGhhbmtzLAoKTsOtY29sYXMK

