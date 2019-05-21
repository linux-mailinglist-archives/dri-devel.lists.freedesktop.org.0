Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56CA24B76
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 11:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D894289240;
	Tue, 21 May 2019 09:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4927B89240
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 09:27:34 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id r76so15147988lja.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 02:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Xy6KpBMf4VElfSxI8JZgNkIn+5swVz4A7VXhYDp2D4=;
 b=giNgvS1705/juktGdtabgGcDdi90bYUYqv2+gJXxOOr8KjLgS0zEh/LMguTBrS0N3Z
 j/KoLxY/fqHeeGyRfaug25HMXxfXBl/1bZhwYnoiGmBJZAbGKW2gWSuXUI8de2d7iw4U
 i4GHRjRts4C/WehN3cxKy3Th5sl9p0+zwpLvpHNfURwargOiFrlFQ0tjU2O5LiFhWf0e
 IR9YdBNt+MFJYTc2l8o7UFxGzODU6VfX5QlxNX9A5do396JZ2AsBDvW3aMz5TmDoxbTY
 Mur582+4CRXxyqjzQBSGti5oANRtv7FpXz9O2KmNUYz7QTirD3NqiTgvY+MONt4Rz902
 xEPw==
X-Gm-Message-State: APjAAAW0+G0tOd3N4ZMraI0AoqjC+m7Dpnc+iMlVLBwRzpseBc2Arf1k
 88dwf6fdq9zWJaEEKXszyN8Fsg==
X-Google-Smtp-Source: APXvYqz2W9cUR77wBpFQtxU/OEIMqFs1dqOYZh2m5bXIMOiU7pDh+NaARFsIcqKmxsWQZ0msZguFsQ==
X-Received: by 2002:a2e:60a:: with SMTP id 10mr3542802ljg.126.1558430852654;
 Tue, 21 May 2019 02:27:32 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.81.21])
 by smtp.gmail.com with ESMTPSA id u128sm1039382lja.23.2019.05.21.02.27.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 02:27:31 -0700 (PDT)
Subject: Re: [PATCH v5 2/6] net: stmmac: sun8i: force select external PHY when
 no internal one
To: megous@megous.com, linux-sunxi@googlegroups.com,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20190520235009.16734-1-megous@megous.com>
 <20190520235009.16734-3-megous@megous.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4e031eeb-2819-a97f-73bf-af84b04aa7b2@cogentembedded.com>
Date: Tue, 21 May 2019 12:27:24 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520235009.16734-3-megous@megous.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5Xy6KpBMf4VElfSxI8JZgNkIn+5swVz4A7VXhYDp2D4=;
 b=gi0FnqEmcboPROS3aUYX2FmzKmldrXp2Xd53Cs+z0s80NF/1tJ+89FLSOmuykkWh0a
 Bseps+m7BHSnZFk5NVsRLKcGhVs10u9VBXuk7ZFWImQxcj/UfGSJbg6gJGqG3M6Eryu0
 +6VMdvaQODEdkEjm10eVWCg6HQioXvq/vhckhU8CXA37bZxImLyV9zUqEhECALNCOSWj
 Io7qmy3Kwb5wIloKJURrXpWb2PPdq2gW5p7a9/ShaO6loZBFBAo1n7iTGu7RKvdGnRAu
 5KIh2bLGig4OqmPNCI6RFNpRPS27XWQk6PKwqmubBBllN7izvBcvS8lnUx17EQ9e1BYP
 sbbQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8hCgpPbiAyMS4wNS4yMDE5IDI6NTAsIG1lZ291c0BtZWdvdXMuY29tIHdyb3RlOgoKPiBG
cm9tOiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+Cj4gCj4gVGhlIFBIWSBzZWxlY3Rp
b24gYml0IGFsc28gZXhpc3RzIG9uIFNvQ3Mgd2l0aG91dCBhbiBpbnRlcm5hbCBQSFk7IGlmIGl0
J3MKPiBzZXQgdG8gMSAoaW50ZXJuYWwgUEhZLCBkZWZhdWx0IHZhbHVlKSB0aGVuIHRoZSBNQUMg
d2lsbCBub3QgbWFrZSB1c2Ugb2YKPiBhbnkgUEhZIHN1Y2ggU29Dcy4KICAgICAgICAgIF4gIm9u
IiBvciAid2l0aCIgbWlzc2luZz8KCj4gVGhpcyBwcm9ibGVtIGFwcGVhcnMgd2hlbiBhZGFwdGlu
ZyBmb3IgSDYsIHdoaWNoIGhhcyBubyByZWFsIGludGVybmFsIFBIWQo+ICh0aGUgImludGVybmFs
IFBIWSIgb24gSDYgaXMgbm90IG9uLWRpZSwgYnV0IG9uIGEgY28tcGFja2FnZWQgQUMyMDAgY2hp
cCwKPiBjb25uZWN0ZWQgdmlhIFJNSUkgaW50ZXJmYWNlIGF0IEdQSU8gYmFuayBBKS4KPiAKPiBG
b3JjZSB0aGUgUEhZIHNlbGVjdGlvbiBiaXQgdG8gMCB3aGVuIHRoZSBTT0MgZG9lc24ndCBoYXZl
IGFuIGludGVybmFsIFBIWSwKPiB0byBhZGRyZXNzIHRoZSBwcm9ibGVtIG9mIGEgd3JvbmcgZGVm
YXVsdCB2YWx1ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFv
c2MuaW8+Cj4gU2lnbmVkLW9mZi1ieTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+
ClsuLi5dCgpNQlIsIFNlcmdlaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
