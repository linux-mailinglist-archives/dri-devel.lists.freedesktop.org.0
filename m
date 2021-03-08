Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EAC330968
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 09:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6072189ECB;
	Mon,  8 Mar 2021 08:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E44889ECB;
 Mon,  8 Mar 2021 08:32:19 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DvBNz6wqGz16HjZ;
 Mon,  8 Mar 2021 16:30:27 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Mon, 8 Mar 2021
 16:32:05 +0800
From: Luo Jiaxing <luojiaxing@huawei.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <bskeggs@redhat.com>
Subject: [PATCH v1] drm/nouveau/device: use snprintf() to replace strncpy() to
 avoid NUL-terminated string loss
Date: Mon, 8 Mar 2021 16:32:52 +0800
Message-ID: <1615192372-47348-1-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
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
Cc: song.bao.hua@hisilicon.com, luojiaxing@huawei.com,
 linux-kernel@vger.kernel.org, linuxarm@openeuler.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9sbG93aW5nIHdhcm5pbmcgaXMgZm91bmQgd2hlbiB1c2luZyBXPTEgdG8gYnVpbGQga2VybmVs
OgoKSW4gZnVuY3Rpb24g4oCYbnZrbV91ZGV2aWNlX2luZm/igJksCiAgICBpbmxpbmVkIGZyb20g
4oCYbnZrbV91ZGV2aWNlX210aGTigJkgYXQgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9l
bmdpbmUvZGV2aWNlL3VzZXIuYzoxOTU6MTA6CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
ZW5naW5lL2RldmljZS91c2VyLmM6MTY0OjI6IHdhcm5pbmc6IOKAmHN0cm5jcHnigJkgc3BlY2lm
aWVkIGJvdW5kIDE2IGVxdWFscyBkZXN0aW5hdGlvbiBzaXplIFstV3N0cmluZ29wLXRydW5jYXRp
b25dCiAgMTY0IHwgIHN0cm5jcHkoYXJncy0+djAuY2hpcCwgZGV2aWNlLT5jaGlwLT5uYW1lLCBz
aXplb2YoYXJncy0+djAuY2hpcCkpOwpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2lu
ZS9kZXZpY2UvdXNlci5jOjE2NToyOiB3YXJuaW5nOiDigJhzdHJuY3B54oCZIHNwZWNpZmllZCBi
b3VuZCA2NCBlcXVhbHMgZGVzdGluYXRpb24gc2l6ZSBbLVdzdHJpbmdvcC10cnVuY2F0aW9uXQog
IDE2NSB8ICBzdHJuY3B5KGFyZ3MtPnYwLm5hbWUsIGRldmljZS0+bmFtZSwgc2l6ZW9mKGFyZ3Mt
PnYwLm5hbWUpKTsKClRoZSByZWFzb24gb2YgdGhpcyB3YXJuaW5nIGlzIHN0cm5jcHkoKSBkb2Vz
IG5vdCBndWFyYW50ZWUgdGhhdCB0aGUKZGVzdGluYXRpb24gYnVmZmVyIHdpbGwgYmUgTlVMIHRl
cm1pbmF0ZWQuIElmIHRoZSBsZW5ndGggb2Ygc291cmNlIHN0cmluZwppcyBiaWdnZXIgdGhhbiBu
dW1iZXIgd2Ugc2V0IGJ5IHRoaXJkIGlucHV0IHBhcmFtZXRlciwgb25seSBhIHBhcnQgb2YKY2hh
cmFjdGVycyBpcyBjb3BpZWQgdG8gdGhlIGRlc3RpbmF0aW9uLCBhbmQgbm8gTlVMLXRlcm1pbmF0
ZWQgc3RyaW5nIGlzCmF1dG9tYXRpY2FsbHkgYWRkZWQuIFRoZXJlIGFyZSBzb21lIHBvdGVudGlh
bCByaXNrcy4KClNvIHVzZSBzbnByaW50ZigpIHRvIHJlcGxhY2Ugc3RybmNweSgpLgoKU2lnbmVk
LW9mZi1ieTogTHVvIEppYXhpbmcgPGx1b2ppYXhpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kZXZpY2UvdXNlci5jIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2RldmljZS91c2VyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kZXZpY2UvdXNlci5jCmluZGV4IGZlYTlk
OGYuLjRiZjY1YmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5n
aW5lL2RldmljZS91c2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdp
bmUvZGV2aWNlL3VzZXIuYwpAQCAtMTYxLDggKzE2MSw4IEBAIG52a21fdWRldmljZV9pbmZvKHN0
cnVjdCBudmttX3VkZXZpY2UgKnVkZXYsIHZvaWQgKmRhdGEsIHUzMiBzaXplKQogCWlmIChpbWVt
ICYmIGFyZ3MtPnYwLnJhbV9zaXplID4gMCkKIAkJYXJncy0+djAucmFtX3VzZXIgPSBhcmdzLT52
MC5yYW1fdXNlciAtIGltZW0tPnJlc2VydmVkOwogCi0Jc3RybmNweShhcmdzLT52MC5jaGlwLCBk
ZXZpY2UtPmNoaXAtPm5hbWUsIHNpemVvZihhcmdzLT52MC5jaGlwKSk7Ci0Jc3RybmNweShhcmdz
LT52MC5uYW1lLCBkZXZpY2UtPm5hbWUsIHNpemVvZihhcmdzLT52MC5uYW1lKSk7CisJc25wcmlu
dGYoYXJncy0+djAuY2hpcCwgc2l6ZW9mKGFyZ3MtPnYwLmNoaXApLCAiJXMiLCBkZXZpY2UtPmNo
aXAtPm5hbWUpOworCXNucHJpbnRmKGFyZ3MtPnYwLm5hbWUsIHNpemVvZihhcmdzLT52MC5uYW1l
KSwgIiVzIiwgZGV2aWNlLT5uYW1lKTsKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
