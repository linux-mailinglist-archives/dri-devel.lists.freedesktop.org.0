Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B584339D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A309489491;
	Thu, 13 Jun 2019 07:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3645892D8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:33:06 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id j2so9221289pfe.6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3eDYtx1SaX5ezeZL1yvMz2TA5bp73da63R7mtvE27ww=;
 b=fRTLhYG922rfJPNzjD2bGk1a2yyYPBuoGW+w8ZJvBM4CzOE0UaiCMm+qmn7YjzFSTL
 4jUAKPyasDacZnslOCmOdo0M/1SIpeiq/nD16vct66oXWFL0t+COD+h6/bdDVsnW8/VP
 Puag3edj1xtkg+vSRBYrrv67XGCUMJRWdmsbhguKQ1t0FLZaeARDyaeVYNCX6N41Fu6t
 ZZTKpigqF2tHjxPqBa1C59YCmi+nsJfnQ5snGMfy9Ama314FI5Tj8uPq0qh8JAET5TnZ
 mgLU0MJ2eMTTIJAg5MII1xGUpUPvIfDz/53jQdMYh3CmYObdTt/lird/Zm+UXbnD5EtK
 vK0A==
X-Gm-Message-State: APjAAAWpb8iRe5yVMIihX5glYCEDhzY4RnTLYMJseKBqhzTfY3npgtra
 24HTHVsRSuXUmTGpRv+FUrLDPflSJho=
X-Google-Smtp-Source: APXvYqylQdbs0qQNgPb6HfID161kQnJwYcxMWF/6k7/7L7g/NgRCf/rN0DEA4HcGT3+xR/9GdiUM+w==
X-Received: by 2002:a17:90a:ad41:: with SMTP id
 w1mr31232310pjv.52.1560328385785; 
 Wed, 12 Jun 2019 01:33:05 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d21sm18845991pfr.162.2019.06.12.01.33.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 01:33:05 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 01/15] drm/bridge: tc358767: Simplify tc_poll_timeout()
Date: Wed, 12 Jun 2019 01:32:38 -0700
Message-Id: <20190612083252.15321-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612083252.15321-1-andrew.smirnov@gmail.com>
References: <20190612083252.15321-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3eDYtx1SaX5ezeZL1yvMz2TA5bp73da63R7mtvE27ww=;
 b=Qk1R7MqZa9Gr9tjkCwl11RalVFSB915VNouBPrvwfBO9lorQBbp7X8Jyd7aga+98Rl
 FihMvVAZ8/EgFppumiMRcEQOdszZMnsM7re1t8uMnibI8np0u0Ydu8U74WWnwVUT7wXN
 AqVAf+cQdLwcy3UGMuga4TH5Fx3iWaA3KOKXPtlAYTdH1ng3iI+hAdHIEFotqb76HTJg
 yHnaoqMiTpAEpvppbim/2mKz8Xss5BrdGX8y74VPTi26CkqWljTS8aCH+Jul13rGjLd3
 zP+W3p5eMiEMWjqVbyfmLzQmVd6cVYHQAUmkpSYxS2QiU18Hxy6bzHflTAibffmeJ/BW
 lt9g==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW1wbGVtZW50YXRpb24gb2YgdGNfcG9sbF90aW1lb3V0KCkgaXMgYWxtb3N0IGEgMTAwJSBjb3B5
LWFuZC1wYXN0ZSBvZgp0aGUgY29kZSBmb3IgcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0KCkuIFJl
cGxhY2UgY29waWVkIGNvZGUgd2l0aCBhCmNhbGwgdG8gdGhlIG9yaWdpbmFsLiBXaGlsZSBhdCBp
dCBjaGFuZ2UgdGNfcG9sbF90aW1lb3V0IHRvIGFjY2VwdAoic3RydWN0IHRjX2RhdGEgKiIgaW5z
dGVhZCBvZiAic3RydWN0IHJlZ21hcCAqIiBmb3IgYnJldml0eS4gTm8KZnVuY3Rpb25hbCBjaGFu
Z2UgaW50ZW5kZWQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgU21pcm5vdiA8YW5kcmV3LnNtaXJu
b3ZAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5n
LmNvbT4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbT4KQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CkNj
OiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNj
OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpDYzogQW5kcmV5IEd1c2Fr
b3YgPGFuZHJleS5ndXNha292QGNvZ2VudGVtYmVkZGVkLmNvbT4KQ2M6IFBoaWxpcHAgWmFiZWwg
PHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CkNjOiBDb3J5IFR1c2FyIDxjb3J5LnR1c2FyQHppaS5h
ZXJvPgpDYzogQ2hyaXMgSGVhbHkgPGNwaGVhbHlAZ21haWwuY29tPgpDYzogTHVjYXMgU3RhY2gg
PGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS90YzM1ODc2Ny5jIHwgMjYgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGMzNTg3NjcuYwppbmRleCA1OGUzY2EwZTI1YWYuLmZiOGExOTQyZWM1NCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtMjY0LDM0ICsyNjQsMjEgQEAgc3RhdGljIGlubGluZSBz
dHJ1Y3QgdGNfZGF0YSAqY29ubmVjdG9yX3RvX3RjKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjKQog
CQkJZ290byBlcnI7CQkJCVwKIAl9IHdoaWxlICgwKQogCi1zdGF0aWMgaW5saW5lIGludCB0Y19w
b2xsX3RpbWVvdXQoc3RydWN0IHJlZ21hcCAqbWFwLCB1bnNpZ25lZCBpbnQgYWRkciwKK3N0YXRp
YyBpbmxpbmUgaW50IHRjX3BvbGxfdGltZW91dChzdHJ1Y3QgdGNfZGF0YSAqdGMsIHVuc2lnbmVk
IGludCBhZGRyLAogCQkJCSAgdW5zaWduZWQgaW50IGNvbmRfbWFzaywKIAkJCQkgIHVuc2lnbmVk
IGludCBjb25kX3ZhbHVlLAogCQkJCSAgdW5zaWduZWQgbG9uZyBzbGVlcF91cywgdTY0IHRpbWVv
dXRfdXMpCiB7Ci0Ja3RpbWVfdCB0aW1lb3V0ID0ga3RpbWVfYWRkX3VzKGt0aW1lX2dldCgpLCB0
aW1lb3V0X3VzKTsKIAl1bnNpZ25lZCBpbnQgdmFsOwotCWludCByZXQ7CiAKLQlmb3IgKDs7KSB7
Ci0JCXJldCA9IHJlZ21hcF9yZWFkKG1hcCwgYWRkciwgJnZhbCk7Ci0JCWlmIChyZXQpCi0JCQli
cmVhazsKLQkJaWYgKCh2YWwgJiBjb25kX21hc2spID09IGNvbmRfdmFsdWUpCi0JCQlicmVhazsK
LQkJaWYgKHRpbWVvdXRfdXMgJiYga3RpbWVfY29tcGFyZShrdGltZV9nZXQoKSwgdGltZW91dCkg
PiAwKSB7Ci0JCQlyZXQgPSByZWdtYXBfcmVhZChtYXAsIGFkZHIsICZ2YWwpOwotCQkJYnJlYWs7
Ci0JCX0KLQkJaWYgKHNsZWVwX3VzKQotCQkJdXNsZWVwX3JhbmdlKChzbGVlcF91cyA+PiAyKSAr
IDEsIHNsZWVwX3VzKTsKLQl9Ci0JcmV0dXJuIHJldCA/OiAoKCh2YWwgJiBjb25kX21hc2spID09
IGNvbmRfdmFsdWUpID8gMCA6IC1FVElNRURPVVQpOworCXJldHVybiByZWdtYXBfcmVhZF9wb2xs
X3RpbWVvdXQodGMtPnJlZ21hcCwgYWRkciwgdmFsLAorCQkJCQkodmFsICYgY29uZF9tYXNrKSA9
PSBjb25kX3ZhbHVlLAorCQkJCQlzbGVlcF91cywgdGltZW91dF91cyk7CiB9CiAKIHN0YXRpYyBp
bnQgdGNfYXV4X3dhaXRfYnVzeShzdHJ1Y3QgdGNfZGF0YSAqdGMsIHVuc2lnbmVkIGludCB0aW1l
b3V0X21zKQogewotCXJldHVybiB0Y19wb2xsX3RpbWVvdXQodGMtPnJlZ21hcCwgRFAwX0FVWFNU
QVRVUywgQVVYX0JVU1ksIDAsCisJcmV0dXJuIHRjX3BvbGxfdGltZW91dCh0YywgRFAwX0FVWFNU
QVRVUywgQVVYX0JVU1ksIDAsCiAJCQkgICAgICAgMTAwMCwgMTAwMCAqIHRpbWVvdXRfbXMpOwog
fQogCkBAIC01OTgsOCArNTg1LDcgQEAgc3RhdGljIGludCB0Y19hdXhfbGlua19zZXR1cChzdHJ1
Y3QgdGNfZGF0YSAqdGMpCiAJdGNfd3JpdGUoRFAxX1BMTENUUkwsIFBMTFVQREFURSB8IFBMTEVO
KTsKIAl0Y193YWl0X3BsbF9sb2NrKHRjKTsKIAotCXJldCA9IHRjX3BvbGxfdGltZW91dCh0Yy0+
cmVnbWFwLCBEUF9QSFlfQ1RSTCwgUEhZX1JEWSwgUEhZX1JEWSwgMSwKLQkJCSAgICAgIDEwMDAp
OworCXJldCA9IHRjX3BvbGxfdGltZW91dCh0YywgRFBfUEhZX0NUUkwsIFBIWV9SRFksIFBIWV9S
RFksIDEsIDEwMDApOwogCWlmIChyZXQgPT0gLUVUSU1FRE9VVCkgewogCQlkZXZfZXJyKHRjLT5k
ZXYsICJUaW1lb3V0IHdhaXRpbmcgZm9yIFBIWSB0byBiZWNvbWUgcmVhZHkiKTsKIAkJcmV0dXJu
IHJldDsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
