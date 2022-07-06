Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AF85687A2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 14:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59F511A4B2;
	Wed,  6 Jul 2022 12:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E06C11A4C2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 12:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657108897; x=1688644897;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HXkN/7XoUCAroVk2bf6Zbwst2cmW+uwWQr5FlSchxh8=;
 b=gF1PVRTQJwkHOX/Z2Q+x94e5lkNE4Gq4zXH3VLf7dnmxQCBli95B8rqF
 BKN4tJJnbTnwN5cIyjpINrrNlTanojHZT5MO0CXNM1ty3vnWj4tCb0ln8
 ffq265tauZhA0oPDZZpSw/WDqsdivo2tf2HJUYnmNNN0y3OMgUAQOT8pf
 uqmZ0FTSXPY8M8xyTfULUzdBze6pczwqf4TULhYPsp2HjvSbheF/MemME
 i4ezIqpKb2uAQe/DolgBReUaNLmM9DWVaR3sjxiFHMnQMCJSoQj/FqWFm
 2cj9FRg4P6Qsk79am12M0aiCNXBDDxqaYzzD1JqYZf9qvX+B/R/MPIyPQ w==;
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="166605809"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Jul 2022 05:01:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Jul 2022 05:01:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 6 Jul 2022 05:01:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYm17Dxug4sB9hCGb2Ev/lHPbKI9IlnpYLo8kv3A0f7yycU1/ZwYxNX4TKys+PnUoYQjAT379pq4F4GTZ1cda6jprSH+VrXZN51aUyyt40/bdvYhisVDJHrvs4Yu43YtgrdagCzFGLLTN6hDLHAjETV4hBt1Q2LRdTAILy5mcXFFXFfCUBRLLZqQ2aTcuQhSre9C/HSTfyZYd4FLpbbwoAh4Exic6Y1FS4ar5nQ1vEk1WH3yV68vK1gLrW2zRrTixD2HbtC2dFRyDjVoLCFJ1Ph1ZZWv23IaUV8cd2iEqrjE1sIVsqnz4DggjSwNy9vKsRtVEb1kTos3NoUZodKmAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXkN/7XoUCAroVk2bf6Zbwst2cmW+uwWQr5FlSchxh8=;
 b=BYgSL3zBQqulrWM+Q5wiIQrGJxE/cW9BaoWzsCRwfn79cwHtzu4z8in+NJnA0CxFASIxDb1VHaKB0HOE2+xQtwZdRA5g9xlmO22rxnQ0fgeV8Srj1ZOpaiEa+c5txjXCPGwtURkLLnng+0qesnaUu5hkZXB5IST229kwXNHIEbqZfqVODgQbd37yMJBkOxV9DQLLBNWBMZIWqcLkBs56x9fXTfBraHWBgikMxr8Y5lJ5AqFSxGVTqjfi6GUCpmxnZjdykipYnj0cKvuKgEyXxONYHE8a902pXPrA5daYrHV8nhYo8WLz32z7xMO/VFEnordI+E4c0q32xyOtTnjjsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXkN/7XoUCAroVk2bf6Zbwst2cmW+uwWQr5FlSchxh8=;
 b=ca3hVDFSkR2WybcSo0jvDvLitlOedBgUzajNKhCcysf256tmWSuX40w+pe71fV255wfmOW4o+8WXvxjWL8+FIsy0yxNZkJkxW0gSmsaSkdqJmBjUNw0VhRWP7ZZsIi/2ILNuZbl89Sox7KTEJVEtRUQxeHzvSXJpHuXFlhwKh6w=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by BYAPR11MB2600.namprd11.prod.outlook.com (2603:10b6:a02:c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 12:01:29 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69%8]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 12:01:28 +0000
From: <Conor.Dooley@microchip.com>
To: <damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>
Subject: Re: [PATCH v5 00/13] Canaan devicetree fixes
Thread-Topic: [PATCH v5 00/13] Canaan devicetree fixes
Thread-Index: AQHYkLmL7CYc+NRsR0eTQHc1KpCiaq1w/ESAgABAyICAAAHEAA==
Date: Wed, 6 Jul 2022 12:01:28 +0000
Message-ID: <7da1bf67-3f19-ba04-d3fc-75e6a2c0da0b@microchip.com>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <CAMuHMdVOK+iHeTfRLDeMF1mwZoeH1KH_GHuCY72YnhQibGqhwA@mail.gmail.com>
 <160267df-2f3f-02f7-4a4d-21baf60c4a44@opensource.wdc.com>
In-Reply-To: <160267df-2f3f-02f7-4a4d-21baf60c4a44@opensource.wdc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ab115f7-a06e-49aa-f418-08da5f47427e
x-ms-traffictypediagnostic: BYAPR11MB2600:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C7e+JhPDugTB4x2mtVAyDPs+fKbJshjQ7WhN6K3ychpBtMrRv1geLXegvqCxftvpKOj8rHarqs9lrrdRRzjtm3KXQ0M3bUBk2bEEH2B5r/xlIqhqOJ2Wxnp4pOJr0WVz2N8iDfY/kyynvSC/a91FRD5gJPdYvnfGU+i/KjDr1vKrSoeN5kLYVsDX1c+lNOUt0VK+X5Cw8//vpP/F1Z9i0hnv5puLnZbfGa94kM82dDzsfD7AaA0NHsSUmz2QzMZN8r471VABAz5orkY4q20Gi2mOnhJvyqxXSy23v9cN7Vm2uWMg7pksMW0cW9lWoZg22EpLSOvkc0PwS3KbCKZQkloiByarm+Ak06Ood+7Z/O9lxjk0NLJV6BACFaE/MEIhdmfkgECXq+Tw2rWnV4sKeK/CbU+CbWv79xCy5lh/MgxXefsbxZAGpBZ66Mu0q5AhabO/MILSzPGS+jEZ4JuIhdTy0OOFplkvnWeRBH8ICeEOfH6fJ9BSID+0ZHcJwIl1K8NXh4sH3wOlSJVgeKG4zDBQZNihm43vBnBI1l8yIorY6cngFom7X1e0qfUOo/xm0sqlqXRWx52OLYyonCI4PkiyKT1e91Kujkip0mFf7P2KRJlfAoG+uBH+a1M8NBCSF48h+JIBM7OhsvPX9XBzOdQS1sOaCdiJpYRKpTFIH9YR2fwEFenWAjgtQX82PMTInToULmTQikpVhIaen+QiHa0sURTDBUFHHSKahVpi2be6uimfCeavr1uQ6Db3Bj6TMlvfgyGxFXmbE82XVasCemrzK5hC0YfhWKQ4M3MF4yD0u0qSC+NGz/+HjP+XCdixnU6Zcv5eVFwzkJh/QThMYdLE6FGfTUL99PaaBzHFvqLPeYDMdMFNLV/EV2S5Nir6M/K4rwBzaKx49VPfZbLb16+dB1n1HgvUZkROdVZKvkePyxU5irYyMQGLdW7jNSXt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5160.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(346002)(39860400002)(376002)(366004)(66476007)(4326008)(8676002)(66556008)(2616005)(66446008)(64756008)(66946007)(31686004)(91956017)(186003)(38100700002)(6506007)(83380400001)(2906002)(36756003)(76116006)(7416002)(26005)(6512007)(6486002)(966005)(54906003)(110136005)(478600001)(41300700001)(5660300002)(31696002)(38070700005)(86362001)(71200400001)(53546011)(316002)(122000001)(8936002)(90184004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlhwRm1EVlc4UlljZkxhdTdhL0JTSHkrMG1zMyswM1VFNnN0d0NDd1hIeFBa?=
 =?utf-8?B?NXJzNnJieENWYXozL2FDUDBtY1JZQytGbUVBMzN2K3dVMlNJVU9Vb05BVUpG?=
 =?utf-8?B?c3pHWWI4QjM4eXl5ODIwSUhqWnRtdXlXa2IxeVEwQ1ZHQ0pvSlZNM2lMT3kw?=
 =?utf-8?B?anlyMXdxczc1WTZGMHdjbjJKY1F5dDFlYTY2VDZsalp2eHBPM1hBaFlwakJa?=
 =?utf-8?B?QTlJaDhuWXhQWG5OTnJiSC93aGR3Zm9kbUhVSGRRcjhlcXFPQ05OcU1NK3Bw?=
 =?utf-8?B?cEl4RDhGV1daRVoyK1FWbmVFL0MrQnpPeVA0VEpTTUxsS3AyS3Q2RmpvNC9h?=
 =?utf-8?B?T1JoR3ZLQzdSUnM3aXdUVGFRcEZnakEyMFFkeTh1OXgrVnhzYnRZcjFwbTZz?=
 =?utf-8?B?SXN2b1RSY1VFblhDdG1ibmhmeitxbzNzMWVidmlxdlp4NStmS1JyNmpENEJI?=
 =?utf-8?B?VVVwNUE0NHkycmR2ZUtVVHB1M3BzNnFwakdzR2htSUdMOUlBMExhZmt1cENC?=
 =?utf-8?B?eW1jK3lHeUdnTzIzMHAwME9IMU5LRmJLMzBHMXZsN3dpcnJIamZZQUxDc0F3?=
 =?utf-8?B?VkNLMFhKWGNNa0NPUTMwc2lGUjJROENCMk1QdlM2SVQwNTZndFNsTWFEcWVZ?=
 =?utf-8?B?bVdBRHlySUc1dU5JQW5ncjVTWjlRbzRRaEQ5RDRQbGtpdE1senFHT3daYnF5?=
 =?utf-8?B?ems2WCtBdjVyR0ZvUjZmMlQycUdHNFlNOTBZZWlpVkN0UWJCVGU5VmZXdGx0?=
 =?utf-8?B?WnJsTDdPRXhtNFkwc21sT1pRNG9DZ3FGL29VN0NrcTdrTFl1cXdnczZUbm52?=
 =?utf-8?B?d0pLTDRJbGd0MTliQzNxWjVzakRQNGNpaEZ5c1BtYVMwUGdzZXlCdXEwUkRz?=
 =?utf-8?B?U3BCOWtkYnVvOU5BbVd0bk44eXZOTzlMelFhYWlGZ3BVYWtHSXZzdFpWeFdv?=
 =?utf-8?B?MWEySmU3WWxJd1JJdUVzTkpSYkg1cU9zY2U5R0tFRERYNmlDb3hWbDVZVUZV?=
 =?utf-8?B?NlRSUHdtZkRUdjcwSU1zdm4zR2xLRWZwWGFZby80ZnRuSWR6OFd3U0Vpbmxs?=
 =?utf-8?B?SGM4eUk0VXFscGF2UHE3dmcvL2Ivb1p6ZXM3WnVSa0FvdzdHSmg1MTZsN2ZH?=
 =?utf-8?B?c0hSdk9iL0tXMXN1ODM2ZndjWDhYbXRIeVNRSmd2eExRZVh3NEU4TUJBeG9p?=
 =?utf-8?B?YnZKU3Z2dG1pdFpmNlVBUWtQOUVqTVVNVmUxWDN5bUxOeEhwNk90clYwMEZO?=
 =?utf-8?B?Q0FJdGQ4THZxQnE5YlZYbUdlT2Uwdmc2NUtjYUN3SWpxdTgvOEs3ZGUzWFdw?=
 =?utf-8?B?MzFhbjJxbGZDY094dDNvb2lRamd1d2dmRGtSakdzbjcrVzBUUy9VeHdXZkJH?=
 =?utf-8?B?K3hPLzVoMHJsclFFYlkzV29Gd1JNMjdvbUgwbGJGdFFWMFlBaHFhYXVBaXhO?=
 =?utf-8?B?NXVOSUFGOHF5ZkRmeC9SeXJ5STgzSEpZOFNrZXNWT2phUXVSb2lpMVBIa1Rx?=
 =?utf-8?B?OGRrQ0Q3S0JoY1dsbUtFVlp2ekpveTBRVkM3QVZNOFprSVY4ditXMnRiYi9M?=
 =?utf-8?B?dVpKLzZ0QUYwS1hHMzZUZi83dkJkbHIreEdCYm1rNjRxb2NXZDZGYTZXY3RH?=
 =?utf-8?B?OWRtTEVGQzNtVmdYaWQxbjdvNzk1QTVnK2pWUVFIOVprcy91TnVrMEdhQ2dm?=
 =?utf-8?B?VTdxcURLV3BReVBUTHF5Z0JGblZaY1NVaHRveDhjOG5NblB2UHBwTXZseGw2?=
 =?utf-8?B?c0kwWGRmQUJ6Y210MlF4VnJUSy92Q0dVMmYweU0rUGp4V3d4Uy9TTlR1Vks4?=
 =?utf-8?B?K3h4V1NJaHg2dGxYL0hqazhTY3dKTTNNMDlqQnZtUFdrZnVGWkVPMDdZZkR5?=
 =?utf-8?B?aWdHYVlRbUdxYnB2cWtBazNUTEdxSm5nbENMNHA2dUY0MXJESHZOY25xUUs0?=
 =?utf-8?B?RS9xeUJXTmpVbDByUThGUEFJcW1RS3ptbXpVY1c5d2w1dFJQTEg2bnU5WXR6?=
 =?utf-8?B?ZGY1bEFFWUtiQlQxZDM2ZkYxUkR2cXYreURVd3REdHZxdzZ0RTdZZXpLVUJs?=
 =?utf-8?B?M2pQb3NtOGhKV2ZlWVk4dWJPUkxkeThFODhTa1JoQU1nTDVxeXVodklwUmoy?=
 =?utf-8?Q?CGnSnNYXPp1FUCU2nSVpWGk7z?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E721053C4D78AD48A90C8615FB6C0799@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab115f7-a06e-49aa-f418-08da5f47427e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 12:01:28.8803 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dD71QgE4m/mdnvDVHd2Bvgs4t5I0BpUmb6Q6D2Famj9IejgCK9IuyJF2alV/12yENIMoGwu9f0nZh/vej+RpFT3rLMEI/u/uyyvFoq2tVRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2600
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
Cc: niklas.cassel@wdc.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Conor.Dooley@microchip.com, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, masahiroy@kernel.org, daniel.lezcano@linaro.org,
 Eugeniy.Paltsev@synopsys.com, devicetree@vger.kernel.org,
 aou@eecs.berkeley.edu, robh+dt@kernel.org, palmer@rivosinc.com,
 paul.walmsley@sifive.com, dillon.minfei@gmail.com,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, vkoul@kernel.org,
 palmer@dabbelt.com, dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDYvMDcvMjAyMiAxMjo1NSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6DQo+IE9uIDcvNi8yMiAx
NzowMywgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPj4gSGkgQ29ub3IsDQo+Pg0KPj4gT24g
VHVlLCBKdWwgNSwgMjAyMiBhdCAxMTo1MiBQTSBDb25vciBEb29sZXkgPG1haWxAY29uY2h1b2Qu
aWU+IHdyb3RlOg0KPj4+IEkgKkRPIE5PVCogaGF2ZSBhbnkgQ2FuYWFuIGhhcmR3YXJlIHNvIEkg
aGF2ZSBub3QgdGVzdGVkIGFueSBvZiB0aGlzIGluDQo+Pj4gYWN0aW9uLiBTaW5jZSBJIHNlbnQg
djEsIEkgdHJpZWQgdG8gYnV5IHNvbWUgc2luY2UgaXQncyBjaGVhcCAtIGJ1dCBjb3VsZA0KPj4+
IG91dCBvZiB0aGUgbGltaXRlZCBzdG9ja2lzdHMgbm9uZSBzZWVtZWQgdG8gd2FudCB0byBkZWxp
dmVyIHRvIElyZWxhbmQgOigNCj4+PiBJIGJhc2VkIHRoZSBzZXJpZXMgb24gbmV4dC0yMDIyMDYx
Ny4NCj4+DQo+PiBEaWdpLUtleSBkb2VzIG5vdCB3YW50IHRvIHNoaXAgdG8gSVJMPw0KPj4gVGhl
IHBsYWluIE1BaVggQmlUIGlzIG91dC1vZi1zdG9jaywgYnV0IHRoZSBraXQgaW5jbC4gYSBkaXNw
bGF5IGlzDQo+PiBhdmFpbGFibGUgKDk3IGluIHN0b2NrKS4NCj4gDQo+IFNlZWRzdHVkaW8gaXMg
b3V0IG9mIHN0b2NrIG9uIHRoZSBNQUlYIGJpdCwgYnV0IHRoZXkgaGF2ZSBtYWl4ZHVpbm8sIHdo
aWNoDQo+IGlzIHRoZSBzYW1lLCBhbG1vc3QgKHBpbiB3aXJpbmcgZGlmZmVycywgZXZlcnl0aGlu
ZyBlbHNlIGlzIHRoZSBzYW1lKS4NCg0KSSBwaWNrZWQgb25lIHVwIGZyb20gRGlnaUtleSB0aGlz
IG1vcm5pbmcuIFdvdWxkYSBiZWVuIG5pY2UgaWYgdGhleQ0KdXNlZCBzb21lIG9mIHRoZSBrMjEw
IHJlbGF0ZWQgd29yZHMgaW4gdGhlIGRlc2NyaXB0aW9ucyBmb3IgdGhlIHNha2UNCm9mIHRoZWly
IHNlYXJjaCBlbmdpbmUhDQoNCj4gaHR0cHM6Ly93d3cuc2VlZWRzdHVkaW8uY29tL1NpcGVlZC1N
YWl4ZHVpbm8tS2l0LWZvci1SSVNDLVYtQUktSW9ULXAtNDA0Ny5odG1sDQoNClRoaXMgd2FzIGFj
dHVhbGx5IG91dCBvZiBzdG9jayB3aGVuIEkgbG9va2VkLg0KICANCj4gQW5kIHlvdSBjYW4gc3Rp
bGwgZmluZCBwbGVudHkgb2YgTUFJWCBiaXQgb24gQWxpZXhwcmVzcyB0b28uDQoNCkkgZHVubm8g
aG93IGl0IGlzIGZvciB5b3UsIGJ1dCBJIGZpbmQgdGhhdCBzb21ldGltZXMgb24gQWxpIHRoZXkN
CmRpc2xpa2UgbXkgYWRkcmVzcyBhbmQgdGhhdCB3YXMgdGhlIGNhc2UgZm9yIHRoZSBib2FyZHMg
SSBjaGVja2VkDQpvbiBBbGkuDQoNCkVpdGhlciB3YXksIGl0J3MgQWxpIGFuZCBhIG1lcmdlIHdp
bmRvdyB3b3VsZCBjb21lIGFuZCBnbyBiZWZvcmUNCkknZCBnZXQgaXQhDQoNCg==
