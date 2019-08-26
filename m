Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9319CC1F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 11:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCEB89A61;
	Mon, 26 Aug 2019 09:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052DE89A4B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 09:04:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 02:04:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,431,1559545200"; d="scan'208";a="204510218"
Received: from jbroders-mobl1.ger.corp.intel.com (HELO
 delly.ger.corp.intel.com) ([10.252.38.38])
 by fmsmga004.fm.intel.com with ESMTP; 26 Aug 2019 02:04:55 -0700
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amd/amdgpu: disallow replacing fences in timeline
 syncobjs
Date: Mon, 26 Aug 2019 12:04:47 +0300
Message-Id: <20190826090448.12819-3-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190826090448.12819-1-lionel.g.landwerlin@intel.com>
References: <20190826090448.12819-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
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
Cc: Christian.Koenig@amd.com, jason@jlekstrand.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2ltaWxhcmx5IHRvIHRoZSBob3N0IHBhdGggZnJvbSBkcm1fc3luY29iai5jIHdlIHdvdWxkIGxp
a2UgdG8KZGlzYWxsb3cgdGhvc2Ugb3BlcmF0aW9ucyB0byBoZWxwIGFwcGxpY2F0aW9ucyBmaWd1
cmUgd2hlcmUgdGhleSB1c2luZwp0aGUgd3Jvbmcga2luZCBvZiBpb2N0bC4KClNpZ25lZC1vZmYt
Ynk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyB8IDIgKysKIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9j
cy5jCmluZGV4IDJlNTNmZWVkNDBlMi4uZDliYmMzMWU5N2QwIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfY3MuYwpAQCAtMTE1OSw2ICsxMTU5LDggQEAgc3RhdGljIGludCBhbWRn
cHVfY3NfcHJvY2Vzc19zeW5jb2JqX291dF9kZXAoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAs
CiAJCQlkcm1fc3luY29ial9maW5kKHAtPmZpbHAsIGRlcHNbaV0uaGFuZGxlKTsKIAkJaWYgKCFw
LT5wb3N0X2RlcHNbaV0uc3luY29iaikKIAkJCXJldHVybiAtRUlOVkFMOworCQlpZiAocC0+cG9z
dF9kZXBzW2ldLnN5bmNvYmotPmlzX3RpbWVsaW5lKQorCQkJcmV0dXJuIC1FSU5WQUw7CiAJCXAt
PnBvc3RfZGVwc1tpXS5jaGFpbiA9IE5VTEw7CiAJCXAtPnBvc3RfZGVwc1tpXS5wb2ludCA9IDA7
CiAJCXAtPm51bV9wb3N0X2RlcHMrKzsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
