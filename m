Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040E632B81C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F066E869;
	Wed,  3 Mar 2021 13:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BA86E86D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:35 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id i9so5240226wml.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sSYYF9avR+ibuwGTDH+u4wL/4B2uArbe+K5Pi6OSJeE=;
 b=ycKjNwxVRbCbFBAENcOkX967iuzNILRBy64Agv/v6AoZsMb6fh2R8wRdvYyJH6Cj2D
 TgcS8VnsiDfrUZ4+cXJGZ7euWyTdOdLNdKMr+YOK635Vr7OgrzD4hBE02dgD7nopt4ZM
 w0Lut7zaa1OSOrPr2NtQ7k3kyGq7LnzgpWxg/3jlkxOLCPITPG/yUPcRKl6OLgvuy9yI
 AMlLutx1kgcc7QtPN/Xk2FNrgBpBoYKNVwWWNI0+HI/7NtZ9Vvkzae0XtKZKuVpk3BQ5
 fDtXc95a7S4ZQr7B2TODC9Z/hm0uLpjbMGGrYxonprBaU5PcGThm2OYN0sDp65mrMGI5
 7v2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sSYYF9avR+ibuwGTDH+u4wL/4B2uArbe+K5Pi6OSJeE=;
 b=SszQzcdIK0RysD1Uc6E+OLrG/6q/aN64IXML0n2x+sjPmZ0CW+cs9rUQPrjccccoWR
 q38kpjswDVsgr9Utzcj2Y/Pbs8Cdow51hOe77ZJHjcPppbvQrNF1bmwmNYoTMVQv2XoX
 G5ty6ufU3VFIHMSgWDtpd3f8sAlGuy+j7JMCE0/n9QA33CK2LCBJAA3swG/6X0XaCb4m
 HTC4Glidocz9bvB0taf3+o0V6YF/W1WPodYnTzCOsTGoUEz67DTdQ6BwKYF7i7yZna0N
 WrOCP7sdYCjvzL2RgBf2hHK4CyrSNnURb5XmooHOE4v+UhcxPIyLkEvS9zIJEIFJpIH4
 BXhg==
X-Gm-Message-State: AOAM530O5S+VMdfy4hBZ+Rg7kVti1do2+fXYr1oAzULCg1apGuMVucv9
 nVsx5NR+vun6FDFjgIJj1o6Zjw==
X-Google-Smtp-Source: ABdhPJwiGxjArDO8rR5idnJXWqI7FvnqHY0aib4SalTLxl3V/8oEa/eGolnFiAQ3rvhsAU4vK+Y5xw==
X-Received: by 2002:a1c:68c5:: with SMTP id d188mr8916602wmc.119.1614779014483; 
 Wed, 03 Mar 2021 05:43:34 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:34 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/53] include: drm: drm_atomic: Make use of 'new_plane_state'
Date: Wed,  3 Mar 2021 13:42:31 +0000
Message-Id: <20210303134319.3160762-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
L2RybS9kcm1fYXRvbWljLmgKaW5kZXggY2U3MDIzZTkxMTVkNy4uYTcxYzE5ZTFkNzg1YyAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9h
dG9taWMuaApAQCAtODY3LDcgKzg2Nyw4IEBAIHZvaWQgZHJtX3N0YXRlX2R1bXAoc3RydWN0IGRy
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
