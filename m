Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C5A55373F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 18:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FC810E3E2;
	Tue, 21 Jun 2022 16:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757C110E2DA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 16:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1655827589; x=1687363589;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KgHjrlPAUGdlFajed8XBAMx2mJ0fc6m9M6rfrnrsG24=;
 b=GJiI4bRqo7HOv4nUVbrY3uNd2S9PbccW6h5jETCvGvD2vTTM9oxD1wnM
 bfeabgr5R+TV/U4Nea/bcE7tVOHgyuJ8uhiVBi8fleh+2fpguKnfv9vr1
 j1NqZC03lfmQ5E+u94XW7ZZsap94i/wYg6vX9A7V4UD887HsBmYhT+fwU
 ESWjrT+uksEa5oDYZXnZ9HQOCHg1t3jt8BbjFyiiGDhQI5dSlIriqilMU
 eiOX9iVsVcHmVam5OITa9p18iKzgwDjZlhpo2DV/3my5xqLkh1b3tllgr
 XaZe2aOwWaMfTIkHtsJg6YYB/jBQ5pwWMvchT/ZGV7Yb/7pU+J3mV6sja w==;
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="169313018"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Jun 2022 09:06:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 21 Jun 2022 09:06:26 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 21 Jun 2022 09:06:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxSCDo0RH1+aEJ/PYQZk1sdyzjOMpSgNMErGmfxKsyQY6277kfBakAT95fzpwsCiw0jTpQ5c3oqA3xeShu/1MCeRq7myStGcfi3ll+Jhah2SAQmHo22Dhc/Zo+8ibblOZQAcJOJj9tUKBN5QbXRP/40YlPO+H3uALLn3DZW0e3tRw0/cpja+VDda+ZUkQ6aHAVkvzpnlXkfzKEZr8O1YzOoPmqH0qKxAC4+Vd1GsFziWjZKhb9pBhXWOzdH5hEU8sknGZcSXs2GfRVzIhO+MPn2l7COkUYCbbaDHBy/rv99O9eaEZp6p3i2HKKdeW8fXnxjk8r6MLZ84Z0c5h8Imcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgHjrlPAUGdlFajed8XBAMx2mJ0fc6m9M6rfrnrsG24=;
 b=lQ4MD2EoTRHl4HFFNVdrl7XmfEfYFVydGcG2LGIasjPtRpubOleashkz+fnPUS1dyWNYft7b3GTYlMGU4eHrTtu5qKufRQoAU0rgLn5cgHC8Q8AXPVb3LirmVY3Qt4WVmIJgHNXGTdmRvNOd81vYXBeRqxRR86BIIeraCYeLntdeW5dhyyTprhmHkYxO5j2yY6HMN6TR5J4g1brFJczZIsSzwIfSrQuGKLK/06cooyQ5kwA57vWb1EKaHouqnkCVDxe0+BTwYOp1E1YKKz0rWlWz+ghmywioC49bTX8dMxo0U8fPBV1ZCdJXVSFiGInUYEzmGDkGyOCGoZ4zF1zCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgHjrlPAUGdlFajed8XBAMx2mJ0fc6m9M6rfrnrsG24=;
 b=PlcQh6Z0WdGQ7HtR0t/Y62j2Ulc7NSz2r/A8L5K6fWIzlgpkjJYmid722EM9h35TyhrhOsh1WQYYk+DlxCRWTlMBYI3J+NPwHwD4KPvcr0AJ/UyT+PgUgqpShE/P7WgU3Ul2JE+mqCoj9/fKSlIMmGNlmpEaYay40GFVRmZIWvQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BY5PR11MB4242.namprd11.prod.outlook.com (2603:10b6:a03:1c1::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 21 Jun
 2022 16:06:21 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 16:06:21 +0000
From: <Conor.Dooley@microchip.com>
To: <damien.lemoal@opensource.wdc.com>, <mail@conchuod.ie>,
 <fancer.lancer@gmail.com>
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Thread-Topic: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Thread-Index: AQHYgw+Pu1Tn+/2s8EmHi9NhXNIv361YymsAgAACs4CAABvqAIAAALeAgAAH6QCAARnpAA==
Date: Tue, 21 Jun 2022 16:06:21 +0000
Message-ID: <bd2547f8-e069-60a2-a223-9f694457636d@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
 <9a1fcb40-9267-d8e6-b3b6-3b03fd789822@opensource.wdc.com>
 <a2d85598-76d1-c9dc-d50d-e5aa815997cf@conchuod.ie>
 <c272728f-f610-77df-bd9b-c9fee6b727f8@opensource.wdc.com>
In-Reply-To: <c272728f-f610-77df-bd9b-c9fee6b727f8@opensource.wdc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12fc03b6-a694-4609-57fe-08da539ffb89
x-ms-traffictypediagnostic: BY5PR11MB4242:EE_
x-microsoft-antispam-prvs: <BY5PR11MB4242993E3A228AF7E262A0CE98B39@BY5PR11MB4242.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5DHQcHXwT9FeCsHNXwKjMIgpP/0kHhn6+qEryaXVKxiSY/VOwJjcFulciDVvNhJalKdtZkYZnPpakNz9SS/mjWKtpDhVYRc6KWKdld8PS6UFWid31ISDmPu2oWowZixdQxsrk3FFccia52UaFcLjAog4wLl4yzgZ4gu2KmzGzdXNzd4wryTw1y4tvDfNvbOwG2j0d0BmLRShCdTRF4dTamPBWIgCxbYbQXi5IFHA/cqIuMJ4i571AHRUdfae8LeYNOySwbmP02oV+ehOUKLnd1iKpuHMp6w2/knDLDRh742/+iVUXkkTI0s6cLGGCkOBKpmcEmSG+t+vfvWO0Tmv9UEOXXpUkNDexVKsKWz3GqovunRDmRueC3OGDZeE+5JqZJOotmWBqzMscVDrUODdGGrIihmEuNBG6xmTR1sxgAV8acBI1pV9EaZtt3AfAfyEWninQqdo8JwZrSW0pc7oDtsE2SpdaFpt9m5zRal9WoTFhX8jiI/Beeg6WA5xpkAMp/JFYfrryFQt2RUXRM/AZNJGMma1kpmuKNL+aIJ2GZ3W/q3IlI+kTn0OxXq+RsHoRY5vjbe160cwgpNT0UL2q1HoK1rXK5dJqEEMDmV8ThsZzsEZNAkyIsa43BM8rCfV3uI9CLVQn7U95AtQRyPGAkKe7McAo3PWdkLoaoXmWXbotMQFJaDRhgxiROqc0d9vsLPGjJ9CF/7xluJSbTZm/WEQztWPRt1NQaNbhK/bTsAbekk0hlOwBjSGRhuplF8jvtVr3+iAw8fS84OVKNLkKLcKpuTvsGcop1TXwVinwxz2Nv57tG7rnTw7kD7NcXYY/nrumS4VxzTnz+SrXmgnmjhWtv5dVKznrfyCODLzjTA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(366004)(39860400002)(396003)(376002)(4744005)(84970400001)(7416002)(71200400001)(7406005)(8936002)(122000001)(5660300002)(6486002)(186003)(41300700001)(478600001)(2616005)(6512007)(2906002)(38070700005)(316002)(31696002)(26005)(6506007)(86362001)(53546011)(110136005)(91956017)(31686004)(76116006)(54906003)(4326008)(8676002)(66476007)(66446008)(64756008)(66556008)(66946007)(38100700002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2tNbkZVc21OdFdMOHhsN1Ztb05rdUJWaUY2ZTRZcmVYd1BuVk1zV0N4OTht?=
 =?utf-8?B?WGxTWnNPSUFOaTc1Umc2VFMwOW5uQlR2c3JlTndqY211NytoMWpubE1oTUlD?=
 =?utf-8?B?RytaMXFPR3dqdkliLzZBUmI5SXFjUjJNVnpLRDZBTjY4MDkxMUxMQjV6T2h5?=
 =?utf-8?B?a2xMVjZKc2VXZytlQzhBVW9RbGIzc2NGMngyQmY2dFVkOHg4ZWJsbDU4YlBB?=
 =?utf-8?B?dEk4LzN0S0FrMHlVbEtSQWVrcWEzMk43czF6bGR4MVJuNlNWb2ZaazJxNnlX?=
 =?utf-8?B?N01wRFlTQis4anV5TzlVcktUcG9KZzlpQkR5Skh6Qmh1N3d2SXYwSnBFUG9K?=
 =?utf-8?B?bjZFNWF1cWI4MW04SzVOTXJ0UFVqREE5Y1JDVWRUQ2FueVV6c0hzT2ZhdjlI?=
 =?utf-8?B?dXIzL0diZzJSckdsaVlTQ2sxMnc1TFhIOG5PTTZvSWkzaG01T0IwVk9tV01r?=
 =?utf-8?B?MzJhRC9yeStOY1hmSjYrOENlRmEvamw2aVl2SExSNThBUTlNbU8reVE1YjAr?=
 =?utf-8?B?TnFZODkwcEFjNWFVM2RjRWVpRmY2dWdqQktUNSszYzE4V3lqWVpkOG95Wjg5?=
 =?utf-8?B?cXlYRlU2UmxsNDd6VlUyTk9OcmlYOGoxOU5lUC9OQlY4eElFV25JQkJCWnVv?=
 =?utf-8?B?aUZRSEdsWlVYbW5GdE44aEZGYjBhVnVxazYyTjBZZ3dXY0ZmdDdLQXdzeHhh?=
 =?utf-8?B?ak9EVFdrakFvb3FuYkJtVERVME43U2pJTTViY2lISllvQlpwcGl6aVc2REdS?=
 =?utf-8?B?Y3duT3RkejZOZitKMHRYVnZaOU9MK2RYSUY4UFFtb2RaMHgwUEhrbVV1eEQv?=
 =?utf-8?B?V1R4N2FrVmJJdVpLK0RCUEZrVWNrNWZNYmtwdHpOeG9oZC8zak9SU1l6QXZE?=
 =?utf-8?B?U3dXT0g5d3RPM2trWG1iQ2dlcG56TkR1WkpZQlhvaHUwOGllcEFmUEJhdTF1?=
 =?utf-8?B?UjRMSjNiTkxQdCt4R04rblB2bjl1M1c2SEk1SGJYdERIc0RDbE1icXIyd3Vk?=
 =?utf-8?B?ekdKT1pheXJOZ2g1ekQrTDZrSCtiRjUzVCtmT1hRam5jQUQ5QWxBb1RsMTF4?=
 =?utf-8?B?ZDV0VnQ1ZVNSbW5jK1NoWDhaeTFyTFZUUlZkeStCTWQvQlVDWjZYLzNJWW9X?=
 =?utf-8?B?MDJ6RUNPOU1SSHF2czRaTTFzSkkrWFJOWGRJWVJEWDRjVHJXNmJaZTFpRm9G?=
 =?utf-8?B?WGVFZE9IUW11QjJUWGRSMnpTWklSYVBERzRmV0U0ZC8yMXk0WWlFNG5sM2Mr?=
 =?utf-8?B?bExHRThtaGN5U3puZDgvQVg1S2Nsa2o5QitncG83ZVAvQ3VSdTZtSWlaYnFv?=
 =?utf-8?B?c2Fyc0RaL21VZ1RmbEpRV052ZlR1SjBDSW51R0pHRk9nSk1BK2NVUVcxZThJ?=
 =?utf-8?B?RHRNWmllZEZmajhDaFc2UlNSL0tSV1kzU04yWHlXYUVHdW5BYVBmakc3MzAx?=
 =?utf-8?B?ck9GL2l0VjkrYWhvWjNiNVc4bnFBTlVHRjk1QjZnUlJvQVBaVHVnaDdPTkJU?=
 =?utf-8?B?blA1MTcwSjFhTzlOZTgwRlhVOTdMYmsxeDhEUlZxdUFiU3VoUnlaaStWeDF5?=
 =?utf-8?B?M1lnU2JJMmZ4Qyt2MlFQSnpXZ0dLRnVpSnc1NUQ2Zk1lV2I5VU5Qc00yTmhs?=
 =?utf-8?B?T25MM0lmaUxMcHdYNFJpNHFuVFBzL0xUc29rcmlzbDNjc0MwYnpBTmFSUk5G?=
 =?utf-8?B?RytQQktGMFREUS9aR1JXS1VwTWxmZmJYTW4rU0FvQ09lSnZGajl6a0Vyb0lT?=
 =?utf-8?B?a1dkVWlvWmtaYzhHNTBXbDVHTzFqcUZ3OHBrbGdqdmsydEtXS2VqbDZyMlYx?=
 =?utf-8?B?OThPNGQzRWRZQWtqV2dpOEZteGphSUZ2VkRIRDVKRHAyL0Fmak80YXpNMUhy?=
 =?utf-8?B?NnZieTBNSnE2ZE9UTUFlWlUvTEJIQmdaWEZhaTgwQjUvb0tqYSsvajVWcDVh?=
 =?utf-8?B?Ulp4MkkyTSsvUGsrRlF3dHY0d0VpNjZpLzFORFY1ZzZLSGVsc0JDdVE2NGRV?=
 =?utf-8?B?U0xUT2pMZDFXTVk0MVAyQTJ2cERDL1k3UmVybWVoaUxjVjNjT0Vhekh4QmF1?=
 =?utf-8?B?NVBQVGVVY3hUVHhOS1QrNUJUb2ZxdkdFaHBRU1dNMktmMmVOUmV2ZG1VUy9X?=
 =?utf-8?B?WVppUmNQYm1nbnNpdGt6QlhVQkFqMGRvaXozeG9qTmhqUVk4emFaWWJJaWJC?=
 =?utf-8?B?dTJIbm1BNS9GOVRZdFBSbWtlbExLalFyU21ZUGkwVjJDakI4bzBwdTFhVGh1?=
 =?utf-8?B?ajhEbENBQVdxRktCcEpBVDkzMzFNd3N2MHdaSHRXODBTd0hkRHozdStrcXZJ?=
 =?utf-8?B?aEh3L3Z5TDl1Z0ZyUUd3V1dSOENUcExlNlBPM2k0eGJ3YXNTeHBmcG1xcjFI?=
 =?utf-8?Q?Lyzue7vQRO8MRYwI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <11303A5E58A1CA41800B019DF849D12B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12fc03b6-a694-4609-57fe-08da539ffb89
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 16:06:21.1021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PFfFd4IIEyrIwGs3DmUy3+VU4Y7wp6+mFZTg1yZK5S8A3P/qtg8XfggzrpdEJNonz/qTEcM+0l5s5svLfK/P3wkKmxkBIbegpARnJ9KtB/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4242
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
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, masahiroy@kernel.org, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, tglx@linutronix.de,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, jee.heng.sia@intel.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 palmer@dabbelt.com, dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjEvMDYvMjAyMiAwMDoxNywgRGFtaWVuIExlIE1vYWwgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gNi8yMS8yMiAwNzo0OSwgQ29ub3IgRG9v
bGV5IHdyb3RlOg0KPj4NCi0tLTg8LS0tDQo+Pj4+DQo+Pj4+IGhtbSwgd2VsbCBJJ2xsIGxlYXZl
IHRoYXQgdXAgdG8gcGVvcGxlIHRoYXQgaGF2ZSBDYW5hYW4gaGFyZHdhcmUhDQo+Pj4NCj4+PiBJ
IHdpbGwgdGVzdCB0aGlzIHNlcmllcy4NCj4+Pg0KPj4NCj4+IENvb2wsIHRoYW5rcy4NCj4+IEkn
bGwgdHJ5IHRvIGdldCBhIHJlc3BpbiBvdXQgdG9tb3Jyb3cgdy8gdGhlIG1lbW9yeSBub2RlICJ1
bmZpeGVkIi4NCj4gDQo+IE9LLiBJIHdpbGwgdGVzdCB0aGF0IHRoZW4gOikNCg0KU2luY2UgdGhl
IG1lbW9yeSBub2RlIGhpdCB0aGF0IGR0LXNjaGVtYSBzbmFnLCBJIGhhdmUgbm90IHNlbnQgYSB2
Mi4NCkdvaW5nIHRvIGJlIEFGSyBmb3IgYSBmZXcgZGF5cywgc28gSSBkcm9wcGVkIHRoZSBtZW1v
cnkgbm9kZSBjaGFuZ2UsDQpjaGFuZ2VkIHRoZSBzcGkgYmluZGluZyAmIHB1dCB0aGUgc2VyaWVz
IG9uOg0KZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Nvbm9yL2xpbnV4
LmdpdC8gY2FuYWFuDQoNCklmIHlvdSBnZXQgYSBjaGFuY2UgdG8gbG9vayBhdCBpdCBncmVhdCwg
aWYgbm90IEknbGwgc2VuZCBhIHYyIG9uY2UNCnRoZSBtZW1vcnkgbm9kZSBpcyBmaWd1cmVkIG91
dC4NCg0KVGhhbmtzLA0KQ29ub3IuDQoNCg==
