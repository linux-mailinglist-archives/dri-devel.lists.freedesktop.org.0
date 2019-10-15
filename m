Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A848DD78A8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 16:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11536E824;
	Tue, 15 Oct 2019 14:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915666E817
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:35:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m18so20547369wmc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 07:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CXvKMAb1PhFBcChO2bZh6JNurCRxDlwtOcjKPIDc0gA=;
 b=dAaA9XkK3mYT+1vCU6Q08QvCTBHqrm/edwaeSuYZEklRn4HzgML6+zdFW2hIUWYTmk
 tWg8Qycrrau6NvFmKmCb8pQkF5Yj0LC5CM2Vkq0XppgJSc5PwJpTlZVnPx1ynN42t383
 Mw6xBmz3W+YMHl3vxwSA2nPsdcYiOy2XUnF5SAgmCH4R9iOF/M3zV0jVpHfzP46jwv+z
 VL6bZHD5RZqCPjfH8BYqBWfJuQ3aX7f/0U5VJcoQeCD+Z7n+K2k+6iq5fn1LSOEAux6b
 4MFGwvbJmqbziN+d8ykHLMFMHuDzy+Udm1D3j+wLQ2rdC0s585fV0ykxmNLBlps5DGo2
 nS9w==
X-Gm-Message-State: APjAAAUoJfFY8rwv7DAfShZ+Th/Sg4cPZhFFtrbgwivCc03tJ20En4e/
 vLxZo/XH2FrYrU5UlnX/1Y3lEO8Z
X-Google-Smtp-Source: APXvYqw+uxnGaS8N/3oE6j4E8AUQR4niWdsqKWbTgHcxMxkHu7h/z/L7bL1Ug8P6e673LrZeVYTIrg==
X-Received: by 2002:a1c:a9d5:: with SMTP id s204mr20505626wme.14.1571150120080; 
 Tue, 15 Oct 2019 07:35:20 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id b130sm34097420wmh.12.2019.10.15.07.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 07:35:18 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/15] drm/dp: Add drm_dp_fast_training_cap() helper
Date: Tue, 15 Oct 2019 16:34:57 +0200
Message-Id: <20191015143509.1104985-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015143509.1104985-1-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CXvKMAb1PhFBcChO2bZh6JNurCRxDlwtOcjKPIDc0gA=;
 b=pBJo9JLelvgi0/0+jq/v/snNuwk6rytrjXq8Y17EVYKjN8iz2OVC0W8guxxCI17DbW
 TQE7iPsJbpPc6Oml6kI6a/DxkZoUvCrg5yncQdcmnm2ZCM1V9XhF3SPl+LQNxGsanDNj
 7lq+FlEO2xG+lxUOTHC0vx4YgsntbN5aBIJFtiruFbyjsg7F5Gq59w/nxseStx0uDbXW
 OcuX0344rDY1P75pvZCFG8vmFVr9hhLkZP35DEITdUs/RTWTJ9tAggO09++delmfn+8u
 S7nglyBGtnuWDSBI8ugV6AICEgjDQ3GQMThhthkbikXDCx8q7zqwEwkqZVjm6RQ0qkrC
 LmYA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkFkZCBhIGhlbHBlciB0
aGF0IGNoZWNrcyBmb3IgdGhlIGZhc3QgdHJhaW5pbmcgY2FwYWJpbGl0eSBnaXZlbiB0aGUgRFBD
RApyZWNlaXZlciBjYXBhYmlsaXRpZXMgYmxvYi4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVk
aW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5o
IHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBl
ci5oCmluZGV4IDUyZmYxZjI0YTI0ZC4uZGVmM2IzYTU0M2EyIDEwMDY0NAotLS0gYS9pbmNsdWRl
L2RybS9kcm1fZHBfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCkBA
IC0xMjExLDYgKzEyMTEsMTMgQEAgZHJtX2RwX2VuaGFuY2VkX2ZyYW1lX2NhcChjb25zdCB1OCBk
cGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKIAkJKGRwY2RbRFBfTUFYX0xBTkVfQ09VTlRdICYg
RFBfRU5IQU5DRURfRlJBTUVfQ0FQKTsKIH0KIAorc3RhdGljIGlubGluZSBib29sCitkcm1fZHBf
ZmFzdF90cmFpbmluZ19jYXAoY29uc3QgdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0pCit7
CisJcmV0dXJuIGRwY2RbRFBfRFBDRF9SRVZdID49IDB4MTEgJiYKKwkJKGRwY2RbRFBfTUFYX0RP
V05TUFJFQURdICYgRFBfTk9fQVVYX0hBTkRTSEFLRV9MSU5LX1RSQUlOSU5HKTsKK30KKwogc3Rh
dGljIGlubGluZSBib29sCiBkcm1fZHBfdHBzM19zdXBwb3J0ZWQoY29uc3QgdTggZHBjZFtEUF9S
RUNFSVZFUl9DQVBfU0laRV0pCiB7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
