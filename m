Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 411EA148F64
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 21:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B1B6E043;
	Fri, 24 Jan 2020 20:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECD86E043;
 Fri, 24 Jan 2020 20:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 3EEF43FAF7;
 Fri, 24 Jan 2020 21:32:46 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=bjMIqa7P; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cx9psLqG8DRM; Fri, 24 Jan 2020 21:32:44 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 919423F5EC;
 Fri, 24 Jan 2020 21:32:43 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id C9B3036015F;
 Fri, 24 Jan 2020 21:32:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579897962; bh=2NaGwElzqFny5tB4L83I3vn6XfjnjJvgOTHCSvWQYlQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bjMIqa7PKOHNTrmPdhZddpUCBxe+REZ2RIQFye0U7XqdGLDMbWWxb2pT0tQKmIeT0
 tzO49tAFajAZUMiTydqv0cSLIH62z/96JeXYiTJWZTSCr5fCgOfwPrQjZ8FSPqqAEA
 HCvBeQ7SCXmhkdrbertXG9ltb1mAKDhRceIXMOYs=
Subject: Re: [PATCH] drm: Avoid drm_global_mutex for simple inc/dec of
 dev->open_count
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20200124125627.125042-2-chris@chris-wilson.co.uk>
 <20200124130107.125404-1-chris@chris-wilson.co.uk>
 <38d3a0bf-4dfa-c8e4-c429-8c95854a9b8c@shipmail.org>
 <157989116639.2524.11400196809963426024@skylake-alporthouse-com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <2d7c3a6b-7e08-2937-47b9-9148d885a8c1@shipmail.org>
Date: Fri, 24 Jan 2020 21:32:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <157989116639.2524.11400196809963426024@skylake-alporthouse-com>
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMS8yNC8yMCA3OjM5IFBNLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gUXVvdGluZyBUaG9tYXMg
SGVsbHN0csO2bSAoVk13YXJlKSAoMjAyMC0wMS0yNCAxMzozNzo0NykKPj4gT24gMS8yNC8yMCAy
OjAxIFBNLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4+PiBTaW5jZSBkcm1fZ2xvYmFsX211dGV4IGlz
IGEgdHJ1ZSBnbG9iYWwgbXV0ZXggYWNyb3NzIGRldmljZXMsIHdlIGRvbid0Cj4+PiB3YW50IHRv
IGFjcXVpcmUgaXQgdW5sZXNzIGFic29sdXRlbHkgbmVjZXNzYXJ5LiBGb3IgbWFpbnRhaW5pbmcg
dGhlCj4+PiBkZXZpY2UgbG9jYWwgb3Blbl9jb3VudCwgd2UgY2FuIHVzZSBhdG9taWMgb3BlcmF0
aW9ucyBvbiB0aGUgY291bnRlcgo+Pj4gaXRzZWxmLCBleGNlcHQgd2hlbiBtYWtpbmcgdGhlIHRy
YW5zaXRpb24gdG8vZnJvbSAwLiBIZXJlLCB3ZSB0YWNrbGUgdGhlCj4+PiBlYXN5IHBvcnRpb24g
b2YgZGVsYXlpbmcgYWNxdWlyaW5nIHRoZSBkcm1fZ2xvYmFsX211dGV4IGZvciB0aGUgZmluYWwK
Pj4+IHJlbGVhc2UgYnkgdXNpbmcgYXRvbWljX2RlY19hbmRfbXV0ZXhfbG9jaygpLCBsZWF2aW5n
IHRoZSBnbG9iYWwKPj4+IHNlcmlhbGlzYXRpb24gYWNyb3NzIHRoZSBkZXZpY2Ugb3BlbnMuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+Cj4+PiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgPHRob21hc19vc0BzaGlwbWFp
bC5vcmc+Cj4+IEZvciB0aGUgc2VyaWVzOgo+Pgo+PiBSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxz
dHLDtm0gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPiBOb3cgYmVpbmcgb3B0LWluLCBpdCBpcyBm
YWlybHkgbGltaXRlZCBpbiBzY29wZSBhbmQgd2lsbCBub3QgcmFuZG9tbHkKPiBicmVhayBvdGhl
cnMgKHRvdWNoIHdvb2QpIGFuZCB0aGUgY2xvc2UoKSByYWNpbmcgaW4gQkFUIGRpZG4ndCB0aHJv
dwo+IGFueXRoaW5nIHVwLCBzbyBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dC4gVGhhbmtzIGZvciB0
aGUgcmV2aWV3IGFuZAo+IHN1Z2dlc3Rpb25zLAo+Cj4gTmV4dCB0YXNrIGlzIHRvIHN1Z2dlc3Qg
b3RoZXJzIG1pZ2h0IGxpa2UgdG8gdXNlIGl0IGFzIHdlbGwuCj4gLUNocmlzCgpUaGFua3MuIEkn
bGwgbG9vayBhdCBkb2luZyB0aGUgc2FtZSBmb3IgdGhvc2UgZHJpdmVycyBJIGF1ZGl0ZWQuCgov
VGhvbWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
