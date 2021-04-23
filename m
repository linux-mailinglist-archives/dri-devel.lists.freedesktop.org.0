Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6B9368F90
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 11:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF6C6EB57;
	Fri, 23 Apr 2021 09:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E406E0A2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:42:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5qQQGotyW9SShMi8jJjb1uL55Wy4lLdMG07H7mNynX6lxadkBxfMpGtlyT0Sfm1dPg5Vlli4CsqFaO2iZF1uOvCQXerIJlo6sqXekfn9PCxXaIQMWUO5TDTGEtsvbMXbNx5Nthrtxg0O44eMVTqxy6aqQIX+n2CkP9bsMOM2BilCJVdMZzNj01ebt79B0EPl9CXtfL1QYtK3Eb57O/UolxRcfnIqQm7bCCqMGEP+xfgZnhXSw/tT2f9biBnHqp+DG7OLWSrazB17x7+knDCMeZHS7/J6UKi60kawKFQN/HzOJAUhGNDSnjL84Lh0n2TAEFQz3jJZmhbOw8f1gIfCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zN7uTnoMdBca21/6HbuOht3QClt+UJ7xIuodMVidhCE=;
 b=hBSr7GDN02qfSiJXssXSNh0AeU5CrGS4t58YjMQnZ5ym++ekWKj7eMKma3uUtk0PV3Au0GxUprvKD0ZD9qSNIWVP41VJ8Bh+g0Mt/ag9rzQMStKHq+fjY5Eak6G2itGv4Vcj5y4IGXtvDOvnB4cXFwOL4wLrb6not9gMXxobrOmLNDWizPRJQ5cBq0M7otNlB6kE/NHMF+VVj8dVJezix468WehZ+4vpDYhOUtp2t5EvKzUhxbMlx3u/blcKSwC0htRqhrYgJUtl33B9jwkOVgxB3YAM7+O+LYQOVeKqNfqCTPtcczeJY5HZs0HNrFGo9fvWUyIKZt6iX7ypB9x0zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zN7uTnoMdBca21/6HbuOht3QClt+UJ7xIuodMVidhCE=;
 b=GT/K/MluNksPog0URq5N6hm9kIQOqHysD3IwC4+j1NyNKvDFUGFCUvr3WTOMsfdKfJLxHLnRFI9w5soXOQ/mH2vPMswMztMmecSTAEJqRVpzL68tReXXznKlZI1Ju2uUVeMqOi1+UPsdv0GPRGRBts3aHVEEH59wQ/CJOKfAWI0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5711.eurprd04.prod.outlook.com (2603:10a6:803:e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 09:42:29 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::a5f3:fde9:1d85:5f28]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::a5f3:fde9:1d85:5f28%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 09:42:29 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/bridge: nwl-dsi: Remove a check on unchanged HS
 clock rate from ->mode_set()
Date: Fri, 23 Apr 2021 17:26:42 +0800
Message-Id: <1619170003-4817-3-git-send-email-victor.liu@nxp.com>
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
 15.20.4065.20 via Frontend Transport; Fri, 23 Apr 2021 09:42:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04d43dd8-7448-4e5f-5771-08d9063c1c0f
X-MS-TrafficTypeDiagnostic: VI1PR04MB5711:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB57111F85241F344CB8781BC498459@VI1PR04MB5711.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rb6EeJ/rngKPZZzM29DuzGKbuTBZjmzX3c6lw4pEQKL2s6/Q49cqigWgmjZHzd0bAs3ixj8qer9wueJ9C9IzAbUMfnHxsnsbQq6wx5XgpfGbrTbFw/HQ9/5SUo2JVGrw+qaGPHdrOdrVtPV+bS3WHbO/0sHhotUhtOiT/P1UZGhXQTmqxEKxgFz54kJcF999VvbyGMOR+Puk3wtHOApQQ14qR79Y5tlscMwYfvyUiPcAE2/32gMLB5IluhYgMyRc88hm/SSz6d7TqA3KvGMNnqW7ioPfWFjV30T3VRMki3x+qpyIQSZaDK65lpmN3R/6WxHjktPD3J6Ko7NH5U2UNRUrAKUgHvxJtOcBmKC2VOIzyqh8eOYkXbcISV5i2DL5zXiuoJ7bldSDSjt+wylOuECgh6U3UaojzkaxYbIZ2MfaN6OmW0i5zU0sd9cpAph9TcN0ecyXUuvZ31ZbQl0e7UoMT3zRzGNJE4ByHMc6ZnQVmMxOPu0IDs7b8pnaxmNMYmE9NYmhheOg7wULDW+AY58WUiRU+MOo2RJi+3wNYkDCULB1uyuVMm1hniq/qDgwivJuFbtuiDicphe/BD3gXBz36KX+5a4n0+xmf0lVhZUXj4mcOG//lKaJpmuPwzXN6FHqlUZLshYdGxd+tPWRMPy8vG0PvGaQwPOzStOQAT0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(38100700002)(4326008)(8936002)(316002)(83380400001)(6916009)(52116002)(86362001)(6506007)(36756003)(6512007)(186003)(38350700002)(16526019)(66476007)(8676002)(26005)(7416002)(66556008)(66946007)(6486002)(2906002)(956004)(5660300002)(478600001)(6666004)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TGMrWldmd3VtNnZFc3diQ3cwSG1RckVoeTQxZ1Rya3hKRWtDWXVpT1hCdjdr?=
 =?utf-8?B?dkNGOEhmSTVLOXQxMlBibG1lZjk3RVFCWnVPWUJlTHcrQzJyT3FBczF3aCt1?=
 =?utf-8?B?VWNWdi9pQk5kbjdLNzlNdEUybkRPQ1RkbjFFNzVTY2NCckVWSkVhdVpZV2xh?=
 =?utf-8?B?bVZ4S2V0cXVTeUlHMlNRZ1hOOEFDN0FNZ1RGYVdBZVJPWlZ4ZXRoUmdUQ3lJ?=
 =?utf-8?B?Tk9MOHhWWSs4WlV4MktSelFsQUcvMWd0WkJ4N2RUTzBQK1BFQlFVaC94a3Vh?=
 =?utf-8?B?QnY4Tis1TVFFUkd6a2JONGtLT0RoOGtBdU83NzJCc0xMSEZWbjU3cUphNVcx?=
 =?utf-8?B?WHErYmFTejQ5SzI3MlFBYzZWZGJNcHNCKzQ2RTl6dS85UWxFR2RCeFE2UERJ?=
 =?utf-8?B?S2VCU0g3TmhrMDJnblNvWXB4UW02OW5XVTlCYVJpeVp4elBYa0p3Kzhka0RE?=
 =?utf-8?B?Q28zTzJtNkY2UVY0RTlrS0hUMHRmaVZ6dEd1ZVRRSDhoUjZrRTJ1dHRJNENM?=
 =?utf-8?B?bVlzKytMelgwd3dFQktMOGtPOWZ6OUlBVVZkTnNsWk9ZaG5KSHhyUXR5MXQx?=
 =?utf-8?B?ZEU1SmU4Zm9tNVBWK05OTy9QQmdXNlpqdzFTeFR3TDhPbjNyRnY5TldBWW5O?=
 =?utf-8?B?SEVLOVZvQlp4NFFmRXhhS2xoUDFnV2tMc21vR0tHNnA5STdEMGNQejNvUUR5?=
 =?utf-8?B?dTlUZHFLVDRaTnQxak5oSENBQU54bEF5cEVoZGZWSXh3RThDS2tHanVnRWlC?=
 =?utf-8?B?RnRPbm5FZlpxUEhQc0xDS0x6UUFvU04zeDNqWHAwNVluOWRmTFBNVWhzZm5F?=
 =?utf-8?B?Q2lyVFZlSW1CdExBc0cvSzNqLzYxeExTYlhlR2EzQnUxbHhTZHhiTytpemZO?=
 =?utf-8?B?NW5kSzEwOGptUTFBTlFMT2pwT0hPbWxyQnR5VlFMMEEwUVRsQm5reEN0M2k2?=
 =?utf-8?B?akV2SG1TckU0VnRPR3R4dlo4R2szM2hnUXVsVHY3cmNjNTBnRmJ2RjRjMXBu?=
 =?utf-8?B?cGpOampySDhUUkpzbTRvU1ZoMnVuODk4TGE0bFhzWmtCMldtYTJGajl0OEZL?=
 =?utf-8?B?Y00vNjFCUXQ4L3VPTHY3eWNKTmlNYzlZa2dydjJvQW1LOHlsajloVkZxVk15?=
 =?utf-8?B?bkI0QWEybTRnaXBvd3VoTy8rY1VkV3FTdS9LNFNZelRmTHFJblNCYXZ1UGxi?=
 =?utf-8?B?QzRKaXlQakhxOEdoWmRaZy85Vi9NUFlyU1VpSUF0cHRGaHYxeWFDYXdoUmxY?=
 =?utf-8?B?eUFMTS9kN3NYVnZFZVdZUFdnM2RCS0U5MHRhL1pNeTlXSEU5d3hMaHVpeXZP?=
 =?utf-8?B?c2JhK0J5MS9vTldNRFRPc3lva1RWa25xQk0xOFU1dTJ5a1ZvZ3RGVlJWbjY1?=
 =?utf-8?B?eC8vVzU1eDcrSnp6M1lMTzJMUm1UbGgrQS9hVDZod2puOXBPL1pOckxkUSsv?=
 =?utf-8?B?eks2SVNKbm9MaVgxajFwNzRUUjRVa1loM3NZT3JkdUZPenVZRW5MZVlDd3l1?=
 =?utf-8?B?TWdDZXU0TGd0VWx4WitXR0pkb2xMREdJTlAvYzZXaGdsbjVud2xsOGh6S3Zz?=
 =?utf-8?B?WlVzL0xSWVBoRUpyWFpMMlBBcTVTWVU0RlFvemtqcTV0VW56WXNRRnhqN3A2?=
 =?utf-8?B?cDlpNkhLMTlGMEFiTlcwZThkalRwSlBrcnpGUUt2Q0IyNER0cU1QRkRNZGFL?=
 =?utf-8?B?UmE5cU1UWFZQTno3SzZaVk5sTVptajhlOEdoeEpCYkZKbzc3Nzk1VXhNdS9O?=
 =?utf-8?Q?JvWrNShlNSN3/lA6yis3aRBkth1sQ1YnprI3hbm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d43dd8-7448-4e5f-5771-08d9063c1c0f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 09:42:29.1275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGrP5P29MzlRnZ87zcJjJLv809wR1WsNdfTXoDWQ/qwPbxFvucGIX+zYpnANESJfWz1WZ6YNXxU/TDTvlvg24g==
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

VGhlIGNoZWNrIG9uIHVuY2hhbmdlZCBIUyBjbG9jayByYXRlIGluIC0+bW9kZV9zZXQoKSBpbXBy
b3Zlcwp0aGUgY2FsbGJhY2sncyBwZXJmb3JtYW5jZSBhIGJpdCBieSBlYXJseSByZXR1cm4uICBI
b3dldmVyLAp0aGUgdXAtY29taW5nIHBhdGNoIHdvdWxkIGdldCBNSVBJIERTSSBjb250cm9sbGVy
IGFuZCBQSFkgcmVhZHkKaW4gLT5tb2RlX3NldCgpIGFmdGVyIHRoYXQgY2hlY2ssIHRodXMgbGlr
ZWx5IHNraXBwZWQuClNvLCB0aGlzIHBhdGNoIHJlbW92ZXMgdGhhdCBjaGVjayB0byBtYWtlIHN1
cmUgTUlQSSBEU0kgY29udHJvbGxlcgphbmQgUEhZIHdpbGwgYmUgYnJvdWdodCB1cCBhbmQgdGFr
ZW4gZG93biBmcm9tIC0+bW9kZV9zZXQoKSBhbmQKLT5hdG9taWNfZGlzYWJsZSgpIHJlc3BlY3Rp
dmVseSBpbiBwYWlycy4KCkNjOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpD
YzogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgpDYzogUm9iZXJ0IEZv
c3MgPHJvYmVydC5mb3NzQGxpbmFyby5vcmc+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2li
b28uc2U+CkNjOiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+CkNjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+CkNjOiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgpDYzogUm9iZXJ0
IENoaXJhcyA8cm9iZXJ0LmNoaXJhc0BueHAuY29tPgpDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4
LWlteEBueHAuY29tPgpTaWduZWQtb2ZmLWJ5OiBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAuY29t
PgotLS0KdjItPnYzOgoqIFNwbGl0IGZyb20gdGhlIHNpbmdsZSBwYXRjaCBpbiB2MiB0byBjbGFy
aWZ5IGNoYW5nZXMuIChOZWlsKQoKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5jIHwg
NyAtLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
bndsLWRzaS5jCmluZGV4IGM2NWNhODYwNzEyZDIuLjYwMWNjYzRhN2NkYzcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvbndsLWRzaS5jCkBAIC04NTYsMTMgKzg1Niw2IEBAIG53bF9kc2lfYnJpZGdlX21vZGVf
c2V0KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCiAJaWYgKHJldCA8IDApCiAJCXJldHVybjsK
IAotCS8qCi0JICogSWYgaHMgY2xvY2sgaXMgdW5jaGFuZ2VkLCB3ZSdyZSBhbGwgZ29vZCAtIGFs
bCBwYXJhbWV0ZXJzIGFyZQotCSAqIGRlcml2ZWQgZnJvbSBpdCBhdG0uCi0JICovCi0JaWYgKG5l
d19jZmcubWlwaV9kcGh5LmhzX2Nsa19yYXRlID09IGRzaS0+cGh5X2NmZy5taXBpX2RwaHkuaHNf
Y2xrX3JhdGUpCi0JCXJldHVybjsKLQogCXBoeV9yZWZfcmF0ZSA9IGNsa19nZXRfcmF0ZShkc2kt
PnBoeV9yZWZfY2xrKTsKIAlEUk1fREVWX0RFQlVHX0RSSVZFUihkZXYsICJQSFkgYXQgcmVmIHJh
dGU6ICVsdVxuIiwgcGh5X3JlZl9yYXRlKTsKIAkvKiBTYXZlIHRoZSBuZXcgZGVzaXJlZCBwaHkg
Y29uZmlnICovCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
