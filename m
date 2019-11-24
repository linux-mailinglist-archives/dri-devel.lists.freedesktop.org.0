Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E59110854F
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2019 23:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8505489C6E;
	Sun, 24 Nov 2019 22:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06DE89C6C;
 Sun, 24 Nov 2019 22:24:26 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id q16so1354225plr.10;
 Sun, 24 Nov 2019 14:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VOR++9jxt0Xke/hJnBu2MpDG/X+jsGE0ucu7e62QStY=;
 b=Tynuo7Vsa+6jNMrXsll8M7+pt2wiEYKvwRxnDpaxlHcC3t+2fgskxd9jE2icqW3pdK
 42TnfLL7bOZ0bYMgLio3RlopYACrb8ap7BoeJa04jEFSmfO8SWC//uFvyf2RtrtT81YF
 RfVj5Gdlgqj8AufP2eKgtnV4iIr8XYQSwQQnvke2P+LhlPNMRF4JBbOFUczy6ToA2Je2
 WsP4TG9NjkSVpxj9CeSzwlYkP8Xvc7kbhNT6dBktq2wmo0Eh1t9vpK3P1wc+EhIb2awh
 G7P4qspI0gvG9QfqSseNbNRafA3MeG2nrigkbmcKaO3EgBH1icw4X1ghkQPo+55QiGca
 0i6Q==
X-Gm-Message-State: APjAAAViOT2TvcoWhjhb9ykrac7y44OJyra855bgc0hfQKRDQHiLfTX2
 AWObpr7VbKJWJfojUTvWsR8LNO45pfQ=
X-Google-Smtp-Source: APXvYqyRMQ/Bi/6tjprki/8e3yGWNZRWTWDaCm+BvjhNsnsGkCUH/UWfYSoAeUwQT4JD8iYH+pvHwA==
X-Received: by 2002:a17:902:6e02:: with SMTP id
 u2mr25753923plk.234.1574634265930; 
 Sun, 24 Nov 2019 14:24:25 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 f13sm5597256pfa.57.2019.11.24.14.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2019 14:24:25 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/adreno: fix zap vs no-zap handling
Date: Sun, 24 Nov 2019 14:23:38 -0800
Message-Id: <20191124222348.1467743-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VOR++9jxt0Xke/hJnBu2MpDG/X+jsGE0ucu7e62QStY=;
 b=h0K2e9zp0gcGbDhBn2OYgjsawFE+NDpg7CKSb3AdhJImGEq6U9p363kULdcCEVfd4p
 +8pPw8NHkFC4/s072mCIzhBtn77xrwoYFZ19sEhtm5cOI119XJqIPo0WipcXkP3XVSYr
 v7E4csN6LVNwqRt9RKc779d2EVntclLJuwVj7LF3PXsy7l8huvM+xugnd+qics8JF6o2
 4RzXMxBR/OWbPHLdprCLkYPr0VTA9Pp8oyb4ATUuG76uBa3yJoxdENgicpYTrwLFhr12
 UT6W3cJVdD/iI2qL9vhsx/O2kiXnME4mu8V8fA1zsdh8QirjYEXNTJsXdc9jGbbUgx/u
 4Myg==
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Mamta Shukla <mamtashukla555@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 Wen Yang <wen.yang99@zte.com.cn>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKV2UgY2FuIGhhdmUgdHdv
IGNhc2VzLCB3aGVuIGl0IGNvbWVzIHRvICJ6YXAiIGZ3LiAgRWl0aGVyIHRoZSBmdwpyZXF1aXJl
cyB6YXAgZncgdG8gdGFrZSB0aGUgR1BVIG91dCBvZiBzZWN1cmUgbW9kZSBhdCBib290LCBvciBp
dCBkb2VzCm5vdCBhbmQgd2UgY2FuIHdyaXRlIFJCQk1fU0VDVklEX1RSVVNUX0NOVEwgZGlyZWN0
bHkuICBQcmV2aW91c2x5IHdlCmRlY2lkZWQgYmFzZWQgb24gd2hldGhlciB6YXAgZncgbG9hZCBz
dWNjZWVkZWQsIGJ1dCB0aGlzIGlzIG5vdCBhIGdyZWF0CnBsYW4gYmVjYXVzZToKCjEpIHdlIGNv
dWxkIGhhdmUgemFwIGZ3IGluIHRoZSBmaWxlc3lzdGVtIG9uIGEgZGV2aWNlIHdoZXJlIGl0IGlz
IG5vdAogICByZXF1aXJlZAoyKSB3ZSBjb3VsZCBoYXZlIHRoZSBpbnZlcnNlIGNhc2UKCkluc3Rl
YWQsIHNoaWZ0IHRvIGRlY2lkaW5nIGJhc2VkIG9uIHdoZXRoZXIgd2UgaGF2ZSBhICd6YXAtc2hh
ZGVyJyBub2RlCmluIGR0LiAgSW4gcHJhY3RpY2UsIHRoZXJlIGlzIG9ubHkgb25lIGRldmljZSAo
Y3VycmVudGx5KSB3aXRoIHVwc3RyZWFtCmR0IHRoYXQgZG9lcyBub3QgdXNlIHphcCAoY2hlemEp
LCBhbmQgaXQgYWxyZWFkeSBoYXMgYSAvZGVsZXRlLW5vZGUvIGZvcgp0aGUgemFwLXNoYWRlciBu
b2RlLgoKRml4ZXM6IGFiY2NiOWZlMzI2NyAoImRybS9tc20vYTZ4eDogQWRkIHphcCBzaGFkZXIg
bG9hZCIpClNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jIHwgMTEgKysrKysrKysr
LS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMgfCAxMSArKysrKysrKyst
LQogMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jCmluZGV4IGIwMmUyMDQyNTQ3Zi4uN2Q5ZTYz
ZTIwZGVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMKQEAgLTc1MywxMSAr
NzUzLDE4IEBAIHN0YXRpYyBpbnQgYTV4eF9od19pbml0KHN0cnVjdCBtc21fZ3B1ICpncHUpCiAJ
CWdwdS0+ZnVuY3MtPmZsdXNoKGdwdSwgZ3B1LT5yYlswXSk7CiAJCWlmICghYTV4eF9pZGxlKGdw
dSwgZ3B1LT5yYlswXSkpCiAJCQlyZXR1cm4gLUVJTlZBTDsKLQl9IGVsc2UgewotCQkvKiBQcmlu
dCBhIHdhcm5pbmcgc28gaWYgd2UgZGllLCB3ZSBrbm93IHdoeSAqLworCX0gZWxzZSBpZiAocmV0
ID09IC1FTk9ERVYpIHsKKwkJLyoKKwkJICogVGhpcyBkZXZpY2UgZG9lcyBub3QgdXNlIHphcCBz
aGFkZXIgKGJ1dCBwcmludCBhIHdhcm5pbmcKKwkJICoganVzdCBpbiBjYXNlIHNvbWVvbmUgZ290
IHRoZWlyIGR0IHdyb25nLi4gaG9wZWZ1bGx5IHRoZXkKKwkJICogaGF2ZSBhIGRlYnVnIFVBUlQg
dG8gcmVhbGl6ZSB0aGUgZXJyb3Igb2YgdGhlaXIgd2F5cy4uLgorCQkgKiBpZiB5b3UgbWVzcyB0
aGlzIHVwIHlvdSBhcmUgYWJvdXQgdG8gY3Jhc2ggaG9ycmlibHkpCisJCSAqLwogCQlkZXZfd2Fy
bl9vbmNlKGdwdS0+ZGV2LT5kZXYsCiAJCQkiWmFwIHNoYWRlciBub3QgZW5hYmxlZCAtIHVzaW5n
IFNFQ1ZJRF9UUlVTVF9DTlRMIGluc3RlYWRcbiIpOwogCQlncHVfd3JpdGUoZ3B1LCBSRUdfQTVY
WF9SQkJNX1NFQ1ZJRF9UUlVTVF9DTlRMLCAweDApOworCX0gZWxzZSB7CisJCXJldHVybiByZXQ7
CiAJfQogCiAJLyogTGFzdCBzdGVwIC0geWllbGQgdGhlIHJpbmdidWZmZXIgKi8KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jCmluZGV4IGRjOGVjMmM5NDMwMS4uNjg2YzM0ZDcwNmIw
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMKQEAgLTUzNywxMiArNTM3LDE5
IEBAIHN0YXRpYyBpbnQgYTZ4eF9od19pbml0KHN0cnVjdCBtc21fZ3B1ICpncHUpCiAJCWE2eHhf
Zmx1c2goZ3B1LCBncHUtPnJiWzBdKTsKIAkJaWYgKCFhNnh4X2lkbGUoZ3B1LCBncHUtPnJiWzBd
KSkKIAkJCXJldHVybiAtRUlOVkFMOwotCX0gZWxzZSB7Ci0JCS8qIFByaW50IGEgd2FybmluZyBz
byBpZiB3ZSBkaWUsIHdlIGtub3cgd2h5ICovCisJfSBlbHNlIGlmIChyZXQgPT0gLUVOT0RFVikg
eworCQkvKgorCQkgKiBUaGlzIGRldmljZSBkb2VzIG5vdCB1c2UgemFwIHNoYWRlciAoYnV0IHBy
aW50IGEgd2FybmluZworCQkgKiBqdXN0IGluIGNhc2Ugc29tZW9uZSBnb3QgdGhlaXIgZHQgd3Jv
bmcuLiBob3BlZnVsbHkgdGhleQorCQkgKiBoYXZlIGEgZGVidWcgVUFSVCB0byByZWFsaXplIHRo
ZSBlcnJvciBvZiB0aGVpciB3YXlzLi4uCisJCSAqIGlmIHlvdSBtZXNzIHRoaXMgdXAgeW91IGFy
ZSBhYm91dCB0byBjcmFzaCBob3JyaWJseSkKKwkJICovCiAJCWRldl93YXJuX29uY2UoZ3B1LT5k
ZXYtPmRldiwKIAkJCSJaYXAgc2hhZGVyIG5vdCBlbmFibGVkIC0gdXNpbmcgU0VDVklEX1RSVVNU
X0NOVEwgaW5zdGVhZFxuIik7CiAJCWdwdV93cml0ZShncHUsIFJFR19BNlhYX1JCQk1fU0VDVklE
X1RSVVNUX0NOVEwsIDB4MCk7CiAJCXJldCA9IDA7CisJfSBlbHNlIHsKKwkJcmV0dXJuIHJldDsK
IAl9CiAKIG91dDoKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
