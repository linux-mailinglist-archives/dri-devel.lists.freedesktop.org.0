Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA84776FAF0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 09:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C3E10E699;
	Fri,  4 Aug 2023 07:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 03 Aug 2023 10:23:37 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30DE10E5E3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 10:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1691058217; x=1722594217;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DpPoYECzCm0Ws3856Av+fd1BjyFMBt3SCgYdU+VVSEw=;
 b=Ncjrpo/EtPyMgOguEDgMiBei8q1a7YEF/yfZ99WvPNZlQWcQushyBFtP
 2k1J1xYByPmoCo84hSlF26ZRQKoLG0Kds+WLzjnARVjgyxEe4JPIrsKs8
 2825KjtTGMGm3V+WD6Bi7LTesGMVBKjpp3R35Sr+P5A1Qc5QNC2xA0v4o
 Eo9rKcbgH7X9u3FHhmTUg2mfheCYFk8SD8JRhEIRKJYK7ygrcHlZDbsuT
 cPIheuCr79QooodqexOc5sNKIDZURcFQA59Nm7sKbxtBIuwTl3YLQnpXD
 OmkGBNSlosPeZ7DzvZZWWWCW2GnTjUjeMml1bzWfX45zSFK+HWlRTfjqF A==;
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="164651612"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Aug 2023 03:16:29 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 3 Aug 2023 03:15:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 3 Aug 2023 03:15:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSLkOUs6CpVy+Xqa8XzLJ2nIdz6ALztmYTWli5FTNwV944R1O5ROeou7M5HDcJfGFPdjM9YbLOTaHN4MHa8hulKV3HI98hkGO+u7diGLvFwNfycspi+zLB6owyU17DeORxfkTPVtfelfaQXAkC69Mbmn/lP77LqQ1UBQK5C0HW5SimCgU/FE9kBsTDje0lAyVRhSzZ+DMcUhxCSe5Cqo25nv+1zt2E9BsaSDnj+ruIAC5U7Wi6N8nbtrGqlukWhWxQLaxL7bklF2478w2LlpKMRedthAThjExbT1jbglq8vzhDCxhf/4cqtlgz2esCIBOEvkR3RhmVOnxLQc+M7xYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpPoYECzCm0Ws3856Av+fd1BjyFMBt3SCgYdU+VVSEw=;
 b=VzGBMxUQxNanv9PbUm8Y5y8M4h7lQHot32qAQhuaT9Vm0dLiuvv1J2ErZgwULOJS/HMwO28pnE7RxxleFom216TT+NyFu0QJtTiTWQl/gLjUQd4G2gnLz13a2Kq5qhgOM9yeQSs/nal1wpRuMPIqZxNv0KIgsWcuERJPzzjM4Y8PeI7aNxJwutTLPMya45a7f+UT1QFOXSPPHO4MjSqyu+7PHfN5UZVpFqBpDWUcVSojD00/0mOdvXJahUAlwtrqAS2QJdW6h/RRuv+dqNmJ2fkqivlivF3h9EQGnq4mHRll9OECOqhWsw9v3395yJs7q6CiRc846G3owbP19r2/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpPoYECzCm0Ws3856Av+fd1BjyFMBt3SCgYdU+VVSEw=;
 b=YhZ/iidNr6Nm2SHjUV2+xppokStTJttRExvmb4y63dv6t4A+O9Q93Cmmbn5D3y1j7/e+6woT945LYBjayrCsZUOqTngVmeTgHf3ryQmYl3T90KsdYGDTgXDZ88XUJ7VPQQ5xuFw1xbdHINajXt9u2lvedjwNBnOrDrr/cyotQK0=
Received: from MN2PR11MB4191.namprd11.prod.outlook.com (2603:10b6:208:151::31)
 by DS0PR11MB7411.namprd11.prod.outlook.com (2603:10b6:8:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 10:15:55 +0000
Received: from MN2PR11MB4191.namprd11.prod.outlook.com
 ([fe80::fe1d:8078:5374:352e]) by MN2PR11MB4191.namprd11.prod.outlook.com
 ([fe80::fe1d:8078:5374:352e%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 10:15:55 +0000
From: <Hari.PrasathGE@microchip.com>
To: <nancy.lin@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3] drm/mediatek: fix uninitialized symbol
Thread-Topic: [PATCH v3] drm/mediatek: fix uninitialized symbol
Thread-Index: AQHZxe/qsUNZO9lcFUqDY0Q9whl9Va/YWxsA
Date: Thu, 3 Aug 2023 10:15:54 +0000
Message-ID: <688a97b5-ce0c-cf6b-c78b-aa7410347d1d@microchip.com>
References: <20230803094843.4439-1-nancy.lin@mediatek.com>
In-Reply-To: <20230803094843.4439-1-nancy.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4191:EE_|DS0PR11MB7411:EE_
x-ms-office365-filtering-correlation-id: 0be58c4d-a7db-44df-868b-08db940a9f73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /HpVRNyVbVe+efm+jKSYkW86gPBiz+TLRDmXnY1oz1li0YTBVHb7N64xFMXJBAy7eQJ17uE4nRnJZmh2XDl56qXYaxLQNLJ9Hp9FU24aqSpcI+KqV1pdLypNu4l20Q4R1a3rbf+vHmppBT/nJzB3cqE4FaLWg7Kw4ZdR5MLoseyAl7HcY8WNI42cU4mMxi8L/YNfBDqrgN7tQTJVMI4QEWEbNAPDjgV/e9iClKi3hfxrbcIjJVngTym01kxBQtyKDSRMqMmTeEDa1gMIf5ikhk8S6AMJCA9i+vaHH7MXGw+iTSfzQpRb9WAzyRwDO0ynmQWQhiaMkBBaKvEDADN/ruQTWwGpKaE0CWleRc7eBVwqrRFYxy1MvSQenayawWOqZ5+SdDERI36/psmJ2+JpwKm0TclAAZS84p1Pj+rX5bP0IvFdDZhr44SyqCr+VjQruKxj8v0KYImgKS9dkySlfVXunBFl23sMdKiSWwBEixKKGH+6V2jyR3DIHZ0bb4DUEtlQ0CgBSSRGdID46C0aAzNzHRHRYtWvcIllUKeF31o/VPGRLnMw7pzPmHhaJMV8rJ1CSuKfi97tbKk9nUYGRDhWQIcFhFdqOY0+h9SXgEvmsTt4e/vQ1cZ0FScT+1ZgLRwDoiLNIx13pk1OWM45nQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4191.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(2616005)(53546011)(83380400001)(6506007)(26005)(186003)(41300700001)(2906002)(91956017)(66946007)(76116006)(4326008)(64756008)(66446008)(66476007)(66556008)(5660300002)(316002)(7416002)(8676002)(8936002)(6486002)(71200400001)(966005)(6512007)(478600001)(54906003)(110136005)(38100700002)(122000001)(31696002)(86362001)(36756003)(38070700005)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzlMcjIvMyt1MC9tQ0hrdnNtVkRkaDV1a3orNy9WRUpWL2Ewdmd3Sm5tZjN2?=
 =?utf-8?B?WEZhQUdsaEk4V24xZHlJSFEyN2FGVENUdlRkNDR1MVhFYmJVSFY5MlV0bmE0?=
 =?utf-8?B?SmJYVlh4UlZzaEcydTIwSnZhVkNMYzRINGFKY1dCcW1vRGthZnVhN1AzNGt6?=
 =?utf-8?B?Sm5EUmU1KzUvV0hBSkpBczRpcmFOOVNHdWYwUDQ2NjhBdENFVUdtNXJUVUgx?=
 =?utf-8?B?SXp6eVJxTXdKOXJSQkdpYWUvb0RkeXhEd1FwSTdkQURNeUdKZ1Ztd0pXU0FY?=
 =?utf-8?B?UEZhTkVmMjBiOXpad2hNZXE5R2praVhiMlVjSUNIam9kbm5nWmEvQzVVMFVp?=
 =?utf-8?B?eXE3TnYyNlZRT0FGSUlsWmtTWEhDMUZWMHpqZVNyRm5sZ3NLTGl0MDhXQjlM?=
 =?utf-8?B?RXIyYkxQOVlqZzlhVHVFYW82Um9oZXBVL2M5amF3L0VXTG1ncm5QR2VsMjQw?=
 =?utf-8?B?a0lneVBtRVE0Rm1Samk0c2pYNzhQODVUVjdwL0lpdWZuT3U4cklpMFFrNmpp?=
 =?utf-8?B?WXZiMnpkd3ZjTGh0R2lLODRZNUdFVExOSXpocEhyUHRIRHVyWkh6ZlhWeWNI?=
 =?utf-8?B?MnhKcEgzVlR5UXlFVG5UTDFPNVBrMHhCazU2VEk2MjJUYTNkeXFtWW1sbXdj?=
 =?utf-8?B?YnhMRmpmSUxGNHF3MU12blkvS3N2YlhXQ3BSdENRTjduZ1dWMXA1ZlV2OXYy?=
 =?utf-8?B?eGJxSnoxSHhpVzA0ajdDZ0JiWVhNKzMrcDhZSVJEdkx3Z2xUcHJJMC9oUkNR?=
 =?utf-8?B?ZmZOZUllV2VJMWdFaGZINlZNbkg3RmtxMFE1ZnFqK0lyUjk4L2FPYzRRbCtT?=
 =?utf-8?B?OTR2RFJ3Rkp1WmdEK1hNWThxL0JhcndESGhwVFNaT3huS3VvN2pYUjJONEVN?=
 =?utf-8?B?Y0Nxd1ZmTTdVVlh1dnpHZkpMZjZTMGc2RVYxMnNscmMrMS9KVmx4RXY1WGFq?=
 =?utf-8?B?TC84cFJQYmxQaEpka3E1a2xEOHN3VHR0OTh1TEc1NTF6R3NOWWdWVTFYTndh?=
 =?utf-8?B?YTZBQ2UrR0FwQ0ZSQXlrRGdveUtTb1NtcytnOWFqOW1yaWRxeGtDQTU5Y0Fz?=
 =?utf-8?B?ZjhKMDBtMlNIQ1p1MVFaQkZSV0hiYnNoY3VhTW05TWpVY3hXL1kydG1ZNzZr?=
 =?utf-8?B?NldYTEYwTGRkOVZNQ05MT2tMdk5vRjF6VjBiTWYvUHpkUDBZUzJCdFlEOENL?=
 =?utf-8?B?QTVnOWlKTVVDbjdOTDUxTTdFRDJTaWFESE5tMi9hWmF1MFlJQnNsVWx4OHA1?=
 =?utf-8?B?MHhOQVFFczU5MmN5R1RVOCtkRkREOEZmckxLdkNnUU5YY3Mwb1pNTklHSG8r?=
 =?utf-8?B?Q1R6WTVMQitMLzR6SXVlczd3bU1vZUN0RFVsaHNzemMwSExGUENVQzU3RHNh?=
 =?utf-8?B?dHBMN1ZrRnVuOXk2RE1yc1FOT0JydmFZZGtUd3IxYXltZXVNTjMvdmN0cVlG?=
 =?utf-8?B?TG16ZlhHei8yVzYwNldhY2t0Vi96NzZUM2NtTXhLdGkyMGlDUlB3K2xtdGpB?=
 =?utf-8?B?K25HWVBSVlRwQ3ZaMENnZk04TUp1Wi9IamE3ME5FQ00rcE1lU3RyZ3VweHF1?=
 =?utf-8?B?N0VEVmxXNk4zSi9mSFVzMDZHbVdjM3drQ001VHI5VFlEV1N4Z1hYUXdLM2xR?=
 =?utf-8?B?OWQ2anh4aUQ4UTFrVkVWNVpWazdycTBiSnVJVmpNSTFDT2VUZFh3VUZ6aFgy?=
 =?utf-8?B?ZWhNaFBSa2wzK0ZBeUU4elVLL1pHbzJDM252cDdnYzdqQkl4NXZvUVlmbkRM?=
 =?utf-8?B?WVptQUpMWnd3NVZnbWdZblpIak5jUW9mcXRteVN1VWV5cHZuejE5NmpCdmsw?=
 =?utf-8?B?VmJqM3ltNDNhR00zQlFMNWowbVZWcDVHU0FlK2RmRE1WbTRBOUJEK2ZMUElS?=
 =?utf-8?B?UUVnaytOSW4yZUZrUE5NQjlJQ2pxeWlYbVRnSUJlWnlBWG8vbk5PVFQxV2lq?=
 =?utf-8?B?NGtwd20vZmdTVVAvQmlwU05oNmo1aFAzNFh6c2p1bDRNLzRkMlU2SSt5bzFq?=
 =?utf-8?B?R09wRkYzYnpKSDZqcVZDMG14dG5EZ1k4S05VZjJacFY0RUt5MmwvYnJkMXJp?=
 =?utf-8?B?RkJPWTNaMnlMbDlBdnlmSVk0akFlOFFaczl2OGVhOENWaFlGOWE0MnFKclVZ?=
 =?utf-8?B?YjdDQ0lRTi8vN0M2b0NRcVlHR0EzcG5Ya2JGMngxbnpmZGw1TWExK1RmSnRu?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB64CC397AD5844AA57D09F7F6D2BEC5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4191.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be58c4d-a7db-44df-868b-08db940a9f73
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 10:15:54.8627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F8R8D03CVdMW/bfCvvLW6aWkBH227los5ILUxYlhNJtwlec/F7r9TH6yImpiEheehUPQTDxrhZYGCqxl9HuQXPCfChxxp67fROOGFnCd6g8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7411
X-Mailman-Approved-At: Fri, 04 Aug 2023 07:17:40 +0000
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
Cc: singo.chang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMvMDgvMjMgMzoxOCBwbSwgTmFuY3kuTGluIHdyb3RlOg0KPiBbWW91IGRvbid0IG9mdGVu
IGdldCBlbWFpbCBmcm9tIG5hbmN5LmxpbkBtZWRpYXRlay5jb20uIExlYXJuIHdoeSB0aGlzIGlz
IGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRp
b24gXQ0KPiANCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBmaXgg
U21hdGNoIHN0YXRpYyBjaGVja2VyIHdhcm5pbmcNCj4gICAgLUZpeCB1bmluaXRpYWxpemVkIHN5
bWJvbCBjb21wX3BkZXYgaW4gbXRrX2RkcF9jb21wX2luaXQuDQo+IA0KPiBGaXhlczogMGQ5ZWVl
OTExOGI3ICgiZHJtL21lZGlhdGVrOiBBZGQgZHJtIG92bF9hZGFwdG9yIHN1YiBkcml2ZXIgZm9y
IE1UODE5NSIpDQo+IFNpZ25lZC1vZmYtYnk6IE5hbmN5LkxpbiA8bmFuY3kubGluQG1lZGlhdGVr
LmNvbT4NCj4gLS0tDQo+IHYzOiBmaXggcmV2aWV3ZXIgY29tbWVudCBpbiB2Mg0KPiB2MjogYWRk
IEZpeGVzIHRhZw0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHBfY29tcC5jIHwgMTYgKysrKysrKystLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcF9jb21wLmMNCj4gaW5kZXggZjExNGRhNGQzNmE5Li43NzFmNGUxNzMz
NTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9j
b21wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAu
Yw0KPiBAQCAtNTYzLDE0ICs1NjMsMTUgQEAgaW50IG10a19kZHBfY29tcF9pbml0KHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZSwgc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwNCj4gICAgICAgICAg
LyogTm90IGFsbCBkcm0gY29tcG9uZW50cyBoYXZlIGEgRFRTIGRldmljZSBub2RlLCBzdWNoIGFz
IG92bF9hZGFwdG9yLA0KPiAgICAgICAgICAgKiB3aGljaCBpcyB0aGUgZHJtIGJyaW5nIHVwIHN1
YiBkcml2ZXINCj4gICAgICAgICAgICovDQo+IC0gICAgICAgaWYgKG5vZGUpIHsNCj4gLSAgICAg
ICAgICAgICAgIGNvbXBfcGRldiA9IG9mX2ZpbmRfZGV2aWNlX2J5X25vZGUobm9kZSk7DQo+IC0g
ICAgICAgICAgICAgICBpZiAoIWNvbXBfcGRldikgew0KPiAtICAgICAgICAgICAgICAgICAgICAg
ICBEUk1fSU5GTygiV2FpdGluZyBmb3IgZGV2aWNlICVzXG4iLCBub2RlLT5mdWxsX25hbWUpOw0K
PiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVQUk9CRV9ERUZFUjsNCj4gLSAgICAg
ICAgICAgICAgIH0NCj4gLSAgICAgICAgICAgICAgIGNvbXAtPmRldiA9ICZjb21wX3BkZXYtPmRl
djsNCj4gKyAgICAgICBpZiAoIW5vZGUpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4g
Kw0KPiArICAgICAgIGNvbXBfcGRldiA9IG9mX2ZpbmRfZGV2aWNlX2J5X25vZGUobm9kZSk7DQo+
ICsgICAgICAgaWYgKCFjb21wX3BkZXYpIHsNCj4gKyAgICAgICAgICAgICAgIERSTV9JTkZPKCJX
YWl0aW5nIGZvciBkZXZpY2UgJXNcbiIsIG5vZGUtPmZ1bGxfbmFtZSk7DQo+ICsgICAgICAgICAg
ICAgICByZXR1cm4gLUVQUk9CRV9ERUZFUjsNCj4gICAgICAgICAgfQ0KPiArICAgICAgIGNvbXAt
PmRldiA9ICZjb21wX3BkZXYtPmRldjsNCj4gDQo+ICAgICAgICAgIGlmICh0eXBlID09IE1US19E
SVNQX0FBTCB8fA0KPiAgICAgICAgICAgICAgdHlwZSA9PSBNVEtfRElTUF9CTFMgfHwNCj4gQEAg
LTU4MCw3ICs1ODEsNiBAQCBpbnQgbXRrX2RkcF9jb21wX2luaXQoc3RydWN0IGRldmljZV9ub2Rl
ICpub2RlLCBzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLA0KPiAgICAgICAgICAgICAgdHlwZSA9
PSBNVEtfRElTUF9NRVJHRSB8fA0KPiAgICAgICAgICAgICAgdHlwZSA9PSBNVEtfRElTUF9PVkwg
fHwNCj4gICAgICAgICAgICAgIHR5cGUgPT0gTVRLX0RJU1BfT1ZMXzJMIHx8DQo+IC0gICAgICAg
ICAgIHR5cGUgPT0gTVRLX0RJU1BfT1ZMX0FEQVBUT1IgfHwNCg0KSXMgdGhpcyBhbHNvIGEgcmVs
YXRlZCBjaGFuZ2UgPw0KDQo+ICAgICAgICAgICAgICB0eXBlID09IE1US19ESVNQX1BXTSB8fA0K
PiAgICAgICAgICAgICAgdHlwZSA9PSBNVEtfRElTUF9SRE1BIHx8DQo+ICAgICAgICAgICAgICB0
eXBlID09IE1US19EUEkgfHwNCj4gLS0NCj4gMi4xOC4wDQo+IA0KPiANCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gbGludXgtYXJtLWtlcm5lbCBt
YWlsaW5nIGxpc3QNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5l
bA0KDQo=
