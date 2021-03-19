Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14E234174A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 09:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55B76E42C;
	Fri, 19 Mar 2021 08:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415616E9A0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:37 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id k10so8282964ejg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tzEMJM+UnGpLFsbT1tH5hiSu2fCp7n+uz2nhd5JCrjs=;
 b=wuUIEt9Eb7tXET8ysN8MWKyhOlYTDtF2sT/pFKk4bEjMdmgQe3QrM5PtVeePf9VKxv
 bYk8Z1hyKHpr/dIq6aNjj/2qL6KumKX3UNjpAfttT4dbl1hEQNWL3r35FbFteiKOoahb
 Fj/K9NgcY2jXP309QwCGjWABQI0d7DtEwHzkvnSQzcqncHqH70hPsF8Xj+qC+D6fJgM8
 1nr/4c8N4MfdzX7cz0AKtKuNA0EKgd+nDspaYbHK+Yd6VlpfW78vUh9LIRU5E6D7cl/3
 Ide+6975i2RIBuwjm+gNn4UMbvtwE+17pzzrCQ+xXgomc8HdVMmzWHJ5bG7oo+55YOWq
 1McQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tzEMJM+UnGpLFsbT1tH5hiSu2fCp7n+uz2nhd5JCrjs=;
 b=sZEq2wIl7xjmMUeUixcn1pMwHiNdiC6v9OjwmvR4g4igrm/jc7BAhUB0zMAQPkVEq1
 wzJf3wX1UaUgGzAPJi6dcvzPgJjyyPNGW8ujEvFQY0cv2WyWHtEi8G2psbmUsAgZQ4o6
 /bacDRHvTHkZPjH2Jttxses0iz7/H3KUrePg0lkcp/tmhEEgYoi0PXmFgi8Ry7VJ91Rz
 FgpIL702L8KyEdR1M0PmejrzIPlophymQnkde5IigQ8ipNCv+COTV4SPHT6JB/T0pz60
 ijdWBcL3ikkoNnAFtmT4JGwWCmbKdoiVL/I72jIKjjdTwJlGGRfC7k2ziaYps5EVY5G5
 zYbw==
X-Gm-Message-State: AOAM532gL1cUsE7UqVi3XT5tnkUJklCt1qPP2/02DUC4ZYZrcv4S1chr
 EfEnBV5xHaCMtu2lGF3HLKj4bw==
X-Google-Smtp-Source: ABdhPJxddfQO8CVFdXm0TZLoP3CbqNK6wuevakzop58iNsun4eTPRCFzfjR55l4dbd1pNyPemNR93Q==
X-Received: by 2002:a17:907:76c7:: with SMTP id
 kf7mr2948887ejc.470.1616142275944; 
 Fri, 19 Mar 2021 01:24:35 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:35 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/19] include: drm: drm_atomic: Make use of 'new_plane_state'
Date: Fri, 19 Mar 2021 08:24:13 +0000
Message-Id: <20210319082428.3294591-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIG1hY3JvIGZvcl9lYWNoX29sZG5ld19wbGFuZV9pbl9zdGF0ZSgpICduZXdfcGxhbmVf
c3RhdGUnIGlzIHByb3ZpZGVkCmFzIGEgY29udGFpbmVyIGZvciBzdGF0ZS0+cGxhbmVzW2ldLm5l
d19zdGF0ZSwgYnV0IGlzIG5vdCB1dGlsaXNlZCBpbgpzb21lIHVzZS1jYXNlcywgc28gd2UgZmFr
ZS11c2UgaXQgaW5zdGVhZC4KCkZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jOiBJbiBmdW5jdGlvbiDigJhhbWRncHVfZG1fY29tbWl0X2N1cnNvcnPi
gJk6CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYzo3NjQ5OjQ0OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhuZXdfcGxhbmVfc3RhdGXigJkg
c2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkNjOiBNYWFydGVu
IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1l
IFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0Bn
bWFpbC5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYt
Ynk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogaW5jbHVkZS9kcm0vZHJt
X2F0b21pYy5oIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fYXRvbWljLmggYi9pbmNsdWRl
L2RybS9kcm1fYXRvbWljLmgKaW5kZXggYWM1YTI4ZWZmMmM4Ni4uMjU5ZTY5NzBkYzgzNiAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9h
dG9taWMuaApAQCAtODcxLDcgKzg3MSw4IEBAIHZvaWQgZHJtX3N0YXRlX2R1bXAoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9wcmludGVyICpwKTsKIAkJCSAgICAgKChwbGFuZSkg
PSAoX19zdGF0ZSktPnBsYW5lc1tfX2ldLnB0ciwJXAogCQkJICAgICAgKHZvaWQpKHBsYW5lKSAv
KiBPbmx5IHRvIGF2b2lkIHVudXNlZC1idXQtc2V0LXZhcmlhYmxlIHdhcm5pbmcgKi8sIFwKIAkJ
CSAgICAgIChvbGRfcGxhbmVfc3RhdGUpID0gKF9fc3RhdGUpLT5wbGFuZXNbX19pXS5vbGRfc3Rh
dGUsXAotCQkJICAgICAgKG5ld19wbGFuZV9zdGF0ZSkgPSAoX19zdGF0ZSktPnBsYW5lc1tfX2ld
Lm5ld19zdGF0ZSwgMSkpCisJCQkgICAgICAobmV3X3BsYW5lX3N0YXRlKSA9IChfX3N0YXRlKS0+
cGxhbmVzW19faV0ubmV3X3N0YXRlLCBcCisJCQkgICAgICAodm9pZCkobmV3X3BsYW5lX3N0YXRl
KSAvKiBPbmx5IHRvIGF2b2lkIHVudXNlZC1idXQtc2V0LXZhcmlhYmxlIHdhcm5pbmcgKi8sIDEp
KQogCiAvKioKICAqIGZvcl9lYWNoX29sZG5ld19wbGFuZV9pbl9zdGF0ZV9yZXZlcnNlIC0gaXRl
cmF0ZSBvdmVyIGFsbCBwbGFuZXMgaW4gYW4gYXRvbWljCi0tIAoyLjI3LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
