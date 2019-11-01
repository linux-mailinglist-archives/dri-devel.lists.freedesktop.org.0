Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A5DEBEF8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6206F768;
	Fri,  1 Nov 2019 08:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288D96E17B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 06:27:30 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 09B0E60D37; Fri,  1 Nov 2019 06:27:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from kgunda-linux.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kgunda@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 14627602F0;
 Fri,  1 Nov 2019 06:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 14627602F0
From: Kiran Gunda <kgunda@codeaurora.org>
To: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V10 0/8] backlight: qcom-wled: Support for QCOM wled driver
Date: Fri,  1 Nov 2019 11:56:56 +0530
Message-Id: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1572589650;
 bh=bL0nOQrP/x3tmqadN/OsJ7Er4EhcsGr3nKsfrJY+8ns=;
 h=From:To:Cc:Subject:Date:From;
 b=bpgbW+YSxURf8orNvTHHltFZ26XIZQF2Sm8JcIbiRVOZurBVJmY3BCxIA99RguUwg
 WCSRXlpmlx3OVH3nZScxZkcYCySzIk84FJFLh3jrLGfZqq9Z3AyrVq1XKiqp4wuaaR
 EQCdVUgPzljrd6ovZWabKWo+hfEtvz6ThERGyngI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1572589648;
 bh=bL0nOQrP/x3tmqadN/OsJ7Er4EhcsGr3nKsfrJY+8ns=;
 h=From:To:Cc:Subject:Date:From;
 b=MUL7g+74h0Qm/7JuPlbyJhwLkieiNlTfZFnsCa4h1TTmNB6S6pLiifhTvveZrEkFz
 tJz7sAaX+qKPV3DYhwEEqG4bXd9cIKMh3CJq5wyGJphhjz+i/3M1TyYLa0Rca03udg
 cXH8OCKLCGqlm1EdAib4XONUfIfAZJblEHwSTers=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=kgunda@codeaurora.org
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
Cc: linux-arm-msm@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgcmVuYW1lcyB0aGUgcG04OTQxLXdsZWQuYyBkcml2ZXIgdG8gcWNv
bS13bGVkLmMgdG8gYWRkCnRoZSBzdXBwb3J0IGZvciBtdWx0aXBsZSBQTUlDcyBzdXBwb3J0ZWQg
YnkgcXVhbGNvbW0uIFRoaXMgcGF0Y2ggc2VyaWVzCnN1cHBvcnRzIGJvdGggUE04OTQxIGFuZCBQ
TUk4OTk4IFdMRUQuIFRoZSBQTUk4OTk4IFdMRUQgaGFzIHRoZSBzdXBwb3J0CnRvIGhhbmRsZSB0
aGUgT1ZQIChvdmVyIHZvbHRhZ2UgcHJvdGVjdGlvbikgYW5kIHRoZSBTQyAoc2hvcnQgY2lyY3Vp
dApwcm90ZWN0aW9uKQppbnRlcnJ1cHRzLiBJdCBhbHNvIGhhcyB0aGUgYXV0byBzdHJpbmcgZGV0
ZWN0aW9uIGFsZ29yaXRobSBzdXBwb3J0IHRvCmNvbmZpZ3VyZSB0aGUgcmlnaHQgc3RyaW5ncyBp
ZiB0aGUgdXNlciBzcGVjaWZpZWQgc3RyaW5nIGNvbmZpZ3VyYXRpb24KaXMgaW4tY29ycmVjdC4g
VGhlc2UgdGhyZWUgZmVhdHVyZXMgYXJlIGFkZGVkIGluIHRoaXMgc2VyaWVzIGZvciBQTUk4OTk4
LgoKY2hhbmdlcyBmcm9tIHYxOgogICAtIEZpeGVkIHRoZSBjb21taXQgbWVzc2FnZSBmb3IKICAg
LSBiYWNrbGlnaHQ6IHFjb20td2xlZDogUmVuYW1lIHBtODk0MS13bGVkLmMgdG8gcWNvbS13bGVk
LmMKCkNoYW5nZXMgZnJvbSB2MjoKICAgLSBGaXhlZCBiam9ybiBhbmQgb3RoZXIgcmV2aWV3ZXIn
cyBjb21tZW50cwogICAtIFNlcGVyYXRlZCB0aGUgZGV2aWNlIHRyZWUgYmluZGluZ3MKICAgLSBT
cGxpdHRlZCBvdXQgdGhlIFdMRUQ0IGNoYW5nZXMgaW4gc2VwZXJhdGUgcGF0Y2gKICAgLSBNZXJn
ZWQgT1ZQIGFuZCBhdXRvIHN0cmluZyBkZXRlY3Rpb24gcGF0Y2gKCkNoYW5nZXMgZnJvbSB2MzoK
ICAtIEFkZGVkIFJldmlld2VkLWJ5L0Fja2VkLWJ5IHRhZ3MKICAtIEZpeGVkIGNvbW1lbnRzIGZy
b20gQmpvcm4vVmlub2QvUm9iCiAgLSBTcGxpdHRpbmcgdGhlICJiYWNrbGlnaHQ6IHFjb20td2xl
ZDogQWRkIHN1cHBvcnQgZm9yIFdMRUQ0IHBlcmlwaGVyYWwiIHBhdGNoCiAgICB0byBzZXBlcmF0
ZSB0aGUgV0xFRDMgc3BlY2lmaWMgcmVzdHJ1Y3R1cmUuCgpDaGFuZ2VzIGZyb20gdjQ6CiAgLSBB
ZGRlZCByZXZpZXdlZC1ieS9BY2tlZC1ieSB0YWdzCiAgLSBGaXhlZCBjb21tZW50cyBmcm9tIEJq
b3JuL0RhbmllbC9QYXZlbAoKQ2hhbmdlcyBmcm9tIHY1OgogIC0gRml4ZWQgY29tbWVudHMgZnJv
bSBCam9ybi9QYXZlbAoKQ2hhbmdlcyBmcm9tIHY1L3Y2OgogIC0gRml4ZWQgY29tbWVudHMgZnJv
bSBCam9ybi9QYXZlbCBvbiBWNSBzZXJpZXMsIHdoaWNoIHdlcmUgbWlzc2VkIGluIFY2IHNlcmll
cwogIC0gUGF0Y2ggMSBhbmQgMiwgbWVudGlvbmVkIGJlbG93LCBmcm9tIFY2IHNlcmllcyBhcmUg
cGlja2VkIGJ5IFBhdmVsIEluIG5leHQuCiAgICBIZW5jZSwgZHJvcHBlZCB0aGVtIGluIHRoaXMg
c2VyaWVzLgogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzExMzI0
NjcvCiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTEzMjQ2OC8K
CkNoYW5nZXMgZnJvbSB2NzoKICAtIEFkZHJlc3NlZCBjb21tZW50cyBmcm9tIERhbmllbCBUaG9t
cHNvbi9MZWUgSm9uZXMKICAtIFBhdGNoIDEgYW5kIDIsIG1lbnRpb25lZCBiZWxvdywgZnJvbSBW
NiBzZXJpZXMgYXJlIHBpY2tlZCBieSBQYXZlbCBJbiBuZXh0LgogICAgSGVuY2UsIGRyb3BwZWQg
dGhlbSBpbiB0aGlzIHNlcmllcy4KICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29y
ay9wYXRjaC8xMTMyNDY3LwogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3Bh
dGNoLzExMzI0NjgvCgpDaGFuZ2VzIGZyb20gdjg6CiAtIEFkZHJlc3NlZCBhIGNvbW1lbnQgZnJv
bSBEYW5pZWwgVGhvbXBzb24gb24gcGF0Y2ggNgogLSBBZGRlZCBSZXZpZXdlZC1ieSB0YWcgb2Yg
RGFuaWVsIFRob21wc29uIG9uIHBhdGNoIDQKIC0gUGF0Y2ggMSBhbmQgMiwgbWVudGlvbmVkIGJl
bG93LCBmcm9tIFY2IHNlcmllcyBhcmUgcGlja2VkIGJ5IFBhdmVsIEluIG5leHQuCiAgICBIZW5j
ZSwgZHJvcHBlZCB0aGVtIGluIHRoaXMgc2VyaWVzLgogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvcGF0Y2h3b3JrL3BhdGNoLzExMzI0NjcvCiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9w
YXRjaHdvcmsvcGF0Y2gvMTEzMjQ2OC8KCkNoYW5nZXMgZnJvbSB2OToKIC0gQWRkZWQgYmFjayB0
aGUgYmVsb3cgZHJvcHBlZCBvdXQgcGF0Y2hlcyB0byB0aGlzIHNlcmllcy4KICAgIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC8xMTMyNDY3LwogICAgaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzExMzI0NjgvCiAtIEFkZGVkIFJldmlld2VkLWJ5
IHRhZyBvZiBEYW5pZWwgVGhvbXBzb24gb24gcGF0Y2ggOAoKS2lyYW4gR3VuZGEgKDgpOgogIGJh
Y2tsaWdodDogcWNvbS13bGVkOiBSZW5hbWUgcG04OTQxLXdsZWQuYyB0byBxY29tLXdsZWQuYwog
IGJhY2tsaWdodDogcWNvbS13bGVkOiByZXN0cnVjdHVyZSB0aGUgcWNvbS13bGVkIGJpbmRpbmdz
LgogIGJhY2tsaWdodDogcWNvbS13bGVkOiBBZGQgbmV3IHByb3BlcnRpZXMgZm9yIFBNSTg5OTgu
CiAgYmFja2xpZ2h0OiBxY29tLXdsZWQ6IFJlbmFtZSBQTTg5NDEqIHRvIFdMRUQzCiAgYmFja2xp
Z2h0OiBxY29tLXdsZWQ6IFJlc3RydWN0dXJlIHRoZSBkcml2ZXIgZm9yIFdMRUQzLgogIGJhY2ts
aWdodDogcWNvbS13bGVkOiBBZGQgc3VwcG9ydCBmb3IgV0xFRDQgcGVyaXBoZXJhbC4KICBiYWNr
bGlnaHQ6IHFjb20td2xlZDogYWRkIHN1cHBvcnQgZm9yIHNob3J0IGNpcmN1aXQgaGFuZGxpbmcu
CiAgYmFja2xpZ2h0OiBxY29tLXdsZWQ6IEFkZCBhdXRvIHN0cmluZyBkZXRlY3Rpb24gbG9naWMK
CiAuLi4vYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvcG04OTQxLXdsZWQudHh0ICAgICAgICB8ICAg
NDIgLQogLi4uL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L3Fjb20td2xlZC50eHQgICAgICAgICAg
fCAgMTU0ICsrKwogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgfCAgICA4ICstCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICB8ICAgIDIgKy0KIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3BtODk0MS13bGVk
LmMgICAgICAgICAgICAgIHwgIDQyNCAtLS0tLS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9x
Y29tLXdsZWQuYyAgICAgICAgICAgICAgICB8IDEyOTYgKysrKysrKysrKysrKysrKysrKysKIDYg
ZmlsZXMgY2hhbmdlZCwgMTQ1NSBpbnNlcnRpb25zKCspLCA0NzEgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFj
a2xpZ2h0L3BtODk0MS13bGVkLnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9xY29tLXdsZWQudHh0CiBkZWxldGUg
bW9kZSAxMDA2NDQgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcG04OTQxLXdsZWQuYwogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jCgotLSAKVGhl
IFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIHRoZSBDb2Rl
IEF1cm9yYSBGb3J1bSwKIGEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
