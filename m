Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 600D6E6E1A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D60B6E480;
	Mon, 28 Oct 2019 08:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9876EA32
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 13:30:42 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id s17so1244549plp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 06:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cSyCYud2FH3n+k9xbUM5DyhXCO7gVkxyPIn3KZPMoVk=;
 b=Ipdbfs/fWsthpSRYdddpPxoK8vrmPKcs8FtFFZmkOTHaoKx72Sm+ShvN6lqEHpDtZD
 QR4/RBiLPts1sTqurChZzLP495uBVqKVQXxswZQlIg98JFyriHY9rqivSsdhclv3jBx6
 49+pjWqOO0BpdWk0+WXgTZcfYW/QxclOyzr2pGYqJauSm3Pb7DtOTU8oznDUGYDxNPCa
 aUCOya0DdgjWBkNQXJRdR0JbvDsUOim0XrrATa7Pp3rVZmSsaj4FdNP1rCc/Jham6dEx
 RBxjM1drybZoF0UbaD0eqD0xewCuPnZx3PmIze5iS3QYvFGbSoH6hwaYXBeb6j3+Z9XJ
 C31Q==
X-Gm-Message-State: APjAAAVvJ/seynYS772j9g7IhA7g9q5R4+RHWM3Kq9RuLNv5iuxgTSkj
 GzTgEdWWxlbpCXUFI/PN8yR/dA==
X-Google-Smtp-Source: APXvYqycQHeVv2f79P4vAiHHa3Pb9F7SMzCFxXTSqpZwuyvYWP563v5bjWFJjMgio5zv8hLxW+r38w==
X-Received: by 2002:a17:902:ab89:: with SMTP id
 f9mr3842331plr.295.1572010241727; 
 Fri, 25 Oct 2019 06:30:41 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id p2sm384312pfn.140.2019.10.25.06.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2019 06:30:41 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/6] ASoC: rockchip-max98090: Support usage with and
 without HDMI
Date: Fri, 25 Oct 2019 21:30:03 +0800
Message-Id: <20191025133007.11190-3-cychiang@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191025133007.11190-1-cychiang@chromium.org>
References: <20191025133007.11190-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cSyCYud2FH3n+k9xbUM5DyhXCO7gVkxyPIn3KZPMoVk=;
 b=ALs7cBkQVNo8Fjg8m921Llfxbt4MVCf1rdkYs1AcXTM9C09gmEnNUXT7yWsplEi+Mf
 Fyejp8alA8EbzYFsN56GPkbqtFESHfu6RZQUVFLVTT3/korWMFAnqfvBBovvWHUxiL25
 PgbWjppTeshaG6YvdyZkW8o7x6NOK7A5YAYGI=
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
Cc: Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Jonas Karlman <jonas@kwiboo.se>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, dianders@chromium.org,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgd2lsbCBiZSBtdWx0aXBsZSBib2FyZHMgc2hhcmluZyB0aGlzIG1hY2hpbmUgZHJpdmVy
LgpVc2UgY29tcGF0aWJsZSBzdHJpbmcgdG8gc3BlY2lmeSB0aGUgdXNlIGNhc2UuCgoicm9ja2No
aXAscm9ja2NoaXAtYXVkaW8tbWF4OTgwOTAiIGZvciBtYXg5ODA5MC1vbmx5Lgoicm9ja2NoaXAs
cm9ja2NoaXAtYXVkaW8taGRtaSIgZm9yIEhETUktb25seQoicm9ja2NoaXAscm9ja2NoaXAtYXVk
aW8tbWF4OTgwOTAtaGRtaSIgZm9yIG1heDk4MDkwIHBsdXMKCk1vdmUgdGhlc2UgcHJvcGVydGll
cyB0byBvcHRpb25hbCBiZWNhdXNlIHRoZXkgYXJlIG5vdCBuZWVkZWQgZm9yCkhETUktb25seSB1
c2UgY2FzZS4KInJvY2tjaGlwLGF1ZGlvLWNvZGVjIjogVGhlIHBoYW5kbGUgb2YgdGhlIE1BWDk4
MDkwIGF1ZGlvIGNvZGVjCiJyb2NrY2hpcCxoZWFkc2V0LWNvZGVjIjogVGhlIHBoYW5kbGUgb2Yg
RXh0IGNoaXAgZm9yIGphY2sgZGV0ZWN0aW9uCgpUaGUgbWFjaGluZSBkcml2ZXIgY2hhbmdlIHdp
bGwgYWRkIHN1cHBvcnQgZm9yIEhETUkgY29kZWMgaW4Kcm9ja2NoaXAtbWF4OTgwOTAuCkFkZCBv
bmUgb3B0aW9uYWwgcHJvcGVydHkgInJvY2tjaGlwLGhkbWktY29kZWMiIHRvIGxldCB1c2VyIHNw
ZWNpZnkgSERNSQpkZXZpY2Ugbm9kZSBpbiBEVFMgc28gbWFjaGluZSBkcml2ZXIgY2FuIGZpbmQg
aGRtaS1jb2RlYyBkZXZpY2Ugbm9kZSBmb3IKY29kZWMgREFJLgoKU2lnbmVkLW9mZi1ieTogQ2hl
bmctWWkgQ2hpYW5nIDxjeWNoaWFuZ0BjaHJvbWl1bS5vcmc+Ci0tLQogLi4uL2JpbmRpbmdzL3Nv
dW5kL3JvY2tjaGlwLW1heDk4MDkwLnR4dCAgICAgIHwgMzggKysrKysrKysrKysrKysrKystLQog
MSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3JvY2tjaGlwLW1h
eDk4MDkwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9yb2Nr
Y2hpcC1tYXg5ODA5MC50eHQKaW5kZXggYTgwNWFhOTlhZDc1Li43NWY0Mzg3NDFjYTYgMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9yb2NrY2hpcC1t
YXg5ODA5MC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5k
L3JvY2tjaGlwLW1heDk4MDkwLnR4dApAQCAtMSwxNSArMSwyOSBAQAogUk9DS0NISVAgd2l0aCBN
QVg5ODA5MCBDT0RFQwogCiBSZXF1aXJlZCBwcm9wZXJ0aWVzOgotLSBjb21wYXRpYmxlOiAicm9j
a2NoaXAscm9ja2NoaXAtYXVkaW8tbWF4OTgwOTAiCistIGNvbXBhdGlibGU6IFNldCB0aGlzIHBy
b3BlcnR5IHRvIG9uZSBvZiB0aGUgc3RyaW5ncyBiZWxvdyBkZXBlbmRpbmcgb24gdGhlCisgICAg
ICAgICAgICAgIHVzYWdlIG9uIHRoZSBib2FyZDoKKyAgICAgICAgICAgICAgInJvY2tjaGlwLHJv
Y2tjaGlwLWF1ZGlvLW1heDk4MDkwIiBmb3IgbWF4OTgwOTAtb25seS4KKyAgICAgICAgICAgICAg
InJvY2tjaGlwLHJvY2tjaGlwLWF1ZGlvLWhkbWkiIGZvciBIRE1JLW9ubHkKKyAgICAgICAgICAg
ICAgInJvY2tjaGlwLHJvY2tjaGlwLWF1ZGlvLW1heDk4MDkwLWhkbWkiIGZvciBtYXg5ODA5MCBw
bHVzIEhETUkuCiAtIHJvY2tjaGlwLG1vZGVsOiBUaGUgdXNlci12aXNpYmxlIG5hbWUgb2YgdGhp
cyBzb3VuZCBjb21wbGV4CiAtIHJvY2tjaGlwLGkycy1jb250cm9sbGVyOiBUaGUgcGhhbmRsZSBv
ZiB0aGUgUm9ja2NoaXAgSTJTIGNvbnRyb2xsZXIgdGhhdCdzCiAgIGNvbm5lY3RlZCB0byB0aGUg
Q09ERUMKLS0gcm9ja2NoaXAsYXVkaW8tY29kZWM6IFRoZSBwaGFuZGxlIG9mIHRoZSBNQVg5ODA5
MCBhdWRpbyBjb2RlYwotLSByb2NrY2hpcCxoZWFkc2V0LWNvZGVjOiBUaGUgcGhhbmRsZSBvZiBF
eHQgY2hpcCBmb3IgamFjayBkZXRlY3Rpb24KKworT3B0aW9uYWwgcHJvcGVydGllczoKKy0gcm9j
a2NoaXAsYXVkaW8tY29kZWM6IFRoZSBwaGFuZGxlIG9mIHRoZSBNQVg5ODA5MCBhdWRpbyBjb2Rl
Yy4gVGhpcyBpcworICAgICAgICAgICAgICAgICAgICAgICAgcmVxdWlyZWQgaWYgY29tcGF0aWJs
ZSBzdHJpbmcgaXMgc2V0IHRvIHRoZSBvbmUKKyAgICAgICAgICAgICAgICAgICAgICAgIHdpdGgg
bWF4OTgwOTAuCistIHJvY2tjaGlwLGhlYWRzZXQtY29kZWM6IFRoZSBwaGFuZGxlIG9mIEV4dCBj
aGlwIGZvciBqYWNrIGRldGVjdGlvbi4gVGhpcyBpcworICAgICAgICAgICAgICAgICAgICAgICAg
ICByZXF1aXJlZCBpZiBjb21wYXRpYmxlIHN0cmluZyBpcyBzZXQgdG8gdGhlIG9uZQorICAgICAg
ICAgICAgICAgICAgICAgICAgICB3aXRoIG1heDk4MDkwLgorLSByb2NrY2hpcCxoZG1pLWNvZGVj
OiBUaGUgcGhhbmRsZSBvZiBIRE1JIGRldmljZSBmb3IgSERNSSBjb2RlYy4gVGhpcyBpcworICAg
ICAgICAgICAgICAgICAgICAgICByZXF1aXJlZCBpZiBjb21wYXRpYmxlIHN0cmluZyBpcyBzZXQg
dG8gdGhlIG9uZSB3aXRoCisgICAgICAgICAgICAgICAgICAgICAgIEhETUkuCiAKIEV4YW1wbGU6
CiAKKy8qIEZvciBtYXg5ODA5MC1vbmx5IGJvYXJkLiAqLwogc291bmQgewogCWNvbXBhdGlibGUg
PSAicm9ja2NoaXAscm9ja2NoaXAtYXVkaW8tbWF4OTgwOTAiOwogCXJvY2tjaGlwLG1vZGVsID0g
IlJPQ0tDSElQLUkyUyI7CkBAIC0xNywzICszMSwyMSBAQCBzb3VuZCB7CiAJcm9ja2NoaXAsYXVk
aW8tY29kZWMgPSA8Jm1heDk4MDkwPjsKIAlyb2NrY2hpcCxoZWFkc2V0LWNvZGVjID0gPCZoZWFk
c2V0Y29kZWM+OwogfTsKKworLyogRm9yIEhETUktb25seSBib2FyZC4gKi8KK3NvdW5kIHsKKwlj
b21wYXRpYmxlID0gInJvY2tjaGlwLHJvY2tjaGlwLWF1ZGlvLWhkbWkiOworCXJvY2tjaGlwLG1v
ZGVsID0gIlJPQ0tDSElQLUkyUyI7CisJcm9ja2NoaXAsaTJzLWNvbnRyb2xsZXIgPSA8Jmkycz47
CisJcm9ja2NoaXAsaGRtaS1jb2RlYyA9IDwmaGRtaT47Cit9OworCisvKiBGb3IgbWF4OTgwOTAg
cGx1cyBIRE1JIGJvYXJkLiAqLworc291bmQgeworCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscm9j
a2NoaXAtYXVkaW8tbWF4OTgwOTAtaGRtaSI7CisJcm9ja2NoaXAsbW9kZWwgPSAiUk9DS0NISVAt
STJTIjsKKwlyb2NrY2hpcCxpMnMtY29udHJvbGxlciA9IDwmaTJzPjsKKwlyb2NrY2hpcCxhdWRp
by1jb2RlYyA9IDwmbWF4OTgwOTA+OworCXJvY2tjaGlwLGhlYWRzZXQtY29kZWMgPSA8JmhlYWRz
ZXRjb2RlYz47CisJcm9ja2NoaXAsaGRtaS1jb2RlYyA9IDwmaGRtaT47Cit9OwotLSAKMi4yNC4w
LnJjMC4zMDMuZzk1NGE4NjI2NjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
