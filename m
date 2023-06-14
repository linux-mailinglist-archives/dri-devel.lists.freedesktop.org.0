Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFD672F5FF
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 09:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD48610E408;
	Wed, 14 Jun 2023 07:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0ED10E08E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 06:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1686725386; x=1718261386;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=O0WtxhHwzUu0+fDt5jmb/NHGtTdgnlBGecVDSvu92Dw=;
 b=rzBPewc0OwovB3LqrJB8iN6PercGP7ZSzvStE8/U1Ii/F2f7FAbvpoAC
 es4fo6iRlTvtxOX1bYu2fJaX9fVLJKRvtZNnoLJ/VA2SIovxYfVUb5Wah
 3UC1rK82zqXtBapvj2GR7PkHo529PsGePMFtT/obPk2wK4NxfxAlthcpi
 3hWsSrdM5sp7k3ShNld8UX88+I99LFbh5YZyjjPWKn95B+lvTYuIK2pTo
 CnwJ5gL1FtGY8/B2c5KUIakxuIEGPDrJbtbOM37DDOLzrb+PyztbUFsM2
 NUnVLdf2Xucp3wmkmgDY4RSQc/Y5GXPf1Vl/6ikgXA0x8dfExma7lEF2a Q==;
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; d="scan'208";a="215953974"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jun 2023 23:49:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 13 Jun 2023 23:49:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 13 Jun 2023 23:49:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0PPc3ylmzdQ7IaKIkjDF09oKB8AukIQC2LrAo+gOAWyxduP/NVAOBtudeI7coVCfLRpC+Vr7xqGBhMZqJDUdZmD6xwxdqsNy1ceqIJ8IuaDrbyx/FDHrC9CRl7+D2yVzA2PDRTnKxouHAfmTxO7MbNSWQj5Pmrx3ZMIErhCOxCKZ1VCpnzOdLnfCkxa4A+MFkgbQD6OumHhSWm2tzmaR2ex1I+wdHzRsJDrcIF/UQx6gdSpBaLGWH3uM3IxbO5NfiQz9SU13EYrOTEBT3bFne2OAr1lOPFIbhj4+aeQ5+Q1QqSflLIHYGsA3Vx7kcOMjNvdtZlTGRptsRN+vu6ghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0WtxhHwzUu0+fDt5jmb/NHGtTdgnlBGecVDSvu92Dw=;
 b=aE37Et8ImOPnHkVc1j+IuA5D7rbHhaa28aooVv/cO9+mz/RWkpg8clyk3abnFSaHIqr/yM79uaVD1iAJRWGnGU5vA867e0JEKZbxKd+dQkeDjh/13eBnj6y4vM+AcF9yBfLHWBAAHYPhEvef7y8F80HlEAZjdtSW2chxNY348eiP+mEPKXRMjDZHf60GFXRen6hGXpmuPGLcAHVEkwD9xuKK0J0xJvVGLMUPYo5szBxyLkcaFT9AKv3aL51vHyz+cetY9gS3TyA5G2O3Xy5PL4ZeBECEjSX6kOqtQT3Uxfrz64YbeBCDCUEzVLkswqKFsJJ/8RD5VuxnpTx88EmZ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0WtxhHwzUu0+fDt5jmb/NHGtTdgnlBGecVDSvu92Dw=;
 b=R/rHVg14HH6uCDtEXXWvwwqjsj1wjos0c5tpvqyLghmLsGhfe82VNwCRjvsrXyvB5DeXJylDvnInlJTOAY0YFSD7lgpdrbjkzJD8d1t/dMPQlDbMwYRdaGXRwb815TtD76JwU57GKFjCMv1IsojkZyKa26Qo4SZ1ZFiKxJuBcmc=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by CH3PR11MB8239.namprd11.prod.outlook.com (2603:10b6:610:156::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Wed, 14 Jun
 2023 06:49:09 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%5]) with mapi id 15.20.6433.024; Wed, 14 Jun 2023
 06:49:09 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Manikandan.M@microchip.com>, <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <sam@ravnborg.org>, <bbrezillon@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 5/9] drm: atmel-hlcdc: add compatible string check for
 XLCDC and HLCDC
Thread-Topic: [PATCH 5/9] drm: atmel-hlcdc: add compatible string check for
 XLCDC and HLCDC
Thread-Index: AQHZnoxSe6onPXRkhE2i1djzN+UwGA==
Date: Wed, 14 Jun 2023 06:49:09 +0000
Message-ID: <f0797746-ee52-582f-48c8-e6497426a7d6@microchip.com>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-6-manikandan.m@microchip.com>
In-Reply-To: <20230613070426.467389-6-manikandan.m@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|CH3PR11MB8239:EE_
x-ms-office365-filtering-correlation-id: 392eef65-ccd7-4f03-6aef-08db6ca374ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VwSJC/GV1+uHcVXONBmJvps3z1V/mrziv1hnAtX0Ib0B84IfJoXBTj8UFVhztJN8z9dixYaPgqy7cMXl8CvbGhoElFNBAH3/ekwvpoFU0O4/QPmjxh+6JCRxpJx1Bjg+XCLHKeeCrx0m9Qc5dazPJ2cgekla1O58S474WJKfx9lxnfXWu+jlRhQhKzKOPD2FZAHSC3IJeJUucs3RnxmSfkUvnkDX9GwUu5ArfpvJomQOz7rXsdsw5TOzzmPlcD+wy3CXbjEIPHnZ0WAAaxbybPfyU/BrGkhGxG+M08kn6ggiXx5mCWJdrtak7B4/a1N3y3Jes1yEtnWi+Sb2DJJfKP4bBQWF59DX+Sr4q7anGHNfJaw5erOfVEBz3WOV0CRwjpnUu4jLR+OgdZKeIL1F+YgrbQX6vaYVYN+ejnSsxjR8BqEXEBklirFoNWhNMUpEc5Zupzvy5lDekH9Yf1FDTGzEfZYXjlkb3k7L+1zllpFqS2tTqvoHSudGPDILo4sZfrNUCnmlp1zOwkLxuGox8YkOOnRX7Er+xN7Org4pPpEvUKTgD8QrwYEpQ7IV2rC6nCyRm8MQBgz3W52Tys6FBI/IkVCCQowqgf6lhQSqM7tqXzMwQJifmIv7J9KnqbhdhjdU1+lwMPGmT2PrKNz7R1UKCjnebu/eHF7jnnT3w8EWqZieglTqAcR3UkDCovRl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7648.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199021)(38070700005)(31696002)(6506007)(6512007)(26005)(53546011)(2616005)(38100700002)(41300700001)(83380400001)(31686004)(186003)(6486002)(107886003)(921005)(478600001)(8936002)(110136005)(54906003)(71200400001)(66556008)(66446008)(122000001)(91956017)(66946007)(76116006)(316002)(64756008)(8676002)(36756003)(86362001)(4326008)(2906002)(7416002)(5660300002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFcyYTF3eWp6MUxSa2VrVTdGRVlIdU5OdkgrTmkvZzBJVXNGdGgxMkpRZ2Jh?=
 =?utf-8?B?cENuQTFPL2xLckExdXg2dU9OZncrRnFuWjE4WGdkZ0s1RmxhWW5kb1pOaEts?=
 =?utf-8?B?NDR6RTRJclBNOEFSSnA5dFNldm0zWUc3UEVoMUdtYmNwMnN4SXphdUt3N05n?=
 =?utf-8?B?N2FPc1BNTzNkTi9RMDVkMUgvbDVrNC9BUHFudnRxRHo4aWVHU1AvRWpnRGVX?=
 =?utf-8?B?Y0FXc2VEU2FyaFkzbnNFdGZoSE5Jajc5emJaQW1oWHJTVUx1VTYyS3g0Z0NN?=
 =?utf-8?B?bElUUm5iZHZkaG9lenhiNVFRelJYb2FNQ1p3dXVPRkVDK2lEM0taOFIwaDA5?=
 =?utf-8?B?ZFNkSkhwMXhaSDI1WmVpN1pEUktYTXgyWEV5QVZWNDc3d0NHVzVpM2FpZldm?=
 =?utf-8?B?NTJSZ2NzMGRpN3VmLytScWo4T1E1WjJtdDhEQmRpOG95akovazE2ZkVIa3A5?=
 =?utf-8?B?Q1gvVy83ZFkxYXk3LzFTeHVHMHh4ZEQvTTI4SjNhNDB3dHZPb2d4YlI2TEVa?=
 =?utf-8?B?MWJ6anVsWm56L2VMd0drVFpXR1BibnY2U3pYMGdCanVFTlRIRzcybWRjSFBv?=
 =?utf-8?B?ai9lcmtrOTdNWThWRG1kbll2cGNEeENyM2hLODk0bnhEK2hQWXZSYURjdmhY?=
 =?utf-8?B?QnBqNE5KWmtkOGZVcU15aFdqWTlQeGRjSjBrS1hDTGxZUHVuUFRzQXhwTWlz?=
 =?utf-8?B?aDlyU1oyZ1FWd0tCaDNnTEJlOW5EUjhjN1Zpa2x6VVlEV2dLSkhldXdnUjRq?=
 =?utf-8?B?a0UrdlhPSkxRSVF0UG1LdXZmcGs2U01VVU9zWU1qWEtScXcyN0x6TW5PN05R?=
 =?utf-8?B?N0FMai8zeVM0aVNtLzFCRHJqTVN2T0YzWDdmbFdBS3l0WWlOVGVLTnRlNEZr?=
 =?utf-8?B?ZUxVclYzTGg5MTJrTFYvMFNocDg0WXJrMlhEV2VzL0xMRnR2emhxSzhsckJD?=
 =?utf-8?B?a01ZQm50NVR5ME5ra3FMSHh6eFREK0lkOWVRNURPZU5taGhjUmlPZjN0eUtj?=
 =?utf-8?B?V2QzZXByRW5oeThla1p1bjBQS1NHNEpyL2N6RWlUdlRSYUo4MjNFdFRGMkIv?=
 =?utf-8?B?M05BbWZKaklVeUJFc1JUVTdTYk94ckcvT2YvS0dFUlNFTURPNE1oTnN3UUpQ?=
 =?utf-8?B?MW9QdGxzN3Y5REJzVjdTQmhFdzAzUUZ4YXdQcFVaSUVnbmlBNnJFTUYzZzB1?=
 =?utf-8?B?TUhTeWVMbllieDVMOEdUdldRMnhMcFFGWFFPZmtja0RoUXpyTVlJbVVYWi9X?=
 =?utf-8?B?NTNvL3lFL3Mwa3Y4TDlxc1BWQklPSi9Lb3VXRHFZWHR6OXZXMUNpR21zbVFq?=
 =?utf-8?B?WlQxcTNNWDhXcWhGZE1HY3ZkUUlxRm9ETVNJKzdxQytFRmlkNmxuMzJEZlor?=
 =?utf-8?B?MWpCQmxPU09DU1FFLytyVnJzV3Z2TjUveG5KY3FVZFVpMVE3ZGRqcDF2VytH?=
 =?utf-8?B?TmVWcWp1aWF4NHhRNjkxZTlnTEtHLzJsbzJZQXpZK0lRRmRLZHhsNnJsdzBW?=
 =?utf-8?B?NFN4K0YrOUJMMXlWbzVMa2dScU0rT3g0SVIvMkhqV0xVMFZOYW1uOVRQM3Fl?=
 =?utf-8?B?QlpzMmlxWXRrdmN0R2tnRk14ZGsrUEtBS09IWW1TbUcveEgvNjYzalBhYkE2?=
 =?utf-8?B?OUMyVlNmdEowRDJBL2FHY1BBQlNyOWVtVG1NalFTaFVyNWhhaVBUaXJjdERH?=
 =?utf-8?B?NkxrWGxqQlVGRjNnTXE2MlFoUkgyYXpTOXBPUDlSZWtKNFVHNjFWSWFYNEdo?=
 =?utf-8?B?U2tMT1I3VjZmWlJ6SU9DL1ZtUXR2ekR3T0RsTVFDOE5DUjdjZHNTK2ljNDNS?=
 =?utf-8?B?Vm1pWlhzWWVwM09GcDlVNkp2RDJISkhZM2piK0NQYnRqNFFnUUg2Vm5nSGNS?=
 =?utf-8?B?dDM4MVU1Lzh4Mi9iRzNPNWpzc29hRFZNYjBrNXFINStsUCtwY25vUGJCMkRP?=
 =?utf-8?B?bStPc3ptRlhEVVJOOXRQMlZOK1U0SFJydEl3bjBuUWZsRG5JekhEeUxya0JG?=
 =?utf-8?B?UHZHN2lkNUR6ZUhZbitTQ1UvVGhvUmNUTGQ0MmU0dDcrZ2IwVjk5R3FXNDhQ?=
 =?utf-8?B?bG9ucWVUVERRQzRpWDVLQkM0K2k1NCsyRm9kSWFuNlQ1OUt6MExLWjN3SDRi?=
 =?utf-8?Q?IQN8kHIteCp0Eq/bQO26/nBpW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <75222F261E4010469B92CCF4EAC99CC3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 392eef65-ccd7-4f03-6aef-08db6ca374ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 06:49:09.5364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LFis4UDLpq19uXzROjJLtFlFKUwt9K2A8aN9R4mLKjdmzSNMPJkgrjTz6LgEPAzHRs1Nk6BEiAG6MMEq3vXV//yWGXy4Avpm9xpUtb+4CXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8239
X-Mailman-Approved-At: Wed, 14 Jun 2023 07:20:34 +0000
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, Durai.ManickamKR@microchip.com,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTMuMDYuMjAyMyAxMDowNCwgTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gd3JvdGU6DQo+IEZy
b206IER1cmFpIE1hbmlja2FtIEtSIDxkdXJhaS5tYW5pY2thbWtyQG1pY3JvY2hpcC5jb20+DQo+
IA0KPiBBZGQgY29tcGF0aWJsZSBzdHJpbmcgY2hlY2sgdG8gZGlmZmVyZW50aWF0ZSBYTENEQyBh
bmQgSExDREMgY29kZQ0KPiB3aXRoaW4gdGhlIGF0bWVsLWhsY2RjIGRyaXZlciBmaWxlcy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IER1cmFpIE1hbmlja2FtIEtSIDxkdXJhaS5tYW5pY2thbWtyQG1p
Y3JvY2hpcC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxt
YW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYXRt
ZWwtaGxjZGMvYXRtZWxfaGxjZGNfZGMuYyB8IDcgKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJt
L2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmggfCAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2F0bWVs
LWhsY2RjL2F0bWVsX2hsY2RjX2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRt
ZWxfaGxjZGNfZGMuYw0KPiBpbmRleCBkN2FkODI4ZTllOGMuLmZiYmQyNTkyZWZjNyAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmMNCj4gQEAg
LTc2MSw2ICs3NjEsMTMgQEAgc3RhdGljIGludCBhdG1lbF9obGNkY19kY19sb2FkKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpDQo+ICAJaWYgKCFkYykNCj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+ICAN
Cj4gKwkvKiBTQU05WDcgc3VwcG9ydHMgWExDREMgKi8NCj4gKwlpZiAoIXN0cmNtcChtYXRjaC0+
Y29tcGF0aWJsZSwgIm1pY3JvY2hpcCxzYW05eDcteGxjZGMiKSkNCg0KVGhpcyBjb3VsZCBiZSBh
dm9pZGVkIGlmIGl4X3hsY2QgaW4gYWRkZWQgaW4gZHJpdmVyIGRhdGEuDQoNCj4gKwkJZGMtPmlz
X3hsY2RjID0gdHJ1ZTsNCj4gKwllbHNlDQo+ICsJCS8qIE90aGVyIFNvQydzIHRoYXQgc3VwcG9y
dHMgSExDREMgSVAgKi8NCj4gKwkJZGMtPmlzX3hsY2RjID0gZmFsc2U7DQo+ICsNCj4gIAlkYy0+
ZGVzYyA9IG1hdGNoLT5kYXRhOw0KPiAgCWRjLT5obGNkYyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYt
PmRldi0+cGFyZW50KTsNCj4gIAlkZXYtPmRldl9wcml2YXRlID0gZGM7DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfZGMuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19kYy5oDQo+IGluZGV4IGFlZDE3NDJiMzY2
NS4uODA0ZTRkNDc2ZjJiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxj
ZGMvYXRtZWxfaGxjZGNfZGMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMv
YXRtZWxfaGxjZGNfZGMuaA0KPiBAQCAtNDUxLDYgKzQ1MSw3IEBAIHN0cnVjdCBhdG1lbF9obGNk
Y19kYyB7DQo+ICAJCXUzMiBpbXI7DQo+ICAJCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0
ZTsNCj4gIAl9IHN1c3BlbmQ7DQo+ICsJYm9vbCBpc194bGNkYzsNCj4gIH07DQo+ICANCj4gIGV4
dGVybiBzdHJ1Y3QgYXRtZWxfaGxjZGNfZm9ybWF0cyBhdG1lbF9obGNkY19wbGFuZV9yZ2JfZm9y
bWF0czsNCg0K
