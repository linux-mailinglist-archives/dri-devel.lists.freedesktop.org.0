Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 629B32D7143
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74DF6EC84;
	Fri, 11 Dec 2020 08:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50095.outbound.protection.outlook.com [40.107.5.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46366E536
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:01:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyb8XB/sHzQgWUcRq4fdVIVO71WzFHUz6r+kWMejzviJwNEEIokjg2aRN7mKRM5bMKrxx37u5Vka0TY8OmVs/6HuOYhE31eU+TsNiO3JV6ysDqx2FELDu/arMjNWjYNWyCf2qxVxcjUV17UymVoWj00fYpf9RCl0yWBrecppT1+noKPeEPW7sMxVd+OITQ1efdafcAC0kQaLXZKWftAu/Cu/Kd5Be7QseLg/V4+Yn/cWJOYIHgrC0Y6tkuuh14qCtiixMLrwWLpxYQenWDx6YS5oOYYnL6qwCJ06vmMYXikmTs2mwhU+1nfoWgh1oxkz/DjjZ1IdfoEa+xTpAD/gig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/w6DGfBZaqRXK0w0HB0dcft/3aTxTOjArxX/m39zMw=;
 b=XQoBAhOVK+oqkF0WgLXXs4aVrO8s5/ywa9ObJPxauudnrCFG0HYkTSSUSmojZv2p97chyzTuAT6wMaV11L9KTQ4Wq/DOALhjmvhq/HJ9kAAYSm12V/mX0LlOck3oP70y2kMeYMvofkJ4vWndMfquOZMMjIi0PsYbgqFAYLmKoHg78vDeKAquWK2Vi9u0+Qq37axaPKEKElP+su8n0zRl4ENWEZ6K9CZy0wqBLrMZXOr2T75Sl0Ni7I8T5KJG6uCVqcuyeQ6SKvJqgMRCC06U09PjLYMuu2ffXIGm/X6kR2JlsDyN+5e4wRBnNhrotbOuOjEoSmaQ6TZzr8FmuPi1ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/w6DGfBZaqRXK0w0HB0dcft/3aTxTOjArxX/m39zMw=;
 b=BBhxecqd5CPPW5WbTpcj2AZWdDyU926JqLJGLhAlbnUVvhZEP2EbFz9p4iy/YE5YaG5vVKm8tDfo6L4KmR/jUr3ESwoq6fwo2QZtbBdEjcRpuYL2hU+nkJWHSwWvuxLVS96AU7x17DNNXBXefASl5KN5Tkg2wFi/7jg3YI4UHck=
Authentication-Results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM9PR10MB4312.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 10 Dec
 2020 15:01:38 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9d5:953d:42a3:f862]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9d5:953d:42a3:f862%7]) with mapi id 15.20.3654.012; Thu, 10 Dec 2020
 15:01:38 +0000
Subject: Re: [PATCH 2/3] drm/exynos: Scale the DSIM PHY HFP/HBP/HSA to lanes
 and bpp
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20201005134250.527153-1-marex@denx.de>
 <20201005134250.527153-2-marex@denx.de>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <117ac9a9-3355-7d00-8e2b-2af05157b2f7@kontron.de>
Date: Thu, 10 Dec 2020 16:01:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201005134250.527153-2-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [109.250.142.243]
X-ClientProxiedBy: AM0PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:208:1::27) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (109.250.142.243) by
 AM0PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:208:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 15:01:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77236acf-2444-42f0-f47a-08d89d1c7e8f
X-MS-TrafficTypeDiagnostic: AM9PR10MB4312:
X-Microsoft-Antispam-PRVS: <AM9PR10MB4312B27FC8B6778159521539E9CB0@AM9PR10MB4312.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0J480A/kGGycpDr/nL05Ige0p0rglvlzHvCaja0+civagTPRVDJ3zh8xzw4yGskKJYgmHpPECVoYf1GzTYIXd+ijIbA0Ex7TP/v4OcRjhWk0xDRckqUwRIG7pX/c9HsjDOZq9Rb9aRxSNvdgQ7qOHJuXe3g1pdRRC4vvaLIfPCR63WMc+HDD/syUpYaypnLwXOKxbgU96Lj1iru6X88C9PBSPKc+3EM94iZ6aQoTK+VRL6DCCzYogOIaBjoXO0F441Z0QSn42VAGVxUDFZi63KREs/SMHLt7S3+mmDM5j4TUioUQmhKKzOxR+XkO8cud5c6NbupkeGCO5TRJDyuBNGmomr5pRagg24UGQP9MCkXieZEDjZc7YGAHR3eYdJtFnLUZ2ZTezNZpZgWxSBQJT4qi7Ua6OLgxFqhLNr4UZmagtXCZo7UvXSp6cHiUjVKlBgPveDgvboSPwAW248LW+8Jf0Vbzo6ONYP+le9VgFps=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(31696002)(52116002)(53546011)(5660300002)(66476007)(31686004)(7416002)(44832011)(8936002)(66946007)(66556008)(956004)(86362001)(478600001)(2616005)(4326008)(26005)(45080400002)(36756003)(16526019)(16576012)(316002)(66574015)(966005)(83380400001)(2906002)(8676002)(6486002)(54906003)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VTRQM3NycW5CMmRTendIZWs3MUg0aGtnSGpJdC81eURRc0hoUWJZUXp1b2lC?=
 =?utf-8?B?KzliUklnM1lGNklMRk5Mci9ab25sWDBKRFFGMW5XcU4zOUZsTElzVWkwNEJ3?=
 =?utf-8?B?UndoTVkxYlhPcjVWanBkbFltM2hFM0Fva2NDWFFXYlI1SURaeVVFMVBqb1pX?=
 =?utf-8?B?aElYc0x6anlHT0sxSnZVSFJPcUUyWjdVSlcyRDQxaWgzdlhMS3JBQnNDcnVt?=
 =?utf-8?B?eElhL1hVWExRQ3lzVmIyY0J1TXJ2ck83TmZXcWVOcjZYSVhDN2lwb0V3akZx?=
 =?utf-8?B?cDRyck1QTFBQQmtuWXkrK0tLdE94VHYybGkxbHB2UDJpZDh1K1BvWnJrKzJD?=
 =?utf-8?B?UlozcjNFOFJ4OC9sOEg1d1hDMWVpK3dEWkx0Y1EySENPNS93bHhIY3c1c2Vz?=
 =?utf-8?B?SXZTcWduTjIyb2oycXdkc3NIRStwN3laZmpVQ3dseHBDYXE4UktZcnA3S1Bi?=
 =?utf-8?B?eks1VXp6Z1FFMHI4OUZrMEZGQ3RRSG50WUpRWW5aMW4wc20xSXJDWHFsdTJK?=
 =?utf-8?B?YVMwdDRoZXdGWk5mSWV0K28yZmh2MnF5RVk2RTk5RS9SODZsaktDajFUR3lU?=
 =?utf-8?B?VWRzWUNlZFVlak50VUcreVpDZUFXVzUzYzFMVlcvRGFSNkpxNlMxUEE0eVJz?=
 =?utf-8?B?ckcrTnJtUk9GYTdHUHluUjVnT3ord3VSS0ppcTJQQWJLMjJjbFFNM1Q1a1lP?=
 =?utf-8?B?UE42ci9pSU13S2gwQms2bHJ6WCtENStoWlFHeGFaUFN0TS9yckhSUW9RYW0v?=
 =?utf-8?B?dVFmTlBhcGJsSE9VWXkzYmVaT3JLeXNOY2hoeWdWSFZmeGxpUkpXVklIY21W?=
 =?utf-8?B?cUlLd09VNXgvczcySFlNL2QxYTNURzRtSWtxTHNLMytIbDE2emhkOEFkNU4v?=
 =?utf-8?B?alMzQ2oxZVdhV2MvVDk3RFY1UEZrc3pRUXNHb1I0a0h1cmpTc2JIOGhuYndv?=
 =?utf-8?B?UXZsemdIa2hBbFk2U3NWbFlub1BWZUtRcTNPdnUza3A4ZEJmU2djSjJIOUtW?=
 =?utf-8?B?dS9Kd0xsYWhzU3V5MSt4cm5Ya3Z6SmZZOVE2aU9NZ2RQSmxTWnZOdmtoeXRl?=
 =?utf-8?B?RHlVa05rU1NGeGI3ZXkzbWFjR3pQcmFhdlNGU2lDeHBDalBZdkk0eXRCUEpq?=
 =?utf-8?B?KzkrNjh3eEI1RXFuR2RZRHdWM2prTDRseUVDZkVXV250NnpDVW9XTHozaEVw?=
 =?utf-8?B?eHIvbS9pL0g4QlR2WXhmZUFaL1F5b0N5MVRFc211Q3VMWTlEQy9aWVQ2R29j?=
 =?utf-8?B?c3FyaEFkMk9vWGY5SWZCZ01mQTBrbjhFUUZxWDBJSXlQR3V2UmdLWURSTUxQ?=
 =?utf-8?Q?uooKBFvmZFCG6TztGdHHtF4CmRT9LZBt5i?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 15:01:38.0214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-Network-Message-Id: 77236acf-2444-42f0-f47a-08d89d1c7e8f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPlvN5OkAuBgbJn3hRPMcBagt9czi2kxVnYLrMO7mtZ2tvdsdNHwPIjgFOV/+JVXJAjX79E1xsWavV3vz9D0P55zduv/uc974qF5fp0eN28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4312
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:08 +0000
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
Cc: linux-samsung-soc@vger.kernel.org,
 =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUuMTAuMjAgMTU6NDIsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IFRoZSB2YWx1ZSBwcm9ncmFt
bWVkIGludG8gaG9yaXpvbnRhbCBwb3JjaCBhbmQgc3luYyByZWdpc3RlcnMgbXVzdCBiZQo+IHNj
YWxlZCB0byB0aGUgY29ycmVjdCBudW1iZXIgb2YgRFNJIGxhbmVzIGFuZCBicHAsIG1ha2UgaXQg
c28uCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4gQ2M6
IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KPiBDYzogR3VpZG8gR8O8bnRoZXIg
PGFneEBzaWd4Y3B1Lm9yZz4KPiBDYzogSmFlaG9vbiBDaHVuZyA8amg4MC5jaHVuZ0BzYW1zdW5n
LmNvbT4KPiBDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IE1h
cmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KPiBDYzogTWljaGFlbCBU
cmV0dGVyIDxtLnRyZXR0ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IE5YUCBMaW51eCBUZWFtIDxs
aW51eC1pbXhAbnhwLmNvbT4KPiBDYzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPgo+
IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc2Ft
c3VuZy1zb2NAdmdlci5rZXJuZWwub3JnCj4gVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiAtLQo+IE5PVEU6IFRoaXMgZGVwZW5kcyBvbiBodHRwczovL2V1cjA0LnNhZmVsaW5r
cy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZwYXRjaHdvcmsua2Vy
bmVsLm9yZyUyRnByb2plY3QlMkZkcmktZGV2ZWwlMkZsaXN0JTJGJTNGc2VyaWVzJTNEMzQ3NDM5
JmFtcDtkYXRhPTAyJTdDMDElN0NmcmllZGVyLnNjaHJlbXBmJTQwa29udHJvbi5kZSU3Q2E4OGYw
Y2RlYzEzNzQ1MTAzM2FiMDhkODY5MzRkYmU2JTdDOGM5ZDNjOTczZmQ5NDFjOGEyYjE2NDZmMzk0
MmRhZjElN0MwJTdDMCU3QzYzNzM3NTAyMzAzNDE1ODcwOCZhbXA7c2RhdGE9bDJwbkMwZGZ1ZWFB
R1Nmd0hPSzNPcEJVSiUyRnhuYkZLcmxwUldsQmFrVnZvJTNEJmFtcDtyZXNlcnZlZD0wCj4gLS0t
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NhbXN1bmctZHNpbS5jIHwgOSArKysrKystLS0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2Ftc3VuZy1kc2ltLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3NhbXN1bmctZHNpbS5jCj4gaW5kZXggZmJkODdhNzRlYjlmLi40
MmI0OTU0NmRkMDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zYW1zdW5n
LWRzaW0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2Ftc3VuZy1kc2ltLmMKPiBA
QCAtNzQwLDIwICs3NDAsMjMgQEAgc3RhdGljIHZvaWQgc2Ftc3VuZ19kc2ltX3NldF9kaXNwbGF5
X21vZGUoc3RydWN0IHNhbXN1bmdfZHNpbSAqZHNpKQo+ICAgewo+ICAgCXN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlICptID0gJmRzaS0+bW9kZTsKPiAgIAl1bnNpZ25lZCBpbnQgbnVtX2JpdHNfcmVz
b2wgPSBkc2ktPmRyaXZlcl9kYXRhLT5udW1fYml0c19yZXNvbDsKPiArCWludCBicHA7Cj4gICAJ
dTMyIHJlZzsKPiAgIAo+ICAgCWlmIChkc2ktPm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9NT0RFX1ZJ
REVPKSB7Cj4gKwkJYnBwID0gbWlwaV9kc2lfcGl4ZWxfZm9ybWF0X3RvX2JwcChkc2ktPmZvcm1h
dCkgLyA4Owo+ICsKPiAgIAkJcmVnID0gRFNJTV9DTURfQUxMT1coMHhmKQo+ICAgCQkJfCBEU0lN
X1NUQUJMRV9WRlAobS0+dnN5bmNfc3RhcnQgLSBtLT52ZGlzcGxheSkKPiAgIAkJCXwgRFNJTV9N
QUlOX1ZCUChtLT52dG90YWwgLSBtLT52c3luY19lbmQpOwo+ICAgCQlzYW1zdW5nX2RzaW1fd3Jp
dGUoZHNpLCBEU0lNX01WUE9SQ0hfUkVHLCByZWcpOwo+ICAgCj4gLQkJcmVnID0gRFNJTV9NQUlO
X0hGUChtLT5oc3luY19zdGFydCAtIG0tPmhkaXNwbGF5KQo+IC0JCQl8IERTSU1fTUFJTl9IQlAo
bS0+aHRvdGFsIC0gbS0+aHN5bmNfZW5kKTsKPiArCQlyZWcgPSBEU0lNX01BSU5fSEZQKChtLT5o
c3luY19zdGFydCAtIG0tPmhkaXNwbGF5KSAqIGJwcCAvIGRzaS0+bGFuZXMpCj4gKwkJCXwgRFNJ
TV9NQUlOX0hCUCgobS0+aHRvdGFsIC0gbS0+aHN5bmNfZW5kKSAqIGJwcCAvIGRzaS0+bGFuZXMp
Owo+ICAgCQlzYW1zdW5nX2RzaW1fd3JpdGUoZHNpLCBEU0lNX01IUE9SQ0hfUkVHLCByZWcpOwo+
ICAgCj4gICAJCXJlZyA9IERTSU1fTUFJTl9WU0EobS0+dnN5bmNfZW5kIC0gbS0+dnN5bmNfc3Rh
cnQpCj4gLQkJCXwgRFNJTV9NQUlOX0hTQShtLT5oc3luY19lbmQgLSBtLT5oc3luY19zdGFydCk7
Cj4gKwkJCXwgRFNJTV9NQUlOX0hTQSgobS0+aHN5bmNfZW5kIC0gbS0+aHN5bmNfc3RhcnQpICog
YnBwIC8gZHNpLT5sYW5lcyk7Cj4gICAJCXNhbXN1bmdfZHNpbV93cml0ZShkc2ksIERTSU1fTVNZ
TkNfUkVHLCByZWcpOwoKSSBkaWQgYSBiaXQgb2YgdGVzdGluZyB3aXRoIHRoZSBEU0lNIGFuZCBC
TEstQ1RMIG9uIGkuTVg4TU0gYW5kIEknbSAKc2VlaW5nIHNvbWUgaXNzdWVzIHdpdGggdGhlc2Ug
c2V0dGluZ3MuIEkgdGhpbmsgeW91ciBjaGFuZ2VzIGFyZSAKY29ycmVjdCwgYnV0IHRvIGdldCBt
eSBkaXNwbGF5IGNvbmZpZ3VyYXRpb24gd29ya2luZyBJIHN0aWxsIG5lZWQgdG8gYWRkIAp0aGlz
IFsxXSBwb3J0ZWQgZnJvbSB0aGUgZG93bnN0cmVhbSBkcml2ZXIgWzJdLiBUaG91Z2gsIEkgY2Fu
J3QgcmVhbGx5IAp0ZWxsIGlmIHRoaXMgaXMgYSBjb3JyZWN0IGZpeCBvciBzb21ldGhpbmcgZWxz
ZSBpcyB3cm9uZy4KClsxXSAKaHR0cHM6Ly9naXRodWIuY29tL2ZzY2hyZW1wZi9saW51eC9jb21t
aXQvNjVlNTBlYmMzODcwNmNhOWI1YjNkZWM4YTZhYjliMjg5MDdmNWQzYQpbMl0gCmh0dHBzOi8v
c291cmNlLmNvZGVhdXJvcmEub3JnL2V4dGVybmFsL2lteC9saW51eC1pbXgvdHJlZS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3NlYy1kc2ltLmM/aD1pbXhfNS40LjQ3XzIuMi4wI245MzIKCj4gICAJ
fQo+ICAgCXJlZyA9ICBEU0lNX01BSU5fSFJFU09MKG0tPmhkaXNwbGF5LCBudW1fYml0c19yZXNv
bCkgfAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
