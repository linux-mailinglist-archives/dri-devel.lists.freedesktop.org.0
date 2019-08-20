Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BC9968E5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 21:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B016E854;
	Tue, 20 Aug 2019 19:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871886E851;
 Tue, 20 Aug 2019 19:06:41 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 6642360A44; Tue, 20 Aug 2019 19:06:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E2A2A608FC;
 Tue, 20 Aug 2019 19:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E2A2A608FC
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 0/7] iommu/arm-smmu: Split pagetable support for Adreno GPUs
Date: Tue, 20 Aug 2019 13:06:25 -0600
Message-Id: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1566328001;
 bh=JVOA+N1GY0FZQY7fgH8GBUcQtg09RuZemNa9uGbRUB4=;
 h=From:To:Cc:Subject:Date:From;
 b=cGY7R235YpB41zyv7M/1ugHWDI/ziFKNIhV41PxzgJpu41F6SGQDPsnKwT6v84uoQ
 fwqeJ4SiPMJHdMcNS8NqeMHuTc+Y0mkoUoewjphPYIoFjfs3bE9TnJaNA0KhyWBgjr
 ByKKqzNSXQ8/sVSsM+l2UJjMV1ECTRqOyl5Afywc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1566327999;
 bh=JVOA+N1GY0FZQY7fgH8GBUcQtg09RuZemNa9uGbRUB4=;
 h=From:To:Cc:Subject:Date:From;
 b=M3Z+8dS+lEFL8B05ojyqH3qIFG+culCff2FSu0EKY/ry/7K1KKZg7C+hKtsTsrbnv
 r7SpMsyJIV9oQxPSzEoaALo1KWXvI5skX+lAVXXVB5SrxlSgeY4eBsNUb67pkptlr6
 71/65oHOvbmE6FBMuD0JfkDviPqBoXzhgDZmtu5M=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
 Will Deacon <will@kernel.org>, Wen Yang <wen.yang99@zte.com.cn>,
 Jonathan Marek <jonathan@marek.ca>, iommu@lists.linux-foundation.org,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Fritz Koenig <frkoenig@google.com>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Alexios Zavras <alexios.zavras@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>, Bruce Wang <bzwang@chromium.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Robin Murphy <robin.murphy@arm.com>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBhbm90aGVyIGl0ZXJhdGlvbiB0byBzdXBwb3J0IHNwbGl0IHBhZ2V0YWJsZXMgZm9y
IEFkcmVubyBHUFVzIGFzIHBhcnQgb2YKYW4gaW5jcmVtZW50YWwgcHJvY2VzcyB0byBlbmFibGUg
cGVyLWNvbnRleHQgcGFnZXRhYmxlcy4KCkluIG9yZGVyIHRvIHN1cHBvcnQgcGVyLWNvbnRleHQg
cGFnZXRhYmxlcyB0aGUgR1BVIG5lZWRzIHRvIGVuYWJsZSBzcGxpdApwYWdldGFibGVzIHNvIHRo
YXQgd2UgY2FuIHN0b3JlIHRoZSBnbG9iYWwgYnVmZmVycyBpbiB0aGUgVFRCUjEgc3BhY2UgbGVh
dmluZwp0aGUgR1BVIGZyZWUgdG8gcHJvZ3JhbSB0aGUgVFRCUjAgcmVnaXN0ZXIgd2l0aCB0aGUg
cGFnZSBhZGRyZXNzIG9mIGEgY29udGV4dApzcGVjaWZpYyBwdC4KClByZXZpb3VzIHJldmlzaW9u
cyBvZiB0aGlzIHNlcmllcyBjYW4gYmUgZm91bmQgYXQgWzFdIGFuZCBbMl0uCgpUaGlzIGl0ZXJh
dGlvbiBpcyBidWlsdCBvbiB0b3Agb2YgdGhlIGFybS1zbW11LWltcGwgYW5kIGFybS1zbW11LXYy
CnJld29yayBjb2RlIGZyb20gUm9iaW4gTXVycGh5IFszXSBhbmQgWzRdLgoKVGhpcyBjb2RlIGlz
IGJhc2VkIG9uIHRoZSByZWFsaXphdGlvbiB0aGF0IHdoZW4gc3BsaXQgcGFnZXRhYmxlcyBhcmUg
ZW5hYmxlZCB0aGUKY29uZmlndXJhdGlvbiBmb3IgdGhlIFQxIGFkZHJlc3Mgc3BhY2UgaXMgaWRl
bnRpY2FsIHRvIHRoYXQgb2YgdGhlIFQwIHNwYWNlLApzbyB3ZSBjYW4ganVzdCB0YWtlIHRoZSBU
Q1IgY29uZmlndXJhdGlvbiBwcm92aWRlZCBieSBpby1wZ3RhYmxlLCBkdXBsaWNhdGUgaXQKYW5k
IHNoaWZ0IGl0IGJ5IDE2IGJpdHMuCgpTaW5jZSB0aGUgY3VycmVudCBzcGxpdCBwYWdldGFibGUg
aW1wbGVtZW50YXRpb24gaXMgc3BlY2lmaWMgdG8gdGhlIEFkcmVubwpHUFVzIHdlIGNhbiBhbHNv
IHRha2UgYSBzbWFsbCBzaG9ydGN1dCBhbmQgb25seSBhbGxvdyBzcGxpdCBwYWdldGFibGVzIGZv
ciBTTU1Vcwp3aXRoIGEgNDkgYml0IHVwc3RyZWFtIGJ1cyB3aGljaCBhbGxvd3MgdXMgdG8gdXNl
IHRoZSBkZWZhdWx0IGNvbmZpZ3VyYXRpb24KZm9yIHRoZSBzaWduIGV4dGVuc2lvbiBiaXQgYW5k
IHdlIGNhbiBhdm9pZCBhIGxvdCBvZiBleHRyYSBjb2RlIHRvIGhhbmRsZQpkaWZmZXJlbnQgdXBz
dHJlYW0gYnVzIHNpemVzIHRoYXQgd2lsbCBuZXZlciBnZXQgdXNlZC4KClRoZSBmaXJzdCBwYXRj
aCBpbXBsZW1lbnRzIHRoZSBzcGxpdCBwYWdldGFibGUgc3VwcG9ydCBmb3IgYXJtLXNtbXUtdjIu
CgpUaGUgc2Vjb25kIGFkZHMgYSBTTU1VIG1vZGVsIGZvciB0aGUgQWRyZW5vIEdQVSBTTU1VIGFu
ZCBlbmFibGVzIHRoZSBzcGxpdApwYWdldGFibGVzIGlmIGNvbmRpdGlvbnMgd2FycmFudC4KClRo
ZSAzcmQgYW5kIDR0aCBwYXRjaGVzIGFkZCBhIGRvbWFpbiBhdHRyaWJ1dGUgdG8gcXVlcnkgdGhl
IHN0YXR1cyBvZiBzcGxpdApwYWdldGFibGVzLgoKVGhlIHJlbWFpbmluZyBwYXRjaGVzIG1vZGlm
eSBkcm0vbXNtIHNsaWdodGx5IHRvIGFsbG93IGE2eHggdGFyZ2V0cyB0bwpyZWNvZ25pemUgaWYg
c3BsaXQgcGFnZXRhYmxlcyBhcmUgZW5hYmxlZCBhbmQgYWRqdXN0IHRoZSBhZGRyZXNzIHNwYWNl
CmFjY29yZGluZ2x5LgoKVGhpcyBzZXJpZXMgb25seSBpbmNsdWRlcyBzdXBwb3J0IGZvciBzcGxp
dCBwYWdldGFibGVzIGJlY2F1c2UgSSB3YW50ZWQgdG8gZ2V0CnRoaXMgb3V0IGZvciBkaXNjdXNz
aW9uIGFuZCBJIGhhdmVuJ3QgcG9ydGVkIG92ZXIgdGhlIGF1eCBkb21haW4gY29kZSB0byB0aGlz
Cmtlcm5lbCB2ZXJzaW9uLCBidXQgSSBkb24ndCBzdXNwZWN0IGl0IHdpbGwgZW5kIHVwIGJlaW5n
IG11Y2ggZGlmZmVyZW50IHRoYW4KcHJldmlvdXMgdmVyc2lvbnMgWzVdLgoKWzFdIGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjM0MDMvClsyXSBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzY0ODc0LwpbM10gaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL3BpcGVybWFpbC9pb21tdS8yMDE5LUF1Z3VzdC8wMzc5MDUuaHRtbApb
NF0gaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL3BpcGVybWFpbC9pb21tdS8yMDE5
LUF1Z3VzdC8wMzgyNDQuaHRtbApbNV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3Jn
L3BhdGNoLzMwNzYwMS8KCgpKb3JkYW4gQ3JvdXNlICg3KToKICBpb21tdS9hcm0tc21tdTogU3Vw
cG9ydCBzcGxpdCBwYWdldGFibGVzCiAgZHQtYmluZGluZ3M6IGFybS1zbW11OiBBZGQgQWRyZW5v
IEdQVSB2YXJpYW50CiAgaW9tbXUvYXJtLXNtbXU6IEFkZCBhIFNNTVUgdmFyaWFudCBmb3IgdGhl
IEFkcmVubyBHUFUKICBpb21tdTogQWRkIERPTUFJTl9BVFRSX1NQTElUX1RBQkxFUwogIGlvbW11
L2FybS1zbW11OiBTdXBwb3J0IERPTUFJTl9BVFRSX1NQTElUX1RBQkxFUwogIGRybS9tc206IENy
ZWF0ZSB0aGUgbXNtX21tdSBvYmplY3QgaW5kZXBlbmRlbnRseSBmcm9tIHRoZSBhZGRyZXNzCiAg
ICBzcGFjZQogIGRybS9tc206IFVzZSBwZXItdGFyZ2V0IGZ1bmN0aW9ucyB0byBzZXQgdXAgYWRk
cmVzcyBzcGFjZXMKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9hcm0sc21tdS50eHQg
ICAgICAgICB8ICA3ICsrKwogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTJ4eF9ncHUuYyAg
ICAgICAgICAgICAgfCAyOCArKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8v
YTN4eF9ncHUuYyAgICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVu
by9hNHh4X2dwdS5jICAgICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRy
ZW5vL2E1eHhfZ3B1LmMgICAgICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL21zbS9h
ZHJlbm8vYTZ4eF9ncHUuYyAgICAgICAgICAgICAgfCA1NiArKysrKysrKysrKysrKysrKysrKysr
CiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMgICAgICAgICAgICB8IDQz
ICsrKysrKysrKysrKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1
LmggICAgICAgICAgICB8ICA1ICsrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVf
a21zLmMgICAgICAgICAgICB8IDE2ICsrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9t
ZHA0L21kcDRfa21zLmMgICAgICAgICAgIHwgMTYgKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL21kcDUvbWRwNV9jZmcuYyAgICAgICAgICAgfCAgNCAtLQogZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYyAgICAgICAgICAgfCAxMyArKysrLQogZHJpdmVycy9n
cHUvZHJtL21zbS9tc21fZHJ2LmggICAgICAgICAgICAgICAgICAgICAgfCAgOCArLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fdm1hLmMgICAgICAgICAgICAgICAgICB8IDMwICsrLS0t
LS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMgICAgICAgICAgICAgICAgICAg
ICAgfCA1MSArKy0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1
LmggICAgICAgICAgICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9pb21tdS9hcm0tc21tdS1p
bXBsLmMgICAgICAgICAgICAgICAgICAgICAgfCAxNSArKysrKysKIGRyaXZlcnMvaW9tbXUvYXJt
LXNtbXUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNDYgKysrKysrKysrKysrKysrKy0t
CiBkcml2ZXJzL2lvbW11L2FybS1zbW11LmggICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAy
ICsKIGluY2x1ZGUvbGludXgvaW9tbXUuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDEgKwogMjAgZmlsZXMgY2hhbmdlZCwgMjM3IGluc2VydGlvbnMoKyksIDExMSBkZWxldGlvbnMo
LSkKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
