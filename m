Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE2AC9DAB7
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 04:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3111810E08C;
	Wed,  3 Dec 2025 03:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="DxyOpQY1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3297.qiye.163.com (mail-m3297.qiye.163.com
 [220.197.32.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1F010E08C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 03:43:20 +0000 (UTC)
Received: from [127.0.0.1] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2bc7112f7;
 Wed, 3 Dec 2025 11:43:13 +0800 (GMT+08:00)
Content-Type: multipart/mixed; boundary="------------ibfxk5uvVnZVZkaj3GgG7APC"
Message-ID: <722dd7f8-f3b9-4877-a70c-57c3f9bb0cd7@rock-chips.com>
Date: Wed, 3 Dec 2025 11:43:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Vicente Bergas <vicencb@gmail.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 alexander.sverdlin@siemens.com, andrzej.hajda@intel.com, devarsht@ti.com,
 dri-devel <dri-devel@lists.freedesktop.org>, jernej.skrabec@gmail.com,
 Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, lumag@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, nm@ti.com, rfoss@kernel.org, simona@ffwll.ch,
 tomi.valkeinen@ideasonboard.com, tzimmermann@suse.de, vigneshr@ti.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Damon Ding <damon.ding@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Damon Ding <damon.ding@rock-chips.com>,
 Linus Walleij <linusw@kernel.org>,
 Linux Rockchip Support List <linux-rockchip@lists.infradead.org>
References: <CAAMcf8BfxMJx+5ttEXx0kONP2OYWSLFqEYF6rfVBKoRg5TKZzQ@mail.gmail.com>
 <bea50d14-2311-46ad-bb30-9d60a4c5e3a2@linux.dev>
 <ff21cbd1-dc77-43ae-85a8-dc6a56a1cefa@linux.dev>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <ff21cbd1-dc77-43ae-85a8-dc6a56a1cefa@linux.dev>
X-HM-Tid: 0a9ae24e984403abkunm0adb7a582f9f82
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR5OSFZOQk9NSkgeQkIeSE9WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=DxyOpQY1c2S5odERUqbG+ejePkq0NL0KrSp7pDZYTso1murgA41HkrgZ0fHUJFcrzqf893RLFYkWH/ED6MxHe1szCe3s7dz246MdT+kRQXUbyFAkaedgbErkHQJxU6r6qf7m7rJo/6N/eVlCM4ARSCWX97FqJ3YZGTijj95jpnU=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=gt+DfjUCDJfsLBVC0wsJWY5c6P4JYa2JJr1RFC2hgto=;
 h=date:mime-version:subject:message-id:from;
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------ibfxk5uvVnZVZkaj3GgG7APC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Aradhya,

On 10/6/2025 11:30 PM, Aradhya Bhatia wrote:
> +rockchip maintainers
> 
> Hi Vicente, all,
> 
> 
> I went through the drivers and the affected areas in the gru-kevin
> chromebook pipeline last week, but nothing has stood out.
> 
> 
> Pipeline:
> 
> rockchip,display-subsystem / rk3399-vop (Big/Lite) (CRTC) ->
> rk3399-edp (Encoder) -> analogix_dp_core (Bridge) ->
> sharp,lq123p (edp-panel)
> 
> I am unable to debug this further since I do not have the hardware.
> 
> I could use some help, especially from folks who understand the hardware
> requirements better.
> 
>

Sorry for late reply. Could you please try the patch in the
attachment? I think this should work without PSR. Thank you.

-- 
Best, 
Chaoyi
--------------ibfxk5uvVnZVZkaj3GgG7APC
Content-Type: text/plain; charset=UTF-8;
 name="0001-drm-bridge-analogix_dp-Force-prepare-drm-panel-in-pr.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-bridge-analogix_dp-Force-prepare-drm-panel-in-pr.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBhZTJmNjJmMWU3MzhiMjJkNmYwNzI0ZTNkZDE0ZGYzZmRlNWFlNDM0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBDaGFveWkgQ2hlbiA8Y2hhb3lpLmNoZW5Acm9jay1j
aGlwcy5jb20+CkRhdGU6IFdlZCwgMyBEZWMgMjAyNSAxMToyOTo0MyArMDgwMApTdWJqZWN0
OiBbUEFUQ0hdIGRybS9icmlkZ2U6IGFuYWxvZ2l4X2RwOiBGb3JjZSBwcmVwYXJlIGRybSBw
YW5lbCBpbgogcHJlX2VuYWJsZQoKU2lnbmVkLW9mZi1ieTogQ2hhb3lpIENoZW4gPGNoYW95
aS5jaGVuQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5h
bG9naXgvYW5hbG9naXhfZHBfY29yZS5jIHwgMTEgLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jCmluZGV4IGVmZTUzNDk3N2QxMi4uMmM0
NDE1ZmMxZTZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4
L2FuYWxvZ2l4X2RwX2NvcmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxv
Z2l4L2FuYWxvZ2l4X2RwX2NvcmUuYwpAQCAtMTEyNiwxNyArMTEyNiw2IEBAIHN0YXRpYyB2
b2lkIGFuYWxvZ2l4X2RwX2JyaWRnZV9hdG9taWNfcHJlX2VuYWJsZShzdHJ1Y3QgZHJtX2Jy
aWRnZSAqYnJpZGdlLAogCQkJCQkJIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpvbGRfc3Rh
dGUpCiB7CiAJc3RydWN0IGFuYWxvZ2l4X2RwX2RldmljZSAqZHAgPSB0b19kcChicmlkZ2Up
OwotCXN0cnVjdCBkcm1fY3J0YyAqY3J0YzsKLQlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9s
ZF9jcnRjX3N0YXRlOwotCi0JY3J0YyA9IGFuYWxvZ2l4X2RwX2dldF9uZXdfY3J0YyhkcCwg
b2xkX3N0YXRlKTsKLQlpZiAoIWNydGMpCi0JCXJldHVybjsKLQotCW9sZF9jcnRjX3N0YXRl
ID0gZHJtX2F0b21pY19nZXRfb2xkX2NydGNfc3RhdGUob2xkX3N0YXRlLCBjcnRjKTsKLQkv
KiBEb24ndCB0b3VjaCB0aGUgcGFuZWwgaWYgd2UncmUgY29taW5nIGJhY2sgZnJvbSBQU1Ig
Ki8KLQlpZiAob2xkX2NydGNfc3RhdGUgJiYgb2xkX2NydGNfc3RhdGUtPnNlbGZfcmVmcmVz
aF9hY3RpdmUpCi0JCXJldHVybjsKIAogCWRybV9wYW5lbF9wcmVwYXJlKGRwLT5wbGF0X2Rh
dGEtPnBhbmVsKTsKIH0KLS0gCjIuNTEuMQoK

--------------ibfxk5uvVnZVZkaj3GgG7APC--
