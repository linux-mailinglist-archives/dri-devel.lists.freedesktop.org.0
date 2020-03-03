Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26C0178BAF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3C46EAC3;
	Wed,  4 Mar 2020 07:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC676EA64
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 13:13:06 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z15so4314843wrl.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 05:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Z13Ve+x9M04zTUt0+eKu4zeTZ/92qthWL5AKAx8aeUs=;
 b=Y2bJ2/L5HkbnQn/FpKmwSbyhhHqbFBEP7Fcdd5ldN2C7M40qtgLRyhxBZ97PoV/Z/X
 hTsR86bMB9dwEn5zt0BinKTuyvSixBSasEOyXsAa3ZG/GPVREElwr/JRQXJuANqDiWy6
 BwEAjwKxSjTRFOWKolmVJC+0jg2bqGxaKObavVjJJ1E7dArooi8MGevOJSIbnO6Ny4o3
 3dPRv/jP+qKx5+SnfeeOH17QK2p2hxjFd1FLxUwvDseENDf0mL3iJEqmolVHVjSLya9F
 Z0c0BhGVZNWDtYin2sXJmKdztrBWbjxtv/LPJXKfg+u4S4zRCkbTw3CIkn2GPUPkdl8D
 pFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:user-agent:mime-version
 :content-transfer-encoding;
 bh=Z13Ve+x9M04zTUt0+eKu4zeTZ/92qthWL5AKAx8aeUs=;
 b=OyQQuSSiLNFdkbphG6nkFpdNPGhpkToD1kcDW1QSky04FtGh7tAb3a8S++6Rd3j57k
 kW/EZbehSBFHuIIhaWMIiMHvjhgAN+7TeXX9mvpQqJLlmx63QGS8Oh5l1cRFDx+E3G4U
 PKY346znzOB5ZBVEU6kxA4V7TJuF3U/OuOWQAkZILp7tQmN0xpS4je7sHqPoJaOg73LX
 2Uv22084YC9kTpeoO9tLeQPdHHR96RQUwaB3rkRpGl9BLkWWakgfXCKC68o/1wgEPeH2
 8C1tVnSXgobMXt6TzY8lp0IwCKLt/reqp8Jjk3FTU+quub0CLP1OQyllgF9H/iLbsRDL
 qn6Q==
X-Gm-Message-State: ANhLgQ1vu+l/OlWXD7aneMt+6LD6LE72n28jdeYCG3Q/u851w5V7MzKQ
 l/4F7BNEf5pzv2Dcwne+J40=
X-Google-Smtp-Source: ADFU+vslcunckMD+xLKTIpKAww6om2Aj4DmwkhU9yrRP9ifGbuBlWLeV8laQxWA3B9w/GBN3o5H60Q==
X-Received: by 2002:a5d:5602:: with SMTP id l2mr5628305wrv.90.1583241185032;
 Tue, 03 Mar 2020 05:13:05 -0800 (PST)
Received: from ?IPv6:2a02:8070:bb9:bc00::fc? ([2a02:8070:bb9:bc00::fc])
 by smtp.gmail.com with ESMTPSA id g7sm29746726wrm.72.2020.03.03.05.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 05:13:04 -0800 (PST)
Message-ID: <c6dac7c9ba4eb02ec60419e03b5a0afe0160a2ec.camel@googlemail.com>
Subject: Re: [PATCH 10/33] drm/panel-simple: Fix dotclock for AUO G104SN02 V2
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Tue, 03 Mar 2020 14:13:03 +0100
In-Reply-To: <20200302203452.17977-11-ville.syrjala@linux.intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-11-ville.syrjala@linux.intel.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
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
Reply-To: chf.fritz@googlemail.com
Cc: Thierry Reding <treding@nvidia.com>,
 Stefan Riedmueller <s.riedmueller@phytec.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIwLTAzLTAyIGF0IDIyOjM0ICswMjAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOgo+
IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4g
Cj4gVGhlIGN1cnJlbnRseSBsaXN0ZWQgZG90Y2xvY2sgZGlzYWdyZWVzIHdpdGggdGhlIGN1cnJl
bnRseQo+IGxpc3RlZCB2cmVmcmVzaCByYXRlLiBDaGFuZ2UgdGhlIGRvdGNsb2NrIHRvIG1hdGNo
IHRoZSB2cmVmcmVzaC4KPiAKPiBTb21lb25lIHRlbGwgbWUgd2hpY2ggKGlmIGVpdGhlcikgb2Yg
dGhlIGRvdGNsb2NrIG9yIHZyZXJlc2ggaXMKPiBjb3JyZWN0PwoKVGhpcyBkaXNwbGF5IChhIGNv
bnRyb2xsZXIgaXMgaW5jbHVkZWQpIGhhcyBhIHdpZGUgdG9sZXJhbmNlIHJhbmdlLgoKQWRhcHRp
bmcgY2xvY2sgc2hvdWxkIGJlIGZpbmUgd2hpbGUga2VlcGluZyB2cmVmcmVzaCByYXRlIGF0IDYw
IEh6LgoKSSBndWVzcyBhbiBldmVuIGJldHRlciBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBjaGFu
Z2UgdGhpcyBjb25maWcgdG8gYQpwaXhlbGNsb2NrIGRlc2NyaWJpbmcgb25lIGxpa2UgdGhlIG90
aGVyIGF1byBwYW5lbHMuCgpCdXQgYXQgdGhlIG1vbWVudCBJJ20gbm90IGhhdmluZyBhIGRpc3Bs
YXkgaGVyZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
