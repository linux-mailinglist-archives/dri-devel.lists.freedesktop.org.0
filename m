Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA642EF8AE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250526E8CE;
	Fri,  8 Jan 2021 20:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB256E8D8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:35 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id c5so10131203wrp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5gaclGYPTxeR7WBpYSGtVJvFJoT+8qY5x3DkdzDetH8=;
 b=SqJbv6z/H/h280tKiGBaUND1On2N5BCO4srcqVAHaTgcNtV7jTozwCRnj4CHVMkOUa
 hwMmdG80+qYFg7oT+DYhrpWzZ2CifvdrKfhMenuiFXpC0TyuJfb2jTby9FLrOF7E6E9d
 r4OIe6PSFoLIJvJKD14l8vN2kr3wcW6855SxatxD7IgJmsrcUPMCL3pA/qshHfneN1b2
 gqJK74bskfTblQATgZFm7+u6+PvytMZNaEh6y5TrI1If+L63a3PCQeByFRzEunJz/lud
 DjKVXydiJxhmQDCkT8dz8+SUfLB66A2MrIrPEVIMwREIctYSfOqDT445cHOLpewGSEML
 7zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5gaclGYPTxeR7WBpYSGtVJvFJoT+8qY5x3DkdzDetH8=;
 b=n5q0AR5mtxVHwblm1G+3jN3xhGTUeQN8ZsR2ZPu++0EOYmseZt8zwQ9xUG7gDHkf2j
 sAyATRTzTuKT526s0DAUhZMQu0vvJEUVyJz1rRHhaXe3JcGGRnkU+nvCujiQmYBkS3hK
 QT9EtCEU9CmjLNqo7FXfGd7t7PdCOWjiUNrA07INQIgvv50dX3+ziPQhEPs4HuSnqGj6
 TincL5WDGr1UsjjKusTBW2ImT/wfK+WoVWMXBL22CN8+lgIgU3Zw/D/K3yTow9YJJJ06
 WJPIn8IyNoop+I4512vlLJfmO+iqfYLw2NtkD07kNj6AWanGLVFHEdA7kddG+Ga9pV+h
 1WoA==
X-Gm-Message-State: AOAM533V86lyE26RRs4tnz+J4yXP/Je9daxgVBR/7yLD/pM0jCQXdhOn
 SeBUyfNz9qQVd9sltS+fXb3ljQ==
X-Google-Smtp-Source: ABdhPJzEqhllmXRVkRE8iaa+TVUusuA+KYsBX48+tvXKZIyZNOrHPERzAqkiKUo+xHHNAxEb+ajuVA==
X-Received: by 2002:adf:e512:: with SMTP id j18mr5227504wrm.52.1610136933894; 
 Fri, 08 Jan 2021 12:15:33 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:33 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 20/40] include: drm: drm_atomic: Make use of 'new_plane_state'
Date: Fri,  8 Jan 2021 20:14:37 +0000
Message-Id: <20210108201457.3078600-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
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
L2RybS9kcm1fYXRvbWljLmgKaW5kZXggNTRlMDUxYTk1N2RmYy4uODY2ZGFiYTRjNGE1NSAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9h
dG9taWMuaApAQCAtODQ3LDcgKzg0Nyw4IEBAIHZvaWQgZHJtX3N0YXRlX2R1bXAoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9wcmludGVyICpwKTsKIAkJCSAgICAgKChwbGFuZSkg
PSAoX19zdGF0ZSktPnBsYW5lc1tfX2ldLnB0ciwJXAogCQkJICAgICAgKHZvaWQpKHBsYW5lKSAv
KiBPbmx5IHRvIGF2b2lkIHVudXNlZC1idXQtc2V0LXZhcmlhYmxlIHdhcm5pbmcgKi8sIFwKIAkJ
CSAgICAgIChvbGRfcGxhbmVfc3RhdGUpID0gKF9fc3RhdGUpLT5wbGFuZXNbX19pXS5vbGRfc3Rh
dGUsXAotCQkJICAgICAgKG5ld19wbGFuZV9zdGF0ZSkgPSAoX19zdGF0ZSktPnBsYW5lc1tfX2ld
Lm5ld19zdGF0ZSwgMSkpCisJCQkgICAgICAobmV3X3BsYW5lX3N0YXRlKSA9IChfX3N0YXRlKS0+
cGxhbmVzW19faV0ubmV3X3N0YXRlLCBcCisJCQkgICAgICAodm9pZCkobmV3X3BsYW5lX3N0YXRl
KSAvKiBPbmx5IHRvIGF2b2lkIHVudXNlZC1idXQtc2V0LXZhcmlhYmxlIHdhcm5pbmcgKi8sIDEp
KQogCiAvKioKICAqIGZvcl9lYWNoX29sZG5ld19wbGFuZV9pbl9zdGF0ZV9yZXZlcnNlIC0gaXRl
cmF0ZSBvdmVyIGFsbCBwbGFuZXMgaW4gYW4gYXRvbWljCi0tIAoyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
