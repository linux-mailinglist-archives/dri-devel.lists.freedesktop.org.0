Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 691FBFAB73
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521FB6E5BF;
	Wed, 13 Nov 2019 07:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23B16E13F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 20:45:59 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 799C9561B;
 Tue, 12 Nov 2019 15:45:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 12 Nov 2019 15:45:56 -0500
X-ME-Sender: <xms:AhrLXQqk1SmNfRF4fQr_VYy9RAJ0nOI_CWEPBy7JG9KZL_STUblqoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvledgudegfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghr
 nhhordhtvggthhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:AhrLXejeOsFk8fw-r4P-ywvYRss1srwrTsAITQuFoIXOKZmMiDNh0w>
 <xmx:AhrLXUm46IsygKQI_5zJtUHyPNJ73pm2FfEf51DXobuph8tajpMrvA>
 <xmx:AhrLXfqURe2cUyuiJEtSQyPynpcCpJN_-IjoM7ZUn100DjPWXrGwLQ>
 <xmx:AxrLXQE69hOaQByUCB6yeJJ_mBc7ChEiXkA9BoIqy48wdFWybBIV-A>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C533E80059;
 Tue, 12 Nov 2019 15:45:53 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] drm/bridge: anx6345: Fix compilation breakage on systems
 without CONFIG_OF
Date: Tue, 12 Nov 2019 21:45:51 +0100
Message-Id: <20191112204551.541449-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=dh3MWdqSOM6Nb844XJl+QWLdvQ
 fvEJolkdNnNoN6I6M=; b=Clq3uBFejDfsciINH80BC+dfoA9ngpU4AhKSZwl0co
 cUHGkSy/xh3QwPLXlQcpGNGgCobKvulSMjWJF848uydxmLz58ftoAkn3NvAvIp89
 aI3LLcC37wKXAfqMqnwfolQIIgnfTlg+PrTZfeLnDK0Jirp5HIOCHtVLDRyTTdvW
 3Jekf/HhhRBSzBqkfXrh3mq5Lu9c1EVvrt6qtZ/zX6qW6ynG0ur54u4zr6iqlOSv
 /5zG9L7Jz5y3xPZFJGN6ZkKje8dneHSzYFfmZg3kirrMQjqCR2tqFxUNQZqN6Tp8
 GEQma6s8ed0TfXtsHXGUdE+BlRMDkuGaQuRxSBO2aLUQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dh3MWdqSOM6Nb844X
 Jl+QWLdvQfvEJolkdNnNoN6I6M=; b=MDwbiSJIVJgTGRFc2as1qlSItAWVD5xJX
 5sZDeO3CavfZeauZUlE25UJm03aI2x1elHTbBl3hg29nSb36a2C2IZpgtmpno1rf
 jS4UdV9uoPlIlj6hY7GAltFvf9aGDHW84+Zjas6+KzqHG2PESlN0pa44QTkwrwCY
 ifbx56L/M0BXF1Xl0FQxlAX5g5pQA4yXhMRHVHYgsztIdpmlrWJSNP30UR5hUJ+O
 NWb6qUAjD0SU2EWgVkxkvYGk5sBVancm7jNJaaClz0erAEx+J7zJaiV2XmFyd7V5
 5/5VJCpgStQn47R+byLb/0JTHur6PvNe4hLueqPaxg5vGeR0OUbWA==
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
Cc: Torsten Duwe <duwe@lst.de>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBhc3N1bWVzIHRoYXQgdGhlIHBsYXRmb3JtIHVzZXMgdGhlIGRldmljZSB0cmVl
LCBhbmQgdGh1cyByZWxpZXMKb24gc29tZSBmaWVsZHMgKG9mX25vZGUpIGJlaW5nIGRlY2xhcmVk
IGluIHNvbWUgc3RydWN0dXJlcyAoZHJtX2JyaWRnZSkuCgpUaGlzIGlzbid0IHRydWUgZm9yIGFs
bCBwbGF0Zm9ybXMsIHNvIG1ha2Ugc3VyZSB3ZSBjYW4gb25seSBjb21waWxlIHRoZQpBTlg2MzQ1
IG9uIHBsYXRmb3JtcyB3aGVyZSBEVCBzdXBwb3J0IGlzIHNlbGVjdGVkLgoKQ2M6IFRvcnN0ZW4g
RHV3ZSA8ZHV3ZUBsc3QuZGU+CkZpeGVzOiA2YWExOTI2OTgwODkgKCJkcm0vYnJpZGdlOiBBZGQg
QW5hbG9naXggYW54NjM0NSBzdXBwb3J0IikKU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8
bWF4aW1lQGNlcm5vLnRlY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9L
Y29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25maWcgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25maWcKaW5kZXggMTQyNWE5NmEyOGMzLi5lMWZhN2Q4MjAz
NzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvS2NvbmZpZwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25maWcKQEAgLTEsNiArMSw3
IEBACiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIGNvbmZpZyBEUk1f
QU5BTE9HSVhfQU5YNjM0NQogCXRyaXN0YXRlICJBbmFsb2dpeCBBTlg2MzQ1IGJyaWRnZSIKKwlk
ZXBlbmRzIG9uIE9GCiAJc2VsZWN0IERSTV9BTkFMT0dJWF9EUAogCXNlbGVjdCBEUk1fS01TX0hF
TFBFUgogCXNlbGVjdCBSRUdNQVBfSTJDCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
