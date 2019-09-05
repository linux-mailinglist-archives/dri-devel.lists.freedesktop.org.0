Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BC1A9828
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 03:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB618947A;
	Thu,  5 Sep 2019 01:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897C08947A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 01:53:49 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id y72so609663pfb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 18:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8ULGV/s7+qxZzul0FZw0GFFC3DnLHdGN42oRHfNbhLE=;
 b=Jp/DNMLeV0LULyU98lA+qSWp2LB6VikgGe1uflU4WiI/Zv4cOUPqSTuHQOkddbjT3I
 EedhvASL0zblQ/AEFsLaovhC9AI1yEpdsYuWU8vz6OuAwcg9J0g39C19X0ke8re2wezh
 aUfgMMePb2SOBVLApFaLjXg+ekxT4PD9tlbtdhp2Bl7qyWk5hf6fKUt54H4RupQKPqSR
 RRwrljaEKwd0iZSYgPKZfgZ4kgTrBV7F9zFCT2qMAbQjg2hcHa76/C/1i410xukdfnWJ
 5ur8NEjmbYr1w13HqGCdbKR16CPeFnCIJZ4SuiU2rMWWC/Qoj9L3DG+xwTEDeIBF4UdD
 w1Uw==
X-Gm-Message-State: APjAAAX0Nnzlz1o797deg5U1LhgEA4NSewWUnzatVENCBX+FsE5cFEUO
 jONRb1E8NqiPSOEMwbu41Vs=
X-Google-Smtp-Source: APXvYqw1w8fU8E5K0bJsKsZgOMHGnxpe8l++eG8ZPXQwHo7rLedG7gEMXj3dlyn8sF5oBeQVtvNNaw==
X-Received: by 2002:a63:6fcf:: with SMTP id k198mr936312pgc.276.1567648428825; 
 Wed, 04 Sep 2019 18:53:48 -0700 (PDT)
Received: from localhost.localdomain ([61.83.141.141])
 by smtp.gmail.com with ESMTPSA id z12sm330990pfj.41.2019.09.04.18.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 18:53:48 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: [PATCH v2] drm/vkms: Use alpha value to blend values.
Date: Thu,  5 Sep 2019 02:53:26 +0100
Message-Id: <20190905015326.23853-1-realwakka@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8ULGV/s7+qxZzul0FZw0GFFC3DnLHdGN42oRHfNbhLE=;
 b=dNUFGdE6RxUVKSBcjKmrQrqlL9FPlzSO56kd0QMh/TXkHVoF9S8yiNeuZeb+6Rj0pz
 b2mVlOWxszR2z44QxOn4skZ+uB8WrXw0acG5obbeJVaFb8wo03HDJow4wz+ef+PhXBRK
 ug7KvfyBSxnZIR2bgmAdMnUyzu2z3W7q//XuxSXcAcHw6UII4eIiL2G/G95sOTe9DXiP
 m93lAHu5LNW7U2PPohSHrsS8kyfSdPbeOtsFjgtJE+gMCq6w7r+HXFQQRcxnls3Vwo15
 282jOffbVZZJpHi7aDFAc3LfxYeclo4e37IccSvmb3dKzSAmCugucFoFIeG8iNK8D7+U
 QRVg==
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGFscGhhIHZhbHVlIHRvIGJsZW5kIHNvdXJjZSB2YWx1ZSBhbmQgZGVzdGluYXRpb24gdmFs
dWUgSW5zdGVhZCBvZgpqdXN0IG92ZXJ3cml0ZSB3aXRoIHNvdXJjZSB2YWx1ZS4KClNpZ25lZC1v
ZmYtYnk6IFNpZG9uZyBZYW5nIDxyZWFsd2Fra2FAZ21haWwuY29tPgotLS0KdjEgLT4gdjI6IAog
KiBNb3ZlIHZhcmlhYmxlcyB0byB0aWdodGVyIHNjb3BlLgoKIGRyaXZlcnMvZ3B1L2RybS92a21z
L3ZrbXNfY29tcG9zZXIuYyB8IDEzICsrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS92a21zL3ZrbXNfY29tcG9zZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY29tcG9z
ZXIuYwppbmRleCBkNTU4NTY5NWM2NGQuLjE4MTQ3MmVmYTA4YyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3ZrbXMvdmttc19jb21wb3Nlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92a21z
L3ZrbXNfY29tcG9zZXIuYwpAQCAtNzcsNiArNzcsOSBAQCBzdGF0aWMgdm9pZCBibGVuZCh2b2lk
ICp2YWRkcl9kc3QsIHZvaWQgKnZhZGRyX3NyYywKIAogCWZvciAoaSA9IHlfc3JjLCBpX2RzdCA9
IHlfZHN0OyBpIDwgeV9saW1pdDsgKytpKSB7CiAJCWZvciAoaiA9IHhfc3JjLCBqX2RzdCA9IHhf
ZHN0OyBqIDwgeF9saW1pdDsgKytqKSB7CisJCQl1OCAqc3JjLCAqZHN0OworCQkJdTMyIGFscGhh
LCBpbnZfYWxwaGE7CisKIAkJCW9mZnNldF9kc3QgPSBkZXN0X2NvbXBvc2VyLT5vZmZzZXQKIAkJ
CQkgICAgICsgKGlfZHN0ICogZGVzdF9jb21wb3Nlci0+cGl0Y2gpCiAJCQkJICAgICArIChqX2Rz
dCsrICogZGVzdF9jb21wb3Nlci0+Y3BwKTsKQEAgLTg0LDggKzg3LDE0IEBAIHN0YXRpYyB2b2lk
IGJsZW5kKHZvaWQgKnZhZGRyX2RzdCwgdm9pZCAqdmFkZHJfc3JjLAogCQkJCSAgICAgKyAoaSAq
IHNyY19jb21wb3Nlci0+cGl0Y2gpCiAJCQkJICAgICArIChqICogc3JjX2NvbXBvc2VyLT5jcHAp
OwogCi0JCQltZW1jcHkodmFkZHJfZHN0ICsgb2Zmc2V0X2RzdCwKLQkJCSAgICAgICB2YWRkcl9z
cmMgKyBvZmZzZXRfc3JjLCBzaXplb2YodTMyKSk7CisJCQlzcmMgPSB2YWRkcl9zcmMgKyBvZmZz
ZXRfc3JjOworCQkJZHN0ID0gdmFkZHJfZHN0ICsgb2Zmc2V0X2RzdDsKKwkJCWFscGhhID0gc3Jj
WzNdICsgMTsKKwkJCWludl9hbHBoYSA9IDI1NiAtIHNyY1szXTsKKwkJCWRzdFswXSA9IChhbHBo
YSAqIHNyY1swXSArIGludl9hbHBoYSAqIGRzdFswXSkgPj4gODsKKwkJCWRzdFsxXSA9IChhbHBo
YSAqIHNyY1sxXSArIGludl9hbHBoYSAqIGRzdFsxXSkgPj4gODsKKwkJCWRzdFsyXSA9IChhbHBo
YSAqIHNyY1syXSArIGludl9hbHBoYSAqIGRzdFsyXSkgPj4gODsKKwkJCWRzdFszXSA9IDB4ZmY7
CiAJCX0KIAkJaV9kc3QrKzsKIAl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
