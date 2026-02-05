Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fYIcLuDrhGmw6gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 20:13:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F400AF6BE7
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 20:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5989289089;
	Thu,  5 Feb 2026 19:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="ZcSB19c0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB0589089
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 19:13:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770318803; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Z+xw3Y3WvFDUOy3hH85NY5r5cDEJeA6u+ukx4WKTUNjbl76sMNaZqdP0NfGXQP/JKPuGP6gQXG8zmE64f6gJ9IXat2p0Iaqi9BvhOpxeum7OVfIugEpgVpdcPHHrkanGeF9y9GC/xqt1rtKJZ9ts/ElDDFx0BSWNC2ZQxTRS8zQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770318803;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=R6Qb+kMGvysBXnMkQffW3lm0/z4W8L2rlkrTy2pFEc0=; 
 b=d90s0tIiwru4tr9Rsnz/IW9zYIP/shW+lDgwnK8POAsRjv8sxwHLHaWNAbh4qPyrf8f971JaF3TdRt4pkH5EG+DEDgIoqN9tWD25nTIVcJGmt5E3HMzV/IituNyZjYN7KaYzYQzUhexyQERHVJKQyuXigOo+uBw/k6ihYWWGxUQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770318803; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=R6Qb+kMGvysBXnMkQffW3lm0/z4W8L2rlkrTy2pFEc0=;
 b=ZcSB19c0VZy9ZSGzQJ4z2FnBfcEzpmYxPPYvlf6OiEFPGmeHWNm2qU9hdgVvU5/2
 +M8E9b72bFBuECEWcwL+xlYobCQub+RGpa5thc8wuxlJMMav0XwSMPNe0+EQLlvLnEQ
 7X57Pjp6zSs7rfkJ3M0YhhubEvWpk5h7eRhvhc4w=
Received: by mx.zohomail.com with SMTPS id 177031880234544.88725212487793;
 Thu, 5 Feb 2026 11:13:22 -0800 (PST)
Message-ID: <1394a4b34db511c921b2709a58dfaf28c1cce45c.camel@collabora.com>
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
Date: Thu, 05 Feb 2026 14:13:20 -0500
In-Reply-To: <3716cf4707924e97c097cfefa11c7feb09a1ee16.camel@mediatek.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
 <20251230-mtk-afbc-fixes-v1-3-6c0247b66e32@collabora.com>
 <3716cf4707924e97c097cfefa11c7feb09a1ee16.camel@mediatek.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: F400AF6BE7
X-Rspamd-Action: no action

T24gVHVlLCAyMDI2LTAyLTAzIGF0IDAyOjAxICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
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
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPiA+IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8Cj4gPiDCoMKgwqDCoCBOICogQUZCQ19EQVRBX0JMT0NLX1dJRFRIwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgTSAqCj4gPiBBRkJDX0RBVEFfQkxPQ0tfV0lEVEgKPiA+IMKgwqDCoMKg
IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4gPiDCoMKgwqDCoCB8PC0tLS0tPnzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfDwtLS0tLT58Cj4gPiDCoMKgwqDCoMKgIGNs
aXBfbGVmdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbGlwX3Jp
Z2h0Cj4gCj4gQXMgSSBrbm93LCBjcm9wIGlzIHVzZWQgdG8gZHJvcCBwaXhlbCBkYXRhLgo+IEZy
b20gdGhlIG5hbWUgb2YgJ2NsaXBfbGVmdCcsIEkgdGhpbmsgaXQgd291bGQgZHJvcCB0aGUgbGVm
dCBwYXJ0IG9mCj4gdGhpcyBpbWFnZS4KPiBCdXQgdXN1YWxseSB0aGUgaW1hZ2UgaXMgYWxpZ25l
ZCB0byB0aGUgbGVmdCAoc3RhcnQgZnJvbSBheGlzIDApIGFuZAo+IGFwcGVuZCBnYXJiYWdlIGRh
dGEgaW4gcmlnaHQgcGFydC4KPiBJZiBzbywgY2xpcF9sZWZ0IHNob3VsZCBiZSB6ZXJvIGFuZCBh
bGwgdGhlIGNsaXAgd291bGQgYmUgY2xpcF9yaWdodC4KPiBUaGlzIGlzIHRoZSBub3JtYWwgYmVo
YXZpb3IuCj4gSWYgT1ZMX0NST1AgZG9lcyBiZWhhdmUgYXMgdGhpcywgYWRkIGNvbW1lbnQgdG8g
ZGVzY3JpYmUgdGhhdAo+IGNsaXBfbGVmdCBkb2VzIG5vdCBkcm9wIHBpeGVsIGRhdGEuCgpCb3Ro
IGNsaXBfbGVmdCBhbmQgY2xpcF9yaWdodCB3b3JrIGluIHRoZSBzYW1lIHdheSwgYnkgZGlzY2Fy
ZGluZyB0aGF0Cm1hbnkgcGl4ZWxzLCBvbiB0aGUgbGVmdCBhbmQgcmlnaHQsIHJlc3BlY3RpdmVs
eSwgb2YgdGhlIHBsYW5lJ3MKZnJhbWVidWZmZXIgd2hlbiBjb21wb3NpdGluZyB0aGUgcGxhbmUg
b24gdGhlIGZpbmFsIGltYWdlLgoKSW4gdGhlIHNpbXBsZXN0IGNhc2UsIHdoZW4gdGhlIGltYWdl
IHRvIGJlIGRpc3BsYXllZCBpcyBsZWZ0LWFsaWduZWQsCmllIHNyYy54MSA9IDAsIHRoZW4geWVz
LCBvbmx5IGNsaXBfcmlnaHQgd2lsbCBiZSB1c2VkIHRvIG1ha2Ugc3VyZSB0aGF0CnRoZSBwbGFu
ZSdzIHdpZHRoIGFsaWducyB3aXRoIHRoZSBBRkJDX0RBVEFfQkxPQ0tfV0lEVEguCgpIb3dldmVy
IGlmIG9ubHkgYSBzdWItcmVnaW9uIG9mIHRoZSBpbWFnZSBpcyB0byBiZSBkaXNwbGF5ZWQsIHRo
ZW4Kc3JjLngxIHdpbGwgYmUgbm9uLXplcm8uIElmIHRoYXQgeCBvZmZzZXQgY29vcmRpbmF0ZSBh
bGlnbnMgd2l0aCB0aGUKQUZCQ19EQVRBX0JMT0NLX1dJRFRILCB0aGVuIGFnYWluIGNsaXBfbGVm
dCB3aWxsIGJlIDAsIGFuZCB3ZSdyZSBiYWNrCmF0IHRoZSBzaW1wbGVzdCBjYXNlLgoKQnV0IGlm
IGl0IGRvZXNuJ3QgYWxpZ24swqB0aGVuIGNsaXBfbGVmdCB3aWxsIG5lZWQgdG8gYmUgdXNlZCB0
byBlbnN1cmUKb25seSB0aGUgaW50ZW5kZWQgc3ViLXJlZ2lvbiBpcyBkaXNwbGF5ZWQsIGV2ZW4g
dGhvdWdoIGl0IHN0YXJ0cyBpbiB0aGUKbWlkZGxlIG9mIGFuIEFGQkMgZGF0YSBibG9jay4KClRo
aXMgaXMgYmVjYXVzZSBub3Qgb25seSB0aGUgd2lkdGggYW5kIGhlaWdodCBpbiBESVNQX1JFR19P
VkxfU1JDX1NJWkUKbmVlZCB0byBiZSBhbGlnbmVkIHRvIHRoZSBBRkJDIGRhdGEgYmxvY2ssIGJ1
dCBhbHNvIHRoZSBzdGFydGluZwphZGRyZXNzIGluIERJU1BfUkVHX09WTF9BRERSLCB3aGlsZSBz
cmMueDEgYW5kIHNyYy54MiBzdXBwbGllZCBieQp1c2Vyc3BhY2UgYXJlIGFyYml0cmFyeSBhbmQg
d29uJ3QgbmVjZXNzYXJpbHkgYWxpZ24sIGhlbmNlIHdlIHVzZSBib3RoCmNsaXBzIGFzIG5lZWRl
ZCB0byBhY2hpZXZlIHRoZSBpbnRlbmRlZCBkaXNwbGF5IG91dGNvbWUgcmVzcGVjdGluZyB0aGUK
aGFyZHdhcmUgY29uc3RyYWludHMuCgotLSAKVGhhbmtzLAoKTsOtY29sYXMK

