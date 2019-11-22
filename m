Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EDD107B83
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 00:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DF96F554;
	Fri, 22 Nov 2019 23:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 340 seconds by postgrey-1.36 at gabe;
 Fri, 22 Nov 2019 23:37:32 UTC
Received: from a27-21.smtp-out.us-west-2.amazonses.com
 (a27-21.smtp-out.us-west-2.amazonses.com [54.240.27.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DE06F547;
 Fri, 22 Nov 2019 23:37:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 79D8FC43383
From: Jordan Crouse <jcrouse@codeaurora.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 0/8] iommu/arm-smmu: Split pagetable support for Adreno GPUs
Date: Fri, 22 Nov 2019 23:31:50 +0000
Message-ID: <0101016e95751d35-92f6f480-e533-4597-8a22-75fd7fc4961f-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
X-SES-Outgoing: 2019.11.22-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574465510;
 h=From:To:Cc:Subject:Date:Message-Id;
 bh=6W+Hea0Amd6/uilOnF5QbG8DckcKj2ySVsuPY5EsZLg=;
 b=iDM0MWXUpLeSeZpxenOmzyZ6tQfJPNykQzg/eCOfP6AB6ea3t8Y9gOuISHasD+qC
 4saMaLzRMQg/hQFvRtK3lgFm4Gttuz38sW5jm44Gyag3JMaZ9171JSq2DrDPIfyJUbQ
 XMwSW8JNFrFTlr8i0j80caKVIG8wv3+/8DLMG8nw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574465510;
 h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
 bh=6W+Hea0Amd6/uilOnF5QbG8DckcKj2ySVsuPY5EsZLg=;
 b=PBPC/xuYAV+O9pS/zN48oSA6DJj32ek0LtuI8VzI8sdmnsL4TZpa5T53pUzPctZX
 pDvTPXCjy3zmCfIIjiplxHx2ppIjoRPPGecfZlOmblXqgm7T0VwMKKnvnLUoUfxcuZD
 /ESucjBSZpQdP5eCX9Su3Hpj/0ZnRUt7WSebdEJI=
X-Mailman-Original-Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Wen Yang <wen.yang99@zte.com.cn>,
 Jonathan Marek <jonathan@marek.ca>, will@kernel.org,
 Mamta Shukla <mamtashukla555@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 linux-arm-kernel@lists.infradead.org, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Alexios Zavras <alexios.zavras@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>, Bruce Wang <bzwang@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Drew Davenport <ddavenport@chromium.org>, robin.murphy@arm.com,
 Georgi Djakov <georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkFub3RoZXIgcmVmcmVzaCB0byBzdXBwb3J0IHNwbGl0IHBhZ2V0YWJsZXMgZm9yIEFkcmVubyBH
UFVzIGFzIHBhcnQgb2YgYW4KaW5jcmVtZW50YWwgcHJvY2VzcyB0byBlbmFibGUgcGVyLWNvbnRl
eHQgcGFnZXRhYmxlcy4KCkluIG9yZGVyIHRvIHN1cHBvcnQgcGVyLWNvbnRleHQgcGFnZXRhYmxl
cyB0aGUgR1BVIG5lZWRzIHRvIGVuYWJsZSBzcGxpdCB0YWJsZXMKc28gdGhhdCB3ZSBjYW4gc3Rv
cmUgZ2xvYmFsIGJ1ZmZlcnMgaW4gdGhlIFRUQlIxIHNwYWNlIGxlYXZpbmcgdGhlIEdQVSBmcmVl
IHRvCnByb2dyYW0gdGhlIFRUQlIwIHJlZ2lzdGVyIHdpdGggdGhlIGFkZHJlc3Mgb2YgYSBjb250
ZXh0IHNwZWNpZmljIHBhZ2V0YWJsZS4KClRoaXMgcGF0Y2hzZXQgYWRkcyBzcGxpdCBwYWdldGFi
bGUgc3VwcG9ydCBmb3IgZGV2aWNlcyBpZGVudGlmaWVkIHdpdGggdGhlCmNvbXBhdGlibGUgc3Ry
aW5nIHFjb20sYWRyZW5vLXNtbXUtdjIuIElmIHRoZSBjb21wYXRpYmxlIHN0cmluZyBpcyBlbmFi
bGVkIGFuZApET01BSU5fQVRUUl9TUExJVF9UQUJMRVMgaXMgbm9uIHplcm8gYXQgYXR0YWNoIHRp
bWUsIHRoZSBpbXBsZW1lbnRhdGlvbiB3aWxsCnNldCB1cCB0aGUgVFRCUjAgYW5kIFRUQlIxIHNw
YWNlcyB3aXRoIGlkZW50aWNhbCBjb25maWd1cmF0aW9ucyBhbmQgcHJvZ3JhbQp0aGUgZG9tYWlu
IHBhZ2V0YWJsZSBpbnRvIHRoZSBUVEJSMSByZWdpc3Rlci4gVGhlIFRUQlIwIHJlZ2lzdGVyIHdp
bGwgYmUKdW51c2VkLgoKVGhlIGRyaXZlciBjYW4gZGV0ZXJtaW5lIGlmIHNwbGl0IHBhZ2V0YWJs
ZXMgd2VyZSBwcm9ncmFtbWVkIGJ5IHF1ZXJ5aW5nCkRPTUFJTl9BVFRSX1NQTElUX1RBQkxFUyBh
ZnRlciBhdHRhY2hpbmcuIFRoZSBkb21haW4gZ2VvbWV0cnkgd2lsbCBhbHNvIGJlCnVwZGF0ZWQg
dG8gcmVmbGVjdCB0aGUgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGZvciB0aGUgVFRCUjEgcmFuZ2Uu
CgpUaGVzZSBwYXRjaGVzIGFyZSBvbiBiYXNlZCBvbiB0b3Agb2YgbGludXgtbmV4dC0yMDE5MTEy
MCB3aXRoIFsxXSwgWzJdLCBhbmQgWzNdCmZyb20gUm9iaW4gb24gdGhlIGlvbW11IGxpc3QuCgpU
aGUgZmlyc3QgZm91ciBwYXRjaGVzIGFkZCB0aGUgZGV2aWNlIHRyZWUgYmluZGluZ3MgYW5kIGlt
cGxlbWVudGF0aW9uCnNwZWNpZmljIHN1cHBvcnQgZm9yIGFybS1zbW11IGFuZCB0aGUgcmVzdCBv
ZiB0aGUgcGF0Y2hlcyBhZGQgdGhlIGRybS9tc20KaW1wbGVtZW50YXRpb24gZm9sbG93ZWQgYnkg
dGhlIGRldmljZSB0cmVlIHVwZGF0ZSBmb3Igc2RtODQ1LgoKWzFdIGh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9waXBlcm1haWwvaW9tbXUvMjAxOS1PY3RvYmVyLzAzOTcxOC5odG1s
ClsyXSBodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvcGlwZXJtYWlsL2lvbW11LzIw
MTktT2N0b2Jlci8wMzk3MTkuaHRtbApbM10gaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL3BpcGVybWFpbC9pb21tdS8yMDE5LU9jdG9iZXIvMDM5NzIwLmh0bWwKCgpKb3JkYW4gQ3Jv
dXNlICg4KToKICBkdC1iaW5kaW5nczogYXJtLXNtbXU6IEFkZCBBZHJlbm8gR1BVIHZhcmlhbnQK
ICBpb21tdTogQWRkIERPTUFJTl9BVFRSX1NQTElUX1RBQkxFUwogIGlvbW11L2FybS1zbW11OiBQ
YXNzIGlvX3BndGFibGVfY2ZnIHRvIGltcGwgc3BlY2lmaWMgaW5pdF9jb250ZXh0CiAgaW9tbXUv
YXJtLXNtbXU6IEFkZCBzcGxpdCBwYWdldGFibGVzIGZvciBBZHJlbm8gSU9NTVUgaW1wbGVtZW50
YXRpb25zCiAgZHJtL21zbTogQXR0YWNoIHRoZSBJT01NVSBkZXZpY2UgZHVyaW5nIGluaXRpYWxp
emF0aW9uCiAgZHJtL21zbTogUmVmYWN0b3IgYWRkcmVzcyBzcGFjZSBpbml0aWFsaXphdGlvbgog
IGRybS9tc20vYTZ4eDogU3VwcG9ydCBzcGxpdCBwYWdldGFibGVzCiAgYXJtNjQ6IGR0czogcWNv
bTogc2RtODQ1OiAgVXBkYXRlIEFkcmVubyBHUFUgU01NVSBjb21wYXRpYmxlIHN0cmluZwoKIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L2FybSxzbW11LnlhbWwgICAgICAgIHwgIDYgKysK
IGFyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zZG04NDUuZHRzaSAgICAgICAgICAgICAgIHwgIDIg
Ky0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2EyeHhfZ3B1LmMgICAgICAgICAgICAgIHwg
MTYgKysrKwogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTN4eF9ncHUuYyAgICAgICAgICAg
ICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNHh4X2dwdS5jICAgICAgICAg
ICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMgICAgICAg
ICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYyAgICAg
ICAgICAgICAgfCA0NSArKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJl
bm9fZ3B1LmMgICAgICAgICAgICB8IDIzICsrKystLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJl
bm8vYWRyZW5vX2dwdS5oICAgICAgICAgICAgfCAgOCArKwogZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2ttcy5jICAgICAgICAgICAgfCAxOCArKy0tCiBkcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvbWRwNC9tZHA0X2ttcy5jICAgICAgICAgICB8IDE4ICsrLS0KIGRyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY2ZnLmMgICAgICAgICAgIHwgIDQgLQogZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYyAgICAgICAgICAgfCAxOCArKy0tCiBkcml2
ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuaCAgICAgICAgICAgICAgICAgICAgICB8ICA4ICstCiBk
cml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fdm1hLmMgICAgICAgICAgICAgICAgICB8IDM3ICsr
LS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMgICAgICAgICAgICAgICAgICAg
ICAgfCA0OSArLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmggICAgICAg
ICAgICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1bW11LmMg
ICAgICAgICAgICAgICAgICAgfCAgNiAtLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21faW9tbXUu
YyAgICAgICAgICAgICAgICAgICAgfCAxOCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9t
bXUuaCAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvaW9tbXUvYXJtLXNtbXUt
aW1wbC5jICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKy0KIGRyaXZlcnMvaW9tbXUvYXJtLXNt
bXUtcWNvbS5jICAgICAgICAgICAgICAgICAgICAgIHwgOTYgKysrKysrKysrKysrKysrKysrKysr
KwogZHJpdmVycy9pb21tdS9hcm0tc21tdS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA1
MiArKysrKysrKystLS0KIGRyaXZlcnMvaW9tbXUvYXJtLXNtbXUuaCAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMTQgKysrLQogaW5jbHVkZS9saW51eC9pb21tdS5oICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMSArCiAyNSBmaWxlcyBjaGFuZ2VkLCAyOTUgaW5zZXJ0aW9ucygr
KSwgMTU4IGRlbGV0aW9ucygtKQoKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
