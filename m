Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6D31AD6A7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1444F6E39B;
	Fri, 17 Apr 2020 07:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8676E83F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 17:30:27 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q19so8673387ljp.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 10:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PzXYo6swgx9ErVWXLPhxkfiU9vzkaSg3H3Qei59zPVk=;
 b=EMKTHWrZe1g6E1jAx3Mm6n4rNEbgdAY2tazlr947do0XAmQrCx7fqdG7Y/NQ7ZvIGa
 +Vr2LStXg+i/M68mtRtC7AGVSWpk0b8ZZXgW7BQQefZb38i6cKZqmBLA5gzPrXhzgUGd
 9Ljsx+ARG6EHoZhu+sblmtC8ZIZvW7Vh+P11bc3+R7eS+1ZkJbAmloYpBj0ocpIg188O
 qRxHoayqIWP6gQ9nmQLxRXXzgb9Ff9O3gBoMs0KUwIwUSu+7MncsrUXKf3caQ02xkaCz
 9nyD32+f+p8xtfm3+H0VnrbT+0WAHkMyi+/6XhdOL+/RtVEYM+i63Nr2V9ns56qfe9XI
 wqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PzXYo6swgx9ErVWXLPhxkfiU9vzkaSg3H3Qei59zPVk=;
 b=QAZPGSYkZG9CwLHTCqjPMry/32WDXToRaShB4RQxJP+ZOBPM0W5JwEMcb+w2s8fSO7
 8Dax8jDtffWTlYOPpMPri18hxBD/BaKIrVx9lj2QRnp6r9I550/zIhqmpLdk3zFY/mMf
 daHE1dL7voMPeBwy1Sikr7QjhvlrFXSOa3gJUBmJ/KIe1A0ioxVBUpoFUZaGQLedWoME
 P4IGpMh6hYD+1c+DyMpgzpkxUKoSTJnVkFCSYNM/wbUlYg4er1WLmzq5tz/zxnSIzAOl
 DGOfM6tgd/oP+xnqh5snzFN9AkFI+fZZy5qzjMeeFJ1eSf1r4v0VVnR5dM1uVwz7hdOw
 /KgA==
X-Gm-Message-State: AGi0PuYA7NPxUxq0bqqEgCITa8TPgpJDRD+1hnIE2na3JKIxvt57Lnto
 UPBPL0EQsHUhxvU7izzN7DU=
X-Google-Smtp-Source: APiQypKtQyEgNh58ni0ovy2jVpR3dc7TEccd1Z071GjbZqt59NIctX8jyj1HZRyg/Uuy9PaODkOlWw==
X-Received: by 2002:a2e:9a54:: with SMTP id k20mr7012405ljj.272.1587058225547; 
 Thu, 16 Apr 2020 10:30:25 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id u19sm12879858lji.61.2020.04.16.10.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2020 10:30:24 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] drm/tegra: output: Don't leak OF node on error
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-2-digetx@gmail.com>
 <20200416172727.GN4796@pendragon.ideasonboard.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <304a2a58-0031-bf88-6290-e72ab025d8c5@gmail.com>
Date: Thu, 16 Apr 2020 20:30:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416172727.GN4796@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 17 Apr 2020 06:59:46 +0000
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDQuMjAyMCAyMDoyNywgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgo+IEhpIERtaXRy
eSwKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPiAKPiBPbiBUaHUsIEFwciAxNiwgMjAy
MCBhdCAwODoyNDowNFBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFRoZSBPRiBu
b2RlIHNob3VsZCBiZSBwdXQgYmVmb3JlIHJldHVybmluZyBlcnJvciBpbiB0ZWdyYV9vdXRwdXRf
cHJvYmUoKSwKPj4gb3RoZXJ3aXNlIG5vZGUncyByZWZjb3VudCB3aWxsIGJlIGxlYWtlZC4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+IAo+
IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+CgpIZWxsbyBMYXVyZW50LAoKVGhhdCBpcyB0aGUgZmFzdGVzdCBrZXJuZWwgcmV2
aWV3IEkgZXZlciBnb3QsIHRoYW5rIHlvdSA6KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
