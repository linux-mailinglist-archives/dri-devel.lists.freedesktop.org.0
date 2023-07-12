Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AED875074F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 13:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D952810E4E6;
	Wed, 12 Jul 2023 11:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2135.outbound.protection.outlook.com [40.107.21.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E4710E4E6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 11:58:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3IMlAyd6qpGmFk/Yry8S6zfG4VWgz3bb3EZ37zuQES+Q2Il2SO1b6ikYp1jqCPjqhx1+Xlp3OofB9TRnxQvExHuEiaJNleum4g85DaZbLjHU8ZtxTu+hfHKzwRNGpqlJlNk0/ym6aLVHwju1ggt4ogLl9l4KMUFbS7UG/2x+DkvfPN7rfBrj95t0Ye/SUKgnEgR1xDddR8TeYTns4EZSZjWDTDhOWJ8CNGrhhQ/YIf8E/MnfaRIcCckvQ+i/dpVdh4e8YfCgrI1mrHaRkozwVja/63g5EPoRP8y3REy5OcnwIqaEujlRH3XzRmWKn/RZC00HvW98ytNW6qezbOnqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AU/8F9AA9T+NIN3B7LK6ZHWkI3bRTMp0IEFLmO658s=;
 b=FuvHVo4l3Ye2VyesDhQhBbIqrvTnYW9Q209TlmOzWkTf0EQJpXn9B4LsjmnXJqvnctRGNbAhCay2U3QjBs4g/yY5TxVoD3snMfRTvWNz8lXFBNSjB2/5mP3FzPEg/3oT83Jfgj2YVRFMH4lDWgd0R5gG0JmVSCetncCCIX+nQL0ScOfb+eNMKshmII2H2oaWKnK2F9eGbcxrokezirwlijsIxCY7uwSsPVJKtVpm6Hd7o43mYcLryPD3LV0AmRnOetyS+Px2+IO1nHHvVGz9rZ8fCwg/LlbLIVW7o9GP5KfMIqdbrDjb4wmUmH+O6+sGDX2KlVoXlxcZXNDpIcS0zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AU/8F9AA9T+NIN3B7LK6ZHWkI3bRTMp0IEFLmO658s=;
 b=NwsS0kMx1xQ+/36/UemW/4z00jr9064QaF9f+RYgDDdya9/ldHlezfRzTbJBcBFwm+PiU+udLb+qbu3SqG4/pAc6V4ZTNfKBu6V57Kpr7bpGBfh6E+Y+rKM4F/OLGHTOTa2714NqUieRzL7B9JgR7dhG/XlHMOwnihs4fkn2Xs0WYnBirrnBY1F76VHl8AxrMMlwlSE7+C6/7/+7vARXy//VWf1xEuwmFofZSVGX2Q3Q+bG+mirHfNoAcjwRjpFtKOvJEyOuGYimg8nhW78i+Z07CdMHMDyVga3lF3N+VvzBMCEnrVf6BbV2/kpR5CskM3O2SaVvFyi70YAD0i53dQ==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by AM7PR02MB6225.eurprd02.prod.outlook.com (2603:10a6:20b:1c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 11:58:55 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6ef:a07:db5b:10db]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6ef:a07:db5b:10db%4]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 11:58:55 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Oded Gabbay <ogabbay@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 04/12] accel/habanalabs/gaudi2: fix missing check of
 kernel ctx
Thread-Topic: [PATCH 04/12] accel/habanalabs/gaudi2: fix missing check of
 kernel ctx
Thread-Index: AQHZs+iq//Fk2Wle/EuTfnOV6fbCGa+2CKWA
Date: Wed, 12 Jul 2023 11:58:55 +0000
Message-ID: <c00a0244-a750-d7ff-05e8-1e1c18beb2b1@habana.ai>
References: <20230711111226.163670-1-ogabbay@kernel.org>
 <20230711111226.163670-4-ogabbay@kernel.org>
In-Reply-To: <20230711111226.163670-4-ogabbay@kernel.org>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|AM7PR02MB6225:EE_
x-ms-office365-filtering-correlation-id: 35499b65-f6ce-49eb-9203-08db82cf5e44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HkaZhrxdzNOLJytwsWXUVt22SLE4Qc8T8xxTtfCUYmSL2VsRbf2H2VurisgYAZpwjWW74RBjNJzASmqNYPGJBCTxVYOj/ezS8GAfSzq9PMtlAEGkE2lSusZBAD7ReQ4qQm7O/aaxQ+c9fm/1TiYcPwPjiF0bZwYlJx7JNGT2cjyZKavxSaLpDpMeQo8i54wm2qdz2xti5qHHie11/JWVrj0cmJa0NloLEprXiVKUx0CkpmMu7wx+BBJbf298kbQXPWC0kD7UifdTeqMHpxuyuqyrXdEf08Izc/flwEN8sUzr6un0UMNGhaC/1fjZ3qhFqR0EexxdL8VMeVy9iUgn5ZJVtAS0yD4Z7Apj4tzB8H+7W2B7Q+ymTz6HkaA96wrVxWZSGSulmO7wZbR+zpzDLR0gq4mlPv9VDrYMK566QIRcwy5n9Gi+kX2fReWbgfQkAj+QaTkeylkERk6SzkjjlcPwMNVNScCyMz1CaH4MfNUSo7bi2QCj9cq4Zs4O9cWuKbkVc5toQP6Cdpr63hNMR+jDMvuTesJ0vnCpNwxnOsLNTahwl1pOJR+V3i4Q3aUybX1g7jfLqiZqYOkyPHFMDSLIA/k0QBZQVN/vPAgokx3HLkuHLIFqHlwmTinpFSoYgj8NjhbLYuwQZ3r/FbB5HGLuy7ZownMYYCiykOaTtBDcJBxpwRw6uVoCwhmyxMOZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39840400004)(396003)(346002)(366004)(376002)(451199021)(64756008)(66556008)(66476007)(66446008)(66946007)(76116006)(91956017)(316002)(4744005)(41300700001)(2906002)(8676002)(5660300002)(8936002)(31686004)(110136005)(478600001)(71200400001)(6512007)(6486002)(122000001)(26005)(53546011)(186003)(36756003)(6506007)(38100700002)(82960400001)(2616005)(86362001)(31696002)(38070700005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmJrNldGYkVVcUFjd0crTStxbDFPUi9VbzBYSkJ6bTVtMHMvMytkTk8xc1Bu?=
 =?utf-8?B?WXFaaE1JUVo0Z1E0OGh1Q3VZUlY3K25lZkJlMzEzcVlrU21CNGxZZFJXdmIr?=
 =?utf-8?B?S3pQQ0hSYnNkdGwvYy80eDVFQU43b1ZuUkhvOUJmeDk2akxYRThSNS9Lb3VI?=
 =?utf-8?B?M0gvVDZSU2pkYkY5c0xVZDNGYXRWSzBIOWxNOG8vZnFKTzgyYjdKMXY1UWE2?=
 =?utf-8?B?UVhKQjJreWMxbFBxVmkrdHp2eDlLbm9qOWcxRlorTFZlSTlFKzdrT0RCM0pH?=
 =?utf-8?B?czI4SnhTQW5NaWtLSTUxbWJ2NTVIVHk4OTlkUFloMUkwaEhzdnd2a05mOVZF?=
 =?utf-8?B?YWVrNENsaENLQng1Y1hPUDFKRndPNjdaK3pPbWZraXo4cmRLVEsrMVkrc1M4?=
 =?utf-8?B?bnZZTG9MTC9MandRWmdERjFFaGhZRUxrNk1qbEt1SkJHMyt4Qk1vWDdiV0lD?=
 =?utf-8?B?VGVMT0c0bWs0bTdRN1gvVDhDNk9nZGFkZUl4Wkd3c2kwVUFRTk5oVkZRTUtO?=
 =?utf-8?B?UlNWU1dNcXJrZ1lnZFF1WnpsSENLYkcyNEpXd1JqSDA2aWxzSjd5b0RhY3pR?=
 =?utf-8?B?bUtKZU9jWDlNakNtWjAxYWk0OWpEZVgyQ2ZVdkMxVURRNU04cGhSZEJVUUxu?=
 =?utf-8?B?RkV5bmpVaFNCVU9QMGRvdjZBcFVzSWpYdHpHZ010VGJyYzlrcHRJTDlva2xG?=
 =?utf-8?B?VExIbSs5bVB6aWY5Y0s2aWVpeE4yZWp0Q0JFMGpZb3A4MlZkanBweStXemls?=
 =?utf-8?B?QW5GQ0M1OFdJMkVOdHRlNEFUUHpGa2VKNUVFVlhtOEJOSS9VdktZVVJtc09o?=
 =?utf-8?B?WUFva3dJWVhFNElFdWVKQ2hLb1UrTWl2WDdKSkpqK1dsN213V3JWSHkxdm5l?=
 =?utf-8?B?RHZDb3hTWUZFR09BMjRNVEp2Y0xJOVc1NVJNTGJnK1pWampGem96VmlMSU9m?=
 =?utf-8?B?aXNxUklQWWlreWxPSTNKOHhjeHhXUFlKMzlkMW9JT1hmalZVbTArcFhJWUdF?=
 =?utf-8?B?Q0lNUUlqcWtwVG10bzRFeXZjN2VVemxVRExqd2dCZWxydUJCcWNyQkhlbitM?=
 =?utf-8?B?czBPaUI0NjRRVUFaMU12Q29qVEVLWkRYK2RUT0ZlaTR2ak1uaElpV0lJWGNW?=
 =?utf-8?B?Q1p1K2k1dmczYjVCR0xVSk1CN3loNEFsWVAyUWJBajdhM3pVdm4xdU1CaUpy?=
 =?utf-8?B?QVM5YWYwNWZRSGxCRGVYZkdWSHI0eE91MkRFczh4UW1yUmlZNmdCbVNPVXNs?=
 =?utf-8?B?cmQ0L2R4TEEyUHloR0U0SlpFcU5HZ0tNZ1FtMEVPYzJZa3FLSjdUVUp5dmty?=
 =?utf-8?B?bEd4NU8vcjBmWjhZNndEUHF1V2F5VSt5NWJLMXprWXk0VExaZ1pENDd4Yyts?=
 =?utf-8?B?Qjc0UUpTOWF5M3VSSkVDblYwejY5Qzl2NnErZFdLK0twbTdycDNaYjJEMm5Y?=
 =?utf-8?B?dlIreWpac3NNZ0svd1JBRnkyWGI1WDE4TTBTNktLV2pTSVl5ck03aG80UTBL?=
 =?utf-8?B?Qkw4Y0xWSmd5OXQrcWgwVi9DbktQQm9BWWtySjJvL2x4Ly9vVWtmWlk4OWpM?=
 =?utf-8?B?dC9teHhESXdYajZTWjJHMDc2L253UXBSTkpkNTJjRjMwZFczbTYzYzd4U1pC?=
 =?utf-8?B?Q1JKQ2dSR0tjVzA1Yko1Vkh5TWZXZ3lmOS9RODB5NUNYM2hvNkw3aDFsYXdv?=
 =?utf-8?B?NlRjYlNnMVZYMnhlQ1BqTVpNdHYxbHcrRVh0Q0FsU2loK0UxQ1g5REhDbGg2?=
 =?utf-8?B?SjdDblBSYVNYdnNRMUxsd2FKYUxzQzV5U2JXTUV0aE9oMTc4MmV1QUJ2RXBN?=
 =?utf-8?B?V1kwTHVSdkNYSTBEZVBGcmtIUUc1Q2ZxRjZFUjV4ZlZsaFFTRWs0MGxPQVpX?=
 =?utf-8?B?cUhLMUwwNHErZC9oeXZuVGEyTGtuSkJuQzk4RHR3WmpsV3NnWHNyZDJJcy9X?=
 =?utf-8?B?WjdaUWdIWmxlYzZPMk1WNTNiMk1FSWJ5RlhwSEJJaG1ZLzZudUZ1WnJSR3Vs?=
 =?utf-8?B?RjBYLzdDTCtmUWozNVdjZTlKME02TmlpODFCSDRnR0lFemVBK2U3T2N1dk1H?=
 =?utf-8?B?OWUzcDdwUU1pQlJKS0lyMzhyRVVEeDdSSmJzVUJmKzc5WXhHQjZ2ZXp3WUU4?=
 =?utf-8?Q?EKFw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF159A81663C584ABDE732CAECA1E540@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35499b65-f6ce-49eb-9203-08db82cf5e44
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 11:58:55.4163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1i7nRFmcrUmPrdldP6uD1eqWeyA3g8Tkx9bTVnmmXvP3tZHOtOADV+MM0pnARuFrQMCdURiIKkKvZxNygva5iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6225
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

T24gMTEvMDcvMjAyMyAxNDoxMiwgT2RlZCBHYWJiYXkgd3JvdGU6DQo+IElmIHdlIGFyZSBpbml0
aWFsaXppbmcgdGhlIGtlcm5lbCBjb250ZXh0IHdoZW4gd2UgaGF2ZSBhIEdhdWRpMiBkZXZpY2Us
DQo+IHdlIGRvbid0IG5lZWQgdG8gZG8gYW55IGxhdGUgaW5pdGlhbGl6aW5nIG9mIHRoYXQgY29u
dGV4dCB3aXRoDQo+IHNwZWNpZmljIEdhdWRpMiBjb2RlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
T2RlZCBHYWJiYXkgPG9nYWJiYXlAa2VybmVsLm9yZz4NCj4gLS0tDQo+ICAgZHJpdmVycy9hY2Nl
bC9oYWJhbmFsYWJzL2dhdWRpMi9nYXVkaTIuYyB8IDMgKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNjZWwvaGFiYW5h
bGFicy9nYXVkaTIvZ2F1ZGkyLmMgYi9kcml2ZXJzL2FjY2VsL2hhYmFuYWxhYnMvZ2F1ZGkyL2dh
dWRpMi5jDQo+IGluZGV4IDBmOWU5NTIyMjMzZi4uNzBiOGY3NDRjZDczIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2FjY2VsL2hhYmFuYWxhYnMvZ2F1ZGkyL2dhdWRpMi5jDQo+ICsrKyBiL2RyaXZl
cnMvYWNjZWwvaGFiYW5hbGFicy9nYXVkaTIvZ2F1ZGkyLmMNCj4gQEAgLTEwNjUwLDYgKzEwNjUw
LDkgQEAgc3RhdGljIGludCBnYXVkaTJfY3R4X2luaXQoc3RydWN0IGhsX2N0eCAqY3R4KQ0KPiAg
IHsNCj4gICAJaW50IHJjOw0KPiAgIA0KPiArCWlmIChjdHgtPmFzaWQgPT0gSExfS0VSTkVMX0FT
SURfSUQpDQo+ICsJCXJldHVybiAwOw0KPiArDQo+ICAgCXJjID0gZ2F1ZGkyX21tdV9wcmVwYXJl
KGN0eC0+aGRldiwgY3R4LT5hc2lkKTsNCj4gICAJaWYgKHJjKQ0KPiAgIAkJcmV0dXJuIHJjOw0K
DQpSZXZpZXdlZC1ieTogT2ZpciBCaXR0b24gPG9iaXR0b25AaGFiYW5hLmFpPg0K
