Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54C5148640
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 14:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC80F72AA2;
	Fri, 24 Jan 2020 13:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515F072AA0;
 Fri, 24 Jan 2020 13:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 92DCD3F4C3;
 Fri, 24 Jan 2020 14:37:50 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=VG1VKFKw; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AsEEUtPa3i7d; Fri, 24 Jan 2020 14:37:49 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id CC8203F3B6;
 Fri, 24 Jan 2020 14:37:48 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 28EAA36015F;
 Fri, 24 Jan 2020 14:37:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579873068; bh=/j2I1MWq/K9ZVEstz0EsC8bKmbhXEAH4QrFNeAAYTew=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VG1VKFKwR9h27T3uFwLqhRUrRJZBXguYifP1ROTIBwMRC6UfSb4YWE+xzX7l7WNDx
 sjHtObtIaD/oPsIrAHhtXNnnzNJKbx/ZAyhLV+A9GkyYyVGvUYxeVstKPO/UDqBjmX
 sqht3xLi06v3pK/018MZG6aEuUhL8Y1z9MDVQ320=
Subject: Re: [PATCH] drm: Avoid drm_global_mutex for simple inc/dec of
 dev->open_count
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20200124125627.125042-2-chris@chris-wilson.co.uk>
 <20200124130107.125404-1-chris@chris-wilson.co.uk>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <38d3a0bf-4dfa-c8e4-c429-8c95854a9b8c@shipmail.org>
Date: Fri, 24 Jan 2020 14:37:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200124130107.125404-1-chris@chris-wilson.co.uk>
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

T24gMS8yNC8yMCAyOjAxIFBNLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gU2luY2UgZHJtX2dsb2Jh
bF9tdXRleCBpcyBhIHRydWUgZ2xvYmFsIG11dGV4IGFjcm9zcyBkZXZpY2VzLCB3ZSBkb24ndAo+
IHdhbnQgdG8gYWNxdWlyZSBpdCB1bmxlc3MgYWJzb2x1dGVseSBuZWNlc3NhcnkuIEZvciBtYWlu
dGFpbmluZyB0aGUKPiBkZXZpY2UgbG9jYWwgb3Blbl9jb3VudCwgd2UgY2FuIHVzZSBhdG9taWMg
b3BlcmF0aW9ucyBvbiB0aGUgY291bnRlcgo+IGl0c2VsZiwgZXhjZXB0IHdoZW4gbWFraW5nIHRo
ZSB0cmFuc2l0aW9uIHRvL2Zyb20gMC4gSGVyZSwgd2UgdGFja2xlIHRoZQo+IGVhc3kgcG9ydGlv
biBvZiBkZWxheWluZyBhY3F1aXJpbmcgdGhlIGRybV9nbG9iYWxfbXV0ZXggZm9yIHRoZSBmaW5h
bAo+IHJlbGVhc2UgYnkgdXNpbmcgYXRvbWljX2RlY19hbmRfbXV0ZXhfbG9jaygpLCBsZWF2aW5n
IHRoZSBnbG9iYWwKPiBzZXJpYWxpc2F0aW9uIGFjcm9zcyB0aGUgZGV2aWNlIG9wZW5zLgo+Cj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4g
Q2M6IFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIDx0aG9tYXNfb3NAc2hpcG1haWwub3JnPgoK
Rm9yIHRoZSBzZXJpZXM6CgpSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRoZWxsc3Ry
b21Adm13YXJlLmNvbT4KCk5vdyB0aGUgb25seSByZW1haW5pbmcgKHRob3VnaCBwcmUtZXhpc3Rp
bmcpIHByb2JsZW0gSSBjYW4gc2VlIGlzIHRoYXQgCnRoZXJlIGlzIG5vIGNvcnJlc3BvbmRpbmcg
bXV0ZXggbG9jayBpbiBkcm1fb3BlbigpIHNvIHRoYXQgZmlyc3RvcGVuIAptaWdodCByYWNlIHdp
dGggbGFzdGNsb3NlLi4gT3IgSSBtaWdodCBiZSBtaXNzaW5nIHNvbWV0aGluZy4uCgovVGhvbWFz
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
