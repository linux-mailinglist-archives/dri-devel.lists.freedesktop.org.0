Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558DF3857F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AFD89B27;
	Fri,  7 Jun 2019 07:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE5989690
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 09:47:33 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 16so1355000ljv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 02:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J2Cqvkykb6IzlqW52A480gg6SUQ50ONET6S3EycqghE=;
 b=jGY7a+4uuXKbxH761x6YCUiePLPO8AaAQXfskqar9gQt1E7YWg4TANGA9vD2d7UJET
 2gvC4vL4IfWtgrluC8HM6BZNzu6EhG+qPVHoRXJwIiWspO4p5IXbgTHO3AZMMfVKzP85
 ooBqX8bJ48ckaE6EdQlMjLrNWNOgEHKYMISqIL/2dam+1hmlc/q3CI70yvnFlc2uf0Db
 yGXPeXb38Zp0ydP8JssFrmJSh7WJnpR7Hr0X7Q5vju+/FIfIWOwJWaGv7PE5Pjz53fQl
 tJgUSsMmtiRC/4XTXOslLmLphYrSTAX51hi2PyhIS+Jb5oNAg61NZigh2UBKbz+j1AYZ
 1o9w==
X-Gm-Message-State: APjAAAWfJYzKb/t+rRzsNHQYxZLIE8eZ+gM+IJXsgBjRafOSXCpuixc0
 1Tg3ulqROL4PS7J4ROs+sHMBEQ==
X-Google-Smtp-Source: APXvYqzYFWFgXwM4oVScr/7MwzKqnuStv9TQA+4YHbIIppvBW9LTDZNPdBEJzK7doqcYm4prjjpeQg==
X-Received: by 2002:a2e:751c:: with SMTP id q28mr563236ljc.178.1559814451458; 
 Thu, 06 Jun 2019 02:47:31 -0700 (PDT)
Received: from localhost (c-1c3670d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.54.28])
 by smtp.gmail.com with ESMTPSA id y6sm256967ljj.20.2019.06.06.02.47.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 02:47:30 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
 davem@davemloft.net
Subject: [PATCH 6/8] drivers: net: phy: fix warning same module names
Date: Thu,  6 Jun 2019 11:47:26 +0200
Message-Id: <20190606094727.23868-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J2Cqvkykb6IzlqW52A480gg6SUQ50ONET6S3EycqghE=;
 b=Ct2B8euOQrdzpG+cBAg47dgcUgrlI6vJX6UvUSSPeNwsKDpV+z4nSYOjKzI7W0wXTu
 r4jjtQhfwhUWEQvY5WPDdCcoU0aNZzPqjiQACNymjSE/whrVITUQW+sfJJRh67N7gAPV
 Y6aGOOnJIzpqaVpPjdK9zk+OILcF70TrXSnFDTE9d0Uy3ATZRk6SB8Wm0vsDLnuEgW9u
 Msd37JC1CJnUF4yMZWBh8aTUaup5fRhVX6rYUFH8B7T1WP2DESSOhwHMhzvxVFXo3gDL
 7pyLCCCDkdbKjJb4GMB88KOLLQZUiiIkR93f5TCKdSUkMPxl4b0iKh4nvjQxFwzkSw/n
 PuYA==
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
Cc: marex@denx.de, linux-fbdev@vger.kernel.org,
 Anders Roxell <anders.roxell@linaro.org>, b.zolnierkie@samsung.com,
 airlied@linux.ie, lee.jones@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, mchehab@kernel.org,
 shawnguo@kernel.org, vivien.didelot@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBidWlsZGluZyB3aXRoIENPTkZJR19BU0lYX1BIWSBhbmQgQ09ORklHX1VTQl9ORVRfQVg4
ODE3WCBlbmFibGVkIGFzCmxvYWRhYmxlIG1vZHVsZXMsIHdlIHNlZSB0aGUgZm9sbG93aW5nIHdh
cm5pbmc6Cgp3YXJuaW5nOiBzYW1lIG1vZHVsZSBuYW1lcyBmb3VuZDoKICBkcml2ZXJzL25ldC9w
aHkvYXNpeC5rbwogIGRyaXZlcnMvbmV0L3VzYi9hc2l4LmtvCgpSZXdvcmsgc28gbWVkaWEgY29k
YSBtYXRjaGVzIHRoZSBjb25maWcgZnJhZ21lbnQuIExlYXZpbmcKQ09ORklHX1VTQl9ORVRfQVg4
ODE3WCBhcyBpcyBzaW5jZSB0aGF0cyBhIHdlbGwga25vd24gbW9kdWxlLgoKU2lnbmVkLW9mZi1i
eTogQW5kZXJzIFJveGVsbCA8YW5kZXJzLnJveGVsbEBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMv
bmV0L3BoeS9NYWtlZmlsZSB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvcGh5L01ha2VmaWxlIGIv
ZHJpdmVycy9uZXQvcGh5L01ha2VmaWxlCmluZGV4IDk0N2M5NzRiYzY5ZS4uYmFiMTc5Yjc1YTJh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9waHkvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9uZXQv
cGh5L01ha2VmaWxlCkBAIC01Miw3ICs1Miw4IEBAIGlmZGVmIENPTkZJR19IV01PTgogYXF1YW50
aWEtb2JqcwkJCSs9IGFxdWFudGlhX2h3bW9uLm8KIGVuZGlmCiBvYmotJChDT05GSUdfQVFVQU5U
SUFfUEhZKQkrPSBhcXVhbnRpYS5vCi1vYmotJChDT05GSUdfQVNJWF9QSFkpCQkrPSBhc2l4Lm8K
K29iai0kKENPTkZJR19BU0lYX1BIWSkJCSs9IGFzaXgtcGh5Lm8KK2FzaXgtcGh5LW9ianMJCQk6
PSBhc2l4Lm8KIG9iai0kKENPTkZJR19BVDgwM1hfUEhZKQkrPSBhdDgwM3gubwogb2JqLSQoQ09O
RklHX0JDTTYzWFhfUEhZKQkrPSBiY202M3h4Lm8KIG9iai0kKENPTkZJR19CQ003WFhYX1BIWSkJ
Kz0gYmNtN3h4eC5vCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
