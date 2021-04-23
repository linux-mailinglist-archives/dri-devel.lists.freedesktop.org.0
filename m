Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A796368F8F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 11:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F016E0A2;
	Fri, 23 Apr 2021 09:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943B96E0A2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:42:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgwfYdWsdJtDBjHBDlbMkCrbYl8M68pUj54mRp03/2jrk+R/CG5sp+u7rzde7C0CVX3XGyR1tMeFdqy6CUtO3p1cpOf6h2/piPky+nCReuQ7jWhNX5jOQVueh4jZbFPTU0VAXvOzCh9mCd4QgB9adlmzZy0sorEk+dDlAC3Acowb+fpUEAaNTsA3/Do+tkkG3V06ZVkrTZTT7fwkWE9l7QWrqtfaQMKpkN90fTOQNHt7YKKkR6cD5prcpO4jelH+dnZF9bL9tFr10G7vDKd46aK7/voYIF/R7bWNNljd+qBmU+j96oE34cyjLWcA2CX9XC4D6E+PvgFBkqCGDn4VVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdu3u3yeBunLeUPDtKnG3pTLe15EG3f1+C2OXax/s1Q=;
 b=fREwRF+h+tW+KIeCcZAoN9xwmRaSKFJVXN6baQa2+4nFIYom4JoTYoLpDweg5J8R+/uUZuHhqNFNQi5aR5142u1/DyPIy911MDaSCPkEH+i2+xV+Odl/okwvoLKtN+8Sof+crBQ+pMAQrNK8tRlD1ztkR/2BqWMf3HNpEZIqk9OEEs+0dpQNL3Hrgq9RZgKfezIeXxfPPYMARIOVR9grtYjSPOKYP9jkuGMoreSAngr+vjBheMxMrx2pgKN2bFm5qnPttXiZd0lV4/Xk0tjASrJy2xRP8oR5zwzgMEZ/78C+G2d746XHH+X/nlZp93iUTMEYseEwDwt2cF/cIaFo6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdu3u3yeBunLeUPDtKnG3pTLe15EG3f1+C2OXax/s1Q=;
 b=aJYOwcnYPrTO8Sze4HSwh3idhDO8CAljNiVL4v2YXIm0kr3xbyLUtMAD0giQQ6tIOGkOL40VQQHGEIkTC3fQcQXhpFe59B9DLxQV7Looj4ix3XiRo99lfH9KnUdM4mwHlLDEHlmJp/aQTYWWVGAqOrD/Ckz4qY/CTTMKfp1Q9Io=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5711.eurprd04.prod.outlook.com (2603:10a6:803:e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 09:42:25 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::a5f3:fde9:1d85:5f28]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::a5f3:fde9:1d85:5f28%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 09:42:25 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/bridge: nwl-dsi: Force a full modeset when
 crtc_state->active is changed to be true
Date: Fri, 23 Apr 2021 17:26:41 +0800
Message-Id: <1619170003-4817-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619170003-4817-1-git-send-email-victor.liu@nxp.com>
References: <1619170003-4817-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0181.apcprd02.prod.outlook.com
 (2603:1096:201:21::17) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR02CA0181.apcprd02.prod.outlook.com (2603:1096:201:21::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4065.20 via Frontend Transport; Fri, 23 Apr 2021 09:42:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd2e2aef-12f1-46db-6448-08d9063c19b0
X-MS-TrafficTypeDiagnostic: VI1PR04MB5711:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB571107F71BC677CBC9D3129A98459@VI1PR04MB5711.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VB2LFm2AXsyO8J+e9hkzBd/sGK91U4g/YAQLqdZ+N5r0/WM+a/c0S3HTj6kPzVLhDqcNjRm7XMIyVf1HTcDVFPe056kGJ5SCl8aVh8V7jVa8gbnY+NixQ9EKiWMp+Owdku63Oknu40NbZ22bYqIKWpbIVJn63iKF4c90CVqJjzK61C5AmTz9pehMS9KMDcVrN0Nu0xUuseq2zY+RsTif+NtMOxA/lHWTCsCxO0nSWBzVMm1s/naw/lHRvY17XQ++gJzeGU3WME9SEgaT9fCIpukXg3+5/Cn3hAmYZPWAbAsJrDbQIKSzRgggKUANhHTvGEzd7PWcjrboDaGs8B2yX7d7fJMs6LP6LcCOtbGsDIAp92lZQ4LXIqg3KJAY8c7jx9wjHTDuBQiIoHfqoSd0l0ngFGQG73YE4kvOBFSDTLEBDijc1ERZqnQx11puXyQKEk5cr/ZyiRnjVLJLFSeR9yvrug0/WYLL4a/jJfIX1WXWcirlehwKEwzn/PFX2510Vm7S2N9I88Il1nd2MoC9r6GXbCNysob4HM7l8NXmQROCAQXLWAGHUcuWatYnnlrr4G9FUTCziZew34+3gWtV+cH8wPMvmVlBKwB7B9Aw0VD+IyAXw8uf5Lpx94r2AWd/NbP4XoIIrj9ERh2YSbGDGnO0/keTuORds4C0vSKxkDo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(38100700002)(4326008)(8936002)(316002)(83380400001)(6916009)(52116002)(86362001)(6506007)(36756003)(6512007)(186003)(38350700002)(16526019)(66476007)(8676002)(26005)(7416002)(66556008)(66946007)(6486002)(2906002)(956004)(5660300002)(478600001)(6666004)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M04yd3hLTndtLzJPOVlIT245NFR6M2RsZUZFQ05YWFMvQVNaZ04zWWZIRE9x?=
 =?utf-8?B?SnVZOTZVMzV4aDdwUnFtVUdwN2xoRytJMEVvWnRBR094bjBuZkY3UDl2em1h?=
 =?utf-8?B?YVZvVStRMHhFZXFNNVl5bEpKNEZuODFpQ1kyeUZIU0I3aHErSnk4Zm1GRVVB?=
 =?utf-8?B?N2dKOEx2bkJPWVZ3UDRlUStmUWxoTVlITnB1bTkwZm0xVGVOVjBEOXlTM2Z5?=
 =?utf-8?B?cXJwNFc0eXJrNFF0R3ArQlhmeVI3ako0RWZBOHY1d3Y3Y1N5Zjkwc0VkZ2hE?=
 =?utf-8?B?WXMyS1laRUxCTXhqaXNSd0s3M0RtSHZYZTZ4MTVwcVNMNlF1MXdvcEE4RUNj?=
 =?utf-8?B?c0cwbUhlQnY5Zzdhdi9KMEpZRHphWW0zRkFMYUEvZkZKZWNNczZnakVRVHRZ?=
 =?utf-8?B?aGYyVnJ6TlMrTC9ZaXZKeWZKdTEycDZlSVQxc3lWVWxOR0llejFWUHhyaURN?=
 =?utf-8?B?TC8zdFZFbS9tVUJmQnhHUVk1Q1J2RG9ML2RwRVZCamdXd3pPL3JUSktsK2U5?=
 =?utf-8?B?cm9HNTVJaXJsenJkVHZlZWx3OXhSa0J4akJJTyswb1JTMENCbTZpb1dvMmVS?=
 =?utf-8?B?ZUp0UjEwVTUwdWlKd2g1S0ZMTTZVTEQwUzV2U3Vyc2xTSHFHejFsMmtEeUpR?=
 =?utf-8?B?eFJ2a0ZmbzV0Y0tWdXY4bFVYOHVsWDF3YmtmK2JYY0RjMEhqSEx2L3dDanF1?=
 =?utf-8?B?Z3lDYXZyU2VCTWphbVp3YWtwUmtrSnR1TjZMd1R1UHNsdEdQSnVOMHB2bWQ4?=
 =?utf-8?B?R3NWZktkZTliV1UwVS9yMW5lTnFYdDBRZ2lURFprQk1jL0gram1LZnZvZlRi?=
 =?utf-8?B?VTdWN3BuOUV5bCszUnhwc3Uxb0czOENhdHE0Ni9xWGU3VTFiR2ZtZkpnczk0?=
 =?utf-8?B?UGFkZDNDT2VINnFkUFFOK3dSNzlMYmhBL0VWRGdSQ0FRT0FlVFdBWDRBRUZS?=
 =?utf-8?B?VWpFRjdSU3pldmRwWjNNQW5LRjZvMUFacEdFZms0c09sT3N5T0hFL21hUWpy?=
 =?utf-8?B?a1FsTkIxNnEvbDVpOGV3eFM2L0w3TGdCZ0t4bHZyak9vUEFEeGRPTy9JU1BO?=
 =?utf-8?B?Mm5xQzV6cXFvdlJsUW5lWjZTQnhnTHhCLy9CUG5LbG91Tnh2MkN5K0dpLy9E?=
 =?utf-8?B?QzRQTGQ5SUgzcjFmRFp2eWF4Z1ZrNjdVSzRtaDYvU0VkSkFUeVh0ZENvZWNF?=
 =?utf-8?B?Q1F0VWorZXhxQUNwa254V2Z3elZrQTV3aFBOVm9ZKythSFRzZHg4a29zSzVC?=
 =?utf-8?B?c2EyNVVoczd5c25ua1FPcGY3bzlvdWN6SkdQWHk1RUNzeTB3NUlJSERMQUdM?=
 =?utf-8?B?V09uRndSTnZLOEt5UmI5Q2lmOU9xQmRqL2JXYlNJWDdOYXpkSHRZRVk5VzJs?=
 =?utf-8?B?Y3V5YjBnWFJLWU1pdGhncGxTL3kvL0Z2ZmdZV0s4czcyWHVyejZyakFwcXJR?=
 =?utf-8?B?ZVVwem5QTm5BTVEycko2R3JZUm5LTXdRN1JvL2VQdHUvY2Zha1g1c1JSaDNy?=
 =?utf-8?B?eGdkRVV6b3RZTlRHenpuT3YwRW1zd1grQzUyNUtqUlZRV0plaDVRSGlFT2Ny?=
 =?utf-8?B?TGNyQVpIU0hUQ2NoRms5WWRPam1Salk0d3NIbFFqUkcwVmlzSzVvM0xDN2ty?=
 =?utf-8?B?ZTRYTmJIR2xZMTNPUEVYbHh6c0lFaUc0U0dIR0tCZzlFL3hjWCt2R0RFOG91?=
 =?utf-8?B?M1p0V2txbldwdzdjcjIrK1dTYkltK29zVHAzV3dlMFFLaytzZkVvRk5OQVIy?=
 =?utf-8?Q?3/GyQAF4CjTcw8nnhcPskrciqdcY+j3UdpjiL4W?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2e2aef-12f1-46db-6448-08d9063c19b0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 09:42:25.0169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUHd0BlroMRTJ/kTPXzHQ3T6TBEaOVtRSU++8FV/8bfCr7+U4b5lSRCVh2Q3uaBEo7Gpl3xFwFNYGXINZlcL6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5711
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie, agx@sigxcpu.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, robert.chiras@nxp.com,
 linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCByZXBsYWNlcyAtPm1vZGVfZml4dXAoKSB3aXRoIC0+YXRvbWljX2NoZWNrKCkg
c28gdGhhdAphIGZ1bGwgbW9kZXNldCBjYW4gYmUgcmVxdWVzdGVkIGZyb20gdGhlcmUgd2hlbiBj
cnRjX3N0YXRlLT5hY3RpdmUKaXMgY2hhbmdlZCB0byBiZSB0cnVlKHdoaWNoIGltcGxpZXMgb25s
eSBjb25uZWN0b3IncyBEUE1TIGlzIGJyb3VnaHQKb3V0IG9mICJPZmYiIHN0YXR1cywgdGhvdWdo
IG5vdCBuZWNlc3NhcmlseSkuICBCcmlkZ2UgZnVuY3Rpb25zIGFyZQphZGRlZCBvciBjaGFuZ2Vk
IHRvIGFjY29tbW9kYXRlIHRoZSAtPmF0b21pY19jaGVjaygpIGNhbGxiYWNrLiAgVGhhdApmdWxs
IG1vZGVzZXQgaXMgbmVlZGVkIGJ5IHRoZSB1cC1jb21pbmcgcGF0Y2ggd2hpY2ggZ2V0cyBNSVBJ
IERTSQpjb250cm9sbGVyIGFuZCBQSFkgcmVhZHkgaW4gLT5tb2RlX3NldCgpLCBiZWNhdXNlIGl0
IG1ha2VzIHN1cmUKLT5tb2RlX3NldCgpIGFuZCAtPmF0b21pY19kaXNhYmxlKCkgYXJlIGNhbGxl
ZCBpbiBwYWlycy4KCkNjOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzog
TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgpDYzogUm9iZXJ0IEZvc3Mg
PHJvYmVydC5mb3NzQGxpbmFyby5vcmc+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28u
c2U+CkNjOiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+CkNjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+CkNjOiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgpDYzogUm9iZXJ0IENo
aXJhcyA8cm9iZXJ0LmNoaXJhc0BueHAuY29tPgpDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlt
eEBueHAuY29tPgpTaWduZWQtb2ZmLWJ5OiBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAuY29tPgot
LS0KdjItPnYzOgoqIFNwbGl0IGZyb20gdGhlIHNpbmdsZSBwYXRjaCBpbiB2MiB0byBjbGFyaWZ5
IGNoYW5nZXMuIChOZWlsKQoKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5jIHwgNjEg
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNl
cnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL253bC1kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5jCmluZGV4
IDY2YjY3NDAyZjFhY2QuLmM2NWNhODYwNzEyZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvbndsLWRzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5j
CkBAIC0yMSw2ICsyMSw3IEBACiAjaW5jbHVkZSA8bGludXgvc3lzX3NvYy5oPgogI2luY2x1ZGUg
PGxpbnV4L3RpbWU2NC5oPgogCisjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVy
Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9icmlkZ2UuaD4KICNpbmNsdWRlIDxkcm0vZHJtX21pcGlf
ZHNpLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9vZi5oPgpAQCAtNzQyLDcgKzc0Myw5IEBAIHN0YXRp
YyBpbnQgbndsX2RzaV9kaXNhYmxlKHN0cnVjdCBud2xfZHNpICpkc2kpCiAJcmV0dXJuIDA7CiB9
CiAKLXN0YXRpYyB2b2lkIG53bF9kc2lfYnJpZGdlX2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2Ug
KmJyaWRnZSkKK3N0YXRpYyB2b2lkCitud2xfZHNpX2JyaWRnZV9hdG9taWNfZGlzYWJsZShzdHJ1
Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAorCQkJICAgICAgc3RydWN0IGRybV9icmlkZ2Vfc3RhdGUg
Km9sZF9icmlkZ2Vfc3RhdGUpCiB7CiAJc3RydWN0IG53bF9kc2kgKmRzaSA9IGJyaWRnZV90b19k
c2koYnJpZGdlKTsKIAlpbnQgcmV0OwpAQCAtODAzLDE3ICs4MDYsNiBAQCBzdGF0aWMgaW50IG53
bF9kc2lfZ2V0X2RwaHlfcGFyYW1zKHN0cnVjdCBud2xfZHNpICpkc2ksCiAJcmV0dXJuIDA7CiB9
CiAKLXN0YXRpYyBib29sIG53bF9kc2lfYnJpZGdlX21vZGVfZml4dXAoc3RydWN0IGRybV9icmlk
Z2UgKmJyaWRnZSwKLQkJCQkgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9k
ZSwKLQkJCQkgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqYWRqdXN0ZWRfbW9kZSkKLXsK
LQkvKiBBdCBsZWFzdCBMQ0RJRiArIE5XTCBuZWVkcyBhY3RpdmUgaGlnaCBzeW5jICovCi0JYWRq
dXN0ZWRfbW9kZS0+ZmxhZ3MgfD0gKERSTV9NT0RFX0ZMQUdfUEhTWU5DIHwgRFJNX01PREVfRkxB
R19QVlNZTkMpOwotCWFkanVzdGVkX21vZGUtPmZsYWdzICY9IH4oRFJNX01PREVfRkxBR19OSFNZ
TkMgfCBEUk1fTU9ERV9GTEFHX05WU1lOQyk7Ci0KLQlyZXR1cm4gdHJ1ZTsKLX0KLQogc3RhdGlj
IGVudW0gZHJtX21vZGVfc3RhdHVzCiBud2xfZHNpX2JyaWRnZV9tb2RlX3ZhbGlkKHN0cnVjdCBk
cm1fYnJpZGdlICpicmlkZ2UsCiAJCQkgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9pbmZvICpp
bmZvLApAQCAtODMxLDYgKzgyMywyNCBAQCBud2xfZHNpX2JyaWRnZV9tb2RlX3ZhbGlkKHN0cnVj
dCBkcm1fYnJpZGdlICpicmlkZ2UsCiAJcmV0dXJuIE1PREVfT0s7CiB9CiAKK3N0YXRpYyBpbnQg
bndsX2RzaV9icmlkZ2VfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCisJ
CQkJICAgICAgIHN0cnVjdCBkcm1fYnJpZGdlX3N0YXRlICpicmlkZ2Vfc3RhdGUsCisJCQkJICAg
ICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwKKwkJCQkgICAgICAgc3RydWN0
IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUpCit7CisJc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKmFkanVzdGVkX21vZGUgPSAmY3J0Y19zdGF0ZS0+YWRqdXN0ZWRfbW9kZTsKKworCS8q
IEF0IGxlYXN0IExDRElGICsgTldMIG5lZWRzIGFjdGl2ZSBoaWdoIHN5bmMgKi8KKwlhZGp1c3Rl
ZF9tb2RlLT5mbGFncyB8PSAoRFJNX01PREVfRkxBR19QSFNZTkMgfCBEUk1fTU9ERV9GTEFHX1BW
U1lOQyk7CisJYWRqdXN0ZWRfbW9kZS0+ZmxhZ3MgJj0gfihEUk1fTU9ERV9GTEFHX05IU1lOQyB8
IERSTV9NT0RFX0ZMQUdfTlZTWU5DKTsKKworCS8qIERvIGEgZnVsbCBtb2Rlc2V0IGlmIGNydGNf
c3RhdGUtPmFjdGl2ZSBpcyBjaGFuZ2VkIHRvIGJlIHRydWUuICovCisJaWYgKGNydGNfc3RhdGUt
PmFjdGl2ZV9jaGFuZ2VkICYmIGNydGNfc3RhdGUtPmFjdGl2ZSkKKwkJY3J0Y19zdGF0ZS0+bW9k
ZV9jaGFuZ2VkID0gdHJ1ZTsKKworCXJldHVybiAwOworfQorCiBzdGF0aWMgdm9pZAogbndsX2Rz
aV9icmlkZ2VfbW9kZV9zZXQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKIAkJCWNvbnN0IHN0
cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLApAQCAtODYyLDcgKzg3Miw5IEBAIG53bF9kc2lf
YnJpZGdlX21vZGVfc2V0KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCiAJZHJtX21vZGVfZGVi
dWdfcHJpbnRtb2RlbGluZShhZGp1c3RlZF9tb2RlKTsKIH0KIAotc3RhdGljIHZvaWQgbndsX2Rz
aV9icmlkZ2VfcHJlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQorc3RhdGljIHZv
aWQKK253bF9kc2lfYnJpZGdlX2F0b21pY19wcmVfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpi
cmlkZ2UsCisJCQkJIHN0cnVjdCBkcm1fYnJpZGdlX3N0YXRlICpvbGRfYnJpZGdlX3N0YXRlKQog
ewogCXN0cnVjdCBud2xfZHNpICpkc2kgPSBicmlkZ2VfdG9fZHNpKGJyaWRnZSk7CiAJaW50IHJl
dDsKQEAgLTg5Nyw3ICs5MDksOSBAQCBzdGF0aWMgdm9pZCBud2xfZHNpX2JyaWRnZV9wcmVfZW5h
YmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCiAJfQogfQogCi1zdGF0aWMgdm9pZCBud2xf
ZHNpX2JyaWRnZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKK3N0YXRpYyB2b2lk
Citud2xfZHNpX2JyaWRnZV9hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2Us
CisJCQkgICAgIHN0cnVjdCBkcm1fYnJpZGdlX3N0YXRlICpvbGRfYnJpZGdlX3N0YXRlKQogewog
CXN0cnVjdCBud2xfZHNpICpkc2kgPSBicmlkZ2VfdG9fZHNpKGJyaWRnZSk7CiAJaW50IHJldDsK
QEAgLTk0MiwxNCArOTU2LDE3IEBAIHN0YXRpYyB2b2lkIG53bF9kc2lfYnJpZGdlX2RldGFjaChz
dHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9i
cmlkZ2VfZnVuY3MgbndsX2RzaV9icmlkZ2VfZnVuY3MgPSB7Ci0JLnByZV9lbmFibGUgPSBud2xf
ZHNpX2JyaWRnZV9wcmVfZW5hYmxlLAotCS5lbmFibGUgICAgID0gbndsX2RzaV9icmlkZ2VfZW5h
YmxlLAotCS5kaXNhYmxlICAgID0gbndsX2RzaV9icmlkZ2VfZGlzYWJsZSwKLQkubW9kZV9maXh1
cCA9IG53bF9kc2lfYnJpZGdlX21vZGVfZml4dXAsCi0JLm1vZGVfc2V0ICAgPSBud2xfZHNpX2Jy
aWRnZV9tb2RlX3NldCwKLQkubW9kZV92YWxpZCA9IG53bF9kc2lfYnJpZGdlX21vZGVfdmFsaWQs
Ci0JLmF0dGFjaAkgICAgPSBud2xfZHNpX2JyaWRnZV9hdHRhY2gsCi0JLmRldGFjaAkgICAgPSBu
d2xfZHNpX2JyaWRnZV9kZXRhY2gsCisJLmF0b21pY19kdXBsaWNhdGVfc3RhdGUJPSBkcm1fYXRv
bWljX2hlbHBlcl9icmlkZ2VfZHVwbGljYXRlX3N0YXRlLAorCS5hdG9taWNfZGVzdHJveV9zdGF0
ZQk9IGRybV9hdG9taWNfaGVscGVyX2JyaWRnZV9kZXN0cm95X3N0YXRlLAorCS5hdG9taWNfcmVz
ZXQJCT0gZHJtX2F0b21pY19oZWxwZXJfYnJpZGdlX3Jlc2V0LAorCS5hdG9taWNfY2hlY2sJCT0g
bndsX2RzaV9icmlkZ2VfYXRvbWljX2NoZWNrLAorCS5hdG9taWNfcHJlX2VuYWJsZQk9IG53bF9k
c2lfYnJpZGdlX2F0b21pY19wcmVfZW5hYmxlLAorCS5hdG9taWNfZW5hYmxlCQk9IG53bF9kc2lf
YnJpZGdlX2F0b21pY19lbmFibGUsCisJLmF0b21pY19kaXNhYmxlCQk9IG53bF9kc2lfYnJpZGdl
X2F0b21pY19kaXNhYmxlLAorCS5tb2RlX3NldAkJPSBud2xfZHNpX2JyaWRnZV9tb2RlX3NldCwK
KwkubW9kZV92YWxpZAkJPSBud2xfZHNpX2JyaWRnZV9tb2RlX3ZhbGlkLAorCS5hdHRhY2gJCQk9
IG53bF9kc2lfYnJpZGdlX2F0dGFjaCwKKwkuZGV0YWNoCQkJPSBud2xfZHNpX2JyaWRnZV9kZXRh
Y2gsCiB9OwogCiBzdGF0aWMgaW50IG53bF9kc2lfcGFyc2VfZHQoc3RydWN0IG53bF9kc2kgKmRz
aSkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
